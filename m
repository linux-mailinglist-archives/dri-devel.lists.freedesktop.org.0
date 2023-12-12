Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D59C80EE23
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 14:53:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63C410E021;
	Tue, 12 Dec 2023 13:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A1F10E021;
 Tue, 12 Dec 2023 13:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702389197; x=1733925197;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s4181d0kZpZWey5BSxddKajn3GhPQcRbN7YFEbC7gvA=;
 b=WHGCOvLPQi0tB+1kggotlmByRf7944KftZScuygYa+jhaV8rJ2naNu1p
 9QOOZINEM07ZI3dcSB1VRqFiNNy4Y/SWJdbUgBjttCbCBM6kaklRK9Dpm
 dX7t8JELpUGpxSiW2JhfoCefGczNjaDuZYNsXj+X4HdNNyVXLlbJMyfZS
 TbcyOdhJYDOaj/M07Qlu7uKx924hACpPMDsl1UUjq4rLh0xLEC5GIOlDL
 JlwfErCOljAfI2Ttk300lM2mPtp2XBzXPkEZmUvoP3EJs+1Z7WN9AeNBx
 Uq429f27lN/2mmhcGf2nDUQTQtEjruJlxiN6qTOalBdXo7t7HmYU4orMZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="16359381"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="16359381"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 05:53:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="946767998"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="946767998"
Received: from ggilardi-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.49.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 05:53:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd: include drm/drm_edid.h only where needed
Date: Tue, 12 Dec 2023 15:53:09 +0200
Message-Id: <20231212135309.3816484-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Including drm_edid.h from amdgpu_mode.h causes the rebuild of literally
hundreds of files when drm_edid.h is modified, while there are only a
handful of files that actually need to include drm_edid.h.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h                    | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c                    | 1 +
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c              | 1 +
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c                      | 1 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c                      | 1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 1 +
 6 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 32fe05c810c6..3802ccdf6f55 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -32,7 +32,6 @@
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fixed.h>
 #include <drm/drm_framebuffer.h>
@@ -51,6 +50,7 @@ struct amdgpu_device;
 struct amdgpu_encoder;
 struct amdgpu_router;
 struct amdgpu_hpd;
+struct edid;
 
 #define to_amdgpu_crtc(x) container_of(x, struct amdgpu_crtc, base)
 #define to_amdgpu_connector(x) container_of(x, struct amdgpu_connector, base)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index db6fc0cb18eb..453a4b786cfc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
index 3ee219aa2891..7672abe6c140 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
@@ -28,6 +28,7 @@
 
 #include <acpi/video.h>
 
+#include <drm/drm_edid.h>
 #include <drm/amdgpu_drm.h>
 #include "amdgpu.h"
 #include "amdgpu_connectors.h"
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index bb666cb7522e..587ee632a3b8 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -21,6 +21,7 @@
  *
  */
 
+#include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 7af277f61cca..f22ec27365bd 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -21,6 +21,7 @@
  *
  */
 
+#include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index b599efda3b19..6f8128130b62 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -27,6 +27,7 @@
 #include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_fixed.h>
 #include "dm_services.h"
 #include "amdgpu.h"
-- 
2.39.2

