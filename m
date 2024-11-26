Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168729D994E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 15:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8822010E8C2;
	Tue, 26 Nov 2024 14:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FRWWxTQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012052.outbound.protection.outlook.com [52.101.66.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987B010E8C2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 14:13:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sk0Mo9P7zWrtD/3PfT7SIYZhZWhlvRnhjD54EsDUu0gFsufQy83KcYq8oez2xY4mQDqbCdqrhQYfliXY4/KfSHoPI3NT5Dv6kdm+Tqpp00EfY5XHj7lh24zyMSvc2gWajZ2oYTdd51RWAQ8VAmmwSsT8taXyGWjQW548dQo2CI53kiYMuipoisSWMsc7Dwk0L4vwy8iSiQNYEKLe5kO9dPMKRJ4EvTYPMpsAjdMewIMmniMAmSEltVXjbhd7Q/PlFSvz1v1bz6uIv8HVAl8FLaSskPr1aLJcPQWd7nwtV1tUI+TuSjP7SWawbyg/LuG4nqv2bJalvAOAFkIDXm0vkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCSy6Thi3KfrjSiwuIK2L4yx6OrdwaOZplvEEPyRWy0=;
 b=Z7fVQ0ml76oPSscpBrXAAyW5Cjed02j6gxQffEk0ZmZNqGLMpr6zgv0rObsaPd1ei0ifCgThvCgmA2mIsp2L/KxYgjNLo0t85s4z+lha3xLdSJSQ5983FLhVxdJDSp/KFgU3OkOdj4do5kzuCqELtz3mOwV6FJvLquoeEoME/iOv6i8PaDLMjQHYU3edguD864KQcMgrZ6tK2LTRrftNeJWAcduAFU8Wk2+vT+5T6cr3WB0/uniHxqcajX7QiacacbWxpR5hyFq1Vso7zvXERA5fvolQ6deMN8HXgg2gkgKdcJ/dwUKXJy7TLQq2So6CUYoBHfVYFgRQFeSM3/oodQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCSy6Thi3KfrjSiwuIK2L4yx6OrdwaOZplvEEPyRWy0=;
 b=FRWWxTQUuDK1f2BQbNhlsPLpu5vgU71OdPH6p2oM2AAiUQ597MH5mGwP78gt9Zkvf8T/7Flyx0bnyeCLE6Lc3yZ0d7YnJ3J+Oj+4kNDOhSnpELJFUEUeqdAORSMkBkxOf30He73yWAEFgXOKp9wrTSSQnv4aNqdkAWM9mDA8DiDIZy09+l+ex5Eliq6NDcdTLgnBWMhQjqRizwmanbGaiW8DwGd/YHPbW2/VBQ2Z91uJ+SBtBVgsERCTyjZ9b3zJvg+u3xw4nYPcVsEdmpyno0R59LbDcP9C0xk0fvAeee4XkC1xXcFM89AR5KckjrfGZx18/abM9yVGVQgL7fVKHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8894.eurprd04.prod.outlook.com (2603:10a6:102:20d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 14:13:42 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 14:13:40 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 mripard@kernel.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v19 5/8] dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
Date: Tue, 26 Nov 2024 22:11:50 +0800
Message-Id: <54ee86767e5b6c7320b9b2053e404e615c290287.1732627815.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732627815.git.Sandor.yu@nxp.com>
References: <cover.1732627815.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8894:EE_
X-MS-Office365-Filtering-Correlation-Id: ddfd0e77-8b29-498b-de17-08dd0e248710
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i34V5B1afCHbfZ+97hQ90eSyAkWbCgLqqMGjKLfwGrfVO9MSdJnjHC5VnGxu?=
 =?us-ascii?Q?EbGRIFdVnYb+FA5LRiSmaD6xgtIwj5UpOvsxMBF4jxlk9CmAeDYSylEb5Yvb?=
 =?us-ascii?Q?ccQL8cdFSsCs0qymGtQHeA5WO0AzzSY4RMpri9t+5BbnSnE621n9b8S8sZxH?=
 =?us-ascii?Q?NoJX/fAnLB2QGE+Qj2M0VedIa+raXKXCRFUIzJnij86NzqP7lbb+1/6pJrO2?=
 =?us-ascii?Q?Gq3fISG/OWID7AwzLuFuzskICY05OlgfbKaspkOjk+MSnVBsnqCAXhfnnNuT?=
 =?us-ascii?Q?ab7KqdRRN1Jw1XZVPBBdYFfB8OsBmpOBJNwodbTNWSNGbNwZDfegeXA27LoU?=
 =?us-ascii?Q?RS1XCp25WWJDYhxmysuUsRo6+Eb2vKKPef2m/OJH4APqp7VBdkpYhyHtH7ZS?=
 =?us-ascii?Q?yJuRlJaIB6BVJi8jncKZ0/AfrI9zVlvXebnBi2AV6HvtDwIRQyTOkdEGATSP?=
 =?us-ascii?Q?vQTsZBMMaptrMPWsQtrsDpuqPG11vCSkeQRZetkgNZg98mPK4Or/ncBcErXA?=
 =?us-ascii?Q?vjkQfHeC6Zum4IGXD0waDA/TbuxyyS9ltDbDQvz/0OwzqLXzHKyAI7B1v/qc?=
 =?us-ascii?Q?2BtJFM4ISspso6G1kaCA2aPtLrGgOIrusZE/4ZUtG/LR3ZbZ1epwTyTel8oV?=
 =?us-ascii?Q?xQmd2fM5CVEvPgThgBDaOFJLArqkSk8/FDsl/e314ziFscsVMUHR5hvIFLmH?=
 =?us-ascii?Q?9iIYPG8SDSYr/XQAWrZ93eABj0BfJFOAbQMMu0tPVUnbFXfVdIR0W0OKmuho?=
 =?us-ascii?Q?pf/VGrPyE38NqFSe3eNJ0gyKqMOtbHNAS5BTDJPYDMzbAmisWUzXB8pvwIuB?=
 =?us-ascii?Q?dsZ8CaajxLJ1joS6UGlNfAwo8FXGRt5v72rW5itD4CDtckOGfmWoU2U9zOVh?=
 =?us-ascii?Q?24lET3z1W3kSQuDblZ99aSLWKLrAneJj8IcugjT3eWYq5ia3AQWwmr43Of3G?=
 =?us-ascii?Q?SXd1XM2bFnuVWhIa5pNYlka3Ku+7kj66/mVmxl+EXHUBgtobBDBrgv0cT9rH?=
 =?us-ascii?Q?ifbxuYozyXHowvt6gs834z3HE7t21Q8CUOxAh1r2RHuRutlWW2fSvkgcveEF?=
 =?us-ascii?Q?Yc73UItItL8YJCPCoHk6vPF52VYGzT51P1bOLdThVc9FAFYQ7WDxX7/MR1Kv?=
 =?us-ascii?Q?iuisAtoDQugPwpviVWPreXwwwbWMajTeaNlaIFQ4OQxM9SOJwDvgM+vlJLkF?=
 =?us-ascii?Q?uadLSrmms5veWhkldjylNLa8zjgzyE04Dsqj+/Q2gh4r2uPnfoIGy5npBwTz?=
 =?us-ascii?Q?izz2BkHcbIusBuMVPYYxlsrxGL5owebJ7D2HUryQf/PcYDnez0mJd3HQAHN7?=
 =?us-ascii?Q?SCOTJNLGzhaPeYJ2iClfz1WvY8l36b/zl/xQeFKPyvgh425ShR3xWqjmGqN9?=
 =?us-ascii?Q?ZS+H2Rw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZGyYxCK1T0tX6r0T7qyI3AEXSXwhibbkDNomzjcsaXZ+c5ZW0QLyQtRaDRpm?=
 =?us-ascii?Q?pqT4ctpufyvlVOwfYrViFCtCLz0vTYR9urDNSyS0bzh3CbYHZgGytQLxcjOS?=
 =?us-ascii?Q?Z5xfafK1A7rX2uqnnLlfYEEElyNLzkc4p8RM6myy+qL58ecbSAf7EJCkFFk6?=
 =?us-ascii?Q?NBBCkNFdXU6D8s2l6HUc3kYu0H/zdQxz6HPnic1WynwE7BjhG3FlOlBFI5jY?=
 =?us-ascii?Q?VECNQ5W0cQDj2SvK283xHtxiqGzzVOKNL5hqVwE16Z2ylkKltijjbC7DjtV2?=
 =?us-ascii?Q?qLRrNoFB+ZyFLUVjT+d9hWSyjRpmxUjfbZSa2aaoMRYDNJLKNbn6wIA8VGN0?=
 =?us-ascii?Q?jaJox8SjRNOrNglsP7p87s1pYLu/I384SgaOBIClZT9vIKol3y5Zs5gkxI0N?=
 =?us-ascii?Q?6d6CRAs2V/1wkRLzflTZfsUBLRKwtQ/y0tqlnkx4fcjDJxFZfWfOdrsqr2hh?=
 =?us-ascii?Q?nztVU3LiSLBw7YrV/DRnhcaF9g4gPi0OS17hnPJrmuMuRXhzwdlERPpZJWyQ?=
 =?us-ascii?Q?WM5gMUQAPWQjR1CWH/v5DHbkmqA2P00Yy5BE33CSvMqxKkfofI2ywg2+oeBO?=
 =?us-ascii?Q?GHJA/9/ir9eamhmf6oUj7McGjyhez7imLKo4/bb9qPzSyM+zC3wJIGQDMX5v?=
 =?us-ascii?Q?YXvIc4YYUgdHTZFVZG8n/tbTd6CQ/F3xiYA9p4KQCTvbj91Gew2BKX9R2c6Z?=
 =?us-ascii?Q?+/4UWsZM0mlFUWoAgwWIpJca5gSk4HGucP12sGexDCF3YjpQpp7bCRfZFXRw?=
 =?us-ascii?Q?AJiZk8zyVoMBW8N2/LkfWBD2wl47qGqOMoPcZaazWOLQJtoYxS554yVq1hft?=
 =?us-ascii?Q?eIe57m4N4b2aHthVcQPU9+L0al9P8H3egGaAx/IGkg+gtpyKfgJBk4aP7vpH?=
 =?us-ascii?Q?lNMpMpobMz63WXfa7OSBLcyhx0myKlFkn7B5VYGD9RMPE80RnRtXN2CgdNSx?=
 =?us-ascii?Q?3oudX3rFMWrbDoZ7PRk5A8SzQySQvrhjdjLGWeZsaPb3dkMTQP9Flgrb7jAb?=
 =?us-ascii?Q?MZLtEgqSX/gC2x5NfSSvkdbM9uvP0t4C02JIrd/H3QJbHgLRMvdYc5Fg5guW?=
 =?us-ascii?Q?7xUKY82iSPJaBBzSlrANye6TITWRvXGIAdwFbuEafm2aHAC7MOYz7EN93qbk?=
 =?us-ascii?Q?cIwUTTmOMBUK++u5009MaSE8VbLzqOH2I1qcCkdO5Rj3ENCfhVMpnAT772f0?=
 =?us-ascii?Q?cmJDn23lVz1DUNbyd02PGneuiFXCeRuVh6jxpbkz4kzKXnMd0mvnnlTvqHMe?=
 =?us-ascii?Q?xrt9CvgQR4lv79vu9xgfZ7PxbIXT8G0F3YQTwMda6cBuK17dGr4p97cTWd8W?=
 =?us-ascii?Q?9NuNkpy09KyNx2n+4+fuyihZpUNtolQwQxLxUac18ECty7FFCEv1z19Wi3Y1?=
 =?us-ascii?Q?iJGIUY81rEPa/cHnPJl7d8rMmRBGsgN9S2mBkGNOc2UbILalqmCHGDTp73Cm?=
 =?us-ascii?Q?G5+xr3JPr07JxVJeTcI48NYzzFnJbE29frS3GELG3SvFCvL4TJsrnM09Kn5W?=
 =?us-ascii?Q?FdvOgKdvyJxh6niIk1nTU8I4DbW/yVS3w7ZcW3FBhyiPiPBoKv87Gzf7om9l?=
 =?us-ascii?Q?IW+0pzO+ZF9U3UPqti4wzF02sVIXbD0s/H48a0la?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddfd0e77-8b29-498b-de17-08dd0e248710
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 14:13:40.7181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqoxPv1lIVjeLcxgLjg111S5XSJNtSfQHDVjRnBnJIuNhxsH4RSrks/1JWVkj68rLAFPCrYhBbH4estIEwnpyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8894
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

Add bindings for Freescale iMX8MQ DP and HDMI PHY.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v9->v18:
 *No change.

 .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
new file mode 100644
index 0000000000000..c17a645e71bad
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/fsl,imx8mq-dp-hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence HDP-TX DP/HDMI PHY for Freescale i.MX8MQ SoC
+
+maintainers:
+  - Sandor Yu <sandor.yu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8mq-hdptx-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PHY reference clock.
+      - description: APB clock.
+
+  clock-names:
+    items:
+      - const: ref
+      - const: apb
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/phy/phy.h>
+    dp_phy: phy@32c00000 {
+        compatible = "fsl,imx8mq-hdptx-phy";
+        reg = <0x32c00000 0x100000>;
+        #phy-cells = <0>;
+        clocks = <&hdmi_phy_27m>, <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+        clock-names = "ref", "apb";
+    };
-- 
2.34.1

