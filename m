Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF3C791FE2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 03:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7185410E05F;
	Tue,  5 Sep 2023 01:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178DD10E05F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 01:25:29 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-500913779f5so3228376e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 18:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693877128; x=1694481928; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PGSesLieEcOqw+a0zaRz86MzyUui+iQO73QMhXr0n6w=;
 b=uohdsAKtnjNDP6o6Hdn2furkry2HfWuRtxbaURpuJ3NdJQUjdstZZIy23uDch1oO/V
 GrQSPjwhZgg1qQcc3dSIRQOxaD7de9krmNgCY+AeVsX2y0y+WMCVMnSIeM1QpNU1/4k8
 LokRIQbBOYMuYqx60we8YqbQjFCJjrSgM0PmiO2Xo9uIBCS4832M/vs2SLjTg4FDWJ5n
 8FrXO5lQoBxjhpRTWb6jtLsA+nip/0UYWx19vHMMLNCjEuc9GFgwjclSASsuRV6p2I8p
 DkHgwlyfeeKOnpcla63tdMBM330Tg200gDoPjD/CWbvlrjblu/l4MTq++HY9ZbFVmhvY
 6+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693877128; x=1694481928;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PGSesLieEcOqw+a0zaRz86MzyUui+iQO73QMhXr0n6w=;
 b=B4cXqmvqMEXlIGXrvfRY0fiyajzzur3tCuL/ZLNqiijlz9Wmt8wDfTflBaToAgBZ0M
 OgkIHgcS60eDLuN0fyAX/Zm2bSlExXiB1kpvMNL6buPMHizrJNeEDcDFDb9LXliO+nL2
 ZUYvXeuEixY9NinlVbQSFu9HyeGEWebqbi+VFeIExpgyTDYDyPDiJcFA1ZP9OL7L+7eC
 4gdw6tKrxy5fJaTfFiORjf1DJRfEDcjx2jYUvXx/hhleWzcxYRdrIRSF0Rj7+yV5useE
 +C2uoqKRYEIoj5fGQxGOeH/B46uaZNOsrrI5WKypKBkOZJRJalbrRtYKXiS0yvgS9Iwa
 G19w==
X-Gm-Message-State: AOJu0Ywjtp1chfunZaG6YPG06/SQjEUgLUrrYDdQWC5g/WRcm6mCiipe
 EwUoSvpWFUjotA47ez2R4fA48Q==
X-Google-Smtp-Source: AGHT+IHe9bGHOI7psm5y3VviCTDtNbE7xdf/6oJt+4/eT8OCnPsStODTGj/Zjuha2AzL9WjlQUTxAg==
X-Received: by 2002:ac2:482d:0:b0:500:a2d3:3e65 with SMTP id
 13-20020ac2482d000000b00500a2d33e65mr7703889lft.23.1693877127724; 
 Mon, 04 Sep 2023 18:25:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v25-20020ac25599000000b004ff70c76208sm2062369lfg.84.2023.09.04.18.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 18:25:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 0/8]  drm/msm/dpu: simplify DPU sub-blocks info
Date: Tue,  5 Sep 2023 04:25:18 +0300
Message-Id: <20230905012526.3010798-1-dmitry.baryshkov@linaro.org>
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

Changes since v2:
- Reworked the VIG SBLK definitions to set the scaler version (Marijn,
  Abhinav)
- Rebased the reset of the patches on top of this (intrusive) change.
- Folded QSEED3LITE and QSEED4 feature bits into QSEED3

Changes since v1:
- Dropped the patch dropping 'name' field (Abhinav).
- Deduplicate equivalent SBLK definitions.
- Dropped the dpu_csc_blk and dpu_dsc_blk merge.

Dmitry Baryshkov (8):
  drm/msm/dpu: populate SSPP scaler block version
  drm/msm/dpu: drop the `id' field from DPU_HW_SUBBLK_INFO
  drm/msm/dpu: drop the `smart_dma_priority' field from struct
    dpu_sspp_sub_blks
  drm/msm/dpu: deduplicate some (most) of SSPP sub-blocks
  drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
  drm/msm/dpu: drop the dpu_caps::qseed_type field
  drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3, QSEED3LITE, QSEED4
  drm/msm/gpu: drop duplicating VIG feature masks

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
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  52 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   3 +-
 21 files changed, 198 insertions(+), 269 deletions(-)

-- 
2.39.2

