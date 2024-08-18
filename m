Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B93A955C2C
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 12:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF4E10E01F;
	Sun, 18 Aug 2024 10:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="uWG6hCNJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202DC10E039;
 Sun, 18 Aug 2024 10:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1723977822;
 bh=meAlrBsJ01FY9lVuGnbqqPONMpHnKNGDuYSXyX7OsfA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=uWG6hCNJmEzlBc5zGKY7sioFjdFRjz1QdsDyw/XhJojw5PfFu4hJRPJa1WTYPlW4a
 sAi3SARtLuGV/Lx6raJYJNNcvBZrQu0P4ekzz4CvK9lTyVG1bQIhFDjDsMVbrnSI5F
 AJdwnNtfsniu/fcTmjQCjBS1Rlfa+MfgvQTP9Z1M=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 18 Aug 2024 12:43:35 +0200
Subject: [PATCH 11/12] drm/amd/display: Switch dc_sink to struct drm_edid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240818-amdgpu-drm_edid-v1-11-aea66c1f7cf4@weissschuh.net>
References: <20240818-amdgpu-drm_edid-v1-0-aea66c1f7cf4@weissschuh.net>
In-Reply-To: <20240818-amdgpu-drm_edid-v1-0-aea66c1f7cf4@weissschuh.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, jinzh <jinzh@github.amd.com>, 
 Aric Cyr <Aric.Cyr@amd.com>, Alan Liu <HaoPing.Liu@amd.com>, 
 Tony Cheng <Tony.Cheng@amd.com>, 
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Harry Wentland <Harry.Wentland@amd.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723977820; l=10339;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=meAlrBsJ01FY9lVuGnbqqPONMpHnKNGDuYSXyX7OsfA=;
 b=jGxQNOhaITiJsFGVfqELxf9iC9ZzW8I6TC41qcND3W18kLDSJDUNLSbau7Lh2X1aqCXffmV4D
 FHaFQe3a7pdAqfb7DeDOg7BI+7xmieUNb2OGdAHLPCyr3sUF6zCgrSV
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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

The custom "struct dc_edid" can be replaced by the standard "struct
drm_edid.

Rename the member to make sure that no usage sites are missed,
as "struct drm_edid" has some restrictions, for example it can not be
used with kfree().

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 11 +++----
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 24 ++++++--------
 drivers/gpu/drm/amd/display/dc/dc.h                |  2 +-
 drivers/gpu/drm/amd/display/dc/dc_ddc_types.h      |  3 --
 drivers/gpu/drm/amd/display/dc/dc_types.h          |  5 ---
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |  2 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   | 37 +++++++---------------
 7 files changed, 27 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 961f4f308dc7..e5ac1e6eca80 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3484,15 +3484,14 @@ void amdgpu_dm_update_connector_after_detect(
 
 		aconnector->dc_sink = sink;
 		dc_sink_retain(aconnector->dc_sink);
-		if (sink->dc_edid.length == 0) {
+		if (!sink->drm_edid) {
 			aconnector->drm_edid = NULL;
 			if (aconnector->dc_link->aux_mode) {
 				drm_dp_cec_unset_edid(
 					&aconnector->dm_dp_aux.aux);
 			}
 		} else {
-			aconnector->drm_edid = drm_edid_alloc(sink->dc_edid.raw_edid,
-							      sink->dc_edid.length);
+			aconnector->drm_edid = drm_edid_dup(sink->drm_edid);
 
 			if (aconnector->dc_link->aux_mode)
 				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux,
@@ -7041,12 +7040,10 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
 	/* Update emulated (virtual) sink's EDID */
 	if (dc_em_sink && dc_link) {
 		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
-		memmove(dc_em_sink->dc_edid.raw_edid,
-			drm_edid_raw(drm_edid),
-			(drm_edid_raw(drm_edid)->extensions + 1) * EDID_LENGTH);
+		dc_em_sink->drm_edid = drm_edid_dup(drm_edid);
 		dm_helpers_parse_edid_caps(
 			dc_link,
-			&dc_em_sink->dc_edid,
+			dc_em_sink->drm_edid,
 			&dc_em_sink->edid_caps);
 	}
 }
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 98d1d5abafa7..f3bf664ffc90 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -89,7 +89,7 @@ static void apply_edid_quirks(const struct edid *edid, struct dc_edid_caps *edid
  */
 enum dc_edid_status dm_helpers_parse_edid_caps(
 		struct dc_link *link,
-		const struct dc_edid *edid,
+		const struct drm_edid *drm_edid,
 		struct dc_edid_caps *edid_caps)
 {
 	struct amdgpu_dm_connector *aconnector = link->priv;
@@ -103,10 +103,10 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 
 	enum dc_edid_status result = EDID_OK;
 
-	if (!edid_caps || !edid)
+	if (!edid_caps || !drm_edid)
 		return EDID_BAD_INPUT;
 
-	edid_buf = (const struct edid *)edid->raw_edid;
+	edid_buf = drm_edid_raw(drm_edid);
 
 	if (!drm_edid_is_valid(edid_buf))
 		result = EDID_BAD_CHECKSUM;
@@ -899,7 +899,7 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	struct i2c_adapter *ddc;
 	int retry = 3;
 	enum dc_edid_status edid_status;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 
 	if (link->aux_mode)
 		ddc = &aconnector->dm_dp_aux.aux.ddc;
@@ -911,29 +911,25 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	 */
 	do {
 
-		edid = drm_get_edid(&aconnector->base, ddc);
+		drm_edid = drm_edid_read_ddc(&aconnector->base, ddc);
 
 		/* DP Compliance Test 4.2.2.6 */
 		if (link->aux_mode && connector->edid_corrupt)
 			drm_dp_send_real_edid_checksum(&aconnector->dm_dp_aux.aux, connector->real_edid_checksum);
 
-		if (!edid && connector->edid_corrupt) {
+		if (!drm_edid && connector->edid_corrupt) {
 			connector->edid_corrupt = false;
 			return EDID_BAD_CHECKSUM;
 		}
 
-		if (!edid)
+		if (!drm_edid)
 			return EDID_NO_RESPONSE;
 
-		sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
-		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
-
-		/* We don't need the original edid anymore */
-		kfree(edid);
+		sink->drm_edid = drm_edid_dup(drm_edid);
 
 		edid_status = dm_helpers_parse_edid_caps(
 						link,
-						&sink->dc_edid,
+						sink->drm_edid,
 						&sink->edid_caps);
 
 	} while (edid_status == EDID_BAD_CHECKSUM && --retry > 0);
@@ -960,7 +956,7 @@ enum dc_edid_status dm_helpers_read_local_edid(
 		dm_helpers_dp_write_dpcd(ctx,
 					link,
 					DP_TEST_EDID_CHECKSUM,
-					&sink->dc_edid.raw_edid[sink->dc_edid.length-1],
+					&drm_edid_raw(sink->drm_edid)->checksum,
 					1);
 
 		dm_helpers_dp_write_dpcd(ctx,
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 4b2abb25ca3c..eb151a637f1a 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -2371,7 +2371,7 @@ struct scdc_caps {
  */
 struct dc_sink {
 	enum signal_type sink_signal;
-	struct dc_edid dc_edid; /* raw edid */
+	const struct drm_edid *drm_edid; /* raw edid */
 	struct dc_edid_caps edid_caps; /* parse display caps */
 	struct dc_container_id *dc_container_id;
 	uint32_t dongle_max_pix_clk;
diff --git a/drivers/gpu/drm/amd/display/dc/dc_ddc_types.h b/drivers/gpu/drm/amd/display/dc/dc_ddc_types.h
index 7dd1cfb9ab76..6e0a457b7551 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_ddc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_ddc_types.h
@@ -178,9 +178,6 @@ enum display_dongle_type {
 	DISPLAY_DONGLE_DP_HDMI_MISMATCHED_DONGLE,
 };
 
-#define DC_MAX_EDID_BUFFER_SIZE 2048
-#define DC_EDID_BLOCK_SIZE 128
-
 struct ddc_service {
 	struct ddc *ddc_pin;
 	struct ddc_flags flags;
diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index 97279b080f3e..0906a0bae399 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -149,11 +149,6 @@ struct dc_cea_audio_mode {
 	};
 };
 
-struct dc_edid {
-	uint32_t length;
-	uint8_t raw_edid[DC_MAX_EDID_BUFFER_SIZE];
-};
-
 /* When speaker location data block is not available, DEFAULT_SPEAKER_LOCATION
  * is used. In this case we assume speaker location are: front left, front
  * right and front center. */
diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
index 483d8c292618..5a3d4bf7c370 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
@@ -61,7 +61,7 @@ void dm_helpers_free_gpu_mem(
 
 enum dc_edid_status dm_helpers_parse_edid_caps(
 	struct dc_link *link,
-	const struct dc_edid *edid,
+	const struct drm_edid *drm_edid,
 	struct dc_edid_caps *edid_caps);
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index 6a190d084a94..cdbf6bcc8f68 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -615,18 +615,6 @@ static bool detect_dp(struct dc_link *link,
 	return true;
 }
 
-static bool is_same_edid(struct dc_edid *old_edid, struct dc_edid *new_edid)
-{
-	if (old_edid->length != new_edid->length)
-		return false;
-
-	if (new_edid->length == 0)
-		return false;
-
-	return (memcmp(old_edid->raw_edid,
-		       new_edid->raw_edid, new_edid->length) == 0);
-}
-
 static bool wait_for_entering_dp_alt_mode(struct dc_link *link)
 {
 
@@ -866,6 +854,7 @@ static bool detect_link_and_local_sink(struct dc_link *link,
 	struct dpcd_caps prev_dpcd_caps;
 	enum dc_connection_type new_connection_type = dc_connection_none;
 	const uint32_t post_oui_delay = 30; // 30ms
+	const struct edid *edid;
 
 	DC_LOGGER_INIT(link->ctx->logger);
 
@@ -1100,8 +1089,8 @@ static bool detect_link_and_local_sink(struct dc_link *link,
 		// Check if edid is the same
 		if ((prev_sink) &&
 		    (edid_status == EDID_THE_SAME || edid_status == EDID_OK))
-			same_edid = is_same_edid(&prev_sink->dc_edid,
-						 &sink->dc_edid);
+			same_edid = drm_edid_equal(prev_sink->drm_edid,
+						   sink->drm_edid);
 
 		if (sink->edid_caps.panel_patch.skip_scdc_overwrite)
 			link->ctx->dc->debug.hdmi20_disable = true;
@@ -1138,11 +1127,12 @@ static bool detect_link_and_local_sink(struct dc_link *link,
 		if (link->local_sink && dc_is_dp_signal(sink_caps.signal))
 			dp_trace_init(link);
 
+		edid = drm_edid_raw(sink->drm_edid);
 		/* Connectivity log: detection */
-		for (i = 0; i < sink->dc_edid.length / DC_EDID_BLOCK_SIZE; i++) {
+		for (i = 0; i < edid->extensions + 1; i++) {
 			CONN_DATA_DETECT(link,
-					 &sink->dc_edid.raw_edid[i * DC_EDID_BLOCK_SIZE],
-					 DC_EDID_BLOCK_SIZE,
+					 edid + i,
+					 EDID_LENGTH,
 					 "%s: [Block %d] ", sink->edid_caps.display_name, i);
 		}
 
@@ -1388,11 +1378,6 @@ struct dc_sink *link_add_remote_sink(
 	struct dc_sink *dc_sink;
 	enum dc_edid_status edid_status;
 
-	if (len > DC_MAX_EDID_BUFFER_SIZE) {
-		dm_error("Max EDID buffer size breached!\n");
-		return NULL;
-	}
-
 	if (!init_data) {
 		BREAK_TO_DEBUGGER();
 		return NULL;
@@ -1408,8 +1393,7 @@ struct dc_sink *link_add_remote_sink(
 	if (!dc_sink)
 		return NULL;
 
-	memmove(dc_sink->dc_edid.raw_edid, edid, len);
-	dc_sink->dc_edid.length = len;
+	dc_sink->drm_edid = drm_edid_alloc(edid, len);
 
 	if (!link_add_remote_sink_helper(
 			link,
@@ -1418,7 +1402,7 @@ struct dc_sink *link_add_remote_sink(
 
 	edid_status = dm_helpers_parse_edid_caps(
 			link,
-			&dc_sink->dc_edid,
+			dc_sink->drm_edid,
 			&dc_sink->edid_caps);
 
 	/*
@@ -1426,7 +1410,8 @@ struct dc_sink *link_add_remote_sink(
 	 * parsing fails
 	 */
 	if (edid_status != EDID_OK && edid_status != EDID_PARTIAL_VALID) {
-		dc_sink->dc_edid.length = 0;
+		drm_edid_free(dc_sink->drm_edid);
+		dc_sink->drm_edid = NULL;
 		dm_error("Bad EDID, status%d!\n", edid_status);
 	}
 

-- 
2.46.0

