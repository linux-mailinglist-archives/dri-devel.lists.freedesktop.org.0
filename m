Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3531682C3F6
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 17:50:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F7B10EB4D;
	Fri, 12 Jan 2024 16:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934F210EB85;
 Fri, 12 Jan 2024 16:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705078228; x=1736614228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gSgEVQ3iBuWNbqnlH2Tv3oe3FksSpjzQTRnpSeDQpnc=;
 b=dZ+Opgb0HfKSDKdDHu9gHzx/nGUTtYRSqYMVjUfwIGEgCp2FidoBn1H/
 iJowmUzBJBpN96OQ6j4pcCgZXEto3uBUn3QjcmcqyiwnfF04Z5YcWoe9P
 ykd+AhagDwgyzZOVFcSn1KF1BacCsX+QZStM6DcuJXJa7tUgTsaMO+L/G
 2bvoP/8qkZ1fMldC7SozwLWCT8bEliVjNKPyE1sXnA/pJ1RSVJkrXSO3B
 9Vo2VQK2ZbqIH0rf05vjXSzzcfOF3wfZ9tb3lIcQQptk1P1gSgWXHaO7R
 Xg1iQ6ffbB3EHGM3s2lEG2B6GEetjSqAf2c/28eePbOUe07Duv14Xrh5b Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="12583321"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="12583321"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 08:50:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="776044218"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="776044218"
Received: from tsenx-mobl.ger.corp.intel.com (HELO localhost) ([10.252.38.158])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 08:50:24 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] drm/amdgpu: remove amdgpu_connector_edid() and stop using
 edid_blob_ptr
Date: Fri, 12 Jan 2024 18:49:56 +0200
Message-Id: <aa468a8b10421745371465171d44379f14bb18a3.1705078136.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705078136.git.jani.nikula@intel.com>
References: <cover.1705078136.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, Xinhui <Xinhui.Pan@amd.com>,
	amd-gfx@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

amdgpu_connector_edid() copies the EDID from edid_blob_ptr as a side
effect if amdgpu_connector->edid isn't initialized. However, everywhere
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c | 16 ----------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.h |  1 -
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c         |  4 ++--
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c         |  4 ++--
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c          |  4 ++--
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c          |  4 ++--
 6 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index 9caba10315a8..cae7479c3ecf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -246,22 +246,6 @@ amdgpu_connector_find_encoder(struct drm_connector *connector,
 	return NULL;
 }
 
-struct edid *amdgpu_connector_edid(struct drm_connector *connector)
-{
-	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
-	struct drm_property_blob *edid_blob = connector->edid_blob_ptr;
-
-	if (amdgpu_connector->edid) {
-		return amdgpu_connector->edid;
-	} else if (edid_blob) {
-		struct edid *edid = kmemdup(edid_blob->data, edid_blob->length, GFP_KERNEL);
-
-		if (edid)
-			amdgpu_connector->edid = edid;
-	}
-	return amdgpu_connector->edid;
-}
-
 static struct edid *
 amdgpu_connector_get_hardcoded_edid(struct amdgpu_device *adev)
 {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.h
index 61fcef15ad72..eff833b6ed31 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.h
@@ -24,7 +24,6 @@
 #ifndef __AMDGPU_CONNECTORS_H__
 #define __AMDGPU_CONNECTORS_H__
 
-struct edid *amdgpu_connector_edid(struct drm_connector *connector);
 void amdgpu_connector_hotplug(struct drm_connector *connector);
 int amdgpu_connector_get_monitor_bpc(struct drm_connector *connector);
 u16 amdgpu_connector_encoder_get_dp_bridge_encoder_id(struct drm_connector *connector);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 587ee632a3b8..d0ba782f5aea 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -1297,7 +1297,7 @@ static void dce_v10_0_audio_write_speaker_allocation(struct drm_encoder *encoder
 		return;
 	}
 
-	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector_edid(connector), &sadb);
+	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector->edid, &sadb);
 	if (sad_count < 0) {
 		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sad_count);
 		sad_count = 0;
@@ -1367,7 +1367,7 @@ static void dce_v10_0_audio_write_sad_regs(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_sad(amdgpu_connector_edid(connector), &sads);
+	sad_count = drm_edid_to_sad(amdgpu_connector->edid, &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
 	if (sad_count <= 0)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index f22ec27365bd..d540bef6f331 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -1329,7 +1329,7 @@ static void dce_v11_0_audio_write_speaker_allocation(struct drm_encoder *encoder
 		return;
 	}
 
-	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector_edid(connector), &sadb);
+	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector->edid, &sadb);
 	if (sad_count < 0) {
 		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sad_count);
 		sad_count = 0;
@@ -1399,7 +1399,7 @@ static void dce_v11_0_audio_write_sad_regs(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_sad(amdgpu_connector_edid(connector), &sads);
+	sad_count = drm_edid_to_sad(amdgpu_connector->edid, &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
 	if (sad_count <= 0)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index 4dbe9b3259b5..7112d184eaad 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -1201,7 +1201,7 @@ static void dce_v6_0_audio_write_speaker_allocation(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector_edid(connector), &sadb);
+	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector->edid, &sadb);
 	if (sad_count < 0) {
 		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sad_count);
 		sad_count = 0;
@@ -1276,7 +1276,7 @@ static void dce_v6_0_audio_write_sad_regs(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_sad(amdgpu_connector_edid(connector), &sads);
+	sad_count = drm_edid_to_sad(amdgpu_connector->edid, &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
 	if (sad_count <= 0)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index 05bcce23385e..50d35750105c 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -1256,7 +1256,7 @@ static void dce_v8_0_audio_write_speaker_allocation(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector_edid(connector), &sadb);
+	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector->edid, &sadb);
 	if (sad_count < 0) {
 		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sad_count);
 		sad_count = 0;
@@ -1324,7 +1324,7 @@ static void dce_v8_0_audio_write_sad_regs(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_sad(amdgpu_connector_edid(connector), &sads);
+	sad_count = drm_edid_to_sad(amdgpu_connector->edid, &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
 	if (sad_count <= 0)
-- 
2.39.2

