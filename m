Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 833BC861EB2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 22:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A62010E099;
	Fri, 23 Feb 2024 21:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hl32Sn61";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBE210E099
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 21:21:48 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a3e75e30d36so241891466b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 13:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708723306; x=1709328106; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3qOtgMPjyNgM5pphCQWRy5M3sSPymURGErwjzDyDOL0=;
 b=hl32Sn61PVIKvGKiCdUV1lio0AcKOvvA1vBz/q2Aasi+I89IblhusbRPyxBRm0fjRM
 T+r1H+PJRSdpDeULdg3JVWm4+dqa50pnExA5dVm7tYlFWJ74L2rV0vLdNVTIISSJmeLy
 eiTbRkxdtD20lMZg0XdHyihTmv+xSdskZSLSszqsBBRZHifYa05YgwydB0Ir+cPfS3Bo
 otdMX5SZlx72tz2ftX1dCoUr6fpDVaV6rxWaQro7LqfeOBOZARmwzvvRNLm6qztiNm+R
 +fkh24yG4bSSyH7a8rHNc/fxQr42l3hKq5h/TVFg/ptph8/EMvNPcRwudt+DhggJyoTY
 rMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708723306; x=1709328106;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3qOtgMPjyNgM5pphCQWRy5M3sSPymURGErwjzDyDOL0=;
 b=ooUQ+n3MLu2Dyid0lvS+F8CJ/Al9WQSZxmJXGpEH1kXvIZAooVQ3v0jY2BvnBpfSgt
 TSs2ZNJhs+Qrk86JnZKtAbY4+KfnojvYMJZgAAHykTfBzpG2a951b6PT87hWMSgTt34V
 cA2grryigVjzQ6Qif6Gv2BDQXBN62bBWHSjYy6nrG8PUYO34D0WBIiQdlkyM41LWQaLC
 kKn6HRT737JvPfWa+4IUHwZQ7eO89SNgVZmPcXGFUkjwf1W1O3worB9OInDjKrKOzrxI
 4xAqGTcRoNab//jrZ8Y9QmINgiUMKgrpvKGibqyz4YPCVkzzKPppsbdBS2JNOB1D/Mnx
 YnMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjAlzHz1ZT7lvBWuC80r8Wo4FtwqwLdsDmMHwWgOxAJvqytctL6xS8EAnmJz9ve3C29W3/slrIuaSMBsC49bnpSTV0aicpwrXVcB/00ss0
X-Gm-Message-State: AOJu0YyV1bsSgRqD9jPeI7nwMWEy6ibsyJs5FIaN3iL0OB0VIjr/bvlJ
 +p7A2SXX1LOjzpP6G2VPKw0OBSujDVsvDGGg9nkn2lfH00ClouyK5nil/NZBJbU=
X-Google-Smtp-Source: AGHT+IHNsRoCGn0GHTzTMfxgVcZdziz1Uz8p/0O7ANbTl1s5RH6d++8nVtFJ+a8mGI1yevbhqwpi0w==
X-Received: by 2002:a17:906:fb06:b0:a3e:8bd8:b711 with SMTP id
 lz6-20020a170906fb0600b00a3e8bd8b711mr685947ejb.37.1708723306292; 
 Fri, 23 Feb 2024 13:21:46 -0800 (PST)
Received: from [10.167.154.1] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 mj8-20020a170906af8800b00a3ee9305b02sm4091226ejb.20.2024.02.23.13.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 13:21:45 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/7] A702 support
Date: Fri, 23 Feb 2024 22:21:36 +0100
Message-Id: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGAM2WUC/3WNQQqDMBBFryKzbkoSraaueo8iJcZRBySRiUqLe
 Pem7rt8D/5/O0Rkwgh1tgPjRpGCT6AvGbjR+gEFdYlBS11Ire5iCTM5wa16DfMqcnTGlSaXuSk
 gbVobUbRsvRvTyq/TlOTM2NP7jDybxCPFJfDnbG7qZ//db0pI0elS9tbcikpWj4m85XANPEBzH
 McX0NVltcAAAAA=
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708723303; l=2367;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=7tHpBwYBjs0QIZxWGt5a/fib2c1/MZ4A6oZE+Z30PYs=;
 b=epuG5oAKrr533fJKmkaFnj1FjTAPxNoYkEMcHz+KHP4gzlrOn5lsXpP9f1YjnwX0/IsJ6cXt4
 ZTN2yx5xm87CgDWY+vMjlaY6zIT3LRax1dgd2sxLnp0EOV4B4xdjC4F
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

Bit of a megaseries, bunched together for your testing convenience..
Needs mesa!27665 [1] on the userland part, kmscube happily spins.

I'm feeling quite lukewarm about the memory barriers in patch 3..

Patch 1 for Will/smmu, 5-6 for drm/msm, rest for qcom

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27665

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Drop applied smmu-bindings patch
- Fix the gpucc bindings patch to be even better
- Reorder HUAYRA_2290 definitions near HUAYRA (..Add HUAYRA_2290
  support..)
- Replace weird memory barriers copypasted from msm-5.4 with readback to
  ensure timely write completion (..Add HUAYRA_2290 support..)
- Keep my super amazing commit message referencing the 3D accelerator
  official naming (dts)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org

---
Konrad Dybcio (7):
      dt-bindings: clock: Add Qcom QCM2290 GPUCC
      clk: qcom: clk-alpha-pll: Add HUAYRA_2290 support
      clk: qcom: Add QCM2290 GPU clock controller driver
      drm/msm/adreno: Add missing defines for A702
      drm/msm/adreno: Add A702 support
      arm64: dts: qcom: qcm2290: Add GPU nodes
      arm64: dts: qcom: qrb2210-rb1: Enable the GPU

 .../bindings/clock/qcom,qcm2290-gpucc.yaml         |  77 ++++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 154 ++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |   8 +
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  47 +++
 drivers/clk/qcom/clk-alpha-pll.h                   |   3 +
 drivers/clk/qcom/gpucc-qcm2290.c                   | 423 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |  18 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  92 ++++-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  18 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  16 +-
 include/dt-bindings/clock/qcom,qcm2290-gpucc.h     |  32 ++
 13 files changed, 889 insertions(+), 9 deletions(-)
---
base-commit: 26d7d52b6253574d5b6fec16a93e1110d1489cef
change-id: 20240219-topic-rb1_gpu-3ec8c6830384

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

