Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6372A866DE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 22:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD6910EC8F;
	Fri, 11 Apr 2025 20:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PHhe7eEW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A61D10EC8F;
 Fri, 11 Apr 2025 20:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3i5MrLa8+wtoOzjOoZ6gt4WTRyqc5q+rZf82aUTLAaY=; b=PHhe7eEWOWaPKvzK+YjuvyJ2U1
 uCb6KS0VZXA4Gs0UvoXKqtFhUO0glDqFyAKfP7f8Up6z24tEfY+IsrAZ1lowUsC6VgZzGRhzrDYNd
 7LZ3Qhwq/l9MHwH1TYrBXd0UUmHg6JfArjrs4qv9EP2FCYAzARSh/ecCftQ/uU627lq1r2p7JNZUW
 g5hqxs8o+u991c8B0FURXXDq1kkHj8hdrzBeGxDYfuYpkrU0SLHaRrR6PD+EWTCgs3DyJRfaHXnzp
 P3qnJRgGng0k/fQpTiOO2UXlL3Zfd8LxpJgC56skfLFSRBIqU3TlnRwypke7EPYkeAMaEeS9jdohM
 3D7uH1JA==;
Received: from [189.6.35.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u3KlU-00FIP5-NW; Fri, 11 Apr 2025 22:14:17 +0200
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH 07/13] drm/amd/display: simplify dm_helpers_parse_edid_caps
 signature
Date: Fri, 11 Apr 2025 17:08:37 -0300
Message-ID: <20250411201333.151335-8-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250411201333.151335-1-mwen@igalia.com>
References: <20250411201333.151335-1-mwen@igalia.com>
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

Pass dc_sink to dm_helpers_parse_edid_caps(), since it already contains
edid info. It's a groundwork to get rid of raw edid stored as dc_edid.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c   |  5 +----
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c   | 17 +++++++----------
 drivers/gpu/drm/amd/display/dc/dm_helpers.h     |  7 ++-----
 .../drm/amd/display/dc/link/link_detection.c    |  5 +----
 4 files changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 960bb8c62ffe..3cad6d9153f7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7529,10 +7529,7 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
 		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
 		memmove(dc_em_sink->dc_edid.raw_edid, edid,
 			(edid->extensions + 1) * EDID_LENGTH);
-		dm_helpers_parse_edid_caps(
-			dc_link,
-			&dc_em_sink->dc_edid,
-			&dc_em_sink->edid_caps);
+		dm_helpers_parse_edid_caps(dc_link, dc_em_sink);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index a96f527a59df..3082582c1579 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -95,22 +95,22 @@ static void apply_edid_quirks(struct drm_device *dev,
  *
  * Return: void
  */
-enum dc_edid_status dm_helpers_parse_edid_caps(
-		struct dc_link *link,
-		const struct dc_edid *edid,
-		struct dc_edid_caps *edid_caps)
+enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
+					       struct dc_sink *sink)
 {
 	struct amdgpu_dm_connector *aconnector = link->priv;
 	struct drm_connector *connector = &aconnector->base;
 	struct drm_device *dev = connector->dev;
-	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
+	struct edid *edid_buf;
 	const struct drm_edid *drm_edid;
 	struct drm_edid_product_id product_id;
+	struct dc_edid_caps *edid_caps = &sink->edid_caps;
 	int sad_count;
 	int i = 0;
 	enum dc_edid_status result = EDID_OK;
 
-	if (!edid_caps || !edid)
+	edid_buf = (struct edid *) &sink->dc_edid.raw_edid;
+	if (!edid_caps || !edid_buf)
 		return EDID_BAD_INPUT;
 
 	drm_edid = drm_edid_alloc(edid_buf, EDID_LENGTH * (edid_buf->extensions + 1));
@@ -1030,10 +1030,7 @@ enum dc_edid_status dm_helpers_read_local_edid(
 		/* We don't need the original edid anymore */
 		drm_edid_free(drm_edid);
 
-		edid_status = dm_helpers_parse_edid_caps(
-						link,
-						&sink->dc_edid,
-						&sink->edid_caps);
+		edid_status = dm_helpers_parse_edid_caps(link, sink);
 
 	} while (edid_status == EDID_BAD_CHECKSUM && --retry > 0);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
index 9d160b39e8c5..ce6a70368bd0 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
@@ -59,11 +59,8 @@ void dm_helpers_free_gpu_mem(
 		enum dc_gpu_mem_alloc_type type,
 		void *pvMem);
 
-enum dc_edid_status dm_helpers_parse_edid_caps(
-	struct dc_link *link,
-	const struct dc_edid *edid,
-	struct dc_edid_caps *edid_caps);
-
+enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
+					       struct dc_sink *sink);
 
 /*
  * Update DP branch info
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index cc9191a5c9e6..8c7a00c1ad2b 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -1429,10 +1429,7 @@ struct dc_sink *link_add_remote_sink(
 			dc_sink))
 		goto fail_add_sink;
 
-	edid_status = dm_helpers_parse_edid_caps(
-			link,
-			&dc_sink->dc_edid,
-			&dc_sink->edid_caps);
+	edid_status = dm_helpers_parse_edid_caps(link, dc_sink);
 
 	/*
 	 * Treat device as no EDID device if EDID
-- 
2.47.2

