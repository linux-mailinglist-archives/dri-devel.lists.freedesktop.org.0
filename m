Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 725CA3AAC41
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 08:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00D26E87C;
	Thu, 17 Jun 2021 06:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E066E876;
 Thu, 17 Jun 2021 06:30:41 +0000 (UTC)
IronPort-SDR: UD2df5j7/6ql/V4NNceuR2C4QtlXVshBw5QGRKqN4PKSg8a3N+DrNEopgJBB02miMEgenzMoPT
 BdGrvGx5YMmA==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="203287824"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="203287824"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 23:30:41 -0700
IronPort-SDR: pguSsovYIyQZsWt1xrxO2KHNL5TySfUBKrtjgbi8s+NCNlc5Zt1f0pqGKNAHVf1JKc5+UTdHPW
 yw9KvOEImetQ==
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="554302686"
Received: from vanderss-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.193])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 23:30:39 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 05/12] drm/i915/gt: Add a routine to iterate over the
 pagetables of a GTT
Date: Thu, 17 Jun 2021 08:30:11 +0200
Message-Id: <20210617063018.92802-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617063018.92802-1-thomas.hellstrom@linux.intel.com>
References: <20210617063018.92802-1-thomas.hellstrom@linux.intel.com>
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
Cc: matthew.auld@intel.com, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

In the next patch, we will want to look at the dma addresses of
individual page tables, so add a routine to iterate over them.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 49 ++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gtt.h  |  7 ++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index 1b676d7700bf..3d02c726c746 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -361,6 +361,54 @@ static void gen8_ppgtt_alloc(struct i915_address_space *vm,
 			   &start, start + length, vm->top);
 }
 
+static void __gen8_ppgtt_foreach(struct i915_address_space *vm,
+				 struct i915_page_directory *pd,
+				 u64 *start, u64 end, int lvl,
+				 void (*fn)(struct i915_address_space *vm,
+					    struct i915_page_table *pt,
+					    void *data),
+				 void *data)
+{
+	unsigned int idx, len;
+
+	len = gen8_pd_range(*start, end, lvl--, &idx);
+
+	spin_lock(&pd->lock);
+	do {
+		struct i915_page_table *pt = pd->entry[idx];
+
+		atomic_inc(&pt->used);
+		spin_unlock(&pd->lock);
+
+		if (lvl) {
+			__gen8_ppgtt_foreach(vm, as_pd(pt), start, end, lvl,
+					     fn, data);
+		} else {
+			fn(vm, pt, data);
+			*start += gen8_pt_count(*start, end);
+		}
+
+		spin_lock(&pd->lock);
+		atomic_dec(&pt->used);
+	} while (idx++, --len);
+	spin_unlock(&pd->lock);
+}
+
+static void gen8_ppgtt_foreach(struct i915_address_space *vm,
+			       u64 start, u64 length,
+			       void (*fn)(struct i915_address_space *vm,
+					  struct i915_page_table *pt,
+					  void *data),
+			       void *data)
+{
+	start >>= GEN8_PTE_SHIFT;
+	length >>= GEN8_PTE_SHIFT;
+
+	__gen8_ppgtt_foreach(vm, i915_vm_to_ppgtt(vm)->pd,
+			     &start, start + length, vm->top,
+			     fn, data);
+}
+
 static __always_inline u64
 gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
 		      struct i915_page_directory *pdp,
@@ -755,6 +803,7 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt)
 	ppgtt->vm.insert_page = gen8_ppgtt_insert_entry;
 	ppgtt->vm.allocate_va_range = gen8_ppgtt_alloc;
 	ppgtt->vm.clear_range = gen8_ppgtt_clear;
+	ppgtt->vm.foreach = gen8_ppgtt_foreach;
 
 	ppgtt->vm.pte_encode = gen8_pte_encode;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index edea95b97c36..9bd89f2a01ff 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -296,6 +296,13 @@ struct i915_address_space {
 			       u32 flags);
 	void (*cleanup)(struct i915_address_space *vm);
 
+	void (*foreach)(struct i915_address_space *vm,
+			u64 start, u64 length,
+			void (*fn)(struct i915_address_space *vm,
+				   struct i915_page_table *pt,
+				   void *data),
+			void *data);
+
 	struct i915_vma_ops vma_ops;
 
 	I915_SELFTEST_DECLARE(struct fault_attr fault_attr);
-- 
2.31.1

