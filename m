Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC926BC9D1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 09:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DA010EA55;
	Thu, 16 Mar 2023 08:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7DF10EA1E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 08:51:12 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id l22so833529ljc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 01:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678956670;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MRHfhPkQQmxxwKiYMeDcsdJG0r8Xhcdja24C67w7tIY=;
 b=hcC4eZRs2DELd3vLetjO82Iol3rJDXo/hCDQeg7tLZ8kRDgvSECRSnk5OlDwcew6av
 7xzBBWWC5yqVlMyzlfugZ0Zrx9zNXqmofTO435INIk5aZ6FnVTUZMlY8sWv0JECxfBwT
 RPf2E2Uq7nXrhtYSt2KU9u9bAq4CjojNQKNZ97VBZ12POg3p5vLreaDJ0Bs+0w4PF4Wo
 JDJ7FOVXgPln5OozfBzmIixxydOtpi8TVgpuaHYhJCEIhEmR+rlcQgeqNZYptg5soARF
 mY3GXopOkb65xykCKCHPm6mTiWQOPgjAVuHT4BXxrn5TjFWJv89xo79O75Bs76Rpr7XF
 EZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678956670;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MRHfhPkQQmxxwKiYMeDcsdJG0r8Xhcdja24C67w7tIY=;
 b=Ez59SQZV1nyDRbt98a6kwW1FsI+bhG20vKTMDn/Alr7mJdyuiuymPQLIjfmB0ujKZu
 i1lF6XFul6SrF+x2Z7ZMlivMOZ11zSgxF+7uXIywGve2VE7Oo0jhu5MEzE1prD3W3A3n
 sv9nwjJN10UK33BlRmHkkKrfhGLvy/pqfxEy/tkHgdL/+Tu91U4tq6HkI2NXLa2qg8Zb
 Wuye54rVZzLZMY2ypHPx30c/7YF/r2Fhs0aNsWKnUZoGtwx/yqDUA5U0LQeEDayzhgeU
 9g5pTlwLc9T2MMJw5Oo5JMyxk9z6opvB8YO/7vFKAs43WVCx0uVFqSXRRdn93mjPzJST
 Kicg==
X-Gm-Message-State: AO0yUKUjCAXMz2wRTpygPVENQryXxxptvXwol6JgQTGyDXO6OPoJRDFu
 LIalWVOjL9Cb1sHRXL9G1morPA==
X-Google-Smtp-Source: AK7set++f4e0zAJlzPQd1RsCU44TuFEl32Qs7tdY3yyXR48HHNXGbN1BTY5YuC7B0ioIHD0vd8DTJg==
X-Received: by 2002:a2e:be89:0:b0:298:6cfa:3773 with SMTP id
 a9-20020a2ebe89000000b002986cfa3773mr2251503ljr.37.1678956670439; 
 Thu, 16 Mar 2023 01:51:10 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a2e730b000000b002991baef49bsm251566ljc.12.2023.03.16.01.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:51:10 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v5 00/10] Fix DSI host idx detection on HW revision clash
Date: Thu, 16 Mar 2023 09:51:06 +0100
Message-Id: <20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHrYEmQC/32Nyw6CMBREf4V0bU2hJRRX/ocxpi/gJthii42G8
 O9e2LnQ5ZnJmVlIchFcIqdiIdFlSBA8Qn0oiBmU7x0Fi0wqVnHGWUPnMIGhNsHtYe60NpZxg1U
 nO4KOVslRHZU3A1r+OY4YTtF18NpPLlfkAdIc4nv/zHxLf81nThmV2jauVNZyqc4jeBXDMcSeb
 FNZ/NUF6rXQQraylK3RX/q6rh+D9Gtl/wAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678956668; l=3422;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=0MXjDNpERjKFXSKU2j+B9Z5K/vxYRzMBl75jFNCiDc4=;
 b=WjlkY2e3xNCFyGqRWQA0InNPbPPw+tF84Td75phjejo9KwAUuyMPrP7ckVQhBDi1lB6JP3W4wMKF
 sariP+AfDFWIBtINMU0tfylRvVlgTIlnlbd1V5V0I8TuzR3qz1U7
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
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v4 -> v5:
- Drop superfluous items: level in [8/10]
- Remove the header define for the qcm2290 config in [6/10] instead of
  [7/10]
- Pick up tags

v4: https://lore.kernel.org/r/20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org

v3 -> v4:
- Use the shiny new compatible in the 6115 bindings example [9/10]
- Remove the leftover include and header definition [6, 7/10]
- Deduplicate the qcm2290 clks/regs in the common deduplication commit
  instead of doing it separately
- Pick up tags
- Rebase on next-20230314 (nothing seems to have changed fwiw)

v3: https://lore.kernel.org/r/20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org

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

 .../bindings/display/msm/dsi-controller-main.yaml  |   9 +-
 .../bindings/display/msm/qcom,sm6115-mdss.yaml     |  10 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |   2 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |   7 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  | 161 ++++++++-------------
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   9 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  14 +-
 7 files changed, 84 insertions(+), 128 deletions(-)
---
base-commit: ec0fa9a0a6fac454745c930bdb8619d0a354bac9
change-id: 20230307-topic-dsi_qcm-5cd03c230f8f

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

