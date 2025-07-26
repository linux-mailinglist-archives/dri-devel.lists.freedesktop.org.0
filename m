Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D7BB1282E
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 02:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3400B10EA3E;
	Sat, 26 Jul 2025 00:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pzpfgKb+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DB510EA3E;
 Sat, 26 Jul 2025 00:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VJFDG3RxUmLZ/uCZumm0L0WKtrs9LNRd4d93/B2bJwg=; b=pzpfgKb+2g8i6XcmbQKg3LmhNg
 heED1jwAncbmGG4iQFTcJyuu1lrSZ13mDj0wfkUkOyiODgiyKMILgecXhWACf7PVZrzVR22ZZhSu1
 gKlOPvalLG59XAKQkyX1AgHGHYpREzGpewwCJ1dzV7LfZU/3LiI9egzN2gluFN6uuo9/O9rngsBhK
 +dbNAc6nxCkDRB9rVsD8e7/1WmjplZz4xdq+mIWsjQumZ/gYIGPI/nWDAxuXVWOqqC91DYr/HiCq5
 if+iluq6+EWRFN42P6oKOCglsAA1JlrzDLaW8QJQHQ4gQAnHcwQxXTECWVOxrUrYQPq+z8iaU9M2S
 oioBgwtw==;
Received: from [189.6.13.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ufSww-003wod-Cl; Sat, 26 Jul 2025 02:39:43 +0200
From: Melissa Wen <mwen@igalia.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: Michel Daenzer <michel.daenzer@mailbox.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v6 14/14] drm/amd/display: move dc_sink from dc_edid to
 drm_edid
Date: Fri, 25 Jul 2025 21:33:15 -0300
Message-ID: <20250726003816.435227-15-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250726003816.435227-1-mwen@igalia.com>
References: <20250726003816.435227-1-mwen@igalia.com>
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

Reduce direct handling of edid data by resorting to drm helpers that
deal with this info inside drm_edid infrastructure.

v3:
- use dc_edid_sink_edid_free in link_detection

v5:
- no need of drm_edid duplication (Mario)
- fix mem leak on dc_sink->drm_edid

v6:
- fix NULL pointer dereference (Alex H)

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 26 ++++++---------
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 31 ++++++------------
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 21 ++++--------
 .../gpu/drm/amd/display/amdgpu_dm/dc_edid.c   | 32 +++++++++++--------
 .../gpu/drm/amd/display/amdgpu_dm/dc_edid.h   |  1 +
 .../drm/amd/display/dc/link/link_detection.c  |  3 +-
 6 files changed, 48 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 878269c2092c..1aa0ccf74580 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -68,6 +68,7 @@
 #endif
 #include "amdgpu_dm_psr.h"
 #include "amdgpu_dm_replay.h"
+#include "dc_edid.h"
 
 #include "ivsrcid/ivsrcid_vislands30.h"
 
@@ -3743,6 +3744,8 @@ void amdgpu_dm_update_connector_after_detect(
 	 * 2. Send an event and let userspace tell us what to do
 	 */
 	if (sink) {
+		const struct drm_edid *drm_edid = sink->drm_edid;
+
 		/*
 		 * TODO: check if we still need the S3 mode update workaround.
 		 * If yes, put it here.
@@ -3754,16 +3757,15 @@ void amdgpu_dm_update_connector_after_detect(
 
 		aconnector->dc_sink = sink;
 		dc_sink_retain(aconnector->dc_sink);
-		if (sink->dc_edid.length == 0) {
+
+		if (!drm_edid_valid(drm_edid)) {
 			aconnector->drm_edid = NULL;
 			hdmi_cec_unset_edid(aconnector);
 			if (aconnector->dc_link->aux_mode) {
 				drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
 			}
 		} else {
-			const struct edid *edid = (const struct edid *)sink->dc_edid.raw_edid;
-
-			aconnector->drm_edid = drm_edid_alloc(edid, sink->dc_edid.length);
+			aconnector->drm_edid = drm_edid_dup(sink->drm_edid);
 			drm_edid_connector_update(connector, aconnector->drm_edid);
 
 			hdmi_cec_set_edid(aconnector);
@@ -7434,12 +7436,8 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
 	aconnector->drm_edid = drm_edid;
 	/* Update emulated (virtual) sink's EDID */
 	if (dc_em_sink && dc_link) {
-		// FIXME: Get rid of drm_edid_raw()
-		const struct edid *edid = drm_edid_raw(drm_edid);
-
 		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
-		memmove(dc_em_sink->dc_edid.raw_edid, edid,
-			(edid->extensions + 1) * EDID_LENGTH);
+		dc_edid_copy_edid_to_dc(dc_em_sink, drm_edid, 0);
 		dm_helpers_parse_edid_caps(dc_link, dc_em_sink);
 	}
 }
@@ -7472,7 +7470,6 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
 			.sink_signal = SIGNAL_TYPE_VIRTUAL
 	};
 	const struct drm_edid *drm_edid;
-	const struct edid *edid;
 	struct i2c_adapter *ddc;
 
 	if (dc_link && dc_link->aux_mode)
@@ -7492,12 +7489,9 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
 
 	aconnector->drm_edid = drm_edid;
 
-	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
-	aconnector->dc_em_sink = dc_link_add_remote_sink(
-		aconnector->dc_link,
-		(uint8_t *)edid,
-		(edid->extensions + 1) * EDID_LENGTH,
-		&init_params);
+	aconnector->dc_em_sink = dc_link_add_remote_sink(aconnector->dc_link,
+							 drm_edid, 0,
+							 &init_params);
 
 	if (aconnector->base.force == DRM_FORCE_ON) {
 		aconnector->dc_sink = aconnector->dc_link->local_sink ?
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index d4d60d62964c..288e87f92f9e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -48,6 +48,7 @@
 #include "dm_helpers.h"
 #include "ddc_service_types.h"
 #include "clk_mgr.h"
+#include "dc_edid.h"
 
 static void apply_edid_quirks(struct drm_device *dev,
 			      const struct drm_edid *drm_edid,
@@ -100,20 +101,16 @@ enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
 	struct amdgpu_dm_connector *aconnector = link->priv;
 	struct drm_connector *connector = &aconnector->base;
 	struct drm_device *dev = connector->dev;
-	struct edid *edid_buf;
-	const struct drm_edid *drm_edid;
+	const struct drm_edid *drm_edid = sink->drm_edid;
 	struct drm_edid_product_id product_id;
 	struct dc_edid_caps *edid_caps = &sink->edid_caps;
 	int sad_count;
 	int i = 0;
 	enum dc_edid_status result = EDID_OK;
 
-	edid_buf = (struct edid *) &sink->dc_edid.raw_edid;
-	if (!edid_caps || !edid_buf)
+	if (!edid_caps || !drm_edid)
 		return EDID_BAD_INPUT;
 
-	drm_edid = drm_edid_alloc(edid_buf, EDID_LENGTH * (edid_buf->extensions + 1));
-
 	if (!drm_edid_valid(drm_edid))
 		result = EDID_BAD_CHECKSUM;
 
@@ -135,10 +132,8 @@ enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
 	apply_edid_quirks(dev, drm_edid, edid_caps);
 
 	sad_count = drm_eld_sad_count(connector->eld);
-	if (sad_count <= 0) {
-		drm_edid_free(drm_edid);
+	if (sad_count <= 0)
 		return result;
-	}
 
 	edid_caps->audio_mode_count = min(sad_count, DC_MAX_AUDIO_DESC_COUNT);
 	for (i = 0; i < edid_caps->audio_mode_count; ++i) {
@@ -158,8 +153,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
 	else
 		edid_caps->speaker_flags = DEFAULT_SPEAKER_LOCATION;
 
-	drm_edid_free(drm_edid);
-
 	return result;
 }
 
@@ -991,7 +984,6 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	int retry = 3;
 	enum dc_edid_status edid_status;
 	const struct drm_edid *drm_edid;
-	const struct edid *edid;
 
 	if (link->aux_mode)
 		ddc = &aconnector->dm_dp_aux.aux.ddc;
@@ -1002,6 +994,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	 * do check sum and retry to make sure read correct edid.
 	 */
 	do {
+		drm_edid_free(sink->drm_edid);
+
 		drm_edid = dm_helpers_read_acpi_edid(aconnector);
 		if (drm_edid)
 			drm_info(connector->dev, "Using ACPI provided EDID for %s\n", connector->name);
@@ -1021,16 +1015,7 @@ enum dc_edid_status dm_helpers_read_local_edid(
 		if (!drm_edid)
 			return EDID_NO_RESPONSE;
 
-		edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
-		if (!edid ||
-		    edid->extensions >= sizeof(sink->dc_edid.raw_edid) / EDID_LENGTH)
-			return EDID_BAD_INPUT;
-
-		sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
-		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
-
-		/* We don't need the original edid anymore */
-		drm_edid_free(drm_edid);
+		sink->drm_edid = drm_edid;
 
 		edid_status = dm_helpers_parse_edid_caps(link, sink);
 
@@ -1055,6 +1040,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
 
 		test_response.bits.EDID_CHECKSUM_WRITE = 1;
 
+		// TODO: drm_edid doesn't have a helper for dp_write_dpcd yet
+		dc_edid_copy_edid_to_sink(sink);
 		dm_helpers_dp_write_dpcd(ctx,
 					link,
 					DP_TEST_EDID_CHECKSUM,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 7187d5aedf0a..5ca3e668c8aa 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -359,12 +359,10 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 					.link = aconnector->dc_link,
 					.sink_signal = SIGNAL_TYPE_DISPLAY_PORT_MST };
 
-				dc_sink = dc_link_add_remote_sink(
-					aconnector->dc_link,
-					NULL,
-					0,
-					&init_params);
-
+				dc_sink = dc_link_add_remote_sink(aconnector->dc_link,
+								  NULL,
+								  0,
+								  &init_params);
 				if (!dc_sink) {
 					DRM_ERROR("Unable to add a remote sink\n");
 					return 0;
@@ -397,15 +395,10 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 		struct dc_sink_init_data init_params = {
 				.link = aconnector->dc_link,
 				.sink_signal = SIGNAL_TYPE_DISPLAY_PORT_MST };
-		const struct edid *edid;
-
-		edid = drm_edid_raw(aconnector->drm_edid); // FIXME: Get rid of drm_edid_raw()
-		dc_sink = dc_link_add_remote_sink(
-			aconnector->dc_link,
-			(uint8_t *)edid,
-			(edid->extensions + 1) * EDID_LENGTH,
-			&init_params);
 
+		dc_sink = dc_link_add_remote_sink(aconnector->dc_link,
+						  aconnector->drm_edid, 0,
+						  &init_params);
 		if (!dc_sink) {
 			DRM_ERROR("Unable to add a remote sink\n");
 			return 0;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
index 493815829aa5..d89a82c349fa 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
@@ -6,25 +6,31 @@
 bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
 			  struct dc_sink *current_sink)
 {
-	struct dc_edid *old_edid = &prev_sink->dc_edid;
-	struct dc_edid *new_edid = &current_sink->dc_edid;
-
-       if (old_edid->length != new_edid->length)
-               return false;
-
-       if (new_edid->length == 0)
-               return false;
-
-       return (memcmp(old_edid->raw_edid,
-                      new_edid->raw_edid, new_edid->length) == 0);
+	return drm_edid_eq(prev_sink->drm_edid, current_sink->drm_edid);
 }
 
 void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
 			     const void *edid,
 			     int len)
 {
-	memmove(dc_sink->dc_edid.raw_edid, edid, len);
-	dc_sink->dc_edid.length = len;
+	dc_sink->drm_edid = drm_edid_dup((const struct drm_edid *) edid);
+}
+
+void dc_edid_copy_edid_to_sink(struct dc_sink *sink)
+{
+	const struct edid *edid;
+
+	edid = drm_edid_raw(sink->drm_edid); // FIXME: Get rid of drm_edid_raw()
+	if (!edid ||
+	    edid->extensions >= sizeof(sink->dc_edid.raw_edid) / EDID_LENGTH) {
+		memset(sink->dc_edid.raw_edid, 0, sizeof(sink->dc_edid.raw_edid));
+		sink->dc_edid.length = 0;
+		return;
+	}
+
+	sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
+	memcpy(sink->dc_edid.raw_edid, (uint8_t *) edid,
+	       sink->dc_edid.length);
 }
 
 void dc_edid_sink_edid_free(struct dc_sink *sink)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
index 2c76768be459..a95cc6ccc743 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
@@ -9,6 +9,7 @@ bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
 			  struct dc_sink *current_sink);
 void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
 			     const void *edid, int len);
+void dc_edid_copy_edid_to_sink(struct dc_sink *sink);
 void dc_edid_sink_edid_free(struct dc_sink *sink);
 
 #endif /* __DC_EDID_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index 0fcdf803b7a0..5df87d39903e 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -1134,6 +1134,7 @@ static bool detect_link_and_local_sink(struct dc_link *link,
 			dp_trace_init(link);
 
 		/* Connectivity log: detection */
+		dc_edid_copy_edid_to_sink(sink);
 		for (i = 0; i < sink->dc_edid.length / DC_EDID_BLOCK_SIZE; i++) {
 			CONN_DATA_DETECT(link,
 					 &sink->dc_edid.raw_edid[i * DC_EDID_BLOCK_SIZE],
@@ -1416,7 +1417,7 @@ struct dc_sink *link_add_remote_sink(
 	 * parsing fails
 	 */
 	if (edid_status != EDID_OK && edid_status != EDID_PARTIAL_VALID) {
-		dc_sink->dc_edid.length = 0;
+		dc_edid_sink_edid_free(dc_sink);
 		dm_error("Bad EDID, status%d!\n", edid_status);
 	}
 
-- 
2.47.2

