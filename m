Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0850BEAB32
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D3210E178;
	Fri, 17 Oct 2025 16:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=lach.pw header.i=@lach.pw header.b="Zsy8CkoL";
	dkim=permerror (0-bit key) header.d=lach.pw header.i=@lach.pw header.b="/wCOTQlk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FA010EC95;
 Fri, 17 Oct 2025 16:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1760718480; bh=FySvhxgkGPeEce3SsSP+zgs
 Qe5XpsgsiK22GvDAXT0k=; b=Zsy8CkoLpRzeAbXtMsK6wQjVizDFWmG3thi/0CONQLus7t9j5U
 JThsjA9WaEZeoVWq1xKeEGOVhDV+EP834vWlBnPDDMeASDoQGcFPUPmFZsW5Ot+cfz5UJ4xgBGT
 iBXETSCf3duhdBMqmjT17cNKBHv/KuycDTBSiDBOyHirN2hOIGs4jAm5m15D817PI00wBEAGQHP
 80Ol+PaCpbh6ewQbXZpJdXWk+72G8mwmcPh1j3x9ks46pR3pLC065KNb2q8uWdKgH2KWCQDm4RP
 +S3/DM+hmsrnXm2JJQlCaNCl8AE43Px6Qo/x4XGSFHXyQIqSWJASjeNInD8FKrMOtuw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1760718480; bh=FySvhxgkGPeEce3SsSP+zgs
 Qe5XpsgsiK22GvDAXT0k=; b=/wCOTQlktcCTumqs5csZjjrMi5y+59YiUCTusdRmhNkAAAb09t
 eGt75Fe5zYX/qe1hgFPI4uSLjhXSU+2ddmDQ==;
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
Subject: [PATCH v5 1/7] drm/edid: rename VESA block parsing functions to more
 generic name
Date: Fri, 17 Oct 2025 18:27:30 +0200
Message-ID: <20251017162736.45368-2-iam@lach.pw>
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

Those functions would also parse DSC Bits Per Pixel value in the future
commits.

Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
---
 drivers/gpu/drm/drm_edid.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e2e85345aa9a..4fcde52291ce 100644
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
@@ -6584,8 +6584,8 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
 		    info->mso_stream_count, info->mso_pixel_overlap);
 }
 
-static void drm_update_mso(struct drm_connector *connector,
-			   const struct drm_edid *drm_edid)
+static void drm_update_vesa_specific_block(struct drm_connector *connector,
+					   const struct drm_edid *drm_edid)
 {
 	const struct displayid_block *block;
 	struct displayid_iter iter;
@@ -6593,7 +6593,7 @@ static void drm_update_mso(struct drm_connector *connector,
 	displayid_iter_edid_begin(drm_edid, &iter);
 	displayid_iter_for_each(block, &iter) {
 		if (block->tag == DATA_BLOCK_2_VENDOR_SPECIFIC)
-			drm_parse_vesa_mso_data(connector, block);
+			drm_parse_vesa_specific_block(connector, block);
 	}
 	displayid_iter_end(&iter);
 }
@@ -6753,7 +6753,7 @@ static void update_display_info(struct drm_connector *connector,
 	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB422)
 		info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
 
-	drm_update_mso(connector, drm_edid);
+	drm_update_vesa_specific_block(connector, drm_edid);
 
 out:
 	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_NON_DESKTOP)) {
-- 
2.51.0
