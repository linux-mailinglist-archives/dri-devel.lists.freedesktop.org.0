Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 427D360532F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 00:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5F910E264;
	Wed, 19 Oct 2022 22:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60E310E264;
 Wed, 19 Oct 2022 22:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666218329; x=1697754329;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=afufhKibvZecEmiMC7XSxm69VGptDJMBoHB5eO7F5pc=;
 b=oFtA29T/iTeguXTaCnwxxha5mtJXFwSXN/wWOCE99Jwwpjcl580h03nr
 mqX3NcCjq6NyVTgsKXc3FvQQ9spsPWxw35Ud3jzsl2Ydev56u9UUqX9Uq
 gSI9o0mj08z6uJaoXMx9jCCgbNlaq8aUc8BHBZaadMawSbj2iE1Q5HsOB
 RnTqmBaHeNDxhP80gBPwdUVmvRDj4dyrXPUj0chBOZ5zdiUggijbk3uSE
 u+Yezos7slBmVq0vKL3SL1rnKWvUVyt/jzWbFuEByjtwtvWzyuNOjE0Zy
 BWacZ5pplda+kY1fiaf0cL88ttTeEzqfj1LeElvOm+/Mcp6BCsKTHTKij g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333107569"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="333107569"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 15:24:44 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="754789873"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="754789873"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 15:24:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/xelpg: Fix write to MTL_MCR_SELECTOR
Date: Wed, 19 Oct 2022 15:24:37 -0700
Message-Id: <20221019222437.3035182-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A misplaced closing parenthesis caused the groupid/instanceid values to
be considered part of the ternary operator's condition instead of being
OR'd into the resulting value.

Fixes: f32898c94a10 ("drm/i915/xelpg: Add multicast steering")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index 0d2811724b00..46cf2f3d1e8e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -249,7 +249,7 @@ static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
 		intel_uncore_write_fw(uncore, MTL_MCR_SELECTOR,
 				      REG_FIELD_PREP(MTL_MCR_GROUPID, group) |
 				      REG_FIELD_PREP(MTL_MCR_INSTANCEID, instance) |
-				      (rw_flag == FW_REG_READ) ? GEN11_MCR_MULTICAST : 0);
+				      (rw_flag == FW_REG_READ ? GEN11_MCR_MULTICAST : 0));
 	} else if (GRAPHICS_VER(uncore->i915) >= 11) {
 		mcr_mask = GEN11_MCR_SLICE_MASK | GEN11_MCR_SUBSLICE_MASK;
 		mcr_ss = GEN11_MCR_SLICE(group) | GEN11_MCR_SUBSLICE(instance);
-- 
2.37.3

