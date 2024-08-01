Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA53944F80
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 17:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE49A10E8B6;
	Thu,  1 Aug 2024 15:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W8bFVWA9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980AE10E033;
 Thu,  1 Aug 2024 15:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722526832; x=1754062832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2BC4AvINo/3dpxp1thFj6sMz2KD2EUZYa1tRGmcj1m8=;
 b=W8bFVWA98zfGHgLmYDcOJjO8F5NBEWKb3G4/B3ocOXYQJwkYxXYS8wBb
 q/wkHknNjlFcRluSWx278lR7MlBOIfNvawU0rmpNyV9zJflJPZ/9BXkRQ
 iq1332KRP1suGOZsC8PqixVeAiuW+JtVq7XYmx1A/abMLjcsKuaXJsPnL
 L3xLA0YkUfPv7YGcpMdgzDtZZdL0u0c08NvuY+KPHX+HXF9+RGVZ4jYBy
 c4h9O2qtYjiy8TgozsloYkXy1oNSehadfhtPvuRbY2Bi7pOIvpSroEdaj
 60BUdObSVm7k2ftZY1TOG6/HhZOGcU/oCL6hXvwW9tcCNYu5EBSk1DrWJ w==;
X-CSE-ConnectionGUID: zrcOFh2ATV6NLKXE/fY0Nw==
X-CSE-MsgGUID: XQjtijlQSwOlWxTX4/ecug==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="23407970"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="23407970"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 08:40:31 -0700
X-CSE-ConnectionGUID: hAuVPot8QMGiAdi9+DhnpQ==
X-CSE-MsgGUID: 5MfZAVnqS56Q6Xe1dlsWyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55047757"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 08:40:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH v5 3/3] drm/xe: Faster devcoredump
Date: Thu,  1 Aug 2024 08:41:18 -0700
Message-Id: <20240801154118.2547543-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801154118.2547543-1-matthew.brost@intel.com>
References: <20240801154118.2547543-1-matthew.brost@intel.com>
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

The current algorithm to read out devcoredump is O(N*N) where N is the
size of coredump due to usage of the drm_coredump_printer in
xe_devcoredump_read. Switch to a O(N) algorithm which prints the
devcoredump into a readable format in snapshot work and update
xe_devcoredump_read to memcpy from the readable format directly.

v2:
 - Fix double free on devcoredump removal (Testing)
 - Set read_data_size after snap work flush
 - Adjust remaining in iterator upon realloc (Testing)
 - Set read_data upon realloc (Testing)
v3:
 - Kernel doc
v4:
 - Two pass algorithm to determine size (Maarten)
v5:
 - Use scope for reading variables (Johnathan)

Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2408
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 111 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   8 ++
 2 files changed, 88 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index d8d8ca2c19d3..bdb76e834e4c 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -66,22 +66,9 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
 	return &q->gt->uc.guc;
 }
 
-static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
-{
-	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
-
-	/* keep going if fw fails as we still want to save the memory and SW data */
-	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
-		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
-	xe_vm_snapshot_capture_delayed(ss->vm);
-	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
-	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
-}
-
-static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
-				   size_t count, void *data, size_t datalen)
+static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
+				     struct xe_devcoredump *coredump)
 {
-	struct xe_devcoredump *coredump = data;
 	struct xe_device *xe;
 	struct xe_devcoredump_snapshot *ss;
 	struct drm_printer p;
@@ -89,18 +76,11 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	struct timespec64 ts;
 	int i;
 
-	if (!coredump)
-		return -ENODEV;
-
 	xe = coredump_to_xe(coredump);
 	ss = &coredump->snapshot;
 
-	/* Ensure delayed work is captured before continuing */
-	flush_work(&ss->work);
-
 	iter.data = buffer;
-	iter.offset = 0;
-	iter.start = offset;
+	iter.start = 0;
 	iter.remain = count;
 
 	p = drm_coredump_printer(&iter);
@@ -134,10 +114,83 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	return count - iter.remain;
 }
 
+static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
+{
+	int i;
+
+	xe_guc_ct_snapshot_free(ss->ct);
+	ss->ct = NULL;
+
+	xe_guc_exec_queue_snapshot_free(ss->ge);
+	ss->ge = NULL;
+
+	xe_sched_job_snapshot_free(ss->job);
+	ss->job = NULL;
+
+	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
+		if (ss->hwe[i]) {
+			xe_hw_engine_snapshot_free(ss->hwe[i]);
+			ss->hwe[i] = NULL;
+		}
+
+	xe_vm_snapshot_free(ss->vm);
+	ss->vm = NULL;
+}
+
+static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
+{
+	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
+	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
+
+	/* keep going if fw fails as we still want to save the memory and SW data */
+	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
+		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
+	xe_vm_snapshot_capture_delayed(ss->vm);
+	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
+	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
+
+	/* Calculate devcoredump size */
+	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
+
+	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
+	if (!ss->read.buffer)
+		return;
+
+	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
+	xe_devcoredump_snapshot_free(ss);
+}
+
+static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
+				   size_t count, void *data, size_t datalen)
+{
+	struct xe_devcoredump *coredump = data;
+	struct xe_devcoredump_snapshot *ss;
+	ssize_t byte_copied;
+
+	if (!coredump)
+		return -ENODEV;
+
+	ss = &coredump->snapshot;
+
+	/* Ensure delayed work is captured before continuing */
+	flush_work(&ss->work);
+
+	if (!ss->read.buffer)
+		return -ENODEV;
+
+	if (offset >= ss->read.size)
+		return 0;
+
+	byte_copied = count < ss->read.size - offset ? count :
+		ss->read.size - offset;
+	memcpy(buffer, ss->read.buffer + offset, byte_copied);
+
+	return byte_copied;
+}
+
 static void xe_devcoredump_free(void *data)
 {
 	struct xe_devcoredump *coredump = data;
-	int i;
 
 	/* Our device is gone. Nothing to do... */
 	if (!data || !coredump_to_xe(coredump))
@@ -145,13 +198,8 @@ static void xe_devcoredump_free(void *data)
 
 	cancel_work_sync(&coredump->snapshot.work);
 
-	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
-	xe_guc_exec_queue_snapshot_free(coredump->snapshot.ge);
-	xe_sched_job_snapshot_free(coredump->snapshot.job);
-	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
-		if (coredump->snapshot.hwe[i])
-			xe_hw_engine_snapshot_free(coredump->snapshot.hwe[i]);
-	xe_vm_snapshot_free(coredump->snapshot.vm);
+	xe_devcoredump_snapshot_free(&coredump->snapshot);
+	kvfree(coredump->snapshot.read.buffer);
 
 	/* To prevent stale data on next snapshot, clear everything */
 	memset(&coredump->snapshot, 0, sizeof(coredump->snapshot));
@@ -260,4 +308,5 @@ int xe_devcoredump_init(struct xe_device *xe)
 {
 	return devm_add_action_or_reset(xe->drm.dev, xe_driver_devcoredump_fini, &xe->drm);
 }
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 923cdf72a816..440d05d77a5a 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -46,6 +46,14 @@ struct xe_devcoredump_snapshot {
 	struct xe_sched_job_snapshot *job;
 	/** @vm: Snapshot of VM state */
 	struct xe_vm_snapshot *vm;
+
+	/** @read: devcoredump in human readable format */
+	struct {
+		/** @read.size: size of devcoredump in human readable format */
+		ssize_t size;
+		/** @read.buffer: buffer of devcoredump in human readable format */
+		char *buffer;
+	} read;
 };
 
 /**
-- 
2.34.1

