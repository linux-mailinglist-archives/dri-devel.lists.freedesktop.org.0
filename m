Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3989E21684A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 10:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6391289DCF;
	Tue,  7 Jul 2020 08:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C75E89CAA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 08:24:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8FDD6B12C;
 Tue,  7 Jul 2020 08:24:16 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com, john.p.donnelly@oracle.com,
 lyude@redhat.com
Subject: [PATCH 6/7] drm/mgag200: Rename G200WB prepare/commit function
Date: Tue,  7 Jul 2020 10:24:10 +0200
Message-Id: <20200707082411.6583-7-tzimmermann@suse.de>
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

The prepare and commit helpers for G200WB devices control the BMC.
Rename them accordingly. While at it, also change the passed value's
type to struct mga_device and remove some type upcasting.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 679eb5abe24d..4f9007f1a554 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -745,9 +745,8 @@ static int mgag200_crtc_set_plls(struct mga_device *mdev, long clock)
 	return 0;
 }
 
-static void mga_g200wb_prepare(struct drm_crtc *crtc)
+static void mgag200_g200wb_hold_bmc(struct mga_device *mdev)
 {
-	struct mga_device *mdev = to_mga_device(crtc->dev);
 	u8 tmp;
 	int iter_max;
 
@@ -799,10 +798,9 @@ static void mga_g200wb_prepare(struct drm_crtc *crtc)
 	}
 }
 
-static void mga_g200wb_commit(struct drm_crtc *crtc)
+static void mgag200_g200wb_release_bmc(struct mga_device *mdev)
 {
 	u8 tmp;
-	struct mga_device *mdev = to_mga_device(crtc->dev);
 
 	/* 1- The first step is to ensure that the vrsten and hrsten are set */
 	WREG8(MGAREG_CRTCEXT_INDEX, 1);
@@ -1348,7 +1346,7 @@ static void mga_crtc_prepare(struct drm_crtc *crtc)
 	struct mga_device *mdev = to_mga_device(dev);
 
 	if (mdev->type == G200_WB || mdev->type == G200_EW3)
-		mga_g200wb_prepare(crtc);
+		mgag200_g200wb_hold_bmc(mdev);
 }
 
 /*
@@ -1361,7 +1359,7 @@ static void mga_crtc_commit(struct drm_crtc *crtc)
 	struct mga_device *mdev = to_mga_device(dev);
 
 	if (mdev->type == G200_WB || mdev->type == G200_EW3)
-		mga_g200wb_commit(crtc);
+		mgag200_g200wb_release_bmc(mdev);
 
 	mga_crtc_load_lut(crtc);
 	mgag200_enable_display(mdev);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
