Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6DFC3CA24
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6477410E975;
	Thu,  6 Nov 2025 16:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JwnRwQn/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B024010E975;
 Thu,  6 Nov 2025 16:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OwPnQegnRpophNytv43JKth0tVwcKMnSVGDCSqUWdk8=; b=JwnRwQn/jt5R7YzWU32EdkeX/9
 2RqEBZLyMNMc6OqsR1Zh7ThESNwqadgeL2/wdQA7G8qUDPYW8nkLYM2Vayp/s6SAmLGXbD4hZeqwV
 cHV4GujQsLdxPfal7n3hCFggkMI8uZ6VvM4kyOmZhWoAWO/UuWYvXBjg/RWpV+A4QzSqW718TpyNO
 O1vKVVAeHeSq5EaTKPhFuQriKQSnZJ7KUW5Q9BGRuPmKfjt8TYttN56B4PxqgxGqCwnj+nmNrEfAf
 8H0FajkhYuOcLZ1xBtLdXxjGbQ7n43qiU1nXrdPrICI/hGhLeRU+exnknOoPGkKm/XkOf6dXIMjVO
 U7WkIHsg==;
Received: from [186.208.74.26] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vH3I0-0035jh-ET; Thu, 06 Nov 2025 17:56:48 +0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, andrzej.hajda@intel.com,
 christian.koenig@amd.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, mwen@igalia.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, simona@ffwll.ch, sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Michel Daenzer <michel.daenzer@mailbox.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v7 11/15] drm/amd/display: add DM helpers to handle EDID in DC
 via drm_edid helpers
Date: Thu,  6 Nov 2025 13:49:14 -0300
Message-ID: <20251106165536.161662-12-mwen@igalia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251106165536.161662-1-mwen@igalia.com>
References: <20251106165536.161662-1-mwen@igalia.com>
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

This will allow us to remove some ocurrences of drm_edid_raw() and the
driver will reduce handling raw EDID data in favor of drm_edid helpers.

v7:
- instead of new files, move edid-related helpers to dm_helpers (Harry)

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c    | 16 ++++++++++++++++
 drivers/gpu/drm/amd/display/dc/dm_helpers.h      |  4 ++++
 .../gpu/drm/amd/display/dc/link/link_detection.c | 15 +--------------
 3 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index c14d62e63c08..f3cc6ea11c6f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -983,6 +983,22 @@ dm_helpers_read_acpi_edid(struct amdgpu_dm_connector *aconnector)
 	return drm_edid_read_custom(connector, dm_helpers_probe_acpi_edid, connector);
 }
 
+bool dm_helpers_is_same_edid(struct dc_sink *prev_sink,
+			     struct dc_sink *current_sink)
+{
+	struct dc_edid *old_edid = &prev_sink->dc_edid;
+	struct dc_edid *new_edid = &current_sink->dc_edid;
+
+       if (old_edid->length != new_edid->length)
+               return false;
+
+       if (new_edid->length == 0)
+               return false;
+
+       return (memcmp(old_edid->raw_edid,
+                      new_edid->raw_edid, new_edid->length) == 0);
+}
+
 enum dc_edid_status dm_helpers_read_local_edid(
 		struct dc_context *ctx,
 		struct dc_link *link,
diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
index ce6a70368bd0..2fb445933350 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
@@ -62,6 +62,10 @@ void dm_helpers_free_gpu_mem(
 enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
 					       struct dc_sink *sink);
 
+/* Compare two EDIDs */
+bool dm_helpers_is_same_edid(struct dc_sink *prev_sink,
+			     struct dc_sink *current_sink);
+
 /*
  * Update DP branch info
  */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index d2528e35ae0b..616540acc6ee 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -622,18 +622,6 @@ static bool detect_dp(struct dc_link *link,
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
 
@@ -1214,8 +1202,7 @@ static bool detect_link_and_local_sink(struct dc_link *link,
 		// Check if edid is the same
 		if ((prev_sink) &&
 		    (edid_status == EDID_THE_SAME || edid_status == EDID_OK))
-			same_edid = is_same_edid(&prev_sink->dc_edid,
-						 &sink->dc_edid);
+			same_edid = dm_helpers_is_same_edid(prev_sink, sink);
 
 		if (sink->edid_caps.panel_patch.skip_scdc_overwrite)
 			link->ctx->dc->debug.hdmi20_disable = true;
-- 
2.51.0

