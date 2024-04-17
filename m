Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ECD8A8C7B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 22:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FCB10F825;
	Wed, 17 Apr 2024 20:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BvdHgcpp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614CF10F825
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 20:03:06 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a526d381d2fso219535466b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 13:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713384184; x=1713988984; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tdMXP9Q/2N2bcDJp1OXtz16aXO1zuRSl77E+ubHuLLQ=;
 b=BvdHgcppYA4jBv8eYd1bzFbOKi3qNj2tGP9pwIzsXMJ9JhPvIAbCKV90+UaKk6EGIY
 pSbpwt0/aZFn5gy1GSwKFesG3hgfJzPsAMiFJ141abJ83AzzmOoAfsPqhIWn4f18eRZI
 lJ/47Dte6uCQKdA2La2r3HYEgDrFmdkS0cyPMy1YixPUJjWfRxqaNDaPSogA8yOl4kQV
 fy8PtVx6HHpzviV+X48liHywrCh0/QrX7rVsb8hWDK1K5OWqPvyWfv+aA9FDyrTd17sg
 nl67aSlEwP65Hs3ycbgRcX5i202covtm20bwuvHJZ8aTNoM3YzVD/hfn/7mMhomj4O46
 oGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713384184; x=1713988984;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tdMXP9Q/2N2bcDJp1OXtz16aXO1zuRSl77E+ubHuLLQ=;
 b=V/vH7P+v8w2XHbfjBPgueX8D5Lm06RZJh93ZJtcXsXRWWrKN8PTAYXPJn08BjIlEB9
 SGajnPbnw+n17S9f3Ob3GfBnwNS3lD0ZyKcKd6TQPwPqVPaj+2Bdg8H0X5R8I0o+92D/
 hydkFijEQuuAUUDd0C+mVUQ7K9fqSbNdblC6mIm132xyjR36QKUdrFCxMWeIfgR/djj1
 JyRq2TcAkEXkCrRGi8huyfghSHpu3CE6ECWUs4+ISm0TzZuS0Qu9FkSPXQJxGOqPuV26
 qBuCF5XEJdukYx6zC1hNGqjtIHFuLWu8C9BvRhp6lvDyzJMaobvUVFUhepK5GJB0WLq0
 THgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxUwBakWiAO5H+n9VV/73Gm/1WdwDD7vV1/thL1oE0ZA/HvlbGlMYQxhR143oB30OUvohfy2tEUdh0g0uy6F4fPC5QHm+4YTYNhCCQUJcS
X-Gm-Message-State: AOJu0Yx0K9up/7ZOkapK3gSxBgF85SGyadFoTK0cXHEhpCRdk6OmR8Uc
 xbI8sADZo8XuPiHUJ3biIOXjdmrD9OYnM/IbTAqbP/ltSp/2fm+5y8u4+TwYDX0=
X-Google-Smtp-Source: AGHT+IHJn6r/VkcN7BUe5TY1y2qtDETHmV5Y4YSmS9lKPUDa1Ar8h6bYFFVkY2orMC4dB24dRrOEcw==
X-Received: by 2002:a17:907:36c1:b0:a55:6135:7ab7 with SMTP id
 bj1-20020a17090736c100b00a5561357ab7mr163979ejc.6.1713384184137; 
 Wed, 17 Apr 2024 13:03:04 -0700 (PDT)
Received: from [192.168.45.55] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 xa4-20020a170906fd8400b00a5252e69c7dsm5905590ejb.160.2024.04.17.13.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 13:03:03 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/7] Add SMEM-based speedbin matching
Date: Wed, 17 Apr 2024 22:02:52 +0200
Message-Id: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOwqIGYC/22NQQqDMBREryJ/3ZQkaJGueo8ixSSjfqiJJBJax
 Ls3Fbors3oD82ajhMhIdK02isicOPgC+lSRnXo/QrArTFrqWpaINSxsRZoxP9ICOMNetA6wTho
 MElSWS8TAr8N67wpPnNYQ38dJVt/252v++rISUlho015q3Sijbk/2fQznEEfq9n3/AOJYqwO3A
 AAA
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713384181; l=2910;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=DJ8DSD99sxYhrIfsLOLcFHZ/8SkT9S5JHfim2UIEGSk=;
 b=qPZ9W7adu9DGmD4JrUVkPIxmZpfCiw/Zfg4GfqJo5ewDABLjWBmW8KhtVN69tnCvwbjFzsZE8
 wueUz4LeEDxDsH/1HVL2yf7+59ucDJZ5PQfqTXiOaOCFikruX6L3QLi
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
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

Newer (SM8550+) SoCs don't seem to have a nice speedbin fuse anymore,
but instead rely on a set of combinations of "feature code" (FC) and
"product code" (PC) identifiers to match the bins. This series adds
support for that.

I suppose a qcom/for-soc immutable branch would be in order if we want
to land this in the upcoming cycle.

FWIW I preferred the fuses myself..

Patches 5 and 6 coooould be omitted, but I'd reaaally like them to land
and soon at that. This would enable even more overdue and necessary
cleanups/feature prepwork sooner than later.

The dt patch can only be picked if the drm patches are there.

Depends on:
https://lore.kernel.org/linux-arm-msm/20240412-topic-adreno_nullptr_supphw-v1-1-eb30a1c1292f@linaro.org/

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Separate moving existing and adding new defines
- Fix kerneldoc copypasta
- Remove some wrong comments and defines
- Remove assumed "max" values for PCs and external FCs
- Improve some commit messages
- Return -EOPNOTSUPP instead of -EINVAL when calling p/fcode getters
  on socinfo older than v16
- Drop pcode getters and evaluation (doesn't matter for Adreno on
  non-proto SoCs, might matter in the future or w/ other peripherals)
- Rework the speedbin logic to be hopefully saner (accidental support
  for A2xx-A4xx, I guess!)
- Reorder some existing function calls to avoid crazy nullptrs
- ""fix"" the smem dependency inconvenience
- Link to v1: https://lore.kernel.org/r/20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org

---
Konrad Dybcio (7):
      soc: qcom: Move some socinfo defines to the header
      soc: qcom: smem: Add a feature code getter
      drm/msm/adreno: Implement SMEM-based speed bin
      drm/msm/adreno: Add speedbin data for SM8550 / A740
      drm/msm/adreno: Define A530 speed bins explicitly
      drm/msm/adreno: Redo the speedbin assignment
      arm64: dts: qcom: sm8550: Wire up GPU speed bin & more OPPs

 arch/arm64/boot/dts/qcom/sm8550.dtsi       |  21 +++++-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  34 ----------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  54 ---------------
 drivers/gpu/drm/msm/adreno/adreno_device.c |  13 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 103 +++++++++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  11 +--
 drivers/gpu/drm/msm/msm_gpu.c              |   3 -
 drivers/soc/qcom/smem.c                    |  33 +++++++++
 drivers/soc/qcom/socinfo.c                 |   8 ---
 include/linux/soc/qcom/smem.h              |   1 +
 include/linux/soc/qcom/socinfo.h           |  34 ++++++++++
 11 files changed, 198 insertions(+), 117 deletions(-)
---
base-commit: b13768266bf3a129adf5bbd0bad28e23a74329a2
change-id: 20240404-topic-smem_speedbin-8deecd0bef0e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

