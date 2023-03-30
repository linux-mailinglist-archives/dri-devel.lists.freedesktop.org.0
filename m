Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF706D09FA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD10110EEEA;
	Thu, 30 Mar 2023 15:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E9910EEE7;
 Thu, 30 Mar 2023 15:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680190832; x=1711726832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eNGF/t4QCyBVGs166c/tV/nvfRC3/QCQSbcueXG9WqY=;
 b=b9aDoE+PsSBEDXZmC9r4ss023a2Kyn653aSX7Z1Iv2co2smUBB6kkiFh
 YAwoJjg0lgOKXnOpv5Sy20adnQYU+6bGeb/5M7yp9ME+HCc7YjO3MJ/+N
 PtOymn67BB1Ia0Bj2K28xhBaBS9/NVGXph/1NikTnsxZlEcTat3nzXz4G
 cbF1+5oib0PNT45j/y2AXjsDrpXr4JOLq6PaLuxIDcwcinSIFKVuuNgvZ
 mUmeR/xEFkeYDbLRhK2jlU+lN7eq1c4hxasDmeIYDh0e60XRDCj0UIP8x
 qbo1gzjCZWx2w807t6WPIxRBjW42OjO8oseDlkDuUU3/aczZVz/KPVAtn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="427480607"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="427480607"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="795702298"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="795702298"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/12] drm/amdgpu: remove amdgpu_connector_edid() and stop
 using edid_blob_ptr
Date: Thu, 30 Mar 2023 18:39:42 +0300
Message-Id: <7c5f8b4ec13937440b67dd86d843578e3b97f2be.1680190534.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680190534.git.jani.nikula@intel.com>
References: <cover.1680190534.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
	Xinhui <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

amdgpu_connector_edid() copies the EDID from edid_blob_ptr as a side
effect if amdgpu_connector->edid isn't initialized. However, everywhere
that the returned EDID is used, the EDID should have been set
beforehands.

Only the EDID code and sysfs should look at the EDID property, anyway,
so stop using it.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c | 15 ---------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.h |  1 -
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c         |  4 ++--
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c         |  4 ++--
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c          |  4 ++--
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c          |  4 ++--
 6 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index 6be30dcb029d..77fbfd35d652 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -246,21 +246,6 @@ amdgpu_connector_find_encoder(struct drm_connector *connector,
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
index 9a24ed463abd..7593a16fa840 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -1302,7 +1302,7 @@ static void dce_v10_0_audio_write_speaker_allocation(struct drm_encoder *encoder
 		return;
 	}
 
-	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector_edid(connector), &sadb);
+	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector->edid, &sadb);
 	if (sad_count < 0) {
 		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sad_count);
 		sad_count = 0;
@@ -1372,7 +1372,7 @@ static void dce_v10_0_audio_write_sad_regs(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_sad(amdgpu_connector_edid(connector), &sads);
+	sad_count = drm_edid_to_sad(amdgpu_connector->edid, &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
 	if (sad_count <= 0)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index c14b70350a51..a38bcb0b9d45 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -1328,7 +1328,7 @@ static void dce_v11_0_audio_write_speaker_allocation(struct drm_encoder *encoder
 		return;
 	}
 
-	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector_edid(connector), &sadb);
+	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector->edid, &sadb);
 	if (sad_count < 0) {
 		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sad_count);
 		sad_count = 0;
@@ -1398,7 +1398,7 @@ static void dce_v11_0_audio_write_sad_regs(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_sad(amdgpu_connector_edid(connector), &sads);
+	sad_count = drm_edid_to_sad(amdgpu_connector->edid, &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
 	if (sad_count <= 0)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index 7f85ba5b726f..e578c6b8f619 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -1200,7 +1200,7 @@ static void dce_v6_0_audio_write_speaker_allocation(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector_edid(connector), &sadb);
+	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector->edid, &sadb);
 	if (sad_count < 0) {
 		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sad_count);
 		sad_count = 0;
@@ -1275,7 +1275,7 @@ static void dce_v6_0_audio_write_sad_regs(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_sad(amdgpu_connector_edid(connector), &sads);
+	sad_count = drm_edid_to_sad(amdgpu_connector->edid, &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
 	if (sad_count <= 0)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index d421a268c9ff..1e40724e1ced 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -1257,7 +1257,7 @@ static void dce_v8_0_audio_write_speaker_allocation(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector_edid(connector), &sadb);
+	sad_count = drm_edid_to_speaker_allocation(amdgpu_connector->edid, &sadb);
 	if (sad_count < 0) {
 		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sad_count);
 		sad_count = 0;
@@ -1325,7 +1325,7 @@ static void dce_v8_0_audio_write_sad_regs(struct drm_encoder *encoder)
 		return;
 	}
 
-	sad_count = drm_edid_to_sad(amdgpu_connector_edid(connector), &sads);
+	sad_count = drm_edid_to_sad(amdgpu_connector->edid, &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
 	if (sad_count <= 0)
-- 
2.39.2

