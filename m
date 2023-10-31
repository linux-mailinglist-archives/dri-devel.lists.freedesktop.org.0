Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C4A7DCE07
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 14:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5193410E4CD;
	Tue, 31 Oct 2023 13:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F4210E4CD;
 Tue, 31 Oct 2023 13:41:11 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1cc28719cb0so6728615ad.0; 
 Tue, 31 Oct 2023 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698759671; x=1699364471; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P9RKdJJhcMSfPq+WZs/RP57f6lPkPicq5MCLVBn4mRI=;
 b=Jk5tmAdBNVTK5cJh1OqJvDRfkdR68OCSsLu/UXy6/CY1Se68aPqjo289Z0pQ0YHr+R
 GkM0n17SV8T09hyAUIGOIhfaaK8SvOKZIzejJPzut09hlY2OtpD0UzacBpP1aoQYZ0cA
 EaeSz+Jg9RwVkb4GxmiV9ljhyX7VXF6eTVkgjvJCHTxjVWic1j92ok9Cl3LFFbjLJexY
 PucNkUPGrZBZz74RMzj65zsdpK02fiJQNZ+QolKtTM5eFSH6ObfZzCUxeX26yfbMxeXJ
 pmwNrDySnRHS7c3RSCr0O7b3osfw1/lyd0ClFq0RcyIct9JYa7Hw7TZbkOFWIOuN5BWO
 Qkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698759671; x=1699364471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P9RKdJJhcMSfPq+WZs/RP57f6lPkPicq5MCLVBn4mRI=;
 b=vAYDPNrt7D3DGjEGl11AaRoIF85/KHey5w/CJfN1Js5hesqAANbC+IQo8X4TVM9xgY
 gp9Nlqe3oByUV2yYnYZi9VlvWDmQMrAoO4Jygr3dFovjXbCyXfn3MsJgyI6ZS3cDxVdd
 JBZw8ZAEmi+AI4IYNpUPQhjg3W7iE0Yib7pxuNR/Wv5nLKjeSsWAaaDuJ9x9La2/Xj/2
 AVra5NXIKWGJJON4eLA0sq/hELz0mAL77nZSe0ToM3Ltgs6qpKMX6LQP/ynN3/KsbmVC
 R7B1h3RHshY5EEDc6EzKIkCJeK9Bes1f3PJq2uB0zOPgUMn7cT8a6eVu7doTS5i/Usq3
 AHZg==
X-Gm-Message-State: AOJu0YxtMCn8+plJh6xrhJFw39Es7m9UqpJUXBtpYn812IJzTlQWJBhO
 GB1uC9frYnC+UJ7xBGctV5mkOSdCs3BxhJs5
X-Google-Smtp-Source: AGHT+IFKdeSiv6gV1IPEr0A1QYWZHU8I+1Kda5cvazHkRrgW5MCu5gP/Hc13TADoBD0pMrq9a6X08Q==
X-Received: by 2002:a17:902:d28b:b0:1c7:5581:f9c with SMTP id
 t11-20020a170902d28b00b001c755810f9cmr12378077plc.0.1698759670766; 
 Tue, 31 Oct 2023 06:41:10 -0700 (PDT)
Received: from localhost (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 k17-20020a170902c41100b001c6187f2875sm1330890plk.225.2023.10.31.06.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 06:41:10 -0700 (PDT)
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] drm/amdgpu: Separate eviction from VM status.
Date: Tue, 31 Oct 2023 22:40:55 +0900
Message-ID: <20231031134059.171277-3-ishitatsuyuki@gmail.com>
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

In short, eviction never really belonged to the vm_status state machine.
Even when evicted, the BO could belong to either the moved or done state.
The "evicted" state needed to handle both cases, causing greater confusion.

Additionally, there were inconsistencies in the definition of an evicted
BO. Some places are based on the `evict` parameter passed from the TTM move
callback, while the others were updated based on whether the BO got its
optimal placement. The second is more accurate for our use case. With this
refactor, the evicted state is solely determined by the second rule.

Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c    | 67 +++++++++--------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h    |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c |  1 +
 3 files changed, 29 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 7b9762f1cddd..dd6f72e2a1d6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -174,19 +174,23 @@ int amdgpu_vm_set_pasid(struct amdgpu_device *adev, struct amdgpu_vm *vm,
  * State for PDs/PTs and per VM BOs which are not at the location they should
  * be.
  */
-static void amdgpu_vm_bo_evicted(struct amdgpu_vm_bo_base *vm_bo)
+static void amdgpu_vm_bo_set_evicted(struct amdgpu_vm_bo_base *vm_bo, bool evicted)
 {
 	struct amdgpu_vm *vm = vm_bo->vm;
 	struct amdgpu_bo *bo = vm_bo->bo;
 
-	vm_bo->moved = true;
 	spin_lock(&vm_bo->vm->status_lock);
-	if (bo->tbo.type == ttm_bo_type_kernel)
-		list_move(&vm_bo->vm_status, &vm->evicted);
-	else
-		list_move_tail(&vm_bo->vm_status, &vm->evicted);
+	if (evicted && bo->tbo.base.resv == vm->root.bo->tbo.base.resv) {
+		if (bo->tbo.type == ttm_bo_type_kernel)
+			list_move(&vm_bo->eviction_status, &vm->evicted);
+		else
+			list_move_tail(&vm_bo->eviction_status, &vm->evicted);
+	} else {
+		list_del_init(&vm_bo->eviction_status);
+	}
 	spin_unlock(&vm_bo->vm->status_lock);
 }
+
 /**
  * amdgpu_vm_bo_moved - vm_bo is moved
  *
@@ -310,6 +314,7 @@ void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
 	base->bo = bo;
 	base->next = NULL;
 	INIT_LIST_HEAD(&base->vm_status);
+	INIT_LIST_HEAD(&base->eviction_status);
 
 	if (!bo)
 		return;
@@ -336,7 +341,7 @@ void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
 	 * is currently evicted. add the bo to the evicted list to make sure it
 	 * is validated on next vm use to avoid fault.
 	 * */
-	amdgpu_vm_bo_evicted(base);
+	amdgpu_vm_bo_set_evicted(base, true);
 }
 
 /**
@@ -460,7 +465,7 @@ int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	while (!list_empty(&vm->evicted)) {
 		bo_base = list_first_entry(&vm->evicted,
 					   struct amdgpu_vm_bo_base,
-					   vm_status);
+					   eviction_status);
 		spin_unlock(&vm->status_lock);
 
 		bo = bo_base->bo;
@@ -1034,7 +1039,7 @@ void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
 	list_for_each_entry_safe(bo_va, tmp, &vm->idle, base.vm_status)
 		amdgpu_vm_bo_get_memory(bo_va, stats);
 
-	list_for_each_entry_safe(bo_va, tmp, &vm->evicted, base.vm_status)
+	list_for_each_entry_safe(bo_va, tmp, &vm->evicted, base.eviction_status)
 		amdgpu_vm_bo_get_memory(bo_va, stats);
 
 	list_for_each_entry_safe(bo_va, tmp, &vm->relocated, base.vm_status)
@@ -1153,21 +1158,10 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
 			return r;
 	}
 
-	/* If the BO is not in its preferred location add it back to
-	 * the evicted list so that it gets validated again on the
-	 * next command submission.
-	 */
-	if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv) {
-		uint32_t mem_type = bo->tbo.resource->mem_type;
-
-		if (!(bo->preferred_domains &
-		      amdgpu_mem_type_to_domain(mem_type)))
-			amdgpu_vm_bo_evicted(&bo_va->base);
-		else
-			amdgpu_vm_bo_idle(&bo_va->base);
-	} else {
+	if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv)
+		amdgpu_vm_bo_idle(&bo_va->base);
+	else
 		amdgpu_vm_bo_done(&bo_va->base);
-	}
 
 	list_splice_init(&bo_va->invalids, &bo_va->valids);
 	bo_va->cleared = clear;
@@ -1883,6 +1877,7 @@ void amdgpu_vm_bo_del(struct amdgpu_device *adev,
 
 	spin_lock(&vm->status_lock);
 	list_del(&bo_va->base.vm_status);
+	list_del(&bo_va->base.eviction_status);
 	spin_unlock(&vm->status_lock);
 
 	list_for_each_entry_safe(mapping, next, &bo_va->valids, list) {
@@ -1959,13 +1954,18 @@ void amdgpu_vm_bo_invalidate(struct amdgpu_device *adev,
 	if (bo->parent && (amdgpu_bo_shadowed(bo->parent) == bo))
 		bo = bo->parent;
 
+	/* If the BO is not in its preferred location add it back to
+	 * the evicted list so that it gets validated again on the
+	 * next command submission.
+	 */
+	uint32_t mem_type = bo->tbo.resource->mem_type;
+	bool suboptimal = !(bo->preferred_domains &
+			 amdgpu_mem_type_to_domain(mem_type));
+
 	for (bo_base = bo->vm_bo; bo_base; bo_base = bo_base->next) {
 		struct amdgpu_vm *vm = bo_base->vm;
 
-		if (evicted && bo->tbo.base.resv == vm->root.bo->tbo.base.resv) {
-			amdgpu_vm_bo_evicted(bo_base);
-			continue;
-		}
+		amdgpu_vm_bo_set_evicted(bo_base, suboptimal);
 
 		if (bo_base->moved)
 			continue;
@@ -2648,13 +2648,11 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct seq_file *m)
 {
 	struct amdgpu_bo_va *bo_va, *tmp;
 	u64 total_idle = 0;
-	u64 total_evicted = 0;
 	u64 total_relocated = 0;
 	u64 total_moved = 0;
 	u64 total_invalidated = 0;
 	u64 total_done = 0;
 	unsigned int total_idle_objs = 0;
-	unsigned int total_evicted_objs = 0;
 	unsigned int total_relocated_objs = 0;
 	unsigned int total_moved_objs = 0;
 	unsigned int total_invalidated_objs = 0;
@@ -2671,15 +2669,6 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct seq_file *m)
 	total_idle_objs = id;
 	id = 0;
 
-	seq_puts(m, "\tEvicted BOs:\n");
-	list_for_each_entry_safe(bo_va, tmp, &vm->evicted, base.vm_status) {
-		if (!bo_va->base.bo)
-			continue;
-		total_evicted += amdgpu_bo_print_info(id++, bo_va->base.bo, m);
-	}
-	total_evicted_objs = id;
-	id = 0;
-
 	seq_puts(m, "\tRelocated BOs:\n");
 	list_for_each_entry_safe(bo_va, tmp, &vm->relocated, base.vm_status) {
 		if (!bo_va->base.bo)
@@ -2718,8 +2707,6 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct seq_file *m)
 
 	seq_printf(m, "\tTotal idle size:        %12lld\tobjs:\t%d\n", total_idle,
 		   total_idle_objs);
-	seq_printf(m, "\tTotal evicted size:     %12lld\tobjs:\t%d\n", total_evicted,
-		   total_evicted_objs);
 	seq_printf(m, "\tTotal relocated size:   %12lld\tobjs:\t%d\n", total_relocated,
 		   total_relocated_objs);
 	seq_printf(m, "\tTotal moved size:       %12lld\tobjs:\t%d\n", total_moved,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 204ab13184ed..d9ab97eabda9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -156,6 +156,7 @@ struct amdgpu_vm_bo_base {
 
 	/* protected by spinlock */
 	struct list_head		vm_status;
+	struct list_head		eviction_status;
 
 	/* protected by the BO being reserved */
 	bool				moved;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
index 96d601e209b8..f78f4040f466 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
@@ -652,6 +652,7 @@ static void amdgpu_vm_pt_free(struct amdgpu_vm_bo_base *entry)
 
 	spin_lock(&entry->vm->status_lock);
 	list_del(&entry->vm_status);
+	list_del(&entry->eviction_status);
 	spin_unlock(&entry->vm->status_lock);
 	amdgpu_bo_unref(&entry->bo);
 }
-- 
2.42.0

