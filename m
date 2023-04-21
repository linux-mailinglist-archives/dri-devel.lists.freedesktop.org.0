Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E43396EAAFA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 14:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8FB10E03E;
	Fri, 21 Apr 2023 12:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B8410E03E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 12:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZhwTjyj5hQkSbTsoMgY8V+XNr9f02/2tGl+EB0azt5Q=; b=lAadbHMXq/SapaAjNfej9WxODz
 skCxRHGcPhsjajQQbUtnsWx0Q3kwlgVYdWH2NrI559d4YgJZ1TSSmqKJSUip0oy6mSE/4tIukWhib
 KRNsiKwlpeX3uD+dGLIHfokxU008i62rsVuqy9t9PSWidsX3mU4nwBqW9rU64jV6M4djv8MpLbSCf
 fBVGd3sLt1AA2Q1ATNGENeKVXWZz/7QoiaUrh//wvYU8W+izUbS+YGgpFduu54RQbBeohZFbx1jDL
 8LQCb6YrYSGJkss3VdZ81xvMydI9Yc+zFUpCx/hDYFKMbgbokAKQKUnyghh8lH0B0lfFlzlmmk0Eh
 JRluasEg==;
Received: from [177.34.168.16] (helo=[192.168.0.4])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ppqGr-007y5m-74; Fri, 21 Apr 2023 14:53:50 +0200
Message-ID: <a6c177ec-de42-86c0-410f-b6667317e611@igalia.com>
Date: Fri, 21 Apr 2023 09:53:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/3] vkms: Add support for multiple pipes
To: Marius Vlad <marius.vlad@collabora.com>
References: <20230420084147.19042-1-marius.vlad@collabora.com>
 <20230420084147.19042-3-marius.vlad@collabora.com>
 <8cd5ff71-7a90-f54a-01cb-9b760b97db33@igalia.com>
 <ZEI1t981LcfvDleI@xpredator>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <ZEI1t981LcfvDleI@xpredator>
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
Cc: melissa.srw@gmail.com, rodrigosiqueiramelo@gmail.com,
 dri-devel@lists.freedesktop.org, mwen@igalia.com, tzimmermann@suse.de,
 igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/21/23 04:05, Marius Vlad wrote:
> Hi Maíra,
> 
> Thanks a lot for taking a look!
> 
> On Thu, Apr 20, 2023 at 01:47:59PM -0300, Maíra Canal wrote:
>> Hi Marius,
>>
>> Thanks for the changing the commit message! Just a few nits:
>>
>> On 4/20/23 05:41, Marius Vlad wrote:
>>> This adds support for creating multiple virtual pipes, in case one would
>>> need to display multiple independent things on different outputs.
>>>
>>> We use a module parameter to specify how many to create,  defaulting to
>>> just one with the possibility of specifying a maximum of 4 possible pipes.
>>>
>>> This is of particular importance when testing out the DRM back-end in
>>> compositors, but also to be able to independently set different DPMS states.
>>
>> When I run the VKMS CI, I'm getting the following warning in most tests
>> with max_pipes=3:
>>
>> (kms_atomic:2085) igt_kms-WARNING: Output Virtual-2 could not be assigned to a pipe
>> (kms_atomic:2085) igt_kms-WARNING: Output Virtual-3 could not be assigned to a pipe
> Hmm, first time I'm seeing these. By VKMS CI you mean piglit with some a
> list of igt tests? Noticed some warnings about the Writeback connector but
> those warnings are with or without these patches.

I'm sorry about this one. I believe it was a misconfigure. Please ignore
it. About the other warnings, I still can reproduce them.

About the VKMS CI, I mean:

./scripts/run-tests.sh -T tests/vkms_ci/vkms.testlist

Best Regards,
- Maíra Canal

>>
>>>
>>> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
>>> ---
>>>    drivers/gpu/drm/vkms/vkms_crtc.c      |  3 +--
>>>    drivers/gpu/drm/vkms/vkms_drv.c       | 27 ++++++++++++++++++++++-----
>>>    drivers/gpu/drm/vkms/vkms_drv.h       | 11 ++++++++---
>>>    drivers/gpu/drm/vkms/vkms_output.c    |  5 ++---
>>>    drivers/gpu/drm/vkms/vkms_writeback.c | 24 ++++++++++++------------
>>>    5 files changed, 45 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
>>> index 57bbd32e9beb..0b6c40ac80b6 100644
>>> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
>>> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
>>> @@ -89,8 +89,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
>>>    {
>>>    	struct drm_device *dev = crtc->dev;
>>>    	unsigned int pipe = crtc->index;
>>> -	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
>>> -	struct vkms_output *output = &vkmsdev->output;
>>> +	struct vkms_output *output = drm_crtc_to_vkms_output(crtc);
>>>    	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
>>>    	if (!READ_ONCE(vblank->enabled)) {
>>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
>>> index 6d3a2d57d992..63091ce6735a 100644
>>> --- a/drivers/gpu/drm/vkms/vkms_drv.c
>>> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
>>> @@ -51,14 +51,19 @@ static bool enable_overlay;
>>>    module_param_named(enable_overlay, enable_overlay, bool, 0444);
>>>    MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
>>> +static int max_pipes = 1;
>>
>> I believe this should be unsigned int, otherwise if you configure
>> max_pipes=-3, you will get an error like:
> Yeah, probably need to add a also a minimum lower range range. Even if with an
> uint8_t, it would wrap to unnecessary large values. I'd just ignore
> everything under 1.
>>
>> [   31.015005] ------------[ cut here ]------------
>> [   31.015011] WARNING: CPU: 0 PID: 1062 at mm/page_alloc.c:5568 __alloc_pages+0x65/0x300
>> [   31.015021] Modules linked in: vkms(+) [last unloaded: vkms]
>> [   31.015030] CPU: 0 PID: 1062 Comm: modprobe Not tainted 6.3.0-rc4-01502-g91c249b2b9f6-dirty #92
>> [   31.015035] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-1.fc37 04/01/2014
>> [   31.015038] RIP: 0010:__alloc_pages+0x65/0x300
>> [   31.015043] Code: 00 f7 c7 00 20 00 00 75 0e 83 fe 0b 72 09 f6 05 16 02 c3 01 01 74 0c 83 fe 0a 76 15 31 ed e9 51 01 00 00 c6 05 01 02 c3 01 01 <0f> 0b 83 fe 0a 77 eb 23 1d f6 05 c5 01 65 48 8b 3d 26 77 fd 71 8b
>> [   31.015047] RSP: 0018:ffffa95442247880 EFLAGS: 00010246
>> [   31.015052] RAX: 0bb151d28a828b00 RBX: 0000000000040dc0 RCX: 0000000000000000
>> [   31.015055] RDX: 0000000000000000 RSI: 000000000000001d RDI: 0000000000040dc0
>> [   31.015059] RBP: 0000000000000000 R08: ffffffff8f6cbeac R09: 0000000000000010
>> [   31.015061] R10: ffff9cb282c6a500 R11: 0000000400000001 R12: 0000000000000dc0
>> [   31.015065] R13: ffffffffc01e3258 R14: 0000000000000000 R15: 000000000000001d
>> [   31.015067] FS:  00007f95f41b6740(0000) GS:ffff9cb2bbc00000(0000) knlGS:0000000000000000
>> [   31.015071] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   31.015075] CR2: 00007ffc3933cec8 CR3: 000000011c110000 CR4: 00000000000006f0
>> [   31.015082] Call Trace:
>> [   31.015102]  <TASK>
>> [   31.015106]  __kmalloc_large_node+0x82/0x120
>> [   31.015113]  ? drm_vblank_init+0x30/0x100
>> [   31.015120]  __kmalloc_node_track_caller+0xc4/0x180
>> [   31.015125]  ? __kmalloc_node_track_caller+0x8f/0x180
>> [   31.015128]  ? preempt_count_add+0x5e/0xa0
>> [   31.015134]  drmm_kmalloc+0x31/0x110
>> [   31.015140]  drm_vblank_init+0x30/0x100
>> [   31.015145]  init_module+0x179/0xff0 [vkms]
>> [   31.015160]  ? __pfx_init_module+0x10/0x10 [vkms]
>> [   31.015171]  do_one_initcall+0x10c/0x2d0
>> [   31.015180]  ? do_init_module+0x1d/0x1c0
>> [   31.015187]  do_init_module+0x45/0x1c0
>> [   31.015192]  load_module+0x16eb/0x1970
>> [   31.015198]  ? kernel_read_file_from_fd+0x5a/0x90
>> [   31.015205]  __se_sys_finit_module+0xb3/0xf0
>> [   31.015212]  do_syscall_64+0x43/0x90
>> [   31.015218]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
>> [   31.015224] RIP: 0033:0x7f95f42bf6bd
>> [   31.015228] Code: 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 43 d7 0c 00 f7 d8 64 89 01 48
>> [   31.015232] RSP: 002b:00007ffc3933ef08 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
>> [   31.015236] RAX: ffffffffffffffda RBX: 000055ec9b730a10 RCX: 00007f95f42bf6bd
>> [   31.015239] RDX: 0000000000000000 RSI: 000055ec9b730470 RDI: 0000000000000003
>> [   31.015241] RBP: 000055ec9b730470 R08: 0000000000000000 R09: 00007ffc3933f030
>> [   31.015243] R10: 0000000000000003 R11: 0000000000000246 R12: 0000000000040000
>> [   31.015245] R13: 000055ec9b730ab0 R14: 0000000000000000 R15: 000055ec9b730c70
>> [   31.015248]  </TASK>
>> [   31.015250] ---[ end trace 0000000000000000 ]---
>> [   31.015253] [drm:init_module [vkms]] *ERROR* Failed to vblank
>>
>> Also, when I setted max_pipes=4, I'm getting the following error:
> I'll try to replicate these with igt tests, as those seems to stress
> things a bit. Seems a bit odd to happen only at four.
>>
>> [   74.804396] ------------[ cut here ]------------
>> [   74.804402] WARNING: CPU: 2 PID: 1587 at drivers/gpu/drm/drm_plane.c:252 __drm_universal_plane_init+0x4fe/0x550
>> [   74.804415] Modules linked in: vkms(+)
>> [   74.804421] CPU: 2 PID: 1587 Comm: modprobe Tainted: G        W          6.3.0-rc4-01502-g91c249b2b9f6-dirty #92
>> [   74.804426] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-1.fc37 04/01/2014
>> [   74.804429] RIP: 0010:__drm_universal_plane_init+0x4fe/0x550
>> [   74.804434] Code: c4 20 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc 49 8b b6 90 05 00 00 48 8b 44 24 08 8b 10 48 8b 3c 24 e8 84 b8 ff ff eb d1 <0f> 0b 41 bc ea ff ff ff eb c7 0f 0b 41 bc ea ff ff ff eb bd 49 8b
>> [   74.804438] RSP: 0018:ffffb2cc8217f858 EFLAGS: 00010246
>> [   74.804453] RAX: 0000000000000000 RBX: ffffffffc0223318 RCX: ffffffffc0223318
>> [   74.804456] RDX: 0000000000000008 RSI: ffffa24080913028 RDI: ffffa24098d20000
>> [   74.804458] RBP: ffffb2cc8217f970 R08: ffffffffc0223300 R09: 0000000000000005
>> [   74.804461] R10: ffffb2cc8217f910 R11: 0000000000000000 R12: 0000000000000008
>> [   74.804463] R13: ffffa24080913028 R14: ffffa24080913028 R15: ffffa24098d20000
>> [   74.804465] FS:  00007fbd9fc9b740(0000) GS:ffffa240bbd00000(0000) knlGS:0000000000000000
>> [   74.804469] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   74.804471] CR2: 00007f74a59d1f30 CR3: 0000000103304000 CR4: 00000000000006e0
>> [   74.804479] Call Trace:
>> [   74.804483]  <TASK>
>> [   74.804485]  ? preempt_count_add+0x5e/0xa0
>> [   74.804492]  __drmm_universal_plane_alloc+0xce/0x140
>> [   74.804497]  ? __drm_connector_init+0x3d6/0x4c0
>> [   74.804502]  vkms_plane_init+0x4d/0x70 [vkms]
>> [   74.804516]  vkms_output_init+0xa7/0x380 [vkms]
>> [   74.804527]  init_module+0x25d/0xff0 [vkms]
>> [   74.804538]  ? __pfx_init_module+0x10/0x10 [vkms]
>> [   74.804548]  do_one_initcall+0x10c/0x2d0
>> [   74.804557]  ? do_init_module+0x1d/0x1c0
>> [   74.804564]  do_init_module+0x45/0x1c0
>> [   74.804569]  load_module+0x16eb/0x1970
>> [   74.804575]  ? kernel_read_file_from_fd+0x5a/0x90
>> [   74.804615]  __se_sys_finit_module+0xb3/0xf0
>> [   74.804624]  do_syscall_64+0x43/0x90
>> [   74.804632]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
>> [   74.804640] RIP: 0033:0x7fbd9fda46bd
>> [   74.804645] Code: 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 43 d7 0c 00 f7 d8 64 89 01 48
>> [   74.804649] RSP: 002b:00007ffd8cdc6d58 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
>> [   74.804655] RAX: ffffffffffffffda RBX: 00005614c1f3ea10 RCX: 00007fbd9fda46bd
>> [   74.804659] RDX: 0000000000000000 RSI: 00005614c1f3e470 RDI: 0000000000000003
>> [   74.804662] RBP: 00005614c1f3e470 R08: 0000000000000000 R09: 00007ffd8cdc6e80
>> [   74.804665] R10: 0000000000000003 R11: 0000000000000246 R12: 0000000000040000
>> [   74.804668] R13: 00005614c1f3eab0 R14: 0000000000000000 R15: 00005614c1f3ec70
>> [   74.804673]  </TASK>
>> [   74.804675] ---[ end trace 0000000000000000 ]---
>> [   74.804736] BUG: kernel NULL pointer dereference, address: 00000000000000a8
>> [   74.806126] #PF: supervisor read access in kernel mode
>> [   74.806590] #PF: error_code(0x0000) - not-present page
>> [   74.807160] PGD 0 P4D 0
>> [   74.807463] Oops: 0000 [#1] PREEMPT SMP PTI
>> [   74.807874] CPU: 2 PID: 1587 Comm: modprobe Tainted: G        W          6.3.0-rc4-01502-g91c249b2b9f6-dirty #92
>> [   74.808597] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-1.fc37 04/01/2014
>> [   74.809097] RIP: 0010:destroy_workqueue+0xf/0x2f0
>> [   74.809397] Code: 41 5e 41 5f 5d e9 b1 24 ff 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 55 41 57 41 56 41 54 53 48 83 ec 10 49 89 ff <48> 8b bf a8 00 00 00 48 85 ff 74 14 49 c7 87 a8 00 00 00 00 00 00
>> [   74.810308] RSP: 0018:ffffb2cc8217f928 EFLAGS: 00010286
>> [   74.810637] RAX: 0000000000000004 RBX: 0000000000000003 RCX: 0000000000000001
>> [   74.811041] RDX: 0000000000000002 RSI: 0000000000000082 RDI: 0000000000000000
>> [   74.811436] RBP: ffffa23f9df001c0 R08: 0000000000b90826 R09: 000003fffffffc00
>> [   74.811857] R10: 000000000000015d R11: 0000000000000000 R12: 0000000000000282
>> [   74.812256] R13: 0000000000000001 R14: ffffa24098d20000 R15: 0000000000000000
>> [   74.812673] FS:  00007fbd9fc9b740(0000) GS:ffffa240bbd00000(0000) knlGS:0000000000000000
>> [   74.813294] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   74.814296] CR2: 00000000000000a8 CR3: 0000000103304000 CR4: 00000000000006e0
>> [   74.814824] Call Trace:
>> [   74.815114]  <TASK>
>> [   74.815388]  ? _raw_spin_unlock_irq+0xe/0x30
>> [   74.815806]  vkms_release+0x26/0x50 [vkms]
>> [   74.816187]  devm_drm_dev_init_release+0x2d/0x60
>> [   74.816590]  devres_release_group+0xeb/0x140
>> [   74.817005]  init_module+0x196/0xff0 [vkms]
>> [   74.817394]  ? __pfx_init_module+0x10/0x10 [vkms]
>> [   74.817833]  do_one_initcall+0x10c/0x2d0
>> [   74.818208]  ? do_init_module+0x1d/0x1c0
>> [   74.818587]  do_init_module+0x45/0x1c0
>> [   74.818869]  load_module+0x16eb/0x1970
>> [   74.819147]  ? kernel_read_file_from_fd+0x5a/0x90
>> [   74.819458]  __se_sys_finit_module+0xb3/0xf0
>> [   74.819786]  do_syscall_64+0x43/0x90
>> [   74.820041]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
>> [   74.821852] RIP: 0033:0x7fbd9fda46bd
>> [   74.822118] Code: 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 43 d7 0c 00 f7 d8 64 89 01 48
>> [   74.822902] RSP: 002b:00007ffd8cdc6d58 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
>> [   74.823311] RAX: ffffffffffffffda RBX: 00005614c1f3ea10 RCX: 00007fbd9fda46bd
>> [   74.823648] RDX: 0000000000000000 RSI: 00005614c1f3e470 RDI: 0000000000000003
>> [   74.823977] RBP: 00005614c1f3e470 R08: 0000000000000000 R09: 00007ffd8cdc6e80
>> [   74.824297] R10: 0000000000000003 R11: 0000000000000246 R12: 0000000000040000
>> [   74.824612] R13: 00005614c1f3eab0 R14: 0000000000000000 R15: 00005614c1f3ec70
>> [   74.824931]  </TASK>
>> [   74.825080] Modules linked in: vkms(+)
>> [   74.825269] CR2: 00000000000000a8
>> [   74.825505] ---[ end trace 0000000000000000 ]---
>> [   74.825735] RIP: 0010:destroy_workqueue+0xf/0x2f0
>> [   74.825948] Code: 41 5e 41 5f 5d e9 b1 24 ff 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 55 41 57 41 56 41 54 53 48 83 ec 10 49 89 ff <48> 8b bf a8 00 00 00 48 85 ff 74 14 49 c7 87 a8 00 00 00 00 00 00
>> [   74.826609] RSP: 0018:ffffb2cc8217f928 EFLAGS: 00010286
>> [   74.826843] RAX: 0000000000000004 RBX: 0000000000000003 RCX: 0000000000000001
>> [   74.827114] RDX: 0000000000000002 RSI: 0000000000000082 RDI: 0000000000000000
>> [   74.827382] RBP: ffffa23f9df001c0 R08: 0000000000b90826 R09: 000003fffffffc00
>> [   74.827622] R10: 000000000000015d R11: 0000000000000000 R12: 0000000000000282
>> [   74.827818] R13: 0000000000000001 R14: ffffa24098d20000 R15: 0000000000000000
>> [   74.828008] FS:  00007fbd9fc9b740(0000) GS:ffffa240bbd00000(0000) knlGS:0000000000000000
>> [   74.828245] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   74.828415] CR2: 00000000000000a8 CR3: 0000000103304000 CR4: 00000000000006e0
>>
>>> +module_param_named(max_pipes, max_pipes, int, 0444);
>>> +MODULE_PARM_DESC(max_pipes, "Specify how many pipes to create");
>>> +
>>>    DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
>>>    static void vkms_release(struct drm_device *dev)
>>>    {
>>> -	struct vkms_device *vkms = drm_device_to_vkms_device(dev);
>>> +	int i;
>>> +	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
>>> -	if (vkms->output.composer_workq)
>>> -		destroy_workqueue(vkms->output.composer_workq);
>>> +	for (i = 0; i < vkmsdev->config->max_pipes; i++)
>>> +		destroy_workqueue(vkmsdev->output[i].composer_workq);
>>>    }
>>>    static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
>>> @@ -99,6 +104,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
>>>    	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
>>>    	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
>>>    	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
>>> +	seq_printf(m, "pipes=%d\n", vkmsdev->config->max_pipes);
>>>    	return 0;
>>>    }
>>> @@ -133,6 +139,7 @@ static const struct drm_mode_config_helper_funcs vkms_mode_config_helpers = {
>>>    static int vkms_modeset_init(struct vkms_device *vkmsdev)
>>>    {
>>>    	struct drm_device *dev = &vkmsdev->drm;
>>> +	int i, ret = 0;
>>>    	drm_mode_config_init(dev);
>>
>> I commited a patch a while ago that changed this bit. Therefore, your patch
>> isn't applicable in the drm-misc-next. It would be nice if you could rebase
>> the patches on top of the drm-misc-next.
> Okay, will do.
>>
>> Best Regards,
>> - Maíra Canal
