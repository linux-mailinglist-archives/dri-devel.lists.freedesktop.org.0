Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5040775E70F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 03:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BDF10E250;
	Mon, 24 Jul 2023 01:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5F310E250;
 Mon, 24 Jul 2023 01:24:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 33DC660DFE;
 Mon, 24 Jul 2023 01:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB13C433C8;
 Mon, 24 Jul 2023 01:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161880;
 bh=aEJmj9Iy/8EvM+AYoqe9R5TIQ3LU40Dq7BHUqdrISr0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aFdEsXkly5kDoUr+zreKxUcC42InJtnwAxaZzHRJfDOMWB8WacTw+fVJBJ28RtCMt
 bgKWoO8RD/FbCIrAOn8E2enAHcKfd+TKyXQH7g79ro8+crdZRCQT2lk0wFlfhydI9q
 F/ldBGkzLkWpb7hIy66Iz7EOaPa+sO9G7C2CB6mO4NH8OqyG1Zw78Ur0DUvOz1oofT
 kD+woJotLgT/nw8GleAg8HB8vJ4x3QAfDlNPSgK5QvTIkUrGHv7seLqbUc3OerZWwd
 cswIjDBX2GN5VSoIDnNvxMzMaYaTe+4sq0N7ontTINnd0Zhf8JvDyCtqihj3N2u0pe
 toFt8KLrW7PWQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 13/22] drm/amdgpu: install stub fence into
 potential unused fence pointers
Date: Sun, 23 Jul 2023 21:24:10 -0400
Message-Id: <20230724012419.2317649-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724012419.2317649-1-sashal@kernel.org>
References: <20230724012419.2317649-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.186
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 gregkh@linuxfoundation.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
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
index 45b1f00c59680..c19f472ec60da 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2155,6 +2155,7 @@ struct amdgpu_bo_va *amdgpu_vm_bo_add(struct amdgpu_device *adev,
 	amdgpu_vm_bo_base_init(&bo_va->base, vm, bo);
 
 	bo_va->ref_count = 1;
+	bo_va->last_pt_update = dma_fence_get_stub();
 	INIT_LIST_HEAD(&bo_va->valids);
 	INIT_LIST_HEAD(&bo_va->invalids);
 
@@ -2867,7 +2868,8 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		vm->update_funcs = &amdgpu_vm_cpu_funcs;
 	else
 		vm->update_funcs = &amdgpu_vm_sdma_funcs;
-	vm->last_update = NULL;
+
+	vm->last_update = dma_fence_get_stub();
 	vm->last_unlocked = dma_fence_get_stub();
 
 	mutex_init(&vm->eviction_lock);
@@ -3042,7 +3044,7 @@ int amdgpu_vm_make_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		vm->update_funcs = &amdgpu_vm_sdma_funcs;
 	}
 	dma_fence_put(vm->last_update);
-	vm->last_update = NULL;
+	vm->last_update = dma_fence_get_stub();
 	vm->is_compute_context = true;
 
 	if (vm->pasid) {
-- 
2.39.2

