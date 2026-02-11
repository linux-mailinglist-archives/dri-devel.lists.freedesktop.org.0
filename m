Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Sjy3JPY3jGkfjgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:04:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3370412201D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21A210E1DC;
	Wed, 11 Feb 2026 08:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XlMVXI1+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8EF10E1DC
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 08:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770797036;
 bh=0GemjTqC/EfoxaVl2Eh7xlm5jEeH6/rn+35Y9qkJZq8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XlMVXI1+G8Kzovo+45WJJ4l03nzltt2ejLEAYw1lCviHjVxBPOpMnhHarcwDM7NFM
 K7AWBXOyvUq/94cYAAXse9ZClfwWKvwdlym+g5LAzBarFbtuGcbhdgH6p2+xE3tZ6g
 zxYvq2Ib3J1aXFL2AaXKY6YjUAGZra04Kxa/bcFVnOVfL1q3bK0tQcQuRYF4qr2emu
 mVcmF5PbB41sIGIVtwafP5LHMNm9tCRwLCXqWeTXEAvWz+OIygQQFw3zOwgP4GP8M7
 QaJuQKcl+pNzpQTxpazPbQyXrvWW6u+01asscD2YoSgqvEmfqPSNB+d7lAEjK5Volh
 mG8uBCUfbzijQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F1F617E1532;
 Wed, 11 Feb 2026 09:03:55 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com
Subject: [PATCH v3 3/9] drm/panthor: Group panthor_kernel_bo_xxx() helpers
Date: Wed, 11 Feb 2026 09:03:37 +0100
Message-ID: <20260211080343.1887134-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211080343.1887134-1-boris.brezillon@collabora.com>
References: <20260211080343.1887134-1-boris.brezillon@collabora.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,collabora.com,intel.com,google.com];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:akash.goel@arm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:kernel@collabora.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email,arm.com:email]
X-Rspamd-Queue-Id: 3370412201D
X-Rspamd-Action: no action

Move all panthor_kernel_bo_xxx() helpers at the end of the file, just
before the debugfs init logic. This will make further panthor_gem.c
refactoring more readable.

v2:
- Collect R-bs

v3:
- No changes

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 212 +++++++++++++-------------
 1 file changed, 106 insertions(+), 106 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 13e9dd3764fa..4b3d82f001d8 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -132,112 +132,6 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
 	drm_gem_object_put(vm_root_gem);
 }
 
-/**
- * panthor_kernel_bo_destroy() - Destroy a kernel buffer object
- * @bo: Kernel buffer object to destroy. If NULL or an ERR_PTR(), the destruction
- * is skipped.
- */
-void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
-{
-	struct panthor_vm *vm;
-
-	if (IS_ERR_OR_NULL(bo))
-		return;
-
-	vm = bo->vm;
-	panthor_kernel_bo_vunmap(bo);
-
-	drm_WARN_ON(bo->obj->dev,
-		    to_panthor_bo(bo->obj)->exclusive_vm_root_gem != panthor_vm_root_gem(vm));
-	panthor_vm_unmap_range(vm, bo->va_node.start, bo->va_node.size);
-	panthor_vm_free_va(vm, &bo->va_node);
-	drm_gem_object_put(bo->obj);
-	panthor_vm_put(vm);
-	kfree(bo);
-}
-
-/**
- * panthor_kernel_bo_create() - Create and map a GEM object to a VM
- * @ptdev: Device.
- * @vm: VM to map the GEM to. If NULL, the kernel object is not GPU mapped.
- * @size: Size of the buffer object.
- * @bo_flags: Combination of drm_panthor_bo_flags flags.
- * @vm_map_flags: Combination of drm_panthor_vm_bind_op_flags (only those
- * that are related to map operations).
- * @gpu_va: GPU address assigned when mapping to the VM.
- * If gpu_va == PANTHOR_VM_KERNEL_AUTO_VA, the virtual address will be
- * automatically allocated.
- * @name: Descriptive label of the BO's contents
- *
- * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
- */
-struct panthor_kernel_bo *
-panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
-			 size_t size, u32 bo_flags, u32 vm_map_flags,
-			 u64 gpu_va, const char *name)
-{
-	struct drm_gem_shmem_object *obj;
-	struct panthor_kernel_bo *kbo;
-	struct panthor_gem_object *bo;
-	u32 debug_flags = PANTHOR_DEBUGFS_GEM_USAGE_FLAG_KERNEL;
-	int ret;
-
-	if (drm_WARN_ON(&ptdev->base, !vm))
-		return ERR_PTR(-EINVAL);
-
-	kbo = kzalloc(sizeof(*kbo), GFP_KERNEL);
-	if (!kbo)
-		return ERR_PTR(-ENOMEM);
-
-	obj = drm_gem_shmem_create(&ptdev->base, size);
-	if (IS_ERR(obj)) {
-		ret = PTR_ERR(obj);
-		goto err_free_bo;
-	}
-
-	bo = to_panthor_bo(&obj->base);
-	kbo->obj = &obj->base;
-	bo->flags = bo_flags;
-	bo->base.map_wc = should_map_wc(bo, vm);
-	bo->exclusive_vm_root_gem = panthor_vm_root_gem(vm);
-	drm_gem_object_get(bo->exclusive_vm_root_gem);
-	bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
-
-	if (vm == panthor_fw_vm(ptdev))
-		debug_flags |= PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED;
-
-	panthor_gem_kernel_bo_set_label(kbo, name);
-	panthor_gem_debugfs_set_usage_flags(to_panthor_bo(kbo->obj), debug_flags);
-
-	/* The system and GPU MMU page size might differ, which becomes a
-	 * problem for FW sections that need to be mapped at explicit address
-	 * since our PAGE_SIZE alignment might cover a VA range that's
-	 * expected to be used for another section.
-	 * Make sure we never map more than we need.
-	 */
-	size = ALIGN(size, panthor_vm_page_size(vm));
-	ret = panthor_vm_alloc_va(vm, gpu_va, size, &kbo->va_node);
-	if (ret)
-		goto err_put_obj;
-
-	ret = panthor_vm_map_bo_range(vm, bo, 0, size, kbo->va_node.start, vm_map_flags);
-	if (ret)
-		goto err_free_va;
-
-	kbo->vm = panthor_vm_get(vm);
-	return kbo;
-
-err_free_va:
-	panthor_vm_free_va(vm, &kbo->va_node);
-
-err_put_obj:
-	drm_gem_object_put(&obj->base);
-
-err_free_bo:
-	kfree(kbo);
-	return ERR_PTR(ret);
-}
-
 static struct sg_table *
 panthor_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
 			      enum dma_data_direction dir)
@@ -603,6 +497,112 @@ panthor_gem_sync(struct drm_gem_object *obj, u32 type,
 	return 0;
 }
 
+/**
+ * panthor_kernel_bo_destroy() - Destroy a kernel buffer object
+ * @bo: Kernel buffer object to destroy. If NULL or an ERR_PTR(), the destruction
+ * is skipped.
+ */
+void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
+{
+	struct panthor_vm *vm;
+
+	if (IS_ERR_OR_NULL(bo))
+		return;
+
+	vm = bo->vm;
+	panthor_kernel_bo_vunmap(bo);
+
+	drm_WARN_ON(bo->obj->dev,
+		    to_panthor_bo(bo->obj)->exclusive_vm_root_gem != panthor_vm_root_gem(vm));
+	panthor_vm_unmap_range(vm, bo->va_node.start, bo->va_node.size);
+	panthor_vm_free_va(vm, &bo->va_node);
+	drm_gem_object_put(bo->obj);
+	panthor_vm_put(vm);
+	kfree(bo);
+}
+
+/**
+ * panthor_kernel_bo_create() - Create and map a GEM object to a VM
+ * @ptdev: Device.
+ * @vm: VM to map the GEM to. If NULL, the kernel object is not GPU mapped.
+ * @size: Size of the buffer object.
+ * @bo_flags: Combination of drm_panthor_bo_flags flags.
+ * @vm_map_flags: Combination of drm_panthor_vm_bind_op_flags (only those
+ * that are related to map operations).
+ * @gpu_va: GPU address assigned when mapping to the VM.
+ * If gpu_va == PANTHOR_VM_KERNEL_AUTO_VA, the virtual address will be
+ * automatically allocated.
+ * @name: Descriptive label of the BO's contents
+ *
+ * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
+ */
+struct panthor_kernel_bo *
+panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
+			 size_t size, u32 bo_flags, u32 vm_map_flags,
+			 u64 gpu_va, const char *name)
+{
+	struct drm_gem_shmem_object *obj;
+	struct panthor_kernel_bo *kbo;
+	struct panthor_gem_object *bo;
+	u32 debug_flags = PANTHOR_DEBUGFS_GEM_USAGE_FLAG_KERNEL;
+	int ret;
+
+	if (drm_WARN_ON(&ptdev->base, !vm))
+		return ERR_PTR(-EINVAL);
+
+	kbo = kzalloc(sizeof(*kbo), GFP_KERNEL);
+	if (!kbo)
+		return ERR_PTR(-ENOMEM);
+
+	obj = drm_gem_shmem_create(&ptdev->base, size);
+	if (IS_ERR(obj)) {
+		ret = PTR_ERR(obj);
+		goto err_free_bo;
+	}
+
+	bo = to_panthor_bo(&obj->base);
+	kbo->obj = &obj->base;
+	bo->flags = bo_flags;
+	bo->base.map_wc = should_map_wc(bo, vm);
+	bo->exclusive_vm_root_gem = panthor_vm_root_gem(vm);
+	drm_gem_object_get(bo->exclusive_vm_root_gem);
+	bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
+
+	if (vm == panthor_fw_vm(ptdev))
+		debug_flags |= PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED;
+
+	panthor_gem_kernel_bo_set_label(kbo, name);
+	panthor_gem_debugfs_set_usage_flags(to_panthor_bo(kbo->obj), debug_flags);
+
+	/* The system and GPU MMU page size might differ, which becomes a
+	 * problem for FW sections that need to be mapped at explicit address
+	 * since our PAGE_SIZE alignment might cover a VA range that's
+	 * expected to be used for another section.
+	 * Make sure we never map more than we need.
+	 */
+	size = ALIGN(size, panthor_vm_page_size(vm));
+	ret = panthor_vm_alloc_va(vm, gpu_va, size, &kbo->va_node);
+	if (ret)
+		goto err_put_obj;
+
+	ret = panthor_vm_map_bo_range(vm, bo, 0, size, kbo->va_node.start, vm_map_flags);
+	if (ret)
+		goto err_free_va;
+
+	kbo->vm = panthor_vm_get(vm);
+	return kbo;
+
+err_free_va:
+	panthor_vm_free_va(vm, &kbo->va_node);
+
+err_put_obj:
+	drm_gem_object_put(&obj->base);
+
+err_free_bo:
+	kfree(kbo);
+	return ERR_PTR(ret);
+}
+
 #ifdef CONFIG_DEBUG_FS
 struct gem_size_totals {
 	size_t size;
-- 
2.52.0

