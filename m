Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7524648C04C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 09:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A73E112E4B;
	Wed, 12 Jan 2022 08:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F75C11AA11;
 Mon, 10 Jan 2022 12:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1641819368; x=1673355368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=851dCihNv0ZUDPuYNHdZbMaYmXs4Oons/vrRaL0TMEc=;
 b=nHvE+zhBtc7KKY8aH2bNnKe4AK7hdZXc4IFHaJKzDutrsdXIxLic3zn8
 WxVzwwFWAHx7LKRPoEUNbW7SoOUFFJt6WUEf/hVcqXrnCxBdvvbDN71yw
 Co/wiF6gf4PdWr+FOufFjv8qNsSI/y8z2hk4JO86gG0Ke3O3/2rLmCI2O Y=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 10 Jan 2022 04:56:07 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 10 Jan 2022 04:56:06 -0800
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg02-blr.qualcomm.com with ESMTP; 10 Jan 2022 18:25:46 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id 34D79219EF; Mon, 10 Jan 2022 18:25:45 +0530 (IST)
From: Rajeev Nandan <quic_rajeevny@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v2 1/3] dt-bindings: msm/dsi: Add 10nm dsi phy tuning properties
Date: Mon, 10 Jan 2022 18:25:35 +0530
Message-Id: <1641819337-17037-2-git-send-email-quic_rajeevny@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1641819337-17037-1-git-send-email-quic_rajeevny@quicinc.com>
References: <1641819337-17037-1-git-send-email-quic_rajeevny@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Jan 2022 08:51:42 +0000
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
Cc: quic_kalyant@quicinc.com, jonathan@marek.ca, airlied@linux.ie,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, linux-kernel@vger.kernel.org,
 quic_abhinavk@quicinc.com, robh+dt@kernel.org, quic_mkrishn@quicinc.com,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In most cases, the default values of DSI PHY tuning registers should be
sufficient as they are fully optimized. However, in some cases where
extreme board parasitics cause the eye shape to degrade, the override
bits can be used to improve the signal quality.

The general guidelines for DSI PHY tuning include:
- High and moderate data rates may benefit from the drive strength and
  drive level tuning.
- Drive strength tuning will affect the output impedance and may be used
  for matching optimization.
- Drive level tuning will affect the output levels without affecting the
  impedance.

The clock and data lanes have a calibration circuitry feature. The drive
strength tuning can be done by adjusting rescode offset for hstop/hsbot,
and the drive level tuning can be done by adjusting the LDO output level
for the HSTX drive.

Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>
---

Changes in v2:
 - More details in the commit text (Stephen Boyd)
 - Use human understandable values (Stephen Boyd, Dmitry Baryshkov)
 - Do not take values that are going to be unused (Dmitry Baryshkov)

 .../bindings/display/msm/dsi-phy-10nm.yaml         | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
index 4399715..d0eb8f6 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
@@ -35,6 +35,35 @@ properties:
       Connected to DSI0_MIPI_DSI_PLL_VDDA0P9 pin for sc7180 target and
       connected to VDDA_MIPI_DSI_0_PLL_0P9 pin for sdm845 target
 
+  phy-rescode-offset-top:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 5
+    maxItems: 5
+    description:
+      Integer array of offset for pull-up legs rescode for all five lanes.
+      To offset the drive strength from the calibrated value in an increasing
+      or decreasing manner, use 6 bit two’s complement values.
+
+  phy-rescode-offset-bot:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 5
+    maxItems: 5
+    description:
+      Integer array of offset for pull-down legs rescode for all five lanes.
+      To offset the drive strength from the calibrated value in an increasing
+      or decreasing manner, use 6 bit two’s complement values.
+
+  phy-drive-ldo-level:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 0
+    maximum: 7
+    description:
+      The PHY LDO has an amplitude tuning feature to adjust the LDO output
+      for the HSTX drive. To offset the drive level from the default value,
+      supported levels are with the following mapping:
+      0 = 375mV, 1 = 400mV, 2 = 425mV, 3 = 450mV, 4 = 475mV, 5 = 500mV,
+      6 = 500mV, 7 = 500mV
+
 required:
   - compatible
   - reg
@@ -64,5 +93,9 @@ examples:
          clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
                   <&rpmhcc RPMH_CXO_CLK>;
          clock-names = "iface", "ref";
+
+         phy-resocde-offset-top = /bits/ 8 <0x0 0x0 0x0 0x0 0x0>;
+         phy-rescode-offset-bot = /bits/ 8 <0x0 0x0 0x0 0x0 0x0>;
+         phy-drive-ldo-level = /bits/ 8 <1>;
      };
 ...
-- 
2.7.4

