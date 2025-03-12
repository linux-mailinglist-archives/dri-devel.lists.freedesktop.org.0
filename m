Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EDEA5E616
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 22:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C88510E7C2;
	Wed, 12 Mar 2025 21:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vb68/hFr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2C910E343;
 Wed, 12 Mar 2025 21:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741813524; x=1773349524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7xa/O1rAPOd0tGAWbF3WfdpWOzf263wrrXXuFNr3NEU=;
 b=Vb68/hFra3aIwvj90/QHAlwwO17n/3PW5OreUfCWDf77wCPxRvDDnNR7
 I+9DyJZwABV+cC+37uVnVnU8TRTsu7m5Jv0ETVkC0ArPf7m2QflB6YjIr
 JsHX2AEpj+o6vH2+mc+9ZkH1EmrmyiijeP6L7rOFnQ6yfCkdj/uE5eaxL
 2oGAIZXIrQDeeny4dkI9+kr5KBKKkvwV63WBRAQ/0JKl6aFIAbW46vhSM
 6dG++ufnc28ykI+UieeC6ceAigf9SdpH1jacwcB68IKf98Uy0nxZKEvVj
 qRLA1chECh+UNC8HaGIXg4MPYuTNs5Fp0REAT0gHSRLVfZgH3ZTSvG5Dn A==;
X-CSE-ConnectionGUID: J2HNgsArSoCOlvyTcSpNVg==
X-CSE-MsgGUID: mJqj6BsJSOmWRK6rO6NDkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46562211"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="46562211"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:24 -0700
X-CSE-ConnectionGUID: QdNToZBBTcWVDFdCQIoHdA==
X-CSE-MsgGUID: bn55hDLfTiaxB2KxtlFaww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="120791143"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.73])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:20 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [RFC PATCH 10/19] drm/gpusvm,
 drm/xe: Move the device private owner to the drm_gpusvm_ctx
Date: Wed, 12 Mar 2025 22:04:07 +0100
Message-ID: <20250312210416.3120-11-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
References: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

It may not be known at drm_gpusvm_init time.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 21 ++++++++++++---------
 drivers/gpu/drm/xe/xe_svm.c  |  5 +++--
 include/drm/drm_gpusvm.h     |  7 ++++---
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index d84e27283768..8d836248f5fe 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -416,7 +416,6 @@ static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
  * @name: Name of the GPU SVM.
  * @drm: Pointer to the DRM device structure.
  * @mm: Pointer to the mm_struct for the address space.
- * @device_private_page_owner: Device private pages owner.
  * @mm_start: Start address of GPU SVM.
  * @mm_range: Range of the GPU SVM.
  * @notifier_size: Size of individual notifiers.
@@ -432,7 +431,7 @@ static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
  */
 int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
 		    const char *name, struct drm_device *drm,
-		    struct mm_struct *mm, void *device_private_page_owner,
+		    struct mm_struct *mm,
 		    unsigned long mm_start, unsigned long mm_range,
 		    unsigned long notifier_size,
 		    const struct drm_gpusvm_ops *ops,
@@ -444,7 +443,6 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
 	gpusvm->name = name;
 	gpusvm->drm = drm;
 	gpusvm->mm = mm;
-	gpusvm->device_private_page_owner = device_private_page_owner;
 	gpusvm->mm_start = mm_start;
 	gpusvm->mm_range = mm_range;
 	gpusvm->notifier_size = notifier_size;
@@ -712,6 +710,7 @@ drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
  * @notifier: Pointer to the GPU SVM notifier structure
  * @start: Start address
  * @end: End address
+ * @dev_private_owner: The device private page owner
  *
  * Check if pages between start and end have been faulted in on the CPU. Use to
  * prevent migration of pages without CPU backing store.
@@ -720,14 +719,15 @@ drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
  */
 static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
 				   struct drm_gpusvm_notifier *notifier,
-				   unsigned long start, unsigned long end)
+				   unsigned long start, unsigned long end,
+				   void *dev_private_owner)
 {
 	struct hmm_range hmm_range = {
 		.default_flags = 0,
 		.notifier = &notifier->notifier,
 		.start = start,
 		.end = end,
-		.dev_private_owner = gpusvm->device_private_page_owner,
+		.dev_private_owner = dev_private_owner,
 	};
 	unsigned long timeout =
 		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
@@ -781,6 +781,7 @@ static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
  * @gpuva_start: Start address of GPUVA which mirrors CPU
  * @gpuva_end: End address of GPUVA which mirrors CPU
  * @check_pages_threshold: Check CPU pages for present threshold
+ * @dev_private_owner: The device private page owner
  *
  * This function determines the chunk size for the GPU SVM range based on the
  * fault address, GPU SVM chunk sizes, existing GPU SVM ranges, and the virtual
@@ -795,7 +796,8 @@ drm_gpusvm_range_chunk_size(struct drm_gpusvm *gpusvm,
 			    unsigned long fault_addr,
 			    unsigned long gpuva_start,
 			    unsigned long gpuva_end,
-			    unsigned long check_pages_threshold)
+			    unsigned long check_pages_threshold,
+			    void *dev_private_owner)
 {
 	unsigned long start, end;
 	int i = 0;
@@ -842,7 +844,7 @@ drm_gpusvm_range_chunk_size(struct drm_gpusvm *gpusvm,
 		 * process-many-malloc' mallocs at least 64k at a time.
 		 */
 		if (end - start <= check_pages_threshold &&
-		    !drm_gpusvm_check_pages(gpusvm, notifier, start, end)) {
+		    !drm_gpusvm_check_pages(gpusvm, notifier, start, end, dev_private_owner)) {
 			++i;
 			goto retry;
 		}
@@ -951,7 +953,8 @@ drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
 	chunk_size = drm_gpusvm_range_chunk_size(gpusvm, notifier, vas,
 						 fault_addr, gpuva_start,
 						 gpuva_end,
-						 ctx->check_pages_threshold);
+						 ctx->check_pages_threshold,
+						 ctx->device_private_page_owner);
 	if (chunk_size == LONG_MAX) {
 		err = -EINVAL;
 		goto err_notifier_remove;
@@ -1207,7 +1210,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 		.notifier = notifier,
 		.start = drm_gpusvm_range_start(range),
 		.end = drm_gpusvm_range_end(range),
-		.dev_private_owner = gpusvm->device_private_page_owner,
+		.dev_private_owner = ctx->device_private_page_owner,
 	};
 	struct mm_struct *mm = gpusvm->mm;
 	void *zdd;
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index c49bcfea5644..20441da0aff7 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -657,8 +657,8 @@ int xe_svm_init(struct xe_vm *vm)
 		return err;
 
 	err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
-			      current->mm, xe_svm_devm_owner(vm->xe), 0,
-			      vm->size, xe_modparam.svm_notifier_size * SZ_1M,
+			      current->mm, 0, vm->size,
+			      xe_modparam.svm_notifier_size * SZ_1M,
 			      &gpusvm_ops, fault_chunk_sizes,
 			      ARRAY_SIZE(fault_chunk_sizes));
 	if (err) {
@@ -841,6 +841,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	}
 
 	range_debug(range, "GET PAGES");
+	ctx.device_private_page_owner = xe_svm_devm_owner(vm->xe);
 	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
 	/* Corner where CPU mappings have changed */
 	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 97c641bf49c5..729e5251b582 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -156,7 +156,6 @@ struct drm_gpusvm_range {
  * @name: Name of the GPU SVM
  * @drm: Pointer to the DRM device structure
  * @mm: Pointer to the mm_struct for the address space
- * @device_private_page_owner: Device private pages owner
  * @mm_start: Start address of GPU SVM
  * @mm_range: Range of the GPU SVM
  * @notifier_size: Size of individual notifiers
@@ -181,7 +180,6 @@ struct drm_gpusvm {
 	const char *name;
 	struct drm_device *drm;
 	struct mm_struct *mm;
-	void *device_private_page_owner;
 	unsigned long mm_start;
 	unsigned long mm_range;
 	unsigned long notifier_size;
@@ -203,6 +201,8 @@ struct drm_gpusvm {
 /**
  * struct drm_gpusvm_ctx - DRM GPU SVM context
  *
+ * @device_private_page_owner: The device-private page owner to use for
+ * this operation
  * @check_pages_threshold: Check CPU pages for present if chunk is less than or
  *                         equal to threshold. If not present, reduce chunk
  *                         size.
@@ -213,6 +213,7 @@ struct drm_gpusvm {
  * Context that is DRM GPUSVM is operating in (i.e. user arguments).
  */
 struct drm_gpusvm_ctx {
+	void *device_private_page_owner;
 	unsigned long check_pages_threshold;
 	unsigned int in_notifier :1;
 	unsigned int read_only :1;
@@ -221,7 +222,7 @@ struct drm_gpusvm_ctx {
 
 int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
 		    const char *name, struct drm_device *drm,
-		    struct mm_struct *mm, void *device_private_page_owner,
+		    struct mm_struct *mm,
 		    unsigned long mm_start, unsigned long mm_range,
 		    unsigned long notifier_size,
 		    const struct drm_gpusvm_ops *ops,
-- 
2.48.1

