Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E827B0DE0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 23:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFCE10E5B6;
	Wed, 27 Sep 2023 21:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C642510E5A5;
 Wed, 27 Sep 2023 21:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695849074; x=1727385074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xv1/sRvQWGiLl6f9AeUIgkAHIZW7uPHm1MOTnUm1BWI=;
 b=KGOktR/JP4fE1SFlc9pi04+A105hnxrvVNIiZHwKULYefAQNDCRD2mer
 p2KO+45BL7K0YfYH8BSjC/w0Nz+GXbdpwkwfRvwIkQZhJC6fRwDQ1nPR+
 eQgiY4jW+OUNQJqrk26zzZK+ph5KhYGIX2bYugcE2z3Jpl33wwgobaiIe
 MZPc+lHiw5hW42wUU+ykO/7nG43dLRFX6ZbBgILi6F1FDggtsbytrFgGV
 2OoepDMiQmr+ePSTQQxyvyVtXi6Tp8eo0zqM0FN3soJ5uVXI2ww/Q2bPv
 8qWYxEJlkn49mEZAMAI3lljBZhvmH9UJkXLQA7jpEXnmI22oCEOCGLhWZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="3470822"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="3470822"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 14:04:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="864987677"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="864987677"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 14:04:08 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 3/4] drm/i915: Reset steer semaphore for media GT on resume
Date: Wed, 27 Sep 2023 23:03:56 +0200
Message-ID: <20230927210357.17461-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230927210357.17461-1-nirmoy.das@intel.com>
References: <20230927210357.17461-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: matthew.d.roper@intel.com, andi.shyti@linux.intel.com,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During resume, the steer semaphore on GT1 was observed to be held. The
hardware team has confirmed the safety of clearing the steer semaphore
during driver load/resume, as no lock acquisitions can occur in this
process by other agents.

v2: reset on resume not in intel_gt_init().
v3: do the reset on intel_gt_resume_early()

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index dab73980c9f1..59cebf205b72 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -13,6 +13,7 @@
 #include "intel_engine_pm.h"
 #include "intel_gt.h"
 #include "intel_gt_clock_utils.h"
+#include "intel_gt_mcr.h"
 #include "intel_gt_pm.h"
 #include "intel_gt_print.h"
 #include "intel_gt_requests.h"
@@ -218,6 +219,17 @@ void intel_gt_pm_fini(struct intel_gt *gt)
 
 void intel_gt_resume_early(struct intel_gt *gt)
 {
+	/*
+	 * Reset the steer semaphore on GT1, as we have observed it
+	 * remaining held after a suspend operation. Confirmation
+	 * from the hardware team ensures the safety of resetting
+	 * the steer semaphore during driver load/resume, as there
+	 * are no lock acquisitions during this process by other
+	 * agents.
+	 */
+	if (MEDIA_VER(gt->i915) >= 13 && gt->type == GT_MEDIA)
+		intel_gt_mcr_lock_reset(gt);
+
 	intel_uncore_resume_early(gt->uncore);
 	intel_gt_check_and_clear_faults(gt);
 }
-- 
2.41.0

