Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CBE8C2762
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 17:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315E310ED5B;
	Fri, 10 May 2024 15:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="awCnzf5u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5803010ED5B;
 Fri, 10 May 2024 15:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715353727; x=1746889727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hgzsZ39uasRxg6TKbY+6GW+l8ksDza+pCBco8vABFkg=;
 b=awCnzf5u5C5ItTvRG2xwbFhgjmWE5REXh64Y3t4Y5EW+Ptx3EQsDPOQn
 9sp+XSfNVkUEglE2QWoMlghiUI9TZrlSxvnOcu+cs4XdB6Oc6AI6ps6Py
 e0aMk6wzxXtgJNR6ALpuSJ1UTRZG6mQe1dnlFlgOq6xBTjd/zIMG7g50W
 V+JPt1q2g+reRdnQtfh2MN8iupEmlC8PuvD/GmbFxNeVF1DsgDFlR+ol+
 scq4T2DPPEsqtVMs2rQt3lJc5GXb+k2YTCq2xfRhg/2UveWVVDllKDuyr
 knOC6NATPiC5NbqgiignmqLBnkLYivXNSkJwLNX4Z+j3AV0emC/s+6nbd g==;
X-CSE-ConnectionGUID: d2gVh7IOQFCdb7e/27ZdhA==
X-CSE-MsgGUID: ZjHG1J60SC2ziuKk3RR6wg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22009799"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="22009799"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:08:46 -0700
X-CSE-ConnectionGUID: TSc5F6kXRn+ATukVp3prIQ==
X-CSE-MsgGUID: 3d0VL4rFRpqRLIwelny5qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="30204439"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:08:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>
Subject: [RESEND 4/6] drm/amdgpu: remove amdgpu_connector_edid() and stop
 using edid_blob_ptr
Date: Fri, 10 May 2024 18:08:11 +0300
Message-Id: <1463862965d76e9458551598fd4d287a08d3d264.1715353572.git.jani.nikula@intel.com>
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
index b44fce44c066..dddb5fe16f2c 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -1299,7 +1299,7 @@ static void dce_v10_0_audio_write_speaker_allocation(struct drm_encoder *encoder
 		return;
 	}
 
-	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector_edid(connector), &sadb);
+	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector->edid, &sadb);
 	if (sad_count < 0) {
 		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sad_count);
 		sad_count = 0;
@@ -1369,7 +1369,7 @@ static void dce_v10_0_audio_write_sad_regs(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_sad(amdgpu_connector_edid(connector), &sads);
+	sad_count = drm_edid_to_sad(amdgpu_connector->edid, &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
 	if (sad_count <= 0)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 80b2e7f79acf..11780e4d7e9f 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -1331,7 +1331,7 @@ static void dce_v11_0_audio_write_speaker_allocation(struct drm_encoder *encoder
 		return;
 	}
 
-	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector_edid(connector), &sadb);
+	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector->edid, &sadb);
 	if (sad_count < 0) {
 		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sad_count);
 		sad_count = 0;
@@ -1401,7 +1401,7 @@ static void dce_v11_0_audio_write_sad_regs(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_sad(amdgpu_connector_edid(connector), &sads);
+	sad_count = drm_edid_to_sad(amdgpu_connector->edid, &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
 	if (sad_count <= 0)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index db20012600f5..05c0df97f01d 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -1217,7 +1217,7 @@ static void dce_v6_0_audio_write_speaker_allocation(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector_edid(connector), &sadb);
+	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector->edid, &sadb);
 	if (sad_count < 0) {
 		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sad_count);
 		sad_count = 0;
@@ -1292,7 +1292,7 @@ static void dce_v6_0_audio_write_sad_regs(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_sad(amdgpu_connector_edid(connector), &sads);
+	sad_count = drm_edid_to_sad(amdgpu_connector->edid, &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
 	if (sad_count <= 0)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index 5b56100ec902..dc73e301d937 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -1272,7 +1272,7 @@ static void dce_v8_0_audio_write_speaker_allocation(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector_edid(connector), &sadb);
+	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector->edid, &sadb);
 	if (sad_count < 0) {
 		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sad_count);
 		sad_count = 0;
@@ -1340,7 +1340,7 @@ static void dce_v8_0_audio_write_sad_regs(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_sad(amdgpu_connector_edid(connector), &sads);
+	sad_count = drm_edid_to_sad(amdgpu_connector->edid, &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
 	if (sad_count <= 0)
-- 
2.39.2

