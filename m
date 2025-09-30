Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71507BAE9E8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 23:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D297110E640;
	Tue, 30 Sep 2025 21:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aPKlsgJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D07310E631
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 21:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759267645; x=1790803645;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wRqcnAhTb3mJHQitWA3a8nIMyXsuDQfTNTMEPuG5FVE=;
 b=aPKlsgJgN6rU84KxegFzAOij1VQ1VVS8/RjUyWphKF0k4id7czQmD0z4
 Xtlve/eFs3/buxmav6Lu4mZ7zqA/DC6E8uXJ2XFTElohN/5vcBMJEUtt7
 KQR4n6I/EAItLyJSnQlb3NWpCHRdVwam/llpRRQU2D3BxzA6UwSxVs/wr
 UFrKLzO5UG0L1b+1iw4tFTAWZOeQRm08wb6o2ku6MBJ0nM1pCaYX5jNAG
 J6q+qjnRzJjjvHlRxOJYgV5bjRN0k/lN5trQnuBFK85CoPeN2l16dhy55
 p0u8QMUiwAbcqT1ZAcczNxmO920HB6Tc20tYENmZ2R+24YndPyU9SlTpE w==;
X-CSE-ConnectionGUID: esH1ZxtjS6+29PmtPvyCHw==
X-CSE-MsgGUID: iia7EBEvQsKLctHpKPph5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72639113"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="72639113"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 14:27:08 -0700
X-CSE-ConnectionGUID: 3tD4LRebT72qCp9HNj8Zmw==
X-CSE-MsgGUID: v7cBaEcDSL2LjDtwOrIfaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="179049796"
Received: from dut4447ptlh.fm.intel.com ([10.105.9.33])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 14:26:58 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 matthew.auld@intel.com, himal.prasad.ghimiray@intel.com,
 matthew.brost@intel.com
Subject: [PATCH] drm: Add drm_mode_display_size helper function
Date: Tue, 30 Sep 2025 21:26:55 +0000
Message-ID: <20250930212654.146694-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a helper function that computes the product of hdisplay and
vdisplay.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 2 +-
 drivers/gpu/drm/drm_mipi_dbi.c        | 2 +-
 include/drm/drm_modes.h               | 5 +++++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 90760d0ca071..4ac71c34f4c6 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -967,7 +967,7 @@ drm_vram_helper_mode_valid_internal(struct drm_device *dev,
 
 	max_fbpages = (vmm->vram_size / 2) >> PAGE_SHIFT;
 
-	fbsize = mode->hdisplay * mode->vdisplay * max_bpp;
+	fbsize = drm_mode_display_size(mode) * max_bpp;
 	fbpages = DIV_ROUND_UP(fbsize, PAGE_SIZE);
 
 	if (fbpages > max_fbpages)
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index e33c78fc8fbd..54212bf85160 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -691,7 +691,7 @@ int mipi_dbi_dev_init(struct mipi_dbi_dev *dbidev,
 		      const struct drm_simple_display_pipe_funcs *funcs,
 		      const struct drm_display_mode *mode, unsigned int rotation)
 {
-	size_t bufsize = mode->vdisplay * mode->hdisplay * sizeof(u16);
+	size_t bufsize = drm_mode_display_size(mode) * sizeof(u16);
 
 	dbidev->drm.mode_config.preferred_depth = 16;
 
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index b9bb92e4b029..775c94c55cda 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -572,4 +572,9 @@ struct drm_display_mode *
 drm_mode_create_from_cmdline_mode(struct drm_device *dev,
 				  struct drm_cmdline_mode *cmd);
 
+static inline u32 drm_mode_display_size(const struct drm_display_mode *mode)
+{
+	return mode->hdisplay * mode->vdisplay;
+}
+
 #endif /* __DRM_MODES_H__ */
-- 
2.43.0

