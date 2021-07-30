Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF423DBFA6
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 22:22:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE7A6F494;
	Fri, 30 Jul 2021 20:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3E16F48E;
 Fri, 30 Jul 2021 20:22:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10061"; a="276939741"
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="276939741"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 13:22:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="499741640"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga001.jf.intel.com with ESMTP; 30 Jul 2021 13:22:00 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Subject: [PATCH 09/14] drm/i915/guc/slpc: Add debugfs for SLPC info
Date: Fri, 30 Jul 2021 13:21:14 -0700
Message-Id: <20210730202119.23810-10-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210730202119.23810-1-vinay.belgaumkar@intel.com>
References: <20210730202119.23810-1-vinay.belgaumkar@intel.com>
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

This prints out relevant SLPC info from the SLPC shared structure.

We will send a H2G message which forces SLPC to update the
shared data structure with latest information before reading it.

v2: Address review comments (Michal W)
v3: Remove unnecessary tasks from slpc_info (Michal W)
v4: Rename function to intel_guc_slpc_print_info() (Michal W)
v5: checkpatch()

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    | 22 ++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 29 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  3 ++
 3 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
index 72ddfff42f7d..887c8c8f35db 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
@@ -12,6 +12,7 @@
 #include "gt/uc/intel_guc_ct.h"
 #include "gt/uc/intel_guc_ads.h"
 #include "gt/uc/intel_guc_submission.h"
+#include "gt/uc/intel_guc_slpc.h"
 
 static int guc_info_show(struct seq_file *m, void *data)
 {
@@ -50,11 +51,32 @@ static int guc_registered_contexts_show(struct seq_file *m, void *data)
 }
 DEFINE_GT_DEBUGFS_ATTRIBUTE(guc_registered_contexts);
 
+static int guc_slpc_info_show(struct seq_file *m, void *unused)
+{
+	struct intel_guc *guc = m->private;
+	struct intel_guc_slpc *slpc = &guc->slpc;
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	if (!intel_guc_slpc_is_used(guc))
+		return -ENODEV;
+
+	return intel_guc_slpc_print_info(slpc, &p);
+}
+DEFINE_GT_DEBUGFS_ATTRIBUTE(guc_slpc_info);
+
+static bool intel_eval_slpc_support(void *data)
+{
+	struct intel_guc *guc = (struct intel_guc *)data;
+
+	return intel_guc_slpc_is_used(guc);
+}
+
 void intel_guc_debugfs_register(struct intel_guc *guc, struct dentry *root)
 {
 	static const struct debugfs_gt_file files[] = {
 		{ "guc_info", &guc_info_fops, NULL },
 		{ "guc_registered_contexts", &guc_registered_contexts_fops, NULL },
+		{ "guc_slpc_info", &guc_slpc_info_fops, &intel_eval_slpc_support},
 	};
 
 	if (!intel_guc_is_supported(guc))
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 8bfd1880b2f5..4bf7c150330a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -432,6 +432,35 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 	return 0;
 }
 
+int intel_guc_slpc_print_info(struct intel_guc_slpc *slpc, struct drm_printer *p)
+{
+	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	struct slpc_shared_data *data = slpc->vaddr;
+	struct slpc_task_state_data *slpc_tasks;
+	intel_wakeref_t wakeref;
+	int ret = 0;
+
+	GEM_BUG_ON(!slpc->vma);
+
+	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
+		ret = slpc_query_task_state(slpc);
+
+		if (!ret) {
+			slpc_tasks = &data->task_state_data;
+
+			drm_printf(p, "\tSLPC state: %s\n", slpc_get_state_string(slpc));
+			drm_printf(p, "\tGTPERF task active: %s\n",
+				   yesno(slpc_tasks->status & SLPC_GTPERF_TASK_ENABLED));
+			drm_printf(p, "\tMax freq: %u MHz\n",
+				   slpc_decode_max_freq(slpc));
+			drm_printf(p, "\tMin freq: %u MHz\n",
+				   slpc_decode_min_freq(slpc));
+		}
+	}
+
+	return ret;
+}
+
 void intel_guc_slpc_fini(struct intel_guc_slpc *slpc)
 {
 	if (!slpc->vma)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
index 78a7893ce489..3ffd4f2e3151 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
@@ -9,6 +9,8 @@
 #include "intel_guc_submission.h"
 #include "intel_guc_slpc_types.h"
 
+struct drm_printer;
+
 static inline bool intel_guc_slpc_is_supported(struct intel_guc *guc)
 {
 	return guc->slpc.supported;
@@ -33,5 +35,6 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
 int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
 int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val);
 int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val);
+int intel_guc_slpc_print_info(struct intel_guc_slpc *slpc, struct drm_printer *p);
 
 #endif
-- 
2.25.0

