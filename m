Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FC07BB8BA
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 15:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA8E10E4E5;
	Fri,  6 Oct 2023 13:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8F210E209
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 13:14:53 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5041cc983f9so2593823e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 06:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696598092; x=1697202892; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=itYPcSWRtAATpzEiTYMgzBqAA5lAMODL1AvBzjtdwpA=;
 b=qgoqlt1zlzrb9D4ka8slyxN0qHIaU12MzHLcm7PpGHds4bZBk9wyNPJ5QBuJJWngNA
 f1kVageuUR6AY7sYKyQ2U2N/iu2aTAoobQxRznjmJG3uSedN5PJl2xHpZFCC9AYobIJb
 05uV8paUMdGvY2b/xs0L7O5fIQr5HZ5/ddQJs08yBE4urkAUgaKhNMG45nYCZ45ouiJh
 NY/eU0TZhRgJEP8LMKR18UmS3ePVPL9lMfxCEDDilW0W5JDVguBc632+qn2bVVk8GfiW
 Y2XQYFAajDBo+8wpY+DNAxU+sIe+nveI59xLAot05gpQZrYblLVpC0fV170ox2Pwd31O
 kBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696598092; x=1697202892;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=itYPcSWRtAATpzEiTYMgzBqAA5lAMODL1AvBzjtdwpA=;
 b=VWiLt+EA9uMwMseep6GiuMZb7MKkdZtUBy1DPlSzaBgv5DpsPqo7hkbywmEeDiUeS4
 SqKuv1ITAl3FzPy+JO+skZpBnGqpyRE3x2x2yPAWe1WpjfeQ0H11f9aDSE8CRLaeF49H
 sdByDv2Jxquag9oUddGRHU8OqaxIVVLaKMZ6+xE3qscJ9qcx5W7fPWhG8h64vAtic8YZ
 3+5hFcvbCW9VK5aTRbl+kQMNmL/g4wRKG+OaAmfPois7YxvXl1eqeSp1Um305fLpNnMn
 2Lqx6f97sLMGsmqMMrNMmCDpkdzPnkzqp5TVBQ8VyBNVU8TeATEHaUvDjA+zkRKlUNpF
 ItvQ==
X-Gm-Message-State: AOJu0Yx6bpwcTPEA1uEXbNuILqQumHaqRDqOoSNnzWRzODTf1yT5Io/n
 ZWGen9MLE6h3I2F7usLLmMLQFA==
X-Google-Smtp-Source: AGHT+IHbq76vq4MURTNm9Y5LCqyAQE07bF27ciPppI8aHjPFl4y5DPbVytYX/AkjdLIJxDGOFvlztg==
X-Received: by 2002:ac2:4e6a:0:b0:501:c779:b3bb with SMTP id
 y10-20020ac24e6a000000b00501c779b3bbmr6332687lfs.60.1696598091881; 
 Fri, 06 Oct 2023 06:14:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a19ee09000000b004fbb011c9bcsm301285lfb.161.2023.10.06.06.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:14:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v6 00/10] drm/msm/dpu: simplify DPU sub-blocks info
Date: Fri,  6 Oct 2023 16:14:40 +0300
Message-Id: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The handling code also usually knows, which sub-block it is now looking
at. Drop unused 'id' field and arguments and merge some of sub-block
declarations.

While we are at it, also fix all VIG subblocks to contain correct scaler
block version and drop the becoming unused QSEED-related feature bits.

Changes since v5:
- Fixed the rogue vig_qseed3_noscale sblk. There is no qseed3 in the
  noscale VIG blocks.

Changes since v4:
- Renamed dpu_vig_sblk_x_y to dpu_vig_sblk_qseed3_1_2 (Abhinav)
  Note: I've choosen _qseed3_ instead of the suggested _scaler_, as
  there are other scaler types which might have their own versioning
  scheme
- Dropped the DPU_SSPP_SCALER and DPU_SSPP_CSC_ANY defines (Abhinav)

Changes since v3:
- Proprely describe dpu_scaler_blk::version field as the register value
  (Marijn)
- Picked up Marijn's prior art patches (sorry, missed them while
  preparing v3) (Marijn)

Changes since v2:
- Reworked the VIG SBLK definitions to set the scaler version (Marijn,
  Abhinav)
- Rebased the reset of the patches on top of this (intrusive) change.
- Folded QSEED3LITE and QSEED4 feature bits into QSEED3

Dmitry Baryshkov (8):
  drm/msm/dpu: populate SSPP scaler block version
  drm/msm/dpu: drop the `id' field from DPU_HW_SUBBLK_INFO
  drm/msm/dpu: drop the `smart_dma_priority' field from struct
    dpu_sspp_sub_blks
  drm/msm/dpu: deduplicate some (most) of SSPP sub-blocks
  drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
  drm/msm/dpu: rewrite scaler and CSC presense checks
  drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3, QSEED3LITE, QSEED4
  drm/msm/gpu: drop duplicating VIG feature masks

Marijn Suijten (2):
  drm/msm/dpu: Drop unused get_scaler_ver callback from SSPP
  drm/msm/dpu: Drop unused qseed_type from catalog dpu_caps

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  17 +-
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  17 +-
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  17 +-
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  17 +-
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |   8 +-
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  25 ++-
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  11 +-
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   7 +-
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  11 +-
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   4 +-
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |   7 +-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  25 ++-
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   9 +-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  25 ++-
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  25 ++-
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  29 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 145 +++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  55 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  20 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  21 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   7 +-
 23 files changed, 201 insertions(+), 310 deletions(-)

-- 
2.39.2

