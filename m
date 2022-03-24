Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 078CB4E6994
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 21:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA9110E186;
	Thu, 24 Mar 2022 20:00:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1500 seconds by postgrey-1.36 at gabe;
 Thu, 24 Mar 2022 20:00:51 UTC
Received: from gateway33.websitewelcome.com (gateway33.websitewelcome.com
 [192.185.145.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D9810E186
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 20:00:51 +0000 (UTC)
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway33.websitewelcome.com (Postfix) with ESMTP id CE30754D6D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 14:11:18 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
 by cmsmtp with SMTP
 id XSrenUPY222u3XSrenqnhC; Thu, 24 Mar 2022 14:11:18 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DlF8r0kvIcyeAeobkfqOBteOgsnVDeCh2X8u7jTpkzE=; b=FBvu6wPWm2vXIeRJV7jDIPncrZ
 4REVi3NBUePIkBEYYGvcqopm46ftTOCkhUj2C7wFEmJillO1V/ywbv95gn9a7iWfKajnQbx0fORsN
 X/Btt72N9lZbfnQMlRo/lKXWYSmfzjZttF0B3m/hAYQwyiCeX4AZJUmyB5jel5XVqSeG4/S0Ju7SO
 IyE3RM2wn8TwrwpwrGWMQHrSoun1sNMbtdk7T/3kq7x3Fnu38KOolPs1Xf8O0yXp5jbKPyA/qBJWt
 5zfKh99eXSvASCB/mwT8hz16LniVNCpd/m21yMvOHTo3EWaE0NxKyPuQQUtnp277xRVjTQOwacOgy
 ne+QuwLw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:57648 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@roeck-us.net>)
 id 1nXSrd-002Scs-Vm; Thu, 24 Mar 2022 19:11:18 +0000
Date: Thu, 24 Mar 2022 12:11:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 4/5] fbdev: Improve performance of cfb_imageblit()
Message-ID: <20220324191116.GA1045463@roeck-us.net>
References: <20220223193804.18636-1-tzimmermann@suse.de>
 <20220223193804.18636-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223193804.18636-5-tzimmermann@suse.de>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nXSrd-002Scs-Vm
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost)
 [108.223.40.66]:57648
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, ppaalanen@gmail.com, geert@linux-m68k.org,
 kraxel@redhat.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Feb 23, 2022 at 08:38:03PM +0100, Thomas Zimmermann wrote:
> Improve the performance of cfb_imageblit() by manually unrolling
> the inner blitting loop and moving some invariants out. The compiler
> failed to do this automatically. This change keeps cfb_imageblit()
> in sync with sys_imagebit().
> 
> A microbenchmark measures the average number of CPU cycles
> for cfb_imageblit() after a stabilizing period of a few minutes
> (i7-4790, FullHD, simpledrm, kernel with debugging).
> 
> cfb_imageblit(), new: 15724 cycles
> cfb_imageblit(): old: 30566 cycles
> 
> In the optimized case, cfb_imageblit() is now ~2x faster than before.
> 
> v3:
> 	* fix commit description (Pekka)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

This patch causes crashes with arm mainstone, z2, and collie emulations.
Reverting it fixes the problem.

collie crash log and bisect log attached.

Guenter

---
8<--- cut here ---
Unable to handle kernel paging request at virtual address e090d000
[e090d000] *pgd=c0c0b811c0c0b811, *pte=c0c0b000, *ppte=00000000
Internal error: Oops: 807 [#1] ARM
CPU: 0 PID: 1 Comm: swapper Not tainted 5.17.0-next-20220324 #1
Hardware name: Sharp-Collie
PC is at cfb_imageblit+0x58c/0x6e0
LR is at 0x5
pc : [<c040eab0>]    lr : [<00000005>]    psr: a0000153
sp : e0809958  ip : e090d000  fp : e08099f4
r10: e08099c8  r9 : c0c70600  r8 : ffff6802
r7 : c0c6e000  r6 : 00000000  r5 : e08e7000  r4 : 00000280
r3 : 00000020  r2 : 00000003  r1 : 00000002  r0 : 00000002
Flags: NzCv  IRQs on  FIQs off  Mode SVC_32  ISA ARM  Segment none
Control: 0000717f  Table: c0004000  DAC: 00000053
Register r0 information: non-paged memory
Register r1 information: non-paged memory
Register r2 information: non-paged memory
Register r3 information: non-paged memory
Register r4 information: non-paged memory
Register r5 information: 0-page vmalloc region starting at 0xe08e6000 allocated at dma_common_contiguous_remap+0x94/0xb0
Register r6 information: NULL pointer
Register r7 information: non-slab/vmalloc memory
Register r8 information: non-paged memory
Register r9 information: non-slab/vmalloc memory
Register r10 information: 2-page vmalloc region starting at 0xe0808000 allocated at kernel_clone+0x78/0x4e4
Register r11 information: 2-page vmalloc region starting at 0xe0808000 allocated at kernel_clone+0x78/0x4e4
Register r12 information: 0-page vmalloc region starting at 0xe08e6000 allocated at dma_common_contiguous_remap+0x94/0xb0
Process swapper (pid: 1, stack limit = 0x(ptrval))
Stack: (0xe0809958 to 0xe080a000)
9940:                                                       80000153 0000005e
9960: dfb1b424 00000020 00000000 00000000 00000001 00000002 00000003 00000004
9980: dfb1b420 00000000 00000000 00000000 00000000 c067f338 e08099ab 00000026
99a0: 80000153 00000820 007fe178 c07db82c e08099d4 0000003e 00000820 c0e32b00
99c0: 00000006 c07db82c 00000001 c0da1e40 e0809a54 c0e32b00 00000006 00000001
99e0: 00000001 c0c6e000 e0809a34 e08099f8 c040a3f8 c040e530 00000006 00000001
9a00: c0e61920 c0da1e78 00000000 c0e61920 00000000 e0809a54 c06ad89c c0e32b00
9a20: c0da1e00 00000020 e0809acc e0809a38 c040a040 c040a26c e0809a7c 00000140
9a40: 00000002 00000002 00000001 00000007 00000000 00000039 00000001 c0da1e00
9a60: 00000000 00000000 00000000 00000004 00000006 00000007 00000000 00000001
9a80: c06ad89c 00000000 00000000 00000000 00000000 ffffffff ffffffff c07db82c
9aa0: e0809acc c0c0c3c0 c0e32b00 00000007 00000002 00000720 c0409cf0 00000028
9ac0: e0809afc e0809ad0 c040665c c0409cfc 00000000 00000000 c0c0c3c0 c0807584
9ae0: 00000000 00000000 ffffff60 c0c70000 e0809b1c e0809b00 c0439a50 c040656c
9b00: c0c0c3c0 00000000 00000000 00000000 e0809b54 e0809b20 c043a798 c0439a24
9b20: c04095c8 c0c6ff60 00000000 c07db82c e0809b54 c0c0c3c0 c0c6ff60 00000000
9b40: 00000000 ffffff60 e0809ba4 e0809b58 c0407254 c043a5ac e0809b7c e0809b68
9b60: c04145d8 00000000 00000000 00000000 00000720 00000000 00000050 c0c0c3c0
9b80: c0e32b00 c0e61920 00000050 00000028 c0a00df8 00000028 e0809bec e0809ba8
9ba0: c0407748 c0406f04 00000050 00000028 00000050 00000001 c0a02f70 00000000
9bc0: 00000000 c0c0c3c0 c0c0c624 00000000 c0a02f84 0000003e 00000000 c0a03080
9be0: e0809c0c e0809bf0 c0438b10 c040734c c0c0c3c0 c06affbc 00000001 c0a02f84
9c00: e0809c54 e0809c10 c043be28 c0438a80 0000003e 00000001 00000000 c0779d88
9c20: 00000000 00000001 c08075a8 c06affbc 00000000 00000001 00000000 0000003e
9c40: 00000001 c0a02f8c e0809c9c e0809c58 c043c6ec c043bc98 c08075a8 c077c29c
9c60: 00000001 00000000 c0e32b44 c0a03a58 c067f354 c0805a24 c0a00cc8 c0805a24
9c80: 00000000 c07dbabc c0e32da4 fffff000 e0809cb4 e0809ca0 c0405d5c c043c5d4
9ca0: c0a00dac 00000000 e0809cd4 e0809cb8 c0408f48 c0405cfc c0e32b00 00000000
9cc0: c0a00ca8 c0e32b10 e0809d44 e0809cd8 c03ff9e4 c0408e70 c0779a14 00000000
9ce0: c000ea7c 00000000 00000041 00000140 000000f0 00029e01 0000000b 0000001e
9d00: 00000002 00000000 00000005 00000001 00000003 00000000 00000020 c07db82c
9d20: c0e32b00 00000000 c07dfe08 00000004 0000000d 00000000 e0809d84 e0809d48
9d40: c040f550 c03ff7e8 00000004 c077a1b8 c0e32b00 c0180a04 c07dfe18 00000000
9d60: c07dfe18 c0805abc 00000000 00000000 c07cb87c c07cb85c e0809da4 e0809d88
9d80: c045c2c8 c040f228 00000000 c07dfe18 c0805abc 00000000 e0809dc4 e0809da8
9da0: c045a304 c045c288 c07dfe18 c0805abc c07dfe18 00000000 e0809ddc e0809dc8
9dc0: c045a548 c045a250 c0a04c6c 60000153 e0809e04 e0809de0 c045a5f4 c045a4d0
9de0: e0809e04 e0809df0 c07dfe18 c0805abc c045a7d0 c080af60 e0809e24 e0809e08
9e00: c045a860 c045a5b4 00000000 c0805abc c045a7d0 c080af60 e0809e54 e0809e28
9e20: c0458694 c045a7dc c0c30e20 c0c30dec c0c9f3b4 c07db82c c06559b8 c0805abc
9e40: c0e5d340 00000000 e0809e64 e0809e58 c045adf0 c0458620 e0809e8c e0809e68
9e60: c0458fb8 c045addc c0749e14 e0809e78 c0805abc c0c19000 c07bc340 c07a4bc8
9e80: e0809ea4 e0809e90 c045b684 c0458e84 c0818000 c0c19000 e0809eb4 e0809ea8
9ea0: c045d10c c045b614 e0809ec4 e0809eb8 c07bc368 c045d0f8 e0809f4c e0809ec8
9ec0: c07a821c c07bc34c e0809eec e0809ed8 c00374f4 c065f390 c0c427da c07a5600
9ee0: e0809f4c e0809ef0 c00376f4 c07a7448 e0809f03 00000006 00000006 00000000
9f00: 00000000 c07a743c c0793b5c c07a4bc8 00000dc0 c0c427cc c0c427d4 c07db82c
9f20: 00000000 c07d2060 c0c427a0 00000007 c07a4bc8 c0818000 c07cb87c c07cb85c
9f40: e0809f94 e0809f50 c07a85a0 c07a81b0 00000006 00000006 00000000 c07a743c
9f60: c0c19000 0000008c e0809f8c 00000000 c0675804 00000000 00000000 00000000
9f80: 00000000 00000000 e0809fac e0809f98 c067581c c07a842c 00000000 c0675804
9fa0: 00000000 e0809fb0 c0008328 c0675810 00000000 00000000 00000000 00000000
9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
9fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
Backtrace:
 cfb_imageblit from soft_cursor+0x198/0x1fc
 r10:c0c6e000 r9:00000001 r8:00000001 r7:00000006 r6:c0e32b00 r5:e0809a54
 r4:c0da1e40
 soft_cursor from bit_cursor+0x350/0x4fc
 r10:00000020 r9:c0da1e00 r8:c0e32b00 r7:c06ad89c r6:e0809a54 r5:00000000
 r4:c0e61920
 bit_cursor from fbcon_cursor+0xfc/0x110
 r10:00000028 r9:c0409cf0 r8:00000720 r7:00000002 r6:00000007 r5:c0e32b00
 r4:c0c0c3c0
 fbcon_cursor from hide_cursor+0x38/0xac
 r9:c0c70000 r8:ffffff60 r7:00000000 r6:00000000 r5:c0807584 r4:c0c0c3c0
 hide_cursor from redraw_screen+0x1f8/0x258
 r7:00000000 r6:00000000 r5:00000000 r4:c0c0c3c0
 redraw_screen from fbcon_prepare_logo+0x35c/0x448
 r8:ffffff60 r7:00000000 r6:00000000 r5:c0c6ff60 r4:c0c0c3c0
 fbcon_prepare_logo from fbcon_init+0x408/0x4f8
 r10:00000028 r9:c0a00df8 r8:00000028 r7:00000050 r6:c0e61920 r5:c0e32b00
 r4:c0c0c3c0
 fbcon_init from visual_init+0x9c/0xe0
 r10:c0a03080 r9:00000000 r8:0000003e r7:c0a02f84 r6:00000000 r5:c0c0c624
 r4:c0c0c3c0
 visual_init from do_bind_con_driver+0x19c/0x370
 r7:c0a02f84 r6:00000001 r5:c06affbc r4:c0c0c3c0
 do_bind_con_driver from do_take_over_console+0x124/0x1b8
 r10:c0a02f8c r9:00000001 r8:0000003e r7:00000000 r6:00000001 r5:00000000
 r4:c06affbc
 do_take_over_console from do_fbcon_takeover+0x6c/0xcc
 r10:fffff000 r9:c0e32da4 r8:c07dbabc r7:00000000 r6:c0805a24 r5:c0a00cc8
 r4:c0805a24
 do_fbcon_takeover from fbcon_fb_registered+0xe4/0x128
 r5:00000000 r4:c0a00dac
 fbcon_fb_registered from register_framebuffer+0x208/0x318
 r7:c0e32b10 r6:c0a00ca8 r5:00000000 r4:c0e32b00
 register_framebuffer from sa1100fb_probe+0x334/0x420
 r9:00000000 r8:0000000d r7:00000004 r6:c07dfe08 r5:00000000 r4:c0e32b00
 sa1100fb_probe from platform_probe+0x4c/0xac
 r10:c07cb85c r9:c07cb87c r8:00000000 r7:00000000 r6:c0805abc r5:c07dfe18
 r4:00000000
 platform_probe from really_probe+0xc0/0x280
 r7:00000000 r6:c0805abc r5:c07dfe18 r4:00000000
 really_probe from __driver_probe_device+0x84/0xe4
 r7:00000000 r6:c07dfe18 r5:c0805abc r4:c07dfe18
 __driver_probe_device from driver_probe_device+0x4c/0x10c
 r5:60000153 r4:c0a04c6c
 driver_probe_device from __driver_attach+0x90/0x104
 r7:c080af60 r6:c045a7d0 r5:c0805abc r4:c07dfe18
 __driver_attach from bus_for_each_dev+0x80/0xcc
 r7:c080af60 r6:c045a7d0 r5:c0805abc r4:00000000
 bus_for_each_dev from driver_attach+0x20/0x28
 r6:00000000 r5:c0e5d340 r4:c0805abc
 driver_attach from bus_add_driver+0x140/0x1c8
 bus_add_driver from driver_register+0x7c/0x110
 r7:c07a4bc8 r6:c07bc340 r5:c0c19000 r4:c0805abc
 driver_register from __platform_driver_register+0x20/0x28
 r5:c0c19000 r4:c0818000
 __platform_driver_register from sa1100fb_init+0x28/0x3c
 sa1100fb_init from do_one_initcall+0x78/0x220
 do_one_initcall from kernel_init_freeable+0x180/0x1fc
 r10:c07cb85c r9:c07cb87c r8:c0818000 r7:c07a4bc8 r6:00000007 r5:c0c427a0
 r4:c07d2060
 kernel_init_freeable from kernel_init+0x18/0x10c
 r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0675804
 r4:00000000
 kernel_init from ret_from_fork+0x14/0x2c
Exception stack(0xe0809fb0 to 0xe0809ff8)
9fa0:                                     00000000 00000000 00000000 00000000
9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
 r5:c0675804 r4:00000000
Code: e24ba02c e0026323 e08a6106 e5166044 (e58c6000)
---[ end trace 00000000c08187d8 ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
Reboot failed -- System halted

---
# bad: [dd315b5800612e6913343524aa9b993f9a8bb0cf] Add linux-next specific files for 20220324
# good: [f443e374ae131c168a065ea1748feac6b2e76613] Linux 5.17
git bisect start 'HEAD' 'v5.17'
# good: [6788381e2f3c20c25cf7ab91df9cf0d6bec153f9] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git
git bisect good 6788381e2f3c20c25cf7ab91df9cf0d6bec153f9
# bad: [59c7e0caa3e7bc21dd1b6c681c87d2b307f399ee] Merge branch 'drm-next' of git://git.freedesktop.org/git/drm/drm.git
git bisect bad 59c7e0caa3e7bc21dd1b6c681c87d2b307f399ee
# good: [4d17d43de9d186150b3289ce99d7a79fcff202f9] net: usb: asix: suspend embedded PHY if external is used
git bisect good 4d17d43de9d186150b3289ce99d7a79fcff202f9
# good: [6c64ae228f0826859c56711ce133aff037d6205f] Backmerge tag 'v5.17-rc6' into drm-next
git bisect good 6c64ae228f0826859c56711ce133aff037d6205f
# good: [01fd8d2522c49a333b0ee46ba19a6fedfc1c9a60] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git
git bisect good 01fd8d2522c49a333b0ee46ba19a6fedfc1c9a60
# bad: [6de7e4f02640fba2ffa6ac04e2be13785d614175] Merge tag 'drm-msm-next-2022-03-01' of https://gitlab.freedesktop.org/drm/msm into drm-next
git bisect bad 6de7e4f02640fba2ffa6ac04e2be13785d614175
# bad: [c9e9ce0b6f85ac330adee912745048a0af5f315d] Merge tag 'drm-misc-next-2022-03-03' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
git bisect bad c9e9ce0b6f85ac330adee912745048a0af5f315d
# good: [e2573d5f2a5cebe789bbf415e484b589d8eebad7] drm/amd/display: limit unbounded requesting to 5k
git bisect good e2573d5f2a5cebe789bbf415e484b589d8eebad7
# good: [3c54c95bd917d43d12fe1b192df9aa4c5973449b] fbdev: Remove trailing whitespaces from cfbimgblt.c
git bisect good 3c54c95bd917d43d12fe1b192df9aa4c5973449b
# good: [ed6e76676b2657b71a0b9e5e847d96e4de0b394b] drm: rcar-du: lvds: Add r8a77961 support
git bisect good ed6e76676b2657b71a0b9e5e847d96e4de0b394b
# good: [66a8af1f6e3c10190dff14a5668661c092a2a85f] Merge tag 'drm/tegra/for-5.18-rc1' of https://gitlab.freedesktop.org/drm/tegra into drm-next
git bisect good 66a8af1f6e3c10190dff14a5668661c092a2a85f
# bad: [701920ca9822eb63b420b3bcb627f2c1ec759903] drm/ssd130x: remove redundant initialization of pointer mode
git bisect bad 701920ca9822eb63b420b3bcb627f2c1ec759903
# bad: [9ae2ac4d31a85ce59cc560d514a31b95f4ace154] drm: Add TODO item for optimizing format helpers
git bisect bad 9ae2ac4d31a85ce59cc560d514a31b95f4ace154
# bad: [0d03011894d23241db1a1cad5c12aede60897d5e] fbdev: Improve performance of cfb_imageblit()
git bisect bad 0d03011894d23241db1a1cad5c12aede60897d5e
# first bad commit: [0d03011894d23241db1a1cad5c12aede60897d5e] fbdev: Improve performance of cfb_imageblit()
