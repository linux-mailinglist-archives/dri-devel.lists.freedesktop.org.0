Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DCA792CA8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 19:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2239610E0BD;
	Tue,  5 Sep 2023 17:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2AB10E0C2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 17:43:55 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2bcc331f942so1122761fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 10:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693935834; x=1694540634; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2OkBEAPevcriKHohaNDw8qazVjEEi9PkNyUZ5jiXpJY=;
 b=beQG9AgIs+kZ0h4inoONWMPHXbD4Z0JlFJ5Hfw2gjqi5RDjDMjy7nostpkPTlMVB/6
 3JnXKCmmtZHV9lBvA/mVg3zqSEu3bNR073f+EmoYiH2WDm/WUXZR2NP8IkMCOZvbeX9E
 xGvPdCd6KWA6NpTDoD76I/UfpHhgVscGyP4x5IXb3jPqIBblFo0SCaq2e31LFMLcVwWf
 EfPcF7iBwsoF5vA7YlfVwvz492dAiU6SDbJPq72rfgEWz7ITQQASB/XJhhr51P/wccmr
 dJd1vx53mzEhnU8lVzue0m4YGzVjCCgMhNfkGHw+G+hXYMZeK+0EgeeQBGfERRyfHmkn
 C4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693935834; x=1694540634;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2OkBEAPevcriKHohaNDw8qazVjEEi9PkNyUZ5jiXpJY=;
 b=I9HIHb+jYtZf0tCKMf3oTBdAAXxSmuj+l/vrWD+AMywMEkS3m7BfacADvkN4edumIl
 ctv4GGrsj3r6MuZUivsYRKH4TBEBkLCqLHfQ9p9xzgXdnIYjUmY1B5Y42ZQwKwqe3ZCN
 v68RdwcAypiv8QDnS7rFKzJH63b6LjEKzKcvzIv3eHteWNgMrhT/wsxoNzNJGf9KM0TW
 nMwb882Te4/5X9BNW89MEaiiJhgR5lkgYQ88xzfYVWuwtXV0pU5CjWyzwsTOg1Gic/GH
 KfWCAKFrt8Ok53+7QwcG+HOQI/3sR+8/KM1TsSRQ5eJ6v6HR0p0hHdzjpru8mquOzRJl
 YNpQ==
X-Gm-Message-State: AOJu0Yz2EkQbvikyo76mmGZWJPAhXfKtBlrC9zUEvGUnisNnl8lRyo53
 GvPECmlXfW3fF3rPrG6AKBVYew==
X-Google-Smtp-Source: AGHT+IGOcmIUS8yzOr2fJPFQEQ+/KEPQd8cKVszbnsNYXjvmDrQlbZpUn/HJlSNBPH6Suw9MJo0JKQ==
X-Received: by 2002:a2e:805a:0:b0:2bc:bc6f:e296 with SMTP id
 p26-20020a2e805a000000b002bcbc6fe296mr206904ljg.13.1693935833953; 
 Tue, 05 Sep 2023 10:43:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a2e7a0a000000b002bce8404157sm3045922ljc.12.2023.09.05.10.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 10:43:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 0/6] drm/msm: provide migration path from MDP5 to DPU driver
Date: Tue,  5 Sep 2023 20:43:47 +0300
Message-Id: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
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

Dmitry Baryshkov (5):
  drm/msm/mdss: fix highest-bank-bit for msm8998
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
 drivers/gpu/drm/msm/msm_io_utils.c            |  18 +
 drivers/gpu/drm/msm/msm_mdss.c                |  39 +-
 11 files changed, 1142 insertions(+), 19 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h

-- 
2.39.2

