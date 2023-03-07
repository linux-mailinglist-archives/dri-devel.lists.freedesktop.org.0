Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 221E26ADF6F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 14:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD2B10E125;
	Tue,  7 Mar 2023 13:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827DE10E125
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 13:01:43 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id g17so16971061lfv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 05:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678194102;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kAKt9oLN/3E5C6T5cNeSMYOM4tUix3c4gih76FZI0vA=;
 b=IahDkcbRQh6PRKBga5k1xpkX1K12Pac+lBTOjur4Ti0gLOjDDwv1ebWjja2Amzvrhm
 AVSfZeAxWC3H+QVzUX4wJh3PQPOP+uPGPtASewchwgX8v1WgPcJSxGgVQgBCroTPB/mg
 HsMcEAxc695nc9l0DXFd6VCs9bT1zMaTsLnPVxLrfyQiZz305RiOFq5NmWZFETCwTxTc
 9oRwQCpKs9+s2PIOpFs5WN8r4hx5aUJWzDWusUYGb0WLaHKFd0dV7mYbeEp0kMuhqCe6
 Y2KZ83aFKHOAIT87E8HKO9M7AnhXKP18iZf56tRgRKqvRaMDaK5wzV+2K9LsK8WYusBs
 wuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678194102;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kAKt9oLN/3E5C6T5cNeSMYOM4tUix3c4gih76FZI0vA=;
 b=p/vW8a0d1RKsuG/EFVnzeshqMQY99A4TPgZOuipb7cSXQmDWKlDpoPs9AcwfB5ZVBJ
 i8/7ccq9uN+D1OxpCyTwKTjeMAvsyYFzze5bnE9Zxyfrtv0ex+EBlPMU+H/4kEgl3GdX
 P9wTXkTkD8Ic5pZ3f7XBeO9GrU4hdX/agmB8x8Ez7iE1NJXIZTEKI7nS8wq6I+Wm3v9Q
 CE1Inq4GvLFst7W39rb1r0af3Y+DjaH+UDDXnmp4Gs3cP/TPJIES30Dv56VeniNTtun4
 NBroowrrrAB9XMSiPMUTCncEGIEyqXjvfVb5ovyAa5dPPed66rC+TY222SZprA626tgK
 Y1xA==
X-Gm-Message-State: AO0yUKUfCWX6tGoHBntxIl3FRx7h4sZpkFNkRwb+8yOE8wmzH5aA/z9p
 a4Vx1RdCtgewm+J/5vomCO7oVg==
X-Google-Smtp-Source: AK7set8z/qcx87HDZWoD6FwIXZM8Cu3r1uLjF3xt83ugybLjz1wVUQBna8yb7yA/JzAybC+nxf9qHQ==
X-Received: by 2002:ac2:446b:0:b0:4d5:831a:1af8 with SMTP id
 y11-20020ac2446b000000b004d5831a1af8mr4246862lfl.40.1678194101601; 
 Tue, 07 Mar 2023 05:01:41 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 u2-20020ac248a2000000b004cc5e97d356sm2048265lfg.148.2023.03.07.05.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 05:01:41 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 00/10] Fix DSI host idx detection on HW revision clash
Date: Tue, 07 Mar 2023 14:01:38 +0100
Message-Id: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALI1B2QC/x2N0QqDMAxFf0XybKBYxsRfkSE1TWdAq2tUBuK/L
 +zxnMvhXqBchBW66oLCp6is2cDXFdAU8ptRojE0rvHOuyfu6yaEUWX40IIPis6TTalNYM0YlHE
 sIdNkVT7m2eRWOMn3f9K/7vsHASMEV3QAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678194100; l=2768;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=w8f97gizhKeQlAufN/gAw/Y5LqIn6pMqeGASKnoEWho=;
 b=eOnovxHa4VCfpFjQWjo/7ouKcm1gRhvXoxkVoIem0sV72MWp0RQkRWdMHfoK464VMtQQ+jCEmvl8
 xv1AhdMGB6qQcL0Lqc6wVBgRMxS0VmSQ/b3zjT9XMv3HuJRhyP+u
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2 -> v3:
- Merge with [1], I should have done that earlier..
  - Squash 6115 compatible patches into one
- Pick up tags (except Rob's ack in 6115 compatible addition, as it was changed)
- Use b4 (sorry if you got an incomplete set of messages before..)

[1] https://lore.kernel.org/linux-arm-msm/145066db-5723-6baa-237d-7c2b8fd476d9@linaro.org/
v2: https://lore.kernel.org/linux-arm-msm/20230213121012.1768296-1-konrad.dybcio@linaro.org/

v1 -> v2:
- squash the 2d-array-ification and fixing up the logic into one patch
- drop num_variants, loop over VARIANTS_MAX*DSI_MAX unconditionally
- drop inadequate Fixes: tags
- pick up rbs

v1: https://lore.kernel.org/linux-arm-msm/20230211115110.1462920-1-konrad.dybcio@linaro.org/

Some DSI host versions are implemented on multiple SoCs which use
vastly different register maps. This messes with our current
assumptions of being able to map {dsi0, dsi1} to {reg0, reg1}.
Solve that by adding a way of specifying multiple sets of base
registers and try comparing them against the register specified in DT
until we find a match.

This removes the need for the QCM2290-specific compatible which was
used in the SM6115 DT (which uses DSIv2.4.1, just like SC7180).
The series also takes care of that.

Tested on SM6115P Lenovo Tab P11 and SM8350 PDX215

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (10):
      dt-bindings: display/msm: dsi-controller-main: Fix deprecated QCM2290 compatible
      drm/msm/dsi: Get rid of msm_dsi_config::num_dsi
      drm/msm/dsi: Fix DSI index detection when version clash occurs
      drm/msm/dsi: dsi_cfg: Deduplicate identical structs
      drm/msm/dsi: dsi_cfg: Merge SC7180 config into SDM845
      drm/msm/dsi: Switch the QCM2290-specific compatible to index autodetection
      drm/msm/dsi: Remove custom DSI config handling
      dt-bindings: display/msm: dsi-controller-main: Fix deprecated compatible
      dt-bindings: display/msm: dsi-controller-main: Add SM6115
      arm64: dts: qcom: sm6115: Use the correct DSI compatible

 .../bindings/display/msm/dsi-controller-main.yaml  |   6 +-
 .../bindings/display/msm/qcom,sm6115-mdss.yaml     |   8 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |   2 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |   6 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  | 161 ++++++++-------------
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   6 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  14 +-
 7 files changed, 82 insertions(+), 121 deletions(-)
---
base-commit: dc837c1a5137a8cf2e9432c1891392b6a66f4d8d
change-id: 20230307-topic-dsi_qcm-5cd03c230f8f

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

