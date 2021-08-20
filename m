Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045A53F36E1
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 00:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240736EB4E;
	Fri, 20 Aug 2021 22:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5AB6EB2C;
 Fri, 20 Aug 2021 22:50:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="216580033"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="216580033"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 15:50:01 -0700
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="513098564"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 15:50:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>,
	<tony.ye@intel.com>,
	<zhengguo.xu@intel.com>
Subject: [PATCH 03/27] drm/i915/guc: Connect the number of guc_ids to debugfs
Date: Fri, 20 Aug 2021 15:44:22 -0700
Message-Id: <20210820224446.30620-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210820224446.30620-1-matthew.brost@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
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

For testing purposes it may make sense to reduce the number of guc_ids
available to be allocated. Add debugfs support for setting the number of
guc_ids.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    | 31 +++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
index 887c8c8f35db..b88d343ee432 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
@@ -71,12 +71,43 @@ static bool intel_eval_slpc_support(void *data)
 	return intel_guc_slpc_is_used(guc);
 }
 
+static int guc_num_id_get(void *data, u64 *val)
+{
+	struct intel_guc *guc = data;
+
+	if (!intel_guc_submission_is_used(guc))
+		return -ENODEV;
+
+	*val = guc->num_guc_ids;
+
+	return 0;
+}
+
+static int guc_num_id_set(void *data, u64 val)
+{
+	struct intel_guc *guc = data;
+
+	if (!intel_guc_submission_is_used(guc))
+		return -ENODEV;
+
+	if (val > guc->max_guc_ids)
+		val = guc->max_guc_ids;
+	else if (val < 256)
+		val = 256;
+
+	guc->num_guc_ids = val;
+
+	return 0;
+}
+DEFINE_SIMPLE_ATTRIBUTE(guc_num_id_fops, guc_num_id_get, guc_num_id_set, "%lld\n");
+
 void intel_guc_debugfs_register(struct intel_guc *guc, struct dentry *root)
 {
 	static const struct debugfs_gt_file files[] = {
 		{ "guc_info", &guc_info_fops, NULL },
 		{ "guc_registered_contexts", &guc_registered_contexts_fops, NULL },
 		{ "guc_slpc_info", &guc_slpc_info_fops, &intel_eval_slpc_support},
+		{ "guc_num_id", &guc_num_id_fops, NULL },
 	};
 
 	if (!intel_guc_is_supported(guc))
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 8235e49bb347..68742b612692 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2716,7 +2716,8 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
 
 	if (unlikely(desc_idx >= guc->max_guc_ids)) {
 		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Invalid desc_idx %u", desc_idx);
+			"Invalid desc_idx %u, max %u",
+			desc_idx, guc->max_guc_ids);
 		return NULL;
 	}
 
-- 
2.32.0

