Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFA8975C95
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 23:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3338510EAC6;
	Wed, 11 Sep 2024 21:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eKRCVwUI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1CF10EAB2;
 Wed, 11 Sep 2024 21:36:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 18CBA5C0775;
 Wed, 11 Sep 2024 21:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE16C4CECD;
 Wed, 11 Sep 2024 21:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726090563;
 bh=7tShgrqf0WYpeU7vGOpHUCbGacprP/Qcboukklbpohw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eKRCVwUIfwtoOfBhc/JEUp2eYgBy578OXGNCiT2SGX9DVqUtrpnY4zYsugcBcxVu4
 AjgQmY5T0izylPsimNqTqmcwBqHf4igg6Y+afu/FwLJ8N0rZ2pOWrizLJWdZb2GInR
 2HoDU88BbtUyHNujAt2/a7KZhiwrkThxo+RJfqdM9sp2k1rZrvtHaBhcEk7U3UgGou
 OFQL1kgRAabz8L4u3MT75hJqX19hMLsc0VoZXAmcuVpDFMIrVxZnQnjhzo40cpltZb
 aGZBkw1HRMnxJqON2HnerQmXuwKneED7knWeVnyHabXkE5zgfd5CLyJ5eUoddkXITU
 DG6dw3BPV3fKA==
From: Mario Limonciello <superm1@kernel.org>
To: Alex Hung <alex.hung@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v6 09/10] drm/amd/display: remove dc_edid handler from
 dm_helpers_parse_edid_caps
Date: Wed, 11 Sep 2024 16:35:35 -0500
Message-ID: <20240911213537.2338164-10-superm1@kernel.org>
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

We can parse edid caps from drm_edid and drm_eld and any calls of
dm_helpers_parse_edid_caps is made in a state that we have drm_edid set
to amdgpu connector.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v6:
- Move changelog below cutlist
- Rebase on v6.11-rc7
v5: also remove the parameter from kernel-doc (kernel test bot)
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 +---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 30 ++++++++-----------
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |  1 -
 .../drm/amd/display/dc/link/link_detection.c  |  6 ++--
 4 files changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a1379ac0e628..d3074a020ba1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7059,10 +7059,7 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
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
index 72ea78ff2c5b..1118986bb3e2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -83,32 +83,24 @@ static void apply_edid_quirks(struct drm_edid_product_id *product_id,
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
@@ -920,19 +912,23 @@ enum dc_edid_status dm_helpers_read_local_edid(
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

