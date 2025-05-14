Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 334D3AB76E3
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 22:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E63B10E730;
	Wed, 14 May 2025 20:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Bj4TU7/U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC3210E730;
 Wed, 14 May 2025 20:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tsGtFVCbhVMdn3syFj/MBu54gq5IkBl7rg+7jBReZ3U=; b=Bj4TU7/UBPwv7S7ck2QGUI7w34
 5YnXxnkJWuGnXIs65JwT8YtW4G1Va+ujBprFyyaAuwAyEB1+wQXMyRBuLJitkynBYx8VTrjap9vWu
 Rzax6lSwGJw1tV+GkzArfZLYfxfPbKOiG5xnyST8zSny8wZ8JB1b+OtSzUzy3+GPgxNW5Ifet5tLQ
 n25CfOH4pUAjgCsNw1pEb7yvQeFZu1DU3jMvz8S/k6AqSCQN3/UKUv3G00pz3E90zzbkd3LSc7mSZ
 aYRsLY6PAi25lwzIYX9znhJeloXQqsvbRS2mAONOt4Krvtwj6sUyUaoQk1pKbUdplIHdFEHGB7Isk
 b58Ob3oQ==;
Received: from [189.6.16.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uFIXL-008Klg-AH; Wed, 14 May 2025 22:22:56 +0200
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v3 14/14] drm/amd/display: move dc_sink from dc_edid to
 drm_edid
Date: Wed, 14 May 2025 17:19:21 -0300
Message-ID: <20250514202130.291324-15-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250514202130.291324-1-mwen@igalia.com>
References: <20250514202130.291324-1-mwen@igalia.com>
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
- remove uneccessary include (jani)
- use dc_edid_sink_edid_free in link_detection

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 26 +++++++------------
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 24 +++++------------
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 21 +++++----------
 .../gpu/drm/amd/display/amdgpu_dm/dc_edid.c   | 26 +++++++++----------
 .../gpu/drm/amd/display/amdgpu_dm/dc_edid.h   |  1 +
 drivers/gpu/drm/amd/display/dc/dc.h           |  2 --
 .../drm/amd/display/dc/link/link_detection.c  |  3 ++-
 7 files changed, 40 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0650866dfb6d..d26f9b6b2a3c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -68,6 +68,7 @@
 #endif
 #include "amdgpu_dm_psr.h"
 #include "amdgpu_dm_replay.h"
+#include "dc_edid.h"
 
 #include "ivsrcid/ivsrcid_vislands30.h"
 
@@ -3713,6 +3714,8 @@ void amdgpu_dm_update_connector_after_detect(
 	 * 2. Send an event and let userspace tell us what to do
 	 */
 	if (sink) {
+		const struct drm_edid *drm_edid = sink->drm_edid;
+
 		/*
 		 * TODO: check if we still need the S3 mode update workaround.
 		 * If yes, put it here.
@@ -3724,16 +3727,15 @@ void amdgpu_dm_update_connector_after_detect(
 
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
@@ -7378,12 +7380,8 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
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
@@ -7416,7 +7414,6 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
 			.sink_signal = SIGNAL_TYPE_VIRTUAL
 	};
 	const struct drm_edid *drm_edid;
-	const struct edid *edid;
 	struct i2c_adapter *ddc;
 
 	if (dc_link && dc_link->aux_mode)
@@ -7436,12 +7433,9 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
 
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
index 6e42b610cdea..9d2ea7e75bfb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -48,6 +48,7 @@
 #include "dm_helpers.h"
 #include "ddc_service_types.h"
 #include "clk_mgr.h"
+#include "dc_edid.h"
 
 static void apply_edid_quirks(struct drm_device *dev,
 			      const struct drm_edid *drm_edid,
@@ -101,20 +102,16 @@ enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
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
 
@@ -136,10 +133,8 @@ enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
 	apply_edid_quirks(dev, drm_edid, edid_caps);
 
 	sad_count = drm_eld_sad_count(connector->eld);
-	if (sad_count <= 0) {
-		drm_edid_free(drm_edid);
+	if (sad_count <= 0)
 		return result;
-	}
 
 	edid_caps->audio_mode_count = min(sad_count, DC_MAX_AUDIO_DESC_COUNT);
 	for (i = 0; i < edid_caps->audio_mode_count; ++i) {
@@ -159,8 +154,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
 	else
 		edid_caps->speaker_flags = DEFAULT_SPEAKER_LOCATION;
 
-	drm_edid_free(drm_edid);
-
 	return result;
 }
 
@@ -992,7 +985,6 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	int retry = 3;
 	enum dc_edid_status edid_status;
 	const struct drm_edid *drm_edid;
-	const struct edid *edid;
 
 	if (link->aux_mode)
 		ddc = &aconnector->dm_dp_aux.aux.ddc;
@@ -1022,11 +1014,7 @@ enum dc_edid_status dm_helpers_read_local_edid(
 		if (!drm_edid)
 			return EDID_NO_RESPONSE;
 
-		edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
-		sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
-		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
-
-		/* We don't need the original edid anymore */
+		sink->drm_edid = drm_edid_dup(drm_edid);
 		drm_edid_free(drm_edid);
 
 		edid_status = dm_helpers_parse_edid_caps(link, sink);
@@ -1052,6 +1040,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
 
 		test_response.bits.EDID_CHECKSUM_WRITE = 1;
 
+		// TODO: drm_edid doesn't have a helper for dp_write_dpcd yet
+		dc_edid_copy_edid_to_sink(sink);
 		dm_helpers_dp_write_dpcd(ctx,
 					link,
 					DP_TEST_EDID_CHECKSUM,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 25e8befbcc47..7ab7c365fe06 100644
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
index 9e86dc15557b..ce4a7f9e268a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
@@ -6,25 +6,25 @@
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
+	uint32_t edid_length;
+
+	edid = drm_edid_raw(sink->drm_edid); // FIXME: Get rid of drm_edid_raw()
+	edid_length = EDID_LENGTH * (edid->extensions + 1);
+	memcpy(sink->dc_edid.raw_edid, (uint8_t *) edid, edid_length);
+	sink->dc_edid.length = edid_length;
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
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index e94ed1cc294b..067682b1b6fa 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -46,8 +46,6 @@
 
 #include "dmub/inc/dmub_cmd.h"
 
-#include <drm/drm_edid.h>
-
 struct abm_save_restore;
 
 /* forward declaration */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index 978d2b4a4d29..abb794394de9 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -1142,6 +1142,7 @@ static bool detect_link_and_local_sink(struct dc_link *link,
 			dp_trace_init(link);
 
 		/* Connectivity log: detection */
+		dc_edid_copy_edid_to_sink(sink);
 		for (i = 0; i < sink->dc_edid.length / DC_EDID_BLOCK_SIZE; i++) {
 			CONN_DATA_DETECT(link,
 					 &sink->dc_edid.raw_edid[i * DC_EDID_BLOCK_SIZE],
@@ -1424,7 +1425,7 @@ struct dc_sink *link_add_remote_sink(
 	 * parsing fails
 	 */
 	if (edid_status != EDID_OK && edid_status != EDID_PARTIAL_VALID) {
-		dc_sink->dc_edid.length = 0;
+		dc_edid_sink_edid_free(dc_sink);
 		dm_error("Bad EDID, status%d!\n", edid_status);
 	}
 
-- 
2.47.2

