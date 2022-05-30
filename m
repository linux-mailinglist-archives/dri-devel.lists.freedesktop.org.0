Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B55537B88
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B0E10E869;
	Mon, 30 May 2022 13:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E41610E869;
 Mon, 30 May 2022 13:26:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B6E860EC3;
 Mon, 30 May 2022 13:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C78C385B8;
 Mon, 30 May 2022 13:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653917217;
 bh=uGxBakii2rIG+iogD6UuanWdzvcp4zMwBqkxmY5yAyg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m9BZltpesy5bDsFmY/Kc1/2xMZDDDGwNvn7ChI0HJJPV9IeQ0iK2gOZhjMv+Y5VrZ
 qfvERYTlGn38ibw9Kai16gR7tTNULRo+4nX7xsjSLOL3DuVO//tzADIAz6ryRs/pDD
 jJ7doSZPaj/R+hGKIegilFgVeXvBMCRVXka5BCxrjHIqrYA5QqTYDMAy+vSlHYNDRM
 ViC9D8xkSh+aSdIvIUV2TIH5+1tXR6CvymtMh8hq9pbaivgQOSEBq8BixwS+JdmB5D
 K29cME7Yym+VNxUL3N6DRCBuEHSb2B1BnsTZ4+1WGkaBqsAtJfv2YXrSYuwmlu8ATU
 HEV3EHNO8xRng==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 059/159] drm/amdgpu/sdma: Fix incorrect
 calculations of the wptr of the doorbells
Date: Mon, 30 May 2022 09:22:44 -0400
Message-Id: <20220530132425.1929512-59-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530132425.1929512-1-sashal@kernel.org>
References: <20220530132425.1929512-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, Jack.Xiao@amd.com, tao.zhou1@amd.com,
 airlied@linux.ie, Bokun.Zhang@amd.com, dri-devel@lists.freedesktop.org,
 Xinhui.Pan@amd.com, Haohui Mai <ricetons@gmail.com>,
 amd-gfx@lists.freedesktop.org, rajib.mahapatra@amd.com, Prike.Liang@amd.com,
 YiPeng.Chai@amd.com, rohit.khaire@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com, Lang.Yu@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Haohui Mai <ricetons@gmail.com>

[ Upstream commit 7dba6e838e741caadcf27ef717b6dcb561e77f89 ]

This patch fixes the issue where the driver miscomputes the 64-bit
values of the wptr of the SDMA doorbell when initializing the
hardware. SDMA engines v4 and later on have full 64-bit registers for
wptr thus they should be set properly.

Older generation hardwares like CIK / SI have only 16 / 20 / 24bits
for the WPTR, where the calls of lower_32_bits() will be removed in a
following patch.

Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Haohui Mai <ricetons@gmail.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c | 4 ++--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c | 8 ++++----
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index d7e8f7232364..ff86c43b63d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -772,8 +772,8 @@ static void sdma_v4_0_ring_set_wptr(struct amdgpu_ring *ring)
 
 		DRM_DEBUG("Using doorbell -- "
 				"wptr_offs == 0x%08x "
-				"lower_32_bits(ring->wptr) << 2 == 0x%08x "
-				"upper_32_bits(ring->wptr) << 2 == 0x%08x\n",
+				"lower_32_bits(ring->wptr << 2) == 0x%08x "
+				"upper_32_bits(ring->wptr << 2) == 0x%08x\n",
 				ring->wptr_offs,
 				lower_32_bits(ring->wptr << 2),
 				upper_32_bits(ring->wptr << 2));
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index a8d49c005f73..627eb1f147c2 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -394,8 +394,8 @@ static void sdma_v5_0_ring_set_wptr(struct amdgpu_ring *ring)
 	if (ring->use_doorbell) {
 		DRM_DEBUG("Using doorbell -- "
 				"wptr_offs == 0x%08x "
-				"lower_32_bits(ring->wptr) << 2 == 0x%08x "
-				"upper_32_bits(ring->wptr) << 2 == 0x%08x\n",
+				"lower_32_bits(ring->wptr << 2) == 0x%08x "
+				"upper_32_bits(ring->wptr << 2) == 0x%08x\n",
 				ring->wptr_offs,
 				lower_32_bits(ring->wptr << 2),
 				upper_32_bits(ring->wptr << 2));
@@ -774,9 +774,9 @@ static int sdma_v5_0_gfx_resume(struct amdgpu_device *adev)
 
 		if (!amdgpu_sriov_vf(adev)) { /* only bare-metal use register write for wptr */
 			WREG32(sdma_v5_0_get_reg_offset(adev, i, mmSDMA0_GFX_RB_WPTR),
-			       lower_32_bits(ring->wptr) << 2);
+			       lower_32_bits(ring->wptr << 2));
 			WREG32(sdma_v5_0_get_reg_offset(adev, i, mmSDMA0_GFX_RB_WPTR_HI),
-			       upper_32_bits(ring->wptr) << 2);
+			       upper_32_bits(ring->wptr << 2));
 		}
 
 		doorbell = RREG32_SOC15_IP(GC, sdma_v5_0_get_reg_offset(adev, i, mmSDMA0_GFX_DOORBELL));
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 824eace69884..a5eb82bfeaa8 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -295,8 +295,8 @@ static void sdma_v5_2_ring_set_wptr(struct amdgpu_ring *ring)
 	if (ring->use_doorbell) {
 		DRM_DEBUG("Using doorbell -- "
 				"wptr_offs == 0x%08x "
-				"lower_32_bits(ring->wptr) << 2 == 0x%08x "
-				"upper_32_bits(ring->wptr) << 2 == 0x%08x\n",
+				"lower_32_bits(ring->wptr << 2) == 0x%08x "
+				"upper_32_bits(ring->wptr << 2) == 0x%08x\n",
 				ring->wptr_offs,
 				lower_32_bits(ring->wptr << 2),
 				upper_32_bits(ring->wptr << 2));
@@ -672,8 +672,8 @@ static int sdma_v5_2_gfx_resume(struct amdgpu_device *adev)
 		WREG32_SOC15_IP(GC, sdma_v5_2_get_reg_offset(adev, i, mmSDMA0_GFX_MINOR_PTR_UPDATE), 1);
 
 		if (!amdgpu_sriov_vf(adev)) { /* only bare-metal use register write for wptr */
-			WREG32(sdma_v5_2_get_reg_offset(adev, i, mmSDMA0_GFX_RB_WPTR), lower_32_bits(ring->wptr) << 2);
-			WREG32(sdma_v5_2_get_reg_offset(adev, i, mmSDMA0_GFX_RB_WPTR_HI), upper_32_bits(ring->wptr) << 2);
+			WREG32(sdma_v5_2_get_reg_offset(adev, i, mmSDMA0_GFX_RB_WPTR), lower_32_bits(ring->wptr << 2));
+			WREG32(sdma_v5_2_get_reg_offset(adev, i, mmSDMA0_GFX_RB_WPTR_HI), upper_32_bits(ring->wptr << 2));
 		}
 
 		doorbell = RREG32_SOC15_IP(GC, sdma_v5_2_get_reg_offset(adev, i, mmSDMA0_GFX_DOORBELL));
-- 
2.35.1

