Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 151AA127C8F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 15:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D11898CC;
	Fri, 20 Dec 2019 14:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0986A897F3;
 Fri, 20 Dec 2019 14:30:01 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1023B222C2;
 Fri, 20 Dec 2019 14:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576852200;
 bh=3CFxgb1XYfVRl4xlSUpQXa/2v8fVOtiV7dJcNuwG3bE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OyeQAaiGbJnTIpqiC3/FDOIUZX5W5bar7SIHnHB8M5CPeRqS0muMwfu0otystF90G
 L2f+RpOfkCXMORDbRhX6Q4IDuP2cXjIgQHhkeUSBmH7oSYVnvCw9yk4Ohcc1LNq5ht
 vQP7S0o8SLBTmCf7woNMTDZI71BKhT/1RpJt7Pmo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 04/52] drm/amdgpu: add check before
 enabling/disabling broadcast mode
Date: Fri, 20 Dec 2019 09:29:06 -0500
Message-Id: <20191220142954.9500-4-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220142954.9500-1-sashal@kernel.org>
References: <20191220142954.9500-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Guchun Chen <guchun.chen@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Guchun Chen <guchun.chen@amd.com>

[ Upstream commit 6e807535dae5dbbd53bcc5e81047a20bf5eb08ea ]

When security violation from new vbios happens, data fabric is
risky to stop working. So prevent the direct access to DF
mmFabricConfigAccessControl from the new vbios and onwards.

Signed-off-by: Guchun Chen <guchun.chen@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c | 38 ++++++++++++++++------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
index 5850c8e34caac..97d11d7923514 100644
--- a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
+++ b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
@@ -261,23 +261,29 @@ static void df_v3_6_update_medium_grain_clock_gating(struct amdgpu_device *adev,
 {
 	u32 tmp;
 
-	/* Put DF on broadcast mode */
-	adev->df_funcs->enable_broadcast_mode(adev, true);
-
-	if (enable && (adev->cg_flags & AMD_CG_SUPPORT_DF_MGCG)) {
-		tmp = RREG32_SOC15(DF, 0, mmDF_PIE_AON0_DfGlobalClkGater);
-		tmp &= ~DF_PIE_AON0_DfGlobalClkGater__MGCGMode_MASK;
-		tmp |= DF_V3_6_MGCG_ENABLE_15_CYCLE_DELAY;
-		WREG32_SOC15(DF, 0, mmDF_PIE_AON0_DfGlobalClkGater, tmp);
-	} else {
-		tmp = RREG32_SOC15(DF, 0, mmDF_PIE_AON0_DfGlobalClkGater);
-		tmp &= ~DF_PIE_AON0_DfGlobalClkGater__MGCGMode_MASK;
-		tmp |= DF_V3_6_MGCG_DISABLE;
-		WREG32_SOC15(DF, 0, mmDF_PIE_AON0_DfGlobalClkGater, tmp);
-	}
+	if (adev->cg_flags & AMD_CG_SUPPORT_DF_MGCG) {
+		/* Put DF on broadcast mode */
+		adev->df_funcs->enable_broadcast_mode(adev, true);
+
+		if (enable) {
+			tmp = RREG32_SOC15(DF, 0,
+					mmDF_PIE_AON0_DfGlobalClkGater);
+			tmp &= ~DF_PIE_AON0_DfGlobalClkGater__MGCGMode_MASK;
+			tmp |= DF_V3_6_MGCG_ENABLE_15_CYCLE_DELAY;
+			WREG32_SOC15(DF, 0,
+					mmDF_PIE_AON0_DfGlobalClkGater, tmp);
+		} else {
+			tmp = RREG32_SOC15(DF, 0,
+					mmDF_PIE_AON0_DfGlobalClkGater);
+			tmp &= ~DF_PIE_AON0_DfGlobalClkGater__MGCGMode_MASK;
+			tmp |= DF_V3_6_MGCG_DISABLE;
+			WREG32_SOC15(DF, 0,
+					mmDF_PIE_AON0_DfGlobalClkGater, tmp);
+		}
 
-	/* Exit broadcast mode */
-	adev->df_funcs->enable_broadcast_mode(adev, false);
+		/* Exit broadcast mode */
+		adev->df_funcs->enable_broadcast_mode(adev, false);
+	}
 }
 
 static void df_v3_6_get_clockgating_state(struct amdgpu_device *adev,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
