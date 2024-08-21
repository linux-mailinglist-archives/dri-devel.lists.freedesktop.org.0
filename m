Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C484959C34
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 14:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1AB10E8F7;
	Wed, 21 Aug 2024 12:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ei32HDCJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D68010E8F7;
 Wed, 21 Aug 2024 12:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724244304; x=1755780304;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XyCJzqHtg3tGBXRJlP1qWgUsdEQ7bma10824ECpUiLw=;
 b=Ei32HDCJwaYbxzduJGSKh6yuGzYVJMSKuWm47okwAPF1aQc+6Qz2Kzbe
 7/WZI3kshkawX2ryXYUWEc4120Gah2EQu4Wj474qrjNhUnA1sQeaPaeua
 6ocr7AFsmJO3MjW3EGCtv2UQZ/2VrI4SXG1YGzeBLz30jUqYxFBHWL/fG
 /YaDU9Y5TfB2DZwD0BMaDtmBZNlVPycBO/0DOV5YmTq0qWbRoNJguIw8B
 KP9DOLVFO8d1NlJklfgYFaE33xgzI8TO1RrUv6CoJY57hYkq7EsknRgUv
 Vj/vabxc7ObIfP5xcctwJTHxQnLk4C93MVo4ZegDBfcLb/XLUFp7fqw3V Q==;
X-CSE-ConnectionGUID: qMNjuT/fTVqtvm1eKqVdpA==
X-CSE-MsgGUID: +vBBNzpZQ/ycI4UfZaduxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="26395395"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="26395395"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:45:04 -0700
X-CSE-ConnectionGUID: SzfOM2bIQP2SrocvTm8ccg==
X-CSE-MsgGUID: G7r7oqzzRfqJX4AXIBG0Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="66038723"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.24])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:45:01 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v1 08/14] drm/i915/gt: Remove cslices mask value from the CCS
 structure
Date: Wed, 21 Aug 2024 14:43:43 +0200
Message-ID: <20240821124349.295259-9-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821124349.295259-1-andi.shyti@linux.intel.com>
References: <20240821124349.295259-1-andi.shyti@linux.intel.com>
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
index 5ca36985bdd7..f0319278a5fc 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -9,7 +9,7 @@
 
 static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
 {
-	unsigned long cslices_mask = gt->ccs.cslices;
+	unsigned long cslices_mask = CCS_MASK(gt);
 	u32 mode_val = 0;
 	/* CCS mode, i.e. number of CCS engines to be enabled */
 	u32 width = 1;
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

