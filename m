Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B837A855DB4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 10:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF8D10E468;
	Thu, 15 Feb 2024 09:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xjadAem4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BC710E46B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 09:20:32 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3394b892691so411932f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 01:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707988830; x=1708593630; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sCJIqfXANTyxQ1cWg0J7Xq3pgA1x4Oyiz3VOApAbg7U=;
 b=xjadAem4CExCAJHSd0OYRYwAKOezT4M7Ke4t+FHI/XxnogBxfWdsGNnQNzKrahNFWh
 26UlVkOt3IoRAxuI4rS6hRMNn5c/fEAqN81yuSkHOxPfOvfF8X/r8Zk/tNbja7pqbyff
 lDqzTXZx/dyJJoxc1QLPkOtTR3ahI2z69ooewMLnlRXCdmUoNUa/gxv1Mn4CPyyK10uQ
 Nimggnl//LDFSYJSuSg0d0ZVKzsRYVMMauj81DcCs7pN/juqf1qjqqCQX94SqY+QV+xz
 4XvVq/FtICOYa0z2dUqTTqEfWLyJEVOyhwIVl5LE7Yz6YTq9O5W8mVVYJG2dpS9xWpJz
 PmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707988830; x=1708593630;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sCJIqfXANTyxQ1cWg0J7Xq3pgA1x4Oyiz3VOApAbg7U=;
 b=M/APXKxf8hFtkB8hymuEO5P3taEcBlIMO8Oeou6FWDpox7HHbmo2vypP5kw5Mg1aeX
 t6IVJxzF2U9IhTV8Qiq6Mm5oAN5e4WFWvgzjEJuFYI9c54GCAeLmVxipLJWRZh4LTGET
 7VsYuw7j4dpun69T94si3c124vRUbJb9GL+TvNpNpHpEs3DXC3a65/1oG7KatLWM1+L7
 FrK8Ce5w9omUKs/bFJGh32AP7rVwr+9OpJ53qLPSj4+z0PU6HBA31bG0wYQFn8oczyG7
 JLFv7ZTgVPtQlOo/m93wW2gU5sfRMgh2gmANgSnRS4yTFAuYdBGkAPv7Kl1fvlg6W6Yr
 plQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXagw7pZA9AuGnAmPTvDpD5+/e6KLqcmadRCP+qe/0fIIzyBIiQXNeLVu3mPMoeDsGk8E3EFGSIR+0KJJ00QrvYZYGB4W00i4Mws9dxXrYa
X-Gm-Message-State: AOJu0Yw1aoUl3bXKBD/o5TEPRxnaX6b2NRUQuWxKi9g9clVt2NpC7qwV
 2PHK+Az7RoewUhF5biayU8JzVwJUZhIwEX0gxaGWL3vfwkmNOHVFrpDksAYm7yw=
X-Google-Smtp-Source: AGHT+IEzIX1zQSb8A6KxIEeLGYgLf9voInovtkhGG2UhbsN7a14+GKlnqiOaIdXdfVUStV6dDYTqFQ==
X-Received: by 2002:a05:6000:107:b0:33b:68d2:c5c9 with SMTP id
 o7-20020a056000010700b0033b68d2c5c9mr1080779wrx.8.1707988830565; 
 Thu, 15 Feb 2024 01:20:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 l8-20020adfa388000000b0033b66c2d61esm1156435wrb.48.2024.02.15.01.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 01:20:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/6] drm/msm: Add support for the A750 GPU found on the
 SM8650 platform
Date: Thu, 15 Feb 2024 10:20:22 +0100
Message-Id: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFbXzWUC/2WNyw6CMBBFf4XM2jHTSbHVFf9hWPCoMInSpkWiI
 fy7lbhzeU5yz10huSguwaVYIbpFkvgpAx8K6MZmGhxKnxmYWBOTxdkH6TA97KkkHMITtT33peO
 OW2Ugz0J0N3ntyWudeZQ0+/jeHxb1tb+Y4v/YopDQkG00tUabtqzuMjXRH30coN627QOHQsx7s
 QAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2303;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=oKbyhmQGCK031NDJvd+F9DRL6rEnKmMTN5jcd28ewGo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlzdda1ja3qYhAQD7TxJTXjXvRhkZhcdgfDhtOGB6t
 eX40jEuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZc3XWgAKCRB33NvayMhJ0dKTD/
 9nfYKPsMq1aO/WX60Xfgt6f16R8W7MWflfkynuv7YMpLAyGWDhQOfa7do6lQyxZF2YnwHshnk5YDqK
 dpGFlzMbP3+/zsMVADh2Vy0Rj1FtwUhggfW/IQ2I3UT3IA2MdXedNxVUq4rJBiXdjEsrkoWgAHofSh
 /rNgcsKpu+aEuP9qRCSCMhdYBjVWBU0/ubDi1qnarYadzUqSoAdGgE2hdV1NVrLtmevG4A6PKAjgP4
 mIaQLOrLSuLsvcpOo3cBLYUwSPpHZWQlX4aH0ZPmteXd1Z6iRWE/ynBE2mylsOp2jaKITp1NQnfiJw
 7VKLUt56d3yGbqAzm8yylY+5199zJcQ3iKZLq0wpU5cgBEcKC0iZpJ6r4w4N2PQV70Qmi0MrPPo8Df
 RK82H8IgsRwkTtUerZsLpJ4ktXizoJCtNZ6Yrk9X2zg01oFvhPDyynhh7NfksxuhrO1bPiC7YT3Ccv
 desZDq2p5PWEl9g77A5OXuN/M0/ZgTtrFztrqZb2kzk5RRTmA+6Ig0WhF/2rn9qOs6BzwndTc2y5fA
 RBvb8z5e1EuCKwQMzpcjdab9pZIg6FSVE0Et1MLBAI3M5p7N8zFA+ftQis9Q3KWYcgLfk9NmNY49xO
 rtPWO4swkMjDEwDuFZAEiJx2VnGuFsaVvSUNZptT+CULYH0fWDDIWW1kfrWA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Unlike the the very close A740 GPU on the SM8550 SoC, the A750 GPU
doesn't have an HWCFG block but a separate register set.

The missing registers are added in the a6xx.xml.h file that would
require a subsequent sync and the non-existent hwcfg is handled
in a6xx_set_hwcg().

The A750 GPU info are added under the adreno_is_a750() macro and
the ADRENO_7XX_GEN3 family id.

This adds:
- the GMU and SMMU bindings
- DRM driver changes
- DT nodes

Dependencies: None

Tested using Mesa's !26934 Merge Request [0] on the SM8650-QRD
and with kmscube & vkcube to test basic rendering.

[0] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26934

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Added separate a6xx.xml.h sync from https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27576
- Collected review tags
- Inlined skip_programming
- Use A7XX_RBBM_CGC_P2S_STATUS_TXDONE instead of BIT(0)
- Drop now useless placeholder comment
- Removed interconnect properties
- Rebased on current linux-next
- Link to v1: https://lore.kernel.org/r/20240212-topic-sm8650-gpu-v1-0-708a40b747b5@linaro.org

---
Neil Armstrong (6):
      dt-bindings: display/msm/gmu: Document Adreno 750 GMU
      dt-bindings: arm-smmu: Document SM8650 GPU SMMU
      drm/msm/a6xx: Add missing regs for A750
      drm/msm: add support for A750 GPU
      arm64: dts: qcom: sm8650: add GPU nodes
      arm64: dts: qcom: sm8650-qrd: enable GPU

 .../devicetree/bindings/display/msm/gmu.yaml       |   1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   7 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |   8 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 166 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |   9 ++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  28 +++-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  14 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  10 +-
 9 files changed, 238 insertions(+), 7 deletions(-)
---
base-commit: 5a30f6bdb84228f160b331eed2ccfde00bfb3ab4
change-id: 20240208-topic-sm8650-gpu-489d5e2c2b17

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

