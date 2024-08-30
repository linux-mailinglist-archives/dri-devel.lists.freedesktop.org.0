Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8828966773
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 18:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D1E10E7AA;
	Fri, 30 Aug 2024 16:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NCzcba4c";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EA110E786;
 Fri, 30 Aug 2024 16:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725037105; x=1756573105;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RuHBTTxYUm0QFrH/cXQA1xFEaHDVc09Ccgn/spD/GPI=;
 b=NCzcba4cBAJt4jL6ScB0GJQeNhSguXixxY0j1UbuBYWzdHSxYE6/bTHD
 DNGAMDeub7/D2+VheGebU0JjJ6aZUqb6pXTTBD9DzT+SduUvvw5Vscyn3
 kx+JGROIP05xaK/RBPlTk3Y40Z7jkhakgG5ffUVkIXXFW0x4N/iscz7lo
 Tzc01yvzJczaehh9MxNCSf/hS1AUNIWCKHaEgcMKGOPcLvW8VXjXmfk4J
 qxlN7urOeAjkRd9NNoN88zOO4McMle/OZ3fKhLALblzxeXXOeIYRi0ZhI
 PzvVOEwrMcsR0IspI9ZU5rfw6vXwjs+uZo4CeAcejOOIxHhYy+2brWwhq Q==;
X-CSE-ConnectionGUID: p/YW7kHnR4apyoEA+BW1AQ==
X-CSE-MsgGUID: jkoj+uV1SamNqWW+77gv3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23568532"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="23568532"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 09:58:25 -0700
X-CSE-ConnectionGUID: StDjZ1IETG2fbBB469rhtQ==
X-CSE-MsgGUID: PSxzDyt3RCSlCCPDY5fnZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="63570927"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 30 Aug 2024 09:58:24 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/i915/uc: Includ requested frequency in slow firmware load
 messages
Date: Fri, 30 Aug 2024 09:58:23 -0700
Message-ID: <20240830165823.3681368-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

To aid debug of sporadic issues, include the requested frequency in
the debug message as well as the actual frequency. That way we know
for certain that the clamping is not because the driver forgot to ask.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 11 ++++++-----
 drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 12 +++++++-----
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index 23f54c84cbab2..e37d227dc199e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -259,13 +259,14 @@ static int guc_wait_ucode(struct intel_guc *guc)
 	} else if (delta_ms > 200) {
 		guc_warn(guc, "excessive init time: %lldms! [status = 0x%08X, count = %d, ret = %d]\n",
 			 delta_ms, status, count, ret);
-		guc_warn(guc, "excessive init time: [freq = %dMHz, before = %dMHz, perf_limit_reasons = 0x%08X]\n",
-			 intel_rps_read_actual_frequency(&gt->rps), before_freq,
+		guc_warn(guc, "excessive init time: [freq = %dMHz -> %dMHz vs %dMHz, perf_limit_reasons = 0x%08X]\n",
+			 before_freq, intel_rps_read_actual_frequency(&gt->rps),
+			 intel_rps_get_requested_frequency(&gt->rps),
 			 intel_uncore_read(uncore, intel_gt_perf_limit_reasons_reg(gt)));
 	} else {
-		guc_dbg(guc, "init took %lldms, freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d\n",
-			delta_ms, intel_rps_read_actual_frequency(&gt->rps),
-			before_freq, status, count, ret);
+		guc_dbg(guc, "init took %lldms, freq = %dMHz -> %dMHz vs %dMHz, status = 0x%08X, count = %d, ret = %d\n",
+			delta_ms, before_freq, intel_rps_read_actual_frequency(&gt->rps),
+			intel_rps_get_requested_frequency(&gt->rps), status, count, ret);
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 2d9152eb72825..4324ccda667b1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -502,13 +502,15 @@ int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
 	if (delta_ms > 50) {
 		huc_warn(huc, "excessive auth time: %lldms! [status = 0x%08X, count = %d, ret = %d]\n",
 			 delta_ms, huc->status[type].reg.reg, count, ret);
-		huc_warn(huc, "excessive auth time: [freq = %dMHz, before = %dMHz, perf_limit_reasons = 0x%08X]\n",
-			 intel_rps_read_actual_frequency(&gt->rps), before_freq,
+		huc_warn(huc, "excessive auth time: [freq = %dMHz -> %dMHz vs %dMHz, perf_limit_reasons = 0x%08X]\n",
+			 before_freq, intel_rps_read_actual_frequency(&gt->rps),
+			 intel_rps_get_requested_frequency(&gt->rps),
 			 intel_uncore_read(uncore, intel_gt_perf_limit_reasons_reg(gt)));
 	} else {
-		huc_dbg(huc, "auth took %lldms, freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d\n",
-			delta_ms, intel_rps_read_actual_frequency(&gt->rps),
-			before_freq, huc->status[type].reg.reg, count, ret);
+		huc_dbg(huc, "auth took %lldms, freq = %dMHz -> %dMHz vs %dMHz, status = 0x%08X, count = %d, ret = %d\n",
+			delta_ms, before_freq, intel_rps_read_actual_frequency(&gt->rps),
+			intel_rps_get_requested_frequency(&gt->rps),
+			huc->status[type].reg.reg, count, ret);
 	}
 
 	/* mark the load process as complete even if the wait failed */
-- 
2.46.0

