Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6CBBB1405
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 18:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756E910E0A4;
	Wed,  1 Oct 2025 16:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kWn1P+gz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFD910E0A4
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 16:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759336190; x=1790872190;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zU/WYjnddftldjZ6WOLaklg2JITfNJsVZQCbKwI4Jfk=;
 b=kWn1P+gzfZ5ug+jUYJMaz6Kkk8l7W8YSQPV8CEYt2hbaQC+U1UlSaB1k
 zpEwcARq9ELJsY01nc4AQ2+t58H9yNWp/X6XW7mZbdb25uaPnh/N0fdDh
 of7C3tnisgvhqQxF9QtyDFqRJLgIBCJSdcBsqdED2LJZ7eOCiGoqtGH9B
 KG+pzvT3UgJj3vhaHhe7G9kXESxAW5uMfOvIqU2Deac7AR/ZEH/60Ta91
 ITcpCfuJJhGNpJZpgy4DtvQoRr3pZjdwVABVASMKuPEnR4FpHDg+ItViT
 nYOvzCb6/XKOn8Tcxp+jMDE7/+F4mf9CIxXoDZjoCVhNIG45coVbdhlv1 A==;
X-CSE-ConnectionGUID: 6Vi1fB4fSTaDbmTCecdolg==
X-CSE-MsgGUID: ZJD1eAUTSkqpbbsY/YVKJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61505739"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="61505739"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 09:29:50 -0700
X-CSE-ConnectionGUID: YW3JtnBQRg6mUxdz9lqLxg==
X-CSE-MsgGUID: Fc7KCEj9SOWBotYsa+ml5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="183114997"
Received: from dut4447ptlh.fm.intel.com ([10.105.9.33])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 09:29:49 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.auld@intel.com, himal.prasad.ghimiray@intel.com,
 matthew.brost@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@linux.intel.com
Subject: [PATCH v2] drm: Add drm_mode_num_active_pixels helper function
Date: Wed,  1 Oct 2025 16:29:45 +0000
Message-ID: <20251001162945.117292-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Add a helper function that computes the product of hdisplay and
vdisplay.  This is necessary to prevent a potential sign extension
issue.

v2:
- Clarify purpose of helper function (Jonathan)
- s/drm_mode_display_size/drm_mode_num_active_pixels (Ville)
- Add kernel docs (Jani)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c |  2 +-
 drivers/gpu/drm/drm_mipi_dbi.c        |  2 +-
 include/drm/drm_modes.h               | 14 ++++++++++++++
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 90760d0ca071..a345dc8caa3b 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -967,7 +967,7 @@ drm_vram_helper_mode_valid_internal(struct drm_device *dev,
 
 	max_fbpages = (vmm->vram_size / 2) >> PAGE_SHIFT;
 
-	fbsize = mode->hdisplay * mode->vdisplay * max_bpp;
+	fbsize = drm_mode_num_active_pixels(mode) * max_bpp;
 	fbpages = DIV_ROUND_UP(fbsize, PAGE_SIZE);
 
 	if (fbpages > max_fbpages)
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index e33c78fc8fbd..08da48bfff36 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -691,7 +691,7 @@ int mipi_dbi_dev_init(struct mipi_dbi_dev *dbidev,
 		      const struct drm_simple_display_pipe_funcs *funcs,
 		      const struct drm_display_mode *mode, unsigned int rotation)
 {
-	size_t bufsize = mode->vdisplay * mode->hdisplay * sizeof(u16);
+	size_t bufsize = drm_mode_num_active_pixels(mode) * sizeof(u16);
 
 	dbidev->drm.mode_config.preferred_depth = 16;
 
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index b9bb92e4b029..c0e8d6c4d43c 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -572,4 +572,18 @@ struct drm_display_mode *
 drm_mode_create_from_cmdline_mode(struct drm_device *dev,
 				  struct drm_cmdline_mode *cmd);
 
+/**
+ * drm_mode_num_active_pixels - Computes the number of pixels in the
+ * drm display mode
+ *
+ * @mode - The target drm_display_mode
+ *
+ * Returns the product of hdisplay and vdisplay
+ */
+static inline u32
+drm_mode_num_active_pixels(const struct drm_display_mode *mode)
+{
+	return mode->hdisplay * mode->vdisplay;
+}
+
 #endif /* __DRM_MODES_H__ */
-- 
2.43.0

