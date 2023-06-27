Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DA87403ED
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 21:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F9810E02C;
	Tue, 27 Jun 2023 19:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D48710E02C;
 Tue, 27 Jun 2023 19:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687893265; x=1719429265;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oXGhF45+Pk4UI+TTph+lyHBQBpegFPIlMJYEDrBqvL0=;
 b=hrZDdYmcpJTtnrePFtqrp+dRznI650jEkzsTZo817H4e+Rbmdmxxdik4
 E+bdXUjr88sjmMG2Kly0AUzE2bHEjhWYbD7nWSnL/R95p6FovihbvZpoh
 gZf0RnNUC1C9EpixIpeu2eToZQ2lqVafaVjlSLEmAjayzd8rjLsUHmBBq
 w7lMvFB8DLbFRbA8GpNNwM87sc0cr075CdNz3Y13ki4uIwtM5Pkgh0PV0
 IzNm1CXXXSbXrj9Oc7HJr6/LvhAp/9Z3LwOFqUjIfoBJu+UQI4WPDZBL5
 qSz6dZQD4vghUYsJy1WVZqixaICBtKABNS6+GCG7ckZMM7KK28Ootn3D4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="361703609"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="361703609"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 12:14:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="716646918"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="716646918"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga002.jf.intel.com with ESMTP; 27 Jun 2023 12:14:24 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/guc: Dump perf_limit_reasons for debug
Date: Tue, 27 Jun 2023 12:13:36 -0700
Message-Id: <20230627191336.319381-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

GuC load takes longer sometimes due to GT frequency not ramping up.
Add perf_limit_reasons to the existing warn print to see if frequency
is being throttled.

v2: Review comments (Ashutosh)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index 364d0d546ec8..0f79cb658518 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -251,9 +251,11 @@ static int guc_wait_ucode(struct intel_guc *guc)
 		if (ret == 0)
 			ret = -ENXIO;
 	} else if (delta_ms > 200) {
-		guc_warn(guc, "excessive init time: %lldms! [freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d]\n",
-			 delta_ms, intel_rps_read_actual_frequency(&uncore->gt->rps),
-			 before_freq, status, count, ret);
+		guc_warn(guc, "excessive init time: %lldms! [status = 0x%08X, count = %d, ret = %d]\n",
+			 delta_ms, status, count, ret);
+		guc_warn(guc, "excessive init time: [freq = %dMHz, before = %dMHz, perf_limit_reasons = 0x%08X]\n",
+			 intel_rps_read_actual_frequency(&uncore->gt->rps), before_freq,
+			 intel_uncore_read(uncore, intel_gt_perf_limit_reasons_reg(gt)));
 	} else {
 		guc_dbg(guc, "init took %lldms, freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d\n",
 			delta_ms, intel_rps_read_actual_frequency(&uncore->gt->rps),
-- 
2.38.1

