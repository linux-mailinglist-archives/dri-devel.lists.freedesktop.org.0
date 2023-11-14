Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149857EB338
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 16:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A41710E448;
	Tue, 14 Nov 2023 15:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC0410E218;
 Tue, 14 Nov 2023 15:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699974853; x=1731510853;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/iJuZ/xiQZjUnrNcVG10+qLgh0V0xrRimCG9JbjH518=;
 b=UwU3aAdm8ly1IWVc6Azo/iTNXAiKTAmfLys76WRB+lB9G+jd/fkvqoUu
 wKocSFq2I8Mw36uEper5daVbsaRzndV9qdCb6xQHAJ4hl5XGDIP8TCo4w
 aEfJfPWUw/2RE7olxRcqZEPw6+H+jt9QP7lUGDIh1+dkThr/qP8lT5e+Y
 +yDSMcHbHrnydQ9z0V+iVG6cvfukRhM1y22yX8024q63V9TaKv5i29+P/
 Q7g1Z1lRP0wbpzkccNVZ7rDf5G/wXOPIbKwEjPOzuEvpY4ozQhqafAvi6
 N+xc7MWlC41uWNXF7vJoH8IK9lu6U6xNsDCPA0pfdzf/KEgHALG46pJyu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="476884825"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="476884825"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 07:14:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="830631015"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="830631015"
Received: from hatran1-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.56.145])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 07:14:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/edid/firmware: drop drm_kms_helper.edid_firmware
 backward compat
Date: Tue, 14 Nov 2023 17:14:06 +0200
Message-Id: <20231114151406.61230-1-jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the edid_firmware module parameter was moved from
drm_kms_helper.ko to drm.ko in v4.15, we've had a backwards
compatibility helper in place, with a DRM_NOTE() suggesting to migrate
to drm.edid_firmware. This was added in commit ac6c35a4d8c7 ("drm: add
backwards compatibility support for drm_kms_helper.edid_firmware").

More than five years and 30+ kernel releases later, drop the backward
compatibility.

v2: Drop the warnings too

Acked-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid_load.c         | 16 -------------
 drivers/gpu/drm/drm_kms_helper_common.c | 32 -------------------------
 include/drm/drm_edid.h                  |  5 ----
 3 files changed, 53 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_load.c
index 5d9ef267ebb3..60fcb80bce61 100644
--- a/drivers/gpu/drm/drm_edid_load.c
+++ b/drivers/gpu/drm/drm_edid_load.c
@@ -23,22 +23,6 @@ module_param_string(edid_firmware, edid_firmware, sizeof(edid_firmware), 0644);
 MODULE_PARM_DESC(edid_firmware, "Do not probe monitor, use specified EDID blob "
 	"from built-in data or /lib/firmware instead. ");
 
-/* Use only for backward compatibility with drm_kms_helper.edid_firmware */
-int __drm_set_edid_firmware_path(const char *path)
-{
-	scnprintf(edid_firmware, sizeof(edid_firmware), "%s", path);
-
-	return 0;
-}
-EXPORT_SYMBOL(__drm_set_edid_firmware_path);
-
-/* Use only for backward compatibility with drm_kms_helper.edid_firmware */
-int __drm_get_edid_firmware_path(char *buf, size_t bufsize)
-{
-	return scnprintf(buf, bufsize, "%s", edid_firmware);
-}
-EXPORT_SYMBOL(__drm_get_edid_firmware_path);
-
 #define GENERIC_EDIDS 6
 static const char * const generic_edid_name[GENERIC_EDIDS] = {
 	"edid/800x600.bin",
diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/drm_kms_helper_common.c
index 0bf0fc1abf54..0c7550c0462b 100644
--- a/drivers/gpu/drm/drm_kms_helper_common.c
+++ b/drivers/gpu/drm/drm_kms_helper_common.c
@@ -27,38 +27,6 @@
 
 #include <linux/module.h>
 
-#include <drm/drm_edid.h>
-#include <drm/drm_print.h>
-
-#include "drm_crtc_helper_internal.h"
-
 MODULE_AUTHOR("David Airlie, Jesse Barnes");
 MODULE_DESCRIPTION("DRM KMS helper");
 MODULE_LICENSE("GPL and additional rights");
-
-#if IS_ENABLED(CONFIG_DRM_LOAD_EDID_FIRMWARE)
-
-/* Backward compatibility for drm_kms_helper.edid_firmware */
-static int edid_firmware_set(const char *val, const struct kernel_param *kp)
-{
-	DRM_NOTE("drm_kms_helper.edid_firmware is deprecated, please use drm.edid_firmware instead.\n");
-
-	return __drm_set_edid_firmware_path(val);
-}
-
-static int edid_firmware_get(char *buffer, const struct kernel_param *kp)
-{
-	return __drm_get_edid_firmware_path(buffer, PAGE_SIZE);
-}
-
-static const struct kernel_param_ops edid_firmware_ops = {
-	.set = edid_firmware_set,
-	.get = edid_firmware_get,
-};
-
-module_param_cb(edid_firmware, &edid_firmware_ops, NULL, 0644);
-__MODULE_PARM_TYPE(edid_firmware, "charp");
-MODULE_PARM_DESC(edid_firmware,
-		 "DEPRECATED. Use drm.edid_firmware module parameter instead.");
-
-#endif
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index e98aa6818700..518d1b8106c7 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -329,11 +329,6 @@ int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb);
 int drm_av_sync_delay(struct drm_connector *connector,
 		      const struct drm_display_mode *mode);
 
-#ifdef CONFIG_DRM_LOAD_EDID_FIRMWARE
-int __drm_set_edid_firmware_path(const char *path);
-int __drm_get_edid_firmware_path(char *buf, size_t bufsize);
-#endif
-
 bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2);
 
 int
-- 
2.39.2

