Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61697929093
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jul 2024 05:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA42A10EA35;
	Sat,  6 Jul 2024 03:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="B09MFEOG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71EE10EA14;
 Sat,  6 Jul 2024 03:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ekbQDooGGkHs+OEBp01r7ebDHbjjVf+o0Kyh/Fj/m7Y=; b=B09MFEOGQ4fn/DonXCu7z9fcZ+
 4f6C3tKoFyReoxV3lmCTkVhZBI8MgY/YbqhZiYeTs8EU3Y7u1uB0i8S+Qrs53DhgS+RLTsy+FmKcF
 nddZ8eUsELiPEG2QD6C7+odIjYF37WaH75IKLpsbXQfxvMpoyT9wIpBEsKQ2OoDzGLWvrtysVUqtW
 aUcej2ryvDhdOkCZlzIPp1AGztLt34EpRbuxgPoIlk+sV5w6+Nt8lZTsCg3KgmzHGG1Ke429elpPf
 LkhZ6LbuJeoQXm2pzkq1cGa17xtYzSNFhND0Ed77H9UPwAy7Xd7esWUxHc8KhoEoVJVHCgy+BMiYd
 a5kY207w==;
Received: from [189.6.17.125] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sPwIQ-00Bj27-Q1; Sat, 06 Jul 2024 05:41:11 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v4 11/11] drm/amd/display: remove dc_edid handler from
 dm_helpers_parse_edid_caps
Date: Sat,  6 Jul 2024 00:35:12 -0300
Message-ID: <20240706034004.801329-12-mwen@igalia.com>
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

We can parse edid caps from drm_edid and drm_eld and any calls of
dm_helpers_parse_edid_caps is made in a state that we have drm_edid set
to amdgpu connector.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 ++--
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 29 +++++++++----------
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |  1 -
 .../drm/amd/display/dc/link/link_detection.c  |  6 ++--
 4 files changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 34e380b4408e..fd3580bf1fb2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7024,10 +7024,8 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
 
 		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
 		memmove(dc_em_sink->dc_edid.raw_edid, (uint8_t *)edid, (edid->extensions + 1) * EDID_LENGTH);
-		dm_helpers_parse_edid_caps(
-			dc_link,
-			&dc_em_sink->dc_edid,
-			&dc_em_sink->edid_caps);
+		dm_helpers_parse_edid_caps(dc_link,
+					   &dc_em_sink->edid_caps);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 3fb07f437793..59c12cb1db5a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -87,27 +87,20 @@ static void apply_edid_quirks(struct drm_edid_product_id *product_id, struct dc_
  *
  * Return: void
  */
-enum dc_edid_status dm_helpers_parse_edid_caps(
-		struct dc_link *link,
-		const struct dc_edid *edid,
-		struct dc_edid_caps *edid_caps)
+enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
+					       struct dc_edid_caps *edid_caps)
 {
 	struct amdgpu_dm_connector *aconnector = link->priv;
 	struct drm_connector *connector = &aconnector->base;
 	const struct drm_edid *drm_edid = aconnector->drm_edid;
 	struct drm_edid_product_id product_id;
-	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
 	int sad_count;
 	int i = 0;
-
 	enum dc_edid_status result = EDID_OK;
 
-	if (!edid_caps || !edid)
+	if (!edid_caps || !drm_edid)
 		return EDID_BAD_INPUT;
 
-	if (!drm_edid_is_valid(edid_buf))
-		result = EDID_BAD_CHECKSUM;
-
 	drm_edid_get_product_id(drm_edid, &product_id);
 
 	edid_caps->manufacturer_id = le16_to_cpu(product_id.manufacturer_name);
@@ -919,19 +912,23 @@ enum dc_edid_status dm_helpers_read_local_edid(
 		if (!drm_edid)
 			return EDID_NO_RESPONSE;
 
-		edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
+		/* FIXME: Get rid of drm_edid_raw()
+		 * Raw edid is still needed for dm_helpers_dp_write_dpcd()
+		 */
+		edid = drm_edid_raw(drm_edid);
 		sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
 		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
 
 		edid_status = dm_helpers_parse_edid_caps(
 						link,
-						&sink->dc_edid,
 						&sink->edid_caps);
 
-		/* We don't need the original edid anymore */
-		drm_edid_free(drm_edid);
-
-	} while (edid_status == EDID_BAD_CHECKSUM && --retry > 0);
+		if (edid_status != EDID_OK) {
+			/* We can discard the drm_edid and retry */
+			drm_edid_free(drm_edid);
+			drm_edid_connector_update(connector, drm_edid);
+		}
+	} while (edid_status != EDID_OK && --retry > 0);
 
 	if (edid_status != EDID_OK)
 		DRM_ERROR("EDID err: %d, on connector: %s",
diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
index 34adae7ab6e8..bcdfc46c844e 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
@@ -61,7 +61,6 @@ void dm_helpers_free_gpu_mem(
 
 enum dc_edid_status dm_helpers_parse_edid_caps(
 	struct dc_link *link,
-	const struct dc_edid *edid,
 	struct dc_edid_caps *edid_caps);
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index bba644024780..c7bb146636b2 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -1417,10 +1417,8 @@ struct dc_sink *link_add_remote_sink(
 			dc_sink))
 		goto fail_add_sink;
 
-	edid_status = dm_helpers_parse_edid_caps(
-			link,
-			&dc_sink->dc_edid,
-			&dc_sink->edid_caps);
+	edid_status = dm_helpers_parse_edid_caps(link,
+						 &dc_sink->edid_caps);
 
 	/*
 	 * Treat device as no EDID device if EDID
-- 
2.43.0

