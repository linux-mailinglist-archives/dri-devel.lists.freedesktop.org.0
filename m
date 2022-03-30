Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A4C4EC43F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 14:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1522710E1E0;
	Wed, 30 Mar 2022 12:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F50E10E1E0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 12:36:58 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1nZXZF-0001zU-FY; Wed, 30 Mar 2022 14:36:53 +0200
Message-ID: <0a09ee9a-23fc-ca6a-fcff-ae78b90b39ed@leemhuis.info>
Date: Wed, 30 Mar 2022 14:36:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: regression: NULL pointer dereference due to 27599aacbaef ("fbdev:
 Hot-unplug firmware fb devices on forced removal")
Content-Language: en-US
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <YkHXO6LGHAN0p1pq@debian>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <YkHXO6LGHAN0p1pq@debian>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1648643818;
 3b2d7f3c; 
X-HE-SMSGID: 1nZXZF-0001zU-FY
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
Cc: linux-fbdev@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[TLDR: I'm adding the regression report below to regzbot, the Linux
kernel regression tracking bot; all text you find below is compiled from
a few templates paragraphs you might have encountered already already
from similar mails.]

[adding fbdev and dri-devel lists, and the egression mailing list, as it
should be in the loop for all regressions]

Hi, this is your Linux kernel regression tracker. Top-posting for once,
to make this easily accessible to everyone.

Thanks for the report. Thomas, Zack, do you know what's up here?

Note to everyone: the culprit of this regression is marked for backporting.

Anyway: To be sure below issue doesn't fall through the cracks
unnoticed, I'm adding it to regzbot, my Linux kernel regression tracking
bot:

#regzbot ^introduced 27599aacbaef
#regzbot title drm: fbdev: NULL pointer dereference due to 27599aacbaef
("fbdev: Hot-unplug firmware fb devices on forced removal")
#regzbot ignore-activity

If it turns out this isn't a regression, free free to remove it from the
tracking by sending a reply to this thread containing a paragraph like
"#regzbot invalid: reason why this is invalid" (without the quotes).

Reminder for developers: when fixing the issue, please add a 'Link:'
tags pointing to the report (the mail quoted above) using
lore.kernel.org/r/, as explained in
'Documentation/process/submitting-patches.rst' and
'Documentation/process/5.Posting.rst'. Regzbot needs them to
automatically connect reports with fixes, but they are useful in
general, too.

I'm sending this to everyone that got the initial report, to make
everyone aware of the tracking. I also hope that messages like this
motivate people to directly get at least the regression mailing list and
ideally even regzbot involved when dealing with regressions, as messages
like this wouldn't be needed then. And don't worry, if I need to send
other mails regarding this regression only relevant for regzbot I'll
send them to the regressions lists only (with a tag in the subject so
people can filter them away). With a bit of luck no such messages will
be needed anyway.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.



On 28.03.22 17:41, Sudip Mukherjee wrote:
> Hi Thomas,
> 
> We usually run boot tests with linux mainline HEAD commit almost every
> night on ppc64 qemu. And my tests had been failing for last few days.
> Testing locally gave me:
> 
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.038791] BUG: Kernel NULL pointer dereference on read at 0x00000060
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.038995] Faulting instruction address: 0xc00000000080dfa4
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.039572] Oops: Kernel access of bad area, sig: 11 [#1]
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.039723] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.040012] Modules linked in: bochs(+) drm_vram_helper xhci_pci drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm_ttm_helper sr_mod ttm cdrom xhci_hcd virtio_net virtio_console net_failover virtio_blk virtio_scsi failover ibmvscsi scsi_transport_srp virtio_pci virtio virtio_pci_legacy_dev virtio_pci_modern_dev usbcore drm drm_panel_orientation_quirks virtio_ring usb_common
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.040918] CPU: 2 PID: 139 Comm: systemd-udevd Not tainted 5.17.0-ae085d7f9365 #1
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.041245] NIP:  c00000000080dfa4 LR: c00000000080df9c CTR: c000000000797430
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.041376] REGS: c000000004132fe0 TRAP: 0300   Not tainted  (5.17.0-ae085d7f9365)
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.041528] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 28228282  XER: 20000000
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.042017] CFAR: c00000000000c80c DAR: 0000000000000060 DSISR: 40000000 IRQMASK: 0 
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.042017] GPR00: c00000000080df9c c000000004133280 c00000000169d200 0000000000000029 
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.042017] GPR04: 00000000ffffefff c000000004132f90 c000000004132f88 0000000000000000 
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.042017] GPR08: c0000000015658f8 c0000000015cd200 c0000000014f57d0 0000000048228283 
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.042017] GPR12: 0000000000000000 c00000003fffe300 0000000020000000 0000000000000000 
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.042017] GPR16: 0000000000000000 0000000113fc4a40 0000000000000005 0000000113fcfb80 
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.042017] GPR20: 000001000f7283b0 0000000000000000 c000000000e4a588 c000000000e4a5b0 
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.042017] GPR24: 0000000000000001 00000000000a0000 c008000000db0168 c0000000021f6ec0 
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.042017] GPR28: c0000000016d65a8 c000000004b36460 0000000000000000 c0000000016d64b0 
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.043184] NIP [c00000000080dfa4] do_remove_conflicting_framebuffers+0x184/0x1d0
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.043748] LR [c00000000080df9c] do_remove_conflicting_framebuffers+0x17c/0x1d0
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.043982] Call Trace:
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.044108] [c000000004133280] [c00000000080df9c] do_remove_conflicting_framebuffers+0x17c/0x1d0 (unreliable)
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.044335] [c000000004133350] [c00000000080e4d0] remove_conflicting_framebuffers+0x60/0x150
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.044468] [c0000000041333a0] [c00000000080e6f4] remove_conflicting_pci_framebuffers+0x134/0x1b0
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.044588] [c000000004133450] [c008000000e70438] drm_aperture_remove_conflicting_pci_framebuffers+0x90/0x100 [drm]
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.045443] [c000000004133490] [c008000000da0ce4] bochs_pci_probe+0x6c/0xa64 [bochs]
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.045624] [c000000004133570] [c0000000007ca518] local_pci_probe+0x68/0x110
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.045730] [c0000000041335f0] [c0000000007cb438] pci_call_probe+0x88/0x1a0
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.045830] [c000000004133750] [c0000000007cc6ac] pci_device_probe+0xbc/0x1a0
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.045928] [c000000004133790] [c0000000008969e0] really_probe+0x100/0x5e0
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.046025] [c000000004133810] [c00000000089704c] __driver_probe_device+0x18c/0x250
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.046125] [c000000004133890] [c00000000089716c] driver_probe_device+0x5c/0x140
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.046225] [c0000000041338d0] [c000000000897cf8] __driver_attach+0x118/0x290
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.046322] [c000000004133950] [c000000000892d38] bus_for_each_dev+0xa8/0x130
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.046425] [c0000000041339b0] [c000000000895c24] driver_attach+0x34/0x50
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.046521] [c0000000041339d0] [c000000000895308] bus_add_driver+0x1b8/0x2e0
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.046618] [c000000004133a60] [c000000000898ea4] driver_register+0xb4/0x1c0
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.046714] [c000000004133ad0] [c0000000007c9d28] __pci_register_driver+0x68/0x80
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.046815] [c000000004133af0] [c008000000da174c] bochs_pci_driver_init+0x70/0x98 [bochs]
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.046931] [c000000004133b20] [c000000000011fd0] do_one_initcall+0x60/0x2d0
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.047033] [c000000004133c00] [c000000000229d38] do_init_module+0x68/0x360
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.047136] [c000000004133c90] [c00000000022dc3c] __do_sys_finit_module+0xdc/0x180
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.047239] [c000000004133db0] [c00000000002aaa0] system_call_exception+0x170/0x2d0
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.050839] [c000000004133e10] [c00000000000c3cc] system_call_common+0xec/0x250
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.053127] --- interrupt: c00 at 0x7fffa43100c4
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.055616] NIP:  00007fffa43100c4 LR: 00007fffa457fe2c CTR: 0000000000000000
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.058073] REGS: c000000004133e80 TRAP: 0c00   Not tainted  (5.17.0-ae085d7f9365)
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.060563] MSR:  800000000000f033 <SF,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 24222824  XER: 00000000
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.063048] IRQMASK: 0 
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.063048] GPR00: 0000000000000161 00007fffe8930710 00007fffa43f7100 0000000000000015 
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.063048] GPR04: 00007fffa458b448 0000000000000000 0000000000000000 0000000000000000 
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.063048] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.063048] GPR12: 0000000000000000 00007fffa465ddd0 0000000020000000 0000000000000000 
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.063048] GPR16: 0000000000000000 0000000113fc4a40 0000000000000005 0000000113fcfb80 
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.063048] GPR20: 000001000f7283b0 0000000000000000 0000000113fcfb68 000001000f729570 
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.063048] GPR24: 0000000000000000 000001000f7283b0 0000000000020000 000001000f7282f0 
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.063048] GPR28: 00007fffa458b448 0000000000020000 0000000000000000 000001000f7283b0 
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.086658] NIP [00007fffa43100c4] 0x7fffa43100c4
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.091853] LR [00007fffa457fe2c] 0x7fffa457fe2c
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.097294] --- interrupt: c00
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.103124] Instruction dump:
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.112912] 7d710120 7d708120 4e800020 e8df0000 7fc407b4 7f45d378 7ec3b378 f8810068 
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.119165] 38c600f0 4b9b9c7d 60000000 3d22fff3 <e9550060> 392979e8 e8810068 7c2a4800 
> Mar 28 13:16:36 debian-ppc64 kernel: [   11.123573] ---[ end trace 0000000000000000 ]---
> 
> My last good test was with 5.17.0-3bf03b9a0839 and can be seen at:
> https://openqa.qa.codethink.co.uk/tests/932
> 
> A failure test with 5.17.0-52d543b5497c can be seen at: https://openqa.qa.codethink.co.uk/tests/937
> 
> After reverting 27599aacbaef ("fbdev: Hot-unplug firmware fb devices on
> forced removal") on top of latest Linux mainline HEAD fixes the problem
> and I can see qemu booting again.
> 
> I will be happy to test any patch fixing the problem.

-- 
Additional information about regzbot:

If you want to know more about regzbot, check out its web-interface, the
getting start guide, and the references documentation:

https://linux-regtracking.leemhuis.info/regzbot/
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

The last two documents will explain how you can interact with regzbot
yourself if your want to.

Hint for reporters: when reporting a regression it's in your interest to
CC the regression list and tell regzbot about the issue, as that ensures
the regression makes it onto the radar of the Linux kernel's regression
tracker -- that's in your interest, as it ensures your report won't fall
through the cracks unnoticed.

Hint for developers: you normally don't need to care about regzbot once
it's involved. Fix the issue as you normally would, just remember to
include 'Link:' tag in the patch descriptions pointing to all reports
about the issue. This has been expected from developers even before
regzbot showed up for reasons explained in
'Documentation/process/submitting-patches.rst' and
'Documentation/process/5.Posting.rst'.
