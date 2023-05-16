Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAF37052C9
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 17:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6822F10E259;
	Tue, 16 May 2023 15:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8BC10E02A;
 Tue, 16 May 2023 15:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684252177; x=1715788177;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xd2n2x3TXv2aTuMwDQcr025zAjJVZ1S8xp1SkGxFXvk=;
 b=b2N4oTivyGpqpp/Lo54TR9QzVdc0HJLcbKUMnKDp71MXezXhqWZ1FiYn
 SL5fiHM2tRWY171b83p38OaJJ7Ss5vTu6zj3FwkzIpiYmbAw+OswMcj5w
 7Hc8zvY9rjrNf/oi2pF6Vp6VX7Znlw/lb9OKrFGm/GzgT4nJJuwqgKQ98
 liDA257NK4fDldF0GfShUsFKvg7Dk7A1lg+le9NPOidI7JtE9JNIilxtA
 /FYJx9p6oCYo5cxLEcNnTPRA7QnOKaOpfHolG/vJGCuZCBR2zeFIYvuyw
 uYTIC+2LZI4T+OHY/nmb2FbTlfEAhSyJClxFSnn8sRfUNju/qzE621xH4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="379696085"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="379696085"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 08:49:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="701393045"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="701393045"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga002.jf.intel.com with ESMTP; 16 May 2023 08:49:35 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc/slpc: Disable rps_boost debugfs
Date: Tue, 16 May 2023 08:49:05 -0700
Message-Id: <20230516154905.1048006-1-vinay.belgaumkar@intel.com>
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

rps_boost debugfs shows host turbo related info. This is not valid
when SLPC is enabled. guc_slpc_info already shows the number of boosts.
Add num_waiters there as well and disable rps_boost when SLPC is
enabled.

v2: Replace Bug with Link to resolve checkpatch warning

Link: https://gitlab.freedesktop.org/drm/intel/-/issues/7632
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 5 ++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index 80dbbef86b1d..357e2f865727 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -539,7 +539,10 @@ static bool rps_eval(void *data)
 {
 	struct intel_gt *gt = data;
 
-	return HAS_RPS(gt->i915);
+	if (intel_guc_slpc_is_used(&gt->uc.guc))
+		return false;
+	else
+		return HAS_RPS(gt->i915);
 }
 
 DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(rps_boost);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 56dbba1ef668..01b75529311c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -837,6 +837,8 @@ int intel_guc_slpc_print_info(struct intel_guc_slpc *slpc, struct drm_printer *p
 				   slpc_decode_min_freq(slpc));
 			drm_printf(p, "\twaitboosts: %u\n",
 				   slpc->num_boosts);
+			drm_printf(p, "\tBoosts outstanding: %u\n",
+				   atomic_read(&slpc->num_waiters));
 		}
 	}
 
-- 
2.38.1

