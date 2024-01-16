Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5665682EF7A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 14:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E27310E54E;
	Tue, 16 Jan 2024 13:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F8310E51A;
 Tue, 16 Jan 2024 13:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705410506; x=1736946506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cx9gqxaCc6t5J2znbB1TJcX+fG9jhzmvwmz+CgllRyo=;
 b=nQRItpakDE5pvAszRuc+telUeSpbSiGjDwbsSJcANW8Ju8eHKhc9FJ2B
 oUDpYEo29U02r1TNSBavL1/fKD5j918gkLmEX7sHCyyfhbr78n7XtiTet
 sjl7dxQ9K/SAV5AjwDTXCbZEbYcCeUe9HvpA4p4Li5bt6G/oJ1aM31YyL
 EGU+K5ktXqM2rns4wTaVKBMAgRx+BB+llG2GUajbNL6gENXUJ/gMTTKvi
 EjMGEQdif2OCGRF/W9WjbXhgUjCM0q9rU5puBd8AofbyajvpAYuZo/zcL
 d3WO0nBCyuqpGndvwwMMqIvv9tHB0hc3Px3zlBKrhISWihVjoI8o7KE8c w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="399527497"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="399527497"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:08:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="907367714"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="907367714"
Received: from jfunnell-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.52])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:08:23 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/10] drm/xe: switch from drm_debug_printer() to device
 specific drm_dbg_printer()
Date: Tue, 16 Jan 2024 15:07:34 +0200
Message-Id: <35929b030f7ba67cd32808d42e916aa9cfb5709d.1705410327.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705410327.git.jani.nikula@intel.com>
References: <cover.1705410327.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer the device specific debug printer.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c          | 2 +-
 drivers/gpu/drm/xe/xe_gt_topology.c | 4 +++-
 drivers/gpu/drm/xe/xe_reg_sr.c      | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 0f2258dc4a00..16481f9b3125 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -327,7 +327,7 @@ static void dump_pat_on_error(struct xe_gt *gt)
 	char prefix[32];
 
 	snprintf(prefix, sizeof(prefix), "[GT%u Error]", gt->info.id);
-	p = drm_debug_printer(prefix);
+	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, prefix);
 
 	xe_pat_dump(gt, &p);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index a8d7f272c30a..5dc62fe1be49 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -84,7 +84,7 @@ void
 xe_gt_topology_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	struct drm_printer p = drm_debug_printer("GT topology");
+	struct drm_printer p;
 	int num_geometry_regs, num_compute_regs;
 
 	get_num_dss_regs(xe, &num_geometry_regs, &num_compute_regs);
@@ -107,6 +107,8 @@ xe_gt_topology_init(struct xe_gt *gt)
 		      XE2_GT_COMPUTE_DSS_2);
 	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
 
+	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology");
+
 	xe_gt_topology_dump(gt, &p);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 87adefb56024..440ac572f6e5 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -231,7 +231,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 	if (err)
 		goto err_force_wake;
 
-	p = drm_debug_printer(KBUILD_MODNAME);
+	p = drm_dbg_printer(&xe->drm, DRM_UT_DRIVER, NULL);
 	xa_for_each(&sr->xa, reg, entry) {
 		if (slot == RING_MAX_NONPRIV_SLOTS) {
 			xe_gt_err(gt,
-- 
2.39.2

