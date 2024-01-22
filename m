Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E088366F2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF4C10F31B;
	Mon, 22 Jan 2024 15:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334FB10F31B;
 Mon, 22 Jan 2024 15:09:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A8FBCCE2B12;
 Mon, 22 Jan 2024 15:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54354C433C7;
 Mon, 22 Jan 2024 15:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936127;
 bh=+CW9IM8BI24UbBbddwTRFs3HHOxKhMu6a/7dShSrAd8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tzmSmH5GLj4tvwuBb8wPNsYdRdL/mLjiErmbvkNpWSPaqP8Bzrs3/PH9hF35Pdd3Z
 upIOQnoi/V3owI3hbvaM9vkr9pWhbOE4gXTK5nfgiD41RVAOGg1kmw6kHeXchnmAwT
 OAd7+9CN0yxxl9SDZQHSmkNOp1upRC1NLxuhjTw4nTJ2RXGOg7mbye4nicmXNswF5N
 JhBvdONkrsqV5J3sPqWX8fWjxTXaDLxV52rrXH1q5uRaDl+x6ffNoSN8LlW7XOG/3X
 Rkd8fFk8TUPtUJQkIiLGppXf/+b5s+9+6HkYXcaFtPX2UFIEWrEikVIG36WFxuvAcX
 ElB/vYuzqs1dg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 69/73] drm/amdgpu: apply the RV2 system aperture
 fix to RN/CZN as well
Date: Mon, 22 Jan 2024 10:02:23 -0500
Message-ID: <20240122150432.992458-69-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122150432.992458-1-sashal@kernel.org>
References: <20240122150432.992458-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.13
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
index cdc290a474a9..66c6bab75f8a 100644
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
index 0834af771549..b50f24f7ea5c 100644
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
index fb91b31056ca..d25f87fb1971 100644
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
index ca3aa9825eb8..56a410accf49 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1247,7 +1247,9 @@ static void mmhub_read_system_context(struct amdgpu_device *adev, struct dc_phy_
 	/* AGP aperture is disabled */
 	if (agp_bot == agp_top) {
 		logical_addr_low = adev->gmc.fb_start >> 18;
-		if (adev->apu_flags & AMD_APU_IS_RAVEN2)
+		if (adev->apu_flags & (AMD_APU_IS_RAVEN2 |
+				       AMD_APU_IS_RENOIR |
+				       AMD_APU_IS_GREEN_SARDINE))
 			/*
 			 * Raven2 has a HW issue that it is unable to use the vram which
 			 * is out of MC_VM_SYSTEM_APERTURE_HIGH_ADDR. So here is the
@@ -1259,7 +1261,9 @@ static void mmhub_read_system_context(struct amdgpu_device *adev, struct dc_phy_
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

