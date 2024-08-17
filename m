Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F62E9559BA
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 23:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8211410E0F1;
	Sat, 17 Aug 2024 21:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TxE+ztWY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E5910E0F5;
 Sat, 17 Aug 2024 21:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723928478; x=1755464478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ly9Fdr/iERN3yio0j4/aEZELJnKRa+GMJXVmIwYHrC4=;
 b=TxE+ztWYGZAdioXCiLMXf+T6oiYvmZaZRDIvSY87QrCX5XhThtGLExMF
 IEjPeekRm9ECnqzm1TpQdzNVoh7ni8xveycCE6DhTABOp3XB31HxOopxJ
 amC+hEK5IDfd+U5kr2PVV8gp43DYM8+le4zTDMruIfNVBxDeQOdMJqj7M
 zAdxvIEzMFuTZZtZIpgCjQ4daG9/OCO+JFaSy5fc/loafE3wOudINdIee
 +sYdltPFlv4GL40ketfM6jU1g7NK/zTJ+Kt7UsVo/5BBhR/lmH0MdlEX/
 TmSofyTnquThWy+TckOZ0KsEGmOfOvsSKvfkhvcdDlGOn0Ti/hH1fHJou g==;
X-CSE-ConnectionGUID: 6YThCiScQUWK3s/kMmTC9Q==
X-CSE-MsgGUID: 2j0B5gbsQD69MyEOlgWLow==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="44725435"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="44725435"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:01:18 -0700
X-CSE-ConnectionGUID: aJsGh4/oQ1mGBUFCjOmF6Q==
X-CSE-MsgGUID: eloRSpWoTdKyVysXsidmVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="59636027"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.11])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:01:15 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [RFC PATCH v2 05/11] drm/i915/gt: Remove cslices mask value from the
 CCS structure
Date: Sat, 17 Aug 2024 23:00:20 +0200
Message-ID: <20240817210026.310645-6-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240817210026.310645-1-andi.shyti@linux.intel.com>
References: <20240817210026.310645-1-andi.shyti@linux.intel.com>
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
index 6afd44ffc358..2b6d4ee7445d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -9,7 +9,7 @@
 
 void intel_gt_apply_ccs_mode(struct intel_gt *gt, u32 mode)
 {
-	unsigned long cslices_mask = gt->ccs.cslices;
+	unsigned long cslices_mask = CCS_MASK(gt);
 	u32 mode_val = 0;
 	u32 m = mode;
 	int ccs_id;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index 8df8fac066c0..a833b395237b 100644
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
 		struct mutex mutex;
 		u32 mode_reg_val;
 	} ccs;
-- 
2.45.2

