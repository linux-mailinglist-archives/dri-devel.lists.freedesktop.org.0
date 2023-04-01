Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A32C56D2EA5
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 08:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBFE10F3AA;
	Sat,  1 Apr 2023 06:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FEAF10E130;
 Sat,  1 Apr 2023 06:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680331022; x=1711867022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OQPdZJ6uq86fDdelr+3CJppVufDNxUytLNp6b889BE4=;
 b=ejpkk6D1WZR7tX3o4quhEVGRETdXEzjWnVNCspx5dNoP1nnmaJF3Jagc
 0ijF8GzpMzSV8LVTn0yVFc6P07VpoTByVwY65VLHmsxYPmr+rVwcFL6W2
 tUdUopprsmkNgfXZqUxiDDbl/AGjRN4NlBRD/QJeUCBwJiS1EwA2Ruspd
 Czb9ir84qapM+0AB2VFSV5n+UPzPCCMOcWJ4xoCGq5CaIoLf99+WpHD++
 eV3r0PK9zV9+AzJw+W17suUIN1T47UG2U5H0WJxfDkOZL39YuthwO9rYW
 BFot/3tCaOXdT9GRM027CvQfobUrk90vDQTiGfBmtqctWmCyLjcLMIpl2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="340349507"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="340349507"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 23:37:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="635539624"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="635539624"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 23:37:00 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/7] drm/i915/mtl: workaround coherency issue for Media
Date: Fri, 31 Mar 2023 23:38:25 -0700
Message-Id: <20230401063830.438127-3-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230401063830.438127-1-fei.yang@intel.com>
References: <20230401063830.438127-1-fei.yang@intel.com>
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

