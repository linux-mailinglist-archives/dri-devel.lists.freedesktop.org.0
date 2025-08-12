Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E35B22E6E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 19:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9ED10E16B;
	Tue, 12 Aug 2025 17:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KFahWOzX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E20510E16B;
 Tue, 12 Aug 2025 17:01:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6CC9D60054;
 Tue, 12 Aug 2025 17:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4B2C4CEF0;
 Tue, 12 Aug 2025 17:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755018105;
 bh=LHEswSqHeCCILnCxV1/ki6B0f4rT8BI/jEZTG2IwxBE=;
 h=From:To:Cc:Subject:Date:From;
 b=KFahWOzXIEfHyxKTkrVkQx7JshEL+KixLBQGxNqdywNli7xpOZdfq8lv1P/fZrB5f
 MVL+VGPxAAn0DYwvCPdNPRA7PI06Pjsb50VAjvWI0yr9QcERQZidTPKHmcqHZoPVdL
 NlhJDc19ctR95ssQOdHRf++Zo22vfa6w1w/3yx8L5xtYC/etFPK/Ic5ekApjYHbRpE
 YMp8zxr5p6PC0TxsdIOGKD6XAWzLm8vQzslNwKXl5VlZcItU9wdjantUBQE9WbPRQi
 3roHtZOZhQPeZOQdkinDUQqwJFqN4HxrORpmySMMbEAInhPKP9La2x6gYxeKQgkcpt
 ouhoRkhYEjJtw==
From: Danilo Krummrich <dakr@kernel.org>
To: lyude@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Subject: [PATCH] drm/nouveau: use DRM_GPUVM_RESV_PROTECTED locking scheme
Date: Tue, 12 Aug 2025 19:01:25 +0200
Message-ID: <20250812170135.3544-1-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
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

Given that nouveau does not update the GPUVA space from the DMA fence
signalling critical path, we are able to use the DRM_GPUVM_RESV_PROTECTED
locking scheme, rather than relying on the spinlock dance for the
external and evicted object list.

Except for the call to drm_gpuvm_bo_extobj_add() add other relevant call
are already protected by the corresponding dma-resv locks.

Hence, move drm_gpuvm_bo_extobj_add into the same lock context as
drm_gpuvm_bo_obtain() and enable DRM_GPUVM_RESV_PROTECTED.

Cc: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index ddfc46bc1b3e..9d9e82628053 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1208,11 +1208,13 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
 
 			dma_resv_lock(obj->resv, NULL);
 			op->vm_bo = drm_gpuvm_bo_obtain(&uvmm->base, obj);
-			dma_resv_unlock(obj->resv);
-			if (IS_ERR(op->vm_bo))
+			if (IS_ERR(op->vm_bo)) {
+				dma_resv_unlock(obj->resv);
 				return PTR_ERR(op->vm_bo);
+			}
 
 			drm_gpuvm_bo_extobj_add(op->vm_bo);
+			dma_resv_unlock(obj->resv);
 		}
 
 		ret = bind_validate_op(job, op);
@@ -1857,7 +1859,9 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
 	mt_init_flags(&uvmm->region_mt, MT_FLAGS_LOCK_EXTERN);
 	mt_set_external_lock(&uvmm->region_mt, &uvmm->mutex);
 
-	drm_gpuvm_init(&uvmm->base, cli->name, 0, drm, r_obj,
+	drm_gpuvm_init(&uvmm->base, cli->name,
+		       DRM_GPUVM_RESV_PROTECTED,
+		       drm, r_obj,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
 		       init->kernel_managed_addr,

base-commit: fb357dbadbebc7a9ca3c5ef26f6c792b0e8e1278
-- 
2.50.1

