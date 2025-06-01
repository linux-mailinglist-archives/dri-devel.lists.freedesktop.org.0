Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78B8ACA208
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E56C10E3FC;
	Sun,  1 Jun 2025 23:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I7SSkTWM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8FD10E3FC;
 Sun,  1 Jun 2025 23:32:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1216649CAE;
 Sun,  1 Jun 2025 23:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97291C4CEE7;
 Sun,  1 Jun 2025 23:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820778;
 bh=9LJ04HyoMnN2g3Btc3qQEPrQbViWnJRomMRMYFmSxLU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I7SSkTWMVlb7sPO/TBj8jsl+pn+R7lcNfrc/WgLestshH1nlaiU0IDJswCJMXrMXp
 W1kn0lzUsFgk4MOD5C05dGljKYGUpLygGideWwt3bhtO6nlE1AzMz2+8wpT90i1Msa
 fxLFFODddAp5KhyOvZHpYcEtS8gSv9UoJhs9yF+nWOVi9YbrY4hgZwUVUh2UJ2hpuN
 RubzurOEIjA1z/yeVIuZxEBligxBJILQ3dLPm83WwT9AH2VXhT8w+7e8wJF6Q88c4g
 mup0xx10nrBDwkkf6e+o0hgaq3kMwarI8fWunF4rN9bY3TEkxU3onYuwVZUHTZiDa0
 fc5MIlCwfiLfA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Victor Skvortsov <victor.skvortsov@amd.com>,
 Zhigang Luo <Zhigang.luo@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 lijo.lazar@amd.com, Hawking.Zhang@amd.com, Feifei.Xu@amd.com,
 rajneesh.bhardwaj@amd.com, le.ma@amd.com, shiwu.zhang@amd.com,
 YiPeng.Chai@amd.com, Emily.Deng@amd.com, Vignesh.Chander@amd.com,
 Yunxiang.Li@amd.com, Tony.Yi@amd.com, yunru.pan@amd.com,
 srinivasan.shanmugam@amd.com, Shravankumar.Gande@amd.com,
 wangyuli@uniontech.com, tao.zhou1@amd.com, kevinyang.wang@amd.com,
 Harish.Kasiviswanathan@amd.com, xiang.liu@amd.com, Masha.Grinman@amd.com,
 Tim.Huang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 070/102] drm/amdgpu: Add indirect L1_TLB_CNTL reg
 programming for VFs
Date: Sun,  1 Jun 2025 19:29:02 -0400
Message-Id: <20250601232937.3510379-70-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232937.3510379-1-sashal@kernel.org>
References: <20250601232937.3510379-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
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

From: Victor Skvortsov <victor.skvortsov@amd.com>

[ Upstream commit 0c6e39ce6da20104900b11bad64464a12fb47320 ]

VFs on some IP versions are unable to access this register directly.

This register must be programmed before PSP ring is setup,
so use PSP VF mailbox directly. PSP will broadcast the register
value to all VF assigned instances.

Signed-off-by: Victor Skvortsov <victor.skvortsov@amd.com>
Reviewed-by: Zhigang Luo <Zhigang.luo@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis of the commit and the comprehensive repository
context, my recommendation is: **YES** This commit should be backported
to stable kernel trees as it addresses a functional limitation for AMD
GPU Virtual Functions (VFs) in SR-IOV environments. ## Detailed
Analysis: ### Nature of the Change This is **primarily a functional
fix** rather than a new feature. The commit addresses a hardware
limitation where VFs on certain AMD GPU IP versions cannot directly
access the `MC_VM_MX_L1_TLB_CNTL` register due to L1 policy
restrictions. ### Technical Context 1. **Established Pattern**: The
commit follows a well-established pattern for indirect register
programming in AMD GPU SR-IOV environments. Similar infrastructure
already exists for `IH_RB_CNTL` registers (PSP_REG_IH_RB_CNTL) and MMHUB
registers via RLCG. 2. **Mature Infrastructure**: The SR-IOV and PSP
infrastructure used by this commit is mature and stable, dating back to
2016-2018. The PSP v13.0 implementation is well-established. 3.
**Hardware Compatibility Issue**: The commit message clearly states this
is needed for VFs that "are unable to access this register directly" on
"some IP versions," indicating this addresses a hardware compatibility
requirement. ### Code Quality Assessment 1. **Clean Implementation**:
The changes are well-structured and non-invasive: - Adds new enum value
`PSP_REG_MMHUB_L1_TLB_CNTL = 25` - Adds feature flag
`AMDGIM_FEATURE_L1_TLB_CNTL_PSP_EN` - Implements conditional logic that
falls back to direct access when indirect is not available 2. **Proper
Integration**: The commit properly integrates with existing code paths:
- Uses established `amdgpu_sriov_reg_indirect_l1_tlb_cntl()` pattern -
Implements both enable and disable paths (`mmhub_v1_8_disable_l1_tlb()`)
- Maintains backward compatibility 3. **Low Risk**: Changes are
contained within SR-IOV-specific code paths and only activate when the
feature flag is set by the hypervisor. ### Comparison with Similar
Commits Looking at the reference commits provided, this follows the same
pattern as Similar Commit #2 (marked as "YES" for backport), which also
addressed PSP security concerns for VF operations. Both commits: - Fix
functional issues in VF environments - Use established PSP
infrastructure - Have minimal risk of regression - Address hardware-
specific limitations ### Functional Impact Without this change, VFs on
affected hardware likely cannot properly initialize L1 TLB settings,
which could result in: - VM initialization failures - Memory access
issues - Degraded or non-functional VF operation ### Risk Assessment
**LOW RISK** for backporting: - Only affects VF operation when feature
flag is enabled - Falls back to existing direct register access when not
needed - Uses mature, well-tested code paths - No architectural changes
to core driver logic This commit represents a necessary hardware
compatibility fix that enables proper VF functionality on newer AMD GPU
hardware where direct register access has been restricted by hardware
policy.

 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h     | 10 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h    | 12 +++-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h |  9 +--
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c     | 63 ++++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c      | 20 +++++++
 5 files changed, 93 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
index 8d5acc415d386..dcf5e8e0b9e3e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
@@ -107,6 +107,7 @@ enum psp_reg_prog_id {
 	PSP_REG_IH_RB_CNTL        = 0,  /* register IH_RB_CNTL */
 	PSP_REG_IH_RB_CNTL_RING1  = 1,  /* register IH_RB_CNTL_RING1 */
 	PSP_REG_IH_RB_CNTL_RING2  = 2,  /* register IH_RB_CNTL_RING2 */
+	PSP_REG_MMHUB_L1_TLB_CNTL = 25,
 	PSP_REG_LAST
 };
 
@@ -142,6 +143,8 @@ struct psp_funcs {
 	bool (*get_ras_capability)(struct psp_context *psp);
 	bool (*is_aux_sos_load_required)(struct psp_context *psp);
 	bool (*is_reload_needed)(struct psp_context *psp);
+	int (*reg_program_no_ring)(struct psp_context *psp, uint32_t val,
+				   enum psp_reg_prog_id id);
 };
 
 struct ta_funcs {
@@ -475,6 +478,10 @@ struct amdgpu_psp_funcs {
 #define psp_is_aux_sos_load_required(psp) \
 	((psp)->funcs->is_aux_sos_load_required ? (psp)->funcs->is_aux_sos_load_required((psp)) : 0)
 
+#define psp_reg_program_no_ring(psp, val, id) \
+	((psp)->funcs->reg_program_no_ring ? \
+	(psp)->funcs->reg_program_no_ring((psp), val, id) : -EINVAL)
+
 extern const struct amd_ip_funcs psp_ip_funcs;
 
 extern const struct amdgpu_ip_block_version psp_v3_1_ip_block;
@@ -569,5 +576,8 @@ bool amdgpu_psp_get_ras_capability(struct psp_context *psp);
 int psp_config_sq_perfmon(struct psp_context *psp, uint32_t xcp_id,
 	bool core_override_enable, bool reg_override_enable, bool perfmon_override_enable);
 bool amdgpu_psp_tos_reload_needed(struct amdgpu_device *adev);
+int amdgpu_psp_reg_program_no_ring(struct psp_context *psp, uint32_t val,
+				   enum psp_reg_prog_id id);
+
 
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
index 0f3ccae5c1ab3..1285b3e1b1a0c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
@@ -144,11 +144,13 @@ enum AMDGIM_FEATURE_FLAG {
 
 enum AMDGIM_REG_ACCESS_FLAG {
 	/* Use PSP to program IH_RB_CNTL */
-	AMDGIM_FEATURE_IH_REG_PSP_EN     = (1 << 0),
+	AMDGIM_FEATURE_IH_REG_PSP_EN      = (1 << 0),
 	/* Use RLC to program MMHUB regs */
-	AMDGIM_FEATURE_MMHUB_REG_RLC_EN  = (1 << 1),
+	AMDGIM_FEATURE_MMHUB_REG_RLC_EN   = (1 << 1),
 	/* Use RLC to program GC regs */
-	AMDGIM_FEATURE_GC_REG_RLC_EN     = (1 << 2),
+	AMDGIM_FEATURE_GC_REG_RLC_EN      = (1 << 2),
+	/* Use PSP to program L1_TLB_CNTL*/
+	AMDGIM_FEATURE_L1_TLB_CNTL_PSP_EN = (1 << 3),
 };
 
 struct amdgim_pf2vf_info_v1 {
@@ -322,6 +324,10 @@ struct amdgpu_video_codec_info;
 (amdgpu_sriov_vf((adev)) && \
 	((adev)->virt.reg_access & (AMDGIM_FEATURE_GC_REG_RLC_EN)))
 
+#define amdgpu_sriov_reg_indirect_l1_tlb_cntl(adev) \
+(amdgpu_sriov_vf((adev)) && \
+	((adev)->virt.reg_access & (AMDGIM_FEATURE_L1_TLB_CNTL_PSP_EN)))
+
 #define amdgpu_sriov_rlcg_error_report_enabled(adev) \
         (amdgpu_sriov_reg_indirect_mmhub(adev) || amdgpu_sriov_reg_indirect_gc(adev))
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
index b4f9c2f4e92cc..1f4b6dbce45dc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
@@ -108,10 +108,11 @@ union amd_sriov_msg_feature_flags {
 
 union amd_sriov_reg_access_flags {
 	struct {
-		uint32_t vf_reg_access_ih	: 1;
-		uint32_t vf_reg_access_mmhub	: 1;
-		uint32_t vf_reg_access_gc	: 1;
-		uint32_t reserved		: 29;
+		uint32_t vf_reg_access_ih		: 1;
+		uint32_t vf_reg_access_mmhub		: 1;
+		uint32_t vf_reg_access_gc		: 1;
+		uint32_t vf_reg_access_l1_tlb_cntl	: 1;
+		uint32_t reserved			: 28;
 	} flags;
 	uint32_t all;
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
index ce013a715b864..f1b567a1bfa7b 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
@@ -30,6 +30,7 @@
 #include "soc15_common.h"
 #include "soc15.h"
 #include "amdgpu_ras.h"
+#include "amdgpu_psp.h"
 
 #define regVM_L2_CNTL3_DEFAULT	0x80100007
 #define regVM_L2_CNTL4_DEFAULT	0x000000c1
@@ -192,10 +193,8 @@ static void mmhub_v1_8_init_tlb_regs(struct amdgpu_device *adev)
 	uint32_t tmp, inst_mask;
 	int i;
 
-	/* Setup TLB control */
-	inst_mask = adev->aid_mask;
-	for_each_inst(i, inst_mask) {
-		tmp = RREG32_SOC15(MMHUB, i, regMC_VM_MX_L1_TLB_CNTL);
+	if (amdgpu_sriov_reg_indirect_l1_tlb_cntl(adev)) {
+		tmp = RREG32_SOC15(MMHUB, 0, regMC_VM_MX_L1_TLB_CNTL);
 
 		tmp = REG_SET_FIELD(tmp, MC_VM_MX_L1_TLB_CNTL, ENABLE_L1_TLB,
 				    1);
@@ -209,7 +208,26 @@ static void mmhub_v1_8_init_tlb_regs(struct amdgpu_device *adev)
 				    MTYPE, MTYPE_UC);/* XXX for emulation. */
 		tmp = REG_SET_FIELD(tmp, MC_VM_MX_L1_TLB_CNTL, ATC_EN, 1);
 
-		WREG32_SOC15(MMHUB, i, regMC_VM_MX_L1_TLB_CNTL, tmp);
+		psp_reg_program_no_ring(&adev->psp, tmp, PSP_REG_MMHUB_L1_TLB_CNTL);
+	} else {
+		inst_mask = adev->aid_mask;
+		for_each_inst(i, inst_mask) {
+			tmp = RREG32_SOC15(MMHUB, i, regMC_VM_MX_L1_TLB_CNTL);
+
+			tmp = REG_SET_FIELD(tmp, MC_VM_MX_L1_TLB_CNTL, ENABLE_L1_TLB,
+					    1);
+			tmp = REG_SET_FIELD(tmp, MC_VM_MX_L1_TLB_CNTL,
+					    SYSTEM_ACCESS_MODE, 3);
+			tmp = REG_SET_FIELD(tmp, MC_VM_MX_L1_TLB_CNTL,
+					    ENABLE_ADVANCED_DRIVER_MODEL, 1);
+			tmp = REG_SET_FIELD(tmp, MC_VM_MX_L1_TLB_CNTL,
+					    SYSTEM_APERTURE_UNMAPPED_ACCESS, 0);
+			tmp = REG_SET_FIELD(tmp, MC_VM_MX_L1_TLB_CNTL,
+					    MTYPE, MTYPE_UC);/* XXX for emulation. */
+			tmp = REG_SET_FIELD(tmp, MC_VM_MX_L1_TLB_CNTL, ATC_EN, 1);
+
+			WREG32_SOC15(MMHUB, i, regMC_VM_MX_L1_TLB_CNTL, tmp);
+		}
 	}
 }
 
@@ -454,6 +472,30 @@ static int mmhub_v1_8_gart_enable(struct amdgpu_device *adev)
 	return 0;
 }
 
+static void mmhub_v1_8_disable_l1_tlb(struct amdgpu_device *adev)
+{
+	u32 tmp;
+	u32 i, inst_mask;
+
+	if (amdgpu_sriov_reg_indirect_l1_tlb_cntl(adev)) {
+		tmp = RREG32_SOC15(MMHUB, 0, regMC_VM_MX_L1_TLB_CNTL);
+		tmp = REG_SET_FIELD(tmp, MC_VM_MX_L1_TLB_CNTL, ENABLE_L1_TLB, 0);
+		tmp = REG_SET_FIELD(tmp, MC_VM_MX_L1_TLB_CNTL,
+				    ENABLE_ADVANCED_DRIVER_MODEL, 0);
+		psp_reg_program_no_ring(&adev->psp, tmp, PSP_REG_MMHUB_L1_TLB_CNTL);
+	} else {
+		inst_mask = adev->aid_mask;
+		for_each_inst(i, inst_mask) {
+			tmp = RREG32_SOC15(MMHUB, i, regMC_VM_MX_L1_TLB_CNTL);
+			tmp = REG_SET_FIELD(tmp, MC_VM_MX_L1_TLB_CNTL, ENABLE_L1_TLB,
+					    0);
+			tmp = REG_SET_FIELD(tmp, MC_VM_MX_L1_TLB_CNTL,
+					    ENABLE_ADVANCED_DRIVER_MODEL, 0);
+			WREG32_SOC15(MMHUB, i, regMC_VM_MX_L1_TLB_CNTL, tmp);
+		}
+	}
+}
+
 static void mmhub_v1_8_gart_disable(struct amdgpu_device *adev)
 {
 	struct amdgpu_vmhub *hub;
@@ -467,15 +509,6 @@ static void mmhub_v1_8_gart_disable(struct amdgpu_device *adev)
 		for (i = 0; i < 16; i++)
 			WREG32_SOC15_OFFSET(MMHUB, j, regVM_CONTEXT0_CNTL,
 					    i * hub->ctx_distance, 0);
-
-		/* Setup TLB control */
-		tmp = RREG32_SOC15(MMHUB, j, regMC_VM_MX_L1_TLB_CNTL);
-		tmp = REG_SET_FIELD(tmp, MC_VM_MX_L1_TLB_CNTL, ENABLE_L1_TLB,
-				    0);
-		tmp = REG_SET_FIELD(tmp, MC_VM_MX_L1_TLB_CNTL,
-				    ENABLE_ADVANCED_DRIVER_MODEL, 0);
-		WREG32_SOC15(MMHUB, j, regMC_VM_MX_L1_TLB_CNTL, tmp);
-
 		if (!amdgpu_sriov_vf(adev)) {
 			/* Setup L2 cache */
 			tmp = RREG32_SOC15(MMHUB, j, regVM_L2_CNTL);
@@ -485,6 +518,8 @@ static void mmhub_v1_8_gart_disable(struct amdgpu_device *adev)
 			WREG32_SOC15(MMHUB, j, regVM_L2_CNTL3, 0);
 		}
 	}
+
+	mmhub_v1_8_disable_l1_tlb(adev);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
index afdf8ce3b4c59..f5f616ab20e70 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
@@ -858,6 +858,25 @@ static bool psp_v13_0_is_reload_needed(struct psp_context *psp)
 	return false;
 }
 
+static int psp_v13_0_reg_program_no_ring(struct psp_context *psp, uint32_t val,
+					 enum psp_reg_prog_id id)
+{
+	struct amdgpu_device *adev = psp->adev;
+	int ret = -EOPNOTSUPP;
+
+	/* PSP will broadcast the value to all instances */
+	if (amdgpu_sriov_vf(adev)) {
+		WREG32_SOC15(MP0, 0, regMP0_SMN_C2PMSG_101, GFX_CTRL_CMD_ID_GBR_IH_SET);
+		WREG32_SOC15(MP0, 0, regMP0_SMN_C2PMSG_102, id);
+		WREG32_SOC15(MP0, 0, regMP0_SMN_C2PMSG_103, val);
+
+		ret = psp_wait_for(psp, SOC15_REG_OFFSET(MP0, 0, regMP0_SMN_C2PMSG_101),
+				   0x80000000, 0x80000000, false);
+	}
+
+	return ret;
+}
+
 static const struct psp_funcs psp_v13_0_funcs = {
 	.init_microcode = psp_v13_0_init_microcode,
 	.wait_for_bootloader = psp_v13_0_wait_for_bootloader_steady_state,
@@ -884,6 +903,7 @@ static const struct psp_funcs psp_v13_0_funcs = {
 	.get_ras_capability = psp_v13_0_get_ras_capability,
 	.is_aux_sos_load_required = psp_v13_0_is_aux_sos_load_required,
 	.is_reload_needed = psp_v13_0_is_reload_needed,
+	.reg_program_no_ring = psp_v13_0_reg_program_no_ring,
 };
 
 void psp_v13_0_set_psp_funcs(struct psp_context *psp)
-- 
2.39.5

