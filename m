Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5617E6BFCC5
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 21:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09E510E152;
	Sat, 18 Mar 2023 20:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C22A10E146;
 Sat, 18 Mar 2023 20:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679171825; x=1710707825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DHvh35evhBeJfDBy+dETHvvp3NWGorz2xz1jTjiRwug=;
 b=Q+Okj33x5+tjFxkCFa9/+FCskSH26gqpzJQljLNNov/xWq1nbev//ETx
 HVFRcKtyuGCT4Z+22VcuI54v3fQ9oGPUxnDEnhUqKyKj5sLPidAmzXZ8M
 B/TVUWYa/wV2qgNzoOT3mEun+a9myHb4CBlRGYFGbpFy741S8RtH37q6/
 eA96grGQ5feKFy5jcb9wlAigvh0JXLGyhnI9z7Iq5pNSb4AM5DmaN/aHy
 yusq7SJnbClA1hMc6PoG4/cD9UNL7EqFhVo9TtHFalPP9Dm0p6XyPsr12
 5eYmmHNPpnfEHeqFVEai5G/43zI+OMgMTsIStz+6S9Jih0yszDoeEUNeZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="403332527"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; d="scan'208";a="403332527"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2023 13:37:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="683027249"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; d="scan'208";a="683027249"
Received: from rmanole-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.34.109])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2023 13:37:02 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm/i915/gt: Create per-tile debugfs files
Date: Sat, 18 Mar 2023 21:36:15 +0100
Message-Id: <20230318203616.183765-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318203616.183765-1-andi.shyti@linux.intel.com>
References: <20230318203616.183765-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To support multi-GT configurations, we need to generate
independent debug files for each GT.

To achieve this create a separate directory for each GT under the
debugfs directory. For instance, in a system with two tiles, the
debugfs structure would look like this:

/sys/kernel/debug/dri
                  └── 0
                      ├── gt0
                      │   ├── drpc
                      │   ├── engines
                      │   ├── forcewake
                      │   ├── frequency
                      │   └── rps_boost
                      └── gt1
                      :   ├── drpc
                      :   ├── engines
                      :   ├── forcewake
                          ├── frequency
                          └── rps_boost

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c    | 4 +++-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        | 2 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 5 ++++-
 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c | 2 ++
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
index 5fc2df01aa0df..4dc23b8d3aa2d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
@@ -83,11 +83,13 @@ static void gt_debugfs_register(struct intel_gt *gt, struct dentry *root)
 void intel_gt_debugfs_register(struct intel_gt *gt)
 {
 	struct dentry *root;
+	char gtname[4];
 
 	if (!gt->i915->drm.primary->debugfs_root)
 		return;
 
-	root = debugfs_create_dir("gt", gt->i915->drm.primary->debugfs_root);
+	snprintf(gtname, sizeof(gtname), "gt%u", gt->info.id);
+	root = debugfs_create_dir(gtname, gt->i915->drm.primary->debugfs_root);
 	if (IS_ERR(root))
 		return;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index bb4dfe707a7d0..e46aac1a41e6d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -42,6 +42,8 @@ struct intel_guc {
 	/** @capture: the error-state-capture module's data and objects */
 	struct intel_guc_state_capture *capture;
 
+	struct dentry *dbgfs_node;
+
 	/** @sched_engine: Global engine used to submit requests to GuC */
 	struct i915_sched_engine *sched_engine;
 	/**
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index 195db8c9d4200..55bc8b55fbc05 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -542,8 +542,11 @@ static int guc_log_relay_create(struct intel_guc_log *log)
 	 */
 	n_subbufs = 8;
 
+	if (!guc->dbgfs_node)
+		return -ENOENT;
+
 	guc_log_relay_chan = relay_open("guc_log",
-					i915->drm.primary->debugfs_root,
+					guc->dbgfs_node,
 					subbuf_size, n_subbufs,
 					&relay_callbacks, i915);
 	if (!guc_log_relay_chan) {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c
index 284d6fbc2d08c..2f93cc4e408a8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c
@@ -54,6 +54,8 @@ void intel_uc_debugfs_register(struct intel_uc *uc, struct dentry *gt_root)
 	if (IS_ERR(root))
 		return;
 
+	uc->guc.dbgfs_node = root;
+
 	intel_gt_debugfs_register_files(root, files, ARRAY_SIZE(files), uc);
 
 	intel_guc_debugfs_register(&uc->guc, root);
-- 
2.39.2

