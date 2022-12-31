Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B246565A6AB
	for <lists+dri-devel@lfdr.de>; Sat, 31 Dec 2022 21:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF2A10E2A3;
	Sat, 31 Dec 2022 20:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D2110E297;
 Sat, 31 Dec 2022 20:05:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 21E99B80917;
 Sat, 31 Dec 2022 20:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6924C433F1;
 Sat, 31 Dec 2022 20:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672517141;
 bh=Zm6jyk9Nd+W/6lpD/k39DtLbCitHTKO+Y+ZNCEpbcOc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kfpT4BycuHzmlPk59o8Tlu9l9OtFGQoE9jnfI6ArqsjVJbCaIEMQcBYTFoWyMCPpp
 vp/YyUAF86ncmTW985J14fXnx+i1bXqQbmbkzWFebFilLMNgit88ah3XSmy3g5Adpl
 G8deNo/1dUFIvezKYFnv5J33FD6cshMNqFQOri3y+ppSppqt5EDnwMWYc+T/OpXpIp
 39bFeEM7/bbVodmKtzsLJskbvFth5aEWHvtf3W/nMGTXUgOwhz1cilxPJamremKJkW
 JxPgZTtskLAmkDkDb3ZokGZT+MOc4FwdsOg6Nxas/fm7xya1AFQUPZZgbRTXDdFvrG
 qK590j6/WLWAQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 6/7] drm/amdkfd: Fix kfd_process_device_init_vm
 error handling
Date: Sat, 31 Dec 2022 15:05:01 -0500
Message-Id: <20221231200502.1748784-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221231200502.1748784-1-sashal@kernel.org>
References: <20221231200502.1748784-1-sashal@kernel.org>
MIME-Version: 1.0
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
 Felix Kuehling <Felix.Kuehling@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

[ Upstream commit 29d48b87db64b6697ddad007548e51d032081c59 ]

Should only destroy the ib_mem and let process cleanup worker to free
the outstanding BOs. Reset the pointer in pdd->qpd structure, to avoid
NULL pointer access in process destroy worker.

 BUG: kernel NULL pointer dereference, address: 0000000000000010
 Call Trace:
  amdgpu_amdkfd_gpuvm_unmap_gtt_bo_from_kernel+0x46/0xb0 [amdgpu]
  kfd_process_device_destroy_cwsr_dgpu+0x40/0x70 [amdgpu]
  kfd_process_destroy_pdds+0x71/0x190 [amdgpu]
  kfd_process_wq_release+0x2a2/0x3b0 [amdgpu]
  process_one_work+0x2a1/0x600
  worker_thread+0x39/0x3d0

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 6c83a519b3a1..04678f9e214b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -689,13 +689,13 @@ void kfd_process_destroy_wq(void)
 }
 
 static void kfd_process_free_gpuvm(struct kgd_mem *mem,
-			struct kfd_process_device *pdd, void *kptr)
+			struct kfd_process_device *pdd, void **kptr)
 {
 	struct kfd_dev *dev = pdd->dev;
 
-	if (kptr) {
+	if (kptr && *kptr) {
 		amdgpu_amdkfd_gpuvm_unmap_gtt_bo_from_kernel(mem);
-		kptr = NULL;
+		*kptr = NULL;
 	}
 
 	amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(dev->adev, mem, pdd->drm_priv);
@@ -795,7 +795,7 @@ static void kfd_process_device_destroy_ib_mem(struct kfd_process_device *pdd)
 	if (!qpd->ib_kaddr || !qpd->ib_base)
 		return;
 
-	kfd_process_free_gpuvm(qpd->ib_mem, pdd, qpd->ib_kaddr);
+	kfd_process_free_gpuvm(qpd->ib_mem, pdd, &qpd->ib_kaddr);
 }
 
 struct kfd_process *kfd_create_process(struct file *filep)
@@ -1277,7 +1277,7 @@ static void kfd_process_device_destroy_cwsr_dgpu(struct kfd_process_device *pdd)
 	if (!dev->cwsr_enabled || !qpd->cwsr_kaddr || !qpd->cwsr_base)
 		return;
 
-	kfd_process_free_gpuvm(qpd->cwsr_mem, pdd, qpd->cwsr_kaddr);
+	kfd_process_free_gpuvm(qpd->cwsr_mem, pdd, &qpd->cwsr_kaddr);
 }
 
 void kfd_process_set_trap_handler(struct qcm_process_device *qpd,
@@ -1603,8 +1603,8 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 	return 0;
 
 err_init_cwsr:
+	kfd_process_device_destroy_ib_mem(pdd);
 err_reserve_ib_mem:
-	kfd_process_device_free_bos(pdd);
 	pdd->drm_priv = NULL;
 
 	return ret;
-- 
2.35.1

