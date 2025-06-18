Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2D6ADF13A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 17:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC1F10E89C;
	Wed, 18 Jun 2025 15:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rrz89Pep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7742210E8A5;
 Wed, 18 Jun 2025 15:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z3cFWrbQiY93WQg7GRii7C93h4vrxQiyIgdIvc/ni84=; b=rrz89PepaWbl2+xokGFGKn3Rlu
 Wj8eIoWq2QhAr9qEng6AQiUnbo+KXJFV6dIvH7n43RMJxvsErsdOi0LcoDZXgwSdYrXi1HKefempa
 x7Mfz3Fmlm6kU69qbxQHzwiE2zDnMnZLPGxFm8UgTMa586MbuZH1Tw/+PGo6iUuAqgFfDfvY6TtZA
 dk27+WfewHSoc6O/Y4qjMGZCMZWz5Zd0witzDFyRtJkjJilx00wldh7T58PWDCJrXwqLqvsOrReRG
 wbOeGW/OWvAOBLiRRD/GRVfIhyfMFA0IcV04Mttp2zLNSnCnbqDqxtAm8svpuze/Jz9peBnX8+cxA
 WYcCeBTQ==;
Received: from [189.6.13.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uRud6-0057e5-CM; Wed, 18 Jun 2025 17:23:12 +0200
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v5 08/14] drm/amd/display: simplify dm_helpers_parse_edid_caps
 signature
Date: Wed, 18 Jun 2025 12:19:47 -0300
Message-ID: <20250618152216.948406-9-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250618152216.948406-1-mwen@igalia.com>
References: <20250618152216.948406-1-mwen@igalia.com>
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

v4:
- fix kernel-doc
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 +---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 23 ++++++++-----------
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |  7 ++----
 .../drm/amd/display/dc/link/link_detection.c  |  5 +---
 4 files changed, 13 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2f806bc6322b..c7efeb9f38b6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7384,10 +7384,7 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
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
index e7cfbee6c67f..abfce44dcee7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -89,29 +89,27 @@ static void apply_edid_quirks(struct drm_device *dev,
 /**
  * dm_helpers_parse_edid_caps() - Parse edid caps
  *
- * @link: current detected link
- * @edid:	[in] pointer to edid
- * @edid_caps:	[in] pointer to edid caps
+ * @link: current detected link (connector)
+ * @sink: current detected sink (display)
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
 
-
-	if (!edid_caps || !edid)
+	edid_buf = (struct edid *) &sink->dc_edid.raw_edid;
+	if (!edid_caps || !edid_buf)
 		return EDID_BAD_INPUT;
 
 	drm_edid = drm_edid_alloc(edid_buf, EDID_LENGTH * (edid_buf->extensions + 1));
@@ -1030,10 +1028,7 @@ enum dc_edid_status dm_helpers_read_local_edid(
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
index 9655e6fa53a4..5ac361c59371 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -1420,10 +1420,7 @@ struct dc_sink *link_add_remote_sink(
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

