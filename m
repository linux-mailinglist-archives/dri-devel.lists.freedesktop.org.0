Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E81EF6BFA53
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 14:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9809210E030;
	Sat, 18 Mar 2023 13:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3598910E030
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 13:42:55 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id t14so7790858ljd.5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 06:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679146973;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aoDJ8tgBfhVlFJ+Sqb65rdLWV7tk4Je6VKT+ZmQqWQY=;
 b=J/ToYdLWzxmkTYdFGSCkFd3uejmmm49zIMOmjpf3LPkl3NACTtHo/sycfAPhIQCKd1
 ijO5B4vzJne/QTo5EYVlFEfrA0N22AMfxYVsiWAhjy9g6JMtNXs2NkppmxzQM7XSdIfk
 IHg3uNN3wypmbIjna6ZqE+Q/V64DounYEZqHCE5xT8t+2o1XjNl5Q/iuM4sYXEoLba56
 Fo8Xav3FUgRzxdiaPb+YnxZvxUwfvfPjfx2VCgBLwL1rDa6bC9CHnSzW62O02yRPbMNw
 PpnVFCAPBqTKE85BB8s6SvLWxCDm2Oz46LFySo+g6vQpxz3NFeyFHgIHIKSCpRmB0Skg
 nx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679146973;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aoDJ8tgBfhVlFJ+Sqb65rdLWV7tk4Je6VKT+ZmQqWQY=;
 b=l+6gMedtqtzmkZ6ULl5KYFXCtFufpQnAVzunkaHwnuER/1Rainc0UyqhVZf1atpFJP
 g0rPgKAyJoP2uPy08eQEZy6blX+fYPGgZqQZFZTRIdQ9DmxiO1EKq1aaLYc0hnKZu5N1
 5SkuB+rBqsHmXFcIW0cFirqkGxCg1A7v5L4DV9/k63DqTDPbCPS5sCcg26CQTvVx9LTa
 A4ieQHHrqa7PNjVZwTyilbrQ0DwGgia7qzVQiMGLnJggFwrWuHZmWbFwrQoEHc58rSJT
 CZPCrHWqunw6t+WESsgX2BBPjHtizy5YMHea7qjKVNKqliwJZkAKu/nl+a3sK73Ts5B0
 7gUQ==
X-Gm-Message-State: AO0yUKXYzS6jjh5OdrhLv7av1hYuHkTACQkr1Btc4jIk16PRnzvGHJZS
 4z5BIQbym6qCadJZEJGa7YBVAw==
X-Google-Smtp-Source: AK7set9FJyVQtazsYLVyyeoyaoZuSSz+pdl12oHabrVeLkrV8NzXZr3skEyAVX//du3/iskNrEVQUw==
X-Received: by 2002:a05:651c:30e:b0:295:9bb9:18c2 with SMTP id
 a14-20020a05651c030e00b002959bb918c2mr4272224ljp.18.1679146973168; 
 Sat, 18 Mar 2023 06:42:53 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a2e9d82000000b0029a0b50a34asm888367ljj.36.2023.03.18.06.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 06:42:52 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v6 0/9] Fix DSI host idx detection on HW revision clash
Date: Sat, 18 Mar 2023 14:42:46 +0100
Message-Id: <20230307-topic-dsi_qcm-v6-0-70e13b1214fa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANa/FWQC/33NTQrCMBAF4KtI1kbSJrGpK+8hIvltB2pSk1oU6
 d0d3Yno8r3he/MgxWfwhexWD5L9DAVSxLBdr4jtdew8BYeZ1KzmjLOGTmkES12B08WeqbSOcYu
 noAJBY3Tx1GQdbY8qXocByzH7ALf3k8MRcw9lSvn+/jnzV/trfuaUUWVc4yvtHFd6P0DUOW1S7
 shrahZ/uUAuhRGqVZVqrfni8i+XyFsnai5N0wQRPviyLE8V8SctPgEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1679146971; l=3530;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=SJKR/yRyK+QyIMN8YXIaWu+b8CAxrf2Sm6cHji18Kr0=;
 b=z0eDZ0hkuE8Bzn8KJ55e6GLvKCEC8JDXh7DuHlkdoyO1DBbyFxvZVivGL5TjUuNlrCYbNDZy1xH2
 9VlEZ50OBhtqxMVnJ3qEBzM0AMJe4h23TCSrwWf66Sik90K00Ewg
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

v5 -> v6:
- Squash both fixes that concerned the deprecated QCM2290 compatible to
  avoid warnings

v5: https://lore.kernel.org/r/20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org

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
Konrad Dybcio (9):
      dt-bindings: display/msm: dsi-controller-main: Fix deprecated QCM2290 compatible
      drm/msm/dsi: Get rid of msm_dsi_config::num_dsi
      drm/msm/dsi: Fix DSI index detection when version clash occurs
      drm/msm/dsi: dsi_cfg: Deduplicate identical structs
      drm/msm/dsi: dsi_cfg: Merge SC7180 config into SDM845
      drm/msm/dsi: Switch the QCM2290-specific compatible to index autodetection
      drm/msm/dsi: Remove custom DSI config handling
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
base-commit: 6f08c1de13a9403341c18b66638a05588b2663ce
change-id: 20230307-topic-dsi_qcm-5cd03c230f8f

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

