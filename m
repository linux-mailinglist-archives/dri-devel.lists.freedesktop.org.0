Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5042549314D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 00:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE0810E19F;
	Tue, 18 Jan 2022 23:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767E610E4E4;
 Tue, 18 Jan 2022 20:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642538354; x=1674074354;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=+5SpKgVZDapQv/oE6hjW/Oia4EcVZYmlgfdLcHCjpVQ=;
 b=GJaRH7fWlKX9RlaG99qFGKB7U7LgI2AJOG0cnz7sHtoSeweMhXUyx2kw
 R3GMJB0L1uT0Y0NJn58L9KgrVtVmChc6G1I9LgBql7faC5b2IzXXX9SJq
 qWg8uufceEfsUsS1W2XIzHfocXoBvQ4JxO4vGGXrAZywqohKAoxN5IEPs g=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 18 Jan 2022 12:39:14 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 18 Jan 2022 12:39:12 -0800
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg01-blr.qualcomm.com with ESMTP; 19 Jan 2022 02:08:46 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id E152121A90; Wed, 19 Jan 2022 02:08:45 +0530 (IST)
From: Rajeev Nandan <quic_rajeevny@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v3 1/3] dt-bindings: msm/dsi: Add 10nm dsi phy tuning properties
Date: Wed, 19 Jan 2022 02:08:38 +0530
Message-Id: <1642538320-1127-2-git-send-email-quic_rajeevny@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642538320-1127-1-git-send-email-quic_rajeevny@quicinc.com>
References: <1642538320-1127-1-git-send-email-quic_rajeevny@quicinc.com>
X-Mailman-Approved-At: Tue, 18 Jan 2022 23:17:04 +0000
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

Changes in v3:
 - Use "qcom," prefix (Dmitry Baryshkov)
 - Remove encoding from phy-drive-ldo-level (Dmitry Baryshkov)
 - Use negative values instead of two's complement (Dmitry, Rob Herring)


 .../bindings/display/msm/dsi-phy-10nm.yaml         | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
index 4399715..e9ba57e 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
@@ -35,6 +35,36 @@ properties:
       Connected to DSI0_MIPI_DSI_PLL_VDDA0P9 pin for sc7180 target and
       connected to VDDA_MIPI_DSI_0_PLL_0P9 pin for sdm845 target
 
+  qcom,phy-rescode-offset-top:
+    $ref: /schemas/types.yaml#/definitions/int8-array
+    minItems: 5
+    maxItems: 5
+    minimum: -32
+    maximum: 31
+    description:
+      Integer array of offset for pull-up legs rescode for all five lanes.
+      To offset the drive strength from the calibrated value in an increasing
+      manner, -32 is the weakest and +31 is the strongest.
+
+  qcom,phy-rescode-offset-bot:
+    $ref: /schemas/types.yaml#/definitions/int8-array
+    minItems: 5
+    maxItems: 5
+    minimum: -32
+    maximum: 31
+    description:
+      Integer array of offset for pull-down legs rescode for all five lanes.
+      To offset the drive strength from the calibrated value in a decreasing
+      manner, -32 is the weakest and +31 is the strongest.
+
+  qcom,phy-drive-ldo-level:
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    description:
+      The PHY LDO has an amplitude tuning feature to adjust the LDO output
+      for the HSTX drive. Use supported levels (mV) to offset the drive level
+      from the default value.
+    enum: [ 375, 400, 425, 450, 475, 500 ]
+
 required:
   - compatible
   - reg
@@ -64,5 +94,9 @@ examples:
          clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
                   <&rpmhcc RPMH_CXO_CLK>;
          clock-names = "iface", "ref";
+
+         qcom,phy-rescode-offset-top = /bits/ 8 <0 0 0 0 0>;
+         qcom,phy-rescode-offset-bot = /bits/ 8 <0 0 0 0 0>;
+         qcom,phy-drive-ldo-level = <400>;
      };
 ...
-- 
2.7.4

