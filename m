Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 611F553A3FD
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 13:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25A710E808;
	Wed,  1 Jun 2022 11:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC5410E79E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 11:25:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3BAA421B0F;
 Wed,  1 Jun 2022 11:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654082725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nEwl25VW03++YLjquyLHld++yUa4TNuY28Q0GdQ/+EQ=;
 b=BJtLSC6n8tW1ORKUJ+yG8A0X6jHXt4bJdsxr9sxC7t8rxxILm9W0pJkq6OyN+0JOM2rP12
 mNWhfhRA8+UBkSFv27sO+SACI/CvtsoGCKl+LkAEVMsHdJaNydTNW2VrgiisyJggauTkkl
 h3xllMStBT3+q2+krzizSP3PokVSk60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654082725;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nEwl25VW03++YLjquyLHld++yUa4TNuY28Q0GdQ/+EQ=;
 b=HWrT3hjuYzqkiIq0dQoL6AeMjOamUpGkLrEADGsN8OQUIIDPHjsPZX1W+Rn3nNSqo0UAtD
 f/XTX4+jjJ0K7rBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 164511330F;
 Wed,  1 Jun 2022 11:25:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WKKNBKVMl2JqMQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Jun 2022 11:25:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 08/10] drm/mgag200: Store maximum resolution and memory
 bandwith in device info
Date: Wed,  1 Jun 2022 13:25:20 +0200
Message-Id: <20220601112522.5774-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601112522.5774-1-tzimmermann@suse.de>
References: <20220601112522.5774-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The maximum resolution and memory bandwidth are model-specific limits.
Both are used during display-mode validation. Store the values in struct
mgag200_device_info and simplify the validation code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h     | 15 ++++-
 drivers/gpu/drm/mgag200/mgag200_g200.c    |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c  | 44 ++++++++++++---
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  2 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c    | 69 +++++++----------------
 10 files changed, 77 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index b05becb3d4b7..f0fb13238f4f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -191,6 +191,15 @@ enum mga_type {
 #define IS_G200_SE(mdev) (mdev->type == G200_SE_A || mdev->type == G200_SE_B)
 
 struct mgag200_device_info {
+	u16 max_hdisplay;
+	u16 max_vdisplay;
+
+	/*
+	 * Maximum memory bandwidth (MiB/sec). Setting this to zero disables
+	 * the rsp test during mode validation.
+	 */
+	unsigned long max_mem_bandwidth;
+
 	/*
 	 * HW does not handle 'startadd' register correctly. Always set
 	 * it's value to 0.
@@ -198,8 +207,12 @@ struct mgag200_device_info {
 	bool bug_no_startadd:1;
 };
 
-#define MGAG200_DEVICE_INFO_INIT(_bug_no_startadd) \
+#define MGAG200_DEVICE_INFO_INIT(_max_hdisplay, _max_vdisplay, _max_mem_bandwidth, \
+				 _bug_no_startadd) \
 	{ \
+		.max_hdisplay = (_max_hdisplay), \
+		.max_vdisplay = (_max_vdisplay), \
+		.max_mem_bandwidth = (_max_mem_bandwidth), \
 		.bug_no_startadd = (_bug_no_startadd), \
 	}
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index 90b33a7352e5..4ec1b18ab170 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -34,7 +34,7 @@ static int mgag200_g200_init_pci_options(struct pci_dev *pdev)
  */
 
 static const struct mgag200_device_info mgag200_g200_device_info =
-	MGAG200_DEVICE_INFO_INIT(false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, false);
 
 static void mgag200_g200_interpret_bios(struct mgag200_g200_device *g200,
 					const unsigned char *bios, size_t size)
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index 14bec513e441..a35ba2fdfc0e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -11,7 +11,7 @@
  */
 
 static const struct mgag200_device_info mgag200_g200eh_device_info =
-	MGAG200_DEVICE_INFO_INIT(false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 37500, false);
 
 struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type)
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index c982533de9e7..649559be1482 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -11,7 +11,7 @@
  */
 
 static const struct mgag200_device_info mgag200_g200eh3_device_info =
-	MGAG200_DEVICE_INFO_INIT(false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, false);
 
 struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
 						 const struct drm_driver *drv,
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index d84039eef982..e661fad2f8b2 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -11,7 +11,7 @@
  */
 
 static const struct mgag200_device_info mgag200_g200er_device_info =
-	MGAG200_DEVICE_INFO_INIT(false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 55000, false);
 
 struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type)
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index 14a891d47270..07a3862d69de 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -11,7 +11,7 @@
  */
 
 static const struct mgag200_device_info mgag200_g200ev_device_info =
-	MGAG200_DEVICE_INFO_INIT(false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 32700, false);
 
 struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type)
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index b09f345ba29b..7f3987435085 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -11,7 +11,7 @@
  */
 
 static const struct mgag200_device_info mgag200_g200ew3_device_info =
-	MGAG200_DEVICE_INFO_INIT(false);
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, false);
 
 static resource_size_t mgag200_g200ew3_device_probe_vram(struct mga_device *mdev)
 {
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index 9c0fc57366f2..78120470b7be 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -32,21 +32,37 @@ static int mgag200_g200se_init_pci_options(struct pci_dev *pdev)
  * DRM device
  */
 
-static const struct mgag200_device_info mgag200_g200se_a_device_info =
-	MGAG200_DEVICE_INFO_INIT(true);
+static const struct mgag200_device_info mgag200_g200se_a_01_device_info =
+	MGAG200_DEVICE_INFO_INIT(1600, 1200, 24400, true);
 
-static const struct mgag200_device_info mgag200_g200se_b_device_info =
-	MGAG200_DEVICE_INFO_INIT(false);
+static const struct mgag200_device_info mgag200_g200se_a_02_device_info =
+	MGAG200_DEVICE_INFO_INIT(1920, 1200, 30100, true);
 
-static void mgag200_g200se_init_unique_id(struct mgag200_g200se_device *g200se)
+static const struct mgag200_device_info mgag200_g200se_a_03_device_info =
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 55000, false);
+
+static const struct mgag200_device_info mgag200_g200se_b_01_device_info =
+	MGAG200_DEVICE_INFO_INIT(1600, 1200, 24400, false);
+
+static const struct mgag200_device_info mgag200_g200se_b_02_device_info =
+	MGAG200_DEVICE_INFO_INIT(1920, 1200, 30100, false);
+
+static const struct mgag200_device_info mgag200_g200se_b_03_device_info =
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 55000, false);
+
+static int mgag200_g200se_init_unique_rev_id(struct mgag200_g200se_device *g200se)
 {
 	struct mga_device *mdev = &g200se->base;
 	struct drm_device *dev = &mdev->base;
 
 	/* stash G200 SE model number for later use */
 	g200se->unique_rev_id = RREG32(0x1e24);
+	if (!g200se->unique_rev_id)
+		return -ENODEV;
 
 	drm_dbg(dev, "G200 SE unique revision id is 0x%x\n", g200se->unique_rev_id);
+
+	return 0;
 }
 
 struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
@@ -75,14 +91,26 @@ struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const stru
 	if (ret)
 		return ERR_PTR(ret);
 
-	mgag200_g200se_init_unique_id(g200se);
+	ret = mgag200_g200se_init_unique_rev_id(g200se);
+	if (ret)
+		return ERR_PTR(ret);
 
 	switch (type) {
 	case G200_SE_A:
-		info = &mgag200_g200se_a_device_info;
+		if (g200se->unique_rev_id >= 0x03)
+			info = &mgag200_g200se_a_03_device_info;
+		else if (g200se->unique_rev_id >= 0x02)
+			info = &mgag200_g200se_a_02_device_info;
+		else
+			info = &mgag200_g200se_a_01_device_info;
 		break;
 	case G200_SE_B:
-		info = &mgag200_g200se_b_device_info;
+		if (g200se->unique_rev_id >= 0x03)
+			info = &mgag200_g200se_b_03_device_info;
+		else if (g200se->unique_rev_id >= 0x02)
+			info = &mgag200_g200se_b_02_device_info;
+		else
+			info = &mgag200_g200se_b_01_device_info;
 		break;
 	default:
 		return ERR_PTR(-EINVAL);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index c9bf2176726e..0943ad2a9999 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -11,7 +11,7 @@
  */
 
 static const struct mgag200_device_info mgag200_g200wb_device_info =
-	MGAG200_DEVICE_INFO_INIT(false);
+	MGAG200_DEVICE_INFO_INIT(1280, 1024, 31877, false);
 
 struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const struct drm_driver *drv,
 						enum mga_type type)
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index f5e1a89e0bfe..aa85558faa1b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -725,30 +725,17 @@ static enum drm_mode_status
 mgag200_simple_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
 				       const struct drm_display_mode *mode)
 {
-	struct drm_device *dev = pipe->crtc.dev;
-	struct mga_device *mdev = to_mga_device(dev);
-	struct mgag200_g200se_device *g200se;
-
-	if (IS_G200_SE(mdev)) {
-		g200se = to_mgag200_g200se_device(dev);
-
-		if (g200se->unique_rev_id == 0x01) {
-			if (mode->hdisplay > 1600)
-				return MODE_VIRTUAL_X;
-			if (mode->vdisplay > 1200)
-				return MODE_VIRTUAL_Y;
-		} else if (g200se->unique_rev_id == 0x02) {
-			if (mode->hdisplay > 1920)
-				return MODE_VIRTUAL_X;
-			if (mode->vdisplay > 1200)
-				return MODE_VIRTUAL_Y;
-		}
-	} else if (mdev->type == G200_WB) {
-		if (mode->hdisplay > 1280)
-			return MODE_VIRTUAL_X;
-		if (mode->vdisplay > 1024)
-			return MODE_VIRTUAL_Y;
-	}
+	struct mga_device *mdev = to_mga_device(pipe->crtc.dev);
+	const struct mgag200_device_info *info = mdev->info;
+
+	/*
+	 * Some devices have additional limits on the size of the
+	 * display mode.
+	 */
+	if (mode->hdisplay > info->max_hdisplay)
+		return MODE_VIRTUAL_X;
+	if (mode->vdisplay > info->max_vdisplay)
+		return MODE_VIRTUAL_Y;
 
 	if ((mode->hdisplay % 8) != 0 || (mode->hsync_start % 8) != 0 ||
 	    (mode->hsync_end % 8) != 0 || (mode->htotal % 8) != 0) {
@@ -1028,7 +1015,7 @@ static enum drm_mode_status mgag200_mode_config_mode_valid(struct drm_device *de
 	static const unsigned int max_bpp = 4; // DRM_FORMAT_XRGB8888
 	struct mga_device *mdev = to_mga_device(dev);
 	unsigned long fbsize, fbpages, max_fbpages;
-	struct mgag200_g200se_device *g200se;
+	const struct mgag200_device_info *info = mdev->info;
 
 	max_fbpages = mdev->vram_available >> PAGE_SHIFT;
 
@@ -1038,30 +1025,14 @@ static enum drm_mode_status mgag200_mode_config_mode_valid(struct drm_device *de
 	if (fbpages > max_fbpages)
 		return MODE_MEM;
 
-	if (IS_G200_SE(mdev)) {
-		g200se = to_mgag200_g200se_device(dev);
-
-		if (g200se->unique_rev_id == 0x01) {
-			if (mgag200_calculate_mode_bandwidth(mode, max_bpp * 8) > (24400 * 1024))
-				return MODE_BAD;
-		} else if (g200se->unique_rev_id == 0x02) {
-			if (mgag200_calculate_mode_bandwidth(mode, max_bpp * 8) > (30100 * 1024))
-				return MODE_BAD;
-		} else {
-			if (mgag200_calculate_mode_bandwidth(mode, max_bpp * 8) > (55000 * 1024))
-				return MODE_BAD;
-		}
-	} else if (mdev->type == G200_WB) {
-		if (mgag200_calculate_mode_bandwidth(mode, max_bpp * 8) > (31877 * 1024))
-			return MODE_BAD;
-	} else if (mdev->type == G200_EV) {
-		if (mgag200_calculate_mode_bandwidth(mode, max_bpp * 8) > (32700 * 1024))
-			return MODE_BAD;
-	} else if (mdev->type == G200_EH) {
-		if (mgag200_calculate_mode_bandwidth(mode, max_bpp * 8) > (37500 * 1024))
-			return MODE_BAD;
-	} else if (mdev->type == G200_ER) {
-		if (mgag200_calculate_mode_bandwidth(mode, max_bpp * 8) > (55000 * 1024))
+	/*
+	 * Test the mode's required memory bandwidth if the device
+	 * specifies a maximum. Not all devices do though.
+	 */
+	if (info->max_mem_bandwidth) {
+		uint32_t mode_bandwidth = mgag200_calculate_mode_bandwidth(mode, max_bpp * 8);
+
+		if (mode_bandwidth > (info->max_mem_bandwidth * 1024))
 			return MODE_BAD;
 	}
 
-- 
2.36.1

