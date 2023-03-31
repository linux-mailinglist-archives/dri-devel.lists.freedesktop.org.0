Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C86D76D1420
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 02:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC8310F0CD;
	Fri, 31 Mar 2023 00:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3538F10F0BE;
 Fri, 31 Mar 2023 00:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680222882; x=1711758882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OQPdZJ6uq86fDdelr+3CJppVufDNxUytLNp6b889BE4=;
 b=iIHTd21pFcgArpt2bMwCQ1uNweLDn+f7SW00cU0s9++lfYT/aNj7toPC
 5Y190XSw7QyQXDNyQ72Q9T7oPV1QayzoeoHSUngWYYt6XBZn3uVoks55Y
 ObqOa/vZon1UbKgT/a1uBgzKz+5gV9QESiUt4/KKPuRipaS9FpZZPM4ry
 pVSmJeTP5EZAB7Xl/GLTCUKcrRiN+m2dJJyGK1P7pTp4kWfVrApnHleG3
 VWnnZLgrNayKSRwOKMdCOCloQ+YN/gOBKQziJJrws5x38HeX+i0OrkjW+
 +2tZaNE0SIYJFifc3HMUqcscatE2ERh+0356s61aRLY+mpTpctOe5/z7Q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="329844458"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="329844458"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 17:34:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="715220766"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="715220766"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 17:34:40 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/mtl: workaround coherency issue for Media
Date: Thu, 30 Mar 2023 17:36:10 -0700
Message-Id: <20230331003611.107011-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230331003611.107011-1-fei.yang@intel.com>
References: <20230331003611.107011-1-fei.yang@intel.com>
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
Cc: Fei Yang <fei.yang@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

This patch implements Wa_22016122933.

In MTL, memory writes initiated by Media tile update the whole
cache line even for partial writes. This creates a coherency
problem for cacheable memory if both CPU and GPU are writing data
to different locations within a single cache line. CTB communication
is impacted by this issue because the head and tail pointers are
adjacent words within a cache line (see struct guc_ct_buffer_desc),
where one is written by GuC and the other by the host.
This patch circumvents the issue by making CPU/GPU shared memory
uncacheable (WC on CPU side, and PAT index 2 for GPU). Also for
CTB which is being updated by both CPU and GuC, mfence instruction
is added to make sure the CPU writes are visible to GPU right away
(flush the write combining buffer).

While fixing the CTB issue, we noticed some random GSC firmware
loading failure because the share buffers are cacheable (WB) on CPU
side but uncached on GPU side. To fix these issues we need to map
such shared buffers as WC on CPU side. Since such allocations are
not all done through GuC allocator, to avoid too many code changes,
the i915_coherent_map_type() is now hard coded to return WC for MTL.

BSpec: 45101

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_pages.c |  5 ++++-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 13 +++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c    |  7 +++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 18 ++++++++++++------
 4 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index ecd86130b74f..89fc8ea6bcfc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -469,7 +469,10 @@ enum i915_map_type i915_coherent_map_type(struct drm_i915_private *i915,
 					  struct drm_i915_gem_object *obj,
 					  bool always_coherent)
 {
-	if (i915_gem_object_is_lmem(obj))
+	/*
+	 * Wa_22016122933: always return I915_MAP_WC for MTL
+	 */
+	if (i915_gem_object_is_lmem(obj) || IS_METEORLAKE(i915))
 		return I915_MAP_WC;
 	if (HAS_LLC(i915) || always_coherent)
 		return I915_MAP_WB;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
index 1d9fdfb11268..236673c02f9a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
@@ -110,6 +110,13 @@ static int gsc_fw_load_prepare(struct intel_gsc_uc *gsc)
 	if (obj->base.size < gsc->fw.size)
 		return -ENOSPC;
 
+	/*
+	 * Wa_22016122933: For MTL the shared memory needs to be mapped
+	 * as WC on CPU side and UC (PAT index 2) on GPU side
+	 */
+	if (IS_METEORLAKE(i915))
+		i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
+
 	dst = i915_gem_object_pin_map_unlocked(obj,
 					       i915_coherent_map_type(i915, obj, true));
 	if (IS_ERR(dst))
@@ -125,6 +132,12 @@ static int gsc_fw_load_prepare(struct intel_gsc_uc *gsc)
 	memset(dst, 0, obj->base.size);
 	memcpy(dst, src, gsc->fw.size);
 
+	/*
+	 * Wa_22016122933: Making sure the data in dst is
+	 * visible to GSC right away
+	 */
+	intel_guc_write_barrier(&gt->uc.guc);
+
 	i915_gem_object_unpin_map(gsc->fw.obj);
 	i915_gem_object_unpin_map(obj);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index d76508fa3af7..f9bddaa876d9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -743,6 +743,13 @@ struct i915_vma *intel_guc_allocate_vma(struct intel_guc *guc, u32 size)
 	if (IS_ERR(obj))
 		return ERR_CAST(obj);
 
+	/*
+	 * Wa_22016122933: For MTL the shared memory needs to be mapped
+	 * as WC on CPU side and UC (PAT index 2) on GPU side
+	 */
+	if (IS_METEORLAKE(gt->i915))
+		i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
+
 	vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
 	if (IS_ERR(vma))
 		goto err;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 1803a633ed64..98e682b7df07 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -415,12 +415,6 @@ static int ct_write(struct intel_guc_ct *ct,
 	}
 	GEM_BUG_ON(tail > size);
 
-	/*
-	 * make sure H2G buffer update and LRC tail update (if this triggering a
-	 * submission) are visible before updating the descriptor tail
-	 */
-	intel_guc_write_barrier(ct_to_guc(ct));
-
 	/* update local copies */
 	ctb->tail = tail;
 	GEM_BUG_ON(atomic_read(&ctb->space) < len + GUC_CTB_HDR_LEN);
@@ -429,6 +423,12 @@ static int ct_write(struct intel_guc_ct *ct,
 	/* now update descriptor */
 	WRITE_ONCE(desc->tail, tail);
 
+	/*
+	 * make sure H2G buffer update and LRC tail update (if this triggering a
+	 * submission) are visible before updating the descriptor tail
+	 */
+	intel_guc_write_barrier(ct_to_guc(ct));
+
 	return 0;
 
 corrupted:
@@ -902,6 +902,12 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	/* now update descriptor */
 	WRITE_ONCE(desc->head, head);
 
+	/*
+	 * Wa_22016122933: Making sure the head update is
+	 * visible to GuC right away
+	 */
+	intel_guc_write_barrier(ct_to_guc(ct));
+
 	return available - len;
 
 corrupted:
-- 
2.25.1

