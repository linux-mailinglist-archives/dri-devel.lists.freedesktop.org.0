Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E6A796E59
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 03:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79F110E03D;
	Thu,  7 Sep 2023 01:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2088.outbound.protection.outlook.com [40.107.14.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF5D10E742
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 01:06:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdqGOO6VhTpHSKkPme8jF39OpXUOF4eQBzTUJBSDXHniZHgnEGQyRIK/b5RzyGZwHXb1/dBhPmwRwktNRnOxsoGhtmtXMmz8EcXSBH9wtAfpMc+IZ1vZAlZq+Wk21hN+jWa5dvoacFkE1Ete1mnHXurRGz/pPRfanmWq9x4y0GGMvPY3L/BF4b3yrTFMDBBPQkf60oUeemr2/tkmjaPI4aKKb8bsxkGo3euwRefVE8nin9tTD1tlxnWYZOB+hJNET49wjImUXd7ec9y5oRB5ofO+IUzk3lMck+vdZ8+4H4/siACmYSAaL2DP+O/8mgQx3YVZsGkQVWlm0tJ+/xehJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ydUOxwaoxI3ntlW2qF7C+1LSxA/pLuZE/kDUKtzyFI=;
 b=jYqudHGmElcsVDQQI9/9bNMh1FnKg212ni3yvS0kAfupWinkPqJ4sU9ovzADOF98C+jJSdkr/Piquzm7+iKYngfot27nwaO1e+hitpGrgqMjtamR7Jvawos5H1D+E/jQ/lt77eq+SjRnT2wi5lwkuQsQx/SVk/2IpalTXdad9MmlqzSkqzH7WrIhfRNkYEbWPhKDnc/TM9p/GBDQjXbFMiB6ZhYiCWUD49bcc2AvK+KATyRke7xEtJTmDi3ZBgxLZABPgreA7kbSVNYfnfcrKbS4RHK2jcDxATDO13//HVy/Jw9B9XV1G5Lq5WSYT8B+cfplIdUxFzosgb8t9ds8wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ydUOxwaoxI3ntlW2qF7C+1LSxA/pLuZE/kDUKtzyFI=;
 b=I3MjN7Ieii2+Xi7sklrWgKc51rYr3YlpaWoSrvRNqtqQ7zkPET70kh4+skfQJ81z8XwU9vQ2jdxL6EiW3abFocRWg0mHj0ejlh8S1pz7PODVRMcb4W+3o38EtscJ8VvPe5iCa6T/2AeZpYS31ygvQ+py3dvNjpi0z/1naWic/mM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB6802.eurprd04.prod.outlook.com (2603:10a6:208:184::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Thu, 7 Sep
 2023 01:06:46 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 01:06:46 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v9 3/7] dt-bindings: display: bridge: Add Cadence MHDP850
Date: Thu,  7 Sep 2023 09:05:30 +0800
Message-Id: <96d9dcd8fd699ef67ae22e18c511443e0af84c13.1694047629.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694047629.git.Sandor.yu@nxp.com>
References: <cover.1694047629.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::15)
 To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e492d1c-ea81-4f4a-c562-08dbaf3eb4b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HDsfJFo30k6M89A1Z6dW+sFALLANULWF/nEvndtY5jn0KBFxBVaRHzF3VNzObx4tBaUzEsIJ2awf4HGESexJGFn7oOyK8Pqb7cMHMQBWgzsgrxezdtNW3jdEQ8piAJ9bTwDCa/Rw5v0SOiMnzgxwEMqt06Q4uLo227z61sNfrhhY9J6lKxxCDh5PN/u3H6TeIN5ZPdifJOJpxusKxbACMwpiFHNVSfYrtjeera2KlDwWOaTmCit5wvCP7t69hutZ/yXGRb1Mrv0n3ZGQ79atKww2fx3yfo9LKsMKdxsy5ygESMDZ/UHsYdrflMMJgyxRvyC0J8vQ6qmfMQ6njlshH9GyowsVb4GpuJSiYj1F3FE1uati/7eahkruFlcv9lGef28iNYZGKs+bpanIuUQiIiIN4+aWckXo8qHyEY7kfqK1pCYb2siCjSXOGR53j9iywT+0yUCwSnPa45Fr5T6nWt3VITojKxBbObgBDT3Q7V1DMZGcc/STMLtHgMOFjGaEnHsmNlz4DTF7yXXBEnW8lx5buhDtRI6dKudnPkxVgkjTW0b/OgniqF2+TpRekQqg00kSHMVkJpv6AzW/xGPpGG8tzhBCSyU1+DZKiFvWa2+jxCNs2pDOb6SWllOoT8dXOdqoqL3RVq0bpUU5aifsCdzmHTlHPV0NPaU+QDYC+Uo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(1800799009)(186009)(451199024)(921005)(66476007)(6666004)(966005)(66946007)(26005)(66556008)(478600001)(2616005)(6486002)(6512007)(52116002)(8936002)(4326008)(8676002)(316002)(5660300002)(86362001)(83380400001)(38350700002)(38100700002)(7416002)(36756003)(41300700001)(6506007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/oQ+WKp7MWpp15xCiVlm1F19rkyVV2QwLlB3o1fWWEVVp3f0UX14M3McT21t?=
 =?us-ascii?Q?q27zq4A1BhU8vuQRz4YSkdXua/7fC5y84cqunY7P+5Z2pKkrMxiq6GuO9Rap?=
 =?us-ascii?Q?O9Ve5756gW5vXId1e/YsGaAxZvNScGYeMuACF0vtc5GaYDuo/w4SVBSq9vXW?=
 =?us-ascii?Q?0JFrUfrv3DWcFYvRZZzfso7QpEoIJywmQ6fFvrPkzQ87xEiotn5L5/yFxgOF?=
 =?us-ascii?Q?X6iAym+SwScnO0VTJidW5oGRvvuRUx5GuVBitoHSTkzZswq/qg5p/bpPkEDR?=
 =?us-ascii?Q?+ZHyVwlzQcMCSBOaZHVQiQmQ0ASv9iY5PYED9nXyUrccKnW9L4B3JRsR6vpg?=
 =?us-ascii?Q?rCMITEEQhXX9MCIktm3zJxhQvwiZsJMQFSM5OMqMjoO0XBQs+7Z1tQLon++A?=
 =?us-ascii?Q?RcsntcdvA5LN5sDVzsjdbH3Gr+CAaMvUWBv2D2k+U/9t2FU+9vyiCf7VTak4?=
 =?us-ascii?Q?piGFovzkDIDENNA8nBAMQFJFDFuvTdA4GUSf+1h1AU2TOY692C5jOqkAagZf?=
 =?us-ascii?Q?wKGC4uCq9UEGsLE4cPkoyfYUc3dTjNJ0+SekUeMnl6PwENwPFKjMurz68RXc?=
 =?us-ascii?Q?gZUPQmx/uxRSOZ0v4W4AqF9RqusPioiuvepIYJ6xPkhe3j5VYI+UOSSbupR9?=
 =?us-ascii?Q?wCm2x2qcwXKWjB0L1l8xjcIsN+E87slmJnmdKExI/esqrLwXZrGZyKlpBH5v?=
 =?us-ascii?Q?iE6vqEfwOc/DiUcm44wpMQgUMr4gpX/mRcGStJufmg3Jy8OjY0vvcaO06v1R?=
 =?us-ascii?Q?0EpiO/ucXJTtub4nUvMvup1hTigowCHjKpQE/BL8xgnJLX84DDpIjMsar6+V?=
 =?us-ascii?Q?22NtrCJmYMeR+BD74iMAdzlGQH6Wk/wRjhsztMO/vG+iUNruGpeNurJ0pZjQ?=
 =?us-ascii?Q?Sg2T59ypD3rXn0kjFYEcqAuSohjcK0cSwbV9GyOh8nD30K9LeITIeYer0S0+?=
 =?us-ascii?Q?HsTxulT+XxdQCpSUn3JFdykAL/5k4XHtJWVL5+B1Nr0FN03l/ks14xJx2wka?=
 =?us-ascii?Q?XqcaUCSPf3CWet4HE0qam59gTcbAQcamgBinJt42bICLBVcjNoK4IpeWwLUz?=
 =?us-ascii?Q?FBcT+axPoL9Bh2sAinD/ijZfSKxmfghf1jDRS9+yfgAnVZ+nTbOP5qkixQtb?=
 =?us-ascii?Q?5R+Q2c8l2hNsg8I75ogtPyLB8z2jZhvy4lFrXDjRlDvb3n1VZSACa8Jv7kl5?=
 =?us-ascii?Q?TdQ04l3GhDXcHlhFlYOs1tQE/UxZchKKNe9JUE+g962vjWZkhZLqt07wE5at?=
 =?us-ascii?Q?xOp7wCCAreLkPE6J4CL9xkonhGBwrHTZLRpd6GjlJfpEzVA1elfi8oxEMHnM?=
 =?us-ascii?Q?pjpyUjSYau2C4Nq2PZ9mchsILEK17fvyX4RjT5saVL2/DlnA3RqAFpBDA8J+?=
 =?us-ascii?Q?25+BZwDrptu2+CRWee22jhbNgFG6V4yHeCJEXgSU35UxFBalR54N05tLohIN?=
 =?us-ascii?Q?dnkfSliqDvt0ODg+eU8Eh6l1fCh55LsxEbfwMMCzUaISgEZyjgRfSax+K5Ao?=
 =?us-ascii?Q?L3zgNwK1ZyHMhf57KhnWHg0OY2FBssKfLd/83tWKZsgWLasiTcmPdTNlx1sF?=
 =?us-ascii?Q?ZRjENB9ytvrOLmKs7cC8e6x9tEq3sMEHVV48B5+/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e492d1c-ea81-4f4a-c562-08dbaf3eb4b1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 01:06:45.9565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gGrXnRfSzPQDNrZOcK59sTa+m3HdtFEj3NPMto+nIndbauZ97QTM6etoRDDpcHy9/jz9NemW0aiuwkmVpwRbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6802
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
Cc: oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, Sandor.yu@nxp.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-imx@nxp.com,
 kernel@pengutronix.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v8->v9:
* Add Krzysztof's R-b tag

 .../display/bridge/cdns,mhdp8501.yaml         | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
new file mode 100644
index 000000000000..3ae643845cfe
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence MHDP8501 DP/HDMI bridge
+
+maintainers:
+  - Sandor Yu <Sandor.yu@nxp.com>
+
+description:
+  Cadence MHDP8501 DisplayPort/HDMI interface.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mq-mhdp8501
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: MHDP8501 DP/HDMI APB clock.
+
+  phys:
+    maxItems: 1
+    description:
+      phandle to the DisplayPort or HDMI PHY
+
+  interrupts:
+    items:
+      - description: Hotplug cable plugin.
+      - description: Hotplug cable plugout.
+
+  interrupt-names:
+    items:
+      - const: plug_in
+      - const: plug_out
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port from display controller output.
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port to DisplayPort or HDMI connector.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-names
+  - phys
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mhdp: display-bridge@32c00000 {
+        compatible = "fsl,imx8mq-mhdp8501";
+        reg = <0x32c00000 0x100000>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "plug_in", "plug_out";
+        clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+        phys = <&dp_phy>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                mhdp_in: endpoint {
+                    remote-endpoint = <&dcss_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                mhdp_out: endpoint {
+                    remote-endpoint = <&dp_connector>;
+                };
+            };
+        };
+    };
-- 
2.34.1

