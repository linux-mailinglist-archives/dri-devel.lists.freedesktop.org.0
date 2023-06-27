Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A0B740471
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 22:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D541E10E00D;
	Tue, 27 Jun 2023 20:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E02210E00D;
 Tue, 27 Jun 2023 20:14:25 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 23AEF3F6B1;
 Tue, 27 Jun 2023 22:14:21 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 00/15] drm/msm: Add SM6125 MDSS/DPU hardware and enable
 Sony Xperia 10 II panel
Date: Tue, 27 Jun 2023 22:14:15 +0200
Message-Id: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABdDm2QC/22Nyw6CMBBFf4XM2jG0SFFX/odh0ccAk0BLWiEaw
 r9bWbs8J7n3bJAoMiW4FxtEWjlx8BnkqQA7aN8TsssMspRVqeQF06SErNHNC2py9qaqhqgxkAd
 GJ0ITtbdDnvhlHLOcI3X8PgrPNvPA6RXi5wiu4mf/fq8CSxSu1qq6WjKdfKQwafYjezqH2EO77
 /sXm5f5kb4AAAA=
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
Marijn Suijten (15):
      drm/msm/dsi: Drop unused regulators from QCM2290 14nm DSI PHY config
      arm64: dts: qcom: sm6125: Sort spmi_bus node numerically by reg
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

 .../bindings/clock/qcom,dispcc-sm6125.yaml         |  15 +-
 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../bindings/display/msm/dsi-phy-14nm.yaml         |  11 +
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  14 ++
 .../bindings/display/msm/qcom,sm6125-mdss.yaml     | 217 ++++++++++++++++++
 .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |  59 +++++
 arch/arm64/boot/dts/qcom/sm6125.dtsi               | 251 +++++++++++++++++++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h | 230 +++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |   2 -
 drivers/gpu/drm/msm/msm_mdss.c                     |   8 +
 14 files changed, 796 insertions(+), 23 deletions(-)
---
base-commit: e42c42a03fdf31deccaea2f44885dd6f8150eb32
change-id: 20230624-sm6125-dpu-aedc9637ee7b

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>

