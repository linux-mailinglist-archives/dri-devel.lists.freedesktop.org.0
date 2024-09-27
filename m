Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FC6988CD4
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 01:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC39610ED39;
	Fri, 27 Sep 2024 23:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jUiRx8C3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25ED910ED35;
 Fri, 27 Sep 2024 23:06:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E0520A45ACF;
 Fri, 27 Sep 2024 23:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C246EC4CEC9;
 Fri, 27 Sep 2024 23:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727478373;
 bh=Bm0a3jDGUzRF6E+fTEqxTHvMxOlf9aUAdhXmMMDogtU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jUiRx8C3laaw+0FSiZuz0cCBgUKpjA8JzjlBdWn6z8wo9wOPm50SbLfNgfVjBZ6Ip
 f8p0wXjnBssmc3gipw14ZR4uy3h4SbjUf0uHiIb4uqaZv22e+0ey/Cd7/3Yyb66XjW
 sjl42c/e4+HSw0RtjHnTZ9Zx2bD4ypqpmLD7n8HUX5Fjgg8Dtjn5fIGnbO5lcxNNts
 XEjFQIZu+WnybeHGJK3uxltiXJxeMrcD3loffp2W6phcR8Bggg1p349d4X0a6pevdt
 XBR+MChT7Rd9FVlhIDJPw237FKFWM5QYShvNRq4c7nqL2LVDV9m/QYhGPVgfSfGS2S
 cx2T6ZVNqdMlA==
From: Mario Limonciello <superm1@kernel.org>
To: Alex Hung <alex.hung@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v8 1/5] drm/amd/display: switch amdgpu_dm_connector to use
 struct drm_edid
Date: Fri, 27 Sep 2024 18:05:56 -0500
Message-ID: <20240927230600.2619844-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240927230600.2619844-1-superm1@kernel.org>
References: <20240927230600.2619844-1-superm1@kernel.org>
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

Replace raw edid handling (struct edid) with the opaque EDID type
(struct drm_edid) on amdgpu_dm_connector for consistency. It may also
prevent mismatch of approaches in different parts of the driver code.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v7: fix LKP robot issue
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 123 ++++++++----------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   4 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  13 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  34 ++---
 4 files changed, 84 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6f4b753f5f51..b7d93787667c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3487,7 +3487,7 @@ void amdgpu_dm_update_connector_after_detect(
 			aconnector->dc_sink = sink;
 			dc_sink_retain(aconnector->dc_sink);
 			amdgpu_dm_update_freesync_caps(connector,
-					aconnector->edid);
+					aconnector->drm_edid);
 		} else {
 			amdgpu_dm_update_freesync_caps(connector, NULL);
 			if (!aconnector->dc_sink) {
@@ -3546,18 +3546,19 @@ void amdgpu_dm_update_connector_after_detect(
 		aconnector->dc_sink = sink;
 		dc_sink_retain(aconnector->dc_sink);
 		if (sink->dc_edid.length == 0) {
-			aconnector->edid = NULL;
+			aconnector->drm_edid = NULL;
 			if (aconnector->dc_link->aux_mode) {
 				drm_dp_cec_unset_edid(
 					&aconnector->dm_dp_aux.aux);
 			}
 		} else {
-			aconnector->edid =
-				(struct edid *)sink->dc_edid.raw_edid;
+			const struct edid *edid = (const struct edid *)sink->dc_edid.raw_edid;
+
+			aconnector->drm_edid = drm_edid_alloc(edid, sink->dc_edid.length);
+			drm_edid_connector_update(connector, aconnector->drm_edid);
 
 			if (aconnector->dc_link->aux_mode)
-				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux,
-						    aconnector->edid);
+				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux, edid);
 		}
 
 		if (!aconnector->timing_requested) {
@@ -3568,17 +3569,18 @@ void amdgpu_dm_update_connector_after_detect(
 					"failed to create aconnector->requested_timing\n");
 		}
 
-		drm_connector_update_edid_property(connector, aconnector->edid);
-		amdgpu_dm_update_freesync_caps(connector, aconnector->edid);
+		drm_edid_connector_update(connector, aconnector->drm_edid);
+		amdgpu_dm_update_freesync_caps(connector, aconnector->drm_edid);
 		update_connector_ext_caps(aconnector);
 	} else {
 		drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
 		amdgpu_dm_update_freesync_caps(connector, NULL);
-		drm_connector_update_edid_property(connector, NULL);
+		drm_edid_connector_update(connector, NULL);
 		aconnector->num_modes = 0;
 		dc_sink_release(aconnector->dc_sink);
 		aconnector->dc_sink = NULL;
-		aconnector->edid = NULL;
+		drm_edid_free(aconnector->drm_edid);
+		aconnector->drm_edid = NULL;
 		kfree(aconnector->timing_requested);
 		aconnector->timing_requested = NULL;
 		/* Set CP to DESIRED if it was ENABLED, so we can re-enable it again on hotplug */
@@ -7105,32 +7107,24 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
 	struct dc_link *dc_link = aconnector->dc_link;
 	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
-	struct edid *edid;
-	struct i2c_adapter *ddc;
-
-	if (dc_link && dc_link->aux_mode)
-		ddc = &aconnector->dm_dp_aux.aux.ddc;
-	else
-		ddc = &aconnector->i2c->base;
+	const struct drm_edid *drm_edid;
 
-	/*
-	 * Note: drm_get_edid gets edid in the following order:
-	 * 1) override EDID if set via edid_override debugfs,
-	 * 2) firmware EDID if set via edid_firmware module parameter
-	 * 3) regular DDC read.
-	 */
-	edid = drm_get_edid(connector, ddc);
-	if (!edid) {
+	drm_edid = drm_edid_read(connector);
+	drm_edid_connector_update(connector, drm_edid);
+	if (!drm_edid) {
 		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
 		return;
 	}
 
-	aconnector->edid = edid;
-
+	aconnector->drm_edid = drm_edid;
 	/* Update emulated (virtual) sink's EDID */
 	if (dc_em_sink && dc_link) {
+		// FIXME: Get rid of drm_edid_raw()
+		const struct edid *edid = drm_edid_raw(drm_edid);
+
 		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
-		memmove(dc_em_sink->dc_edid.raw_edid, edid, (edid->extensions + 1) * EDID_LENGTH);
+		memmove(dc_em_sink->dc_edid.raw_edid, edid,
+			(edid->extensions + 1) * EDID_LENGTH);
 		dm_helpers_parse_edid_caps(
 			dc_link,
 			&dc_em_sink->dc_edid,
@@ -7160,36 +7154,26 @@ static int get_modes(struct drm_connector *connector)
 static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
 {
 	struct drm_connector *connector = &aconnector->base;
-	struct dc_link *dc_link = aconnector->dc_link;
 	struct dc_sink_init_data init_params = {
 			.link = aconnector->dc_link,
 			.sink_signal = SIGNAL_TYPE_VIRTUAL
 	};
-	struct edid *edid;
-	struct i2c_adapter *ddc;
-
-	if (dc_link->aux_mode)
-		ddc = &aconnector->dm_dp_aux.aux.ddc;
-	else
-		ddc = &aconnector->i2c->base;
+	const struct drm_edid *drm_edid;
+	const struct edid *edid;
 
-	/*
-	 * Note: drm_get_edid gets edid in the following order:
-	 * 1) override EDID if set via edid_override debugfs,
-	 * 2) firmware EDID if set via edid_firmware module parameter
-	 * 3) regular DDC read.
-	 */
-	edid = drm_get_edid(connector, ddc);
-	if (!edid) {
+	drm_edid = drm_edid_read(connector);
+	drm_edid_connector_update(connector, drm_edid);
+	if (!drm_edid) {
 		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
 		return;
 	}
 
-	if (drm_detect_hdmi_monitor(edid))
+	if (connector->display_info.is_hdmi)
 		init_params.sink_signal = SIGNAL_TYPE_HDMI_TYPE_A;
 
-	aconnector->edid = edid;
+	aconnector->drm_edid = drm_edid;
 
+	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
 	aconnector->dc_em_sink = dc_link_add_remote_sink(
 		aconnector->dc_link,
 		(uint8_t *)edid,
@@ -7876,16 +7860,16 @@ static void amdgpu_set_panel_orientation(struct drm_connector *connector)
 }
 
 static void amdgpu_dm_connector_ddc_get_modes(struct drm_connector *connector,
-					      struct edid *edid)
+					      const struct drm_edid *drm_edid)
 {
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 			to_amdgpu_dm_connector(connector);
 
-	if (edid) {
+	if (drm_edid) {
 		/* empty probed_modes */
 		INIT_LIST_HEAD(&connector->probed_modes);
 		amdgpu_dm_connector->num_modes =
-				drm_add_edid_modes(connector, edid);
+				drm_edid_connector_add_modes(connector);
 
 		/* sorting the probed modes before calling function
 		 * amdgpu_dm_get_native_mode() since EDID can have
@@ -7899,10 +7883,10 @@ static void amdgpu_dm_connector_ddc_get_modes(struct drm_connector *connector,
 		amdgpu_dm_get_native_mode(connector);
 
 		/* Freesync capabilities are reset by calling
-		 * drm_add_edid_modes() and need to be
+		 * drm_edid_connector_add_modes() and need to be
 		 * restored here.
 		 */
-		amdgpu_dm_update_freesync_caps(connector, edid);
+		amdgpu_dm_update_freesync_caps(connector, drm_edid);
 	} else {
 		amdgpu_dm_connector->num_modes = 0;
 	}
@@ -7998,12 +7982,12 @@ static uint add_fs_modes(struct amdgpu_dm_connector *aconnector)
 }
 
 static void amdgpu_dm_connector_add_freesync_modes(struct drm_connector *connector,
-						   struct edid *edid)
+						   const struct drm_edid *drm_edid)
 {
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 		to_amdgpu_dm_connector(connector);
 
-	if (!(amdgpu_freesync_vid_mode && edid))
+	if (!(amdgpu_freesync_vid_mode && drm_edid))
 		return;
 
 	if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
@@ -8016,24 +8000,24 @@ static int amdgpu_dm_connector_get_modes(struct drm_connector *connector)
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 			to_amdgpu_dm_connector(connector);
 	struct drm_encoder *encoder;
-	struct edid *edid = amdgpu_dm_connector->edid;
+	const struct drm_edid *drm_edid = amdgpu_dm_connector->drm_edid;
 	struct dc_link_settings *verified_link_cap =
 			&amdgpu_dm_connector->dc_link->verified_link_cap;
 	const struct dc *dc = amdgpu_dm_connector->dc_link->dc;
 
 	encoder = amdgpu_dm_connector_to_encoder(connector);
 
-	if (!drm_edid_is_valid(edid)) {
+	if (!drm_edid) {
 		amdgpu_dm_connector->num_modes =
 				drm_add_modes_noedid(connector, 640, 480);
 		if (dc->link_srv->dp_get_encoding_format(verified_link_cap) == DP_128b_132b_ENCODING)
 			amdgpu_dm_connector->num_modes +=
 				drm_add_modes_noedid(connector, 1920, 1080);
 	} else {
-		amdgpu_dm_connector_ddc_get_modes(connector, edid);
+		amdgpu_dm_connector_ddc_get_modes(connector, drm_edid);
 		if (encoder)
 			amdgpu_dm_connector_add_common_modes(encoder, connector);
-		amdgpu_dm_connector_add_freesync_modes(connector, edid);
+		amdgpu_dm_connector_add_freesync_modes(connector, drm_edid);
 	}
 	amdgpu_dm_fbc_init(connector);
 
@@ -11958,7 +11942,7 @@ static bool parse_edid_cea(struct amdgpu_dm_connector *aconnector,
 }
 
 static void parse_edid_displayid_vrr(struct drm_connector *connector,
-		struct edid *edid)
+				     const struct edid *edid)
 {
 	u8 *edid_ext = NULL;
 	int i;
@@ -12001,7 +11985,7 @@ static void parse_edid_displayid_vrr(struct drm_connector *connector,
 }
 
 static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
-			  struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
+			  const struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
 {
 	u8 *edid_ext = NULL;
 	int i;
@@ -12036,7 +12020,8 @@ static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
 }
 
 static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
-		struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
+			       const struct edid *edid,
+			       struct amdgpu_hdmi_vsdb_info *vsdb_info)
 {
 	u8 *edid_ext = NULL;
 	int i;
@@ -12070,7 +12055,7 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
  * amdgpu_dm_update_freesync_caps - Update Freesync capabilities
  *
  * @connector: Connector to query.
- * @edid: EDID from monitor
+ * @drm_edid: DRM EDID from monitor
  *
  * Amdgpu supports Freesync in DP and HDMI displays, and it is required to keep
  * track of some of the display information in the internal data struct used by
@@ -12078,19 +12063,19 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
  * FreeSync parameters.
  */
 void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
-				    struct edid *edid)
+				    const struct drm_edid *drm_edid)
 {
 	int i = 0;
-	struct detailed_timing *timing;
-	struct detailed_non_pixel *data;
-	struct detailed_data_monitor_range *range;
+	const struct detailed_timing *timing;
+	const struct detailed_non_pixel *data;
+	const struct detailed_data_monitor_range *range;
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 			to_amdgpu_dm_connector(connector);
 	struct dm_connector_state *dm_con_state = NULL;
 	struct dc_sink *sink;
-
 	struct amdgpu_device *adev = drm_to_adev(connector->dev);
 	struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
+	const struct edid *edid;
 	bool freesync_capable = false;
 	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
 
@@ -12103,7 +12088,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		amdgpu_dm_connector->dc_sink :
 		amdgpu_dm_connector->dc_em_sink;
 
-	if (!edid || !sink) {
+	if (!drm_edid || !sink) {
 		dm_con_state = to_dm_connector_state(connector->state);
 
 		amdgpu_dm_connector->min_vfreq = 0;
@@ -12120,6 +12105,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	if (!adev->dm.freesync_module)
 		goto update;
 
+	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
+
 	/* Some eDP panels only have the refresh rate range info in DisplayID */
 	if ((connector->display_info.monitor_range.min_vfreq == 0 ||
 	     connector->display_info.monitor_range.max_vfreq == 0))
@@ -12196,7 +12183,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
 		}
 
-	} else if (edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
+	} else if (drm_edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
 		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
 		if (i >= 0 && vsdb_info.freesync_supported) {
 			timing  = &edid->detailed_timings[i];
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 15d4690c74d6..5e49b97b3d46 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -673,7 +673,7 @@ struct amdgpu_dm_connector {
 
 	/* we need to mind the EDID between detect
 	   and get modes due to analog/digital/tvencoder */
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 
 	/* shared with amdgpu */
 	struct amdgpu_hpd hpd;
@@ -951,7 +951,7 @@ void dm_restore_drm_connector_state(struct drm_device *dev,
 				    struct drm_connector *connector);
 
 void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
-					struct edid *edid);
+				    const struct drm_edid *drm_edid);
 
 void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 50109d13d967..b8004ccdcc33 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -897,7 +897,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	struct i2c_adapter *ddc;
 	int retry = 3;
 	enum dc_edid_status edid_status;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
+	const struct edid *edid;
 
 	if (link->aux_mode)
 		ddc = &aconnector->dm_dp_aux.aux.ddc;
@@ -909,25 +910,27 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	 */
 	do {
 
-		edid = drm_get_edid(&aconnector->base, ddc);
+		drm_edid = drm_edid_read_ddc(connector, ddc);
+		drm_edid_connector_update(connector, drm_edid);
 
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
 
+		edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
 		sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
 		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
 
 		/* We don't need the original edid anymore */
-		kfree(edid);
+		drm_edid_free(drm_edid);
 
 		edid_status = dm_helpers_parse_edid_caps(
 						link,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 83a31b97e96b..5e3d3eda3c9f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -129,7 +129,7 @@ dm_dp_mst_connector_destroy(struct drm_connector *connector)
 		dc_sink_release(aconnector->dc_sink);
 	}
 
-	kfree(aconnector->edid);
+	drm_edid_free(aconnector->drm_edid);
 
 	drm_connector_cleanup(connector);
 	drm_dp_mst_put_port_malloc(aconnector->mst_output_port);
@@ -182,7 +182,7 @@ amdgpu_dm_mst_connector_early_unregister(struct drm_connector *connector)
 
 		dc_sink_release(dc_sink);
 		aconnector->dc_sink = NULL;
-		aconnector->edid = NULL;
+		aconnector->drm_edid = NULL;
 		aconnector->dsc_aux = NULL;
 		port->passthrough_aux = NULL;
 	}
@@ -302,16 +302,18 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 	if (!aconnector)
 		return drm_add_edid_modes(connector, NULL);
 
-	if (!aconnector->edid) {
-		struct edid *edid;
+	if (!aconnector->drm_edid) {
+		const struct drm_edid *drm_edid;
 
-		edid = drm_dp_mst_get_edid(connector, &aconnector->mst_root->mst_mgr, aconnector->mst_output_port);
+		drm_edid = drm_dp_mst_edid_read(connector,
+						&aconnector->mst_root->mst_mgr,
+						aconnector->mst_output_port);
 
-		if (!edid) {
+		if (!drm_edid) {
 			amdgpu_dm_set_mst_status(&aconnector->mst_status,
 			MST_REMOTE_EDID, false);
 
-			drm_connector_update_edid_property(
+			drm_edid_connector_update(
 				&aconnector->base,
 				NULL);
 
@@ -345,7 +347,7 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 			return ret;
 		}
 
-		aconnector->edid = edid;
+		aconnector->drm_edid = drm_edid;
 		amdgpu_dm_set_mst_status(&aconnector->mst_status,
 			MST_REMOTE_EDID, true);
 	}
@@ -360,10 +362,13 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 		struct dc_sink_init_data init_params = {
 				.link = aconnector->dc_link,
 				.sink_signal = SIGNAL_TYPE_DISPLAY_PORT_MST };
+		const struct edid *edid;
+
+		edid = drm_edid_raw(aconnector->drm_edid); // FIXME: Get rid of drm_edid_raw()
 		dc_sink = dc_link_add_remote_sink(
 			aconnector->dc_link,
-			(uint8_t *)aconnector->edid,
-			(aconnector->edid->extensions + 1) * EDID_LENGTH,
+			(uint8_t *)edid,
+			(edid->extensions + 1) * EDID_LENGTH,
 			&init_params);
 
 		if (!dc_sink) {
@@ -405,7 +410,7 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 
 		if (aconnector->dc_sink) {
 			amdgpu_dm_update_freesync_caps(
-					connector, aconnector->edid);
+					connector, aconnector->drm_edid);
 
 #if defined(CONFIG_DRM_AMD_DC_FP)
 			if (!validate_dsc_caps_on_connector(aconnector))
@@ -419,10 +424,9 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 		}
 	}
 
-	drm_connector_update_edid_property(
-					&aconnector->base, aconnector->edid);
+	drm_edid_connector_update(&aconnector->base, aconnector->drm_edid);
 
-	ret = drm_add_edid_modes(connector, aconnector->edid);
+	ret = drm_edid_connector_add_modes(connector);
 
 	return ret;
 }
@@ -500,7 +504,7 @@ dm_dp_mst_detect(struct drm_connector *connector,
 
 		dc_sink_release(aconnector->dc_sink);
 		aconnector->dc_sink = NULL;
-		aconnector->edid = NULL;
+		aconnector->drm_edid = NULL;
 		aconnector->dsc_aux = NULL;
 		port->passthrough_aux = NULL;
 
-- 
2.43.0

