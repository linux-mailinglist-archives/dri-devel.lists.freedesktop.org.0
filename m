Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6595A69A4
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9727E10E25A;
	Tue, 30 Aug 2022 17:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B800B10E257;
 Tue, 30 Aug 2022 17:21:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3E1086179D;
 Tue, 30 Aug 2022 17:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35193C433B5;
 Tue, 30 Aug 2022 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661880089;
 bh=5MbtQP/uBiDAzlP/MQTmHh2C6T6vAfc4ERxjYaKaQWE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t578XEnAzSdcg6KGrqD89E6tNZsoFOPOqPVjepen0DzVhEGDxbaIJRjyBj1r8BTGo
 dbg9+r5zTFgckZlXJUhwLW0LV5i/ww0gvNkAjIniVB9uHhieyR4M3B8nvMFsdcUTaf
 HV4D2sBfoD5GTv6O3wUBcy2nFbOZ/M6Y/LoaTJpGwWxhhd8fPPBgfNr4zfV/iV9Gtm
 AgkwUEmCqwjZDjTOE0RbIltVElH786feyMOG3BpSM7AXCjs6/QvrdvpgHLoFpAgqH+
 tbN2V6N43Sltl8oBlH+vQjI2UgcStYSgcM1vDe1KYkf8GSvxPKdrJhPn5wiUIP3CiE
 NCy9TFBQPH6TA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 32/33] drm/amdgpu: add sdma instance check for
 gfx11 CGCG
Date: Tue, 30 Aug 2022 13:18:23 -0400
Message-Id: <20220830171825.580603-32-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830171825.580603-1-sashal@kernel.org>
References: <20220830171825.580603-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Tim Huang <tim.huang@amd.com>,
 Jack.Xiao@amd.com, Joseph.Greathouse@amd.com,
 Yifan Zhang <yifan1.zhang@amd.com>, airlied@linux.ie, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Likun.Gao@amd.com, evan.quan@amd.com, christian.koenig@amd.com,
 dan.carpenter@oracle.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tim Huang <tim.huang@amd.com>

[ Upstream commit 00047c3d967d7ef8adf8bac3c3579294a3bc0bb1 ]

For some ASICs, like GFX IP v11.0.1, only have one SDMA instance,
so not need to configure SDMA1_RLC_CGCG_CTRL for this case.

Signed-off-by: Tim Huang <tim.huang@amd.com>
Reviewed-by: Yifan Zhang <yifan1.zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index a4a6751b1e449..30998ac47707c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -5090,9 +5090,12 @@ static void gfx_v11_0_update_coarse_grain_clock_gating(struct amdgpu_device *ade
 		data = REG_SET_FIELD(data, SDMA0_RLC_CGCG_CTRL, CGCG_INT_ENABLE, 1);
 		WREG32_SOC15(GC, 0, regSDMA0_RLC_CGCG_CTRL, data);
 
-		data = RREG32_SOC15(GC, 0, regSDMA1_RLC_CGCG_CTRL);
-		data = REG_SET_FIELD(data, SDMA1_RLC_CGCG_CTRL, CGCG_INT_ENABLE, 1);
-		WREG32_SOC15(GC, 0, regSDMA1_RLC_CGCG_CTRL, data);
+		/* Some ASICs only have one SDMA instance, not need to configure SDMA1 */
+		if (adev->sdma.num_instances > 1) {
+			data = RREG32_SOC15(GC, 0, regSDMA1_RLC_CGCG_CTRL);
+			data = REG_SET_FIELD(data, SDMA1_RLC_CGCG_CTRL, CGCG_INT_ENABLE, 1);
+			WREG32_SOC15(GC, 0, regSDMA1_RLC_CGCG_CTRL, data);
+		}
 	} else {
 		/* Program RLC_CGCG_CGLS_CTRL */
 		def = data = RREG32_SOC15(GC, 0, regRLC_CGCG_CGLS_CTRL);
@@ -5121,9 +5124,12 @@ static void gfx_v11_0_update_coarse_grain_clock_gating(struct amdgpu_device *ade
 		data &= ~SDMA0_RLC_CGCG_CTRL__CGCG_INT_ENABLE_MASK;
 		WREG32_SOC15(GC, 0, regSDMA0_RLC_CGCG_CTRL, data);
 
-		data = RREG32_SOC15(GC, 0, regSDMA1_RLC_CGCG_CTRL);
-		data &= ~SDMA1_RLC_CGCG_CTRL__CGCG_INT_ENABLE_MASK;
-		WREG32_SOC15(GC, 0, regSDMA1_RLC_CGCG_CTRL, data);
+		/* Some ASICs only have one SDMA instance, not need to configure SDMA1 */
+		if (adev->sdma.num_instances > 1) {
+			data = RREG32_SOC15(GC, 0, regSDMA1_RLC_CGCG_CTRL);
+			data &= ~SDMA1_RLC_CGCG_CTRL__CGCG_INT_ENABLE_MASK;
+			WREG32_SOC15(GC, 0, regSDMA1_RLC_CGCG_CTRL, data);
+		}
 	}
 }
 
-- 
2.35.1

