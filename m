Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D353B27D2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 08:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698F66EA10;
	Thu, 24 Jun 2021 06:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5916EA12;
 Thu, 24 Jun 2021 06:47:31 +0000 (UTC)
IronPort-SDR: 4eAU9V4NJRd091pdGLvpvC/zwh21LmhBoBaWxs8vjav86UtqcCxYF5gVHTGN7PPMoMVjy/JjrX
 7zIVYRSx76OA==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207346783"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="207346783"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:26 -0700
IronPort-SDR: 57QKoWM6lvFLXarvHxZssMXGboi5TUxgjeVc9+kwsBtdwwpLULX5+AoYprINyl6IDPL9kTMaXg
 pG10o077kMaA==
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="556391000"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 45/47] drm/i915/guc: Include scheduling policies in the
 debugfs state dump
Date: Thu, 24 Jun 2021 00:05:14 -0700
Message-Id: <20210624070516.21893-46-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210624070516.21893-1-matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Added the scheduling policy parameters to the 'guc_info' debugfs state
dump.

Signed-off-by: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c     | 13 +++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h     |  2 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c |  2 ++
 3 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index c6d0b762d82c..b8182844aa00 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -92,6 +92,19 @@ static void guc_policies_init(struct intel_guc *guc, struct guc_policies *polici
 	policies->is_valid = 1;
 }
 
+void intel_guc_log_policy_info(struct intel_guc *guc, struct drm_printer *dp)
+{
+	struct __guc_ads_blob *blob = guc->ads_blob;
+
+	if (unlikely(!blob))
+		return;
+
+	drm_printf(dp, "Global scheduling policies:\n");
+	drm_printf(dp, "  DPC promote time   = %u\n", blob->policies.dpc_promote_time);
+	drm_printf(dp, "  Max num work items = %u\n", blob->policies.max_num_work_items);
+	drm_printf(dp, "  Flags              = %u\n", blob->policies.global_flags);
+}
+
 static int guc_action_policies_update(struct intel_guc *guc, u32 policy_offset)
 {
 	u32 action[] = {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
index b00d3ae1113a..0fdcb3583601 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
@@ -7,9 +7,11 @@
 #define _INTEL_GUC_ADS_H_
 
 struct intel_guc;
+struct drm_printer;
 
 int intel_guc_ads_create(struct intel_guc *guc);
 void intel_guc_ads_destroy(struct intel_guc *guc);
 void intel_guc_ads_reset(struct intel_guc *guc);
+void intel_guc_log_policy_info(struct intel_guc *guc, struct drm_printer *p);
 
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
index 62b9ce0fafaa..9a03ff56e654 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
@@ -10,6 +10,7 @@
 #include "intel_guc_debugfs.h"
 #include "intel_guc_log_debugfs.h"
 #include "gt/uc/intel_guc_ct.h"
+#include "gt/uc/intel_guc_ads.h"
 #include "gt/uc/intel_guc_submission.h"
 
 static int guc_info_show(struct seq_file *m, void *data)
@@ -29,6 +30,7 @@ static int guc_info_show(struct seq_file *m, void *data)
 
 	intel_guc_log_ct_info(&guc->ct, &p);
 	intel_guc_log_submission_info(guc, &p);
+	intel_guc_log_policy_info(guc, &p);
 
 	return 0;
 }
-- 
2.28.0

