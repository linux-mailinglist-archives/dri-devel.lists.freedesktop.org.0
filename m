Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3647E6B72
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 14:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DB410E0BE;
	Thu,  9 Nov 2023 13:47:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCD810E0BE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 13:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699537672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xZZz8NaqisowxZ8OAIv87/3FCpQ7tqQKXFzVF8NdZ7U=;
 b=BbmWQ6yxklyx5eW7MsPIhqZ3cqkQDhwDUMFas6afsPXz1Dz2klj1dCAjOKBGJp2oimo6/8
 zvhTDZVFMvT2jhq6TR91+yrkn7UDS/lA0yLGRdesXzEfOG8k1k0NctK0zBbicsNiKj79wW
 lYc7cwuUGGcOhFcsknv3K/LyrSs7MoQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-64mEcln1Mt-hSEPSnx2t9Q-1; Thu, 09 Nov 2023 08:47:51 -0500
X-MC-Unique: 64mEcln1Mt-hSEPSnx2t9Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4083717431eso6128275e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 05:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699537670; x=1700142470;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iR+G38rGa574449eO0p7GWYEUAQUJ/fmsuaF9jjopaQ=;
 b=D0h2+2wsU3JOqtEKi/EJnc/MELyjdw96wQgMQt0uDWB5q/lH0fJPpACqoIgi6Ge9uD
 fR1KEGGKI7DDQoDMt3b+gCKZAFx7MhgoxMtrxC8eWsQa/t8iifXXpPFTY3KsCQ3ohbYX
 zacux598wHRa+WKCirVLHZChSTUYvEzjdSMF7ZIyhIK+t5cqCgE2+QPA7s3kumLhO/Lr
 oFDNVqW+pkveOU+Q5vmiWlhxCdphK3qrNGYEqRirEO5Vjn7nkxYqt0Ow/PmzSG+cbSnu
 ZM4OePzBvtSN+2LycWT8ZfE1E/k5cjJJVnJMN1vtyxibWPSF0fIYRqO7VlYD0Rj+ufx+
 DTBQ==
X-Gm-Message-State: AOJu0YxwKR8nHkLxw4WVB3gbv8B9o8IM7beqRuQqwJNEDTQY+dtRalNq
 bnUNFIgdZez9WJGoOC7YvgBsz0/pUJ6t1QqwHNdzbmpEfD16mqp4kphQyC8s85S66uqelMGwMGm
 j/LphlpZ9+r8KSEwOrsktPP+0e4dV
X-Received: by 2002:a1c:7c03:0:b0:405:40ec:415d with SMTP id
 x3-20020a1c7c03000000b0040540ec415dmr4502184wmc.39.1699537669652; 
 Thu, 09 Nov 2023 05:47:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIuTpVGUZSGzO50UJ4LRgGf+WNG83qhDmUQweGIUMVDAJhxMmrUU0YuXKwh1k5odm6UYiyAg==
X-Received: by 2002:a1c:7c03:0:b0:405:40ec:415d with SMTP id
 x3-20020a1c7c03000000b0040540ec415dmr4502153wmc.39.1699537669116; 
 Thu, 09 Nov 2023 05:47:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a05600c4d9200b004068495910csm2110511wmp.23.2023.11.09.05.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 05:47:48 -0800 (PST)
Message-ID: <54c6752d-3ef2-4f98-b96f-2c8d2509e692@redhat.com>
Date: Thu, 9 Nov 2023 14:47:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG in drm_kms_helper_poll_enable() fixed by reverting "drm/ast:
 report connection status on Display Port."
To: Kim Phillips <kim.phillips@amd.com>
References: <ecb3570e-f7f4-47e7-8cef-13e592b6d396@amd.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ecb3570e-f7f4-47e7-8cef-13e592b6d396@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------vCleYulQg3ngWFcv0HP0mjDH"
Content-Language: en-US
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
Cc: jammy_huang@aspeedtech.com, "Giani, Dhaval" <Dhaval.Giani@amd.com>, "Grimm,
 Jon" <jon.grimm@amd.com>, dianders@chromium.org, Ainux <ainux.wang@gmail.com>,
 kuohsiang_chou@aspeedtech.com, Borislav Petkov <bp@alien8.de>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------vCleYulQg3ngWFcv0HP0mjDH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/11/2023 01:37, Kim Phillips wrote:
> Hi, current linux kernel commit 90450a06162e
> ("Merge tag 'rcu-fixes-v6.7' of 
> git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks")
> and the attached config cause the following BUG when booting on
> a reference AMD Zen4 development server:
> 
> [   59.995717] input: OpenBMC virtual_input as 
> /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.0/0003:1D6B:0104.0002/input/input4
> [   60.033135] ast 0000:c2:00.0: vgaarb: deactivate vga console
> [   60.066230] ast 0000:c2:00.0: [drm] Using default configuration
> [   60.070342] hid-generic 0003:1D6B:0104.0002: input,hidraw0: USB HID 
> v1.01 Keyboard [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input0
> [   60.072843] ast 0000:c2:00.0: [drm] AST 2600 detected
> [   60.072851] ast 0000:c2:00.0: [drm] Using ASPEED DisplayPort transmitter
> [   60.099891] ast 0000:c2:00.0: [drm] dram MCLK=396 Mhz type=1 
> bus_width=16
> [   60.115780] [drm] Initialized ast 0.1.0 20120228 for 0000:c2:00.0 on 
> minor 0
> [   60.135643] fbcon: astdrmfb (fb0) is primary device
> [   60.135649] fbcon: Deferring console take-over
> [   60.146162] ast 0000:c2:00.0: [drm] fb0: astdrmfb frame buffer device
> [   60.331802] input: OpenBMC virtual_input as 
> /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.0/0003:1D6B:0104.0002/input/input5
> [   60.405807] hid-generic 0003:1D6B:0104.0002: input,hidraw0: USB HID 
> v1.01 Keyboard [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input0
> [   60.423774] input: OpenBMC virtual_input as 
> /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.1/0003:1D6B:0104.0004/input/input6
> [   60.443170] hid-generic 0003:1D6B:0104.0004: input,hidraw1: USB HID 
> v1.01 Mouse [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input1
> [   60.460675] ast 0000:c2:00.0: vgaarb: deactivate vga console
> [   60.479996] ast 0000:c2:00.0: [drm] Using default configuration
> [   60.486603] ast 0000:c2:00.0: [drm] AST 2600 detected
> [   60.492249] ast 0000:c2:00.0: [drm] Using ASPEED DisplayPort transmitter
> [   60.499732] ast 0000:c2:00.0: [drm] dram MCLK=396 Mhz type=1 
> bus_width=16
> [   60.508955] BUG: unable to handle page fault for address: 
> ffff8881e98109f0
> [   60.516623] #PF: supervisor write access in kernel mode
> [   60.522449] #PF: error_code(0x0002) - not-present page
> [   60.528168] PGD 8dbc01067 P4D 8dbc01067 PUD 104c984067 PMD 104c837067 
> PTE 800ffffe167ef060
> [   60.537394] Oops: 0002 [#1] PREEMPT SMP DEBUG_PAGEALLOC NOPTI
> [   60.543805] CPU: 0 PID: 9 Comm: kworker/0:1 Tainted: G        
> W          6.6.0+ #3
> [   60.552251] Hardware name: AMD Corporation ONYX/ONYX, BIOS ROX100AB 
> 09/14/2023
> [   60.560309] Workqueue: events work_for_cpu_fn
> [   60.565173] RIP: 0010:enqueue_timer 
> (/home/amd/git/linux/./include/linux/list.h:1034 
> /home/amd/git/linux/kernel/time/timer.c:605)
> [ 60.570129] Code: 44 00 00 55 48 89 e5 41 55 49 89 cd 41 54 49 89 fc 53 
> 48 89 f3 89 d6 48 8d 84 f7 b0 00 00 00 48 8b 08 48 89 0b 48 85 c9 74 04 
> <48> 89 59 08 48 89 18 48 89 43 08 49 8d 44 24 68 48 0f ab 30 8b 4b
> All code
> ========
>     0:   44 00 00                add    %r8b,(%rax)
>     3:   55                      push   %rbp
>     4:   48 89 e5                mov    %rsp,%rbp
>     7:   41 55                   push   %r13
>     9:   49 89 cd                mov    %rcx,%r13
>     c:   41 54                   push   %r12
>     e:   49 89 fc                mov    %rdi,%r12
>    11:   53                      push   %rbx
>    12:   48 89 f3                mov    %rsi,%rbx
>    15:   89 d6                   mov    %edx,%esi
>    17:   48 8d 84 f7 b0 00 00    lea    0xb0(%rdi,%rsi,8),%rax
>    1e:   00
>    1f:   48 8b 08                mov    (%rax),%rcx
>    22:   48 89 0b                mov    %rcx,(%rbx)
>    25:   48 85 c9                test   %rcx,%rcx
>    28:   74 04                   je     0x2e
>    2a:*  48 89 59 08             mov    %rbx,0x8(%rcx)           <-- 
> trapping instruction
>    2e:   48 8
>    31:   48 89 43 08             mov    %rax,0x8(%rbx)
>    35:   49 8d 44 24 68          lea    0x68(%r12),%rax
>    3a:   48 0f ab 30             bts    %rsi,(%rax)
>    3e:   8b                      .byte 0x8b
>    3f:   4b                      rex.WXB
> 
> Code starting with the faulting instruction
> ===========================================
>     0:   48 89 59 08             mov    %rbx,0x8(%rcx)
>     4:   48 89 18                mov    %rbx,(%rax)
>     7:   48 89 43 08             mov    %rax,0x8(%rbx)
>     b:   49 8d 44 24 68          lea    0x68(%r12),%rax
>    10:   48 0f ab 30             bts    %rsi,(%rax)
>    14:   8b                      .byte 0x8b
>    15:   4b                      rex.WXB
> [   60.591081] RSP: 0018:ffffc900000dbbe0 EFLAGS: 00010086
> [   60.596908] RAX: ffff888fd59e31b8 RBX: ffff8881ec87c9e8 RCX: 
> ffff8881e98109e8
> [   60.604866] RDX: 0000000000000099 RSI: 0000000000000099 RDI: 
> ffff888fd59e2c40
> [   60.612826] RBP: ffffc900000dbbf8 R08: 0000000000000001 R09: 
> ffff888fd59e2c40
> [   60.620787] R10: 000000000000550d R11: 0000000000000000 R12: 
> ffff888fd59e2c40
> [   60.628748] R13: 00000000ffff1640 R14: 00000000ffff163c R15: 
> 0000000000000000
> [   60.636706] FS:  0000000000000000(0000) GS:ffff888fd5800000(0000) 
> knlGS:0000000000000000
> [   60.645732] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   60.652141] CR2: ffff8881e98109f0 CR3: 00000008d5e3c003 CR4: 
> 0000000000770ef0
> [   60.660101] PKRU: 55555554
> [   60.663114] Call Trace:
> [   60.665838]  <TASK>
> [   60.668174] ? show_regs 
> (/home/amd/git/linux/arch/x86/kernel/dumpstack.c:479)
> [   60.671971] ? __die 
> (/home/amd/git/linux/arch/x86/kernel/dumpstack.c:421 
> /home/amd/git/linux/arch/x86/kernel/dumpstack.c:434)
> [   60.675375] ? page_fault_oops 
> (/home/amd/git/linux/arch/x86/mm/fault.c:707)
> [   60.679942] ? search_bpf_extables 
> (/home/amd/git/linux/kernel/bpf/core.c:765)
> [   60.684800] ? enqueue_timer 
> (/home/amd/git/linux/./include/linux/list.h:1034 
> /home/amd/git/linux/kernel/time/timer.c:605)
> [   60.689077] ? srso_alias_return_thunk 
> (/home/amd/git/linux/arch/x86/lib/retpoline.S:181)
> [   60.694422] ? search_exception_tables 
> (/home/amd/git/linux/kernel/extable.c:64)
> [   60.699571] ? srso_alias_return_thunk 
> (/home/amd/git/linux/arch/x86/lib/retpoline.S:181)
> [   60.704917] ? kernelmode_fixup_or_oops 
> (/home/amd/git/linux/arch/x86/mm/fault.c:762)
> [   60.710256] ? __bad_area_nosemaphore 
> (/home/amd/git/linux/arch/x86/mm/fault.c:860)
> [   60.715505] ? bad_area_nosemaphore 
> (/home/amd/git/linux/arch/x86/mm/fault.c:867)
> [   60.720364] ? do_kern_addr_fault 
> (/home/amd/git/linux/arch/x86/mm/fault.c:1227)
> [   60.725030] ? exc_page_fault 
> (/home/amd/git/linux/arch/x86/mm/fault.c:1503 
> /home/amd/git/linux/arch/x86/mm/fault.c:1561)
> [   60.729503] ? asm_exc_page_fault 
> (/home/amd/git/linux/./arch/x86/include/asm/idtentry.h:570)
> [   60.734174] ? enqueue_timer 
> (/home/amd/git/linux/./include/linux/list.h:1034 
> /home/amd/git/linux/kernel/time/timer.c:605)
> [   60.738453] __mod_timer (/home/amd/git/linux/kernel/time/timer.c:635 
> /home/amd/git/linux/kernel/time/timer.c:1131)
> [   60.742439] ? local_clock_noinstr 
> (/home/amd/git/linux/kernel/sched/clock.c:301)
> [   60.747202] add_timer (/home/amd/git/linux/kernel/time/timer.c:1245)
> [   60.750798] __queue_delayed_work 
> (/home/amd/git/linux/kernel/workqueue.c:1962)
> [   60.755463] queue_delayed_work_on 
> (/home/amd/git/linux/kernel/workqueue.c:1987)
> [   60.760226] drm_kms_helper_poll_enable 
> (/home/amd/git/linux/drivers/gpu/drm/drm_probe_helper.c:310) drm_kms_helper
> [   60.767229] drm_kms_helper_poll_init 
> (/home/amd/git/linux/drivers/gpu/drm/drm_probe_helper.c:914) drm_kms_helper
> [   60.773936] ast_mode_config_init 
> (/home/amd/git/linux/drivers/gpu/drm/ast/ast_mode.c:1931) ast
> [   60.779382] ast_device_create 
> (/home/amd/git/linux/drivers/gpu/drm/ast/ast_main.c:518) ast
> [   60.784533] ast_pci_probe 
> (/home/amd/git/linux/drivers/gpu/drm/ast/ast_drv.c:106) ast
> [   60.789107] local_pci_probe 
> (/home/amd/git/linux/drivers/pci/pci-driver.c:324)
> [   60.793292] work_for_cpu_fn 
> (/home/amd/git/linux/kernel/workqueue.c:5621)
> [   60.797471] process_one_work 
> (/home/amd/git/linux/kernel/workqueue.c:2630)
> [   60.801941] ? process_one_work 
> (/home/amd/git/linux/kernel/workqueue.c:2605)
> [   60.806608] worker_thread 
> (/home/amd/git/linux/kernel/workqueue.c:2697 
> /home/amd/git/linux/kernel/workqueue.c:2784)
> [   60.810790] ? __pfx_worker_thread 
> (/home/amd/git/linux/kernel/workqueue.c:2730)
> [   60.815554] kthread (/home/amd/git/linux/kernel/kthread.c:388)
> [   60.819151] ? __pfx_kthread (/home/amd/git/linux/kernel/kthread.c:341)
> [   60.823331] ret_from_fork 
> (/home/amd/git/linux/arch/x86/kernel/process.c:147)
> [   60.827318] ? __pfx_kthread (/home/amd/git/linux/kernel/kthread.c:341)
> [   60.831498] ret_from_fork_asm 
> (/home/amd/git/linux/arch/x86/entry/entry_64.S:250)
> [   60.835878]  </TASK>
> [   60.838309] Modules linked in: crct10dif_pclmul crc32_pclmul 
> ghash_clmulni_intel sha512_ssse3 sha256_ssse3 sha1_ssse3 ast(+) 
> i2c_algo_bit drm_shmem_helper hid_generic(+) drm_kms_helper uas dax_hmem 
> nvme usbhid usb_storage drm hid ahci(+) libahci i2c_piix4 nvme_core wmi 
> aesni_intel crypto_simd cryptd
> [   60.867920] CR2: ffff8881e98109f0
> [   60.871616] ---[ end trace 0000000000000000 ]---
> 
> drivers/gpu/drm/drm_probe_helper.c:310 is the
> dev->mode_config.poll_running assignment here:
> 
> void drm_kms_helper_poll_enable(struct drm_device *dev)
> {
>      if (!dev->mode_config.poll_enabled || !drm_kms_helper_poll ||
>          dev->mode_config.poll_running)
>          return;
> 
>      if (drm_kms_helper_enable_hpd(dev) ||
>          dev->mode_config.delayed_event)
>          reschedule_output_poll_work(dev);
> 
>      dev->mode_config.poll_running = true;           <<<<< HERE
> }
> EXPORT_SYMBOL(drm_kms_helper_poll_enable);
> 

Hi,

Thanks for the detailed bug report.

 From the call stack, I think the crash is more likely here:
https://elixir.bootlin.com/linux/v6.6/source/kernel/time/timer.c#L605

But the timer looks correctly initialized in
https://elixir.bootlin.com/linux/v6.6/source/drivers/gpu/drm/drm_probe_helper.c#L908

So I'm not sure why it fails in this case.


> If I revert commit f81bb0ac7872893241319ea82504956676ef02fd
> ("drm/ast: report connection status on Display Port."), the splat
> goes away:
> 
> [   60.603837] input: OpenBMC virtual_input as 
> /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.0/0003:1D6B:0104.0002/input/input4
> [   60.651733] ast 0000:c2:00.0: vgaarb: deactivate vga console
> [   60.659978]  4k 16711104 large 0 gb 0 x 
> 1303[ffff888000097000-ffff8880a7ffe000] miss 383488
> [   60.669321] ok.
> [   60.670497] ast 0000:c2:00.0: [drm] Using default configuration
> [   60.677894] ast 0000:c2:00.0: [drm] AST 2600 detected
> [   60.683545] ast 0000:c2:00.0: [drm] Using ASPEED DisplayPort transmitter
> [   60.685381] hid-generic 0003:1D6B:0104.0002: input,hidraw0: USB HID 
> v1.01 Keyboard [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input0
> [   60.691032] ast 0000:c2:00.0: [drm] dram MCLK=396 Mhz type=1 
> bus_width=16
> [   60.697172] [drm] Initialized ast 0.1.0 20120228 for 0000:c2:00.0 on 
> minor 0
> [   60.729565] fbcon: astdrmfb (fb0) is primary device
> [   60.729570] fbcon: Deferring console take-over
> [   60.741322] ast 0000:c2:00.0: [drm] fb0: astdrmfb frame buffer device
> [   60.928226] ast 0000:c2:00.0: vgaarb: deactivate vga console
> [   60.940376] input: OpenBMC virtual_input as 
> /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.0/0003:1D6B:0104.0002/input/input5
> [   60.965436] ast 0000:c2:00.0: [drm] Using default configuration
> [   60.972051] ast 0000:c2:00.0: [drm] AST 2600 detected
> [   60.977698] ast 0000:c2:00.0: [drm] Using ASPEED DisplayPort transmitter
> [   60.985181] ast 0000:c2:00.0: [drm] dram MCLK=396 Mhz type=1 
> bus_width=16
> [   61.000056] [drm] Initialized ast 0.1.0 20120228 for 0000:c2:00.0 on 
> minor 0
> [   61.013486] fbcon: Deferring console take-over
> [   61.016918] hid-generic 0003:1D6B:0104.0002: input,hidraw0: USB HID 
> v1.01 Keyboard [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input0
> [   61.018454] ast 0000:c2:00.0: [drm] fb0: astdrmfb frame buffer device
> [   61.040853] input: OpenBMC virtual_input as 
> /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.1/0003:1D6B:0104.0004/input/input6
> [   61.059112] hid-generic 0003:1D6B:0104.0004: input,hidraw1: USB HID 
> v1.01 Mouse [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input1
> [   61.358397] input: OpenBMC virtual_input as 
> /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.1/0003:1D6B:0104.0004/input/input7
> [   61.376885] hid-generic 0003:1D6B:0104.0004: input,hidraw1: USB HID 
> v1.01 Mouse [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input1
> 
> This has happened before when drm_kms_helper_poll_init() was added
> to an ast connector_init(), see:

The crash was in the detect() callback for that previous case.
This time it crashes when setting the timer, but they still look very 
similar, thanks for pointing this.
> 
> commit 595cb5e0b832a3e100cbbdefef797b0c27bf725a
> Author: Kim Phillips <kim.phillips@amd.com>
> Date:   Thu Oct 21 10:30:06 2021 -0500
> 
>      Revert "drm/ast: Add detect function support"
> 
> I'm willing to test any proposed changes, esp. if it means
> not reverting this commit, too, because that will only likely
> lead to yet another BUG instance if/when another poll_init() gets
> added in the future.  Should the FIXME described in
> reschedule_output_poll_work() be addressed?


This fixme just change the timer interval from 10s to 1s, so it 
shouldn't explain this crash.

Can you test with the attached patch ? I want to see if the detect 
callback is called, and also make sure the delayed_work struct is 
properly initialized.

> 
> Thanks,
> 
> Kim

Best regards,

-- 

Jocelyn

--------------vCleYulQg3ngWFcv0HP0mjDH
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-probe-helper-Add-debug-for-AST-poll-bug.patch"
Content-Disposition: attachment;
 filename="0001-drm-probe-helper-Add-debug-for-AST-poll-bug.patch"
Content-Transfer-Encoding: base64

RnJvbSAwYTlmMmQ4MWFmMTA4N2FiMzY0ODIwNmRmY2UxNjA2MzkzODVhNmI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb2NlbHluIEZhbGVtcGUgPGpmYWxlbXBlQHJlZGhhdC5jb20+
CkRhdGU6IFRodSwgOSBOb3YgMjAyMyAxNDozOToyMiArMDEwMApTdWJqZWN0OiBbUEFUQ0hdIGRy
bS9wcm9iZS1oZWxwZXI6IEFkZCBkZWJ1ZyBmb3IgQVNUIHBvbGwgYnVnCgpTaWduZWQtb2ZmLWJ5
OiBKb2NlbHluIEZhbGVtcGUgPGpmYWxlbXBlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2RybV9wcm9iZV9oZWxwZXIuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVscGVyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jCmluZGV4IDNmNDc5NDgzZDdkOC4u
OWFhOTU3OTE4OTFhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBl
ci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVscGVyLmMKQEAgLTc1Myw2ICs3
NTMsOCBAQCBzdGF0aWMgdm9pZCBvdXRwdXRfcG9sbF9leGVjdXRlKHN0cnVjdCB3b3JrX3N0cnVj
dCAqd29yaykKIAlib29sIHJlcG9sbCA9IGZhbHNlLCBjaGFuZ2VkOwogCXU2NCBvbGRfZXBvY2hf
Y291bnRlcjsKIAorCXByX2luZm8oIkFTVERFQlVHIHBvbGwgZXhlY3V0ZSBkZWxheWVkX3dvcmsg
JXAsIGRybV9kZXYgJXBcbiIsIGRlbGF5ZWRfd29yaywgZGV2KTsKKwogCWlmICghZGV2LT5tb2Rl
X2NvbmZpZy5wb2xsX2VuYWJsZWQpCiAJCXJldHVybjsKIApAQCAtOTEwLDYgKzkxMiw4IEBAIHZv
aWQgZHJtX2ttc19oZWxwZXJfcG9sbF9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJSU5J
VF9ERUxBWUVEX1dPUksoJmRldi0+bW9kZV9jb25maWcub3V0cHV0X3BvbGxfd29yaywgb3V0cHV0
X3BvbGxfZXhlY3V0ZSk7CiAJZGV2LT5tb2RlX2NvbmZpZy5wb2xsX2VuYWJsZWQgPSB0cnVlOwog
CisJcHJfaW5mbygiQVNUREVCVUcgcG9sbCBpbml0IGRlbGF5ZWQgd29yayAlcCB0aW1lciAlcCBk
cm1fZGV2ICVwIHRpbWVyIGZsYWcgMHglMHhcbiIsICZkZXYtPm1vZGVfY29uZmlnLm91dHB1dF9w
b2xsX3dvcmssICZkZXYtPm1vZGVfY29uZmlnLm91dHB1dF9wb2xsX3dvcmsudGltZXIsIGRldiwg
ZGV2LT5tb2RlX2NvbmZpZy5vdXRwdXRfcG9sbF93b3JrLnRpbWVyLmZsYWdzKTsKKwogCWRybV9r
bXNfaGVscGVyX3BvbGxfZW5hYmxlKGRldik7CiB9CiBFWFBPUlRfU1lNQk9MKGRybV9rbXNfaGVs
cGVyX3BvbGxfaW5pdCk7Ci0tIAoyLjQxLjAKCg==
--------------vCleYulQg3ngWFcv0HP0mjDH--

