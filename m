Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F153161ED93
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 09:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2774B10E27A;
	Mon,  7 Nov 2022 08:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4D710E265;
 Mon,  7 Nov 2022 08:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667811147; x=1699347147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aZMhw0olky91qBVpltsOTjmHT8LbBd+PQ6N1WzGsMOk=;
 b=Ng0f/pTFFRiEKECmoR8mWD1eWXNfSAgq0AATNHebk0F6CO1hHIl/q9gW
 3tw1F+pGQWyZ+Rb2w2SMh+hFMjlMOfxzkRY3mcsXFpL2TzgB1yslaW8Ua
 iZbo7Mci+L6d1/tVzY5Zb/RNVVGKCHXI0XYqytzOB1nv7riGY3siayyxR
 +lwGnjRbewoaAtjEz3ztyRTOZmdbUFmeDi+DID3liJdWYtaQpf8WpyqSQ
 37IVdWhApnyP9BQMmJQ5FT9sx7K9j/Cro1+Lc+mN/HQKgUOaCLWtPJZMN
 B7/LMBBf5WVKX7KuitJuVy2cuZ2gJbJ2cdgZwotV2/9HTMDOvRMisiN9d A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="312126177"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="312126177"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:52:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="880984647"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="880984647"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:52:26 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 13/20] drm/i915/vm_bind: Update
 i915_vma_verify_bind_complete()
Date: Mon,  7 Nov 2022 00:52:03 -0800
Message-Id: <20221107085210.17221-14-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
References: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
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
index eaa13e9ba966..aa4705246993 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -439,12 +439,25 @@ int i915_vma_sync(struct i915_vma *vma)
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
 
@@ -457,9 +470,6 @@ static int i915_vma_verify_bind_complete(struct i915_vma *vma)
 
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

