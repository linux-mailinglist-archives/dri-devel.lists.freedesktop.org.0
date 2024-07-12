Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E2892F7D6
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 11:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB72710EC74;
	Fri, 12 Jul 2024 09:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="YK9Cv62I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011006.outbound.protection.outlook.com [52.101.65.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BD610EC74
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 09:24:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTL+hgzLWb39RjV7cD4z3wJRE9yVG+ISxmbxfdctczhAwqjj/CXFC1Wy1izLjTfqlKAQ0HlmuNsv4ZynWl08wOfTt0iyyY5zZoNXAflqmRFrL1HXqAIoIcwKfG/JjaQYdWOvQMwzHVYllPIjwChGP8mIcV+CouDAeLELsjCHAu/FZ5c3hejy60WJOvKmWyQ8wWX7WyS7A2Xu8M+yob7YDleHs+twfXOs37fxumEZxNeNtJnAcOOSeM5XK1qshBN4rwrrSs3JqOz0RPUGNEuQoysSiUv5pAmfmr8Ee+F7v1GMYJfKW+u1D/isuRpoye80U5brJfr0T0H5pFFXTyki2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qguk+D4MyWJNuQGcbsx4iuZVQLXTt75VlO3zS51XMV0=;
 b=CvrR8zQP7Fcdo1TpgMSYwiCSPyS27xQfnj8BpVlzLcOvHXFvsCca7vj4kjnVHWRxl4dZ6kxJ3mC/zKhbCvTMs+lCjp6kiNoo66+b1oYSIKfMY9K4NOzDiv2fEJfLjjAEyxHh6Km7fYUcvp4Nw+ndmZVhvLeIXmNCGtgBqddMMgbde7COjf2P8F/4b6BK8pSp38ExeZ38Xhq/hpxxmMmW4T5Z48dAHdYRAtBBJVmIFpLZhHDg1m6BXgtaBs7JYItbUg+mCBmk0WAwu0/d9oys29BeiIiQS6on7iCII3fXYyySohDF/mbKIjzsTztrl4RCVH2dxWe5uE1FpgzOjtXP2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qguk+D4MyWJNuQGcbsx4iuZVQLXTt75VlO3zS51XMV0=;
 b=YK9Cv62IhZYYt88GYONW1/M7Gebvbc9MoEweVium+YJTy85ZvIuK5bCN54EY7neefSaCxCMpKwblyDyFWy4dx+S6M5OFkUJBQ3kXlsgqhu1P+O+vxG20Tp5Ny8FCqb5Ra1SyTxlai+KdYtlY2faTrbi6kHZfJc8TquAHfDQiclA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10289.eurprd04.prod.outlook.com (2603:10a6:800:242::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 09:24:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 09:24:44 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com
Subject: [PATCH v2 01/16] dt-bindings: display: imx: Add some i.MX8qxp Display
 Controller processing units
Date: Fri, 12 Jul 2024 17:32:28 +0800
Message-Id: <20240712093243.2108456-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240712093243.2108456-1-victor.liu@nxp.com>
References: <20240712093243.2108456-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10289:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d82d0d-41cc-42c2-1a63-08dca25476cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/LrP+ANcpXPlKEa0Ipz5aLPIIm7oR+hkkChMBhEu6/vDlVger4gCxz1E23vY?=
 =?us-ascii?Q?YxE4x/UdKXeSziI4N620Vv9TYugmCDxxtV7d8kRMe7vN709Rf+lEUUN3FQt3?=
 =?us-ascii?Q?0aYRfNooDd1hd1W/3XxAKnVkjypF8F81qDA1JQSMlndn7Vzqlp+/h/2IECC2?=
 =?us-ascii?Q?pQ8L1s01J0WYTPX0n3GST9xb9Gn27lfh/IXfYt7ZkXi8pWlyxIuKJo57rFhc?=
 =?us-ascii?Q?U4uXlT70U1TRyHU2ijEE4PxoJ2ZfAOy4IFdOjOvmvruzVYCRS4oXjG2nNsaY?=
 =?us-ascii?Q?jbk6Pk8a32zELjf1ohMkJ1bTKKeGumGtKyrub+UZXpoaxOboStsrh5Ls/dSW?=
 =?us-ascii?Q?EyUJsSQoJplXohm5P3nJRlGCAwPtNFhKwdTiL6IiQyny0KYxACUNPZFdysfQ?=
 =?us-ascii?Q?pkKahbhySZpd/vCJekkiENMIrJJCdwspp5WTgdSfZx1rW9+0aYsyXo1YTEgK?=
 =?us-ascii?Q?zRk1UXID4z2mIEZWhuJ2Iu01A99WLgZtyLDoryIjIbzTd0SC5JrPaVdbxA9C?=
 =?us-ascii?Q?EQO3iTHh/fwC+AVdito3WnIiGBmTUp+5imRKcwHQtid4UMrKkhmbwqH2Q19R?=
 =?us-ascii?Q?2ybqn1MHwh6UKyUvST7VcW/ty7eeyE0wSDBCfSw7DucObz6pc9pNiArkGpCD?=
 =?us-ascii?Q?preCiuk6FdMlKT4YsQQRzqD+zD+AXYbL/LqCPwpf2VEmAwb7VM+oWYaLdnsW?=
 =?us-ascii?Q?spABvTwkSU3yv4jauXazUN2yMK1eW4htBd3NkwNfDYnzeasCaAoDu0CZEpVL?=
 =?us-ascii?Q?f4SmSuZOkA54SeTHIQvJYB5fVFjHBEybdsJUL+S8Z7OaMehKE4UIORRS0A7v?=
 =?us-ascii?Q?q+aZzKdXA8q/rp5Wpr2A+rc9UuTM+M/lg559PSt0on9NWV7DnX6i1iiYeYxl?=
 =?us-ascii?Q?FqqdJf6YZC+n1GLrgFf2ezmigXZsT+GKkmqfTez8epYAoCiN3nZGFV/N4b9R?=
 =?us-ascii?Q?P/eETZltS3h+Oc+Ep8+bQjCsPytTvIXU66eqs+sLR+rTweUxxUJ5LFzhbfwx?=
 =?us-ascii?Q?kgW++kbAx7QLu8C7/rS4KVN0QBn0DsoTZS4qjZDrTh1hk2HTFwSD/WCPRltn?=
 =?us-ascii?Q?k0is0VLX3WDt4l1ezUFhJPd8PYvn2Wgi9ay6/M9JV0FPKX9ItgW3uHk4Z2k9?=
 =?us-ascii?Q?jbZLsxhtEg4bkTJwqvpbX3X1F3woNTGS+upf/FQ6xPoy/HnEOBhl/AKJ2RtI?=
 =?us-ascii?Q?PxnzbHyHM29mMByxQyOj8jH93Y+yPRVkx4EyxdFh/o8BNmdKVdMMgX0eoio8?=
 =?us-ascii?Q?+YDxh87acvLzRGl9MUXTNtKLUtJzoKr0x1M5/cVnqkM4jYgYrtRtOWsz7iMK?=
 =?us-ascii?Q?z/MTbMLuc+g8Zp/V6MD5e0jkg2zCz/dEAl6pElNHrTEDk7eUlyAQ8eSlmSkk?=
 =?us-ascii?Q?ktEPpQQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZdsW6QEwOvlPHrROVuRWJACaXR9d5qgj87Pu1o5/IaqiGxLJx4oaF8BLWQah?=
 =?us-ascii?Q?6DkUWes285ETbHYItQyTtUVoYQDaz9Yu0OgG1loZEoVgvrOuEsVNZXYfPBsK?=
 =?us-ascii?Q?HJtFf5FBPx9bAtiV8So+iRKbxwis7xphQTfBoDPZJNVx8c7JUz/GbsJ8RIVG?=
 =?us-ascii?Q?tFTYXrqq90RVKn+bROXZyM1T0wI9bqoWp4i2fZgQOAbmgIoDojN7lGudmKAK?=
 =?us-ascii?Q?wBc4Luv3sqJQIp8C7p4UrYru7+AxU1PZ4li+jBEm45s/AxkjVsd+p41CPmM8?=
 =?us-ascii?Q?HG+rHhSYpI54V7kJo0MGR5hEABo0wwDqcW5CJr59wJhlfR2Ggjbu8vzETXPN?=
 =?us-ascii?Q?fDJQxGT76KS9RlUh8nnKAy9R5tDVFqPUAfOdF8qYfgKTA/ppFvugmjN+HsHS?=
 =?us-ascii?Q?Uo/6g1zE4wNIaW7zCy+OkeZTipZZakE18weMunieaT6moWlRlPhhSgLqLsZz?=
 =?us-ascii?Q?plfxlZfNIGbmbeUuADKVhLMB4shLUDwcpkWsNfQ/Dx1K4HdbRBWM6n3Fwnrp?=
 =?us-ascii?Q?1tRSOGiadD/XmHrAtWCICIubheJ624XT3Jsnas1C8ZDR1QpZd+YiTpLor7er?=
 =?us-ascii?Q?hse+otu1CPYeutsg0PRaJ391ndauRxN7s7/3Pms25SWFoDQ1zvDkXXQRlYY3?=
 =?us-ascii?Q?RzhHKvSfTtx5s8+qTyufSsE0qdKtwgHBUiviGAgTBaaGWulONLw4kU/HdqRo?=
 =?us-ascii?Q?c/8SI6YROM8qeNVdAdb9+Jeh9nlgFy36b3jFNFNJHkCYW/m0GtbV8JamZF/m?=
 =?us-ascii?Q?EPmnq91aiB8og0BZ4IKgz20iP9QDPutN/PEuCThi7J9Gf+EA/onPTdmVh87H?=
 =?us-ascii?Q?hBCtKJS2z9M0fNNv7A7a9iTcEfLg2/L4daLMzeou/1GyYzRaF5RhR0mb6pn4?=
 =?us-ascii?Q?k/k+mNmk5oYwZViHYI3qEE8OoZJh0PfmGqCvgOG2FtvfzmJaOQ08nTi0masL?=
 =?us-ascii?Q?93zwn37aCGFTf1f4HAfOOMVbtrnI/FycbuibQWklNdKNMyn2E8kSF66QGet3?=
 =?us-ascii?Q?gteoRI8jLvY5vr4TevDmpBrPYZ88ZvEfEw6zUpfUgQ4dkfO49qCtiTuHhFsQ?=
 =?us-ascii?Q?q8d9t0PYVrI8wYxLJmjAZ0RnOeJa7ehNu1Dp8EAlDh+e0PrRPLxWnY1hvHdM?=
 =?us-ascii?Q?Vklc6T62R5cY2BTqNDwf/9kdinPqyTENBavP7c12URo6crf/uqL4l1qOZA6I?=
 =?us-ascii?Q?wuIYKD3qwioYPQZ7KR8knq/zRPd6A4GoO0Ftt8LEPTDkekiI2D9qMIfJkcv4?=
 =?us-ascii?Q?rND756cWHuHEPfkugn1qfkG5sSV99K1kqSSh71+1yi32WWjWwFjKIQ32tWhZ?=
 =?us-ascii?Q?aehlNEctj14G02MgHBfu/gqYwircDpTLmaMYapdYHH7oxHxRbxzOl6x4bukf?=
 =?us-ascii?Q?U7qI8m5/7NRFQIUwx45S/q+6uV0eoEJN0y8IPcVq3deng9WiSNQJ0WFMUf+8?=
 =?us-ascii?Q?cTW5v7EhM/XkU8EZiuovDGRqcFvSiEn8xBCf3W9XQWdPWMtp4NDAg/80KrEK?=
 =?us-ascii?Q?SRWVNBUlUVxNg0QobLWElu11Nb/zdUK14o5CTclEBeF+XVvdtJAsg7boKt7T?=
 =?us-ascii?Q?cJgS3oPAK7rYH5REsXP+EdI3TZGJX/Ka0wI01lKy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d82d0d-41cc-42c2-1a63-08dca25476cf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:24:44.0168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GCqzY7i3hS3XzkT1h/tfhPafeH9t6JWYtVfo2oo2K5g2kb19VRSGV7xLNug+5h25Een5FgxTaFj6Uyxaz3x8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10289
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

Freescale i.MX8qxp Display Controller is implemented as construction set of
building blocks with unified concept and standardized interfaces.

Document some processing units to support two display outputs.

ConstFrame, ExtDst, FetchLayer, FetchWarp and LayerBlend processing units
are in pixel engine.  FrameGen and TCon processing units are in display
engine.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
* Drop fsl,dc-*-id DT properties. (Krzysztof)
* Add port property to fsl,imx8qxp-dc-tcon.yaml. (Krzysztof)
* Fix register range sizes in examples.

 .../imx/fsl,imx8qxp-dc-constframe.yaml        |  44 ++++++
 .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  72 ++++++++++
 .../imx/fsl,imx8qxp-dc-fetchlayer.yaml        |  30 +++++
 .../imx/fsl,imx8qxp-dc-fetchunit-common.yaml  | 125 ++++++++++++++++++
 .../display/imx/fsl,imx8qxp-dc-fetchwarp.yaml |  30 +++++
 .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  64 +++++++++
 .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  39 ++++++
 .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  45 +++++++
 8 files changed, 449 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchlayer.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit-common.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchwarp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
new file mode 100644
index 000000000000..94f678563608
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-constframe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Constant Frame
+
+description: |
+  The Constant Frame unit is used instead of a Fetch unit where generation of
+  constant color frames only is sufficient. This is the case for the background
+  planes of content and safety streams in a Display Controller.
+
+  The color can be setup to any RGBA value.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-constframe
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    constframe@56180960 {
+        compatible = "fsl,imx8qxp-dc-constframe";
+        reg = <0x56180960 0xc>, <0x56184400 0x20>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
new file mode 100644
index 000000000000..dfc2d4f94f8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-extdst.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller External Destination Interface
+
+description: |
+  The External Destination unit is the interface between the internal pixel
+  processing pipeline of the Pixel Engine, which is 30-bit RGB plus 8-bit Alpha,
+  and a Display Engine.
+
+  It comprises the following built-in Gamma apply function.
+
+  +------X-----------------------+
+  |      |          ExtDst Unit  |
+  |      V                       |
+  |  +-------+                   |
+  |  | Gamma |                   |
+  |  +-------+                   |
+  |      |                       |
+  |      V                       +
+  +------X-----------------------+
+
+  The output format is 24-bit RGB plus 1-bit Alpha. Conversion from 10 to 8
+  bits is done by LSBit truncation.  Alpha output bit is 1 for input 255, 0
+  otherwise.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-extdst
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: shdload
+      - const: framecomplete
+      - const: seqcomplete
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    extdst@56180980 {
+        compatible = "fsl,imx8qxp-dc-extdst";
+        reg = <0x56180980 0x1c>, <0x56184800 0x28>;
+        reg-names = "pec", "cfg";
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <3>, <4>, <5>;
+        interrupt-names = "shdload", "framecomplete", "seqcomplete";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchlayer.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchlayer.yaml
new file mode 100644
index 000000000000..804a3ea7419f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchlayer.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-fetchlayer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Fetchlayer
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+allOf:
+  - $ref: fsl,imx8qxp-dc-fetchunit-common.yaml#
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-fetchlayer
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    fetchlayer@56180ac0 {
+        compatible = "fsl,imx8qxp-dc-fetchlayer";
+        reg = <0x56180ac0 0xc>, <0x56188400 0x404>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit-common.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit-common.yaml
new file mode 100644
index 000000000000..a7a568672dc2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit-common.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-fetchunit-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Fetch Unit
+
+description: |
+  The Fetch Unit is the interface between the AXI bus for source buffer access
+  and the internal pixel processing pipeline, which is 30-bit RGB plus 8-bit
+  Alpha.
+
+  It is used to generate foreground planes in Display Controllers and source
+  planes in Blit Engines, and comprises the following built-in functions to
+  convert a wide range of frame buffer types.
+
+  +---------X-----------------------------------------+
+  |         |                           Fetch Unit    |
+  |         V                                         |
+  |    +---------+                                    |
+  |    |         |                                    |
+  |    | Decode  | Decompression [Decode]             |
+  |    |         |                                    |
+  |    +---------+                                    |
+  |         |                                         |
+  |         V                                         |
+  |    +---------+                                    |
+  |    | Clip &  | Clip Window [All]                  |
+  |    | Overlay | Plane composition [Layer, Warp]    |
+  |    |         |                                    |
+  |    +---------+                                    |
+  |         |                                         |
+  |         V                                         |
+  |    +---------+                                    |
+  |    | Re-     | Flip/Rotate/Repl./Drop [All]       |
+  X--> | sample  | Perspective/Affine warping [Persp] |
+  | |  |         | Arbitrary warping [Warp, Persp]    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         |                                    |
+  | |  | Palette | Color Palette [Layer, Decode]      |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  | Extract | Raw to RGBA/YUV [All]              |
+  | |  | &       | Bit width expansion [All]          |
+  | |  | Expand  |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | Planar to packed                   |
+  | |->| Combine | [Decode, Warp, Persp]              |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | YUV422 to YUV444                   |
+  | |  | Chroma  | [Decode, Persp]                    |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | YUV to RGB                         |
+  | |  | Color   | [Warp, Persp, Decode, Layer]       |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | Gamma removal                      |
+  | |  | Gamma   | [Warp, Persp, Decode, Layer]       |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | Alpla multiply, RGB pre-multiply   |
+  |  ->| Multiply| [Warp, Persp, Decode, Layer]       |
+  |    |         |                                    |
+  |     ---------                                     |
+  |         |                                         |
+  |         V                                         |
+  |    +---------+                                    |
+  |    |         | Bilinear filter                    |
+  |    | Filter  | [Warp, Persp]                      |
+  |    |         |                                    |
+  |    +---------+                                    |
+  |         |                                         |
+  |         V                                         |
+  +---------X-----------------------------------------+
+
+  Note that different derivatives of the Fetch Unit exist. Each implements a
+  specific subset only of the pipeline stages shown above. Restrictions for the
+  units are specified in [square brackets].
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+  fsl,prg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Optional Prefetch Resolve Gasket associated with the Fetch Unit.
+
+required:
+  - reg
+  - reg-names
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchwarp.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchwarp.yaml
new file mode 100644
index 000000000000..4c916ca7f8b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchwarp.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-fetchwarp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Fetchwarp
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+allOf:
+  - $ref: fsl,imx8qxp-dc-fetchunit-common.yaml#
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-fetchwarp
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    fetchwarp@56180a60 {
+        compatible = "fsl,imx8qxp-dc-fetchwarp";
+        reg = <0x56180a60 0x10>, <0x56186400 0x190>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
new file mode 100644
index 000000000000..9d1dc3a9de90
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-framegen.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Frame Generator
+
+description:
+  The Frame Generator (FrameGen) module generates a programmable video timing
+  and optionally allows to synchronize the generated video timing to external
+  synchronization signals.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-framegen
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 8
+
+  interrupt-names:
+    items:
+      - const: int0
+      - const: int1
+      - const: int2
+      - const: int3
+      - const: primsync_on
+      - const: primsync_off
+      - const: secsync_on
+      - const: secsync_off
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    framegen@5618b800 {
+        compatible = "fsl,imx8qxp-dc-framegen";
+        reg = <0x5618b800 0x98>;
+        clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <18>, <19>, <20>, <21>, <41>, <42>, <43>, <44>;
+        interrupt-names = "int0", "int1", "int2", "int3",
+                          "primsync_on", "primsync_off",
+                          "secsync_on", "secsync_off";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
new file mode 100644
index 000000000000..2a6ab8a0ed7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-layerblend.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Layer Blend Unit
+
+description: Combines two input frames to a single output frame.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-layerblend
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    layerblend@56180ba0 {
+        compatible = "fsl,imx8qxp-dc-layerblend";
+        reg = <0x56180ba0 0x10>, <0x5618a400 0x20>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
new file mode 100644
index 000000000000..7a3b77ea92c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-tcon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Timing Controller
+
+description:
+  The TCon can generate a wide range of customized synchronization signals and
+  does the mapping of the color bits to the output.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-tcon
+
+  reg:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: video output
+
+required:
+  - compatible
+  - reg
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    tcon@5618c800 {
+        compatible = "fsl,imx8qxp-dc-tcon";
+        reg = <0x5618c800 0x588>;
+
+        port {
+            dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
+                remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
+            };
+        };
+    };
-- 
2.34.1

