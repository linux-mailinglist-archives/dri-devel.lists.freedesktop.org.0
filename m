Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B147BB93A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 15:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5758E10E4FE;
	Fri,  6 Oct 2023 13:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025C010E4FA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 13:37:24 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5042bfb4fe9so2707557e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 06:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696599442; x=1697204242; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7TqEnu0vxAXChvGfZXmodGrnb+oByazcmJyvsPVCLkw=;
 b=FGJfusFxu2NUA1wixbpuqcZddf4zWxt/XIYCskPYpm9cWrTMpSIrXz82dNA1kZsccd
 mFiac9AeD6LxpTbBOHZu9+BL+IfBfsffYxzWir6gPoKvzY/67TesQozaDwvOr9qWqHny
 MCkh4tfT7UH8/moLnTtYHo1AwMxqDhRITAEg/Fup/iwqwyKMFHsYYy+862oZNVpSI6ok
 RqVoHZ0/m5nS7t+NG0VI51EY8pQWNa2uLKo6ezv9GLLM2XlJyIK2FWsLviPpoQlprcFC
 lpsh6h2XoCuodyy2IUra4mpLmnPUyjWDw2RXcwYhgx42x0MAGfrIe59eshItgObJ9Ixe
 g2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696599442; x=1697204242;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7TqEnu0vxAXChvGfZXmodGrnb+oByazcmJyvsPVCLkw=;
 b=L4j/bz7N2f5nb+6Kk6U2jhZ0JrxOsmSPJpABLx9o6igOE8G4bAeiEWiQOcpLikz7YU
 /J21xlCh3miPXfnG9+tdPw/AZJ8aYoq1X3QimQiW1mu72eR7lLwVK6hjDzJOl64bS5rY
 9KVOCHm9/MuXyBZu9Cpfb13Jv9eFHNPiG8uDaSWNCuD9zLilPZpWnfAZfKxs1JZ3gEGC
 GShv+YbPQK7SEByWCMuWZXaIwLBUwlcZ9ZpsTv8vhZggS2B9vztRfA4Qwikwahf7c0xo
 TNRxKPsO+N+pBh1xp+bWTAZ46t0PgvrBLPESN56pB7K1jzBVP6p5Lf13ETi6xZaLm/mu
 indA==
X-Gm-Message-State: AOJu0YzpSm91EZ0zADY09cy0Rohl7a1wJsC2Ii9lVGtcKR2p/QgA/6sZ
 3TK8pVcx490Hq/wxN3GL9BLnVg==
X-Google-Smtp-Source: AGHT+IGN4dVBXUHRecRdV2lExMJrHcYNdIKApFuYMLIuWGq18+mYm3pg4DfiVHMIDzW6PwfUb1IYeg==
X-Received: by 2002:a05:6512:753:b0:503:19d8:8dc3 with SMTP id
 c19-20020a056512075300b0050319d88dc3mr6866312lfs.31.1696599442101; 
 Fri, 06 Oct 2023 06:37:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a056512015b00b0050567cdb8f6sm303534lfo.239.2023.10.06.06.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:37:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 0/5] drm/msm: provide migration path from MDP5 to DPU driver
Date: Fri,  6 Oct 2023 16:37:15 +0300
Message-Id: <20231006133720.2471770-1-dmitry.baryshkov@linaro.org>
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

Over the last several years the DPU driver has been actively developed,
while the MDP5 is mostly in the maintenance mode. This results in some
features being available only in the DPU driver. For example, bandwidth
scaling, writeback support, properly supported bonded DSI aka dual DSI
support.

All the pre-SDM845 platforms were originally supported by the MDP5
driver only. However it is possible and easy to support some of the
older SoCs in the DPU driver. For example in the v5.18 it got
support for MSM8998.  This can not be considered as a proper migration,
since there msm8998.dtsi didn't describe the display hardware
beforehand. Instead new bindings were added, making MSM8998 just another
display hardware to be supported by the DPU driver.

This series provides a way to gradually migrate support for several
existing and well-supported SoCs from the MDP5 to the DPU driver without
changing the DT. From the user experience point of view this is
facilitated by the `msm.prefer_mdp5' kernel param. If the parameter is
set to `true' (current default), all `shared' platforms will be handled
by the MDP5 driver. If the switch is flipped to `false' (or if the MDP5
driver is disabled), these platforms will be handled by the DPU driver.
Handling this by the modparam (rather than solely by kernel config)
allows one to easly switch between the drivers, simplifying testing.

This series implements support for two DPU 3.n platforms, SDM660 and
SDM630, and a classical MDP5 1.7 (MSM8996) SoC. It should be easy to
implement similar support for MSM8937 aka SDM430, MSM8917 aka SDM425,
MSM8953 aka SDM625 / SDM632 / SDM450 and QCS405. They were left out
beacuse of the lack of the hardware on my side. Then it should be
relatively easy to also add support for MSM8992, MSM8994, MSM8956 and
MSM8976. The major missing piece is the SharedMemoryPool, SMP.

In theory after additional testing we can drop most of migration code
and some parts of MDP5 driver. The proposed boundary is to move all
platforms supporting cursor planes to the DPU driver, while limiting
MDP5 to support only the older platforms which implement cursor as a
part of the LM hardware block (MSM8974, APQ8084, MSM8x26, MSM8x16 and
MSM8x39).

Dependencies: [1]

[1] https://patchwork.freedesktop.org/series/119804/

Changes since v1:
- Dropped accepted patches
- Rebased on top of updated [1]
- Added defines for MDSS hw revisions (Stephen)
- Changed msm_mdss_generate_mdp5_mdss_data() to return const struct
  pointer (Stephen)
- Fixed error handling in msm_ioremap_mdss() (Stephen)

Dmitry Baryshkov (4):
  drm/msm/mdss: generate MDSS data for MDP5 platforms
  drm/msm/dpu: support binding to the mdp5 devices
  drm/msm: add a kernel param to select between MDP5 and DPU drivers
  drm/msm/dpu: add support for SDM660 and SDM630 platforms

Konrad Dybcio (1):
  drm/msm/dpu: Add MSM8996 support

 .../msm/disp/dpu1/catalog/dpu_1_7_msm8996.h   | 353 ++++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_3_2_sdm660.h    | 291 +++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_3_3_sdm630.h    | 225 +++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  97 +++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  94 ++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |   3 +
 drivers/gpu/drm/msm/msm_drv.c                 |  34 ++
 drivers/gpu/drm/msm/msm_drv.h                 |   4 +
 drivers/gpu/drm/msm/msm_io_utils.c            |  13 +
 drivers/gpu/drm/msm/msm_mdss.c                |  51 +++
 11 files changed, 1150 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h

-- 
2.39.2

