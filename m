Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BBD836679
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A7210F210;
	Mon, 22 Jan 2024 15:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A11B10F210;
 Mon, 22 Jan 2024 15:02:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 48F9ACE2B12;
 Mon, 22 Jan 2024 15:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CCFDC433C7;
 Mon, 22 Jan 2024 15:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935739;
 bh=9hdCOZDVM1e55sPqaXfj1cjoms03INlYhbcem3byNFY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sxR8+NUmpxIktzQjPPn/oz7e77n2MiTj0CxQXH3KxOjXAbAP+2ucp6CiFIfA9qRjN
 Mq6+j9i6yMap3T1upcVcW5ZrPn36dK3uvE7D8XtfnXFDPpOXPTxVeDvkSKCpe5pcny
 lcp1wU65bkyvVKn6tP9bDOvLYDSdvLr9CONz+I0o+Rr9EH6IshPn9jvpsgsiaaoUwL
 E6udYpu2wHd2QnlZ1PADRDmyTY1oDne8Zli+yGxOUSXuhIWfKzye4UgFbXdDkgf2qg
 Xgf9gJ3iJt/GfPalWZNu67AIioPRi1w7ZcJzw2fY6qJUgm31LnLvYHxnoxLS+AI0Mi
 jsf0WZQ3j9xKA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 84/88] drm/amdgpu: apply the RV2 system aperture
 fix to RN/CZN as well
Date: Mon, 22 Jan 2024 09:51:57 -0500
Message-ID: <20240122145608.990137-84-sashal@kernel.org>
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
Cc: lijo.lazar@amd.com, dri-devel@lists.freedesktop.org,
 victorchengchi.lu@amd.com, hamza.mahfooz@amd.com,
 Jiadong Zhu <Jiadong.Zhu@amd.com>, airlied@gmail.com,
 Sasha Levin <sashal@kernel.org>, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, alex.hung@amd.com, srinivasan.shanmugam@amd.com,
 sunpeng.li@amd.com, le.ma@amd.com, yifan1.zhang@amd.com, Qingqing.Zhuo@amd.com,
 Xinhui.Pan@amd.com, daniel@ffwll.ch, wayne.lin@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, lang.yu@amd.com,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 16783d8ef08448815e149e40c82fc1e1fc41ddbf ]

These chips needs the same fix.  This was previously not seen
on then since the AGP aperture expanded the system aperture,
but this showed up again when AGP was disabled.

Reviewed-and-tested-by: Jiadong Zhu <Jiadong.Zhu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c          | 4 +++-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c          | 4 +++-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c           | 4 +++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 8 ++++++--
 4 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c
index 53a2ba5fcf4b..22175da0e16a 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c
@@ -102,7 +102,9 @@ static void gfxhub_v1_0_init_system_aperture_regs(struct amdgpu_device *adev)
 		WREG32_SOC15_RLC(GC, 0, mmMC_VM_SYSTEM_APERTURE_LOW_ADDR,
 			min(adev->gmc.fb_start, adev->gmc.agp_start) >> 18);
 
-		if (adev->apu_flags & AMD_APU_IS_RAVEN2)
+		if (adev->apu_flags & (AMD_APU_IS_RAVEN2 |
+				       AMD_APU_IS_RENOIR |
+				       AMD_APU_IS_GREEN_SARDINE))
 		       /*
 			* Raven2 has a HW issue that it is unable to use the
 			* vram which is out of MC_VM_SYSTEM_APERTURE_HIGH_ADDR.
diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c
index 55423ff1bb49..95d06da544e2 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c
@@ -139,7 +139,9 @@ gfxhub_v1_2_xcc_init_system_aperture_regs(struct amdgpu_device *adev,
 			WREG32_SOC15_RLC(GC, GET_INST(GC, i), regMC_VM_SYSTEM_APERTURE_LOW_ADDR,
 				min(adev->gmc.fb_start, adev->gmc.agp_start) >> 18);
 
-			if (adev->apu_flags & AMD_APU_IS_RAVEN2)
+			if (adev->apu_flags & (AMD_APU_IS_RAVEN2 |
+					       AMD_APU_IS_RENOIR |
+					       AMD_APU_IS_GREEN_SARDINE))
 			       /*
 				* Raven2 has a HW issue that it is unable to use the
 				* vram which is out of MC_VM_SYSTEM_APERTURE_HIGH_ADDR.
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c
index 843219a91736..e3ddd22aa172 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c
@@ -96,7 +96,9 @@ static void mmhub_v1_0_init_system_aperture_regs(struct amdgpu_device *adev)
 	WREG32_SOC15(MMHUB, 0, mmMC_VM_SYSTEM_APERTURE_LOW_ADDR,
 		     min(adev->gmc.fb_start, adev->gmc.agp_start) >> 18);
 
-	if (adev->apu_flags & AMD_APU_IS_RAVEN2)
+	if (adev->apu_flags & (AMD_APU_IS_RAVEN2 |
+			       AMD_APU_IS_RENOIR |
+			       AMD_APU_IS_GREEN_SARDINE))
 		/*
 		 * Raven2 has a HW issue that it is unable to use the vram which
 		 * is out of MC_VM_SYSTEM_APERTURE_HIGH_ADDR. So here is the
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index cf32502d669f..2ec5705596bf 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1257,7 +1257,9 @@ static void mmhub_read_system_context(struct amdgpu_device *adev, struct dc_phy_
 	/* AGP aperture is disabled */
 	if (agp_bot > agp_top) {
 		logical_addr_low = adev->gmc.fb_start >> 18;
-		if (adev->apu_flags & AMD_APU_IS_RAVEN2)
+		if (adev->apu_flags & (AMD_APU_IS_RAVEN2 |
+				       AMD_APU_IS_RENOIR |
+				       AMD_APU_IS_GREEN_SARDINE))
 			/*
 			 * Raven2 has a HW issue that it is unable to use the vram which
 			 * is out of MC_VM_SYSTEM_APERTURE_HIGH_ADDR. So here is the
@@ -1269,7 +1271,9 @@ static void mmhub_read_system_context(struct amdgpu_device *adev, struct dc_phy_
 			logical_addr_high = adev->gmc.fb_end >> 18;
 	} else {
 		logical_addr_low = min(adev->gmc.fb_start, adev->gmc.agp_start) >> 18;
-		if (adev->apu_flags & AMD_APU_IS_RAVEN2)
+		if (adev->apu_flags & (AMD_APU_IS_RAVEN2 |
+				       AMD_APU_IS_RENOIR |
+				       AMD_APU_IS_GREEN_SARDINE))
 			/*
 			 * Raven2 has a HW issue that it is unable to use the vram which
 			 * is out of MC_VM_SYSTEM_APERTURE_HIGH_ADDR. So here is the
-- 
2.43.0

