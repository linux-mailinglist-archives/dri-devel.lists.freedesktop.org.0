Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F897BEF25
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 01:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D313810E0D7;
	Mon,  9 Oct 2023 23:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAFB10E0D7;
 Mon,  9 Oct 2023 23:33:59 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-4526f0bdf72so1946176137.1; 
 Mon, 09 Oct 2023 16:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696894438; x=1697499238; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=24TAuM3cmLFZcuAvvlbYcV7E7zxrlJcR+LOIybCTopM=;
 b=ADmAwhonKFIAvbMQ0Y/7ePnCOtV6NbMVr7jhuQN3BoUEmpcfaGDT7cVAylTP3V5xfV
 p3rF4ukFo5ujnGFUyCclPypqm6ekU1ZVPkbG1Q5ejK3PQgAmFFiQfUc3zp5KchoToU0D
 poi5++7RdBw90B/8wIKjX5VPeJq7Ap9bcP6sjssJgGf2spV7hYYEYA8TqJMO4/I+wOIf
 fcv/wP0cMzK4ImWdxjkPSau8UmWj7jcCkPiEFdgBgPDfEfp1CfD5uWceTKkD06/GT+ug
 Asjm1oENW7qqYamJG6j3nuLDvgu0rm/GRptlGX5JU7xgr86qOpVmO2MCCPKiXw7myFF1
 KTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696894438; x=1697499238;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=24TAuM3cmLFZcuAvvlbYcV7E7zxrlJcR+LOIybCTopM=;
 b=pENs0mS3NODj7u8taAI/KWoXICHYHOBdZQH1Wm9crmp5f3qUMSF545J1VnhLiQInrY
 8RufqsvvahbrbW68wLwAzqosdNFpxxAq1ax3a+/V4xh6K2cKsiV+MDvFifdTIY0YGGLW
 eThrLSB+rUWJvlfL67qKvs7u2pPYBa7fpNL65vj1c4MeiK4GcEZw36x7LPiP8FZHhLig
 GLH+K5V64k8zCHJoPSRghMxIG33pbGw1VLEoU0YRyobgBn58JLjlaJKoU/2rZQD1BhIC
 Tc7ya2Z+5Y4hpcI879Hlhra83lYQ45i/Gf+zQMGOA+xx83BgGsut29O+jODq3V5K8j2O
 lRJg==
X-Gm-Message-State: AOJu0Yx5A982BcSTMy3btYSzMjADCjo7R6QtcdG6WCJiqbwRoCm3D9/V
 dPurqrBUdlygJjAmUJcrI5Q=
X-Google-Smtp-Source: AGHT+IG4nZoYJfg9tcP7e2IgjNp0p7tfVw76OSdCMUhH2QkyRSVgv8kkdhMc105Ag9fnC3Hkn+8wNA==
X-Received: by 2002:a67:eacf:0:b0:44d:47c2:7471 with SMTP id
 s15-20020a67eacf000000b0044d47c27471mr13340465vso.27.1696894438567; 
 Mon, 09 Oct 2023 16:33:58 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::1d3d])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a0ce513000000b006616fbcc077sm4289486qvm.129.2023.10.09.16.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 16:33:57 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Ryan McCann <quic_rmccann@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Liu Shixin <liushixin2@huawei.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/6] SDM670 display subsystem support
Date: Mon,  9 Oct 2023 19:33:38 -0400
Message-ID: <20231009233337.485054-8-mailingradian@gmail.com>
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
Cc: Richard Acayan <mailingradian@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes since v2 (20231003012119.857198-9-mailingradian@gmail.com):
 - rebase on series and reference generic sblk definitions (5/6)
 - add interconnects properties in example (3/6)
 - remove phy-names properties from dtsi (6/6)
 - accumulate review tags (4/6, 6/6)

Changes since v1 (20230925232625.846666-9-mailingradian@gmail.com):
 - prefix dsi1 labels with `mdss_` in example dts (3/6)
 - make all parts of catalog entry const (5/6)
 - add spaces before closing brackets on same line (5/6)
 - join opening and closing braces on the same line in dsc array (5/6)

This series adds support for the display subsystem on the Snapdragon
670. It is based on an earlier patch a few versions back, which had
missing device tree bindings and device tree changes.

There is a separate IOMMU patch which adds the MDSS compatible to a
workaround.

This series depends on https://patchwork.freedesktop.org/series/119804/.

Richard Acayan (6):
  dt-bindings: display/msm: dsi-controller-main: add SDM670 compatible
  dt-bindings: display/msm: sdm845-dpu: Describe SDM670
  dt-bindings: display: msm: Add SDM670 MDSS
  drm/msm: mdss: add support for SDM670
  drm/msm/dpu: Add hw revision 4.1 (SDM670)
  arm64: dts: qcom: sdm670: add display subsystem

 .../display/msm/dsi-controller-main.yaml      |   1 +
 .../display/msm/qcom,sdm670-mdss.yaml         | 292 ++++++++++++++++++
 .../bindings/display/msm/qcom,sdm845-dpu.yaml |   4 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 292 ++++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_4_1_sdm670.h    | 104 +++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                |   7 +
 9 files changed, 702 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h

-- 
2.42.0

