Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0DB22100C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 16:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB5B6EB7B;
	Wed, 15 Jul 2020 14:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29D86EB75
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 14:59:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 110E0AF62;
 Wed, 15 Jul 2020 14:59:13 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, sam@ravnborg.org,
 emil.velikov@collabora.com, lyude@redhat.com, krzk@kernel.org,
 john.p.donnelly@Oracle.com, rong.a.chen@intel.com, kraxel@redhat.com,
 eich@suse.com, tiwai@suse.de
Subject: [PATCH 7/8] drm/mgag200: Move G200SE's unique id into model-specific
 data
Date: Wed, 15 Jul 2020 16:59:01 +0200
Message-Id: <20200715145902.13122-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715145902.13122-1-tzimmermann@suse.de>
References: <20200715145902.13122-1-tzimmermann@suse.de>
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

The unique revision id is only useful for G200SE devices. Store the
value in model-specific data within struct mga_device. While at it,
the patch also adds an init helper for the value.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c  | 19 +++++++++++++------
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  8 ++++++--
 drivers/gpu/drm/mgag200/mgag200_mode.c | 18 +++++++++++-------
 3 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index ac9ac5b6d587..f7652e16365c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -115,6 +115,17 @@ static int mgag200_regs_init(struct mga_device *mdev)
 	return 0;
 }
 
+static void mgag200_g200se_init_unique_id(struct mga_device *mdev)
+{
+	struct drm_device *dev = &mdev->base;
+
+	/* stash G200 SE model number for later use */
+	mdev->model.g200se.unique_rev_id = RREG32(0x1e24);
+
+	drm_dbg(dev, "G200 SE unique revision id is 0x%x\n",
+		mdev->model.g200se.unique_rev_id);
+}
+
 static int mgag200_device_init(struct mga_device *mdev, unsigned long flags)
 {
 	struct drm_device *dev = &mdev->base;
@@ -127,12 +138,8 @@ static int mgag200_device_init(struct mga_device *mdev, unsigned long flags)
 	if (ret)
 		return ret;
 
-	/* stash G200 SE model number for later use */
-	if (IS_G200_SE(mdev)) {
-		mdev->unique_rev_id = RREG32(0x1e24);
-		drm_dbg(dev, "G200 SE unique revision id is 0x%x\n",
-			mdev->unique_rev_id);
-	}
+	if (IS_G200_SE(mdev))
+		mgag200_g200se_init_unique_id(mdev);
 
 	ret = mgag200_mm_init(mdev);
 	if (ret)
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 819c03cc626b..048efe635aff 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -166,8 +166,12 @@ struct mga_device {
 
 	int fb_mtrr;
 
-	/* SE model number stored in reg 0x1e24 */
-	u32 unique_rev_id;
+	union {
+		struct {
+			/* SE model number stored in reg 0x1e24 */
+			u32 unique_rev_id;
+		} g200se;
+	} model;
 
 	struct mga_connector connector;
 	struct drm_simple_display_pipe display_pipe;
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 4fa64cf884cb..752409c7f326 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -112,6 +112,7 @@ static inline void mga_wait_busy(struct mga_device *mdev)
 
 static int mga_g200se_set_plls(struct mga_device *mdev, long clock)
 {
+	u32 unique_rev_id = mdev->model.g200se.unique_rev_id;
 	unsigned int vcomax, vcomin, pllreffreq;
 	unsigned int delta, tmpdelta, permitteddelta;
 	unsigned int testp, testm, testn;
@@ -121,7 +122,7 @@ static int mga_g200se_set_plls(struct mga_device *mdev, long clock)
 	unsigned int fvv;
 	unsigned int i;
 
-	if (mdev->unique_rev_id <= 0x03) {
+	if (unique_rev_id <= 0x03) {
 
 		m = n = p = 0;
 		vcomax = 320000;
@@ -219,7 +220,7 @@ static int mga_g200se_set_plls(struct mga_device *mdev, long clock)
 	WREG_DAC(MGA1064_PIX_PLLC_N, n);
 	WREG_DAC(MGA1064_PIX_PLLC_P, p);
 
-	if (mdev->unique_rev_id >= 0x04) {
+	if (unique_rev_id >= 0x04) {
 		WREG_DAC(0x1a, 0x09);
 		msleep(20);
 		WREG_DAC(0x1a, 0x01);
@@ -1183,12 +1184,13 @@ static void mgag200_g200se_set_hiprilvl(struct mga_device *mdev,
 					const struct drm_display_mode *mode,
 					const struct drm_framebuffer *fb)
 {
+	u32 unique_rev_id = mdev->model.g200se.unique_rev_id;
 	unsigned int hiprilvl;
 	u8 crtcext6;
 
-	if  (mdev->unique_rev_id >= 0x04) {
+	if  (unique_rev_id >= 0x04) {
 		hiprilvl = 0;
-	} else if (mdev->unique_rev_id >= 0x02) {
+	} else if (unique_rev_id >= 0x02) {
 		unsigned int bpp;
 		unsigned long mb;
 
@@ -1213,7 +1215,7 @@ static void mgag200_g200se_set_hiprilvl(struct mga_device *mdev,
 		else
 			hiprilvl = 5;
 
-	} else if (mdev->unique_rev_id >= 0x01) {
+	} else if (unique_rev_id >= 0x01) {
 		hiprilvl = 3;
 	} else {
 		hiprilvl = 4;
@@ -1337,7 +1339,9 @@ static enum drm_mode_status mga_vga_mode_valid(struct drm_connector *connector,
 	int bpp = 32;
 
 	if (IS_G200_SE(mdev)) {
-		if (mdev->unique_rev_id == 0x01) {
+		u32 unique_rev_id = mdev->model.g200se.unique_rev_id;
+
+		if (unique_rev_id == 0x01) {
 			if (mode->hdisplay > 1600)
 				return MODE_VIRTUAL_X;
 			if (mode->vdisplay > 1200)
@@ -1345,7 +1349,7 @@ static enum drm_mode_status mga_vga_mode_valid(struct drm_connector *connector,
 			if (mga_vga_calculate_mode_bandwidth(mode, bpp)
 				> (24400 * 1024))
 				return MODE_BANDWIDTH;
-		} else if (mdev->unique_rev_id == 0x02) {
+		} else if (unique_rev_id == 0x02) {
 			if (mode->hdisplay > 1920)
 				return MODE_VIRTUAL_X;
 			if (mode->vdisplay > 1200)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
