Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BF3ACA2AE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EC210E459;
	Sun,  1 Jun 2025 23:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="si9zKA+l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3300610E459;
 Sun,  1 Jun 2025 23:39:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 70243A4FC17;
 Sun,  1 Jun 2025 23:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F32CC4CEF1;
 Sun,  1 Jun 2025 23:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748821158;
 bh=KOOzakZjiUys9KnHnVqwGMM1OeogfPcKbbiujNw2IMU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=si9zKA+liBoQN0fgsswOPVHxsr2LWc5lxGSgScSLRCljD1dxZXRZBHOFfkUjB5wUi
 9oLcsqjTeQe2Xr1UQkkWw3Sgbxu70E6/EMvKvHN2l+42Eo1UOnJ3gjCgYQgPZ46iBu
 3RM2+/uryjKMwrfr7BQ92mo2nkDtGcRLC6UbfkaHS0SddWpnkF2vOBI0hBNIYE3vNk
 irWUsCZZsjWzAx7aK1N1Zaq0AXWWQPZziTn8QbbmPpDma7KGMGcnrO/Qt6IHz6G5r1
 eDJjaYWuo//JsocKz84rucxZZvNmZrGUdWQb7PQ06JoNPWTTLaLZbfMtPvSF6zSnlm
 H/5rwz8HlSTMQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Sasha Levin <sashal@kernel.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, lumag@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, quic_jesszhan@quicinc.com, jun.nie@linaro.org,
 jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 37/66] drm/msm/dpu: don't select single flush for
 active CTL blocks
Date: Sun,  1 Jun 2025 19:37:14 -0400
Message-Id: <20250601233744.3514795-37-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601233744.3514795-1-sashal@kernel.org>
References: <20250601233744.3514795-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.92
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

[ Upstream commit e93eee524bb78f3ee4b78654d0083382f98b3d23 ]

In case of ACTIVE CTLs, a single CTL is being used for flushing all INTF
blocks. Don't skip programming the CTL on those targets.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Patchwork: https://patchwork.freedesktop.org/patch/641585/
Link: https://lore.kernel.org/r/20250307-dpu-active-ctl-v3-5-5d20655f10ca@linaro.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. ##
Analysis: **1. Clear Bug Fix Nature:** The commit fixes a functional bug
where CTL programming was being incorrectly skipped on ACTIVE CTL
configurations. The commit message explicitly states "Don't skip
programming the CTL on those targets" indicating incorrect behavior was
occurring. **2. Small and Contained Change:** The change is minimal - it
modifies only the `dpu_encoder_phys_vid_needs_single_flush()` function
by adding a single condition check: ```c - return phys_enc->split_role
!= ENC_ROLE_SOLO; + return !(phys_enc->hw_ctl->caps->features &
BIT(DPU_CTL_ACTIVE_CFG)) && + phys_enc->split_role != ENC_ROLE_SOLO; ```
**3. Hardware-Specific Fix:** The fix addresses a specific hardware
configuration issue for devices with `DPU_CTL_ACTIVE_CFG` feature. From
examining the kernel code, this affects multiple SoCs including SM8150,
SM8250, SM6150, SC7180, and others - making it a widely impacting fix.
**4. Clear Functional Impact:** - **Before**: On ACTIVE CTL targets, the
function incorrectly returned true for split configurations, causing CTL
programming to be skipped - **After**: On ACTIVE CTL targets, it returns
false, ensuring proper CTL programming occurs - **Effect**: Ensures
display pipeline functions correctly on affected hardware **5. Tested
Change:** The commit includes "Tested-by: Neil Armstrong
<neil.armstrong@linaro.org> # on SM8550-QRD" indicating real hardware
testing was performed. **6. Matches Successful Backport Pattern:** This
commit closely matches the pattern of Similar Commits #1, #2, and #4
(all marked YES): - Small, targeted fix (line 377 in
`dpu_encoder_phys_vid.c:377`) - Addresses incorrect hardware behavior -
Has clear before/after functional difference - Affects critical graphics
subsystem functionality **7. Risk Assessment:** - **Low regression
risk**: The change only affects the specific condition logic -
**Targeted scope**: Only impacts ACTIVE CTL configurations -
**Conservative fix**: Makes the logic more restrictive (requires both
conditions to skip programming) This is a clear hardware bug fix that
prevents display issues on affected SoCs and follows the stable tree
criteria for important bugfixes with minimal regression risk.

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 20c8b9af7a219..8d5c325ecd76a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -349,7 +349,8 @@ static void dpu_encoder_phys_vid_underrun_irq(void *arg)
 static bool dpu_encoder_phys_vid_needs_single_flush(
 		struct dpu_encoder_phys *phys_enc)
 {
-	return phys_enc->split_role != ENC_ROLE_SOLO;
+	return !(phys_enc->hw_ctl->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) &&
+		phys_enc->split_role != ENC_ROLE_SOLO;
 }
 
 static void dpu_encoder_phys_vid_atomic_mode_set(
-- 
2.39.5

