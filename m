Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6253E7DCE10
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 14:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE69110E4D7;
	Tue, 31 Oct 2023 13:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE2710E4CE;
 Tue, 31 Oct 2023 13:41:14 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6bf20d466cdso1244405b3a.1; 
 Tue, 31 Oct 2023 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698759673; x=1699364473; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PCeDzcfZzIt44IqUc4Bdw7umWr+sqAg8YCgkraBLUT4=;
 b=Bts0/Tsgnlmu9U4Zi7YTPxp+lPhvA2CKXDgW72guNGGN0PQF3dGLrM3wKKkxFEKJE0
 5pRXswjTx4R9UO6C0qDXmuEJmjEgOkfXQpRhitdgg4O+IwFP3w2WNntekETVeaEawSp0
 N6Q277pa3wzIBSdUd+QPkE7219jLbcCIMDY23NRdLojB/j9cAV2cah7sHq2ukkAclhld
 nQrdF66rex5jKYLeG7gEjsJYVfQWlh/dwALqCvsBYmJyi4C46QKNHjd9/XyaJEDw7iHa
 JSYKo6H81U66q7Nne0uwb7Sgkj3xNRlA1PDx0ChozvGseaNI6+jU+Wyj2cbA2ptoQyre
 UN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698759673; x=1699364473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PCeDzcfZzIt44IqUc4Bdw7umWr+sqAg8YCgkraBLUT4=;
 b=hTqpHWXTLO3B0rQW9zA1s9XRmsv8rjrwvC+v8x1CzpFoW1q3gnFXb4ILxIwVfv8N0/
 MwJ04qfqI5Jj2/Jl4leNSPArwx6vGrVvXD73fzV0wJcR9yQjP4St6t4/fFZyWbCmcc3F
 KheSIBABuGYfJLBmQ+gtSkHUQmsPAUBy3eDpeGndZNxsPn8D7hmVy9qO0AyG+aKpvoSU
 6FGdss0EOLgVwN1cMnhTYGs78h/QpUnkvW0fmaCyXvPU50a1u7dFqtdPeNiLK9UxGM+h
 P5+mlmZTeSR8M+yMXzOzdO9/WmFWdERlh30BzotCbRiNcfF/mYVjMhUQRYXHsUwrX91O
 bNIw==
X-Gm-Message-State: AOJu0YyMiFJQvgM73vNq5CBTA+UqIbqikuqM0dgsLTaaNgppgRpRh2iA
 PpedPmMIVL2DOzrM18jURa3ZLBMCdmTSa6mk
X-Google-Smtp-Source: AGHT+IHMejDkVMrbHXLssnODixamj6R+hG8U8/0Y0rAeIZS6LJ8QxUn/J+TIm0Xm4qH+HaUXmqf0ng==
X-Received: by 2002:a05:6a21:6d85:b0:163:57ba:2ad4 with SMTP id
 wl5-20020a056a216d8500b0016357ba2ad4mr16253721pzb.2.1698759673411; 
 Tue, 31 Oct 2023 06:41:13 -0700 (PDT)
Received: from localhost (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 g18-20020aa78752000000b0068fe7e07190sm1267938pfo.3.2023.10.31.06.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 06:41:12 -0700 (PDT)
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] drm/amdgpu: Flush VM updates for split bindings eagerly.
Date: Tue, 31 Oct 2023 22:40:56 +0900
Message-ID: <20231031134059.171277-4-ishitatsuyuki@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current amdgpu_gem_va_update_vm only tries to perform updates for the
BO specified in the GEM ioctl; however, when a binding is split, the
adjacent bindings also need to be updated. Such updates currently ends up
getting deferred until next submission which causes stalls.

Introduce a new state "dirty", shared between per-VM BOs and traditional
BOs, containing all BOs that have pending updates in `invalids`.
amdgpu_gem_va_update_vm will now simply flush any pending updates for BOs
in the dirty state.

Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 18 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 66 ++++++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  3 ++
 3 files changed, 63 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index a1b15d0d6c48..01d3a97248b0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -604,10 +604,9 @@ int amdgpu_gem_metadata_ioctl(struct drm_device *dev, void *data,
  * vital here, so they are not reported back to userspace.
  */
 static void amdgpu_gem_va_update_vm(struct amdgpu_device *adev,
-				    struct amdgpu_vm *vm,
-				    struct amdgpu_bo_va *bo_va,
-				    uint32_t operation)
+				    struct amdgpu_vm *vm)
 {
+	struct amdgpu_bo_va *bo_va;
 	int r;
 
 	if (!amdgpu_vm_ready(vm))
@@ -617,12 +616,18 @@ static void amdgpu_gem_va_update_vm(struct amdgpu_device *adev,
 	if (r)
 		goto error;
 
-	if (operation == AMDGPU_VA_OP_MAP ||
-	    operation == AMDGPU_VA_OP_REPLACE) {
+	spin_lock(&vm->status_lock);
+	while (!list_empty(&vm->dirty)) {
+		bo_va = list_first_entry(&vm->dirty, struct amdgpu_bo_va,
+					 base.vm_status);
+		spin_unlock(&vm->status_lock);
+
 		r = amdgpu_vm_bo_update(adev, bo_va, false);
 		if (r)
 			goto error;
+		spin_lock(&vm->status_lock);
 	}
+	spin_unlock(&vm->status_lock);
 
 	r = amdgpu_vm_update_pdes(adev, vm, false);
 
@@ -792,8 +797,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 		break;
 	}
 	if (!r && !(args->flags & AMDGPU_VM_DELAY_UPDATE) && !amdgpu_vm_debug)
-		amdgpu_gem_va_update_vm(adev, &fpriv->vm, bo_va,
-					args->operation);
+		amdgpu_gem_va_update_vm(adev, &fpriv->vm);
 
 error:
 	drm_exec_fini(&exec);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index dd6f72e2a1d6..01d31891cd05 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -191,6 +191,21 @@ static void amdgpu_vm_bo_set_evicted(struct amdgpu_vm_bo_base *vm_bo, bool evict
 	spin_unlock(&vm_bo->vm->status_lock);
 }
 
+/**
+ * amdgpu_vm_bo_dirty - vm_bo is dirty
+ *
+ * @vm_bo: vm_bo which is dirty
+ *
+ * State for normal and per VM BOs that are not moved, but have new entries in
+ * bo_va->invalids.
+ */
+static void amdgpu_vm_bo_dirty(struct amdgpu_vm_bo_base *vm_bo)
+{
+	spin_lock(&vm_bo->vm->status_lock);
+	list_move(&vm_bo->vm_status, &vm_bo->vm->dirty);
+	spin_unlock(&vm_bo->vm->status_lock);
+}
+
 /**
  * amdgpu_vm_bo_moved - vm_bo is moved
  *
@@ -1042,6 +1057,9 @@ void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
 	list_for_each_entry_safe(bo_va, tmp, &vm->evicted, base.eviction_status)
 		amdgpu_vm_bo_get_memory(bo_va, stats);
 
+	list_for_each_entry_safe(bo_va, tmp, &vm->dirty, base.vm_status)
+		amdgpu_vm_bo_get_memory(bo_va, stats);
+
 	list_for_each_entry_safe(bo_va, tmp, &vm->relocated, base.vm_status)
 		amdgpu_vm_bo_get_memory(bo_va, stats);
 
@@ -1411,6 +1429,17 @@ int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
 			dma_resv_unlock(resv);
 		spin_lock(&vm->status_lock);
 	}
+
+	while (!list_empty(&vm->dirty)) {
+		bo_va = list_first_entry(&vm->dirty, struct amdgpu_bo_va,
+					 base.vm_status);
+		spin_unlock(&vm->status_lock);
+
+		r = amdgpu_vm_bo_update(adev, bo_va, false);
+		if (r)
+			return r;
+		spin_lock(&vm->status_lock);
+	}
 	spin_unlock(&vm->status_lock);
 
 	return 0;
@@ -1476,19 +1505,16 @@ static void amdgpu_vm_bo_insert_map(struct amdgpu_device *adev,
 				    struct amdgpu_bo_va_mapping *mapping)
 {
 	struct amdgpu_vm *vm = bo_va->base.vm;
-	struct amdgpu_bo *bo = bo_va->base.bo;
 
 	mapping->bo_va = bo_va;
 	list_add(&mapping->list, &bo_va->invalids);
 	amdgpu_vm_it_insert(mapping, &vm->va);
+	if (!bo_va->base.moved)
+		amdgpu_vm_bo_dirty(&bo_va->base);
 
 	if (mapping->flags & AMDGPU_PTE_PRT)
 		amdgpu_vm_prt_get(adev);
 
-	if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
-	    !bo_va->base.moved) {
-		amdgpu_vm_bo_moved(&bo_va->base);
-	}
 	trace_amdgpu_vm_bo_map(bo_va, mapping);
 }
 
@@ -1725,6 +1751,8 @@ int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
 			before->flags = tmp->flags;
 			before->bo_va = tmp->bo_va;
 			list_add(&before->list, &tmp->bo_va->invalids);
+			if (!tmp->bo_va->base.moved)
+				amdgpu_vm_bo_dirty(&tmp->bo_va->base);
 		}
 
 		/* Remember mapping split at the end */
@@ -1736,6 +1764,8 @@ int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
 			after->flags = tmp->flags;
 			after->bo_va = tmp->bo_va;
 			list_add(&after->list, &tmp->bo_va->invalids);
+			if (!tmp->bo_va->base.moved)
+				amdgpu_vm_bo_dirty(&tmp->bo_va->base);
 		}
 
 		list_del(&tmp->list);
@@ -1761,30 +1791,18 @@ int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
 
 	/* Insert partial mapping before the range */
 	if (!list_empty(&before->list)) {
-		struct amdgpu_bo *bo = before->bo_va->base.bo;
-
 		amdgpu_vm_it_insert(before, &vm->va);
 		if (before->flags & AMDGPU_PTE_PRT)
 			amdgpu_vm_prt_get(adev);
-
-		if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
-		    !before->bo_va->base.moved)
-			amdgpu_vm_bo_moved(&before->bo_va->base);
 	} else {
 		kfree(before);
 	}
 
 	/* Insert partial mapping after the range */
 	if (!list_empty(&after->list)) {
-		struct amdgpu_bo *bo = after->bo_va->base.bo;
-
 		amdgpu_vm_it_insert(after, &vm->va);
 		if (after->flags & AMDGPU_PTE_PRT)
 			amdgpu_vm_prt_get(adev);
-
-		if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
-		    !after->bo_va->base.moved)
-			amdgpu_vm_bo_moved(&after->bo_va->base);
 	} else {
 		kfree(after);
 	}
@@ -2136,6 +2154,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm, int32_t xcp
 	INIT_LIST_HEAD(&vm->evicted);
 	INIT_LIST_HEAD(&vm->relocated);
 	INIT_LIST_HEAD(&vm->moved);
+	INIT_LIST_HEAD(&vm->dirty);
 	INIT_LIST_HEAD(&vm->idle);
 	INIT_LIST_HEAD(&vm->invalidated);
 	spin_lock_init(&vm->status_lock);
@@ -2648,11 +2667,13 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct seq_file *m)
 {
 	struct amdgpu_bo_va *bo_va, *tmp;
 	u64 total_idle = 0;
+	u64 total_dirty = 0;
 	u64 total_relocated = 0;
 	u64 total_moved = 0;
 	u64 total_invalidated = 0;
 	u64 total_done = 0;
 	unsigned int total_idle_objs = 0;
+	unsigned int total_dirty_objs = 0;
 	unsigned int total_relocated_objs = 0;
 	unsigned int total_moved_objs = 0;
 	unsigned int total_invalidated_objs = 0;
@@ -2669,6 +2690,15 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct seq_file *m)
 	total_idle_objs = id;
 	id = 0;
 
+	seq_puts(m, "\tDirty BOs:\n");
+	list_for_each_entry_safe(bo_va, tmp, &vm->dirty, base.vm_status) {
+		if (!bo_va->base.bo)
+			continue;
+		total_dirty += amdgpu_bo_print_info(id++, bo_va->base.bo, m);
+	}
+	total_dirty_objs = id;
+	id = 0;
+
 	seq_puts(m, "\tRelocated BOs:\n");
 	list_for_each_entry_safe(bo_va, tmp, &vm->relocated, base.vm_status) {
 		if (!bo_va->base.bo)
@@ -2707,6 +2737,8 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct seq_file *m)
 
 	seq_printf(m, "\tTotal idle size:        %12lld\tobjs:\t%d\n", total_idle,
 		   total_idle_objs);
+	seq_printf(m, "\tTotal dirty size:       %12lld\tobjs:\t%d\n", total_dirty,
+		   total_dirty_objs);
 	seq_printf(m, "\tTotal relocated size:   %12lld\tobjs:\t%d\n", total_relocated,
 		   total_relocated_objs);
 	seq_printf(m, "\tTotal moved size:       %12lld\tobjs:\t%d\n", total_moved,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index d9ab97eabda9..f91d4fcf80b8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -276,6 +276,9 @@ struct amdgpu_vm {
 	/* per VM BOs moved, but not yet updated in the PT */
 	struct list_head	moved;
 
+	/* normal and per VM BOs that are not moved, but have new PT entries */
+	struct list_head	dirty;
+
 	/* All BOs of this VM not currently in the state machine */
 	struct list_head	idle;
 
-- 
2.42.0

