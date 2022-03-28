Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAF34E8DE4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 08:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7608410EDBB;
	Mon, 28 Mar 2022 06:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF50810ED8F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 06:15:16 +0000 (UTC)
Received: from [192.168.0.3] (ip5f5aef5a.dynamic.kabel-deutschland.de
 [95.90.239.90])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 1E9C261EA1923;
 Mon, 28 Mar 2022 08:15:15 +0200 (CEST)
Message-ID: <502adc88-740f-fd68-d870-4f5577e1254d@molgen.mpg.de>
Date: Mon, 28 Mar 2022 08:15:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] fbdev: defio: fix the pagelist corruption
Content-Language: en-US
To: Chuansheng Liu <chuansheng.liu@intel.com>
References: <20220317054602.28846-1-chuansheng.liu@intel.com>
 <c058f18b-3dae-9ceb-57b4-ed62fedef50a@molgen.mpg.de>
 <BL1PR11MB54455684D2A1B4F0A666F861971D9@BL1PR11MB5445.namprd11.prod.outlook.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <BL1PR11MB54455684D2A1B4F0A666F861971D9@BL1PR11MB5445.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 "deller@gmx.de" <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 jayalk@intworks.biz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Chuansheng,


Am 28.03.22 um 02:58 schrieb Liu, Chuansheng:

>> -----Original Message-----

>> Sent: Saturday, March 26, 2022 4:11 PM

>> Am 17.03.22 um 06:46 schrieb Chuansheng Liu:
>>> Easily hit the below list corruption:
>>> ==
>>> list_add corruption. prev->next should be next (ffffffffc0ceb090), but
>>> was ffffec604507edc8. (prev=ffffec604507edc8).
>>> WARNING: CPU: 65 PID: 3959 at lib/list_debug.c:26
>>> __list_add_valid+0x53/0x80
>>> CPU: 65 PID: 3959 Comm: fbdev Tainted: G     U
>>> RIP: 0010:__list_add_valid+0x53/0x80
>>> Call Trace:
>>>    <TASK>
>>>    fb_deferred_io_mkwrite+0xea/0x150
>>>    do_page_mkwrite+0x57/0xc0
>>>    do_wp_page+0x278/0x2f0
>>>    __handle_mm_fault+0xdc2/0x1590
>>>    handle_mm_fault+0xdd/0x2c0
>>>    do_user_addr_fault+0x1d3/0x650
>>>    exc_page_fault+0x77/0x180
>>>    ? asm_exc_page_fault+0x8/0x30
>>>    asm_exc_page_fault+0x1e/0x30
>>> RIP: 0033:0x7fd98fc8fad1
>>> ==
>>>
>>> Figure out the race happens when one process is adding &page->lru into
>>> the pagelist tail in fb_deferred_io_mkwrite(), another process is
>>> re-initializing the same &page->lru in fb_deferred_io_fault(), which is
>>> not protected by the lock.
>>>
>>> This fix is to init all the page lists one time during initialization,
>>> it not only fixes the list corruption, but also avoids INIT_LIST_HEAD()
>>> redundantly.
>>>
>>> Fixes: 105a940416fc ("fbdev/defio: Early-out if page is already enlisted")
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
>>> ---
>>>    drivers/video/fbdev/core/fb_defio.c | 9 ++++++++-
>>>    1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
>>> index 98b0f23bf5e2..eafb66ca4f28 100644
>>> --- a/drivers/video/fbdev/core/fb_defio.c
>>> +++ b/drivers/video/fbdev/core/fb_defio.c
>>> @@ -59,7 +59,6 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
>>>    		printk(KERN_ERR "no mapping available\n");
>>>
>>>    	BUG_ON(!page->mapping);
>>> -	INIT_LIST_HEAD(&page->lru);
>>>    	page->index = vmf->pgoff;
>>>
>>>    	vmf->page = page;
>>> @@ -220,6 +219,8 @@ static void fb_deferred_io_work(struct work_struct *work)
>>>    void fb_deferred_io_init(struct fb_info *info)
>>>    {
>>>    	struct fb_deferred_io *fbdefio = info->fbdefio;
>>> +	struct page *page;
>>> +	int i;
>>>
>>>    	BUG_ON(!fbdefio);
>>>    	mutex_init(&fbdefio->lock);
>>> @@ -227,6 +228,12 @@ void fb_deferred_io_init(struct fb_info *info)
>>>    	INIT_LIST_HEAD(&fbdefio->pagelist);
>>>    	if (fbdefio->delay == 0) /* set a default of 1 s */
>>>    		fbdefio->delay = HZ;
>>> +
>>> +	/* initialize all the page lists one time */
>>> +	for (i = 0; i < info->fix.smem_len; i += PAGE_SIZE) {
>>> +		page = fb_deferred_io_page(info, i);
>>> +		INIT_LIST_HEAD(&page->lru);
>>> +	}
>>>    }
>>>    EXPORT_SYMBOL_GPL(fb_deferred_io_init);
>>>
>> Applying your patch on top of current Linus’ master branch, tty0 is
>> unusable and looks frozen. Sometimes network card still works, sometimes
>> not.
> 
> I don't see how the patch would cause below BUG call stack, need some time to
> debug. Just few comments:
> 1. Will the system work well without this patch?

Yes, the framebuffer works well without the patch.

> 2. When you are sure the patch causes the regression you saw, please get free to submit
> one reverted patch, thanks : )

I think you for patch wasn’t submitted yet – at least not pulled by Linus.

>>       $ git log --oneline -nodecorate -2
>>       1b351a77ed33 (HEAD -> linus) fbdev: defio: fix the pagelist corruption
>>       52d543b5497c (origin/master, origin/HEAD) Merge tag 'for-linus-5.17-1' of https://github.com/cminyard/linux-ipmi
>>
>> ```
>> [    5.256996] raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
>> [    5.269582] page dumped because: VM_BUG_ON_PAGE(compound && compound_order(page) != order)
>> [    5.279507] ------------[ cut here ]------------
>> [    5.286406] kernel BUG at mm/page_alloc.c:1326!
>> [    5.291814] invalid opcode: 0000 [#1] PREEMPT SMP
>> [    5.296350] CPU: 0 PID: 167 Comm: systemd-udevd Not tainted 5.17.0-10753-g1b351a77ed33 #300
>> [    5.304670] Hardware name: ASUS F2A85-M_PRO/F2A85-M_PRO, BIOS 4.16-337-gb87986e67b 03/25/2022
>> [    5.313163] RIP: 0010:free_pcp_prepare+0x295/0x400
>> [    5.317930] Code: 00 01 00 75 0b 48 8b 45 08 45 31 ff a8 01 74 4b 48 8b 45 00 a9 00 00 01 00 75 22 48 c7 c6 68 30 11 96 48 89 ef e8 cb 29 fd ff <0f> 0b 48 89 ef 41 83 c6 01 e8 bd f5 ff ff e9 2e fe ff ff 0f 1f 44
>> [    5.336650] RSP: 0018:ffffa6634062f9c0 EFLAGS: 00010246
>> [    5.341849] RAX: 000000000000004e RBX: ffffe4be80000000 RCX: 0000000000000000
>> [    5.348957] RDX: 0000000000000000 RSI: ffffffff96136a37 RDI: 00000000ffffffff
>> [    5.356063] RBP: ffffe4be840c0000 R08: 0000000000000000 R09: 00000000ffffdfff
>> [    5.363170] R10: ffffa6634062f7f0 R11: ffffffff9652c4a8 R12: 0000000000000000
>> [    5.370277] R13: 0000000000000009 R14: ffff91fd02ebc640 R15: ffffe4be840c0000
>> [    5.377384] FS:  0000000000000000(0000) GS:ffff91fd7b400000(0063) knlGS:00000000f7eea800
>> [    5.385443] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
>> [    5.391164] CR2: 00000000f6f0e840 CR3: 0000000106b60000 CR4: 00000000000406f0
>> [    5.398272] Call Trace:
>> [    5.400697]  <TASK>
>> [    5.402778]  free_unref_page+0x1b/0xf0
>> [    5.406505]  __vunmap+0x216/0x2c0
>> [    5.409798]  drm_fbdev_cleanup+0x5f/0xb0
>> [    5.413698]  drm_fbdev_fb_destroy+0x15/0x30
>> [    5.417857]  unregister_framebuffer+0x2c/0x40
>> [    5.422191]  drm_client_dev_unregister+0x69/0xe0
>> [    5.422962] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.17
>> [    5.426784]  drm_dev_unregister+0x2e/0x80
>> [    5.439005]  drm_dev_unplug+0x21/0x40
>> [    5.442645]  simpledrm_remove+0x11/0x20
>> [    5.446458]  platform_remove+0x1f/0x40
>> [    5.450185]  __device_release_driver+0x17a/0x250
>> [    5.454779]  device_release_driver+0x24/0x30
>> [    5.459024]  bus_remove_device+0xd8/0x140
>> [    5.463012]  device_del+0x18b/0x3f0
>> [    5.466478]  ? idr_alloc_cyclic+0x50/0xb0
>> [    5.470466]  platform_device_del.part.0+0x13/0x70
>> [    5.475146]  platform_device_unregister+0x1c/0x30
>> [    5.479824]  drm_aperture_detach_drivers+0xa1/0xd0
>> [    5.484593]  drm_aperture_remove_conflicting_pci_framebuffers+0x3f/0x60
>> [    5.491179]  radeon_pci_probe+0x54/0xf0 [radeon]
>> [    5.495773]  local_pci_probe+0x45/0x80
>> [    5.499499]  ? pci_match_device+0xd7/0x130
>> [    5.503572]  pci_device_probe+0xc2/0x1e0
>> [    5.507474]  really_probe+0x1f5/0x3d0
>> [    5.511112]  __driver_probe_device+0xfe/0x180
>> [    5.515446]  driver_probe_device+0x1e/0x90
>> [    5.519518]  __driver_attach+0xc0/0x1c0
>> [    5.523332]  ? __device_attach_driver+0xe0/0xe0
>> [    5.527839]  ? __device_attach_driver+0xe0/0xe0
>> [    5.532346]  bus_for_each_dev+0x78/0xc0
>> [    5.536159]  bus_add_driver+0x149/0x1e0
>> [    5.539973]  driver_register+0x8f/0xe0
>> [    5.543699]  ? 0xffffffffc0741000
>> [    5.546992]  do_one_initcall+0x44/0x200
>> [    5.550806]  ? kmem_cache_alloc_trace+0x170/0x2c0
>> [    5.555487]  do_init_module+0x4c/0x240
>> [    5.559213]  __do_sys_finit_module+0xb4/0x120
>> [    5.563547]  __do_fast_syscall_32+0x6b/0xe0
>> [    5.567706]  do_fast_syscall_32+0x2f/0x70
>> [    5.571693]  entry_SYSCALL_compat_after_hwframe+0x45/0x4d
>> [    5.577067] RIP: 0023:0xf7efa549
>> [    5.580273] Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 cd 0f 05 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
>> [    5.582805] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
>> [    5.598992] RSP: 002b:00000000ff831c0c EFLAGS: 00200296 ORIG_RAX: 000000000000015e
>> [    5.598996] RAX: ffffffffffffffda RBX: 0000000000000011 RCX: 00000000f7ed9e09
>> [    5.598998] RDX: 0000000000000000 RSI: 0000000056a5c940 RDI: 0000000056a5c4c0
>> [    5.598999] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
>> [    5.635047] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
>> [    5.642154] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>> [    5.649264]  </TASK>
>> [    5.651427] Modules linked in: crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi radeon(+) r8169 xhci_pci(+) realtek snd_hda_intel drm_ttm_helper snd_intel_dspcfg k10temp snd_hda_codec ttm snd_hda_core xhci_hcd snd_pcm sg ohci_hcd ehci_pci(+) snd_timer drm_dp_helper snd ehci_hcd soundcore i2c_piix4 acpi_cpufreq coreboot_table fuse ipv6 autofs4
>> [    5.690975] r8169 0000:04:00.0 enp4s0: renamed from eth0
>> [    5.691589] ---[ end trace 0000000000000000 ]---
>> [    5.704791] RIP: 0010:free_pcp_prepare+0x295/0x400
>> [    5.709784] Code: 00 01 00 75 0b 48 8b 45 08 45 31 ff a8 01 74 4b 48 8b 45 00 a9 00 00 01 00 75 22 48 c7 c6 68 30 11 96 48 89 ef e8 cb 29 fd ff <0f> 0b 48 89 ef 41 83 c6 01 e8 bd f5 ff ff e9 2e fe ff ff 0f 1f 44
>> [    5.731535] RSP: 0018:ffffa6634062f9c0 EFLAGS: 00010246
>> [    5.752988] usb usb4: Product: xHCI Host Controller
>> [    5.758571] usb usb4: Manufacturer: Linux 5.17.0-10753-g1b351a77ed33 xhci-hcd
>> [    5.767096] usb usb4: SerialNumber: 0000:03:00.0
>> [    5.772213] hub 4-0:1.0: USB hub found
>> [    5.782383] hub 4-0:1.0: 2 ports detected
>> [    5.799251] RAX: 000000000000004e RBX: ffffe4be80000000 RCX: 0000000000000000
>> [    5.810470] RDX: 0000000000000000 RSI: ffffffff96136a37 RDI: 00000000ffffffff
>> [    5.817561] RBP: ffffe4be840c0000 R08: 0000000000000000 R09: 00000000ffffdfff
>> [    5.824680] R10: ffffa6634062f7f0 R11: ffffffff9652c4a8 R12: 0000000000000000
>> [    5.831739] R13: 0000000000000009 R14: ffff91fd02ebc640 R15: ffffe4be840c0000
>> [    5.839445] FS:  0000000000000000(0000) GS:ffff91fd7b500000(0063) knlGS:00000000f7eea800
>> [    5.847905] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
>> [    5.854025] CR2: 000000005664d26c CR3: 0000000106b60000 CR4: 00000000000406e0
>> ```

>> PS: For some reason, the lore.kernel.org lists most messages twice [1].
>>
>> PPS: I am actually wanted to analyze the new regression, and thought
>> your patch might help, but made it worse. ;-) (The log excerpt is from
>> Linux master.)
>>
>> ```
>> [    1.738965] BUG: Bad page state in process systemd-udevd  pfn:103003
>> [    1.738974] fbcon: Taking over console
>> [    1.740459] page:00000000c3b5c591 refcount:0 mapcount:0 mapping:0000000 000000000 index:0x3 pfn:0x103003
>> [    1.740466] head:000000009b49a8e9 order:9 compound_mapcount:0 compound_pincount:0
>> [    1.740468] flags: 0x2fffc000010000(head|node=0|zone=2|lastcpupid=0x3ff f)
>> [    1.740473] raw: 002fffc000000000 fffff139840c0001 fffff139840c00c8 000 0000000000000
>> [    1.740475] raw: 0000000000000000 0000000000000000 00000000ffffffff 000 0000000000000
>> [    1.740477] head: 002fffc000010000 0000000000000000 dead000000000122 00 00000000000000
>> [    1.740479] head: 0000000000000000 0000000000000000 00000000ffffffff 00 00000000000000
>> [    1.740480] page dumped because: corrupted mapping in tail page
>> ```
>>
>> I am going to do that in another thread.

This is [2].


Kind regards,

Paul


>> [1]: https://lore.kernel.org/all/20220317054602.28846-1-chuansheng.liu@intel.com/
[2]: 
https://lore.kernel.org/bpf/7edcd673-decf-7b4e-1f6e-f2e0e26f757a@molgen.mpg.de/
