Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D867A75E6C0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 03:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7C810E242;
	Mon, 24 Jul 2023 01:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6121410E23F;
 Mon, 24 Jul 2023 01:22:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D7E1760F1A;
 Mon, 24 Jul 2023 01:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B30C433CA;
 Mon, 24 Jul 2023 01:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161773;
 bh=p3150Tr9KfnpZCm90ApKd8zUar7dbuqahcKUiRD4dro=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ohFMowadHD52BrryDbo/P1clAfR+dIyTkHwDs5nQeB/QdAtLUevGJj+q8xQMUTnuq
 KNMkHNF5iyq12/fw6TNPGpuRZ6yMrvj8sc9Hn6Gu1P4MIEr/r8+ZLuB8QgTalBkmAj
 Svm9UY6X9Y7e62Mnn4gOCIswdkcUuukVQzg5hxOin2W980KZzvbYc4DA5zpooliM+J
 JPx9oIDnQkbvXn9RmXqRZpg19bHlM8SGRxZ12HcHMJCcfI3cMGJ5weRBug9/Iv7QKa
 ha+0R8k/ggMDX9u5Ykb4BJLFz5WzQDWtTYdqL277kB3WIiFhidoQI8Cnlz62EEv8Qv
 6oT6xE9VaEYKw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 26/41] drm/amdgpu: install stub fence into
 potential unused fence pointers
Date: Sun, 23 Jul 2023 21:20:59 -0400
Message-Id: <20230724012118.2316073-26-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724012118.2316073-1-sashal@kernel.org>
References: <20230724012118.2316073-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.40
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
Cc: Sasha Levin <sashal@kernel.org>, Hongkun.Zhang@amd.com,
 dri-devel@lists.freedesktop.org, airlied@linux.ie, gregkh@linuxfoundation.org,
 danijel.slivka@amd.com, Xinhui.Pan@amd.com, samuel.pitoiset@gmail.com,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lang Yu <Lang.Yu@amd.com>

[ Upstream commit 187916e6ed9d0c3b3abc27429f7a5f8c936bd1f0 ]

When using cpu to update page tables, vm update fences are unused.
Install stub fence into these fence pointers instead of NULL
to avoid NULL dereference when calling dma_fence_wait() on them.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Lang Yu <Lang.Yu@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 003aa9e47085e..2fa7b68c5966d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1352,6 +1352,7 @@ struct amdgpu_bo_va *amdgpu_vm_bo_add(struct amdgpu_device *adev,
 	amdgpu_vm_bo_base_init(&bo_va->base, vm, bo);
 
 	bo_va->ref_count = 1;
+	bo_va->last_pt_update = dma_fence_get_stub();
 	INIT_LIST_HEAD(&bo_va->valids);
 	INIT_LIST_HEAD(&bo_va->invalids);
 
@@ -2061,7 +2062,8 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 		vm->update_funcs = &amdgpu_vm_cpu_funcs;
 	else
 		vm->update_funcs = &amdgpu_vm_sdma_funcs;
-	vm->last_update = NULL;
+
+	vm->last_update = dma_fence_get_stub();
 	vm->last_unlocked = dma_fence_get_stub();
 	vm->last_tlb_flush = dma_fence_get_stub();
 
@@ -2186,7 +2188,7 @@ int amdgpu_vm_make_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 		goto unreserve_bo;
 
 	dma_fence_put(vm->last_update);
-	vm->last_update = NULL;
+	vm->last_update = dma_fence_get_stub();
 	vm->is_compute_context = true;
 
 	/* Free the shadow bo for compute VM */
-- 
2.39.2

