Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC72943A9B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F87710E749;
	Thu,  1 Aug 2024 00:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gAuCpQan";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8828C10E75B;
 Thu,  1 Aug 2024 00:17:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 01DB86246A;
 Thu,  1 Aug 2024 00:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1EAC4AF0E;
 Thu,  1 Aug 2024 00:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471441;
 bh=pC+GNYtOW75YVqGZ4bYScRzaCNjNeIHNIryyxjWUm3Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gAuCpQanFVaa/0Q3WPLOH3HXjjc3JULIbDvOFRQ1AF3+TTp7BNtLsR9DUaiypnnm1
 9qlm3qRGLi8W9ybzORIFBBLy3+cN6A8C2+anj0XF3n1TYm3d0sq6zdFIKL7n0/BJJq
 WhHp9KFtKziA7VJPLJ+4nZAMjple/wz9V68E5lHFsWXFJLsWGsGnD1An3oeU0VGOMg
 b01OI+X8idNTGwmZL5nzrP0SJ1/BFEvvdFOT0jQZrIxUgF6e/hbZIqGxEtBlL7DggC
 THEY/Hyn6FlwcBFSdlxgBtqDWJafZrAWCI0SoS1/xqKZvpoprzbUCIzIYbCjBVwblE
 A01aNumNwhrFw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Zhigang.Luo@amd.com, yifan1.zhang@amd.com,
 lijo.lazar@amd.com, victorchengchi.lu@amd.com, Felix.Kuehling@amd.com,
 srinivasan.shanmugam@amd.com, David.Francis@amd.com,
 kevinyang.wang@amd.com, lang.yu@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 097/121] drm/amdgpu: Fix register access violation
Date: Wed, 31 Jul 2024 20:00:35 -0400
Message-ID: <20240801000834.3930818-97-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: Hawking Zhang <Hawking.Zhang@amd.com>

[ Upstream commit 9da0f7736763aa0fbf63bb15060c6827135f3f67 ]

fault_status is read only register. fault_cntl
is not accessible from guest environment.

Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c | 8 +++++---
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c    | 3 ++-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c  | 8 +++++---
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c
index 77df8c9cbad2f..9e10e552952e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c
@@ -627,9 +627,11 @@ static bool gfxhub_v1_2_query_utcl2_poison_status(struct amdgpu_device *adev,
 
 	status = RREG32_SOC15(GC, GET_INST(GC, xcc_id), regVM_L2_PROTECTION_FAULT_STATUS);
 	fed = REG_GET_FIELD(status, VM_L2_PROTECTION_FAULT_STATUS, FED);
-	/* reset page fault status */
-	WREG32_P(SOC15_REG_OFFSET(GC, GET_INST(GC, xcc_id),
-			regVM_L2_PROTECTION_FAULT_STATUS), 1, ~1);
+	if (!amdgpu_sriov_vf(adev)) {
+		/* clear page fault status and address */
+		WREG32_P(SOC15_REG_OFFSET(GC, GET_INST(GC, xcc_id),
+			 regVM_L2_PROTECTION_FAULT_CNTL), 1, ~1);
+	}
 
 	return fed;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index c4ec1358f3aa6..67f36a79c6f41 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -671,7 +671,8 @@ static int gmc_v9_0_process_interrupt(struct amdgpu_device *adev,
 	    (amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(9, 4, 2)))
 		return 0;
 
-	WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
+	if (!amdgpu_sriov_vf(adev))
+		WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
 
 	amdgpu_vm_update_fault_cache(adev, entry->pasid, addr, status, vmhub);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
index 7a1ff298417ab..8d7267a013d24 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
@@ -566,9 +566,11 @@ static bool mmhub_v1_8_query_utcl2_poison_status(struct amdgpu_device *adev,
 
 	status = RREG32_SOC15(MMHUB, hub_inst, regVM_L2_PROTECTION_FAULT_STATUS);
 	fed = REG_GET_FIELD(status, VM_L2_PROTECTION_FAULT_STATUS, FED);
-	/* reset page fault status */
-	WREG32_P(SOC15_REG_OFFSET(MMHUB, hub_inst,
-			regVM_L2_PROTECTION_FAULT_STATUS), 1, ~1);
+	if (!amdgpu_sriov_vf(adev)) {
+		/* clear page fault status and address */
+		WREG32_P(SOC15_REG_OFFSET(MMHUB, hub_inst,
+			 regVM_L2_PROTECTION_FAULT_STATUS), 1, ~1);
+	}
 
 	return fed;
 }
-- 
2.43.0

