Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5016F83667C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F4A10F2E0;
	Mon, 22 Jan 2024 15:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C9C10F2D8;
 Mon, 22 Jan 2024 15:02:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8F4CF6115A;
 Mon, 22 Jan 2024 15:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD74FC433A6;
 Mon, 22 Jan 2024 15:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935724;
 bh=QSXYM/qKEYRrHwsHjMRC7WYNgQDaa6w1LGyVKlLjTJc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b2cCF++WRLaKTez5Yu8eReaCxfUU1x1JGosjjk+DCpIvIVgIMLMUQmTDfnGrknpEJ
 LAqynKz/2g3OY3wrmSlTgqj7rUeD7P/4JjmWvHOgd2RfSi7akBnzKHj3Vk0r1lspYt
 zmDd2RyDT/y74I6o9a2cB/+13GP/sAhhoCJmfRPDACALmi0A15A75CFHVRz3HNtHQF
 DwYwxwX+Q5V7vewDyzbeuBS1tFBjQ8jAxNEOyj58Y35sKcrhR9E+vPl1l0skzv8kFZ
 SWrRPvBAiE4M603O4DgskaTnbgCZbes9fu7oA3HQTBG4i0i6KZ04SKYm4JobQ7UHb1
 r6eaikNC9txgw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 83/88] Revert "drm/amdkfd: Relocate TBA/TMA to
 opposite side of VM hole"
Date: Mon, 22 Jan 2024 09:51:56 -0500
Message-ID: <20240122145608.990137-83-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122145608.990137-1-sashal@kernel.org>
References: <20240122145608.990137-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.1
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
Cc: Sasha Levin <sashal@kernel.org>, Jay Cornwall <jay.cornwall@amd.com>,
 Felix.Kuehling@amd.com, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 Kaibo Ma <ent3rm4n@gmail.com>, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, Alex Deucher <alexander.deucher@amd.com>, airlied@gmail.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kaibo Ma <ent3rm4n@gmail.com>

[ Upstream commit 0f35b0a7b8fa402adbffa2565047cdcc4c480153 ]

That commit causes NULL pointer dereferences in dmesgs when
running applications using ROCm, including clinfo, blender,
and PyTorch, since v6.6.1. Revert it to fix blender again.

This reverts commit 96c211f1f9ef82183493f4ceed4e347b52849149.

Closes: https://github.com/ROCm/ROCm/issues/2596
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/2991
Reviewed-by: Jay Cornwall <jay.cornwall@amd.com>
Signed-off-by: Kaibo Ma <ent3rm4n@gmail.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c | 26 ++++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c b/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
index 62b205dac63a..6604a3f99c5e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
@@ -330,12 +330,6 @@ static void kfd_init_apertures_vi(struct kfd_process_device *pdd, uint8_t id)
 	pdd->gpuvm_limit =
 		pdd->dev->kfd->shared_resources.gpuvm_size - 1;
 
-	/* dGPUs: the reserved space for kernel
-	 * before SVM
-	 */
-	pdd->qpd.cwsr_base = SVM_CWSR_BASE;
-	pdd->qpd.ib_base = SVM_IB_BASE;
-
 	pdd->scratch_base = MAKE_SCRATCH_APP_BASE_VI();
 	pdd->scratch_limit = MAKE_SCRATCH_APP_LIMIT(pdd->scratch_base);
 }
@@ -345,18 +339,18 @@ static void kfd_init_apertures_v9(struct kfd_process_device *pdd, uint8_t id)
 	pdd->lds_base = MAKE_LDS_APP_BASE_V9();
 	pdd->lds_limit = MAKE_LDS_APP_LIMIT(pdd->lds_base);
 
-	pdd->gpuvm_base = PAGE_SIZE;
+        /* Raven needs SVM to support graphic handle, etc. Leave the small
+         * reserved space before SVM on Raven as well, even though we don't
+         * have to.
+         * Set gpuvm_base and gpuvm_limit to CANONICAL addresses so that they
+         * are used in Thunk to reserve SVM.
+         */
+        pdd->gpuvm_base = SVM_USER_BASE;
 	pdd->gpuvm_limit =
 		pdd->dev->kfd->shared_resources.gpuvm_size - 1;
 
 	pdd->scratch_base = MAKE_SCRATCH_APP_BASE_V9();
 	pdd->scratch_limit = MAKE_SCRATCH_APP_LIMIT(pdd->scratch_base);
-
-	/*
-	 * Place TBA/TMA on opposite side of VM hole to prevent
-	 * stray faults from triggering SVM on these pages.
-	 */
-	pdd->qpd.cwsr_base = pdd->dev->kfd->shared_resources.gpuvm_size;
 }
 
 int kfd_init_apertures(struct kfd_process *process)
@@ -413,6 +407,12 @@ int kfd_init_apertures(struct kfd_process *process)
 					return -EINVAL;
 				}
 			}
+
+                        /* dGPUs: the reserved space for kernel
+                         * before SVM
+                         */
+                        pdd->qpd.cwsr_base = SVM_CWSR_BASE;
+                        pdd->qpd.ib_base = SVM_IB_BASE;
 		}
 
 		dev_dbg(kfd_device, "node id %u\n", id);
-- 
2.43.0

