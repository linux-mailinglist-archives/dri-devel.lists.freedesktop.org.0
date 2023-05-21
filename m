Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B26D170AF20
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 19:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A5410E1E1;
	Sun, 21 May 2023 17:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EABC10E1E1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 17:10:30 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso5611979e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 10:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684689028; x=1687281028;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fYV/rFxGmAkYvn7ECK1PtdeztFOLj2h0SHwr4ArK2io=;
 b=b7kX0/aXlmNZOFeh11PvW+LciHypbh4eT2g27ddcMy40Rc33RIjxdu4P+A0pr+ye1U
 SCeYRjpbXGpvV6ghLmO5HmW9F2Kn/upBsOQdebPcwG7Vx4Rwe7fv42yTTCyErU4D6Xtx
 ZzsEgHT/et8Qf+isIMTxHIMPXbGBWVdz3YQacpjWQH3LWDzoAVVYRagptmGdZGZMcfq4
 0D+N8x3qlQP5LtcqbO3nI8VUrE1VG1nLOA4lL9zwmvUkg911NI2AoflhGBBOJy+i4pbY
 28Zb5FMIAGuujAlFDYbYrlMkVVNzUtX72Irs2kZFUMOq4OGTmMhNVkctRS5CxKlVuc9J
 YgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684689028; x=1687281028;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fYV/rFxGmAkYvn7ECK1PtdeztFOLj2h0SHwr4ArK2io=;
 b=ixfzfDjKxnhROYEFhZLJ7WdqrDUR07ML6sQYSoipCxemtQiTpbZLqRUHtgjNa3jSfy
 P/sBvC7nn+dac7JNpB3QJm/2iDZ5x5hvsqyKbdRwBGhUn5853MG9ih00McLlkv2V6y6S
 /cqfb3Wti07Fg6dLP2LeQXHPjUphGZcDh+Ci94Hu/Pgdu9dMvxPitiLGa8/0iMVWRfFg
 I9PbFU0+9crcsbRNOExDMWvrmudbwFFaWEjmBJKDTtYhzseIsWSKC5sB5aakd0P8zuqy
 5/MvfpcZAlqpreeCnG2t9W7FRLKDhBhlUYv5fnTlGDAHUKMMVXtlw4dtZH0VOtv4iuY/
 D4Yw==
X-Gm-Message-State: AC+VfDwLSXfUu2jFHP34cuATxH8VFCn3pBoWF8rKlQxpoUhWRmtj1I8A
 gCjig+2+AwnJ0Q9L7c5hFndahQ==
X-Google-Smtp-Source: ACHHUZ6yRkEK5cbVc6jo5msqa4pTXUv+RLs3eukHFXQv28lAf3WCIaPNb9bEed8K2ne5prVReOxDJw==
X-Received: by 2002:ac2:5ec2:0:b0:4f3:94b5:3272 with SMTP id
 d2-20020ac25ec2000000b004f394b53272mr2708446lfq.11.1684689027985; 
 Sun, 21 May 2023 10:10:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k19-20020ac24573000000b004f00189e1dasm680493lfm.143.2023.05.21.10.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 10:10:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/6] drm/msm/dpu: use UBWC data from MDSS driver
Date: Sun, 21 May 2023 20:10:20 +0300
Message-Id: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both DPU and MDSS programming requires knowledge of some of UBWC
parameters. This results in duplication of UBWC data between MDSS and
DPU drivers. To remove such duplication and make the driver more
error-prone, export respective configuration from the MDSS driver and
make DPU use it, instead of bundling a copy of such data.

Dmitry Baryshkov (6):
  drm/msm/mdss: correct UBWC programming for SM8550
  drm/msm/mdss: rename ubwc_version to ubwc_enc_version
  drm/msm/mdss: export UBWC data
  drm/msm/mdss: populate missing data
  drm/msm/dpu: use MDSS data for programming SSPP
  drm/msm/dpu: drop UBWC configuration

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  6 --
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  6 --
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  6 --
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  6 --
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  6 --
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  5 --
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  6 --
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  7 --
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  6 --
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 15 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 18 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 16 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  2 +
 drivers/gpu/drm/msm/msm_mdss.c                | 90 ++++++++++++-------
 drivers/gpu/drm/msm/msm_mdss.h                | 27 ++++++
 22 files changed, 122 insertions(+), 139 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.h

-- 
2.39.2

