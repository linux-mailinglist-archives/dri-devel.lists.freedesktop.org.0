Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A308A95AF8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 04:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACE810E4D3;
	Tue, 22 Apr 2025 02:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VdWHbnO0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B8D10E4D0;
 Tue, 22 Apr 2025 02:17:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9344444D00;
 Tue, 22 Apr 2025 02:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9646BC4CEEC;
 Tue, 22 Apr 2025 02:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745288218;
 bh=LymZTNAyldxPiXrdIgnTZA/Km+WVyq/FRxVXZaBUn4U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VdWHbnO0voNptAwekFyIrPqweIFRoHD98r9VwL9vkAxPiytBDQPs49wn0I4qdXGb/
 53HsjTlPI4s649Rky/YDPBemny3s455c2FOcw7vtdfvExlkiBQ/7LG7vKKVsdeuDs1
 RmGik8ID8LvkV3IwXAoNpYaEL4bh11QH+h7X/APzW1Qv+9Zuw5K2+RVZuNU9ztbgIT
 OrQgiEeJN9nq5i/HGrGJWOAoOLZSmFN5FVUHN/JH1zo9xbkJEEjGRUMuppNfc6W4Gz
 LN9cuVBciEGqLFE7cbW4ISQyd4Xctx4RFaf0871JQIWOvqbURVfT+bOoSHtF5w+3bn
 oFk+VAtS1xOrA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lijo Lazar <lijo.lazar@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, sunil.khatri@amd.com,
 vitaly.prosyak@amd.com, srinivasan.shanmugam@amd.com, Jesse.zhang@amd.com,
 Jiadong.Zhu@amd.com, Tim.Huang@amd.com, Prike.Liang@amd.com,
 Hawking.Zhang@amd.com, Likun.Gao@amd.com, kenneth.feng@amd.com,
 Jack.Xiao@amd.com, boyuan.zhang@amd.com, xiaogang.chen@amd.com,
 shane.xiao@amd.com, kent.russell@amd.com, yifan1.zhang@amd.com,
 Frank.Min@amd.com, david.belanger@amd.com, natalie.vock@gmx.de,
 alex.sierra@amd.com, le.ma@amd.com, yingli12@amd.com,
 mario.limonciello@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 27/30] drm/amdgpu: Use the right function for hdp
 flush
Date: Mon, 21 Apr 2025 22:15:47 -0400
Message-Id: <20250422021550.1940809-27-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250422021550.1940809-1-sashal@kernel.org>
References: <20250422021550.1940809-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.3
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

From: Lijo Lazar <lijo.lazar@amd.com>

[ Upstream commit c235a7132258ac30bd43d228222986022d21f5de ]

There are a few prechecks made before HDP flush like a flush is not
required on APU bare metal. Using hdp callback directly bypasses those
checks. Use amdgpu_device_flush_hdp which takes care of prechecks.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit 1d9bff4cf8c53d33ee2ff1b11574e5da739ce61c)
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 12 ++++++------
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c |  6 +++---
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c |  4 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c |  4 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c |  4 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c |  2 +-
 10 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 5ba263fe55121..1f32c531f610e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -6044,7 +6044,7 @@ static int gfx_v10_0_cp_gfx_load_pfp_microcode(struct amdgpu_device *adev)
 	}
 
 	if (amdgpu_emu_mode == 1)
-		adev->hdp.funcs->flush_hdp(adev, NULL);
+		amdgpu_device_flush_hdp(adev, NULL);
 
 	tmp = RREG32_SOC15(GC, 0, mmCP_PFP_IC_BASE_CNTL);
 	tmp = REG_SET_FIELD(tmp, CP_PFP_IC_BASE_CNTL, VMID, 0);
@@ -6122,7 +6122,7 @@ static int gfx_v10_0_cp_gfx_load_ce_microcode(struct amdgpu_device *adev)
 	}
 
 	if (amdgpu_emu_mode == 1)
-		adev->hdp.funcs->flush_hdp(adev, NULL);
+		amdgpu_device_flush_hdp(adev, NULL);
 
 	tmp = RREG32_SOC15(GC, 0, mmCP_CE_IC_BASE_CNTL);
 	tmp = REG_SET_FIELD(tmp, CP_CE_IC_BASE_CNTL, VMID, 0);
@@ -6199,7 +6199,7 @@ static int gfx_v10_0_cp_gfx_load_me_microcode(struct amdgpu_device *adev)
 	}
 
 	if (amdgpu_emu_mode == 1)
-		adev->hdp.funcs->flush_hdp(adev, NULL);
+		amdgpu_device_flush_hdp(adev, NULL);
 
 	tmp = RREG32_SOC15(GC, 0, mmCP_ME_IC_BASE_CNTL);
 	tmp = REG_SET_FIELD(tmp, CP_ME_IC_BASE_CNTL, VMID, 0);
@@ -6574,7 +6574,7 @@ static int gfx_v10_0_cp_compute_load_microcode(struct amdgpu_device *adev)
 	}
 
 	if (amdgpu_emu_mode == 1)
-		adev->hdp.funcs->flush_hdp(adev, NULL);
+		amdgpu_device_flush_hdp(adev, NULL);
 
 	tmp = RREG32_SOC15(GC, 0, mmCP_CPC_IC_BASE_CNTL);
 	tmp = REG_SET_FIELD(tmp, CP_CPC_IC_BASE_CNTL, CACHE_POLICY, 0);
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index cfb51baa581a1..f1f53c7687410 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -2391,7 +2391,7 @@ static int gfx_v11_0_config_me_cache(struct amdgpu_device *adev, uint64_t addr)
 	}
 
 	if (amdgpu_emu_mode == 1)
-		adev->hdp.funcs->flush_hdp(adev, NULL);
+		amdgpu_device_flush_hdp(adev, NULL);
 
 	tmp = RREG32_SOC15(GC, 0, regCP_ME_IC_BASE_CNTL);
 	tmp = REG_SET_FIELD(tmp, CP_ME_IC_BASE_CNTL, VMID, 0);
@@ -2435,7 +2435,7 @@ static int gfx_v11_0_config_pfp_cache(struct amdgpu_device *adev, uint64_t addr)
 	}
 
 	if (amdgpu_emu_mode == 1)
-		adev->hdp.funcs->flush_hdp(adev, NULL);
+		amdgpu_device_flush_hdp(adev, NULL);
 
 	tmp = RREG32_SOC15(GC, 0, regCP_PFP_IC_BASE_CNTL);
 	tmp = REG_SET_FIELD(tmp, CP_PFP_IC_BASE_CNTL, VMID, 0);
@@ -2480,7 +2480,7 @@ static int gfx_v11_0_config_mec_cache(struct amdgpu_device *adev, uint64_t addr)
 	}
 
 	if (amdgpu_emu_mode == 1)
-		adev->hdp.funcs->flush_hdp(adev, NULL);
+		amdgpu_device_flush_hdp(adev, NULL);
 
 	tmp = RREG32_SOC15(GC, 0, regCP_CPC_IC_BASE_CNTL);
 	tmp = REG_SET_FIELD(tmp, CP_CPC_IC_BASE_CNTL, CACHE_POLICY, 0);
@@ -3115,7 +3115,7 @@ static int gfx_v11_0_cp_gfx_load_pfp_microcode_rs64(struct amdgpu_device *adev)
 	amdgpu_bo_unreserve(adev->gfx.pfp.pfp_fw_data_obj);
 
 	if (amdgpu_emu_mode == 1)
-		adev->hdp.funcs->flush_hdp(adev, NULL);
+		amdgpu_device_flush_hdp(adev, NULL);
 
 	WREG32_SOC15(GC, 0, regCP_PFP_IC_BASE_LO,
 		lower_32_bits(adev->gfx.pfp.pfp_fw_gpu_addr));
@@ -3333,7 +3333,7 @@ static int gfx_v11_0_cp_gfx_load_me_microcode_rs64(struct amdgpu_device *adev)
 	amdgpu_bo_unreserve(adev->gfx.me.me_fw_data_obj);
 
 	if (amdgpu_emu_mode == 1)
-		adev->hdp.funcs->flush_hdp(adev, NULL);
+		amdgpu_device_flush_hdp(adev, NULL);
 
 	WREG32_SOC15(GC, 0, regCP_ME_IC_BASE_LO,
 		lower_32_bits(adev->gfx.me.me_fw_gpu_addr));
@@ -4549,7 +4549,7 @@ static int gfx_v11_0_gfxhub_enable(struct amdgpu_device *adev)
 	if (r)
 		return r;
 
-	adev->hdp.funcs->flush_hdp(adev, NULL);
+	amdgpu_device_flush_hdp(adev, NULL);
 
 	value = (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_ALWAYS) ?
 		false : true;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
index c21b168f75a75..0c08785099f32 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
@@ -2306,7 +2306,7 @@ static int gfx_v12_0_cp_gfx_load_pfp_microcode_rs64(struct amdgpu_device *adev)
 	amdgpu_bo_unreserve(adev->gfx.pfp.pfp_fw_data_obj);
 
 	if (amdgpu_emu_mode == 1)
-		adev->hdp.funcs->flush_hdp(adev, NULL);
+		amdgpu_device_flush_hdp(adev, NULL);
 
 	WREG32_SOC15(GC, 0, regCP_PFP_IC_BASE_LO,
 		lower_32_bits(adev->gfx.pfp.pfp_fw_gpu_addr));
@@ -2450,7 +2450,7 @@ static int gfx_v12_0_cp_gfx_load_me_microcode_rs64(struct amdgpu_device *adev)
 	amdgpu_bo_unreserve(adev->gfx.me.me_fw_data_obj);
 
 	if (amdgpu_emu_mode == 1)
-		adev->hdp.funcs->flush_hdp(adev, NULL);
+		amdgpu_device_flush_hdp(adev, NULL);
 
 	WREG32_SOC15(GC, 0, regCP_ME_IC_BASE_LO,
 		lower_32_bits(adev->gfx.me.me_fw_gpu_addr));
@@ -3469,7 +3469,7 @@ static int gfx_v12_0_gfxhub_enable(struct amdgpu_device *adev)
 	if (r)
 		return r;
 
-	adev->hdp.funcs->flush_hdp(adev, NULL);
+	amdgpu_device_flush_hdp(adev, NULL);
 
 	value = (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_ALWAYS) ?
 		false : true;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index 9bedca9a79c63..a88ad9951d328 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -268,7 +268,7 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	ack = hub->vm_inv_eng0_ack + hub->eng_distance * eng;
 
 	/* flush hdp cache */
-	adev->hdp.funcs->flush_hdp(adev, NULL);
+	amdgpu_device_flush_hdp(adev, NULL);
 
 	/* This is necessary for SRIOV as well as for GFXOFF to function
 	 * properly under bare metal
@@ -969,7 +969,7 @@ static int gmc_v10_0_gart_enable(struct amdgpu_device *adev)
 	adev->hdp.funcs->init_registers(adev);
 
 	/* Flush HDP after it is initialized */
-	adev->hdp.funcs->flush_hdp(adev, NULL);
+	amdgpu_device_flush_hdp(adev, NULL);
 
 	value = (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_ALWAYS) ?
 		false : true;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
index 72751ab4c766e..1eb97117fe7ae 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
@@ -229,7 +229,7 @@ static void gmc_v11_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	ack = hub->vm_inv_eng0_ack + hub->eng_distance * eng;
 
 	/* flush hdp cache */
-	adev->hdp.funcs->flush_hdp(adev, NULL);
+	amdgpu_device_flush_hdp(adev, NULL);
 
 	/* This is necessary for SRIOV as well as for GFXOFF to function
 	 * properly under bare metal
@@ -896,7 +896,7 @@ static int gmc_v11_0_gart_enable(struct amdgpu_device *adev)
 		return r;
 
 	/* Flush HDP after it is initialized */
-	adev->hdp.funcs->flush_hdp(adev, NULL);
+	amdgpu_device_flush_hdp(adev, NULL);
 
 	value = (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_ALWAYS) ?
 		false : true;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
index c3c144a4f45eb..0f136d6bbdc9b 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
@@ -297,7 +297,7 @@ static void gmc_v12_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 		return;
 
 	/* flush hdp cache */
-	adev->hdp.funcs->flush_hdp(adev, NULL);
+	amdgpu_device_flush_hdp(adev, NULL);
 
 	/* This is necessary for SRIOV as well as for GFXOFF to function
 	 * properly under bare metal
@@ -881,7 +881,7 @@ static int gmc_v12_0_gart_enable(struct amdgpu_device *adev)
 		return r;
 
 	/* Flush HDP after it is initialized */
-	adev->hdp.funcs->flush_hdp(adev, NULL);
+	amdgpu_device_flush_hdp(adev, NULL);
 
 	value = (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_ALWAYS) ?
 		false : true;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 291549765c38c..5250b470e5ef3 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -2434,7 +2434,7 @@ static int gmc_v9_0_hw_init(struct amdgpu_ip_block *ip_block)
 	adev->hdp.funcs->init_registers(adev);
 
 	/* After HDP is initialized, flush HDP.*/
-	adev->hdp.funcs->flush_hdp(adev, NULL);
+	amdgpu_device_flush_hdp(adev, NULL);
 
 	if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_ALWAYS)
 		value = false;
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
index 2395f1856962a..e77a467af7ac3 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
@@ -532,7 +532,7 @@ static int psp_v11_0_memory_training(struct psp_context *psp, uint32_t ops)
 			}
 
 			memcpy_toio(adev->mman.aper_base_kaddr, buf, sz);
-			adev->hdp.funcs->flush_hdp(adev, NULL);
+			amdgpu_device_flush_hdp(adev, NULL);
 			vfree(buf);
 			drm_dev_exit(idx);
 		} else {
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
index cc621064610f1..afdf8ce3b4c59 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
@@ -610,7 +610,7 @@ static int psp_v13_0_memory_training(struct psp_context *psp, uint32_t ops)
 			}
 
 			memcpy_toio(adev->mman.aper_base_kaddr, buf, sz);
-			adev->hdp.funcs->flush_hdp(adev, NULL);
+			amdgpu_device_flush_hdp(adev, NULL);
 			vfree(buf);
 			drm_dev_exit(idx);
 		} else {
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v14_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v14_0.c
index 4d33c95a51163..89f6c06946c51 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v14_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v14_0.c
@@ -488,7 +488,7 @@ static int psp_v14_0_memory_training(struct psp_context *psp, uint32_t ops)
 			}
 
 			memcpy_toio(adev->mman.aper_base_kaddr, buf, sz);
-			adev->hdp.funcs->flush_hdp(adev, NULL);
+			amdgpu_device_flush_hdp(adev, NULL);
 			vfree(buf);
 			drm_dev_exit(idx);
 		} else {
-- 
2.39.5

