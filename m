Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4D060A667
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 14:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B4010E50E;
	Mon, 24 Oct 2022 12:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E7310E4A0;
 Mon, 24 Oct 2022 12:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666614890; x=1698150890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ofu4oVt0MzbegIxOSJPfMnWJOBl8hO+ucHSLRNvR+q8=;
 b=n+RCpTR6aYrJWoRRPUFH1yqEKTUZolOh0jBsM92F9FpJUsqXZnsCS58K
 eTQsOj8ilpC78IvVK3T5zSqvFVzhFifF66LbgNln2dPuiZ5YHJgH+Phar
 RQiVhS6Bv3LI6d8Omw+n5QGFOy7ORLLaBox3k9LWP6XFk2b2NtEo6Utvi
 CRJZfeELcZYP7iyJNvFBTonvG/SeXW+bp0OBdakOqVtv7KXVLbgfa8sa3
 GJogdl8i80XxiTv7PD3tTtD36vMMlcy3Fd61tI6wrCTIw8i/CW39cdm9L
 lXzN39wa10g1n0Wkg8av8WvryoWLX1VuvH/3zv1yYlMxog2P8Z91twVmk A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="305014161"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="305014161"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:49 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="633693836"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="633693836"
Received: from emontau-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.221])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 13/16] drm/edid: move edid load declarations to internal
 header
Date: Mon, 24 Oct 2022 15:33:41 +0300
Message-Id: <d58a59fede286caa8766e0813f4be492a7200287.1666614699.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666614699.git.jani.nikula@intel.com>
References: <cover.1666614699.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The EDID loader is internal to drm, not for drivers.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_crtc_internal.h | 11 +++++++++++
 drivers/gpu/drm/drm_edid_load.c     |  5 +++--
 include/drm/drm_edid.h              |  7 -------
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index fb8a68d90940..501a10edd0e1 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -290,3 +290,14 @@ void drm_mode_fixup_1366x768(struct drm_display_mode *mode);
 int drm_edid_override_show(struct drm_connector *connector, struct seq_file *m);
 int drm_edid_override_set(struct drm_connector *connector, const void *edid, size_t size);
 int drm_edid_override_reset(struct drm_connector *connector);
+
+/* drm_edid_load.c */
+#ifdef CONFIG_DRM_LOAD_EDID_FIRMWARE
+const struct drm_edid *drm_edid_load_firmware(struct drm_connector *connector);
+#else
+static inline const struct drm_edid *
+drm_edid_load_firmware(struct drm_connector *connector)
+{
+	return ERR_PTR(-ENOENT);
+}
+#endif
diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_load.c
index 248f0685c33e..882caaa6e663 100644
--- a/drivers/gpu/drm/drm_edid_load.c
+++ b/drivers/gpu/drm/drm_edid_load.c
@@ -11,12 +11,13 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-#include <drm/drm_crtc.h>
-#include <drm/drm_crtc_helper.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_print.h>
 
+#include "drm_crtc_internal.h"
+
 static char edid_firmware[PATH_MAX];
 module_param_string(edid_firmware, edid_firmware, sizeof(edid_firmware), 0644);
 MODULE_PARM_DESC(edid_firmware, "Do not probe monitor, use specified EDID blob "
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 8138613f4e4e..372963600f1d 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -388,15 +388,8 @@ int drm_av_sync_delay(struct drm_connector *connector,
 		      const struct drm_display_mode *mode);
 
 #ifdef CONFIG_DRM_LOAD_EDID_FIRMWARE
-const struct drm_edid *drm_edid_load_firmware(struct drm_connector *connector);
 int __drm_set_edid_firmware_path(const char *path);
 int __drm_get_edid_firmware_path(char *buf, size_t bufsize);
-#else
-static inline const struct drm_edid *
-drm_edid_load_firmware(struct drm_connector *connector)
-{
-	return ERR_PTR(-ENOENT);
-}
 #endif
 
 bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2);
-- 
2.34.1

