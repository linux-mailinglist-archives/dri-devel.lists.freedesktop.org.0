Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3040ABD5F1
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 13:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4729A10E23B;
	Tue, 20 May 2025 11:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qtsSOBIX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775D410E206;
 Tue, 20 May 2025 11:07:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 37AC8629E4;
 Tue, 20 May 2025 11:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548ADC4CEEB;
 Tue, 20 May 2025 11:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747739239;
 bh=vZ1t6Vc63BskovxHxSYfUxap5QAI5M05opZJqIZaSDo=;
 h=From:Subject:Date:To:Cc:From;
 b=qtsSOBIXJ2d+0H40ut9kbs4RxRN+4+kAUHoDRxTsK96v7gMaTcRJMTqsU5J+Xf2Qq
 cdb+1tVDrvGFEuI/n26pLvITrx5t6zC0zE3hRpTU6GS/oMcs1Rd2kC0/+qJNfjt0/8
 ub6bi+9KdvhrfjtyINEA2i33EWTfpnBct7cNcUWSFMfbZgmgw6eiSSsYevb+rW4ccP
 XmDrQxknI/WjL+7o37F5+Vk8B5vkACAvEXFFC+iaa+H6vIYj7tbOH+UkV68jm6UVQc
 2ryJDw6BMobkBwOGaUaGigZq19JZmJQrzgFD3b6pwlNo2G96ffV2IqK7Tu8d1bM5/e
 25mEFvq2a5jiQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [RFT PATCH v4 00/14] Add a single source of truth for UBWC
 configuration data
Date: Tue, 20 May 2025 13:07:05 +0200
Message-Id: <20250520-topic-ubwc_central-v4-0-2a461d32234a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFpiLGgC/3XNQQ6CMBAF0KuQrq0ZaAfRlfcwxsA4SBOg2AJqD
 He36EIXuJnk/2TefwrPzrAXu+gpHI/GG9uGoFeRoCpvLyzNOWSRQIKgFcjedobkUNzoRNz2Lq8
 lKkINJcRbRhEeO8elub/Rw/GTHV+HYPffsjK+t+7xHh7juf1sIGRLG2MsQYJC0oRUMMLeer++D
 nlNtmnW4YhZHZMfKdaLUjJLW6aCIAck/iOpX2mzKKkgKcp0iphimaUL0jRNL7FsuXBkAQAA
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747739235; l=4572;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=vZ1t6Vc63BskovxHxSYfUxap5QAI5M05opZJqIZaSDo=;
 b=Oxb4Wwqx7U3nZyRytWLbjcb0NwXEpFir3o83xbgdrUdLUa0wHB6Iz4OsKmHWELdY6/xXRlT8I
 EV62n3hAfw9BXOn983Na7QEC4/apIrhPGfRSgA8EOMnaYUT3m8JObpF
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
Changes in v4:
- Stub out qcom_ubwc_config_get_data()
- Move the select for QCOM_UBWC_CONFIG to DRM_MSM
- Use a define for UBWC_SWIZZLE_ENABLE_LVL2 in a6xx_gpu.c
- Pick up tags
- Link to v3: https://lore.kernel.org/r/20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com

Changes in v3:
- Rearrange some patches some more (Dmitry and I talked off-list,
  hopefully this version is reasonably sane)
- Throw the error returned by qcom_ubwc_config_get_data(), don't always
  assume it's -EINVAL (so that we can EPROBE_DEFER in the future if the
  SMEM driver that provides DDR info decides not to come up..)
- Scream if ubwc_swizzle doesn't match
- Drop dropping the ubwc_swizzle override (needs some testing in the wild)
- Move long statements out of declaration space
- explicitly define UBWC swizzling levels
- Fix the SAR2130P omission
- Pardon the funny ordering, but since it's intended to all go through
  drm, I attempted to strike a balance between clear, separate
  changes/fixes and logical succession
- Link to v2: https://lore.kernel.org/r/20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com

Changes in v2:
- Rearrange some patches
- Don't zeroalloc a copy of ubwc_config, store a full struct inside
  adreno_gpu instead (temporary solution until we trust the central db
  on the HBB value)
- Improve some commit messages
- Fix up SM6125's config
- Don't break userspace abi (hbb value)
- Don't keep mdss_reg_bus_bw in ubwc_config
- Add the last patch warning if there are inconsistencies (I don't
  insist on it getting merged, but I think it's a good idea for the
  time being)
- Link to v1: https://lore.kernel.org/r/20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com

---
Konrad Dybcio (14):
      soc: qcom: Add UBWC config provider
      drm/msm: Offset MDSS HBB value by 13
      drm/msm: Use the central UBWC config database
      drm/msm/a6xx: Get a handle to the common UBWC config
      drm/msm/a6xx: Resolve the meaning of AMSBC
      drm/msm/a6xx: Simplify uavflagprd_inv detection
      drm/msm/a6xx: Resolve the meaning of UBWC_MODE
      drm/msm/a6xx: Replace '2' with BIT(1) in level2_swizzling_dis calc
      drm/msm/a6xx: Resolve the meaning of rgb565_predicator
      drm/msm/a6xx: Simplify min_acc_len calculation
      soc: qcom: ubwc: Fix SM6125's ubwc_swizzle value
      soc: qcom: ubwc: Add #defines for UBWC swizzle bits
      soc: qcom: ubwc: Fill in UBWC swizzle cfg for platforms that lack one
      drm/msm/adreno: Switch to the common UBWC config struct

 drivers/gpu/drm/msm/Kconfig                 |   1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  20 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 138 ++++++------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  46 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   2 +-
 drivers/gpu/drm/msm/msm_mdss.c              | 333 +++++-----------------------
 drivers/gpu/drm/msm/msm_mdss.h              |  28 ---
 drivers/soc/qcom/Kconfig                    |   8 +
 drivers/soc/qcom/Makefile                   |   1 +
 drivers/soc/qcom/ubwc_config.c              | 267 ++++++++++++++++++++++
 include/linux/soc/qcom/ubwc.h               |  74 +++++++
 18 files changed, 519 insertions(+), 429 deletions(-)
---
base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
change-id: 20250430-topic-ubwc_central-53c540f019e5

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

