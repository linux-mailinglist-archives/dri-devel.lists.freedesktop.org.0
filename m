Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04316C9B40B
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 12:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6314A10E61A;
	Tue,  2 Dec 2025 11:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=lach.pw header.i=@lach.pw header.b="p9eKqXCB";
	dkim=permerror (0-bit key) header.d=lach.pw header.i=@lach.pw header.b="1xMvkWRb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE94210E619;
 Tue,  2 Dec 2025 11:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1764673365; bh=Gl9kuiz7jbxKaBYB2iofJTz
 80qNWbCqFnBqucqQQ3oc=; b=p9eKqXCBJc4TANG3Ay+sRDTt3j0rIlasGtCAPJAFkjnkr/4pYS
 EFagbjxiWkhD9UzGiCHnUynw5AdaYweHA5nn119a5TGxFJNmJDHn5tZDOL4YIV9AoIM/dvRV6aY
 iMNi002C6KZpVyWWxJnoFNCOThN4ILLqG8Tz4SA3JBcz2yg/HDhUaOs12YfP68oltIpb/khygoj
 QccvZvDsPLxCE4quenBwuYMxqSXOIfAY9CWr2lu9/IAL45iGhVcIeb6qxABxf1pk+7zhpVWk61L
 omqnsTvcjrKfxpP8zF0VOWXZOFcZ9toHan17Oqp9RCUryUHVN96wejv4SCJPWIlg+wQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1764673365; bh=Gl9kuiz7jbxKaBYB2iofJTz
 80qNWbCqFnBqucqQQ3oc=; b=1xMvkWRbxqaqQQld0IyIfuKxKgmHfuECJiowHvMbJjW7tizC7T
 1bA6a606A3AJGFKFHRhxpJVkavtrgV++clCg==;
From: Yaroslav Bolyukin <iam@lach.pw>
To: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yaroslav Bolyukin <iam@lach.pw>
Subject: [PATCH v7 4/7] drm/edid: parse DSC DPP passthru support flag for mode
 VII timings
Date: Tue,  2 Dec 2025 12:02:15 +0100
Message-ID: <20251202110218.9212-5-iam@lach.pw>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251202110218.9212-1-iam@lach.pw>
References: <20251202110218.9212-1-iam@lach.pw>
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

For timings v7 block revision >=1, revision field also contains a bit
that indicates that the mode timings should only be used with fixed bits
per pixel value specified in vesa vendor-specific block.

Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
---
 drivers/gpu/drm/drm_displayid_internal.h |  2 ++
 drivers/gpu/drm/drm_edid.c               | 12 ++++++++----
 include/drm/drm_modes.h                  | 10 ++++++++++
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/drm_displayid_internal.h
index 72f107ae832f..724174b429f2 100644
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
index 380a9dda275f..b28ff4bafb1d 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6794,8 +6794,8 @@ static void update_display_info(struct drm_connector *connector,
 }
 
 static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
-							    const struct displayid_detailed_timings_1 *timings,
-							    bool type_7)
+							    const struct displayid_block *block,
+							    const struct displayid_detailed_timings_1 *timings)
 {
 	struct drm_display_mode *mode;
 	unsigned int pixel_clock = (timings->pixel_clock[0] |
@@ -6811,11 +6811,16 @@ static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *d
 	unsigned int vsync_width = le16_to_cpu(timings->vsw) + 1;
 	bool hsync_positive = le16_to_cpu(timings->hsync) & (1 << 15);
 	bool vsync_positive = le16_to_cpu(timings->vsync) & (1 << 15);
+	bool type_7 = block->tag == DATA_BLOCK_2_TYPE_7_DETAILED_TIMING;
 
 	mode = drm_mode_create(dev);
 	if (!mode)
 		return NULL;
 
+	if (type_7 && FIELD_GET(DISPLAYID_BLOCK_REV, block->rev) >= 1)
+		mode->dsc_passthrough_timings_support =
+			block->rev & DISPLAYID_BLOCK_PASSTHROUGH_TIMINGS_SUPPORT;
+
 	/* resolution is kHz for type VII, and 10 kHz for type I */
 	mode->clock = type_7 ? pixel_clock : pixel_clock * 10;
 	mode->hdisplay = hactive;
@@ -6848,7 +6853,6 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
 	int num_timings;
 	struct drm_display_mode *newmode;
 	int num_modes = 0;
-	bool type_7 = block->tag == DATA_BLOCK_2_TYPE_7_DETAILED_TIMING;
 	/* blocks must be multiple of 20 bytes length */
 	if (block->num_bytes % 20)
 		return 0;
@@ -6857,7 +6861,7 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
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
2.51.2
