Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69224630985
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 03:13:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C649E10E7DE;
	Sat, 19 Nov 2022 02:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC1310E7BB;
 Sat, 19 Nov 2022 02:13:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A238262830;
 Sat, 19 Nov 2022 02:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39769C433C1;
 Sat, 19 Nov 2022 02:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668824007;
 bh=czlSI6kM+LOpXa1wVcw3iT0aw8FLrZoUgaCP3L537J4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JMNjrGozkItOmLBOEFc0hW8jl1jepw/favOyeN0C6pmS5lNeMpzj713yMwva5smaq
 xaNaLKaOm7hH5ZFimQtE7ciXsufFLr4rSYxS7WoLXnY1RuuCiqaj8O7vPcLwVD3OPr
 vcu4HCx1t3wgD2JlcNoMw1GuFOS6dq5HuSKcNPVx2rXkl+5w53CD6MDF9rRdoLLQ8C
 nDqkmqN3DgwJc732gEBlaCXVjc3okzvDF26uLOL9P2jgx1RUKYonI5ZzF6bSGIJXjf
 u4O1/OaOZBZVTaJoCxQcrQiPBncXn8TLp3hArs836E7jZxh2cQktO37styYOOBixmE
 PYodQTMW072wQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 39/44] drm/amdgpu: Drop eviction lock when
 allocating PT BO
Date: Fri, 18 Nov 2022 21:11:19 -0500
Message-Id: <20221119021124.1773699-39-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221119021124.1773699-1-sashal@kernel.org>
References: <20221119021124.1773699-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Philip Yang <Philip.Yang@amd.com>,
 mukul.joshi@amd.com, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, qiang.yu@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 airlied@redhat.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

[ Upstream commit e034a0d9aaee5c9129d5dfdfdfcab988a953412d ]

Re-take the eviction lock immediately again after the allocation is
completed, to fix circular locking warning with drm_buddy allocator.

Move amdgpu_vm_eviction_lock/unlock/trylock to amdgpu_vm.h as they are
called from multiple files.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c    | 26 -----------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h    | 26 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c |  2 ++
 3 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 04130f8813ef..369c0d03e3c6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -143,32 +143,6 @@ int amdgpu_vm_set_pasid(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	return 0;
 }
 
-/*
- * vm eviction_lock can be taken in MMU notifiers. Make sure no reclaim-FS
- * happens while holding this lock anywhere to prevent deadlocks when
- * an MMU notifier runs in reclaim-FS context.
- */
-static inline void amdgpu_vm_eviction_lock(struct amdgpu_vm *vm)
-{
-	mutex_lock(&vm->eviction_lock);
-	vm->saved_flags = memalloc_noreclaim_save();
-}
-
-static inline int amdgpu_vm_eviction_trylock(struct amdgpu_vm *vm)
-{
-	if (mutex_trylock(&vm->eviction_lock)) {
-		vm->saved_flags = memalloc_noreclaim_save();
-		return 1;
-	}
-	return 0;
-}
-
-static inline void amdgpu_vm_eviction_unlock(struct amdgpu_vm *vm)
-{
-	memalloc_noreclaim_restore(vm->saved_flags);
-	mutex_unlock(&vm->eviction_lock);
-}
-
 /**
  * amdgpu_vm_bo_evicted - vm_bo is evicted
  *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 9ecb7f663e19..1f3599363481 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -488,4 +488,30 @@ static inline uint64_t amdgpu_vm_tlb_seq(struct amdgpu_vm *vm)
 	return atomic64_read(&vm->tlb_seq);
 }
 
+/*
+ * vm eviction_lock can be taken in MMU notifiers. Make sure no reclaim-FS
+ * happens while holding this lock anywhere to prevent deadlocks when
+ * an MMU notifier runs in reclaim-FS context.
+ */
+static inline void amdgpu_vm_eviction_lock(struct amdgpu_vm *vm)
+{
+	mutex_lock(&vm->eviction_lock);
+	vm->saved_flags = memalloc_noreclaim_save();
+}
+
+static inline bool amdgpu_vm_eviction_trylock(struct amdgpu_vm *vm)
+{
+	if (mutex_trylock(&vm->eviction_lock)) {
+		vm->saved_flags = memalloc_noreclaim_save();
+		return true;
+	}
+	return false;
+}
+
+static inline void amdgpu_vm_eviction_unlock(struct amdgpu_vm *vm)
+{
+	memalloc_noreclaim_restore(vm->saved_flags);
+	mutex_unlock(&vm->eviction_lock);
+}
+
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
index 88de9f0d4728..983899574464 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
@@ -597,7 +597,9 @@ static int amdgpu_vm_pt_alloc(struct amdgpu_device *adev,
 	if (entry->bo)
 		return 0;
 
+	amdgpu_vm_eviction_unlock(vm);
 	r = amdgpu_vm_pt_create(adev, vm, cursor->level, immediate, &pt);
+	amdgpu_vm_eviction_lock(vm);
 	if (r)
 		return r;
 
-- 
2.35.1

