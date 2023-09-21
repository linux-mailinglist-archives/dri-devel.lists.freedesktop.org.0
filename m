Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A9C7A9591
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 17:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4887A10E12A;
	Thu, 21 Sep 2023 15:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB45D10E122;
 Thu, 21 Sep 2023 15:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695310476; x=1726846476;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JLKU2D1BVTU0m9vnX3OqHLS4lJFw60ZvQhpOqf0/MEQ=;
 b=me9NboYwIsZsz1tMviTss3sVFRueeztD3pW/Vv+8YLkiKpwQW2P8cCp+
 mbj0jEMZKGlq/5GLsMSuNSFCD+6GsmtSwS6XTszcnizP2izboC5++L/ga
 xT6ysR1avcwatmmJaIsEhr0vgGBvX2U2DOscFeON95cF4hcMatiCNxmVs
 ZNGsqFjRm+yUKlEszDZ+J4SPFcfE8M4t0cF4aB5whequHlPJ1i6oLWJsk
 IieStLUoZgeyDwzuid2gNamKSgE62fTW6E2b5Gs77SPbolW32unlHagJm
 HKmr8mUAnFkbjLRDzkvpr7bslPavCLGMJnOSIxRjGMjtM1znlPcZJjCsw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="379440088"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="379440088"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 08:34:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="994124600"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="994124600"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 08:34:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid/firmware: drop drm_kms_helper.edid_firmware backward
 compat
Date: Thu, 21 Sep 2023 18:34:29 +0300
Message-Id: <20230921153429.3822278-1-jani.nikula@intel.com>
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

More than five years and 30+ kernel releases later, see if we could drop
the backward compatibility. Leave some warnings in place for a while
longer.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid_load.c         | 16 ----------------
 drivers/gpu/drm/drm_kms_helper_common.c | 11 ++++++-----
 include/drm/drm_edid.h                  |  5 -----
 3 files changed, 6 insertions(+), 26 deletions(-)

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
index 0bf0fc1abf54..924e0f7bd5b7 100644
--- a/drivers/gpu/drm/drm_kms_helper_common.c
+++ b/drivers/gpu/drm/drm_kms_helper_common.c
@@ -38,17 +38,18 @@ MODULE_LICENSE("GPL and additional rights");
 
 #if IS_ENABLED(CONFIG_DRM_LOAD_EDID_FIRMWARE)
 
-/* Backward compatibility for drm_kms_helper.edid_firmware */
 static int edid_firmware_set(const char *val, const struct kernel_param *kp)
 {
-	DRM_NOTE("drm_kms_helper.edid_firmware is deprecated, please use drm.edid_firmware instead.\n");
+	pr_warn("drm_kms_helper.edid_firmware has been removed, please use drm.edid_firmware instead.\n");
 
-	return __drm_set_edid_firmware_path(val);
+	return -ENOENT;
 }
 
 static int edid_firmware_get(char *buffer, const struct kernel_param *kp)
 {
-	return __drm_get_edid_firmware_path(buffer, PAGE_SIZE);
+	pr_warn("drm_kms_helper.edid_firmware has been removed, please use drm.edid_firmware instead.\n");
+
+	return -ENOENT;
 }
 
 static const struct kernel_param_ops edid_firmware_ops = {
@@ -59,6 +60,6 @@ static const struct kernel_param_ops edid_firmware_ops = {
 module_param_cb(edid_firmware, &edid_firmware_ops, NULL, 0644);
 __MODULE_PARM_TYPE(edid_firmware, "charp");
 MODULE_PARM_DESC(edid_firmware,
-		 "DEPRECATED. Use drm.edid_firmware module parameter instead.");
+		 "REMOVED. Use drm.edid_firmware module parameter instead.");
 
 #endif
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 882d2638708e..00f0a778ab62 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -387,11 +387,6 @@ int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb);
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

