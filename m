Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8293695BD37
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 19:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0111910EB92;
	Thu, 22 Aug 2024 17:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FDN1u6Mx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E191510EB92;
 Thu, 22 Aug 2024 17:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724347769; x=1755883769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RZXagvd9a/iXlh5duGIJn7XPRJeVbbKXDz7sy800Ifs=;
 b=FDN1u6MxyCD6IGgADfPvzJhluLEFPVb+A2Yfcv/T7Q8M7uA/xh1K9RZA
 OYIZW11wgy4pZNdkLPtyTK4AnqtgWDf1qxGQX0BAD4dUimiEBZ2LH9nHE
 cmBwMo8rgliSH7tFg/hYHWV1H/+zxaqilDkm82z5ZNYzLItLxsg+qsRwl
 N1XWSq0VZ/rmQ2AHtIzZVYVaNb6IReWUzDrLYJsNhLygHCwc3mkqnrgOf
 J3dhFa6ylvZO5xxWRVeUut7EvcKqNEawxV8WYlhBnVVcoUv8qyKp3AQYH
 aHqiK3+sn3W/xwmsli3fAaWs1oaIX6NtIDgyrkRRTXLUikr92VOujby5h A==;
X-CSE-ConnectionGUID: rPJXbT3GR3eb45zKBwI5sw==
X-CSE-MsgGUID: V7QyAZsnTHOhBWkQx1blaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22935366"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22935366"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:29:28 -0700
X-CSE-ConnectionGUID: 61bA9HpYT9+FhYRBoscSgg==
X-CSE-MsgGUID: 3D1B/9lpTLSRaP6HgHRphA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="84706391"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.104])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:29:27 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v2 08/15] drm/i915/gt: Remove cslices mask value from the CCS
 structure
Date: Thu, 22 Aug 2024 19:28:25 +0200
Message-ID: <20240822172832.494994-9-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240822172832.494994-1-andi.shyti@linux.intel.com>
References: <20240822172832.494994-1-andi.shyti@linux.intel.com>
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
2.45.2

