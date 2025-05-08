Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1075BAB0235
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 20:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7E010E942;
	Thu,  8 May 2025 18:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mWunfEki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29D610E942;
 Thu,  8 May 2025 18:13:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4D2825C5C52;
 Thu,  8 May 2025 18:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A26C4CEE7;
 Thu,  8 May 2025 18:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746728006;
 bh=tMAy5xVCwWpgxNJfNaRnAAeKwSI9QYqDnzAylqCtjYc=;
 h=From:Subject:Date:To:Cc:From;
 b=mWunfEkiaoTV8QCc52y61TtGeejMs4U1+AhKERoIPr0LyzDpbvji+lITrAeLm6/QY
 m43XRJLKliEPWcj/rNWNX0UAYGdkaTQ+5c3praGKnHIKlDF0s87GUXFzNX382Ibmva
 LNZ3dJfPSBssNWXmiH68iYiVsEeWM94Jrn5V42/VWMRoTayEDRYCTVHYLJLxdn2JZL
 bs/juXDgZ/WglgQS3O2khXdPjA4xp6bP/OLarYNgdIiU2Nwhi3uD9dRNJDvJuBNXkG
 SfFMaaVrV7wmAUzN2YgguyDj46nORqbQpl/0ACLEL+bOJAob4Q6UNOci5+cYSOFrc6
 euwMzG7grCPTw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [RFT PATCH 00/14] Add a single source of truth for UBWC
 configuration data
Date: Thu, 08 May 2025 20:12:32 +0200
Message-Id: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABD0HGgC/y3NYQrCMAwF4KuU/DbSbla3IeI9REZb4yxsnTadC
 uLdrVMCgfcgX17AFD0xNOIFke6e/RhyUAsB7mJCR+hPOUMhCy1XpcQ0Xr3DyT5c6yikaHrUpdM
 reZaqJg358Brp7J8zejj+cqTblO30K2EgZjPbjdjOdJ4/vXFlGzur1zrfndos4V2hQqsMWapqa
 Svaj8zL22R6Nw7DMq/d9681TPhtfGpEoGfCP13B8f3+AAEWw2frAAAA
X-Change-ID: 20250430-topic-ubwc_central-53c540f019e5
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746728002; l=3014;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=tMAy5xVCwWpgxNJfNaRnAAeKwSI9QYqDnzAylqCtjYc=;
 b=qwT6r0o9a6b07+HS3tbDhJgdoh+nVD6SD7bdCNpoJHF0AEPe24I3pCZEYQTv+ZfFHYOPPx7FF
 uBJsq7l9E0cBBzlIOcrQxVkfBKbPmxO3hqK2AvOLaqjBggV/g275URH
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

As discussed a lot in the past, the UBWC config must be coherent across
a number of IP blocks (currently display and GPU, but it also may/will
concern camera/video as the drivers evolve).

So far, we've been trying to keep the values reasonable in each of the
two drivers separately, but it really make sense to do so, especially
given certain fields (see [1]) may need to be gathered dynamically.

This series introduces a Single Source of Truth (SSOT) database to be
consumed by multimedia drivers as needed.

[1] https://lore.kernel.org/linux-arm-msm/20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com/

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (14):
      soc: qcom: Add UBWC config provider
      drm/msm: Use the central UBWC config database
      drm/msm/adreno: Offset the HBB value by 13
      drm/msm/a6xx: Get a handle to the common UBWC config
      drm/msm/a6xx: Resolve the meaning of AMSBC
      drm/msm/a6xx: Simplify uavflagprd_inv detection
      drm/msm/a6xx: Resolve the meaning of UBWC_MODE
      drm/msm/a6xx: Replace '2' with BIT(1) in level2_swizzling_dis calc
      drm/msm/a6xx: Resolve the meaning of rgb565_predicator
      drm/msm/a6xx: Stop tracking macrotile_mode (again)
      drm/msm/a6xx: Simplify min_acc_len calculation
      drm/msm/adreno: Switch to the common UBWC config struct
      drm/msm/a6xx: Drop cfg->ubwc_swizzle override
      drm/msm/a5xx: Use UBWC data from the common UBWC config struct

 drivers/gpu/drm/msm/Kconfig                        |   1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  17 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 129 ++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  10 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  41 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   2 +-
 drivers/gpu/drm/msm/msm_mdss.c                     | 302 +++------------------
 drivers/soc/qcom/Kconfig                           |   8 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/ubwc_config.c                     | 255 +++++++++++++++++
 .../msm_mdss.h => include/linux/soc/qcom/ubwc.h    |  19 +-
 17 files changed, 395 insertions(+), 414 deletions(-)
---
base-commit: 19c541fe872387798a25df947f56a26212aa9a97
change-id: 20250430-topic-ubwc_central-53c540f019e5
prerequisite-message-id: <20250505-topic-7c3_rgb565pred_fix-v1-1-b1aebe890b8e@oss.qualcomm.com>
prerequisite-patch-id: b1d26d75633cacbde82a456bff06d27de2792733

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

