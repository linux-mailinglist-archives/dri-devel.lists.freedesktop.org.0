Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8776E9309
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 13:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5730E10E1AA;
	Thu, 20 Apr 2023 11:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1952D10E1AA;
 Thu, 20 Apr 2023 11:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681990755; x=1713526755;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tqRoX9o4b6H3/kK4B5dZb0cFMVg1oOS/aTx6ssms0GE=;
 b=fNS4rG9mQcEhsnw5Skr7tTXbZJRpzJTnx5KJXBYHFgy+fM870HWwh3dj
 0TrCwVAYjOLvy47lta0EmB+t3d1DYqqiepstk63dywPYOCUgZ4DYwVFfv
 JBxp7iFe0GfzSsmv0DQQLzqy7yReb2gQ7aV28jZrgFFXmbJf4GbAKDn4i
 W3Qq3KgSon1LS+SglXGXnMXctI7ADdYs/lXwngLzMEcHmj6U9hcrkz9z9
 BfNKnqUsVOoO8cN4wEsiNxtX91JWi6DDatdXKUi/U/SYNdpzHOfV7wKEo
 a5mDAre/8Qw6HyXcS9uPqj7XWRwlVZFoWe8jx3qHxhdrDNYCvbrey6IVz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="344461474"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="344461474"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 04:39:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="866223660"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="866223660"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 04:39:11 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/mtl: workaround coherency issue for Media
Date: Thu, 20 Apr 2023 13:38:59 +0200
Message-Id: <20230420113859.30965-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Fei Yang <fei.yang@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>
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
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_pages.c |  5 ++++-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 13 +++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c    |  7 +++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  6 ++++++
 4 files changed, 30 insertions(+), 1 deletion(-)

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
index e89f16ecf1ae..c9f20385f6a0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -744,6 +744,13 @@ struct i915_vma *intel_guc_allocate_vma(struct intel_guc *guc, u32 size)
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
index 1803a633ed64..99a0a89091e7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
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
2.39.0

