Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C68C4C88566
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 07:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E167A10E0EF;
	Wed, 26 Nov 2025 06:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=lach.pw header.i=@lach.pw header.b="Ki0m+5Xt";
	dkim=permerror (0-bit key) header.d=lach.pw header.i=@lach.pw header.b="mg9k26IA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6DB10E0EF;
 Wed, 26 Nov 2025 06:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1764139911; bh=5Ao5gy0hMIHL+AsB3ZJORlb
 QMMgBYYxMmt3et4768b4=; b=Ki0m+5XtnzIbZ0sELp2tITGj+7NxiwJEPauqtxa4ISv9AUgskI
 mK/ijCqV/FK/pZ3DP6ivmrpgk0tJywR+K8oVZSQhYdCSJmMhE5RdNmbQnAvGHNS+akgWSJwTtT3
 v0mPXnAjoBHlIFCJljXFdxSw+5sm0g/FLpo6uAouGCoEWD2NwomswI+JOC1rE/ZBd5sWBgyIsH8
 qsVl6BFHlBmYBgrDDnGT6WHEidRQjvnbuwhcMg4Suuz/orm/JsCvyjuRbQJTFW5Fe1azfxwv9tN
 YeMIU/bwahnR+8R/+ybJ9CPaQysaZB0UtLmIgrD15N6XOuRqFJDnT20HACn3q2BKo4A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1764139911; bh=5Ao5gy0hMIHL+AsB3ZJORlb
 QMMgBYYxMmt3et4768b4=; b=mg9k26IA6ASuQUujRSIAV9Ue5+/c99mYHxlH9SgUpAAy1ZPGW4
 bVBElm9kLCSppoQLH2flH98YKY8WanhzOsDg==;
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
Subject: [PATCH v6 1/7] drm/edid: rename VESA block parsing functions to more
 generic name
Date: Wed, 26 Nov 2025 07:51:20 +0100
Message-ID: <20251126065126.54016-2-iam@lach.pw>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251126065126.54016-1-iam@lach.pw>
References: <20251126065126.54016-1-iam@lach.pw>
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

Those functions would also parse DSC Bits Per Pixel value in the future
commits.

Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
---
 drivers/gpu/drm/drm_edid.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 26bb7710a462..64f7a94dd9e4 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6527,8 +6527,8 @@ static void drm_get_monitor_range(struct drm_connector *connector,
 		    info->monitor_range.min_vfreq, info->monitor_range.max_vfreq);
 }
 
-static void drm_parse_vesa_mso_data(struct drm_connector *connector,
-				    const struct displayid_block *block)
+static void drm_parse_vesa_specific_block(struct drm_connector *connector,
+					  const struct displayid_block *block)
 {
 	struct displayid_vesa_vendor_specific_block *vesa =
 		(struct displayid_vesa_vendor_specific_block *)block;
@@ -6587,8 +6587,8 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
 		    info->mso_stream_count, info->mso_pixel_overlap);
 }
 
-static void drm_update_mso(struct drm_connector *connector,
-			   const struct drm_edid *drm_edid)
+static void drm_update_vesa_specific_block(struct drm_connector *connector,
+					   const struct drm_edid *drm_edid)
 {
 	const struct displayid_block *block;
 	struct displayid_iter iter;
@@ -6596,7 +6596,7 @@ static void drm_update_mso(struct drm_connector *connector,
 	displayid_iter_edid_begin(drm_edid, &iter);
 	displayid_iter_for_each(block, &iter) {
 		if (block->tag == DATA_BLOCK_2_VENDOR_SPECIFIC)
-			drm_parse_vesa_mso_data(connector, block);
+			drm_parse_vesa_specific_block(connector, block);
 	}
 	displayid_iter_end(&iter);
 }
@@ -6756,7 +6756,7 @@ static void update_display_info(struct drm_connector *connector,
 	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB422)
 		info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
 
-	drm_update_mso(connector, drm_edid);
+	drm_update_vesa_specific_block(connector, drm_edid);
 
 out:
 	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_NON_DESKTOP)) {
-- 
2.51.2
