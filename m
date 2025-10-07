Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 705FBBC1F1A
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C099D10E6A2;
	Tue,  7 Oct 2025 15:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hZo8aDBQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E4410E6A2
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759851406; x=1791387406;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=95Fkjwa8kK7OSV19xNtulFfhBfjne6OobWH0Rk3RGKE=;
 b=hZo8aDBQZ6PZexhMnmLSPx4kzOZKAnPOG8xAZ68EvJ4phI+f3UkCfWZL
 bU3hvpZfdpqbBW8JJPI6ICdDSbjDrkMI0JBrAMcjNy6S7ditRCX+D1gQo
 6e6zAmG0+UYGrTk8WhvAHqJTtoUp4AuDNLJusEzkOD6DCF/j884nwtEpu
 0GXblHbVvQnBZ55TUU/vR9L/JbzG7GUiXp/aRZOgAvtL3p1NIDhozVgoF
 8jDCGwUYUmRyMObnksKONr7Q3KW8qr8nh9yyudrhMSWtQKr4TmFcnJbos
 IfiNN8A31B5SDOsqYYMhMS5Kpa1/IqWIJ5IBI34n/8CO2q7Sgr3bIPsGC w==;
X-CSE-ConnectionGUID: gss53kt0TRiT1o10g7EL0g==
X-CSE-MsgGUID: UG0P8ownQtq1pSEXUDVSmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61983937"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61983937"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 08:36:46 -0700
X-CSE-ConnectionGUID: RbPxhSrHRF6pubc5otSifw==
X-CSE-MsgGUID: SqlmaY03QkKpgymqFKIuvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="185467168"
Received: from dut4086lnl.fm.intel.com ([10.105.10.69])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 08:36:46 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.auld@intel.com, himal.prasad.ghimiray@intel.com,
 matthew.brost@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 krzysztof.karas@intel.com, andi.shyti@linux.intel.com
Subject: [PATCH] drm: Prevent sign extension on hdisplay and vdisplay
Date: Tue,  7 Oct 2025 15:36:46 +0000
Message-ID: <20251007153645.90920-2-jonathan.cavitt@intel.com>
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

Some functions in drm multiply hdisplay and vdisplay with a third
factor, which can result in a sign extension according to static
analysis due to an implicit s32 promotion.  Use a cast to u32 to
prevent this.

Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Krzystof Karas <krzysztof.karas@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Andi Shyti <andi.shyti@intel.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 2 +-
 drivers/gpu/drm/drm_mipi_dbi.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 90760d0ca071..0bec6f66682b 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -967,7 +967,7 @@ drm_vram_helper_mode_valid_internal(struct drm_device *dev,
 
 	max_fbpages = (vmm->vram_size / 2) >> PAGE_SHIFT;
 
-	fbsize = mode->hdisplay * mode->vdisplay * max_bpp;
+	fbsize = (u32)mode->hdisplay * mode->vdisplay * max_bpp;
 	fbpages = DIV_ROUND_UP(fbsize, PAGE_SIZE);
 
 	if (fbpages > max_fbpages)
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index e33c78fc8fbd..b488c91c20a5 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -691,7 +691,7 @@ int mipi_dbi_dev_init(struct mipi_dbi_dev *dbidev,
 		      const struct drm_simple_display_pipe_funcs *funcs,
 		      const struct drm_display_mode *mode, unsigned int rotation)
 {
-	size_t bufsize = mode->vdisplay * mode->hdisplay * sizeof(u16);
+	size_t bufsize = (u32)mode->vdisplay * mode->hdisplay * sizeof(u16);
 
 	dbidev->drm.mode_config.preferred_depth = 16;
 
-- 
2.43.0

