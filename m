Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F865923D98
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 14:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E529E10E1FD;
	Tue,  2 Jul 2024 12:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="pLscqtP5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2070.outbound.protection.outlook.com [40.107.103.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F7110E5D7
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 12:24:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HM6QOeb0jBndKiLMA+GxbZSSvmDYNNTl4mNDZA/DbZruMG23X/O2V/xTttSn6eaD8kMehreNlUjrZ2uPmUL4yXDkeEj4I42jmT98qPraXDeFZ1PcjrpZDhIwdxqP8XHL9ZG39Gj0aFjV7Q0mtUlyvrsXIJpJ3m6OCQzEREfHYlKJ3fRlfdeFemCfZ8H8Hvpk1Uc8M5d7BjcT8bftXRrpOwWbnJtYZhjgwUOP6giHHkPeUmHRLBNzQFu8calBo4R8nB15RlrlGF3c5hwdAcINsQxRmHiT4ezdWgsS4iYDOpGnoZmvSes70CVOUvjhUNND7HTk/ijYV9R0j6tF1N+5WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQatCSkG1+sh11XWrUC1YE+6QYLEMVNEp9bie9OW3jM=;
 b=Ly/Qh0kWQ+fd2TxxmwMqVC1R52g9JKyFDGyoSnjics9ihxjQZCB8Lj2PSwYUTEL78G/Hw4m4felykdyGK6/P8w9NOVEca5xQ1zNhS7un8sazGkII2Nlb0O1uVDMlzAx+bAquOdRB9PEjFLe4gqr0YUwWRtfaJaQEIUyLwrHAHMHIC4UIl5b1B1PcTFlA2rOm3G8doGV9rBCDvz3Hx1ARt7Y0ArJwa2te51EZg19Cnn3LasZvh25LW+rnRe1x5Eh8yIA52yDwdGC8et7eAPu0Js10erg6x+ymWzt7YkU8HavGMyQMsXHOMGzztZzSx0lJJagga7TRjWlPGmjitp7j6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQatCSkG1+sh11XWrUC1YE+6QYLEMVNEp9bie9OW3jM=;
 b=pLscqtP5GMFHJNKUV/dNxnS6Ew2XPFUaFjrcpVu7mIsDWe9HeTH79lL+WCs5lkDNuHBs0WGoAi6lOC17F1rvtut58uuDvxOEQg8JxIqQFWORLwJPf2Ob6Yafmqfb915fEjuI71WjRwoiDRucMwzFZa7KKrfkh0j6NfVXHFF2Gzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM7PR04MB6870.eurprd04.prod.outlook.com (2603:10a6:20b:107::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Tue, 2 Jul
 2024 12:24:27 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 12:24:27 +0000
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
Subject: [PATCH v16 5/8] dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
Date: Tue,  2 Jul 2024 20:22:37 +0800
Message-Id: <3f942b32bc3d34dcd922a6e4a5924c7ebfede2ef.1719903904.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719903904.git.Sandor.yu@nxp.com>
References: <cover.1719903904.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::11) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM7PR04MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: c9b16499-86eb-43e1-be3b-08dc9a91ea53
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|7416014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?miE7rJTm8TVD5pIQoUEhoPUWlkRn6CKwZK2y5MWDTIaUpjjx1Oas/llii3Yc?=
 =?us-ascii?Q?ZKUR9Dsiqcyz/iDXcQRRGNDF/8VNTW/hsHI+MEQb6bRJ4iMAdRkUfzuXQIo0?=
 =?us-ascii?Q?K1+yVwbVCkaMkvus44wajj14H9OWSAtx1KgAajJXLBwyn5Irh66SMScLTyrI?=
 =?us-ascii?Q?+1FWsuavBRh/r7/L3g3jVqADz1m9pTfPrfHQQFw51g3aJFSn6a+yA/O2Xp9C?=
 =?us-ascii?Q?lg3I1fPpqor4KduySQ7JowuZE7/ABCcNFF2x3Ema/OaSGDz38Wfjobr/9NcH?=
 =?us-ascii?Q?mT1NzceQM1sK1gUZmD0wJI2mYhPXc3jsqQQmQC6555lZ0EOvgOORvMSJM+Nq?=
 =?us-ascii?Q?VuAauyUdMj5LGVRiZ3rLTTsu/SEm2J2IoGehFIdK2N+jTIB7wP4iSqZ/+tiY?=
 =?us-ascii?Q?R83zJlxXKdyzCJaEsXlLxbHdKRsbLkzJ0MfhuHIj94BV5P24QtzHUgM0vUw9?=
 =?us-ascii?Q?kIvI0BSSPakokK+pnzGcHwX/OjROBL4lXP/JpDbut2yajyfn6mBoJRn6trOx?=
 =?us-ascii?Q?PDfN6I8/uv1Vqx/2KL4tDY7nrW+CKgyqNDXuJVEWu3do3Xk+djz/ynOLRLMG?=
 =?us-ascii?Q?wiu8Pd4XRtMYjYVpgtB/uAea4GTwNcZAwyq+4GkakaRMpoPnttgqf+iYhd0v?=
 =?us-ascii?Q?YNZLMVLKSf5334okrnX0ChuI4defi0fZJRS/XwBRl7w4uY+LX4HwvfyBgb90?=
 =?us-ascii?Q?ohu/j0+h0i+FtiorDpe76UwSpo1H7USo2uP9M10+1O4zuSqTFdu6xmk6Nhzt?=
 =?us-ascii?Q?SUp/y1rkR/V9np+fSmpoGc/RRAUjjyzCfbWxB8jMuQBfSrdiGadHDGkAHyxo?=
 =?us-ascii?Q?ND1+bCoyxS5eCsQWtPTG/72j3IVrJBTF7gnsvw2qnDokF/n61PTX+vS+e0nV?=
 =?us-ascii?Q?JfUeBlSWsF6bNkHZFQo54PCOB9oAIeRBcgCfhilRCUVviSFogLNKDVtYKtJ/?=
 =?us-ascii?Q?J92OgbP3L4gpsFaHrrWdwxSjBU5pV2dNiFk5qOi/xNg2kRkM0DAutSHLRYoP?=
 =?us-ascii?Q?JXXJAF+mLZOvQ5v3lKLP+PDruaPAKOyqM1Mu+No+uKlZIvJkMyBtmgGB8MIU?=
 =?us-ascii?Q?n++RhwiFnTCm1t1TeWZsaQSXoCYGeVyudQ7F0kuB7ZGcyp2ib2LcBsuan8ks?=
 =?us-ascii?Q?JGWnui0anm+1VKce1+Rc0IodzkI+bMElqP+uBRQXiUKKrRygxFO1gOoqgPk4?=
 =?us-ascii?Q?TXDDmif81S92zAq1QXRBgxhouGQDo1B8eQf3aNMJmBgezCstxoQfZM2T6p+M?=
 =?us-ascii?Q?UUjms9OMUHVWG0Mxl9tqddmQr5+8eqa0lVQ//JeI4dXup2bBkrXwLtJBbHcc?=
 =?us-ascii?Q?xF5xEb4SMFgLQoREOoDSX8Pgx+HXmqH5q04zhXHO+ziQmSZNMoJfX4EXsjQ1?=
 =?us-ascii?Q?I/qPGeg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(7416014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wwN3euRpNX7/pQjNTVqxKxNaERokuzUcfKPsAX/9WRa2EQSEO91RPntdr3g6?=
 =?us-ascii?Q?vIFxF/tpOcGyANWsELoY3vtGIpEs6vZmfnAsD9fEY3co0SIO8Z0ayEegXB/j?=
 =?us-ascii?Q?rhoSkt1TB9vxuNcNKprXarWRbFBHKtFmbnFdyaXDC/Ug3clJmz8ViGgK9IZp?=
 =?us-ascii?Q?qsbxpZPWeyaf2o6Wt2UkQ9qywLkRp91Snx6a1P332X3ZHkk3AXfGsCr5XUEh?=
 =?us-ascii?Q?pCQ+EYLT1CGgu4KZvsK2xZ7fX8GOJiC1PykYA8cGqnFfmbAv7bKD6ukEcCyE?=
 =?us-ascii?Q?aBIahALCKGDgWM1oJh+CtKsMX1SvyoxG+Oejhs1MT4oftFt2zG7dIPKLmBOP?=
 =?us-ascii?Q?Rw3ta1WG98gebV4SVPf3dTb3Zs6Cf4HyKs1kObWGVrhqhUy9ACpmvV4INk/U?=
 =?us-ascii?Q?DyaiJXrj4NIIpUaAOG2HVVCn+UpUQyDhKQVspTfziFE8wXie4wkfx5iG+uu3?=
 =?us-ascii?Q?8GrTHNI63Xld4dywb6rMLdkKgm8L1LNOaqdQPfp/fNAkM0o4i3GtOfx3JQT+?=
 =?us-ascii?Q?/egkkznz0T1s6Qx2vovdWpsGOjuAz1o6IWMC+iV6mvTqCeCJSiSRIJEeLUlv?=
 =?us-ascii?Q?J3kQpm+n1F0tdozkrVEs7AJYg96RNnoO/6SgFySRwPIjE5TfxKs1r8bih3c0?=
 =?us-ascii?Q?6lc3EszhLGIU1OlvKAgaTPyoT5wPfL5e5NSzc7f6D08xnxKp4rZKJQpnLrZf?=
 =?us-ascii?Q?VF+Q7+ErVGZJB5OjZDl1tdeTXRfJGk8hKsRoNdM+aM3HbiiJ3bKEDDBZW9Fh?=
 =?us-ascii?Q?DcsX0O5yAYdXRyN7iyzq0OX0RFXKvsW8XKV7W6L2V5KXWQ1xMvjxwtejtB3N?=
 =?us-ascii?Q?nv14obMmtOcKPh2WElH00IfOonJOnb2Rf5dm3jJeOjEeB3SAg81hGzVTujRv?=
 =?us-ascii?Q?HTptwO1K2HHq9oD9JoNp5rVr7USM/aeMqtvNc2fSGIlcTuqGxAZAqahI9ClI?=
 =?us-ascii?Q?kPveR/GX7IeQ//7gCLxBo3xt/JeRxSGUZYHBINk4qgWP4DL9olkuU0R31BMb?=
 =?us-ascii?Q?g/ftBd9YHLOhBnDycT4S+I+mg+l8z6el8TYrfVXMWvPa6QZ9RcXIDVhzU7m8?=
 =?us-ascii?Q?k/8EeF5TbS1v7FkyM8gOTGZ+wXUcNWnkiCIYxrDgHwbLjHRpWlAiEjdd3yJZ?=
 =?us-ascii?Q?jxW7JvRgbxzu1qufe1d5glAPAv6NvIpBAZuveMCs9KAWX4Xxb1qIc1OdGJsp?=
 =?us-ascii?Q?Zx1I4on4nvwJtcCZP2K6UJqyQSw7R3F4mKyZL/37Oj7cyfaBzscsdY8udKWq?=
 =?us-ascii?Q?dMQXMKl2zRtKwpymqZ/jCu9ftlm/HiRS9lzZzR8LTM9l1EH6moPs9rSNvNkR?=
 =?us-ascii?Q?T8aoLm/Vqx88CIMTJeArIn8hmdwpiaPxSE4PwVhrNW8T04EoyNK4iIpC0N9j?=
 =?us-ascii?Q?yzowJ2te0RrMzZjbp2GbN7vjgBLI859rbjTU87o8uk7BqNH0XNbe2lcadFYS?=
 =?us-ascii?Q?KoFxLDKUzzgKa7fxUV4VJYMNhCXmfMoV0fuxvt7AMJ1uTNY3MQZRubw9Yec9?=
 =?us-ascii?Q?yHYy3BvAZU2MmEkNL1pf72ClxC+Efov8QvBYdW9aJF6dq0W1zKapE03aGQVL?=
 =?us-ascii?Q?Is13RZwbZx+OXXS+Reo8AacXzZ8sdcQzYnAwmPnd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b16499-86eb-43e1-be3b-08dc9a91ea53
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 12:24:27.3857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XmQI17HmCVqwU5H0GJILeq/2F8GCHpCkw5v01GjHhqOWC5HDG8RAMNasNWLk2JhOtmJnGXlOf+P0CMwh4z+KBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6870
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
v9->v16:
 *No change.

 .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
new file mode 100644
index 000000000000..c17a645e71ba
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

