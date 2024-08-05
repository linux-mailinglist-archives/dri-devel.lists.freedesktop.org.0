Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE719480D4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 19:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1DF10E272;
	Mon,  5 Aug 2024 17:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tz0J7xAU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A8A10E272
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 17:57:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A3B6F60DDE;
 Mon,  5 Aug 2024 17:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F47C32782;
 Mon,  5 Aug 2024 17:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722880659;
 bh=Z2Wnr6wo32Vo1wK84djG26QZ2MkW4rpb3IxbvO7gIGY=;
 h=From:To:Cc:Subject:Date:From;
 b=tz0J7xAUuz84HslYf1b1UuNRP7fGUZCP9rSSeZiclS2QSxRtIRddhU1Rszsj35oBH
 FO7TSbJrw6YYLyuNxC0D33cV8RdoiZ0sgeWFACQtwX5mYTVjH0RpK9uQZt5HQqA3hn
 TmO3bQ7wSfQ8z79f/bacdBbBwlzyGR14aQ452cgSY58tT8X21KJtAbOLefopez9gg9
 K20aCsledewH/m8M4ajBxn4dMRDrxrIX9uGx2li4b8gugqV9I45U3sK4vu1EQRhhwb
 zFqMRzFEadTyxXAne68ilx0VW2NOwuhVdrRKH88XSV22+REAbEzaXgRSvTy3lshH8z
 GrTdxhglOFNFw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Yudong Wang <yudong.wang@intel.com>, Maarten@freedesktop.org,
	Lankhorst@freedesktop.org, maarten.lankhorst@linux.intel.com,
	Sasha Levin <sashal@kernel.org>, mripard@kernel.org,
	airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 01/15] drm/fb-helper: Don't schedule_work() to
 flush frame buffer during panic()
Date: Mon,  5 Aug 2024 13:56:58 -0400
Message-ID: <20240805175736.3252615-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.44
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>

[ Upstream commit 833cd3e9ad8360785b6c23c82dd3856df00732d9 ]

Sometimes the system [1] hangs on x86 I/O machine checks. However, the
expected behavior is to reboot the system, as the machine check handler
ultimately triggers a panic(), initiating a reboot in the last step.

The root cause is that sometimes the panic() is blocked when
drm_fb_helper_damage() invoking schedule_work() to flush the frame buffer.
This occurs during the process of flushing all messages to the frame
buffer driver as shown in the following call trace:

  Machine check occurs [2]:
    panic()
      console_flush_on_panic()
        console_flush_all()
          console_emit_next_record()
            con->write()
              vt_console_print()
                hide_cursor()
                  vc->vc_sw->con_cursor()
                    fbcon_cursor()
                      ops->cursor()
                        bit_cursor()
                          soft_cursor()
                            info->fbops->fb_imageblit()
                              drm_fbdev_generic_defio_imageblit()
                                drm_fb_helper_damage_area()
                                  drm_fb_helper_damage()
                                    schedule_work() // <--- blocked here
    ...
    emergency_restart()  // wasn't invoked, so no reboot.

During panic(), except the panic CPU, all the other CPUs are stopped.
In schedule_work(), the panic CPU requires the lock of worker_pool to
queue the work on that pool, while the lock may have been token by some
other stopped CPU. So schedule_work() is blocked.

Additionally, during a panic(), since there is no opportunity to execute
any scheduled work, it's safe to fix this issue by skipping schedule_work()
on 'oops_in_progress' in drm_fb_helper_damage().

[1] Enable the kernel option CONFIG_FRAMEBUFFER_CONSOLE,
    CONFIG_DRM_FBDEV_EMULATION, and boot with the 'console=tty0'
    kernel command line parameter.

[2] Set 'panic_timeout' to a non-zero value before calling panic().

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reported-by: Yudong Wang <yudong.wang@intel.com>
Tested-by: Yudong Wang <yudong.wang@intel.com>
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240703141737.75378-1-qiuxu.zhuo@intel.com
Signed-off-by: Maarten Lankhorst,,, <maarten.lankhorst@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_fb_helper.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 117237d3528bd..618b045230336 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -631,6 +631,17 @@ static void drm_fb_helper_add_damage_clip(struct drm_fb_helper *helper, u32 x, u
 static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
 				 u32 width, u32 height)
 {
+	/*
+	 * This function may be invoked by panic() to flush the frame
+	 * buffer, where all CPUs except the panic CPU are stopped.
+	 * During the following schedule_work(), the panic CPU needs
+	 * the worker_pool lock, which might be held by a stopped CPU,
+	 * causing schedule_work() and panic() to block. Return early on
+	 * oops_in_progress to prevent this blocking.
+	 */
+	if (oops_in_progress)
+		return;
+
 	drm_fb_helper_add_damage_clip(helper, x, y, width, height);
 
 	schedule_work(&helper->damage_work);
-- 
2.43.0

