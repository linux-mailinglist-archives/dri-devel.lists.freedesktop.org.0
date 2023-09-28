Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D6D7B1D30
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 15:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9A810E647;
	Thu, 28 Sep 2023 13:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043DC10E641;
 Thu, 28 Sep 2023 13:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695906028; x=1727442028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gAKFtHDKecsq4LAcANjzCt/gwGh6Bi3Fd1ppBUQlIno=;
 b=CUQtwHyp2/eJCLdy4mu/HlSxhPOoM1mrefFssOj/HowolGyB8lfdizZt
 qguCXrDkvrpRcUlgFlZJRJ7q9YCsEKWb+dJIJmAg+StlZC/Yn/dOt5avH
 ZspcSJjiM6AqYvfOE2MkLQO8WrG5XawOpqZMrdjcalMAAbS/G2PA7hPB8
 O3CUPIv/ReIpzPM6lQ96icTZqEfdxyIjFLXXfNvuk3AWnHrwrjB2BMzN1
 jCYWtOVMobWSV7eTRz8pTFqfwCwgOb26r50cnoYzkr4Wit+1Nv4GM8JRd
 5a1hIuLoX9xqBRniqZ/hwMAGee3ekVeAXq+aAYDq4OYx0Ccp3kFsz0/ab Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="380925498"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="380925498"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 06:00:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="865247789"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="865247789"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 06:00:26 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 3/4] drm/i915: Clean steer semaphore on resume
Date: Thu, 28 Sep 2023 15:00:14 +0200
Message-ID: <20230928130015.6758-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928130015.6758-1-nirmoy.das@intel.com>
References: <20230928130015.6758-1-nirmoy.das@intel.com>
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
hardware team has confirmed the safety of clearing steer semaphores
for all GTs during driver load/resume, as no lock acquisitions can occur
in this process by other agents.

v2: reset on resume not in intel_gt_init().
v3: do the reset on intel_gt_resume_early()
v4: do general sanitization for all GTs(Matt)

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index dab73980c9f1..3461f3e74277 100644
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
@@ -218,6 +219,15 @@ void intel_gt_pm_fini(struct intel_gt *gt)
 
 void intel_gt_resume_early(struct intel_gt *gt)
 {
+	/*
+	 * Sanitize steer semaphores during driver resume. This is necessary
+	 * to address observed cases of steer semaphores being
+	 * held after a suspend operation. Confirmation from the hardware team
+	 * assures the safety of this operation, as no lock acquisitions
+	 * by other agents occur during driver load/resume process.
+	 */
+	intel_gt_mcr_lock_sanitize(gt);
+
 	intel_uncore_resume_early(gt->uncore);
 	intel_gt_check_and_clear_faults(gt);
 }
-- 
2.41.0

