Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 243003D02D3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1D66E51B;
	Tue, 20 Jul 2021 20:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672116E49F;
 Tue, 20 Jul 2021 20:40:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="296885362"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="296885362"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:15 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906057"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 03/42] drm/i915/guc: Connect the number of guc_ids to
 debugfs
Date: Tue, 20 Jul 2021 13:57:23 -0700
Message-Id: <20210720205802.39610-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210720205802.39610-1-matthew.brost@intel.com>
References: <20210720205802.39610-1-matthew.brost@intel.com>
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
index 72ddfff42f7d..7c479c5e7b3a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
@@ -50,11 +50,42 @@ static int guc_registered_contexts_show(struct seq_file *m, void *data)
 }
 DEFINE_GT_DEBUGFS_ATTRIBUTE(guc_registered_contexts);
 
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
+		{ "guc_num_id", &guc_num_id_fops, NULL },
 	};
 
 	if (!intel_guc_is_supported(guc))
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 46a149d447e6..c6069fe2f23c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2540,7 +2540,8 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
 
 	if (unlikely(desc_idx >= guc->max_guc_ids)) {
 		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Invalid desc_idx %u", desc_idx);
+			"Invalid desc_idx %u, max %u",
+			desc_idx, guc->max_guc_ids);
 		return NULL;
 	}
 
-- 
2.28.0

