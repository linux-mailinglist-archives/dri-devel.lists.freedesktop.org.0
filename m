Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B74D5FB3D6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 15:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846AB10E81C;
	Tue, 11 Oct 2022 13:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D129210E814;
 Tue, 11 Oct 2022 13:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665496255; x=1697032255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tPz88HJ44LRbct0SZjYjxN98KIjdpxNmbOJ70rtUaVM=;
 b=n+UCcSPmszXJkOm8MAN/knxsTMl0/Q5Qk4hb9sGAGTO/kbC25nzXlusf
 Dit+uTbdzhuMI9cc7a8/e2cEpJqsh55xxvx6xPb6nC7PW6gbcmhO20+nb
 NitXY4/VOpipUOPCoVHDMW6fgKsbUyg1VcQyMOv/TyIM9l3eL75l/YxAu
 o9YlLEzFWLg+B/He1qiG8p+MTpKQoFw9PdqUEQ+gJFfizQ03vvqBzAYZE
 kAtKwbA41WEf3n7YWHdGX3cpqg997Txu6hz7eZllVVG138Qc2B5GGx/Ax
 9H5EnBPtSwhP4+P3srCAzlBr9tDLCIu9kKJunTgEoszxwu8R4LuUHWxW7 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="291822740"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="291822740"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:55 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="604150640"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="604150640"
Received: from milawils-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/15] drm/edid: move edid load declarations to internal header
Date: Tue, 11 Oct 2022 16:49:47 +0300
Message-Id: <bac72a569dfe1bb604f4b3089fefbb2c71af47b6.1665496046.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1665496046.git.jani.nikula@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The EDID loader is internal to drm, not for drivers.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
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

