Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C324894B171
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 22:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2072D10E5E1;
	Wed,  7 Aug 2024 20:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BNvTpw3I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793E110E5E2;
 Wed,  7 Aug 2024 20:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7ucj5VfOj9zNojWXHEd9BVni8k6nB/XwFkhfZUowHBM=; b=BNvTpw3IEv3UyG+gtCF+B+6Kvy
 qPeyTsW6z5nv5Jp5oLaBjdUyLUKqJqaCdnjrz/f9oUhK+cqodf/wc5Aj7+O+XG8Sx/kLIV7MqYk65
 GwGKv0qrThm0Lm2Tl5oPTf9duTJCIn70cRJnbB+d5ME4aRQxYr9hH+cf2sRXH903AgrwG3Xky6oWa
 CoDlQdxn2tNh2R2zeOb6nCeyPl8l6tygubA0ipBkWFssrk5UJXrYnsR2wmepY8X9jxYHJnlXsAPqu
 TlwYMq0R6PThjSZVm8E57AJ7o0WNndMt38BWIHwFFfo850e04ZCMaGruSSyAUpNDJLFEijQmRRqCD
 sgCxyllg==;
Received: from [189.6.17.125] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sbnMI-0098Re-EX; Wed, 07 Aug 2024 22:34:10 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, kernel-dev@igalia.com,
 Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 9/9] drm/amd/display: remove dc_edid handler from
 dm_helpers_parse_edid_caps
Date: Wed,  7 Aug 2024 19:25:11 -0100
Message-ID: <20240807203207.2830-10-mwen@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807203207.2830-1-mwen@igalia.com>
References: <20240807203207.2830-1-mwen@igalia.com>
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

v5: also remove the parameter from kernel-doc (kernel test bot)

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 +--
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 32 ++++++++-----------
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |  1 -
 .../drm/amd/display/dc/link/link_detection.c  |  6 ++--
 4 files changed, 17 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a710d0576edd..e75d7e58df16 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7030,10 +7030,7 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
 		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
 		memmove(dc_em_sink->dc_edid.raw_edid, edid,
 			(edid->extensions + 1) * EDID_LENGTH);
-		dm_helpers_parse_edid_caps(
-			dc_link,
-			&dc_em_sink->dc_edid,
-			&dc_em_sink->edid_caps);
+		dm_helpers_parse_edid_caps(dc_link, &dc_em_sink->edid_caps);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index e785b1e3277b..87b19c50ee55 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -82,32 +82,24 @@ static void apply_edid_quirks(struct drm_edid_product_id *product_id, struct dc_
  * dm_helpers_parse_edid_caps() - Parse edid caps
  *
  * @link: current detected link
- * @edid:	[in] pointer to edid
  * @edid_caps:	[in] pointer to edid caps
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
@@ -919,19 +911,23 @@ enum dc_edid_status dm_helpers_read_local_edid(
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
@@ -1294,4 +1290,4 @@ bool dm_helpers_is_hdr_on(struct dc_context *ctx, struct dc_stream_state *stream
 {
 	// TODO
 	return false;
-}
\ No newline at end of file
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
index 2e4a46f1b499..4e1776b5f0d4 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
@@ -61,7 +61,6 @@ void dm_helpers_free_gpu_mem(
 
 enum dc_edid_status dm_helpers_parse_edid_caps(
 	struct dc_link *link,
-	const struct dc_edid *edid,
 	struct dc_edid_caps *edid_caps);
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index 391dbe81534d..5fdd3e7da54e 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -1414,10 +1414,8 @@ struct dc_sink *link_add_remote_sink(
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

