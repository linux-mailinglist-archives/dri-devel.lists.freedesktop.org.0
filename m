Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB368017E3
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 00:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA15410E9A3;
	Fri,  1 Dec 2023 23:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A9E10E99F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 23:42:37 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50bce42295eso3208090e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 15:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701474155; x=1702078955; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ycxynjmtRt/XVGvqx16uPR6ksjV7oaeAV/Qc50+s7Yw=;
 b=wEZvo6/7ZeiH12VS0U1glw4LrOB4KioeboT3BrrCQIbsh0thylyUfvOpYMb0sgBV2U
 GrHH+qzC71yDCdjSRc0pMHSeJrbsoi4yKFuchZYvkvO9VM1K5yUzuM+rqp/6xAosTIKN
 fzwqPCON/uuYCXVkxD+RmyKhm0lVd0pNgAukToDOsiR80Cpi4SAVSKtB1kjfYCCbw7iV
 kU4+28Bl6kqeaWe0Bi1wH/IuhfnUkNWbCU35ukqOTpPNSCaX/k8jkxvndKp6xbkrgTIt
 Xqao4ApM4J5csWMLEmID8AqlpDy2jtwI9D23TpkVg9V02d+zz3DL9wWhgL1aX9gnbAFE
 zB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701474155; x=1702078955;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ycxynjmtRt/XVGvqx16uPR6ksjV7oaeAV/Qc50+s7Yw=;
 b=WR9fGvFMHpass9QF66qbarMWtM97+PMI9+bAvAWkboyL77y/ixmKyrplZYQa08FX/a
 M5KcjbZ4ShQvWj+WiO+8IE12oEQ2264frY88AfDkNwdA9sKCEmnNEOfuxbfnp+m1kLcq
 wbdnU/5gg2bLrKYsWlvpfqNXXCZ9EEx//HtYMo3rHZIz2pgzXemGzOwJt84no2vk/yOt
 THVDEbWQLiBueuvXcP5KKfkhxnp0sHT0lMQYbyyfOUTb35rAE0/PflBJrtPEVBMS801E
 9m2Dt8oD36+hRmrrfugwNtrO2quv088yiY3gzAUI/4DUPWLMA3brpn+fwDyyU0GEvwld
 V2VQ==
X-Gm-Message-State: AOJu0YweFnd5CSiEcMqh8VtuK0tlXRVXMfItIn3LteJ9IAeF4s3HB5pY
 TdM+GPDi09xsxWm/0jxx6mCpQA==
X-Google-Smtp-Source: AGHT+IGAd7fnI91i4slPrz65STgvKx2zQuzr38iUxZWkNmG6MAvGyJrGwRQrCctMuy6rdAXt6t9OHg==
X-Received: by 2002:a05:6512:48f:b0:50b:e056:396a with SMTP id
 v15-20020a056512048f00b0050be056396amr449640lfq.28.1701474155273; 
 Fri, 01 Dec 2023 15:42:35 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 m14-20020a056512358e00b0050803043fc6sm554248lfr.265.2023.12.01.15.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 15:42:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v7 00/10] drm/msm/dpu: simplify DPU sub-blocks info
Date: Sat,  2 Dec 2023 01:40:24 +0200
Message-ID: <20231201234234.2065610-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
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

Changes since v6:
- Renamed the merged DPU_SSPP_SCALER_QSEED3 to
  DPU_SSPP_SCALER_QSEED3_COMPATIBLE (Abhinav)

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
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 149 +++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  57 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  20 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  21 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   7 +-
 23 files changed, 204 insertions(+), 313 deletions(-)

-- 
2.42.0

