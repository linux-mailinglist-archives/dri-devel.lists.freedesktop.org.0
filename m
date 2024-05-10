Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5718C275D
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 17:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6BB10ECD4;
	Fri, 10 May 2024 15:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DMlfS+bx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6E910ECE9;
 Fri, 10 May 2024 15:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715353721; x=1746889721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VygzENeS9ofiv5mahiPKTFpKMSK0qMIQDak/swZqdwg=;
 b=DMlfS+bx6WiE1OAkBkQ7sbW/q5RyWgirNwo+mMOjiZ9zrkpnYenyODnC
 BycJEG0IAXhPKy7VA1zPpxNe0/WfDPhNlUScuZfJ5fhufmuzv3B4n8zK8
 aZ5hXVAHX6pJfZkC0tAEniE26iUN7OG9seXc251z6vu08PBH/PTpVIBhH
 dEVgdGC0IpcnMgFanfVTI4dpfFgrpCJvFd6h/G7u9rstF0TH5K0i/JBku
 qgfBuPZJhdutWH3gfOoA2xDXnCViyHKuYD8KqNdbg5BtXwtwBQGheR0ZB
 gwgb5xORHttxlbbV9HxFkO1M/GGU3DCWQqC/2GnUUqWrL3KCKTaiV+XHE Q==;
X-CSE-ConnectionGUID: Abb/DMPoTquvSzvnw69tJQ==
X-CSE-MsgGUID: /nOmPWasQqSHr/EvwpOoWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22009794"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="22009794"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:08:40 -0700
X-CSE-ConnectionGUID: ddQn4QFlQaq+Hy6+lZz7bQ==
X-CSE-MsgGUID: eELxkMKESRqmLgeIcqUG1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="30204418"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:08:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>
Subject: [RESEND 3/6] drm/radeon: remove radeon_connector_edid() and stop
 using edid_blob_ptr
Date: Fri, 10 May 2024 18:08:10 +0300
Message-Id: <b2bdec9161ddcbf79c8516aeea508a9903bd0074.1715353572.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1715353572.git.jani.nikula@intel.com>
References: <cover.1715353572.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

radeon_connector_edid() copies the EDID from edid_blob_ptr as a side
effect if radeon_connector->edid isn't initialized. However, everywhere
that the returned EDID is used, the EDID should have been set
beforehands.

Only the drm EDID code should look at the EDID property, anyway, so stop
using it.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/radeon/radeon_audio.c      |  7 ++++---
 drivers/gpu/drm/radeon/radeon_connectors.c | 15 ---------------
 drivers/gpu/drm/radeon/radeon_mode.h       |  2 --
 3 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index 16c10db3ce6f..0bcd767b9f47 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -303,6 +303,7 @@ void radeon_audio_endpoint_wreg(struct radeon_device *rdev, u32 offset,
 static void radeon_audio_write_sad_regs(struct drm_encoder *encoder)
 {
 	struct drm_connector *connector = radeon_get_connector_for_encoder(encoder);
+	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct cea_sad *sads;
 	int sad_count;
@@ -310,7 +311,7 @@ static void radeon_audio_write_sad_regs(struct drm_encoder *encoder)
 	if (!connector)
 		return;
 
-	sad_count = drm_edid_to_sad(radeon_connector_edid(connector), &sads);
+	sad_count = drm_edid_to_sad(radeon_connector->edid, &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
 	if (sad_count <= 0)
@@ -326,6 +327,7 @@ static void radeon_audio_write_sad_regs(struct drm_encoder *encoder)
 static void radeon_audio_write_speaker_allocation(struct drm_encoder *encoder)
 {
 	struct drm_connector *connector = radeon_get_connector_for_encoder(encoder);
+	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	u8 *sadb = NULL;
 	int sad_count;
@@ -333,8 +335,7 @@ static void radeon_audio_write_speaker_allocation(struct drm_encoder *encoder)
 	if (!connector)
 		return;
 
-	sad_count = drm_edid_to_speaker_allocation(radeon_connector_edid(connector),
-						   &sadb);
+	sad_count = drm_edid_to_speaker_allocation(radeon_connector->edid, &sadb);
 	if (sad_count < 0) {
 		DRM_DEBUG("Couldn't read Speaker Allocation Data Block: %d\n",
 			  sad_count);
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 81b5c3c8f658..80879e946342 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -255,21 +255,6 @@ static struct drm_encoder *radeon_find_encoder(struct drm_connector *connector,
 	return NULL;
 }
 
-struct edid *radeon_connector_edid(struct drm_connector *connector)
-{
-	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
-	struct drm_property_blob *edid_blob = connector->edid_blob_ptr;
-
-	if (radeon_connector->edid) {
-		return radeon_connector->edid;
-	} else if (edid_blob) {
-		struct edid *edid = kmemdup(edid_blob->data, edid_blob->length, GFP_KERNEL);
-		if (edid)
-			radeon_connector->edid = edid;
-	}
-	return radeon_connector->edid;
-}
-
 static void radeon_connector_get_edid(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 546381a5c918..e0a5af180801 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -701,8 +701,6 @@ extern u16 radeon_connector_encoder_get_dp_bridge_encoder_id(struct drm_connecto
 extern bool radeon_connector_is_dp12_capable(struct drm_connector *connector);
 extern int radeon_get_monitor_bpc(struct drm_connector *connector);
 
-extern struct edid *radeon_connector_edid(struct drm_connector *connector);
-
 extern void radeon_connector_hotplug(struct drm_connector *connector);
 extern int radeon_dp_mode_valid_helper(struct drm_connector *connector,
 				       struct drm_display_mode *mode);
-- 
2.39.2

