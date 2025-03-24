Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9206EA6DB8E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 14:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC91E10E405;
	Mon, 24 Mar 2025 13:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SVX+3UkJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EB910E405;
 Mon, 24 Mar 2025 13:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742823075; x=1774359075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ec4keQkax8q652yYyRWcqB084B5FwldDIKKQW0gvYXc=;
 b=SVX+3UkJHlrsptGyFCv+FR61vXypnb0ZNhI+e0Fq9AfdjCjZpFxg4jYa
 w4DdZYylE5rwB333BnvlWCFtslha2CVfYOTmjPhTJeSAjPEcnzHdSmaTV
 TpXLsjlH0k7v+oBpXK+DSvg71guuncRWwQXrJ9Siv0nN9AkFpGmGqIwh7
 toy0Ai7dSi5WYmMHDXk4MyG2hqe1Ye3Qt6tCGN61hKcDGfhMGzdGY58+P
 NjvnZEDTzOnrtfqvwNFeg83cULcBPLvtkuF8Nh0MYqEFFC00DiQZPiggh
 2g5P4JsAATiOaNuhPSw6+W9c/5Op5Jve430HJhv/Tas5AH97VzuMwVKSo w==;
X-CSE-ConnectionGUID: TVseiJblTHmR/nNZ+aTv7w==
X-CSE-MsgGUID: Su1w+tIoQ8GUtZcyt0HuDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55024697"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="55024697"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:31:15 -0700
X-CSE-ConnectionGUID: n9X/B3GjRBqflKxyrwws2A==
X-CSE-MsgGUID: L+Orx1lzTcmxFa/AK+6V2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="155060061"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.252])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:31:11 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Arshad Mehmood <arshad.mehmood@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v4 08/15] drm/i915/gt: Remove cslices mask value from the CCS
 structure
Date: Mon, 24 Mar 2025 14:29:44 +0100
Message-ID: <20250324132952.1075209-9-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
References: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
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

Following the decision to manage CCS engine creation within UABI
engines, the "cslices" variable in the "ccs" structure in the
"gt" is no longer needed. Remove it is now redundant.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 2 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h    | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
index a6c33b471567..fc8a23fc28b6 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -9,7 +9,7 @@
 
 static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
 {
-	unsigned long cslices_mask = gt->ccs.cslices;
+	unsigned long cslices_mask = CCS_MASK(gt);
 	u32 mode_val = 0;
 	/* CCS engine id, i.e. the engines position in the engine's bitmask */
 	int engine;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index 9e257f34d05b..71e43071da0b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -218,11 +218,6 @@ struct intel_gt {
 	 * i.e. how the CCS streams are distributed amongs the slices.
 	 */
 	struct {
-		/*
-		 * Mask of the non fused CCS slices
-		 * to be used for the load balancing
-		 */
-		intel_engine_mask_t cslices;
 		u32 mode_reg_val;
 	} ccs;
 
-- 
2.47.2

