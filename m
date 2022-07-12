Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBAC5728F4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 00:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9282B96FBC;
	Tue, 12 Jul 2022 22:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E8996FB1;
 Tue, 12 Jul 2022 22:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657663518; x=1689199518;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H+F5/F4+SQV3JoKB52Pr+QhDI+h9InnInbzhTUs/FKU=;
 b=DA+QGPg3VSjnNarRYDfDrWR2W80+y3z65ZQ7A/DXPIV41wPQPFhStYEq
 ziv3nmeY7ZWdnPe8QlYeTc/6Fjlg+BjQEqGXnMwEKiLZyYgh7qG+B+eo0
 u9HRManROZO96Zb2S82ij6UwMx4UR6yvChj/uT/ioR7POh4SmX4X5Yq2g
 qd0eM/YkSb5FIrJjv8opGo/oyvJzPvEPPRUb/KM8ZApvl04NgDe7K5aoa
 2apCJy3rkxIpuJlJcvJwqCwEInAbm0oGi0gwoyG0g/JhD2lpRtiFqC7K9
 XiGM8s4GeuicpiMlWP1B9ljNk2vFdrsfUs6I7YaIU/KDvfIy7rcb6ITUH g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="283808515"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="283808515"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 15:05:18 -0700
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="772030031"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 15:05:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Correct ss -> steering calculation for pre-Xe_HP
 platforms
Date: Tue, 12 Jul 2022 15:05:13 -0700
Message-Id: <20220712220513.3451794-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.36.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Accidental use of a "SLICE" macro where a "SUBSLICE" macro was intended
causes the group ID for steering to be calculated incorrectly on
pre-Xe_HP platforms.

Fixes: 9a92732f040a ("drm/i915/gt: Add general DSS steering iterator to intel_gt_mcr")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index f8c64ab9d3ca..e79405a45312 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -515,7 +515,7 @@ void intel_gt_mcr_get_ss_steering(struct intel_gt *gt, unsigned int dss,
 		*group = dss / GEN_DSS_PER_GSLICE;
 		*instance = dss % GEN_DSS_PER_GSLICE;
 	} else {
-		*group = dss / GEN_MAX_HSW_SLICES;
+		*group = dss / GEN_MAX_SS_PER_HSW_SLICE;
 		*instance = dss % GEN_MAX_SS_PER_HSW_SLICE;
 		return;
 	}
-- 
2.36.1

