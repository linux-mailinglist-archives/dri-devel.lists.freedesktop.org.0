Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 712247BABF8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 23:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD1E10E4A7;
	Thu,  5 Oct 2023 21:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1B910E42C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 21:27:06 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c2907ff9fcso17664911fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 14:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696541224; x=1697146024; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1TqfAnPm+aqKJ7RICtUDzyL8tsOmR1pfL3HN7VslD1A=;
 b=nlf3I9CVXttHMiKNeVLagwSiOOsGz4ZuBFT9oj/cgAIIx5qw7kml6+Dr3k4y1SLeSV
 tdpIj4FCis9mdTP7TmFW/h7i4KgVZY6sZGA+D1GbyiPLxmoRm5yM6GjQg0BAmaQ6Izuz
 wLzVmVss14p4I9s5SF2U9UcsviNs/IFikedX+nXJD7CxjPpOFB3dxbP4k+Np+Bpqno1X
 L6+J++fDT28Qaue0YGjNS9IZHhHvQWjVjaW1Z6K0hJXrNVjVi9X1jLJvD+vTZx3N3N54
 uWYv+T4K4XVctJSBruX+gm7B2FJ/TYf5KIByGGhiZ+j6/lji2oSV/LR9OT5QOlFw3nRY
 3kvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696541224; x=1697146024;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1TqfAnPm+aqKJ7RICtUDzyL8tsOmR1pfL3HN7VslD1A=;
 b=UnM0sy17YQ5jTWv1THWP1Frgv5PugROIez2QH5Or1ufSHVN+5JcTAOggMS76Fw7JV0
 x27J0rs709gSwBJkRiWt4ibyFGz3K2SaOkJqlKD1M446PzKFkKcfZIfBfHDOXlMvjxZq
 oytRU0kpTUP1pLB0DTwpIVwojg+4wyyMZNDytCxhd0sks1HftEYK8queDpeV8gMkFa+O
 HA5IEQCl5s7jdEOhXxcG8v3WPZD6H3Rg6kdnxCIc2p8t+MBf/5DNXnA00F/g/4qRHLyg
 5OMmXsC6D4LE2xviR6E+AyNckEbEwbbGa2BBMCgcNqZF1jP8246lYkZCUc78D/h4ISgb
 pl5A==
X-Gm-Message-State: AOJu0Yyp08L5St1gzmRJBixpgzF/PoOZRjuGsHCGXf5g+e3vIDawS2HP
 gHE97/YlPcxw2uVHIz+sAC3VGQ==
X-Google-Smtp-Source: AGHT+IE8eeNcaGwdHHDKL7oAQH/f8hwSAGWHRjnz17Ynq4w9wAL3eMkq28AUxhtbQsWQJguCw23EIQ==
X-Received: by 2002:a19:6518:0:b0:500:acf1:b42f with SMTP id
 z24-20020a196518000000b00500acf1b42fmr4576828lfb.53.1696541224048; 
 Thu, 05 Oct 2023 14:27:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a19f806000000b00500b3157ec6sm8435lff.143.2023.10.05.14.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 14:27:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v5 00/10] drm/msm/dpu: simplify DPU sub-blocks info
Date: Fri,  6 Oct 2023 00:26:53 +0300
Message-Id: <20231005212703.2400237-1-dmitry.baryshkov@linaro.org>
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

