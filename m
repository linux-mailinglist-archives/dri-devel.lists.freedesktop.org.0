Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F93D626E52
	for <lists+dri-devel@lfdr.de>; Sun, 13 Nov 2022 08:59:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D9110E21C;
	Sun, 13 Nov 2022 07:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F83310E1EF;
 Sun, 13 Nov 2022 07:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668326264; x=1699862264;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=51Yd5hVBRiTQIw8OOQbFcJaWBK76hjm9BSYZEvl2/hw=;
 b=DwH8xmkXCkexly+zrpt/9yakyvwvhIl8w/Dl+sWveqYJuLx3kJx6SKJi
 yBo62tXN+4kgw9qoPL460h0Rp2p7FGyPrY43/voTpPsFrGvlGUy1qsMtG
 v6cMJIDkWMV49zldsd7cP0kSS4/s8/Q5iaspZcl4ejB5TKj4qlP7nxkci
 GSeVoTCMmBmYy+oysrEESHaTRA3fki3xb3rxK3nQsFef6uNkafAk195mF
 luc0oRLnqFHGYp5fwgoP32/t+Lx/9zKnjFP89q48EHjaq5pdUQYC9tr31
 S6zKU1yS6oau3S1a3XlENAvnvHf2pv9zOrrFE+6YFY9Sm2yJOeDax1q6+ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10529"; a="312936340"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="312936340"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2022 23:57:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10529"; a="669235727"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="669235727"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2022 23:57:43 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 13/20] drm/i915/vm_bind: Update
 i915_vma_verify_bind_complete()
Date: Sat, 12 Nov 2022 23:57:25 -0800
Message-Id: <20221113075732.32100-14-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221113075732.32100-1-niranjana.vishwanathapura@intel.com>
References: <20221113075732.32100-1-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ensure i915_vma_verify_bind_complete() handles case where bind
is not initiated. Also make it non static, add documentation
and move it out of CONFIG_DRM_I915_DEBUG_GEM.

v2: Fix fence leak

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 22 ++++++++++++++++------
 drivers/gpu/drm/i915/i915_vma.h |  1 +
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 6d929791d33d..2ab50d29c9f1 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -441,12 +441,25 @@ int i915_vma_sync(struct i915_vma *vma)
 	return i915_vm_sync(vma->vm);
 }
 
-#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
-static int i915_vma_verify_bind_complete(struct i915_vma *vma)
+/**
+ * i915_vma_verify_bind_complete() - Check for the bind completion of the vma
+ * @vma: vma to check for bind completion
+ *
+ * As the fence reference is obtained under RCU, no locking is required by
+ * the caller.
+ *
+ * Returns: 0 if the vma bind is completed. Error code otherwise.
+ */
+int i915_vma_verify_bind_complete(struct i915_vma *vma)
 {
-	struct dma_fence *fence = i915_active_fence_get(&vma->active.excl);
+	struct dma_fence *fence;
 	int err;
 
+	/* Ensure vma bind is initiated */
+	if (!i915_vma_is_bound(vma, I915_VMA_BIND_MASK))
+		return -EINVAL;
+
+	fence = i915_active_fence_get(&vma->active.excl);
 	if (!fence)
 		return 0;
 
@@ -459,9 +472,6 @@ static int i915_vma_verify_bind_complete(struct i915_vma *vma)
 
 	return err;
 }
-#else
-#define i915_vma_verify_bind_complete(_vma) 0
-#endif
 
 I915_SELFTEST_EXPORT void
 i915_vma_resource_init_from_vma(struct i915_vma_resource *vma_res,
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 1cadbf8fdedf..04770f8ba815 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -440,6 +440,7 @@ void i915_vma_make_purgeable(struct i915_vma *vma);
 
 int i915_vma_wait_for_bind(struct i915_vma *vma);
 int i915_vma_sync(struct i915_vma *vma);
+int i915_vma_verify_bind_complete(struct i915_vma *vma);
 
 /**
  * i915_vma_get_current_resource - Get the current resource of the vma
-- 
2.21.0.rc0.32.g243a4c7e27

