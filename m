Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4237E75E6F9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 03:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4827710E24F;
	Mon, 24 Jul 2023 01:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009B110E246;
 Mon, 24 Jul 2023 01:24:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7853060F23;
 Mon, 24 Jul 2023 01:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF29C433C9;
 Mon, 24 Jul 2023 01:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161844;
 bh=aPTXjy5VzXk49T8JNqoocEnU8cUd6GtYEBby0RJ+D4I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Us098pNC2Nlnue3Wt0iRBrrPP+r3YXqXlJzTKI8sHzhuzizTw6xLyjq69OaMG/xo2
 ByjPc1E3S+CbmFehob+PtQEuJkJFv4vWRTltjDJqC/FHLbeDEgNTukkEu/KFVodEu/
 /XczXRPPXtG46te17hwWIgGdAQ0uCOjXbHlfIok1INERQjfWv28kWgB4KyVbpGgynQ
 Eovo+EEQrhbpX2nOVbCs7Q8DYZHZd75XYvdolxXfOZQH8F2CEkldHxxkGxM24YCY2S
 7c6o+OaCy6YfKwGAOHUn+yahb9p9AJH7+lAkahfHDZeIQ2vfyS+Se/ZyLLAUb4S4Jh
 s/rS9jkz72SGQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 13/23] drm/amdgpu: install stub fence into
 potential unused fence pointers
Date: Sun, 23 Jul 2023 21:23:24 -0400
Message-Id: <20230724012334.2317140-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724012334.2317140-1-sashal@kernel.org>
References: <20230724012334.2317140-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.121
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
Cc: Sasha Levin <sashal@kernel.org>, David1.Zhou@amd.com, airlied@linux.ie,
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
index 924c6d5f86203..362fd43313552 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2260,6 +2260,7 @@ struct amdgpu_bo_va *amdgpu_vm_bo_add(struct amdgpu_device *adev,
 	amdgpu_vm_bo_base_init(&bo_va->base, vm, bo);
 
 	bo_va->ref_count = 1;
+	bo_va->last_pt_update = dma_fence_get_stub();
 	INIT_LIST_HEAD(&bo_va->valids);
 	INIT_LIST_HEAD(&bo_va->invalids);
 
@@ -2962,7 +2963,8 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 		vm->update_funcs = &amdgpu_vm_cpu_funcs;
 	else
 		vm->update_funcs = &amdgpu_vm_sdma_funcs;
-	vm->last_update = NULL;
+
+	vm->last_update = dma_fence_get_stub();
 	vm->last_unlocked = dma_fence_get_stub();
 
 	mutex_init(&vm->eviction_lock);
@@ -3105,7 +3107,7 @@ int amdgpu_vm_make_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 		vm->update_funcs = &amdgpu_vm_sdma_funcs;
 	}
 	dma_fence_put(vm->last_update);
-	vm->last_update = NULL;
+	vm->last_update = dma_fence_get_stub();
 	vm->is_compute_context = true;
 
 	/* Free the shadow bo for compute VM */
-- 
2.39.2

