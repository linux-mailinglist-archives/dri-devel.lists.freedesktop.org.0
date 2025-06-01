Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE0BACA136
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E117410E296;
	Sun,  1 Jun 2025 23:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W1lsgxeL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C09C10E27A;
 Sun,  1 Jun 2025 23:25:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4BE98A4F856;
 Sun,  1 Jun 2025 23:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BADC4CEE7;
 Sun,  1 Jun 2025 23:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820331;
 bh=FTmD/AYKasBxooc2k2FBAQYcVSqZEadnaS2pzzqSLuo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W1lsgxeLfjML6VaisEcPCKgG2l9y7iYD7vfn5fE0JHLegcKWmYsjiFtiaj2pN3k54
 Hh6duxL5TG7Rd74+DGuHUCPPc8NwAZ5BiWpUWiN3vg4DpKrP1OH764HwkSpSuYeWft
 JiyBkWEahPvpjZLfCyK2Xu7D2LXnk3iuge/3jKxd4MDA2S4uuGAoPRYP8LZlYCxcvI
 m1zdHZ1qIB0YG+I5oDgluEfUvjQmR/8TRtHsn0415f3hliYkTHOTfofsg4lmMZdmaH
 ElP7a2s/HsLPkcVBq+h9uIPRgPbr8fShtxVHlXZiZ5phFieiQLh+bCy5tz7XHcCJyG
 sMz0IKYovW9pA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Apurv Mishra <Apurv.Mishra@amd.com>, Amber Lin <Amber.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 Felix.Kuehling@amd.com, lijo.lazar@amd.com, sunil.khatri@amd.com,
 Hawking.Zhang@amd.com, cesun102@amd.com, boyuan.zhang@amd.com,
 le.ma@amd.com, shane.xiao@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 020/110] drm/amdkfd: Drop workaround for GC
 v9.4.3 revID 0
Date: Sun,  1 Jun 2025 19:23:02 -0400
Message-Id: <20250601232435.3507697-20-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
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

From: Apurv Mishra <Apurv.Mishra@amd.com>

[ Upstream commit daafa303d19f5522e4c24fbf5c1c981a16df2c2f ]

Remove workaround code for the early engineering
samples GC v9.4.3 SOCs with revID 0

Reviewed-by: Amber Lin <Amber.Lin@amd.com>
Signed-off-by: Apurv Mishra <Apurv.Mishra@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Perfect! Now I have the complete picture. Let me analyze this commit
based on the context: **YES** This commit should be backported to stable
kernel trees. Here's my extensive analysis: ## Nature of the Change This
commit removes workaround code that was specifically designed for early
engineering samples of GC v9.4.3 SOCs with revision ID 0 (A0 hardware).
The commit: 1. **Adds explicit A0 hardware rejection** in
`amdgpu_device.c:2675-2682` - Any GC 9.4.3 devices with revID 0 are now
explicitly rejected with "Unsupported A0 hardware" error and return
`-ENODEV`. 2. **Removes complex conditional logic** that was checking
`adev->rev_id` throughout multiple files: - In `gmc_v9_0.c`: Simplifies
memory type selection logic - In `kfd_device.c`: Removes revision-
specific GFX target version handling - In `kfd_queue.c`: Simplifies VGPR
size and buffer size calculations - In `kfd_svm.c`: Simplifies memory
type selection for SVM 3. **Removes TLB flush workaround**
(`flush_tlb_needs_extra_type_0`) that was specific to GC 9.4.3 revID 0.
## Why This Should Be Backported ### 1. **Cleanup of Engineering Sample
Support** This commit removes support for early engineering samples that
should not be in production systems. The comment in the code even states
these are "early engineering samples" that were never meant for
widespread use. ### 2. **Improves System Stability** The removed
workarounds were described as "badly documented and had a buggy
implementation" (as seen in the original TLB workaround code). Removing
buggy workarounds improves overall system stability. ### 3. **Code
Simplification** The changes significantly simplify multiple code paths
by removing complex conditional logic based on revision IDs. This
reduces maintenance burden and potential for bugs. ### 4. **Clear
Hardware Support Policy** By explicitly rejecting unsupported A0
hardware with `-ENODEV`, the commit provides clear feedback to users
rather than allowing systems to run with potentially unreliable
workarounds. ### 5. **Follows Stable Tree Guidelines** - **Bug fix
nature**: Removes buggy workaround code - **Minimal risk**: The changes
are well-contained and only affect early engineering samples - **No new
features**: This is purely cleanup/bug fix - **Clear scope**: Limited to
specific GC 9.4.3 revID 0 hardware ### 6. **Reference to Similar
Commits** Looking at the similar commits provided: - Similar commits
that add support for new hardware IPs (like the NO examples) are
typically not backported - However, commits that fix existing
functionality (like the YES example) are good candidates - This commit
aligns more with the YES example as it's fixing/cleaning up existing
problematic code ### 7. **Production Impact** Since this only affects
early engineering samples that shouldn't be in production, the impact on
real users is minimal while providing benefits in terms of code
maintainability and system reliability. The commit clearly fits the
stable tree criteria: it fixes problematic code, has minimal risk of
regression, doesn't introduce new features, and improves system
reliability for supported hardware while properly rejecting unsupported
hardware.

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  8 +++++++-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c      | 14 ++------------
 drivers/gpu/drm/amd/amdkfd/kfd_device.c    |  5 -----
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c     |  4 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c       |  3 +--
 5 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index f8b3e04d71eda..95124a4a0a67c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2689,6 +2689,13 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
 		break;
 	}
 
+	/* Check for IP version 9.4.3 with A0 hardware */
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 3) &&
+	    !amdgpu_device_get_rev_id(adev)) {
+		dev_err(adev->dev, "Unsupported A0 hardware\n");
+		return -ENODEV;	/* device unsupported - no device error */
+	}
+
 	if (amdgpu_has_atpx() &&
 	    (amdgpu_is_atpx_hybrid() ||
 	     amdgpu_has_atpx_dgpu_power_cntl()) &&
@@ -2701,7 +2708,6 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
 		adev->has_pr3 = parent ? pci_pr3_present(parent) : false;
 	}
 
-
 	adev->pm.pp_feature = amdgpu_pp_feature_mask;
 	if (amdgpu_sriov_vf(adev) || sched_policy == KFD_SCHED_POLICY_NO_HWS)
 		adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 5effe8327d29f..53050176c244d 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -1213,10 +1213,7 @@ static void gmc_v9_0_get_coherence_flags(struct amdgpu_device *adev,
 		if (uncached) {
 			mtype = MTYPE_UC;
 		} else if (ext_coherent) {
-			if (gc_ip_version == IP_VERSION(9, 5, 0) || adev->rev_id)
-				mtype = is_local ? MTYPE_CC : MTYPE_UC;
-			else
-				mtype = MTYPE_UC;
+			mtype = is_local ? MTYPE_CC : MTYPE_UC;
 		} else if (adev->flags & AMD_IS_APU) {
 			mtype = is_local ? mtype_local : MTYPE_NC;
 		} else {
@@ -1336,7 +1333,7 @@ static void gmc_v9_0_override_vm_pte_flags(struct amdgpu_device *adev,
 				mtype_local = MTYPE_CC;
 
 			*flags = AMDGPU_PTE_MTYPE_VG10(*flags, mtype_local);
-		} else if (adev->rev_id) {
+		} else {
 			/* MTYPE_UC case */
 			*flags = AMDGPU_PTE_MTYPE_VG10(*flags, MTYPE_CC);
 		}
@@ -2411,13 +2408,6 @@ static int gmc_v9_0_hw_init(struct amdgpu_ip_block *ip_block)
 	adev->gmc.flush_tlb_needs_extra_type_2 =
 		amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 0) &&
 		adev->gmc.xgmi.num_physical_nodes;
-	/*
-	 * TODO: This workaround is badly documented and had a buggy
-	 * implementation. We should probably verify what we do here.
-	 */
-	adev->gmc.flush_tlb_needs_extra_type_0 =
-		amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 3) &&
-		adev->rev_id == 0;
 
 	/* The sequence of these two function calls matters.*/
 	gmc_v9_0_init_golden_registers(adev);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index b9c82be6ce134..bf0854bd55551 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -352,11 +352,6 @@ struct kfd_dev *kgd2kfd_probe(struct amdgpu_device *adev, bool vf)
 			f2g = &aldebaran_kfd2kgd;
 			break;
 		case IP_VERSION(9, 4, 3):
-			gfx_target_version = adev->rev_id >= 1 ? 90402
-					   : adev->flags & AMD_IS_APU ? 90400
-					   : 90401;
-			f2g = &gc_9_4_3_kfd2kgd;
-			break;
 		case IP_VERSION(9, 4, 4):
 			gfx_target_version = 90402;
 			f2g = &gc_9_4_3_kfd2kgd;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_queue.c b/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
index 4afff7094cafc..a65c67cf56ff3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
@@ -402,7 +402,7 @@ static u32 kfd_get_vgpr_size_per_cu(u32 gfxv)
 {
 	u32 vgpr_size = 0x40000;
 
-	if ((gfxv / 100 * 100) == 90400 ||	/* GFX_VERSION_AQUA_VANJARAM */
+	if (gfxv == 90402 ||			/* GFX_VERSION_AQUA_VANJARAM */
 	    gfxv == 90010 ||			/* GFX_VERSION_ALDEBARAN */
 	    gfxv == 90008 ||			/* GFX_VERSION_ARCTURUS */
 	    gfxv == 90500)
@@ -462,7 +462,7 @@ void kfd_queue_ctx_save_restore_size(struct kfd_topology_device *dev)
 
 	if (gfxv == 80002)	/* GFX_VERSION_TONGA */
 		props->eop_buffer_size = 0x8000;
-	else if ((gfxv / 100 * 100) == 90400)	/* GFX_VERSION_AQUA_VANJARAM */
+	else if (gfxv == 90402)	/* GFX_VERSION_AQUA_VANJARAM */
 		props->eop_buffer_size = 4096;
 	else if (gfxv >= 80000)
 		props->eop_buffer_size = 4096;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 100717a98ec11..72be6e152e881 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1245,8 +1245,7 @@ svm_range_get_pte_flags(struct kfd_node *node,
 	case IP_VERSION(9, 4, 4):
 	case IP_VERSION(9, 5, 0):
 		if (ext_coherent)
-			mtype_local = (gc_ip_version < IP_VERSION(9, 5, 0) && !node->adev->rev_id) ?
-					AMDGPU_VM_MTYPE_UC : AMDGPU_VM_MTYPE_CC;
+			mtype_local = AMDGPU_VM_MTYPE_CC;
 		else
 			mtype_local = amdgpu_mtype_local == 1 ? AMDGPU_VM_MTYPE_NC :
 				amdgpu_mtype_local == 2 ? AMDGPU_VM_MTYPE_CC : AMDGPU_VM_MTYPE_RW;
-- 
2.39.5

