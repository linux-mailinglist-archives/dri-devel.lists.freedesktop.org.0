Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3B55F98D9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 09:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB38D10E6DB;
	Mon, 10 Oct 2022 06:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84F510E666;
 Mon, 10 Oct 2022 06:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665385137; x=1696921137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r2yvZ31+3cwoJBiegjnEFAjvg1JXIo1CwiiKC5kUB3A=;
 b=N2D94sQt5MhdgKJfI37FeIT7lW6DDkm5hUy5hrSlm5vyLuiSsftGnv1z
 anGdXzoBEKa5MInfotcgN0qe3G3PPw6FHKzQ6zIZxA7jBMHX+wQBnnRon
 2uEpU+CbOtPVDipgdr22u/DkiPnEuLlr3zSulXmsCgBQbwEV2h1S+hXLp
 VS7PdxWZy6r3H7ho46BwvH5dKJvVAKT/QZzg1w0w8Q7XrWYDnmkv3oAJY
 0XGYJT6U31D97FXL0pS/emcK1S2ZnaTZRCFm5VaLIH2koHtpcYj/DlOOC
 9429InOt31EK1SC8tY0aYkd8sJvg/W92OUQJjppdKv5FFhOascQzhuJmv g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="305753021"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="305753021"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2022 23:58:57 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="576947172"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="576947172"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 09 Oct 2022 23:58:57 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 13/17] drm/i915/vm_bind: Update
 i915_vma_verify_bind_complete()
Date: Sun,  9 Oct 2022 23:58:22 -0700
Message-Id: <20221010065826.32037-14-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221010065826.32037-1-niranjana.vishwanathapura@intel.com>
References: <20221010065826.32037-1-niranjana.vishwanathapura@intel.com>
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 16 +++++++++++-----
 drivers/gpu/drm/i915/i915_vma.h |  1 +
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index cb8e718ec46e..e27795e009ab 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -439,12 +439,21 @@ int i915_vma_sync(struct i915_vma *vma)
 	return i915_vm_sync(vma->vm);
 }
 
-#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
-static int i915_vma_verify_bind_complete(struct i915_vma *vma)
+/**
+ * i915_vma_verify_bind_complete() - Check for the bind completion of the vma
+ * @vma: vma to check for bind completion
+ *
+ * Returns: 0 if the vma bind is completed. Error code otherwise.
+ */
+int i915_vma_verify_bind_complete(struct i915_vma *vma)
 {
 	struct dma_fence *fence = i915_active_fence_get(&vma->active.excl);
 	int err;
 
+	/* Ensure vma bind is initiated */
+	if (!i915_vma_is_bound(vma, I915_VMA_BIND_MASK))
+		return -EINVAL;
+
 	if (!fence)
 		return 0;
 
@@ -457,9 +466,6 @@ static int i915_vma_verify_bind_complete(struct i915_vma *vma)
 
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

