Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E604060E3A9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 16:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D1810E27A;
	Wed, 26 Oct 2022 14:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5234010E394
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 14:46:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BA89AB822B5;
 Wed, 26 Oct 2022 14:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F33C433C1;
 Wed, 26 Oct 2022 14:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666795614;
 bh=ZxXjwhWmVRxaf+qb0GJzNhtfwVwzDSY/s05lamBSPXM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=j039Sd9Maed9NZzLb/S7phyWy5l6c/e7SDj4LRoyLoPANGNDyXxSQkV6X739gHrvm
 l3LJNZl3SRRRDLTRsxO0r5rFIHxvkHp2Ag3QBQ7WBHt2QCqskhRdLBXMW4y9/OkgmJ
 Km3lOSM2NUO8kgBn50gvZ+iQ747jaljAYzDMRhSA=
Subject: Patch "[PATCH v2] video/aperture: Call sysfb_disable() before
 removing PCI devices" has been added to the 6.0-stable tree
To: alexander.deucher@amd.com, andreas.thalhammer-linux@gmx.net,
 daniel.vetter@ffwll.ch, daniel@ffwll.ch, deller@gmx.de,
 deng.changcheng@zte.com.cn, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 regressions@leemhuis.info, sam@ravnborg.org, sashal@kernel.org,
 thunder.leizhen@huawei.com, tzimmermann@suse.de, zackr@vmware.com
From: <gregkh@linuxfoundation.org>
Date: Wed, 26 Oct 2022 16:46:51 +0200
In-Reply-To: <20221026144448.424-1-tzimmermann@suse.de>
Message-ID: <1666795611255234@kroah.com>
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

    [PATCH v2] video/aperture: Call sysfb_disable() before removing PCI devices

to the 6.0-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     video-aperture-call-sysfb_disable-before-removing-pci-devices.patch
and it can be found in the queue-6.0 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From tzimmermann@suse.de  Wed Oct 26 16:46:12 2022
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Wed, 26 Oct 2022 16:44:48 +0200
Subject: [PATCH v2] video/aperture: Call sysfb_disable() before removing PCI devices
To: javierm@redhat.com, deller@gmx.de, sashal@kernel.org, gregkh@linuxfoundation.org
Cc: stable@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Andreas Thalhammer <andreas.thalhammer-linux@gmx.net>, Thorsten Leemhuis <regressions@leemhuis.info>, Zack Rusin <zackr@vmware.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, Alex Deucher <alexander.deucher@amd.com>, Zhen Lei <thunder.leizhen@huawei.com>, Changcheng Deng <deng.changcheng@zte.com.cn>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <20221026144448.424-1-tzimmermann@suse.de>

From: Thomas Zimmermann <tzimmermann@suse.de>

Call sysfb_disable() from aperture_remove_conflicting_pci_devices()
before removing PCI devices. Without, simpledrm can still bind to
simple-framebuffer devices after the hardware driver has taken over
the hardware. Both drivers interfere with each other and results are
undefined.

Reported modesetting errors [1] are shown below.

---- snap ----
rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 13-.... } 7 jiffies s: 165 root: 0x2000/.
rcu: blocking rcu_node structures (internal RCU debug):
Task dump for CPU 13:
task:X               state:R  running task     stack:    0 pid: 4242 ppid:  4228 flags:0x00000008
Call Trace:
 <TASK>
 ? commit_tail+0xd7/0x130
 ? drm_atomic_helper_commit+0x126/0x150
 ? drm_atomic_commit+0xa4/0xe0
 ? drm_plane_get_damage_clips.cold+0x1c/0x1c
 ? drm_atomic_helper_dirtyfb+0x19e/0x280
 ? drm_mode_dirtyfb_ioctl+0x10f/0x1e0
 ? drm_mode_getfb2_ioctl+0x2d0/0x2d0
 ? drm_ioctl_kernel+0xc4/0x150
 ? drm_ioctl+0x246/0x3f0
 ? drm_mode_getfb2_ioctl+0x2d0/0x2d0
 ? __x64_sys_ioctl+0x91/0xd0
 ? do_syscall_64+0x60/0xd0
 ? entry_SYSCALL_64_after_hwframe+0x4b/0xb5
 </TASK>
...
rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 13-.... } 30 jiffies s: 169 root: 0x2000/.
rcu: blocking rcu_node structures (internal RCU debug):
Task dump for CPU 13:
task:X               state:R  running task     stack:    0 pid: 4242 ppid:  4228 flags:0x0000400e
Call Trace:
 <TASK>
 ? memcpy_toio+0x76/0xc0
 ? memcpy_toio+0x1b/0xc0
 ? drm_fb_memcpy_toio+0x76/0xb0
 ? drm_fb_blit_toio+0x75/0x2b0
 ? simpledrm_simple_display_pipe_update+0x132/0x150
 ? drm_atomic_helper_commit_planes+0xb6/0x230
 ? drm_atomic_helper_commit_tail+0x44/0x80
 ? commit_tail+0xd7/0x130
 ? drm_atomic_helper_commit+0x126/0x150
 ? drm_atomic_commit+0xa4/0xe0
 ? drm_plane_get_damage_clips.cold+0x1c/0x1c
 ? drm_atomic_helper_dirtyfb+0x19e/0x280
 ? drm_mode_dirtyfb_ioctl+0x10f/0x1e0
 ? drm_mode_getfb2_ioctl+0x2d0/0x2d0
 ? drm_ioctl_kernel+0xc4/0x150
 ? drm_ioctl+0x246/0x3f0
 ? drm_mode_getfb2_ioctl+0x2d0/0x2d0
 ? __x64_sys_ioctl+0x91/0xd0
 ? do_syscall_64+0x60/0xd0
 ? entry_SYSCALL_64_after_hwframe+0x4b/0xb5
 </TASK>

The problem was added by commit 5e0137612430 ("video/aperture: Disable
and unregister sysfb devices via aperture helpers") to v6.0.3 and does
not exist in the mainline branch.

The mainline commit 5e0137612430 ("video/aperture: Disable and
unregister sysfb devices via aperture helpers") has been backported
from v6.0-rc1 to stable v6.0.3 from a larger patch series [2] that
reworks fbdev framebuffer ownership. The backport misses a change to
aperture_remove_conflicting_pci_devices(). Mainline itself is fine,
because the function does not exist there as a result of the patch
series.

Instead of backporting the whole series, fix the additional function.

Reported-by: Andreas Thalhammer <andreas.thalhammer-linux@gmx.net>
Reported-by: Thorsten Leemhuis <regressions@leemhuis.info>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Andreas Thalhammer <andreas.thalhammer-linux@gmx.net>
Fixes: cfecfc98a78d ("video/aperture: Disable and unregister sysfb devices via aperture helpers")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Changcheng Deng <deng.changcheng@zte.com.cn>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: Sasha Levin <sashal@kernel.org>
Cc: linux-fbdev@vger.kernel.org
Cc: <stable@vger.kernel.org> # v6.0.3+
Link: https://lore.kernel.org/dri-devel/d6afe54b-f8d7-beb2-3609-186e566cbfac@gmx.net/T/#t # [1]
Link: https://patchwork.freedesktop.org/series/106040/ # [2]
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/video/aperture.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -358,6 +358,17 @@ int aperture_remove_conflicting_pci_devi
 		return ret;
 
 	/*
+	 * If a driver asked to unregister a platform device registered by
+	 * sysfb, then can be assumed that this is a driver for a display
+	 * that is set up by the system firmware and has a generic driver.
+	 *
+	 * Drivers for devices that don't have a generic driver will never
+	 * ask for this, so let's assume that a real driver for the display
+	 * was already probed and prevent sysfb to register devices later.
+	 */
+	sysfb_disable();
+
+	/*
 	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
 	 * otherwise the vga fbdev driver falls over.
 	 */


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-6.0/video-aperture-call-sysfb_disable-before-removing-pci-devices.patch
