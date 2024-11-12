Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220D19C6082
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 19:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B59810E627;
	Tue, 12 Nov 2024 18:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="K5C/EeWl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0410F10E626;
 Tue, 12 Nov 2024 18:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1731436455;
 bh=qCgxSe+6OiA7qFuTKE7GRpdlVfifdiH0Ryq6gKTEzEE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=K5C/EeWle3iIZPHCNHmBNVNBtj2GXAHlywd8e0zeV7oCkMMlyes5GdOWBLrRrimT4
 5Hlbmb7etz0V/USXl7QVi4WqoVFAEEk1t/QFq4/7VQBF7wqNJ7ehvcTaFxLSgcL3jq
 KXXa3hFnPgoD/sLiIAYg4WJlgKIMNajQ1/Gp/5mg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 12 Nov 2024 19:34:14 +0100
Subject: [PATCH v2 5/7] drm/amd/display: Switch dc_sink to struct drm_edid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241112-amdgpu-drm_edid-v2-5-1399dc0f0469@weissschuh.net>
References: <20241112-amdgpu-drm_edid-v2-0-1399dc0f0469@weissschuh.net>
In-Reply-To: <20241112-amdgpu-drm_edid-v2-0-1399dc0f0469@weissschuh.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 jinzh <jinzh@github.amd.com>, Aric Cyr <Aric.Cyr@amd.com>, 
 Alan Liu <HaoPing.Liu@amd.com>, Tony Cheng <Tony.Cheng@amd.com>, 
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Harry Wentland <Harry.Wentland@amd.com>, 
 Melissa Wen <mwen@igalia.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731436454; l=12701;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=qCgxSe+6OiA7qFuTKE7GRpdlVfifdiH0Ryq6gKTEzEE=;
 b=JJ1lDa5Po+Q08N1NaTjpiwDbGSFVL1muYt4aSsmnVvRSAvGXyreWmc+jf4Ab5AhPqpQ40vqP4
 ul/WiGW0nW5D/8TYQhzzs0SOWxnHnNS4swN80DcsZofr3cI+klWYVOi
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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 15 ++------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 27 ++++++-------
 drivers/gpu/drm/amd/display/dc/dc.h                |  2 +-
 drivers/gpu/drm/amd/display/dc/dc_ddc_types.h      |  3 --
 drivers/gpu/drm/amd/display/dc/dc_types.h          |  5 ---
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |  2 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   | 44 ++++++++++++----------
 7 files changed, 43 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 4a093aff4499add545f7beb654ace477036b46fb..b09e13aed570756655b94647d4346c722a02e34a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3594,15 +3594,13 @@ void amdgpu_dm_update_connector_after_detect(
 
 		aconnector->dc_sink = sink;
 		dc_sink_retain(aconnector->dc_sink);
-		if (sink->dc_edid.length == 0) {
+		if (!sink->drm_edid) {
 			aconnector->drm_edid = NULL;
 			if (aconnector->dc_link->aux_mode) {
 				drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
 			}
 		} else {
-			const struct edid *edid = (const struct edid *)sink->dc_edid.raw_edid;
-
-			aconnector->drm_edid = drm_edid_alloc(edid, sink->dc_edid.length);
+			aconnector->drm_edid = drm_edid_dup(sink->drm_edid);
 			drm_edid_connector_update(connector, aconnector->drm_edid);
 
 			if (aconnector->dc_link->aux_mode)
@@ -7185,15 +7183,10 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
 	aconnector->drm_edid = drm_edid;
 	/* Update emulated (virtual) sink's EDID */
 	if (dc_em_sink && dc_link) {
-		// FIXME: Get rid of drm_edid_raw()
-		const struct edid *edid = drm_edid_raw(drm_edid);
-
-		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
-		memmove(dc_em_sink->dc_edid.raw_edid, edid,
-			(edid->extensions + 1) * EDID_LENGTH);
+		dc_em_sink->drm_edid = drm_edid_dup(drm_edid);
 		dm_helpers_parse_edid_caps(
 			dc_link,
-			&dc_em_sink->dc_edid,
+			dc_em_sink->drm_edid,
 			&dc_em_sink->edid_caps);
 	}
 }
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index b0fea0856866d68b2e78a9f141effe2777ea26ee..57b4a58eb9c8bfcb7b76622cf303ba01450e30ba 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -48,14 +48,14 @@
 #include "ddc_service_types.h"
 #include "clk_mgr.h"
 
-static u32 edid_extract_panel_id(struct edid *edid)
+static u32 edid_extract_panel_id(const struct edid *edid)
 {
 	return (u32)edid->mfg_id[0] << 24   |
 	       (u32)edid->mfg_id[1] << 16   |
 	       (u32)EDID_PRODUCT_ID(edid);
 }
 
-static void apply_edid_quirks(struct edid *edid, struct dc_edid_caps *edid_caps)
+static void apply_edid_quirks(const struct edid *edid, struct dc_edid_caps *edid_caps)
 {
 	uint32_t panel_id = edid_extract_panel_id(edid);
 
@@ -89,19 +89,19 @@ static void apply_edid_quirks(struct edid *edid, struct dc_edid_caps *edid_caps)
  * dm_helpers_parse_edid_caps() - Parse edid caps
  *
  * @link: current detected link
- * @edid:	[in] pointer to edid
+ * @drm_edid:	[in] pointer to edid
  * @edid_caps:	[in] pointer to edid caps
  *
  * Return: void
  */
 enum dc_edid_status dm_helpers_parse_edid_caps(
 		struct dc_link *link,
-		const struct dc_edid *edid,
+		const struct drm_edid *drm_edid,
 		struct dc_edid_caps *edid_caps)
 {
 	struct amdgpu_dm_connector *aconnector = link->priv;
 	struct drm_connector *connector = &aconnector->base;
-	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
+	const struct edid *edid_buf = drm_edid_raw(drm_edid);
 	struct cea_sad *sads;
 	int sad_count = -1;
 	int sadb_count = -1;
@@ -110,10 +110,10 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 
 	enum dc_edid_status result = EDID_OK;
 
-	if (!edid_caps || !edid)
+	if (!edid_caps || !drm_edid)
 		return EDID_BAD_INPUT;
 
-	if (!drm_edid_is_valid(edid_buf))
+	if (!drm_edid_valid(drm_edid))
 		result = EDID_BAD_CHECKSUM;
 
 	edid_caps->manufacturer_id = (uint16_t) edid_buf->mfg_id[0] |
@@ -132,7 +132,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 
 	apply_edid_quirks(edid_buf, edid_caps);
 
-	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
+	sad_count = drm_edid_to_sad(edid_buf, &sads);
 	if (sad_count <= 0)
 		return result;
 
@@ -146,7 +146,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 		edid_caps->audio_modes[i].sample_size = sad->byte2;
 	}
 
-	sadb_count = drm_edid_to_speaker_allocation((struct edid *) edid->raw_edid, &sadb);
+	sadb_count = drm_edid_to_speaker_allocation(edid_buf, &sadb);
 
 	if (sadb_count < 0) {
 		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sadb_count);
@@ -966,7 +966,6 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	int retry = 3;
 	enum dc_edid_status edid_status;
 	const struct drm_edid *drm_edid;
-	const struct edid *edid;
 
 	if (link->aux_mode)
 		ddc = &aconnector->dm_dp_aux.aux.ddc;
@@ -996,16 +995,14 @@ enum dc_edid_status dm_helpers_read_local_edid(
 		if (!drm_edid)
 			return EDID_NO_RESPONSE;
 
-		edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
-		sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
-		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
+		sink->drm_edid = drm_edid_dup(drm_edid);
 
 		/* We don't need the original edid anymore */
 		drm_edid_free(drm_edid);
 
 		edid_status = dm_helpers_parse_edid_caps(
 						link,
-						&sink->dc_edid,
+						sink->drm_edid,
 						&sink->edid_caps);
 
 	} while (edid_status == EDID_BAD_CHECKSUM && --retry > 0);
@@ -1032,7 +1029,7 @@ enum dc_edid_status dm_helpers_read_local_edid(
 		dm_helpers_dp_write_dpcd(ctx,
 					link,
 					DP_TEST_EDID_CHECKSUM,
-					&sink->dc_edid.raw_edid[sink->dc_edid.length-1],
+					&drm_edid_raw(sink->drm_edid)->checksum,
 					1);
 
 		dm_helpers_dp_write_dpcd(ctx,
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 7d5c790cab50987f361e1b4228562483a0f908f9..60f535fd39620b5657c1bc34b7f2e1509f62a5f3 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -2389,7 +2389,7 @@ struct scdc_caps {
  */
 struct dc_sink {
 	enum signal_type sink_signal;
-	struct dc_edid dc_edid; /* raw edid */
+	const struct drm_edid *drm_edid; /* raw edid */
 	struct dc_edid_caps edid_caps; /* parse display caps */
 	struct dc_container_id *dc_container_id;
 	uint32_t dongle_max_pix_clk;
diff --git a/drivers/gpu/drm/amd/display/dc/dc_ddc_types.h b/drivers/gpu/drm/amd/display/dc/dc_ddc_types.h
index 7dd1cfb9ab763c1e37d1cf6e27bbe4790a732f5b..6e0a457b7551dcec06614bab0aedbbf5f9ec3ff0 100644
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
index edf4df1d03b58ca97a23bfe97f7bd9651b21517b..d16be380d3eda73adfeee63eabca6836d3a36df0 100644
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
index 483d8c29261814a608895abe1a195225514f78e6..5a3d4bf7c370f08babc052f259d26a1a291d4c72 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
@@ -61,7 +61,7 @@ void dm_helpers_free_gpu_mem(
 
 enum dc_edid_status dm_helpers_parse_edid_caps(
 	struct dc_link *link,
-	const struct dc_edid *edid,
+	const struct drm_edid *drm_edid,
 	struct dc_edid_caps *edid_caps);
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index 05adaf8248b1b11675aa9e86a24fa24a2a811e01..f13b4e8929d5b217495b5fd29c4da7248a01a8e6 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -618,16 +618,25 @@ static bool detect_dp(struct dc_link *link,
 	return true;
 }
 
-static bool is_same_edid(struct dc_edid *old_edid, struct dc_edid *new_edid)
+static bool is_same_edid(const struct drm_edid *old_drm_edid,
+			 const struct drm_edid *new_drm_edid)
 {
-	if (old_edid->length != new_edid->length)
+	const struct edid *old_edid, *new_edid;
+	size_t old_edid_length, new_edid_length;
+
+	old_edid = drm_edid_raw(old_drm_edid);
+	new_edid = drm_edid_raw(new_drm_edid);
+
+	if (!old_edid || !new_edid)
 		return false;
 
-	if (new_edid->length == 0)
+	old_edid_length = (old_edid->extensions + 1) * EDID_LENGTH;
+	new_edid_length = (new_edid->extensions + 1) * EDID_LENGTH;
+
+	if (old_edid_length != new_edid_length)
 		return false;
 
-	return (memcmp(old_edid->raw_edid,
-		       new_edid->raw_edid, new_edid->length) == 0);
+	return memcmp(old_edid, new_edid, old_edid_length) == 0;
 }
 
 static bool wait_for_entering_dp_alt_mode(struct dc_link *link)
@@ -878,6 +887,7 @@ static bool detect_link_and_local_sink(struct dc_link *link,
 	struct dpcd_caps prev_dpcd_caps;
 	enum dc_connection_type new_connection_type = dc_connection_none;
 	const uint32_t post_oui_delay = 30; // 30ms
+	const struct edid *edid;
 
 	DC_LOGGER_INIT(link->ctx->logger);
 
@@ -1112,8 +1122,8 @@ static bool detect_link_and_local_sink(struct dc_link *link,
 		// Check if edid is the same
 		if ((prev_sink) &&
 		    (edid_status == EDID_THE_SAME || edid_status == EDID_OK))
-			same_edid = is_same_edid(&prev_sink->dc_edid,
-						 &sink->dc_edid);
+			same_edid = is_same_edid(prev_sink->drm_edid,
+						 sink->drm_edid);
 
 		if (sink->edid_caps.panel_patch.skip_scdc_overwrite)
 			link->ctx->dc->debug.hdmi20_disable = true;
@@ -1150,11 +1160,12 @@ static bool detect_link_and_local_sink(struct dc_link *link,
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
 
@@ -1399,11 +1410,6 @@ struct dc_sink *link_add_remote_sink(
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
@@ -1419,8 +1425,7 @@ struct dc_sink *link_add_remote_sink(
 	if (!dc_sink)
 		return NULL;
 
-	memmove(dc_sink->dc_edid.raw_edid, edid, len);
-	dc_sink->dc_edid.length = len;
+	dc_sink->drm_edid = drm_edid_alloc(edid, len);
 
 	if (!link_add_remote_sink_helper(
 			link,
@@ -1429,7 +1434,7 @@ struct dc_sink *link_add_remote_sink(
 
 	edid_status = dm_helpers_parse_edid_caps(
 			link,
-			&dc_sink->dc_edid,
+			dc_sink->drm_edid,
 			&dc_sink->edid_caps);
 
 	/*
@@ -1437,7 +1442,8 @@ struct dc_sink *link_add_remote_sink(
 	 * parsing fails
 	 */
 	if (edid_status != EDID_OK && edid_status != EDID_PARTIAL_VALID) {
-		dc_sink->dc_edid.length = 0;
+		drm_edid_free(dc_sink->drm_edid);
+		dc_sink->drm_edid = NULL;
 		dm_error("Bad EDID, status%d!\n", edid_status);
 	}
 

-- 
2.47.0

