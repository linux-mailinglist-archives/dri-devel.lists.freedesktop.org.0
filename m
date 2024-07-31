Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7B8943803
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 23:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F4810E6D3;
	Wed, 31 Jul 2024 21:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5KjyDuz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6A010E6D1;
 Wed, 31 Jul 2024 21:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722461500; x=1753997500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N9+XfoSWNqokS/xvMQE3ZOTLhTqBOlxZmUfNyJorS1s=;
 b=Z5KjyDuzEIWW5af0XX9ceIgKWCgw2k09AJkPsLwnk8OdHfRT6Bx53bQ+
 8g6gg06vJ8PhHnYbW+sXoInLZyK4y1Ql8z3Pl9T7abD0YS21giXl9p1Lv
 q0cdRd0ZLTmw6u+1TCefZMqumd7Z52qJuVdlZCf9Y7Psg7YFW03/xZDU6
 QN/BAToJUwyXsFmCNE4kIV7Hcxh+Rpfvrc9NDoGdz05sj0FnnKG/tSqyp
 H/RcsOsHNr9iNaFT4sgIZJtwUvO8ADYQMBeh8CdBhyLvb3qS1siLNoQ2P
 9hbkM/e6HFIH2SnKkaJRmN6i2ol6ub7uqkO8iTKWte4PjiTrByoe+o9me g==;
X-CSE-ConnectionGUID: v/PluKISQ+6wtjIf/DVk8w==
X-CSE-MsgGUID: IvyGP5jXS827naCs4jrCng==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="24234739"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="24234739"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 14:31:39 -0700
X-CSE-ConnectionGUID: TDNsbXVjTtuGNsJkH1e03A==
X-CSE-MsgGUID: XCEzY0knQPmJWb20vmtIzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="58938900"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 14:31:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH v4 1/3] drm/xe: Take ref to VM in delayed snapshot
Date: Wed, 31 Jul 2024 14:32:19 -0700
Message-Id: <20240731213221.2523989-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240731213221.2523989-1-matthew.brost@intel.com>
References: <20240731213221.2523989-1-matthew.brost@intel.com>
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

Kernel BO's don't take a ref to the VM, we need to the VM for the
delayed snapshot, so take a ref to the VM in delayed snapshot.

v2:
 - Check for lrc_bo before taking a VM ref (CI)
 - Check lrc_bo->vm before taking / dropping a VM ref (CI)
 - Drop VM in xe_lrc_snapshot_free

47058633d9c5 ("drm/xe: Move lrc snapshot capturing to xe_lrc.c")
Cc: Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 94ff62e1d95e..58121821f081 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1634,6 +1634,9 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	if (!snapshot)
 		return NULL;
 
+	if (lrc->bo && lrc->bo->vm)
+		xe_vm_get(lrc->bo->vm);
+
 	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
 	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
 	snapshot->head = xe_lrc_ring_head(lrc);
@@ -1653,12 +1656,14 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
 {
 	struct xe_bo *bo;
+	struct xe_vm *vm;
 	struct iosys_map src;
 
 	if (!snapshot)
 		return;
 
 	bo = snapshot->lrc_bo;
+	vm = bo->vm;
 	snapshot->lrc_bo = NULL;
 
 	snapshot->lrc_snapshot = kvmalloc(snapshot->lrc_size, GFP_KERNEL);
@@ -1678,6 +1683,8 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
 	xe_bo_unlock(bo);
 put_bo:
 	xe_bo_put(bo);
+	if (vm)
+		xe_vm_put(vm);
 }
 
 void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p)
@@ -1727,8 +1734,14 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
 		return;
 
 	kvfree(snapshot->lrc_snapshot);
-	if (snapshot->lrc_bo)
+	if (snapshot->lrc_bo) {
+		struct xe_vm *vm;
+
+		vm = snapshot->lrc_bo->vm;
 		xe_bo_put(snapshot->lrc_bo);
+		if (vm)
+			xe_vm_put(vm);
+	}
 	kfree(snapshot);
 }
 
-- 
2.34.1

