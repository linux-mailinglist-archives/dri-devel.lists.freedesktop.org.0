Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6776A6B52
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 12:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412A910E234;
	Wed,  1 Mar 2023 11:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79D610E22F;
 Wed,  1 Mar 2023 11:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677668595; x=1709204595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HkQB036vPgTP6vE8hBUaoi26VEOR5kDvZzeGa0ruqjM=;
 b=TzK/A8lFznyvL1ZKieYJN4aKmmBaKl4zupXr4lRwGBx+ikX0yU232a06
 DzdDuPM02qb7r200C/JVFTNeHsk3/42mSPUx1Wt1g9KDk89Bc+Sij0Ccb
 AcUeUSWqHOod5MTyw+PBJOLYhu5Vm0Uz/uVmMO58DvKj3S/3nr5YpfRgS
 9maeAyu+ASkqT/NzumlLtT/S8oPEnkRUAMdeRCRv7+TTWI2mnudLTkT/+
 Pu9GBMtHCnd3zreCWNntsRWncsw6OEpdzkERTd4VxLEPwx5iUxNpUKico
 hQXPIunku3Xiek/PmJOc1aJThttSC4c79cFM8Cbke3GUr2hgSK7ZlTMDO Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="331859874"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="331859874"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 03:03:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="676715047"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="676715047"
Received: from unknown (HELO intel.com) ([10.252.57.78])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 03:03:13 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/i915/gt: Create per-tile debugfs files
Date: Wed,  1 Mar 2023 12:02:57 +0100
Message-Id: <20230301110258.2140955-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230301110258.2140955-1-andi.shyti@linux.intel.com>
References: <20230301110258.2140955-1-andi.shyti@linux.intel.com>
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
 Andi Shyti <andi@etezian.org>, Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
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
2.39.1

