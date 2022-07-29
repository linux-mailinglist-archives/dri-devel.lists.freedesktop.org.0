Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18484584C56
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 09:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C531E10E7EA;
	Fri, 29 Jul 2022 07:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1A210E100;
 Fri, 29 Jul 2022 07:04:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D0757B826E6;
 Fri, 29 Jul 2022 07:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A132C433B5;
 Fri, 29 Jul 2022 07:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659078239;
 bh=2pBgez34jdxSq2XeGH8AFY1z97ZArOQJw9kuBPer8g8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qL9ZvuzdzoFSyPKBkfMxxITJ1fiVmiBoVdwUJU/9ZH1OijAVuluh6OMlVqJvZRIZk
 fDmBx0nBO1BzLQdzFk2xG2Q15rXLsHsafrxLWUshfDK7UHnOJQkyp/abKVFXttPuW6
 XgY2pDU5+desMxhtOIMzG9dcs7NZ8uLI1NsxwSADZEC8+sMA3tFJC0zGRK/wLO1cc6
 d5udp+mAY+bNf7Up4reFe6zpCBurO5ibi/2i6ghxxewOmqF6gZRUGBRge2a9wcDMbH
 Yiu9peycpeYmcS6hkh9N5dNO18zdLcJ7nBbYOa107ACD8K9RX+Fus0surt+4c+ShLf
 thoMgVLtW+KyA==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oHK2P-005nBw-3O;
 Fri, 29 Jul 2022 09:03:57 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 2/2] drm/i915/gt: document TLB cache invalidation functions
Date: Fri, 29 Jul 2022 09:03:55 +0200
Message-Id: <ebb5f34f223626038f241fdf00a0dcfd33a19606.1659077372.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1659077372.git.mchehab@kernel.org>
References: <cover.1659077372.git.mchehab@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Chris Wilson <chris.p.wilson@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a description for the TLB cache invalidation algorithm and for
the related kAPI functions.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 0/2] at: https://lore.kernel.org/all/cover.1659077372.git.mchehab@kernel.org/

 Documentation/gpu/i915.rst          |   7 ++
 drivers/gpu/drm/i915/gt/intel_tlb.c |  25 +++++++
 drivers/gpu/drm/i915/gt/intel_tlb.h | 101 ++++++++++++++++++++++++++++
 3 files changed, 133 insertions(+)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 4e59db1cfb00..46911fdd79e8 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -58,6 +58,13 @@ Intel GVT-g Host Support(vGPU device model)
 .. kernel-doc:: drivers/gpu/drm/i915/intel_gvt.c
    :internal:
 
+TLB cache invalidation
+----------------------
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_tlb.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_tlb.c
+
 Workarounds
 -----------
 
diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.c b/drivers/gpu/drm/i915/gt/intel_tlb.c
index af8cae979489..4873b7ecc015 100644
--- a/drivers/gpu/drm/i915/gt/intel_tlb.c
+++ b/drivers/gpu/drm/i915/gt/intel_tlb.c
@@ -145,6 +145,18 @@ static void mmio_invalidate_full(struct intel_gt *gt)
 	intel_uncore_forcewake_put_delayed(uncore, FORCEWAKE_ALL);
 }
 
+/**
+ * intel_gt_invalidate_tlb_full - do full TLB cache invalidation
+ * @gt: GT structure
+ * @seqno: sequence number
+ *
+ * Do a full TLB cache invalidation if the @seqno is bigger than the last
+ * full TLB cache invalidation.
+ *
+ * Note:
+ * The TLB cache invalidation logic depends on GEN-specific registers.
+ * It currently supports MMIO-based TLB flush for GEN8 to GEN12.
+ */
 void intel_gt_invalidate_tlb_full(struct intel_gt *gt, u32 seqno)
 {
 	intel_wakeref_t wakeref;
@@ -171,12 +183,25 @@ void intel_gt_invalidate_tlb_full(struct intel_gt *gt, u32 seqno)
 	}
 }
 
+/**
+ * intel_gt_init_tlb - initialize TLB-specific vars
+ * @gt: GT structure
+ *
+ * TLB cache invalidation logic internally uses some resources that require
+ * initialization. Should be called before doing any TLB cache invalidation.
+ */
 void intel_gt_init_tlb(struct intel_gt *gt)
 {
 	mutex_init(&gt->tlb.invalidate_lock);
 	seqcount_mutex_init(&gt->tlb.seqno, &gt->tlb.invalidate_lock);
 }
 
+/**
+ * intel_gt_fini_tlb - initialize TLB-specific vars
+ * @gt: GT structure
+ *
+ * Frees any resources needed by TLB cache invalidation logic.
+ */
 void intel_gt_fini_tlb(struct intel_gt *gt)
 {
 	mutex_destroy(&gt->tlb.invalidate_lock);
diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.h b/drivers/gpu/drm/i915/gt/intel_tlb.h
index 46ce25bf5afe..dca70c33bd61 100644
--- a/drivers/gpu/drm/i915/gt/intel_tlb.h
+++ b/drivers/gpu/drm/i915/gt/intel_tlb.h
@@ -11,16 +11,117 @@
 
 #include "intel_gt_types.h"
 
+/**
+ * DOC: TLB cache invalidation logic
+ *
+ * The way the current algorithm works is that a struct drm_i915_gem_object can
+ * be created on any order. At unbind/evict time, the object is warranted that
+ * it won't be used anymore. So, a sequence number provided by
+ * intel_gt_next_invalidate_tlb_full() is stored on it. This can happen either
+ * at __vma_put_pages() - for VMA sync unbind, or at ppgtt_unbind_vma() - for
+ * VMA async VMA bind.
+ *
+ * At __i915_gem_object_unset_pages(), intel_gt_invalidate_tlb_full() is called,
+ * where it checks if the sequence number of the object was already invalidated
+ * or not. If not, it flushes the TLB and increments the sequence number::
+ *
+ *   void intel_gt_invalidate_tlb_full(struct intel_gt *gt, u32 seqno)
+ *   {
+ *   ...
+ * 	with_intel_gt_pm_if_awake(gt, wakeref) {
+ * 		mutex_lock(&gt->tlb.invalidate_lock);
+ * 		if (tlb_seqno_passed(gt, seqno))
+ * 				goto unlock;
+ *
+ * 		// Some code to do TLB invalidation
+ *   ...
+ *
+ * 		write_seqcount_invalidate(&gt->tlb.seqno); // increment seqno
+ * 		mutex_lock(&gt->tlb.invalidate_lock);
+ *      }
+ *
+ * So, let's say the current seqno is 2 and 3 new objects were created,
+ * on this order::
+ *
+ * 	obj1
+ * 	obj2
+ * 	obj3
+ *
+ * They can be unbind/evict on a different order. At unbind/evict time,
+ * the mm.tlb will be stamped with the sequence number, using the number
+ * from the last TLB flush, plus 1.
+ *
+ * Different threads may be used on unbind/evict and/or unset pages.
+ * As the logic at void intel_gt_invalidate_tlb_full() is protected by a mutex,
+ * for simplicity, let's consider just two threads:
+ *
+ * +-------------------+-------------------------+---------------------------------+
+ * | sequence number   | Thread 0                | Thread 1                        +
+ * +===================+=========================+=================================+
+ * | seqno=2           |                         |                                 |
+ * |                   +-------------------------+---------------------------------+
+ * |                   | unbind/evict obj3.      |                                 |
+ * |                   |                         |                                 |
+ * |                   | obj3.mm.tlb = seqno | 1 |                                 |
+ * |                   | // obj3.mm.tlb = 3      |                                 |
+ * |                   +-------------------------+---------------------------------+
+ * |                   | unbind/evict obj1.      |                                 |
+ * |                   |                         |                                 |
+ * |                   | obj1.mm.tlb = seqno | 1 |                                 |
+ * |                   | // obj1.mm.tlb = 3      |                                 |
+ * |                   +-------------------------+---------------------------------+
+ * |                   |                         | __i915_gem_object_unset_pages() |
+ * |                   |                         | called for obj3 => TLB flush    |
+ * |                   |                         | invalidating both obj1 and obj2.|
+ * |                   |                         |                                 |
+ * |                   |                         | seqno += 2                      |
+ * +-------------------+-------------------------+---------------------------------+
+ * | seqno=4           |                         |                                 |
+ * |                   +-------------------------+---------------------------------+
+ * |                   | unbind/evict obj2.      |                                 |
+ * |                   |                         |                                 |
+ * |                   | obj2.mm.tlb = seqno | 1 |                                 |
+ * |                   | // obj2.mm.tlb = 5      |                                 |
+ * |                   +-------------------------+---------------------------------+
+ * |                   |                         | __i915_gem_object_unset_pages() |
+ * |                   |                         | called for obj1, don't flush    |
+ * |                   |                         | as past flush invalidated obj1. |
+ * |                   +-------------------------+---------------------------------+
+ * |                   |                         | __i915_gem_object_unset_pages() |
+ * |                   |                         | called for obj2 => TLB flush.   |
+ * |                   |                         | invalidating obj2.              |
+ * |                   |                         |                                 |
+ * |                   |                         | seqno += 2                      |
+ * +-------------------+-------------------------+---------------------------------+
+ * | seqno=6           |                         |                                 |
+ * +-------------------+-------------------------+---------------------------------+
+ */
+
 void intel_gt_invalidate_tlb_full(struct intel_gt *gt, u32 seqno);
 
 void intel_gt_init_tlb(struct intel_gt *gt);
 void intel_gt_fini_tlb(struct intel_gt *gt);
 
+/**
+ * intel_gt_tlb_seqno - Returns the current TLB invlidation sequence number
+ *
+ * @gt: GT structure
+ *
+ * There's no need to lock while calling it, as seqprop_sequence is thread-safe
+ */
 static inline u32 intel_gt_tlb_seqno(const struct intel_gt *gt)
 {
 	return seqprop_sequence(&gt->tlb.seqno);
 }
 
+/**
+ * intel_gt_next_invalidate_tlb_full - Returns the next TLB full invalidation
+ *	sequence number
+ *
+ * @gt: GT structure
+ *
+ * There's no need to lock while calling it, as seqprop_sequence is thread-safe
+ */
 static inline u32 intel_gt_next_invalidate_tlb_full(const struct intel_gt *gt)
 {
 	return intel_gt_tlb_seqno(gt) | 1;
-- 
2.36.1

