Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FF3AB6F09
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 17:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2420F10E646;
	Wed, 14 May 2025 15:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Vlapqhv+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FEC10E26D;
 Wed, 14 May 2025 15:10:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DDD0A61126;
 Wed, 14 May 2025 15:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABA7C4CEE3;
 Wed, 14 May 2025 15:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747235447;
 bh=51s1ugliCZ9y9tBTWNjREJUDvKnLeqgTAYWYYnww7tM=;
 h=From:Subject:Date:To:Cc:From;
 b=Vlapqhv+gM0aiz94PdoikbsOxJ0CMutLOS/yXoa/V2ibUUfYKeT525Jj6iUVj0VIX
 oYpBIvSQjvtL8g5q6BYIofpY1WJyDiwCO0KdkmNhwLlAimM898mAQOCcqvF1zepk3N
 WaSM/fa+Fj9xvIxu2kzL18E+Qzzkph7XbWFUggQhNoiCsc6S+EutE5L1rZrBs+Xxjf
 86iHfDeaJL9cAq2NEkKUOv4U16KTWyGLrUiFo8n8uoLxH6HPsxal56877w2HVyQ51H
 9dC9JclMzjXFEDvWnRTN9hPHEGHTC2phWRU045Jpb3XmkTPsPJPk98+wFuRzJYvOCb
 DtXQtf41rDeWA==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [RFT PATCH v2 00/15] Add a single source of truth for UBWC
 configuration data
Date: Wed, 14 May 2025 17:10:20 +0200
Message-Id: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFyyJGgC/22NzQ6CMBCEX4Xs2ZLlZxP15HsYYmBdpAlQaAtqC
 O9uhYMXL5N8k8x8CzixWhycowWszNpp0wdIDxFwU/YPUfoeGFJMCfMMlTeDZjVVT76x9N6WraK
 MKccak5MQhOFgpdav7fRa7GxlnMK3/5WNdt7Y9yaek2+7OwiP/xxzolBhRpwzcSWEF+NcPE5ly
 6br4hBQrOv6AV/4O7HQAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747235442; l=3475;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=51s1ugliCZ9y9tBTWNjREJUDvKnLeqgTAYWYYnww7tM=;
 b=V9qKgWmQlFJZwWodaXCZPfFPpKAnjadFmxqUc6FdCktyOis3bFJK1AqssaDhaLghlADua9Kaf
 CDurEBEKoMuCAGpbIwAPzgfphXX6L/ze492vPPSixmCceby0fZGNzM7
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
Konrad Dybcio (15):
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
      drm/msm/adreno: Switch to the common UBWC config struct
      drm/msm/a6xx: Drop cfg->ubwc_swizzle override
      soc: qcom: ubwc: Fix SM6125's ubwc_swizzle value
      soc: qcom: ubwc: Add #defines for UBWC swizzle bits
      [RFC] drm/msm/a6xx: Warn if the highest_bank_bit value is overwritten

 drivers/gpu/drm/msm/Kconfig                 |   1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  20 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 131 +++++------
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
 drivers/soc/qcom/ubwc_config.c              | 244 ++++++++++++++++++++
 include/linux/soc/qcom/ubwc.h               |  69 ++++++
 18 files changed, 480 insertions(+), 433 deletions(-)
---
base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
change-id: 20250430-topic-ubwc_central-53c540f019e5

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

