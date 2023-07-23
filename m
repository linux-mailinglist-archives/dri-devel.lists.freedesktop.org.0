Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DDC75E315
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jul 2023 18:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5163E10E1A0;
	Sun, 23 Jul 2023 16:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307BE10E02C;
 Sun, 23 Jul 2023 16:08:44 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id CBB873F0E6;
 Sun, 23 Jul 2023 18:08:39 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 00/17] drm/msm: Add SM6125 MDSS/DPU hardware and enable
 Sony Xperia 10 II panel
Date: Sun, 23 Jul 2023 18:08:38 +0200
Message-Id: <20230723-sm6125-dpu-v4-0-a3f287dd6c07@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIZQvWQC/23NQQ6CMBQE0KuQrq1pf6EFV97DuCjlA02wkFaIh
 nB3CxslspxJ3sxMAnqLgVySmXicbLC9iyE9JcS02jVIbRUzAQaCSUhpeEgOGa2GkWqsTCGFQlQ
 liaDUAWnptTNtJG7sulgOHmv72h5u95hbG569f2+HE1/bw+2JU0Z5lWkpcoNlDdfQP7R1nXV47
 n1D1q0Jfr3aeYieCUwF08BUbg69+HrF850X0UuT6UxiUeTA/vyyLB/cu9PSPgEAAA==
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Loic Poulain <loic.poulain@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>
X-Mailer: b4 0.12.3
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lux Aliaga <they@mint.lgbt>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Bring up the SM6125 DPU now that all preliminary series (such as INTF
TE) have been merged (for me to test the hardware properly), and most
other conflicting work (barring ongoing catalog *improvements*) has made
its way in as well or is still being discussed.

The second part of the series complements that by immediately utilizing
this hardware in DT, and even enabling the MDSS/DSI nodes complete with
a 6.0" 1080x2520 panel for Sony's Seine PDX201 (Xperia 10 II).

The last patch ("sm6125-seine: Configure MDSS, DSI and panel") depends
on (an impending v2 of) my Sony panel collection series [1].

[1]: https://lore.kernel.org/linux-arm-msm/20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org/

---
Changes in v4:
- Require "throttle" clock in display-controller node bindings and
  provide it in DTS (this clock previously resulted in inexplicable
  pingpong timeouts, but that cannot be reproduced anymore);
- Split APPS IOMMU address-padding fix to a separate patch;
- Add new patch to remove wrong DSI1 output port in SM6350 and SM6375
  MDSS dt-bindings example;
- Link to v3: https://lore.kernel.org/r/20230718-sm6125-dpu-v3-0-6c5a56e99820@somainline.org

Changes in v3:
- Drop status="disabled" from MDSS dt-bindings example;
- Use "nom" instead of "svs" OPP for dsi-phy PD, matching downstream;
- Add "retention" OPP to dispcc PD;
- Reword dsi-phy required-opps documentation;
- Rebased on latest -next and fixed conflicts in DT and DPU catalog;
- Link to v2: https://lore.kernel.org/r/20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org

Changes in v2:
- Moved dispcc DT clock reordering to the right patch (--fixup on the
  wrong hash) (Dmitry, Konrad multiple times);
- Drop removal of GCC_DISP_AHB_CLK in dispcc bindings.  While it is
  unused in the current driver, it is likely used to ensure a guaranteed
  probe order between GCC and DISPCC downstream, as well as currently
  relying on the fact that GCC_DISP_AHB_CLK is CLK_IS_CRITICAL and never
  turned off (Bjorn);
- Add GCC_DISP_GPLL0_DIV_CLK_SRC at the end of the dispcc clock list to
  maintain some form of ABI stability (Krzysztof);
- Use SoC-prefix format for 14nm DSI PHY qcom,sm6125-dsi-phy-14nm
  compatible (Dmitry, Krzysztof);
- Add patch to drop unused regulators from QCM2290 14nm DSI PHY (Konrad,
  Dmitry);
- Reuse QCM2290 14nm DSI PHY config struct for SM6125 compatible
  (Konrad);
- s/sde/mdss in pdx201.dts pinctrl node names and labels (Konrad);
- Use MX power domain in DSI PHY with SVS OPP (Dmitry);
- Use CX power domain with (already-existing) OPP table in DSI CTRL
  (Konrad, Dmitry);
- Rebased on top of DPU catalog rework [1] by inlining macro
  invocations, and validated by diffing stripped dpu_hw_catalog.o that
  there are no unexpected changes;
- Unset min_llcc_ib because this platform has no LLCC (Konrad);
- Fix UBWC comment to mention "encoding" version (Dmitry);
- Reordered DT nodes to follow Konrad's requested sorting;
- Add power-domains and required-opps properties to dsi-phy-14nm.yaml;
- Link to v1: https://lore.kernel.org/r/20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org

The discussions and this list ran quite long, apologies if I missed or
mis-resolved anything in advance!

[1]: https://lore.kernel.org/linux-arm-msm/20230619212519.875673-1-dmitry.baryshkov@linaro.org/

---
Marijn Suijten (17):
      drm/msm/dsi: Drop unused regulators from QCM2290 14nm DSI PHY config
      arm64: dts: qcom: sm6125: Pad APPS IOMMU address to 8 characters
      arm64: dts: qcom: sm6125: Sort spmi_bus node numerically by reg
      dt-bindings: display/msm: Remove DSI1 ports from SM6350/SM6375 example
      dt-bindings: clock: qcom,dispcc-sm6125: Require GCC PLL0 DIV clock
      dt-bindings: clock: qcom,dispcc-sm6125: Allow power-domains property
      dt-bindings: display/msm: dsi-controller-main: Document SM6125
      dt-bindings: display/msm: sc7180-dpu: Describe SM6125
      dt-bindings: display/msm: Add SM6125 MDSS
      drm/msm/dpu: Add SM6125 support
      drm/msm/mdss: Add SM6125 support
      dt-bindings: msm: dsi-phy-14nm: Document SM6125 variant
      drm/msm/dsi: Reuse QCM2290 14nm DSI PHY configuration for SM6125
      arm64: dts: qcom: sm6125: Switch fixed xo_board clock to RPM XO clock
      arm64: dts: qcom: sm6125: Add dispcc node
      arm64: dts: qcom: sm6125: Add display hardware nodes
      arm64: dts: qcom: sm6125-seine: Configure MDSS, DSI and panel

 .../bindings/clock/qcom,dispcc-sm6125.yaml         |  24 +-
 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../bindings/display/msm/dsi-phy-14nm.yaml         |  11 +
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      |   5 +-
 .../bindings/display/msm/qcom,sm6125-mdss.yaml     | 213 +++++++++++++++++
 .../bindings/display/msm/qcom,sm6350-mdss.yaml     |   7 -
 .../bindings/display/msm/qcom,sm6375-mdss.yaml     |   7 -
 .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |  59 +++++
 arch/arm64/boot/dts/qcom/sm6125.dtsi               | 257 +++++++++++++++++++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h | 236 +++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |   2 -
 drivers/gpu/drm/msm/msm_mdss.c                     |   8 +
 16 files changed, 804 insertions(+), 38 deletions(-)
---
base-commit: 535ce75f2d80a47ce5407681014cd5a976646e38
change-id: 20230624-sm6125-dpu-aedc9637ee7b

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>

