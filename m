Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C304FB5F1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 10:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8405810F422;
	Mon, 11 Apr 2022 08:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9907010F384
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 08:27:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E0E0AB8111A;
 Mon, 11 Apr 2022 08:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F34EC385A4;
 Mon, 11 Apr 2022 08:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1649665663;
 bh=tiRHCAXvo9xKyaIJeeWvkptjhdlMDyojlIMaATlu85Q=;
 h=Subject:To:Cc:From:Date:From;
 b=jJ0nGW1UNGk28RhpBdilh/lkPq6HmLZRb+0d8/Q2ofKo+BrHdYOZVLxljG8jknZmM
 kbEoXAfWKKPsQuEmF3ll7QAtkfF68vRGBAwPvStplTtkpZbC1rbgt+c/pLsMcCaaMm
 086TQCcNTUJwond2vhIs5PK6JSV9Qr/JZj0qAf2w=
Subject: Patch "fbdev: Fix unregistering of framebuffers without device" has
 been added to the 5.15-stable tree
To: alexander.deucher@amd.com, daniel.vetter@ffwll.ch, deller@gmx.de,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 hdegoede@redhat.com, javierm@redhat.com, linux@roeck-us.net,
 penguin-kernel@i-love.sakura.ne.jp, sam@ravnborg.org,
 sudip.mukherjee@codethink.co.uk, sudipm.mukherjee@gmail.com,
 thunder.leizhen@huawei.com, tzimmermann@suse.de, willy@infradead.org,
 xiyuyang19@fudan.edu.cn, zackr@vmware.com, zheyuma97@gmail.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 11 Apr 2022 10:27:21 +0200
Message-ID: <1649665641182175@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    fbdev: Fix unregistering of framebuffers without device

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     fbdev-fix-unregistering-of-framebuffers-without-device.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 0f525289ff0ddeb380813bd81e0f9bdaaa1c9078 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 4 Apr 2022 21:44:02 +0200
Subject: fbdev: Fix unregistering of framebuffers without device

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 0f525289ff0ddeb380813bd81e0f9bdaaa1c9078 upstream.

OF framebuffers do not have an underlying device in the Linux
device hierarchy. Do a regular unregister call instead of hot
unplugging such a non-existing device. Fixes a NULL dereference.
An example error message on ppc64le is shown below.

  BUG: Kernel NULL pointer dereference on read at 0x00000060
  Faulting instruction address: 0xc00000000080dfa4
  Oops: Kernel access of bad area, sig: 11 [#1]
  LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
  [...]
  CPU: 2 PID: 139 Comm: systemd-udevd Not tainted 5.17.0-ae085d7f9365 #1
  NIP:  c00000000080dfa4 LR: c00000000080df9c CTR: c000000000797430
  REGS: c000000004132fe0 TRAP: 0300   Not tainted  (5.17.0-ae085d7f9365)
  MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 28228282  XER: 20000000
  CFAR: c00000000000c80c DAR: 0000000000000060 DSISR: 40000000 IRQMASK: 0
  GPR00: c00000000080df9c c000000004133280 c00000000169d200 0000000000000029
  GPR04: 00000000ffffefff c000000004132f90 c000000004132f88 0000000000000000
  GPR08: c0000000015658f8 c0000000015cd200 c0000000014f57d0 0000000048228283
  GPR12: 0000000000000000 c00000003fffe300 0000000020000000 0000000000000000
  GPR16: 0000000000000000 0000000113fc4a40 0000000000000005 0000000113fcfb80
  GPR20: 000001000f7283b0 0000000000000000 c000000000e4a588 c000000000e4a5b0
  GPR24: 0000000000000001 00000000000a0000 c008000000db0168 c0000000021f6ec0
  GPR28: c0000000016d65a8 c000000004b36460 0000000000000000 c0000000016d64b0
  NIP [c00000000080dfa4] do_remove_conflicting_framebuffers+0x184/0x1d0
  [c000000004133280] [c00000000080df9c] do_remove_conflicting_framebuffers+0x17c/0x1d0 (unreliable)
  [c000000004133350] [c00000000080e4d0] remove_conflicting_framebuffers+0x60/0x150
  [c0000000041333a0] [c00000000080e6f4] remove_conflicting_pci_framebuffers+0x134/0x1b0
  [c000000004133450] [c008000000e70438] drm_aperture_remove_conflicting_pci_framebuffers+0x90/0x100 [drm]
  [c000000004133490] [c008000000da0ce4] bochs_pci_probe+0x6c/0xa64 [bochs]
  [...]
  [c000000004133db0] [c00000000002aaa0] system_call_exception+0x170/0x2d0
  [c000000004133e10] [c00000000000c3cc] system_call_common+0xec/0x250

The bug [1] was introduced by commit 27599aacbaef ("fbdev: Hot-unplug
firmware fb devices on forced removal"). Most firmware framebuffers
have an underlying platform device, which can be hot-unplugged
before loading the native graphics driver. OF framebuffers do not
(yet) have that device. Fix the code by unregistering the framebuffer
as before without a hot unplug.

Tested with 5.17 on qemu ppc64le emulation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 27599aacbaef ("fbdev: Hot-unplug firmware fb devices on forced removal")
Reported-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Tested-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
Cc: Zack Rusin <zackr@vmware.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: stable@vger.kernel.org # v5.11+
Cc: Helge Deller <deller@gmx.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Zheyu Ma <zheyuma97@gmail.com>
Cc: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Link: https://lore.kernel.org/all/YkHXO6LGHAN0p1pq@debian/ # [1]
Link: https://patchwork.freedesktop.org/patch/msgid/20220404194402.29974-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/video/fbdev/core/fbmem.c |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1581,7 +1581,14 @@ static void do_remove_conflicting_frameb
 			 * If it's not a platform device, at least print a warning. A
 			 * fix would add code to remove the device from the system.
 			 */
-			if (dev_is_platform(device)) {
+			if (!device) {
+				/* TODO: Represent each OF framebuffer as its own
+				 * device in the device hierarchy. For now, offb
+				 * doesn't have such a device, so unregister the
+				 * framebuffer as before without warning.
+				 */
+				do_unregister_framebuffer(registered_fb[i]);
+			} else if (dev_is_platform(device)) {
 				registered_fb[i]->forced_out = true;
 				platform_device_unregister(to_platform_device(device));
 			} else {


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-5.15/fbdev-fix-unregistering-of-framebuffers-without-device.patch
