Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B31AA9F7F
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1649C10E46E;
	Mon,  5 May 2025 22:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bZhEVazT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7674510E470;
 Mon,  5 May 2025 22:24:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 149ADA4CCF7;
 Mon,  5 May 2025 22:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D33C4CEE4;
 Mon,  5 May 2025 22:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746483849;
 bh=Ld3pKOgFN8CKZPNvrJcEJx12Xz3TyuwsxI61Z8Vrn7A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bZhEVazT+/r0+6nSU2G9fbU+Y9TZPyR4nWrjBNia328LuXEXjW2teoikwYY3ZoJqo
 qsLznRMoiohFOPd6/qxSmISs9goWvs6t0Lhlcl3PQdwuJsPpuLu2SMResFyMO1TnDb
 pBTI9kqrRfH/iy276ySZf+b92Ci70MfjlBTxv0V9kxMeFuCTLlpiaJQZdqNsAp4tM3
 TcvqZzMvSRgh53b/tdWL/aVZ0i5E0CpBblVQCsIDGfxCuwnFHL1hs2sTYeZtxCY/tc
 cd++q9qpGQjw4uM6FI8NSOEBHag7/52dQqJM2CNQwBFUJUVRFECcOMefzNQFWvJFYf
 PDVm1tlsPhGow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexandre Demers <alexandre.f.demers@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 sunil.khatri@amd.com, boyuan.zhang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 248/642] drm/amdgpu: add dce_v6_0_soft_reset() to
 DCE6
Date: Mon,  5 May 2025 18:07:44 -0400
Message-Id: <20250505221419.2672473-248-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Alexandre Demers <alexandre.f.demers@gmail.com>

[ Upstream commit ab23db6d08efdda5d13d01a66c593d0e57f8917f ]

DCE6 was missing soft reset, but it was easily identifiable under radeon.
This should be it, pretty much as it is done under DCE8 and DCE10.

Signed-off-by: Alexandre Demers <alexandre.f.demers@gmail.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 53 ++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index 915804a6a1d7d..ed5e06b677df1 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -370,13 +370,41 @@ static u32 dce_v6_0_hpd_get_gpio_reg(struct amdgpu_device *adev)
 	return mmDC_GPIO_HPD_A;
 }
 
+static bool dce_v6_0_is_display_hung(struct amdgpu_device *adev)
+{
+	u32 crtc_hung = 0;
+	u32 crtc_status[6];
+	u32 i, j, tmp;
+
+	for (i = 0; i < adev->mode_info.num_crtc; i++) {
+		if (RREG32(mmCRTC_CONTROL + crtc_offsets[i]) & CRTC_CONTROL__CRTC_MASTER_EN_MASK) {
+			crtc_status[i] = RREG32(mmCRTC_STATUS_HV_COUNT + crtc_offsets[i]);
+			crtc_hung |= (1 << i);
+		}
+	}
+
+	for (j = 0; j < 10; j++) {
+		for (i = 0; i < adev->mode_info.num_crtc; i++) {
+			if (crtc_hung & (1 << i)) {
+				tmp = RREG32(mmCRTC_STATUS_HV_COUNT + crtc_offsets[i]);
+				if (tmp != crtc_status[i])
+					crtc_hung &= ~(1 << i);
+			}
+		}
+		if (crtc_hung == 0)
+			return false;
+		udelay(100);
+	}
+
+	return true;
+}
+
 static void dce_v6_0_set_vga_render_state(struct amdgpu_device *adev,
 					  bool render)
 {
 	if (!render)
 		WREG32(mmVGA_RENDER_CONTROL,
 			RREG32(mmVGA_RENDER_CONTROL) & VGA_VSTATUS_CNTL);
-
 }
 
 static int dce_v6_0_get_num_crtc(struct amdgpu_device *adev)
@@ -2872,7 +2900,28 @@ static bool dce_v6_0_is_idle(void *handle)
 
 static int dce_v6_0_soft_reset(struct amdgpu_ip_block *ip_block)
 {
-	DRM_INFO("xxxx: dce_v6_0_soft_reset --- no impl!!\n");
+	u32 srbm_soft_reset = 0, tmp;
+	struct amdgpu_device *adev = ip_block->adev;
+
+	if (dce_v6_0_is_display_hung(adev))
+		srbm_soft_reset |= SRBM_SOFT_RESET__SOFT_RESET_DC_MASK;
+
+	if (srbm_soft_reset) {
+		tmp = RREG32(mmSRBM_SOFT_RESET);
+		tmp |= srbm_soft_reset;
+		dev_info(adev->dev, "SRBM_SOFT_RESET=0x%08X\n", tmp);
+		WREG32(mmSRBM_SOFT_RESET, tmp);
+		tmp = RREG32(mmSRBM_SOFT_RESET);
+
+		udelay(50);
+
+		tmp &= ~srbm_soft_reset;
+		WREG32(mmSRBM_SOFT_RESET, tmp);
+		tmp = RREG32(mmSRBM_SOFT_RESET);
+
+		/* Wait a little for things to settle down */
+		udelay(50);
+	}
 	return 0;
 }
 
-- 
2.39.5

