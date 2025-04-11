Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB49A866E8
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 22:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A23910EC9E;
	Fri, 11 Apr 2025 20:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qyLedVMx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CD710EC9A;
 Fri, 11 Apr 2025 20:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yyhXtMF9oUIWnT6Vs+9eGMKsH6B2P/2tukc5ckGCwdo=; b=qyLedVMxkJqsPjTqPqZ1dTy6A3
 hZ8JiruXHPxBS4M9KHqjK3MuJOZ59obSgytEb/1xBORwNPONks35Uw6G74f2+UToUdMesk7CJQUWD
 JCHypvr9I5fbEuOUSquGMIpR3T27agtBSJzsU6Cva3r6a76Hg97RTC6DbK+q6qVRZZOyrPfocjR0S
 6PHfIKg0jUCBzqD2j7zmOwgIoTAedmwBa3EygD99ukXRcA7VVSbDMTMSOSPr5BtFA2QERmDUD6kxp
 SXVky/MlWObaktf1qPPF/JDW1qSuDbyABTgvqbt76v3AxoKHowUVbwmzUdtROz8/XYsRAODoDZ9VV
 9p7P9sWA==;
Received: from [189.6.35.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u3Kls-00FIP5-De; Fri, 11 Apr 2025 22:14:41 +0200
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH 12/13] drm/amd/display: add drm_edid to dc_sink
Date: Fri, 11 Apr 2025 17:08:42 -0300
Message-ID: <20250411201333.151335-13-mwen@igalia.com>
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

Add Linux opaque object to dc_sink for storing edid data cross driver,
drm_edid. Also include the Linux call to free this object, the
drm_edid_free()

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c | 7 +++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h | 1 +
 drivers/gpu/drm/amd/display/dc/core/dc_sink.c   | 3 +++
 drivers/gpu/drm/amd/display/dc/dc.h             | 3 +++
 4 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
index 39fcaa16a14a..fa0f0e61f05d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: MIT
 #include "amdgpu_dm/dc_edid.h"
 #include "dc.h"
+#include <drm/drm_edid.h>
 
 bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
 			  struct dc_sink *current_sink)
@@ -25,3 +26,9 @@ void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
 	memmove(dc_sink->dc_edid.raw_edid, (const uint8_t *) edid, len);
 	dc_sink->dc_edid.length = len;
 }
+
+
+void dc_edid_sink_edid_free(struct dc_sink *sink)
+{
+	drm_edid_free(sink->drm_edid);
+}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
index f42cd5bbc730..2c76768be459 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
@@ -9,5 +9,6 @@ bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
 			  struct dc_sink *current_sink);
 void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
 			     const void *edid, int len);
+void dc_edid_sink_edid_free(struct dc_sink *sink);
 
 #endif /* __DC_EDID_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c b/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
index 455fa5dd1420..3774a3245506 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
@@ -26,6 +26,7 @@
 #include "dm_services.h"
 #include "dm_helpers.h"
 #include "core_types.h"
+#include "dc_edid.h"
 
 /*******************************************************************************
  * Private functions
@@ -65,6 +66,8 @@ void dc_sink_retain(struct dc_sink *sink)
 static void dc_sink_free(struct kref *kref)
 {
 	struct dc_sink *sink = container_of(kref, struct dc_sink, refcount);
+
+	dc_edid_sink_edid_free(sink);
 	kfree(sink->dc_container_id);
 	kfree(sink);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index d60cd9d23848..0d4e6ea1821b 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -46,6 +46,8 @@
 
 #include "dmub/inc/dmub_cmd.h"
 
+#include <drm/drm_edid.h>
+
 struct abm_save_restore;
 
 /* forward declaration */
@@ -2430,6 +2432,7 @@ struct scdc_caps {
 struct dc_sink {
 	enum signal_type sink_signal;
 	struct dc_edid dc_edid; /* raw edid */
+	const struct drm_edid *drm_edid; /* Linux DRM edid*/
 	struct dc_edid_caps edid_caps; /* parse display caps */
 	struct dc_container_id *dc_container_id;
 	uint32_t dongle_max_pix_clk;
-- 
2.47.2

