Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E68A7AE59
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 22:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A159E10EAAC;
	Thu,  3 Apr 2025 20:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVFsXA8A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479FB10EA67;
 Thu,  3 Apr 2025 20:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743711955; x=1775247955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SM6O94T2S2/JMsSpPkBI+I4r36nS5mHnQ1CrvfsNmrc=;
 b=AVFsXA8ApPFPP6jSM/ZWCP9dN+lnkuB2evm776S7Sbeo9EtihhHaZkdM
 OpYbgZN6+BW23+bxhVl0JRBY8XTDX5/PQBtz1inzpEsHxjg4XHvMjj8uj
 K258AvZJpaR6fAgnMuSNKx94ZBv4x4EvwvVYDtsT/fYU//8WcL4xtt2l9
 +OPfsE7T71yQrIW9eL3fAjAEK/xgy4MtCLYMzc+DdDrwGwjaXIA940sjW
 6X4gLkxW+g9MLG8S+tFQDdXAdGXVMCTEgvy1xqEcC5JpUEWUWwDQiHXRR
 vxp/E11Zl81nzqgkf30C5/DI6JV/b0ahwKzE6kYSjRsPSxsBL34zIKT+6 w==;
X-CSE-ConnectionGUID: 7Y9di446RMyP/75BLDd+8w==
X-CSE-MsgGUID: X0hI+GO1TlK+YHu9LXC2hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55337815"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="55337815"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 13:25:54 -0700
X-CSE-ConnectionGUID: WyrS/dpdRv6EXgwnpLzV+A==
X-CSE-MsgGUID: q1YCPdgjRGqKrZUjhZmPpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="127972859"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 13:25:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/xe: Add devcoredump chunking
Date: Thu,  3 Apr 2025 13:27:02 -0700
Message-Id: <20250403202705.18488-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403202705.18488-1-matthew.brost@intel.com>
References: <20250403202705.18488-1-matthew.brost@intel.com>
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

Chunk devcoredump into 1.5G pieces to avoid hitting the kvmalloc limit
of 2G. Simple algorithm reads 1.5G at time in xe_devcoredump_read
callback as needed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 59 ++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 +
 drivers/gpu/drm/xe/xe_guc_hwconfig.c      |  2 +-
 3 files changed, 50 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 81b9d9bb3f57..a9e618abf8ac 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -80,7 +80,8 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
 	return &q->gt->uc.guc;
 }
 
-static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
+static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
+				     ssize_t start,
 				     struct xe_devcoredump *coredump)
 {
 	struct xe_device *xe;
@@ -94,7 +95,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 	ss = &coredump->snapshot;
 
 	iter.data = buffer;
-	iter.start = 0;
+	iter.start = start;
 	iter.remain = count;
 
 	p = drm_coredump_printer(&iter);
@@ -168,6 +169,8 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 	ss->vm = NULL;
 }
 
+#define XE_DEVCOREDUMP_CHUNK_MAX	(SZ_512M + SZ_1G)
+
 static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 				   size_t count, void *data, size_t datalen)
 {
@@ -183,6 +186,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	/* Ensure delayed work is captured before continuing */
 	flush_work(&ss->work);
 
+	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
+		xe_pm_runtime_get(gt_to_xe(ss->gt));
+
 	mutex_lock(&coredump->lock);
 
 	if (!ss->read.buffer) {
@@ -195,12 +201,26 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 		return 0;
 	}
 
+	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
+	    offset < ss->read.chunk_position) {
+		ss->read.chunk_position =
+			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
+
+		__xe_devcoredump_read(ss->read.buffer,
+				      XE_DEVCOREDUMP_CHUNK_MAX,
+				      ss->read.chunk_position, coredump);
+	}
+
 	byte_copied = count < ss->read.size - offset ? count :
 		ss->read.size - offset;
-	memcpy(buffer, ss->read.buffer + offset, byte_copied);
+	memcpy(buffer, ss->read.buffer +
+	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
 
 	mutex_unlock(&coredump->lock);
 
+	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
+		xe_pm_runtime_put(gt_to_xe(ss->gt));
+
 	return byte_copied;
 }
 
@@ -254,17 +274,32 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
 	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
 
-	xe_pm_runtime_put(xe);
+	ss->read.chunk_position = 0;
 
 	/* Calculate devcoredump size */
-	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
-
-	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
-	if (!ss->read.buffer)
-		return;
+	ss->read.size = __xe_devcoredump_read(NULL, LONG_MAX, 0, coredump);
+
+	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX) {
+		ss->read.buffer = kvmalloc(XE_DEVCOREDUMP_CHUNK_MAX,
+					   GFP_USER);
+		if (!ss->read.buffer)
+			goto put_pm;
+
+		__xe_devcoredump_read(ss->read.buffer,
+				      XE_DEVCOREDUMP_CHUNK_MAX,
+				      0, coredump);
+	} else {
+		ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
+		if (!ss->read.buffer)
+			goto put_pm;
+
+		__xe_devcoredump_read(ss->read.buffer, ss->read.size, 0,
+				      coredump);
+		xe_devcoredump_snapshot_free(ss);
+	}
 
-	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
-	xe_devcoredump_snapshot_free(ss);
+put_pm:
+	xe_pm_runtime_put(xe);
 }
 
 static void devcoredump_snapshot(struct xe_devcoredump *coredump,
@@ -425,7 +460,7 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
 	if (offset & 3)
 		drm_printf(p, "Offset not word aligned: %zu", offset);
 
-	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
+	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_ATOMIC);
 	if (!line_buff) {
 		drm_printf(p, "Failed to allocate line buffer\n");
 		return;
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 1a1d16a96b2d..a174385a6d83 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -66,6 +66,8 @@ struct xe_devcoredump_snapshot {
 	struct {
 		/** @read.size: size of devcoredump in human readable format */
 		ssize_t size;
+		/** @read.chunk_position: position of devcoredump chunk */
+		ssize_t chunk_position;
 		/** @read.buffer: buffer of devcoredump in human readable format */
 		char *buffer;
 	} read;
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index af2c817d552c..21403a250834 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -175,7 +175,7 @@ int xe_guc_hwconfig_lookup_u32(struct xe_guc *guc, u32 attribute, u32 *val)
 	if (num_dw == 0)
 		return -EINVAL;
 
-	hwconfig = kzalloc(size, GFP_KERNEL);
+	hwconfig = kzalloc(size, GFP_ATOMIC);
 	if (!hwconfig)
 		return -ENOMEM;
 
-- 
2.34.1

