Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFC0375B3E
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 21:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1D26EE14;
	Thu,  6 May 2021 18:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A366EDA8;
 Thu,  6 May 2021 18:57:15 +0000 (UTC)
IronPort-SDR: QglYzu7q81qgoZl+pDMxdylMNSRCh4wDJa7ufefH8Ms+aYEGdtsmYiEckOlHxsn2AV9F/32GEn
 ce1YTDlsImWA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="219439492"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="219439492"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:14 -0700
IronPort-SDR: d3tpVEodrwBnvfyROVImRT03DuVqb0ZNmZlBjDa8FG32oO4x5XKttkRKkf/+aSJfi6bFmnzUqJ
 cQQON1gfRl+g==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583626"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 82/97] drm/i915/guc: Connect the number of guc_ids to
 debugfs
Date: Thu,  6 May 2021 12:14:36 -0700
Message-Id: <20210506191451.77768-83-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
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
index 9a03ff56e654..474c96fc16ef 100644
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
index 8f40e534bc81..3c73c2ca668e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2153,7 +2153,8 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
 
 	if (unlikely(desc_idx >= guc->max_guc_ids)) {
 		drm_dbg(&guc_to_gt(guc)->i915->drm,
-			"Invalid desc_idx %u", desc_idx);
+			"Invalid desc_idx %u, max %u",
+			desc_idx, guc->max_guc_ids);
 		return NULL;
 	}
 
-- 
2.28.0

