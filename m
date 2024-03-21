Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 602438856B6
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 10:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E5B10E4DD;
	Thu, 21 Mar 2024 09:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YWpH8fWC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C1F10E4E8;
 Thu, 21 Mar 2024 09:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711014346; x=1742550346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=12zjj2/En7RptkNkfL85EdZZ8p/Xi8cCRzRJe7hvj4I=;
 b=YWpH8fWCB+BnyC/76IplZNoc0f7T/X/UPaHI6+YGuOmxvDB1xvH7hK+p
 XPrjI6kO/vV3nl3DMh5EH0vyK91lFF3LzTkJr+ZXaD6Wl7xR6LrWT/V4X
 qCHwc1W+/+i7LBh/FJM3Z2lCEbRQoPiC+HaBIaQcH0zlPfNedbJL9bkRD
 urK4CDDZpfAJdSFqprxckzctTX4bixvdFFJWVaydbNXunOJ5x1jS417Kr
 NMot8yBFGRuyRcxNn+0SpxdNxtUU+qba5AQWeW2H9H+ChDngOoVCyWMZt
 DX+NdERdVkxAQPPalE5bt+kClbxYuyDNNK8UMIQGISYXwrWdF0Xz8L0TK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="28462370"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="28462370"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 02:45:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="14456961"
Received: from amaslenx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.141])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 02:45:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	jani.nikula@intel.com
Subject: [PATCH 2/3] drm/edid: move all internal declarations to
 drm_crtc_internal.h
Date: Thu, 21 Mar 2024 11:45:30 +0200
Message-Id: <a964c63eada2df1c4eaabbed262ec973843063e0.1711014272.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1711014272.git.jani.nikula@intel.com>
References: <cover.1711014272.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
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

The declarations for internal EDID functions are a bit scattered. Put
them all in drm_crtc_internal.h.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_crtc_internal.h | 6 ++++++
 drivers/gpu/drm/drm_displayid.c     | 1 +
 drivers/gpu/drm/drm_eld.c           | 4 +++-
 drivers/gpu/drm/drm_internal.h      | 5 -----
 include/drm/drm_edid.h              | 3 ---
 5 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 0c693229a1c9..2256893d7d67 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -43,12 +43,14 @@ enum drm_color_range;
 enum drm_connector_force;
 enum drm_mode_status;
 
+struct cea_sad;
 struct drm_atomic_state;
 struct drm_bridge;
 struct drm_connector;
 struct drm_crtc;
 struct drm_device;
 struct drm_display_mode;
+struct drm_edid;
 struct drm_file;
 struct drm_framebuffer;
 struct drm_mode_create_dumb;
@@ -297,6 +299,10 @@ void drm_mode_fixup_1366x768(struct drm_display_mode *mode);
 int drm_edid_override_show(struct drm_connector *connector, struct seq_file *m);
 int drm_edid_override_set(struct drm_connector *connector, const void *edid, size_t size);
 int drm_edid_override_reset(struct drm_connector *connector);
+const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
+				  int ext_id, int *ext_index);
+void drm_edid_cta_sad_get(const struct cea_sad *cta_sad, u8 *sad);
+void drm_edid_cta_sad_set(struct cea_sad *cta_sad, const u8 *sad);
 
 /* drm_edid_load.c */
 #ifdef CONFIG_DRM_LOAD_EDID_FIRMWARE
diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
index f72a893c7deb..f800dc0906d5 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -6,6 +6,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_print.h>
 
+#include "drm_crtc_internal.h"
 #include "drm_displayid_internal.h"
 
 static const struct displayid_header *
diff --git a/drivers/gpu/drm/drm_eld.c b/drivers/gpu/drm/drm_eld.c
index 5177991aa272..c0428d07de53 100644
--- a/drivers/gpu/drm/drm_eld.c
+++ b/drivers/gpu/drm/drm_eld.c
@@ -3,10 +3,12 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/export.h>
+
 #include <drm/drm_edid.h>
 #include <drm/drm_eld.h>
 
-#include "drm_internal.h"
+#include "drm_crtc_internal.h"
 
 /**
  * drm_eld_sad_get - get SAD from ELD to struct cea_sad
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 2215baef9a3e..690505a1f7a5 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -35,7 +35,6 @@
 
 #define DRM_IF_VERSION(maj, min) (maj << 16 | min)
 
-struct cea_sad;
 struct dentry;
 struct dma_buf;
 struct iosys_map;
@@ -278,8 +277,4 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 				const struct drm_framebuffer *fb);
 void drm_framebuffer_debugfs_init(struct drm_device *dev);
 
-/* drm_edid.c */
-void drm_edid_cta_sad_get(const struct cea_sad *cta_sad, u8 *sad);
-void drm_edid_cta_sad_set(struct cea_sad *cta_sad, const u8 *sad);
-
 #endif /* __DRM_INTERNAL_H__ */
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 6f65bbf655a1..6eadc4f12c07 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -467,7 +467,4 @@ int drm_edid_connector_update(struct drm_connector *connector,
 int drm_edid_connector_add_modes(struct drm_connector *connector);
 bool drm_edid_is_digital(const struct drm_edid *drm_edid);
 
-const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
-				  int ext_id, int *ext_index);
-
 #endif /* __DRM_EDID_H__ */
-- 
2.39.2

