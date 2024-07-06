Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF385929089
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jul 2024 05:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557B710E2D8;
	Sat,  6 Jul 2024 03:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="B1SE9BU8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E46210E2E2;
 Sat,  6 Jul 2024 03:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M8T2CW5KWXp6ZPr7o/BoSJzh1Cl4hwp7/Dv0CHo3Me4=; b=B1SE9BU8YmngoiIAUsDtFcYocw
 OEuaI8XvGyn+U3t37ctSVsSL01yvs7cNgbC9lCNTM+28sE60tznDIJ29Y04vUwqqowCoqeIeGmuLn
 A1I3ri7n7Y09KzaiR6QtRJIvtzt5tk1Zc4MFCD8GCDTEwIEtLfeamaX2GtEijyLeDHGoenaL5thaa
 xRMftT8w6A+dA6hDXB4HiHeRrA8NEKxeT7zkVicr2xCL8t0G0++6ZE4bFL6aHJC6mNlTcWRyrVR5M
 cRiiLZdCO18tXXDjwv99xQHbk6zhz50rkIe6/fJ1TO5CuA5LTb0pi/m+55k+3S+rCQ0UwVT5hbhbJ
 YCwP+lAA==;
Received: from [189.6.17.125] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sPwI0-00Bj27-J9; Sat, 06 Jul 2024 05:40:45 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v4 06/11] drm/amd/display: use drm_edid_product_id for parsing
 EDID product info
Date: Sat,  6 Jul 2024 00:35:07 -0300
Message-ID: <20240706034004.801329-7-mwen@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706034004.801329-1-mwen@igalia.com>
References: <20240706034004.801329-1-mwen@igalia.com>
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

Since [1], we can use drm_edid_product_id to get debug info from
drm_edid instead of directly parsing EDID.

[1] https://lore.kernel.org/dri-devel/cover.1712655867.git.jani.nikula@intel.com/

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 37 ++++++++++---------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index be72f14f5429..85704fd75ee4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -45,16 +45,15 @@
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
+static void apply_edid_quirks(struct drm_edid_product_id *product_id, struct dc_edid_caps *edid_caps)
 {
-	uint32_t panel_id = edid_extract_panel_id(edid);
+	uint32_t panel_id = edid_extract_panel_id(product_id);
 
 	switch (panel_id) {
 	/* Workaround for some monitors which does not work well with FAMS */
@@ -94,6 +93,8 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 {
 	struct amdgpu_dm_connector *aconnector = link->priv;
 	struct drm_connector *connector = &aconnector->base;
+	const struct drm_edid *drm_edid = aconnector->drm_edid;
+	struct drm_edid_product_id product_id;
 	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
 	struct cea_sad *sads;
 	int sad_count = -1;
@@ -109,13 +110,13 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
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
@@ -123,7 +124,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 
 	edid_caps->edid_hdmi = connector->display_info.is_hdmi;
 
-	apply_edid_quirks(edid_buf, edid_caps);
+	apply_edid_quirks(&product_id, edid_caps);
 
 	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
 	if (sad_count <= 0)
@@ -909,9 +910,9 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	 * do check sum and retry to make sure read correct edid.
 	 */
 	do {
-
 		drm_edid = drm_edid_read_ddc(connector, ddc);
 		drm_edid_connector_update(connector, drm_edid);
+		aconnector->drm_edid = drm_edid;
 
 		/* DP Compliance Test 4.2.2.6 */
 		if (link->aux_mode && connector->edid_corrupt)
@@ -929,14 +930,14 @@ enum dc_edid_status dm_helpers_read_local_edid(
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

