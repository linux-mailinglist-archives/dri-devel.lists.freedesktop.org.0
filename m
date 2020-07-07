Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B667216848
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 10:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2EE89DC1;
	Tue,  7 Jul 2020 08:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6EC89CA0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 08:24:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B4CC8B1B8;
 Tue,  7 Jul 2020 08:24:16 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com, john.p.donnelly@oracle.com,
 lyude@redhat.com
Subject: [PATCH 7/7] drm/mgag200: Inline mga_crtc_{prepare,
 commit}() into enable function
Date: Tue,  7 Jul 2020 10:24:11 +0200
Message-Id: <20200707082411.6583-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707082411.6583-1-tzimmermann@suse.de>
References: <20200707082411.6583-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's only trivial code left in mga_crtc_{prepare,commit}(). Merge the
functions into the simple pipe's enable function.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 39 +++++---------------------
 1 file changed, 7 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 4f9007f1a554..e0d037a7413c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1335,36 +1335,6 @@ static void mgag200_disable_display(struct mga_device *mdev)
 	WREG_ECRT(0x01, crtcext1);
 }
 
-/*
- * This is called before a mode is programmed. A typical use might be to
- * enable DPMS during the programming to avoid seeing intermediate stages,
- * but that's not relevant to us
- */
-static void mga_crtc_prepare(struct drm_crtc *crtc)
-{
-	struct drm_device *dev = crtc->dev;
-	struct mga_device *mdev = to_mga_device(dev);
-
-	if (mdev->type == G200_WB || mdev->type == G200_EW3)
-		mgag200_g200wb_hold_bmc(mdev);
-}
-
-/*
- * This is called after a mode is programmed. It should reverse anything done
- * by the prepare function
- */
-static void mga_crtc_commit(struct drm_crtc *crtc)
-{
-	struct drm_device *dev = crtc->dev;
-	struct mga_device *mdev = to_mga_device(dev);
-
-	if (mdev->type == G200_WB || mdev->type == G200_EW3)
-		mgag200_g200wb_release_bmc(mdev);
-
-	mga_crtc_load_lut(crtc);
-	mgag200_enable_display(mdev);
-}
-
 /*
  * Connector
  */
@@ -1585,7 +1555,8 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 		.y2 = fb->height,
 	};
 
-	mga_crtc_prepare(crtc);
+	if (mdev->type == G200_WB || mdev->type == G200_EW3)
+		mgag200_g200wb_hold_bmc(mdev);
 
 	mgag200_set_format_regs(mdev, fb);
 	mgag200_set_mode_regs(mdev, adjusted_mode);
@@ -1599,7 +1570,11 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	else if (mdev->type == G200_EV)
 		mgag200_g200ev_set_hiprilvl(mdev);
 
-	mga_crtc_commit(crtc);
+	if (mdev->type == G200_WB || mdev->type == G200_EW3)
+		mgag200_g200wb_release_bmc(mdev);
+
+	mga_crtc_load_lut(crtc);
+	mgag200_enable_display(mdev);
 
 	mgag200_handle_damage(mdev, fb, &fullscreen);
 }
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
