Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 606147EA625
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 23:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEAD10E1A1;
	Mon, 13 Nov 2023 22:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB97210E1A1;
 Mon, 13 Nov 2023 22:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699915797; x=1731451797;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6fIP9LtyvBC2cgTBGdyui9KJ5OC+h5k/j0qB/CLVrmg=;
 b=PF14dUS4Qj7LCzUM85Z5iIgJuMcrICYUq23UZ+bl5jX3XwHWsFrP9SR9
 pd2y2flA4yKtb+4NUiIjcP8kYhzdXmvhtnajrSOZ1KU7XGreTgaC7K9gc
 caOyGHmbozCYdlCiAVLc/xzqUzHyJJEjev4t/dO4rvvSSxZkJ+C79qDOu
 AE0lDPrkjxV4GSsH0kwII6nQ0wqQIfl0odDBIdUtlaiHW+JfY1VHwKD2W
 DJ9UHVKhyI39nh1LucuUi9qfL+vZ4omMeOnIb3+pIDyLNZMt003aE4v6Q
 XuVenLLZ/b/Xnr6gCvCWCkPllmg8FXR8VFmh9ABKDUXsv8evzu7sUWBrZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="387689970"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="387689970"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 14:49:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="5591020"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa002.jf.intel.com with ESMTP; 13 Nov 2023 14:49:58 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/i915: Skip pxp init if gt is wedged
Date: Mon, 13 Nov 2023 14:49:53 -0800
Message-Id: <20231113224953.378534-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The gt wedged could be triggered by missing guc firmware file, HW not
working, etc. Once triggered, it means all gt usage is dead, therefore we
can't enable pxp under this fatal error condition.

v2: Updated commit message.
v3: Updated return code check.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c   | 4 +++-
 drivers/gpu/drm/i915/pxp/intel_pxp.c | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 80e85cadb9a2..b74977ceb455 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -804,7 +804,9 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		goto out_cleanup_modeset2;
 
-	intel_pxp_init(i915);
+	ret = intel_pxp_init(i915);
+	if (ret != -ENODEV)
+		drm_dbg(&i915->drm, "pxp init failed with %d\n", ret);
 
 	ret = intel_display_driver_probe(i915);
 	if (ret)
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index dc327cf40b5a..3e33b7de1dfd 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -199,6 +199,9 @@ int intel_pxp_init(struct drm_i915_private *i915)
 	struct intel_gt *gt;
 	bool is_full_feature = false;
 
+	if (intel_gt_is_wedged(to_gt(i915)))
+		return -ENOTCONN;
+
 	/*
 	 * NOTE: Get the ctrl_gt before checking intel_pxp_is_supported since
 	 * we still need it if PXP's backend tee transport is needed.
-- 
2.34.1

