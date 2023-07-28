Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0429E7677A4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 23:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E47C10E04F;
	Fri, 28 Jul 2023 21:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A00410E042
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 21:33:25 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fe0e201f87so3198278e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 14:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690580003; x=1691184803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F7AFpVLhQJ5PQc/Bf5DhP3xmGWkfC7iIPHliAm6mja0=;
 b=w0L3KwsYOQUAN+diOBY57sZAYZHnhjzw6UGdkhWBaGp9ISM3Ur15ffpL/3w6hZmMcQ
 amkK+hLMd5BrmtjZ+7oAQ6+GeLJR+4kVbMnPWs7Hfx7F79s/dSaGgUq1E+dTthwj1hEJ
 23d5i8tuhkDB6hn4GEAgl8VUPjzLWrL3RlV5cFfZBhcrX7OhD203WOfdB/wk4/ZjXD7g
 m4qAsi8VzNP/unJZdL6LfdELMXysxzPnqFXOPDggyluA8xs+fPO+TGSM745RoHoUvKzJ
 K6ieqeh/f6ND/aiHvcyC3KvFz5Qg+mTevTciEVYnXzhbmiWravrvA8/e8ft6CRiOtoJv
 udrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690580003; x=1691184803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F7AFpVLhQJ5PQc/Bf5DhP3xmGWkfC7iIPHliAm6mja0=;
 b=hT4/I5jk4Lt4RWqeGthTrMCFxxNYbqRfkY5xvXgML8FQ5JDwJ8EEW4L7xtsZOMmksF
 L4xHQLBsMlp4Ft8YicTEXXpNhgRWZjr7RklPs3R4RoHFcNv/Ay/3DEljlgWPQfsMkRTD
 HGCKmx0wo1PWlCb4vkpU5iG/qgUPGYaLbUOWCS6qBmoSf7TqYBcgvAVGjzZaX1tD5eBB
 6VdKXoKkAQlipLl5WZ2EftYrEe07viI8BuyksPUdGVnclj+alqzQ+yeYQkXRTp1HzMxV
 Mehn8em3NiTzX0RVeDwUa8ZFSjqP7JKgeZPVQnbh5yY9xlfuntzURUWfrDF+wLPJqih1
 NJXg==
X-Gm-Message-State: ABy/qLYRytIbEKJ3cGd2ghoRtF8DJrgQ8ZZCOOHwlGGTJg9V57v/RwXh
 hfWrw4bj4N8zSRGublPbbbb5UA==
X-Google-Smtp-Source: APBJJlHxGbDJja2pdb+Wwf+iFSEYszqRvIhTT2xYVNPer07dc5u/0DQg0cL916VpbKbH90v0/mN/MQ==
X-Received: by 2002:a05:6512:3118:b0:4fb:a088:cfca with SMTP id
 n24-20020a056512311800b004fba088cfcamr1289422lfb.6.1690580002982; 
 Fri, 28 Jul 2023 14:33:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a056512389000b004fe13318aeesm956832lft.166.2023.07.28.14.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 14:33:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 0/7] drm/msm/dpu: use UBWC data from MDSS driver
Date: Sat, 29 Jul 2023 00:33:13 +0300
Message-Id: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
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

Both DPU and MDSS programming requires knowledge of some of UBWC
parameters. This results in duplication of UBWC data between MDSS and
DPU drivers. To remove such duplication and make the driver more
error-prone, export respective configuration from the MDSS driver and
make DPU use it, instead of bundling a copy of such data.

Changes since v1:
 - Rebased on top of msm-next-lumag
 - Reworked commit message by patch #5, following the request by Abhinav
 - Dropped DPU_HW_UBWC_VER_xx values
 - Also removed DPU_MDP_*BWC* defines

Dmitry Baryshkov (7):
  drm/msm/mdss: correct UBWC programming for SM8550
  drm/msm/mdss: rename ubwc_version to ubwc_enc_version
  drm/msm/mdss: export UBWC data
  drm/msm/mdss: populate missing data
  drm/msm/dpu: use MDSS data for programming SSPP
  drm/msm/dpu: drop UBWC configuration
  drm/msm/dpu: drop BWC features from DPU_MDP_foo namespace

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  6 --
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  6 --
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  6 --
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  6 --
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  6 --
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  5 -
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  6 --
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  7 --
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  6 --
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 32 -------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 18 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 16 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  2 +
 drivers/gpu/drm/msm/msm_mdss.c                | 94 ++++++++++++-------
 drivers/gpu/drm/msm/msm_mdss.h                | 27 ++++++
 25 files changed, 121 insertions(+), 181 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.h

-- 
2.39.2

