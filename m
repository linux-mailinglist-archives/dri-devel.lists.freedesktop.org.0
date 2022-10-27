Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBB060FD95
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 18:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5AC10E6A6;
	Thu, 27 Oct 2022 16:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D606C10E6A6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 16:55:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 27601623ED;
 Thu, 27 Oct 2022 16:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13398C433D6;
 Thu, 27 Oct 2022 16:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666889743;
 bh=+NQUXBWxMDcjKd1qUF+jvvhREtcMHvY+4DvsYClRT6U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qfK3QytRTz9gi6rbnb9CHEVnWlw1M+Jv3rZ69K57vHapAajNj9PfKFi5MT4NbLTok
 FW9dGhlP5DQR/im7tnt/sj8hlG7ltxzLggfo/ISEgskJ9jrlinIAZfAoDd5HGgArs/
 tF3x2ZQZLdT09hTzY/hmDaSPHZ2OC+Z9jD14RzlM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.0 01/94] [PATCH v2] video/aperture: Call sysfb_disable()
 before removing PCI devices
Date: Thu, 27 Oct 2022 18:54:03 +0200
Message-Id: <20221027165057.255751031@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221027165057.208202132@linuxfoundation.org>
References: <20221027165057.208202132@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Andreas Thalhammer <andreas.thalhammer-linux@gmx.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Javier Martinez Canillas <javierm@redhat.com>, patches@lists.linux.dev,
 Thorsten Leemhuis <regressions@leemhuis.info>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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


