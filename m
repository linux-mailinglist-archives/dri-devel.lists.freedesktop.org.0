Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEBDBEAB1B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F3C10EC7E;
	Fri, 17 Oct 2025 16:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=lach.pw header.i=@lach.pw header.b="dFqX/jqh";
	dkim=permerror (0-bit key) header.d=lach.pw header.i=@lach.pw header.b="cSUrRgf+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6358A10EC7E;
 Fri, 17 Oct 2025 16:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1760718485; bh=NufhvGOUoGO8cO2DoILbVLI
 HbV3cGuMJ3y4xsqaQ+zo=; b=dFqX/jqhjM2Xic9smDGCkjeuDc9Rf7mmSsYfpZBYY5W+Fnqqse
 VHepF+REDFoxAmbSDPtLHxio1J3BmmQGT9P917MeIuuBeSR7p9vIXS5nHwSqLpdrO35IAzqcign
 +5FeB+82hCjfaWP0IdW5TCh1KD6LMGH5s1PEAm/300EhUOkisGTWh+R5Y3zvM48ts7EChiLuVCL
 TkcB8L8gnWcg5ONYl4zyAwVjgi25+pjF1y9Ww1dsl2AnIuXkmanabF1kW+AVSSh/+bpxmyCYaqo
 1Dn/ZGPHAl9b81DWOptY+XF1qycYsoILCqCNFIUWVZTfUABLj0kz77Vx4BiDRqFo5dQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1760718485; bh=NufhvGOUoGO8cO2DoILbVLI
 HbV3cGuMJ3y4xsqaQ+zo=; b=cSUrRgf+C4c+M0zvyGZzi1FYQXF0KiF0sYpJbqGQSvgBBSUwo8
 fZjf9qMETL1SzE2KXDdo3XSwdCem61esjZCg==;
From: Yaroslav Bolyukin <iam@lach.pw>
To: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
Subject: [PATCH v5 4/7] drm/edid: parse DSC DPP passthru support flag for mode
 VII timings
Date: Fri, 17 Oct 2025 18:27:33 +0200
Message-ID: <20251017162736.45368-5-iam@lach.pw>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017162736.45368-1-iam@lach.pw>
References: <20251017162736.45368-1-iam@lach.pw>
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

Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
---
 drivers/gpu/drm/drm_displayid_internal.h |  2 ++
 drivers/gpu/drm/drm_edid.c               | 12 ++++++++----
 include/drm/drm_modes.h                  | 10 ++++++++++
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/drm_displayid_internal.h
index cf02647b41b4..8ea20b1c6921 100644
--- a/drivers/gpu/drm/drm_displayid_internal.h
+++ b/drivers/gpu/drm/drm_displayid_internal.h
@@ -97,6 +97,7 @@ struct displayid_header {
 	u8 ext_count;
 } __packed;
 
+#define DISPLAYID_BLOCK_REV	GENMASK(2, 0)
 struct displayid_block {
 	u8 tag;
 	u8 rev;
@@ -125,6 +126,7 @@ struct displayid_detailed_timings_1 {
 	__le16 vsw;
 } __packed;
 
+#define DISPLAYID_BLOCK_PASSTHROUGH_TIMINGS_SUPPORT	BIT(3)
 struct displayid_detailed_timing_block {
 	struct displayid_block base;
 	struct displayid_detailed_timings_1 timings[];
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 13df2854617c..a1dc4331c4cb 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6789,8 +6789,8 @@ static void update_display_info(struct drm_connector *connector,
 }
 
 static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
-							    const struct displayid_detailed_timings_1 *timings,
-							    bool type_7)
+							    const struct displayid_block *block,
+							    const struct displayid_detailed_timings_1 *timings)
 {
 	struct drm_display_mode *mode;
 	unsigned int pixel_clock = (timings->pixel_clock[0] |
@@ -6806,11 +6806,16 @@ static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *d
 	unsigned int vsync_width = le16_to_cpu(timings->vsw) + 1;
 	bool hsync_positive = le16_to_cpu(timings->hsync) & (1 << 15);
 	bool vsync_positive = le16_to_cpu(timings->vsync) & (1 << 15);
+	bool type_7 = block->tag == DATA_BLOCK_2_TYPE_7_DETAILED_TIMING;
 
 	mode = drm_mode_create(dev);
 	if (!mode)
 		return NULL;
 
+	if (type_7 && FIELD_GET(DISPLAYID_BLOCK_REV, block->rev) >= 1)
+		mode->dsc_passthrough_timings_support =
+			!!(block->rev & DISPLAYID_BLOCK_PASSTHROUGH_TIMINGS_SUPPORT);
+
 	/* resolution is kHz for type VII, and 10 kHz for type I */
 	mode->clock = type_7 ? pixel_clock : pixel_clock * 10;
 	mode->hdisplay = hactive;
@@ -6843,7 +6848,6 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
 	int num_timings;
 	struct drm_display_mode *newmode;
 	int num_modes = 0;
-	bool type_7 = block->tag == DATA_BLOCK_2_TYPE_7_DETAILED_TIMING;
 	/* blocks must be multiple of 20 bytes length */
 	if (block->num_bytes % 20)
 		return 0;
@@ -6852,7 +6856,7 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
 	for (i = 0; i < num_timings; i++) {
 		struct displayid_detailed_timings_1 *timings = &det->timings[i];
 
-		newmode = drm_mode_displayid_detailed(connector->dev, timings, type_7);
+		newmode = drm_mode_displayid_detailed(connector->dev, block, timings);
 		if (!newmode)
 			continue;
 
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
