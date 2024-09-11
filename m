Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4796975C89
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 23:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2DC10EAB9;
	Wed, 11 Sep 2024 21:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eSPsclrp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2392810EAB4;
 Wed, 11 Sep 2024 21:35:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 064DA5C076E;
 Wed, 11 Sep 2024 21:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49768C4CEC0;
 Wed, 11 Sep 2024 21:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726090558;
 bh=nhODxcM1QURNsOFuZKCavh92pNBFM1nsGs7Cefqy1/Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eSPsclrptwcnpw8wpV/n39GS7QGL3OUhYpyz6qddocfV7DExgj+L1ryxJtiESjMBi
 I9V2htSKHVuV5zTJRuVz/o7fYUZOeeGJ/18dFmfAd/+W1CQ8jYJNxXcxZq3fTZhNU3
 RgAVeY4GcsZiR/NO5AhxdgMksnOTWAvaaD86O3s+fVQhfM7x4pn7oiPC3fIJjed02I
 Yrapy9BP4NxEnoxsFIxoM4U3YsEDWgvXsLasPQBKOIc5EmRPimqCnsYYtnFfu/RDEh
 cUNWKI6yoDflPsFTX+5Clbal7ujM5TIVJk5tgdEh/c3Ov1xqE6V4drmp8G/jf5YY4z
 Dwa78idN8/xCg==
From: Mario Limonciello <superm1@kernel.org>
To: Alex Hung <alex.hung@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v6 05/10] drm/amd/display: use drm_edid_product_id for parsing
 EDID product info
Date: Wed, 11 Sep 2024 16:35:31 -0500
Message-ID: <20240911213537.2338164-6-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240911213537.2338164-1-superm1@kernel.org>
References: <20240911213537.2338164-1-superm1@kernel.org>
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

From: Melissa Wen <mwen@igalia.com>

Since [1], we can use drm_edid_product_id to get debug info from
drm_edid instead of directly parsing EDID.

Link: https://lore.kernel.org/dri-devel/cover.1712655867.git.jani.nikula@intel.com/ [1]
Signed-off-by: Melissa Wen <mwen@igalia.com>
Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v6: Split apply_edid_quirks() to two lines
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 38 ++++++++++---------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index be72f14f5429..3f280bc36e87 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -45,16 +45,16 @@
 #include "dm_helpers.h"
 #include "ddc_service_types.h"
 
-static u32 edid_extract_panel_id(struct edid *edid)
+static u32 edid_extract_panel_id(struct drm_edid_product_id *product_id)
 {
-	return (u32)edid->mfg_id[0] << 24   |
-	       (u32)edid->mfg_id[1] << 16   |
-	       (u32)EDID_PRODUCT_ID(edid);
+	return (u32)be16_to_cpu(product_id->manufacturer_name) << 16 |
+	       (u32)le16_to_cpu(product_id->product_code);
 }
 
-static void apply_edid_quirks(struct edid *edid, struct dc_edid_caps *edid_caps)
+static void apply_edid_quirks(struct drm_edid_product_id *product_id,
+			      struct dc_edid_caps *edid_caps)
 {
-	uint32_t panel_id = edid_extract_panel_id(edid);
+	uint32_t panel_id = edid_extract_panel_id(product_id);
 
 	switch (panel_id) {
 	/* Workaround for some monitors which does not work well with FAMS */
@@ -94,6 +94,8 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 {
 	struct amdgpu_dm_connector *aconnector = link->priv;
 	struct drm_connector *connector = &aconnector->base;
+	const struct drm_edid *drm_edid = aconnector->drm_edid;
+	struct drm_edid_product_id product_id;
 	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
 	struct cea_sad *sads;
 	int sad_count = -1;
@@ -109,13 +111,13 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	if (!drm_edid_is_valid(edid_buf))
 		result = EDID_BAD_CHECKSUM;
 
-	edid_caps->manufacturer_id = (uint16_t) edid_buf->mfg_id[0] |
-					((uint16_t) edid_buf->mfg_id[1])<<8;
-	edid_caps->product_id = (uint16_t) edid_buf->prod_code[0] |
-					((uint16_t) edid_buf->prod_code[1])<<8;
-	edid_caps->serial_number = edid_buf->serial;
-	edid_caps->manufacture_week = edid_buf->mfg_week;
-	edid_caps->manufacture_year = edid_buf->mfg_year;
+	drm_edid_get_product_id(drm_edid, &product_id);
+
+	edid_caps->manufacturer_id = le16_to_cpu(product_id.manufacturer_name);
+	edid_caps->product_id = le16_to_cpu(product_id.product_code);
+	edid_caps->serial_number = le32_to_cpu(product_id.serial_number);
+	edid_caps->manufacture_week = product_id.week_of_manufacture;
+	edid_caps->manufacture_year = product_id.year_of_manufacture;
 
 	drm_edid_get_monitor_name(edid_buf,
 				  edid_caps->display_name,
@@ -123,7 +125,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 
 	edid_caps->edid_hdmi = connector->display_info.is_hdmi;
 
-	apply_edid_quirks(edid_buf, edid_caps);
+	apply_edid_quirks(&product_id, edid_caps);
 
 	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
 	if (sad_count <= 0)
@@ -909,9 +911,9 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	 * do check sum and retry to make sure read correct edid.
 	 */
 	do {
-
 		drm_edid = drm_edid_read_ddc(connector, ddc);
 		drm_edid_connector_update(connector, drm_edid);
+		aconnector->drm_edid = drm_edid;
 
 		/* DP Compliance Test 4.2.2.6 */
 		if (link->aux_mode && connector->edid_corrupt)
@@ -929,14 +931,14 @@ enum dc_edid_status dm_helpers_read_local_edid(
 		sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
 		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
 
-		/* We don't need the original edid anymore */
-		drm_edid_free(drm_edid);
-
 		edid_status = dm_helpers_parse_edid_caps(
 						link,
 						&sink->dc_edid,
 						&sink->edid_caps);
 
+		/* We don't need the original edid anymore */
+		drm_edid_free(drm_edid);
+
 	} while (edid_status == EDID_BAD_CHECKSUM && --retry > 0);
 
 	if (edid_status != EDID_OK)
-- 
2.43.0

