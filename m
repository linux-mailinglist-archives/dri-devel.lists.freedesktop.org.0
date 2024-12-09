Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 588759E9710
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 14:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC7310E75D;
	Mon,  9 Dec 2024 13:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d8cOHGXw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7624510E75A;
 Mon,  9 Dec 2024 13:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733751214; x=1765287214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yJZ3E1Weo84L0EbHQE2eIfQxqwcRP9nvS7/37YmRuCE=;
 b=d8cOHGXwO5V7X6YsWB4Sm9jgc/uPM/N9HnrLwQWP432q/XDmNfIvQeJw
 oAt/JY+nGck/QWWYBL9VoESWHf4ccn9yID8M7Nu4zMRRWiLICiX2T+q6R
 J5sVY4AOC9kHL2hI4aI09tXrj4+6Sk87v7d29MLGib9Nokph5JSRKyYHi
 iMcV/wdk+laOD2YBS2Op1H6SBUAXcYdtFCo5+tRUkO2CknafpTxBO5LIi
 JiE9qbpLlS1AhGmHRgU6f1rIJn7YCko0benU9cEhEmJnlhusVQUyDT10j
 oRGpPi3DyzB4nujfgqFAGRmJAA9U0W/XY2gkB8+tyzsxUNTNbOkVXcb+F g==;
X-CSE-ConnectionGUID: fgAWtvVcSIK31xMwvYupzQ==
X-CSE-MsgGUID: NY1qpZbfTC6sWecJnO8e8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34192122"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34192122"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:34 -0800
X-CSE-ConnectionGUID: HCvpsePTT8COXuEpn3WY9A==
X-CSE-MsgGUID: JlJIjrBVQ3K6/xcDy8GagA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99531349"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:33 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 18/26] drm/xe/eudebug: Implement vm_bind_op discovery
Date: Mon,  9 Dec 2024 15:33:09 +0200
Message-ID: <20241209133318.1806472-19-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
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

Follow the vm bind, vm_bind op sequence for
discovery process of a vm with the vmas it has.
Send events for ops and attach metadata if available.

v2: - Fix bad op ref seqno (Christoph)
    - with discovery semaphore, we dont need vm lock (Matthew)

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c | 45 +++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 2514b880d871..e17b8f98c7b6 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -3243,6 +3243,47 @@ void xe_eudebug_debug_metadata_destroy(struct xe_file *xef, struct xe_debug_meta
 	xe_eudebug_event_put(d, debug_metadata_destroy_event(d, xef, m));
 }
 
+static int vm_discover_binds(struct xe_eudebug *d, struct xe_vm *vm)
+{
+	struct drm_gpuva *va;
+	unsigned int num_ops = 0, send_ops = 0;
+	u64 ref_seqno = 0;
+	int err;
+
+	/*
+	 * Currently only vm_bind_ioctl inserts vma's
+	 * and with discovery lock, we have exclusivity.
+	 */
+	lockdep_assert_held_write(&d->xe->eudebug.discovery_lock);
+
+	drm_gpuvm_for_each_va(va, &vm->gpuvm)
+		num_ops++;
+
+	if (!num_ops)
+		return 0;
+
+	err = vm_bind_event(d, vm, num_ops, &ref_seqno);
+	if (err)
+		return err;
+
+	drm_gpuvm_for_each_va(va, &vm->gpuvm) {
+		struct xe_vma *vma = container_of(va, struct xe_vma, gpuva);
+
+		if (send_ops >= num_ops)
+			break;
+
+		err = vm_bind_op(d, vm, DRM_XE_EUDEBUG_EVENT_CREATE, ref_seqno,
+				 xe_vma_start(vma), xe_vma_size(vma),
+				 &vma->eudebug.metadata.list);
+		if (err)
+			return err;
+
+		send_ops++;
+	}
+
+	return num_ops == send_ops ? 0 : -EINVAL;
+}
+
 static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
 {
 	struct xe_debug_metadata *m;
@@ -3265,6 +3306,10 @@ static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
 		err = vm_create_event(d, xef, vm);
 		if (err)
 			break;
+
+		err = vm_discover_binds(d, vm);
+		if (err)
+			break;
 	}
 
 	xa_for_each(&xef->exec_queue.xa, i, q) {
-- 
2.43.0

