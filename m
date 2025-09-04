Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A1BB43357
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 09:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3076910E97F;
	Thu,  4 Sep 2025 07:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="OAN7M2Bc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013019.outbound.protection.outlook.com
 [52.101.83.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF5110E97F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 07:06:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSLZNnOraAlfcy5zbcrlsuKUFBwmTphDX8G0oFYtdr7rPuNKwN61r6nM8PiYA/60Db0WSZE5yt9dvS5pEF4pe98h+jwwnPC4WV0zTe6QRSBGc+DKpZs45Gj8SIZY/4vqsF7pxpoQCUQxLIIalcztq36eVyKEOLIpu0LlGLpqThbVx8pWuUNiMqA+Gmd0q/5as2v44zL4euReMfpKNEVxqTeo1olMNIS/6PQ2XJuWFVXbauMuQr7heFcKtDFdg9a1tCabqAnusYQaRoA9PtVYAzuzXTFyna3fkhqkS0YCJ9mncaJJtdvUe3cFDSDbmlj7h8E+XUDgfCJILRlh5Q0HJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsMfZ1cRSqI1oWYlWxUkZnPOx1xTknzKwFwsYAmSyog=;
 b=t7BhLX3fcrIe2mZJlYPE72zf3lMgsTVT9A07b+IkFy31tKhY0thsx63PFqxN8VVsYlkx/rKgdJvvEr0hVszIZ8jZ7IEzJ9P4jxatYmF/G+0OdJ8fuvM3VVQVkLv1bGc0tq3X16yuOd2o/5CYeaa7aJ63tcTarSl/i/Pn1CPI6tkBmi7KMLZUzr+A7EhdqkyCeASG7yOqW2pGJSRfi/55FrHtyx9q6SYMWN32a5GXh4vDduE+scU4BpUO1QOOq6qPExjKBblR6zbezgVZVSISihxCn+nIpcFFPag8THd0sG12ljDJ6s4wKTycOJtxpfi8llwGOdkvz0PMvfqHNzYoTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsMfZ1cRSqI1oWYlWxUkZnPOx1xTknzKwFwsYAmSyog=;
 b=OAN7M2BcbpOTgVVGTwOD/xOQwDIhaiBWED4j0vkwRqaRk9LJZfh0u98ZgFQypXMn9Dew1qhIrcOnFnQl6q3VlzGZdhtT5j6KaBdrXPxalbSt2mf9gkb8q1ppHV1fAHrzBsqUoYL3n4/vp1gA9Au8I/QwUWOUkmvN3jRIEpvxGo0kKQcjVRSc7B/W3NAzcVz1PtHOQIxHuVzJT1Ubk2zHXoYGqWG/jOoavkaP6H3+VAD0qK+ua8KAWgLx4PrTrmEAyg4V2jywirKt16/+ML3q3KgsWCk1U/P4SnfNzuCE7O9MtSVS0Taa7t7hy/Wx+Qag0yCqFtDXD31ufgPNJ/kgow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB8PR04MB7002.eurprd04.prod.outlook.com (2603:10a6:10:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 07:06:42 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%6]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 07:06:39 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Subject: [PATCH v6 1/7] dt-bindings: display: imx: add HDMI PAI for i.MX8MP
Date: Thu,  4 Sep 2025 15:05:54 +0800
Message-Id: <20250904070600.1361165-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250904070600.1361165-1-shengjiu.wang@nxp.com>
References: <20250904070600.1361165-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB8PR04MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: 77e99b73-c90d-42c2-eedf-08ddeb8197cc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YUjg6XspXS9KFTJeQpNz14FZgT5h+PbAtitfMYkK7ChtVn/LQx6LNcpdGO63?=
 =?us-ascii?Q?DCMmRq7akuhhHKAmrGl5gLeDZ9alAa1ewzagT0jQYyY79ecixp69hnVrpG0D?=
 =?us-ascii?Q?VHwxJ9n5dkcJtROHuYXPhvizRB6Ykupt+7DyFCwl2UN5rpDX8lHpvGLB+Iks?=
 =?us-ascii?Q?Dn0H+K0gOTu1ne/9HS8t+0B2ET8aeoiEdgNThftmT7KQnNH/pe9QyCiQVTc1?=
 =?us-ascii?Q?oUcLk7GM6e1Hb8P0T4XOw0zXFlwrrh5GNRk7x3mTv1D5Mayd+T9luFgxWDZV?=
 =?us-ascii?Q?qQJLc4EPDPOvd/cVGM1upJLl9H9CADpFmTcL5ln4o9XTfaAoW5aKieK7Kwgp?=
 =?us-ascii?Q?Q6S8wMe4NIISYe01IkKj90f1cfgEm4RtReJh3Ind5H65eZdWXUf0297C0oQW?=
 =?us-ascii?Q?7xMAzoBxZv40SYGR/vx3+UKB1O9NRKS0lkqTl0S5qkyrWSnEpQrJ76lRuMT7?=
 =?us-ascii?Q?YU5lhk67HB3K3alBCHZzcwyKPmcEMbZkbeAKYOuFvzMYbJEXpx+3PPKKb7xJ?=
 =?us-ascii?Q?xLTEbYtYo/ykml9aweJkYD0nS/YJcSxGPDshfjBMG5LvL4nNCkP06CwvfXUV?=
 =?us-ascii?Q?DVZdUGzH7W+hS8St1pr30xVdtIBCmyYqAWLwT5nzPqTQqtZx7SVWBhlnwgU2?=
 =?us-ascii?Q?ZF8mXjupZOkZf6g+4EP5ep1jKxshuiMd8CiD3VbRzQXYvHmVEIsOqTuF+O5Z?=
 =?us-ascii?Q?sdxK0tI4M+/o67ej0iIdz4VDPz8uNm98JW8ObPl63p3MoktUdut3ERzEhU2h?=
 =?us-ascii?Q?5k1zcIIOmg4S766RFub1zUlvt1+4SCPNX3BdDyQK/kWp29m4F9f2tgL8U41x?=
 =?us-ascii?Q?S8Gy0J0OZjZImUSwzgJJPzH4iaiYRFiJDAAdFPobh6ju3vTqAYGM7nWoUNJR?=
 =?us-ascii?Q?KHLPgwU2W0Y/R6p98iZKHrduoMCuuJUtlW21MXpkRrK4uTRntGPmlJy1HhET?=
 =?us-ascii?Q?06PfgOSlpTpZq1Arh6pNabPoEWSL6q/x8l0LnpktVnPzJxUx93Jv5IZrpInr?=
 =?us-ascii?Q?isZ1GVbIuExkM7ynF7DsFkrCBTNbcDu49T2FewSN7oZaM23a8IO8HPDDnOl9?=
 =?us-ascii?Q?m1z5MX7wbE2cwaTKtPrGOppQWk9leh7nuzAf354DCSIFRpf14moQ1EWfVIW/?=
 =?us-ascii?Q?2hQ13IG3huYkICyWcM90IWk9qHRGdGV1/pw3i6mqwFX0SmPNt91ic6M0I7y9?=
 =?us-ascii?Q?kUa4DJzE9zAX4tzvjMOjo28vFijLHp6CEjZ3ZK4T9N1txbFL83PGQlpZwnRd?=
 =?us-ascii?Q?ix9r+RDqA5KQi9+fMvBl1cDjPTTgvbLKINjNpA/hM6J5LH9VwcVrHlMJHrk8?=
 =?us-ascii?Q?zmiIdbZmQVbPZBMGT3jenfepmAhKqnqpEtnQyvvlRGdBx7OMJzlmxJ90endC?=
 =?us-ascii?Q?QSbTdiSyGkatlNhKqUSnA6tQWiRp3oOUqKDQn0knqCYbqrpHpFAC6DPh2tYn?=
 =?us-ascii?Q?rl1+P07dbiT/nid4vttjwDD++ltstEGC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3BvZ/x5UXVlU7djPTt3gN//s4w/wzWuvwB+xh5ehmW+GRvGVrgZHPs1pgYkm?=
 =?us-ascii?Q?spYQb/3kTWg8qfXtGxHvoJhou0x2lZaIzf00gKczrwY5vetl9AdYq1orIowv?=
 =?us-ascii?Q?QsUKPfA7UQRITtywiUuYMy8c2bwj0b/pNCqZO0RhQ4DVNULIH0effwbbcScd?=
 =?us-ascii?Q?dSUTV8dTsVkv20ykjnWU9yUwxgvMg1NXCGwAYk8vT3nYpCzZDq3XEZBrBPHF?=
 =?us-ascii?Q?oxvECppxZT8eE42aQ8pg7buAUweKPVBkGZEUc0eQc3X6TKFi91jQ0O3M0kEy?=
 =?us-ascii?Q?A8D/S7TACBkSQ+MeQZAQp1hG6G12Xq3QszRkHxaW5KwZxLWg0qvebPSV+d72?=
 =?us-ascii?Q?VHe/1KuuequKj8S/zB1DbxGKyfI6AiH+vPfy9SB+LI3djh4Nt/JaQSJxTHwN?=
 =?us-ascii?Q?T4p8LG00Wx5Uek+3Y5c5Rispr4LCcN51l1hr3x8g5JVzS8mMuSXYi2li7LVC?=
 =?us-ascii?Q?KV5EhXgp7B7iXnXzsuX0Ww+WKgGcTbsZ7jQfK1DnOL2imlvUnzIfSKCMWvgG?=
 =?us-ascii?Q?XcCEXHA6D1Cupj5qDb9cshc2hwpT8hviKAoRyVV9+bbboC4IOsJFVPtqQmrB?=
 =?us-ascii?Q?So1sKCrzJO9UOwHL/+8UA6zuYg3bu1wVYGyvG10cfNWcs5LGSr169CF6Qgiz?=
 =?us-ascii?Q?JEMtjyQ9N4owuLFaEB3YiSn24ZyJ+JEgIR7kAin6HPwpD3zUJqYrNPdCtI/f?=
 =?us-ascii?Q?ytXNtKYbLnHaFicSpasdD50fy0k5pevydjNpmYH+c6lyb5CPdmRl7AY9J7Id?=
 =?us-ascii?Q?yRGQ0cjzIR/c/9hjQvJa3w3dLN825YW/rWPvC+VBb9uQBx7P7IHAlNlu3ENe?=
 =?us-ascii?Q?rH0hcdVPIuS5JiJw2lULeumvMoXnaR4Te2823vsTuOCIwzucW0EwgJuGGcNd?=
 =?us-ascii?Q?UtYYmVKVakvYkRMJ841rSTYHP1E3GqZCTXmSNHzLd7bLU0yqSRU1UX823VAa?=
 =?us-ascii?Q?dPowj9AD19Q9WKTnBgWZmoTsJMK4eMvffKbLC3RCHD2DU2yJY5XM52ol8jp9?=
 =?us-ascii?Q?/ug2ULhGqmNfI0LoQjiM/L2umrp5OqZuLTivxJSKQlV+AJAiD2Vh/Tb0ru+e?=
 =?us-ascii?Q?/fWmmoMVeS3e5ENxLd4AnzJbEz+tbnlMC7qrEFkZcjoApODVi94w7HDzyjKC?=
 =?us-ascii?Q?Ht5VKfGUMOQyUNHL15jg+GcIT0gVFthVnZluFBJXKOra/CSDu/3hI9H6NsbC?=
 =?us-ascii?Q?gK14GARJHEiOjCeqoOBvrv7Tz3eL0RRx/beFnDKbTFn+Sk9Xz22GOROcIamZ?=
 =?us-ascii?Q?hLt+jkAvzFH1fu+21RLrA57qCKQd+5+fVxbyBPwb+6w1G36Eq9+yFottFdEm?=
 =?us-ascii?Q?9d+w7eDPs1rGe3IQYcWiTqI9af1ndr/fhhQCgajsQxASXyf32AQG/OaTZ+Vf?=
 =?us-ascii?Q?jWv5Sa9L3kutEkTbeSyieecdFwqxESq8AHQi4Olb3FEKhKewx+iRvXZX0xwr?=
 =?us-ascii?Q?QhH7WkttmZrcGrU0uOS5imlQCGHQWkcVp5xyUjjCMDB0d46T8mSFkf8quuQH?=
 =?us-ascii?Q?CXTM+cWU6Qwbl8u0GLqybt2DYm0b0eZd7nHtCsWj0kIW++fh1z47YjNo6nZ0?=
 =?us-ascii?Q?G/ToNNG9IsAK1UdieI67WKdo31UB05Ggj4ILf1+A?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e99b73-c90d-42c2-eedf-08ddeb8197cc
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 07:06:39.2121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SpVOTE2ORR3SeDtp3iymDKssSKHXCa5YcOd6XuXIQ/iOfLrlJkp5PYrVan0FHw0w30vT5pRpNa8UwTv5Z0nCoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7002
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

Add binding for the i.MX8MP HDMI parallel Audio interface block.

The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
This IP block is found in the HDMI subsystem of the i.MX8MP SoC.

Aud2htx module in Audio Subsystem, HDMI PAI module and HDMI TX
Controller compose the HDMI audio pipeline.

In fsl,imx8mp-hdmi-tx.yaml, add port@2 that is linked to pai_to_hdmi_tx.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 12 ++++
 .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 69 +++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
index 05442d437755..6211ab8bbb0e 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
@@ -49,6 +49,10 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         description: HDMI output port
 
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Parallel audio input port
+
     required:
       - port@0
       - port@1
@@ -98,5 +102,13 @@ examples:
                     remote-endpoint = <&hdmi0_con>;
                 };
             };
+
+            port@2 {
+                reg = <2>;
+
+                endpoint {
+                    remote-endpoint = <&pai_to_hdmi_tx>;
+                };
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
new file mode 100644
index 000000000000..4f99682a308d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pai.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8MP HDMI Parallel Audio Interface
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
+
+description:
+  The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
+  Audio Subsystem to the HDMI TX Controller.
+
+properties:
+  compatible:
+    const: fsl,imx8mp-hdmi-pai
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: apb
+
+  power-domains:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Output to the HDMI TX controller.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/power/imx8mp-power.h>
+
+    audio-bridge@32fc4800 {
+        compatible = "fsl,imx8mp-hdmi-pai";
+        reg = <0x32fc4800 0x800>;
+        interrupt-parent = <&irqsteer_hdmi>;
+        interrupts = <14>;
+        clocks = <&clk IMX8MP_CLK_HDMI_APB>;
+        clock-names = "apb";
+        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
+
+        port {
+            pai_to_hdmi_tx: endpoint {
+                remote-endpoint = <&hdmi_tx_from_pai>;
+            };
+        };
+    };
-- 
2.34.1

