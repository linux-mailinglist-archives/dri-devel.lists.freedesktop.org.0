Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49293127D23
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 15:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706F889F03;
	Fri, 20 Dec 2019 14:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E9A89F03;
 Fri, 20 Dec 2019 14:34:38 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F66E222C2;
 Fri, 20 Dec 2019 14:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576852478;
 bh=TlR2WqqK0Ry7bCjP+BAR61OL6HBr34gIdzcHX+J1OB4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YyC79cXLBNvf1gHVIhD7mZNNMvLgfGgPYAs/FeKhOMbzyYYZaaVHyi+NRfHAosfjF
 wxBc27/wsGbfKzaT2WQXk5trZ8yJTxknl0WSbVrLNWLRqMa7pkGZhKvGmPsxef6/N9
 bklQPAVGYK4R+Tcstkq1lWuQCp4AvrNfIdD5p1HM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 03/34] drm/amdgpu: add check before
 enabling/disabling broadcast mode
Date: Fri, 20 Dec 2019 09:34:02 -0500
Message-Id: <20191220143433.9922-3-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220143433.9922-1-sashal@kernel.org>
References: <20191220143433.9922-1-sashal@kernel.org>
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
index d5ebe566809b2..a1c941229f4b3 100644
--- a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
+++ b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
@@ -75,23 +75,29 @@ static void df_v3_6_update_medium_grain_clock_gating(struct amdgpu_device *adev,
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
+
+		/* Exit broadcast mode */
+		adev->df_funcs->enable_broadcast_mode(adev, false);
 	}
-
-	/* Exit broadcast mode */
-	adev->df_funcs->enable_broadcast_mode(adev, false);
 }
 
 static void df_v3_6_get_clockgating_state(struct amdgpu_device *adev,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
