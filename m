Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3A7BE115F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 02:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CC110E8FF;
	Thu, 16 Oct 2025 00:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=lach.pw header.i=@lach.pw header.b="hyUqiB+O";
	dkim=permerror (0-bit key) header.d=lach.pw header.i=@lach.pw header.b="FG83ejWc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0898C10E8FF;
 Thu, 16 Oct 2025 00:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1760573489; bh=+SemiRcUaSB7Nrev6CNie0b
 OSyZVRYn3Wqgm2UiyIHg=; b=hyUqiB+OAijUuOcm6iBfk0ma2quv/H3yEzCoQRox7YcgrtnOmC
 ubptgzUYdkV+toGiY2F/qkqXQHvRZeTu+146aq+KOzagXGKFeO6FNrx5zaXI7wmUkx7jGYanCMB
 r3SlfYXFw+5SU+AiivJ1AnPi205+IKy2SUxfo00sFgmExl87x1IT/sLnDyzlUkc/+oYEj19nqjz
 Z7OAmqyIaZ004/SNnRIl0TfFjHfNaBHeFwdIZbFJMRZs3E9g0rW2SEKPce6U5H3t5tRyha9stQP
 /AoToUqyE3HBU/HuoazUZ4hMcHonlLdWlG9oLwQfQXsZKxg1W+SV74oFRzb75H/uvXQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1760573489; bh=+SemiRcUaSB7Nrev6CNie0b
 OSyZVRYn3Wqgm2UiyIHg=; b=FG83ejWc5WjmYJMMRX+/FDs57bmoVDpwgvls5EUgVBLoMwQF+F
 6/2aLXXFIc/8jmzmiw61Kiqj2T57QLfaq1Dw==;
From: Yaroslav Bolyukin <iam@lach.pw>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yaroslav Bolyukin <iam@lach.pw>
Subject: [PATCH v4 1/2] drm/edid: parse DRM VESA dsc bpp target
Date: Thu, 16 Oct 2025 02:10:39 +0200
Message-ID: <20251016001038.13611-4-iam@lach.pw>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016001038.13611-2-iam@lach.pw>
References: <20251016001038.13611-2-iam@lach.pw>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As per DisplayID v2.0 Errata E9 spec "DSC pass-through timing support"
VESA vendor-specific data block may contain target DSC bits per pixel
fields

Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
---
 drivers/gpu/drm/drm_displayid_internal.h |  8 ++++
 drivers/gpu/drm/drm_edid.c               | 61 ++++++++++++++++--------
 include/drm/drm_connector.h              |  6 +++
 include/drm/drm_modes.h                  | 10 ++++
 4 files changed, 64 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/drm_displayid_internal.h
index 957dd0619f5c..d008a98994bb 100644
--- a/drivers/gpu/drm/drm_displayid_internal.h
+++ b/drivers/gpu/drm/drm_displayid_internal.h
@@ -97,6 +97,10 @@ struct displayid_header {
 	u8 ext_count;
 } __packed;
 
+#define DISPLAYID_BLOCK_REV				GENMASK(2, 0)
+#define DISPLAYID_BLOCK_PASSTHROUGH_TIMINGS_SUPPORT	BIT(3)
+#define DISPLAYID_BLOCK_DESCRIPTOR_PAYLOAD_BYTES	GENMASK(6, 4)
+
 struct displayid_block {
 	u8 tag;
 	u8 rev;
@@ -144,12 +148,16 @@ struct displayid_formula_timing_block {
 
 #define DISPLAYID_VESA_MSO_OVERLAP	GENMASK(3, 0)
 #define DISPLAYID_VESA_MSO_MODE		GENMASK(6, 5)
+#define DISPLAYID_VESA_DSC_BPP_INT	GENMASK(5, 0)
+#define DISPLAYID_VESA_DSC_BPP_FRACT	GENMASK(3, 0)
 
 struct displayid_vesa_vendor_specific_block {
 	struct displayid_block base;
 	u8 oui[3];
 	u8 data_structure_type;
 	u8 mso;
+	u8 dsc_bpp_int;
+	u8 dsc_bpp_fract;
 } __packed;
 
 /*
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e2e85345aa9a..6e42e55b41f9 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6524,8 +6524,8 @@ static void drm_get_monitor_range(struct drm_connector *connector,
 		    info->monitor_range.min_vfreq, info->monitor_range.max_vfreq);
 }
 
-static void drm_parse_vesa_mso_data(struct drm_connector *connector,
-				    const struct displayid_block *block)
+static void drm_parse_vesa_specific_block(struct drm_connector *connector,
+					  const struct displayid_block *block)
 {
 	struct displayid_vesa_vendor_specific_block *vesa =
 		(struct displayid_vesa_vendor_specific_block *)block;
@@ -6541,7 +6541,7 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
 	if (oui(vesa->oui[0], vesa->oui[1], vesa->oui[2]) != VESA_IEEE_OUI)
 		return;
 
-	if (sizeof(*vesa) != sizeof(*block) + block->num_bytes) {
+	if (block->num_bytes < 5) {
 		drm_dbg_kms(connector->dev,
 			    "[CONNECTOR:%d:%s] Unexpected VESA vendor block size\n",
 			    connector->base.id, connector->name);
@@ -6564,28 +6564,40 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
 		break;
 	}
 
-	if (!info->mso_stream_count) {
-		info->mso_pixel_overlap = 0;
-		return;
-	}
+	info->mso_pixel_overlap = 0;
 
-	info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
-	if (info->mso_pixel_overlap > 8) {
-		drm_dbg_kms(connector->dev,
-			    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
-			    connector->base.id, connector->name,
-			    info->mso_pixel_overlap);
-		info->mso_pixel_overlap = 8;
+	if (info->mso_stream_count) {
+		info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
+		if (info->mso_pixel_overlap > 8) {
+			drm_dbg_kms(connector->dev,
+				    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
+				    connector->base.id, connector->name,
+				    info->mso_pixel_overlap);
+			info->mso_pixel_overlap = 8;
+		}
 	}
 
 	drm_dbg_kms(connector->dev,
 		    "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap %u\n",
 		    connector->base.id, connector->name,
 		    info->mso_stream_count, info->mso_pixel_overlap);
+
+	if (block->num_bytes < 7) {
+		/* DSC bpp is optional */
+		return;
+	}
+
+	info->dp_dsc_bpp = FIELD_GET(DISPLAYID_VESA_DSC_BPP_INT, vesa->dsc_bpp_int) << 4 |
+			   FIELD_GET(DISPLAYID_VESA_DSC_BPP_FRACT, vesa->dsc_bpp_fract);
+
+	drm_dbg_kms(connector->dev,
+		    "[CONNECTOR:%d:%s] DSC bits per pixel %u\n",
+		    connector->base.id, connector->name,
+		    info->dp_dsc_bpp);
 }
 
-static void drm_update_mso(struct drm_connector *connector,
-			   const struct drm_edid *drm_edid)
+static void drm_update_vesa_specific_block(struct drm_connector *connector,
+					   const struct drm_edid *drm_edid)
 {
 	const struct displayid_block *block;
 	struct displayid_iter iter;
@@ -6593,7 +6605,7 @@ static void drm_update_mso(struct drm_connector *connector,
 	displayid_iter_edid_begin(drm_edid, &iter);
 	displayid_iter_for_each(block, &iter) {
 		if (block->tag == DATA_BLOCK_2_VENDOR_SPECIFIC)
-			drm_parse_vesa_mso_data(connector, block);
+			drm_parse_vesa_specific_block(connector, block);
 	}
 	displayid_iter_end(&iter);
 }
@@ -6630,6 +6642,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
 	info->mso_stream_count = 0;
 	info->mso_pixel_overlap = 0;
 	info->max_dsc_bpp = 0;
+	info->dp_dsc_bpp = 0;
 
 	kfree(info->vics);
 	info->vics = NULL;
@@ -6753,7 +6766,7 @@ static void update_display_info(struct drm_connector *connector,
 	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB422)
 		info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
 
-	drm_update_mso(connector, drm_edid);
+	drm_update_vesa_specific_block(connector, drm_edid);
 
 out:
 	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_NON_DESKTOP)) {
@@ -6784,7 +6797,8 @@ static void update_display_info(struct drm_connector *connector,
 
 static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
 							    const struct displayid_detailed_timings_1 *timings,
-							    bool type_7)
+							    bool type_7,
+							    int rev)
 {
 	struct drm_display_mode *mode;
 	unsigned int pixel_clock = (timings->pixel_clock[0] |
@@ -6805,6 +6819,10 @@ static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *d
 	if (!mode)
 		return NULL;
 
+	if (type_7 && FIELD_GET(DISPLAYID_BLOCK_REV, rev) >= 1)
+		mode->dsc_passthrough_timings_support =
+			!!(rev & DISPLAYID_BLOCK_PASSTHROUGH_TIMINGS_SUPPORT);
+
 	/* resolution is kHz for type VII, and 10 kHz for type I */
 	mode->clock = type_7 ? pixel_clock : pixel_clock * 10;
 	mode->hdisplay = hactive;
@@ -6846,7 +6864,7 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
 	for (i = 0; i < num_timings; i++) {
 		struct displayid_detailed_timings_1 *timings = &det->timings[i];
 
-		newmode = drm_mode_displayid_detailed(connector->dev, timings, type_7);
+		newmode = drm_mode_displayid_detailed(connector->dev, timings, type_7, block->rev);
 		if (!newmode)
 			continue;
 
@@ -6893,7 +6911,8 @@ static int add_displayid_formula_modes(struct drm_connector *connector,
 	struct drm_display_mode *newmode;
 	int num_modes = 0;
 	bool type_10 = block->tag == DATA_BLOCK_2_TYPE_10_FORMULA_TIMING;
-	int timing_size = 6 + ((formula_block->base.rev & 0x70) >> 4);
+	int timing_size = 6 +
+		FIELD_GET(DISPLAYID_BLOCK_DESCRIPTOR_PAYLOAD_BYTES, formula_block->base.rev);
 
 	/* extended blocks are not supported yet */
 	if (timing_size != 6)
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..01640fcf7464 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -837,6 +837,12 @@ struct drm_display_info {
 	 */
 	u32 max_dsc_bpp;
 
+	/**
+	 * @dp_dsc_bpp: DP Display-Stream-Compression (DSC) timing's target
+	 * DSC bits per pixel in 6.4 fixed point format. 0 means undefined.
+	 */
+	u16 dp_dsc_bpp;
+
 	/**
 	 * @vics: Array of vics_len VICs. Internal to EDID parsing.
 	 */
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index b9bb92e4b029..312e5c03af9a 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -417,6 +417,16 @@ struct drm_display_mode {
 	 */
 	enum hdmi_picture_aspect picture_aspect_ratio;
 
+	/**
+	 * @dsc_passthrough_timing_support:
+	 *
+	 * Indicates whether this mode timing descriptor is supported
+	 * with specific target DSC bits per pixel only.
+	 *
+	 * VESA vendor-specific data block shall exist with the relevant
+	 * DSC bits per pixel declaration when this flag is set to true.
+	 */
+	bool dsc_passthrough_timings_support;
 };
 
 /**
-- 
2.51.0
