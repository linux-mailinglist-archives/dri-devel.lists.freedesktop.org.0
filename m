Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8591D92F7DD
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 11:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C2B10EC79;
	Fri, 12 Jul 2024 09:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="C3M66UOq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010062.outbound.protection.outlook.com [52.101.69.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4FB910EC79
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 09:25:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCLHKtplAfWO4hEjIzBpdp9/mGo60IA6ROrc/4KEgCa0RwZotSItx7KCpzObMu/F/FHrTtpqkqwTked3AKfjYc88aJEC9/+r/Y753Ly179JRJ8nTcqbeihbNC1SFm6Rv8fxRONAjAv9F2uR8dsF+knmCkz85SO2Zf/V7+QxGXh8OZ64vL3YfBxP0Ry7BSU5c62gN6SC4K/urBLWCt2cDiCZTD5Qs0U8voRNqZLmUsVkDr7W3T5j5Ufzc2RZAiN83FTv1lBg8B+CRuIPsX9sKhJFlNFt6/JfCHbwLKLgH+EnVpOc/2BuLQ1FBPuzuQ//5+wXJczXKgwo2A9wmzfsvcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nY6bm5X04FAKjKBuQsIZczLpr/uoEuECxbsS1LHIXjk=;
 b=h1jmL4fcTDfssZ9HglS9aAk1xIoxDYl7w5HOH/3nP75ptpIhTiXaA4b562npNRKnal5dX671r/o5XNXET4VDezTsdYbMLNFakB5JoSO7ohccnOtAg0PJxbAB/rS7bvqMrWFKnbBJ4Fzh5DHOKEhqFG3bECLHh/P//2ueCPkLWIIgSsb4ACILKCciJmAWWiDI+fS2VrRxBmyKFyjRMvDGmjzt8Jw/mMQRm7w0dk/PcL3p+Lw//sWHcp+9V/aL5zsKOeYMcVrxCZjnkwD6ougSGut9Oy9AJXr9i2nOY0WNDZpcuC0sBWg7XxDDXmXbfDJx0iedHAh5IbZISf3jc9dejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nY6bm5X04FAKjKBuQsIZczLpr/uoEuECxbsS1LHIXjk=;
 b=C3M66UOqTSIb4FMnqmpS5cKp8w5hfwkgQ4J8Z6hzbgE4+Ymyhiqed1jKJRzTAYi5yJp08+RsodbeYcaPUrGgQ2oHieVlBRu/jsEOQWQmgJYu9w7znzu8+DrGYl2Tp9rylsIhnj0vLxNQ9RQL9/HLwCojCiIzuntqBiSJIT7iLTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10289.eurprd04.prod.outlook.com (2603:10a6:800:242::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 09:25:05 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 09:25:05 +0000
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
Subject: [PATCH v2 04/16] dt-bindings: interrupt-controller: Add i.MX8qxp
 Display Controller interrupt controller
Date: Fri, 12 Jul 2024 17:32:31 +0800
Message-Id: <20240712093243.2108456-5-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: cdeb5bb5-ad48-4821-ff70-08dca25483ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NZ1whSw1kTbOSyNMVx5jil58KnQgPgNNpO9us1Gb6JBFeGgcDSHs/fyUOUQ3?=
 =?us-ascii?Q?+AkWCVeuD4xv8F9lB8a1gA25vGKRCzqga7u6931iF8tY/epTstLopFUZXtEn?=
 =?us-ascii?Q?6kZCBKJ/3xqs0+8p/m1ttPPjmN7Ia88yr2rT4KUzBUh5B2hx7Es/FoOdqq6t?=
 =?us-ascii?Q?RCb5aaG41ksKo2/AuCpk3oBpu77knPbeAHHa8wff+PKx7GBHHpANuy8FmkXs?=
 =?us-ascii?Q?0VfauRUffE/WDlqqSfOh3nYQIK8MWqptRZ9KGgdSrDZSFIeKM0C9A9njZmG1?=
 =?us-ascii?Q?SFAYT4XL2QOOGpdt/uStnqDbI1pOvwfqeacGPAsQ2EsqjiJC4KXEtk6nKoZK?=
 =?us-ascii?Q?W2b84mlOXX90KSIA8MHt0NMw3pXO6T3wTGzFowFKhjfph8mOLIpLf2IKit6h?=
 =?us-ascii?Q?CjN2Eex2PNXE3kQjkWqz4njLQeT4j7KiojBGhAHRXQbomuqYtUBPIVobWNDu?=
 =?us-ascii?Q?eMxW3Hih0ktAV7TsRvR78VIXf0xeUrTWmGDDkCmHl1+CXDWLfxWEolZcP7aR?=
 =?us-ascii?Q?sylulwEW7VcE5UlvIf9mxH1jsPJL50hNrX2uhv56Jn8FrLjJ6pBtbEUhSth/?=
 =?us-ascii?Q?u9STJzaZEKnw8tM3j9n9zfYB73LYPZWFj49OD8N9apFoeW1pQcdq7DDmOslc?=
 =?us-ascii?Q?NL/ynDbGQIq9LeuK3Q6ahlDnGgncHzyQoIy2y/2fKBnv/aQmwB1rT31L0VCU?=
 =?us-ascii?Q?pr/wBEbwkdv/TtjWwUcs4iPUaUTXWiWn2j2Qk2RuCOG4ur/TDJMD0mRBY5j1?=
 =?us-ascii?Q?QtWB1OlsdmI4XgQBjH/Bj0mavqnCoZHZoLo2w491xDO2RXswrBCDoShuB8gP?=
 =?us-ascii?Q?VF519qyQmg4YkcS8gn2wwvtmUSxlDlssw9P4lBf/mh7UxS3qCLs2Lii/zdF6?=
 =?us-ascii?Q?9p4qNTI2C7G03K4EHrzIu+HVZI/hP/bWx3PYPfdxrp1YHFle+KVNHF9UxG+X?=
 =?us-ascii?Q?kG5SrQe4Puz7sHbuMCkacr3GI7MXufy/laclUebCPNIP1pmbz+8XIzjQIfmK?=
 =?us-ascii?Q?FuOQ1k7UALhqpHXS2h2CE+nVB/Dtsu/8bQlQVlpugEf6If6L/ZqrGcMPex2F?=
 =?us-ascii?Q?CGT1pdLq2hXIBw1rVPsJXQTgZnuRfnyFJ9O0qVMGp6f8YI326To2NMw7qKBf?=
 =?us-ascii?Q?wCSupvMR2aGVIAWqMc3T/2PKGL0mJx5lQC97V2B8DzvZNIHOIDPl0AIzuTzD?=
 =?us-ascii?Q?tQs/OxQ5/b01mRsaP1OLlyVucPkD2a/1GKpikzLetJqUreHGpISFGQo02dl/?=
 =?us-ascii?Q?ptc5oq078pClK+LHdyfstgRTgKai+hNdqEzVSwMc2EelwjO+OH3GIrLe+y85?=
 =?us-ascii?Q?RvR45tafeTl1xyRSnnnLQgbPc+C7C9hk7ZDaWz9hsG5Tz1c/GcvzDQXiCYMe?=
 =?us-ascii?Q?LeDNI+w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fuFOrMiFXL9qdDSRSBZo593P2rgkxh0E8Errun0M3mIFnoSUXko9Uk7+j/Bq?=
 =?us-ascii?Q?A1PNf7Bahq8oS4UJC3ws8QmnUVykq+dxmgZbQ0Z4Zv2gp4wj3ahB0pZltq9c?=
 =?us-ascii?Q?k4MUu4HQF1TsLl9/J3TDAKn3RsGOUM0mb0cF/vdt0Jix9hOnyETGJX/CnkVS?=
 =?us-ascii?Q?lAjHLZ/8jdOjBPplQc9Kt2LXVsDB64iX0QCw14e4GzguxH37SCf3FbinvpsO?=
 =?us-ascii?Q?afTM8qLo7ll+e1JUuBmoW5gkLjg2v+jO7mkoMBn8bRJw4+OLbHTc6NrFD8vL?=
 =?us-ascii?Q?TlUWtOtLFQyaHd49c4LK432rCREaPMUkCdgQVnp2EpCKPMsKsi/D4Kbwqg9n?=
 =?us-ascii?Q?tlSuq009uaPuCDQcp/u64ej5M/UB9baULLRLrWGq8IotdaWbDLdT6tTFyAJf?=
 =?us-ascii?Q?8EMDMoFe7JU85fPoZnrSH4eW1tPxsRKjWuRbpcqjJbtuJlVOPIoYyxVWr293?=
 =?us-ascii?Q?c0l+BelFrTqG16ytBgb7nGC00a22kRJbs1ydBxEX0RnXLBoC4uuDzBexmgfI?=
 =?us-ascii?Q?/nP0qVTTaZ86ISaumLceTF2Vs6y+KzwXkJg5+asMmpgHJ2p6OntPHRufp26+?=
 =?us-ascii?Q?no/lLzUQY8iZf1bI16+zaCAWTuRnqV1REjLlEWpf1Yog+vJLMkzb+xTnWwpe?=
 =?us-ascii?Q?nS4Lxj5Q0hWGI1HPk1xxCSx7U9vNfqMrav6gQNB8aCgRqJL3JI3FTTcU/3W3?=
 =?us-ascii?Q?Ug+Ggk/EILB0JxfzRcuT9aqoR/dj9+r8WtKnC2+YMx7FN41mCi4NIvPwQUEd?=
 =?us-ascii?Q?u+Dh43pTyXRENF06IajSdoc9p9Ev4NVXWZHvM90FFriC19E7acpAQYxncdgy?=
 =?us-ascii?Q?8PFqOHYpsrQbvKy/WKd+sd6JJwmHFDx1JxjM6JIU2xkKbEZtdm9T21W1fTDm?=
 =?us-ascii?Q?iAp6P0PkzkZqwa3864uS+mjYjNhfMQZlxGmnsCsWzhUOk2bDATC7FkCK7hqU?=
 =?us-ascii?Q?2kO74iea/4kUSstecqCmW5lbknisjWAAUBRu1+zyITy7/xnCntRWeCeb8EIz?=
 =?us-ascii?Q?TmRQSoMcXDqvFGUHGLTvQUU4hpLVyR+Ockysk6OXsnw8l52emdTP2hiUvMeG?=
 =?us-ascii?Q?RgWayNiZQRvwgnh5NGOfz4/mdUY0mwmFhFNcNKYlNhkkYObgxH3SNxzwnqd6?=
 =?us-ascii?Q?7GpVv43G2xZ+vrJSKTsJk/bqpAA+K7t0ZRX0v42cY72JUUtVUVALXYD9Bg3O?=
 =?us-ascii?Q?HiIqhfc3LgZ9c8xZ3Y9vmpyAYij3a2PWFbAtiFaFXcrGPNmaIFIKxh+HN//f?=
 =?us-ascii?Q?6bkpOyiHMgx/hmR0Da2wiErAtyn34TLkeLQ/3FsDnm/8QeeMMtkaf97oAbhH?=
 =?us-ascii?Q?DOJsvsKcyDwlTXtHfeZXXZ7Aw1+ob/zicyRxJUIrwNDdxWgCG0ezzbeKFl3G?=
 =?us-ascii?Q?DSKTITMgrcs7tpG+A/kFc3G8gx/mD+Tj63q0BISvRpui6jgdya8Wdg3yjnBu?=
 =?us-ascii?Q?fGl5YYYow7RnvZrTIcZhYM16JRrPBMV6iOMleUiEOczgTLdmTbh7MdCW+wgd?=
 =?us-ascii?Q?cFZLp3wkwlpapjT7kxFy04QHukPh7mvnLEZTGG2QaunKQgZLvCOfelCPHwpW?=
 =?us-ascii?Q?rzlnv0AN22uxt02L/mp80k1KoDxZwctOZFqjl8B/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdeb5bb5-ad48-4821-ff70-08dca25483ba
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:25:05.2640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WOqiXY1l0p74bB9JiWg6ddw0RmJ0ekRnsxMPc8ucZEp9d83xIF1jT5SKDrSuiB9tr0Oyrvr+gRNKiN5Wiy2skA==
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

i.MX8qxp Display Controller has a built-in interrupt controller to support
Enable/Status/Preset/Clear interrupt bit.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
* Drop unneeded "|". (Krzysztof)

 .../fsl,imx8qxp-dc-intc.yaml                  | 318 ++++++++++++++++++
 1 file changed, 318 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml
new file mode 100644
index 000000000000..6985ee644a25
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml
@@ -0,0 +1,318 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/fsl,imx8qxp-dc-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller interrupt controller
+
+description: |
+  The Display Controller has a built-in interrupt controller with the following
+  features for all relevant HW events:
+
+  * Enable bit (mask)
+  * Status bit (set by an HW event)
+  * Preset bit (can be used by SW to set status)
+  * Clear bit (used by SW to reset the status)
+
+  Each interrupt can be connected as IRQ (maskable) and/or NMI (non-maskable).
+  Alternatively the un-masked trigger signals for all HW events are provided,
+  allowing it to use a global interrupt controller instead.
+
+  Each interrupt can be protected against SW running in user mode. In that case,
+  only privileged AHB access can control the interrupt status.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-intc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+
+  interrupts:
+    items:
+      - description: store9 shadow load interrupt(blit engine)
+      - description: store9 frame complete interrupt(blit engine)
+      - description: store9 sequence complete interrupt(blit engine)
+      - description:
+          extdst0 shadow load interrupt
+          (display controller, content stream 0)
+      - description:
+          extdst0 frame complete interrupt
+          (display controller, content stream 0)
+      - description:
+          extdst0 sequence complete interrupt
+          (display controller, content stream 0)
+      - description:
+          extdst4 shadow load interrupt
+          (display controller, safety stream 0)
+      - description:
+          extdst4 frame complete interrupt
+          (display controller, safety stream 0)
+      - description:
+          extdst4 sequence complete interrupt
+          (display controller, safety stream 0)
+      - description:
+          extdst1 shadow load interrupt
+          (display controller, content stream 1)
+      - description:
+          extdst1 frame complete interrupt
+          (display controller, content stream 1)
+      - description:
+          extdst1 sequence complete interrupt
+          (display controller, content stream 1)
+      - description:
+          extdst5 shadow load interrupt
+          (display controller, safety stream 1)
+      - description:
+          extdst5 frame complete interrupt
+          (display controller, safety stream 1)
+      - description:
+          extdst5 sequence complete interrupt
+          (display controller, safety stream 1)
+      - description:
+          disengcfg0 shadow load interrupt
+          (display controller, display stream 0)
+      - description:
+          disengcfg0 frame complete interrupt
+          (display controller, display stream 0)
+      - description:
+          disengcfg0 sequence complete interrupt
+          (display controller, display stream 0)
+      - description:
+          framegen0 programmable interrupt0
+          (display controller, display stream 0)
+      - description:
+          framegen0 programmable interrupt1
+          (display controller, display stream 0)
+      - description:
+          framegen0 programmable interrupt2
+          (display controller, display stream 0)
+      - description:
+          framegen0 programmable interrupt3
+          (display controller, display stream 0)
+      - description:
+          signature0 shadow load interrupt
+          (display controller, display stream 0)
+      - description:
+          signature0 measurement valid interrupt
+          (display controller, display stream 0)
+      - description:
+          signature0 error condition interrupt
+          (display controller, display stream 0)
+      - description:
+          disengcfg1 shadow load interrupt
+          (display controller, display stream 1)
+      - description:
+          disengcfg1 frame complete interrupt
+          (display controller, display stream 1)
+      - description:
+          disengcfg1 sequence complete interrupt
+          (display controller, display stream 1)
+      - description:
+          framegen1 programmable interrupt0
+          (display controller, display stream 1)
+      - description:
+          framegen1 programmable interrupt1
+          (display controller, display stream 1)
+      - description:
+          framegen1 programmable interrupt2
+          (display controller, display stream 1)
+      - description:
+          framegen1 programmable interrupt3
+          (display controller, display stream 1)
+      - description:
+          signature1 shadow load interrupt
+          (display controller, display stream 1)
+      - description:
+          signature1 measurement valid interrupt
+          (display controller, display stream 1)
+      - description:
+          signature1 error condition interrupt
+          (display controller, display stream 1)
+      - description: reserved
+      - description:
+          command sequencer error condition interrupt(command sequencer)
+      - description:
+          common control software interrupt0(common control)
+      - description:
+          common control software interrupt1(common control)
+      - description:
+          common control software interrupt2(common control)
+      - description:
+          common control software interrupt3(common control)
+      - description:
+          framegen0 synchronization status activated interrupt
+          (display controller, safety stream 0)
+      - description:
+          framegen0 synchronization status deactivated interrupt
+          (display controller, safety stream 0)
+      - description:
+          framegen0 synchronization status activated interrupt
+          (display controller, content stream 0)
+      - description:
+          framegen0 synchronization status deactivated interrupt
+          (display controller, content stream 0)
+      - description:
+          framegen1 synchronization status activated interrupt
+          (display controller, safety stream 1)
+      - description:
+          framegen1 synchronization status deactivated interrupt
+          (display controller, safety stream 1)
+      - description:
+          framegen1 synchronization status activated interrupt
+          (display controller, content stream 1)
+      - description:
+          framegen1 synchronization status deactivated interrupt
+          (display controller, content stream 1)
+    minItems: 49
+
+  interrupt-names:
+    items:
+      - const: store9_shdload
+      - const: store9_framecomplete
+      - const: store9_seqcomplete
+      - const: extdst0_shdload
+      - const: extdst0_framecomplete
+      - const: extdst0_seqcomplete
+      - const: extdst4_shdload
+      - const: extdst4_framecomplete
+      - const: extdst4_seqcomplete
+      - const: extdst1_shdload
+      - const: extdst1_framecomplete
+      - const: extdst1_seqcomplete
+      - const: extdst5_shdload
+      - const: extdst5_framecomplete
+      - const: extdst5_seqcomplete
+      - const: disengcfg_shdload0
+      - const: disengcfg_framecomplete0
+      - const: disengcfg_seqcomplete0
+      - const: framegen0_int0
+      - const: framegen0_int1
+      - const: framegen0_int2
+      - const: framegen0_int3
+      - const: sig0_shdload
+      - const: sig0_valid
+      - const: sig0_error
+      - const: disengcfg_shdload1
+      - const: disengcfg_framecomplete1
+      - const: disengcfg_seqcomplete1
+      - const: framegen1_int0
+      - const: framegen1_int1
+      - const: framegen1_int2
+      - const: framegen1_int3
+      - const: sig1_shdload
+      - const: sig1_valid
+      - const: sig1_error
+      - const: reserved
+      - const: cmdseq_error
+      - const: comctrl_sw0
+      - const: comctrl_sw1
+      - const: comctrl_sw2
+      - const: comctrl_sw3
+      - const: framegen0_primsync_on
+      - const: framegen0_primsync_off
+      - const: framegen0_secsync_on
+      - const: framegen0_secsync_off
+      - const: framegen1_primsync_on
+      - const: framegen1_primsync_off
+      - const: framegen1_secsync_on
+      - const: framegen1_secsync_off
+    minItems: 49
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+
+    interrupt-controller@56180040 {
+        compatible = "fsl,imx8qxp-dc-intc";
+        reg = <0x56180040 0x60>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+        interrupt-controller;
+        interrupt-parent = <&dc0_irqsteer>;
+        #interrupt-cells = <1>;
+        interrupts = <448>, <449>, <450>,  <64>,
+                      <65>,  <66>,  <67>,  <68>,
+                      <69>,  <70>, <193>, <194>,
+                     <195>, <196>, <197>,  <72>,
+                      <73>,  <74>,  <75>,  <76>,
+                      <77>,  <78>,  <79>,  <80>,
+                      <81>, <199>, <200>, <201>,
+                     <202>, <203>, <204>, <205>,
+                     <206>, <207>, <208>,   <5>,
+                       <0>,   <1>,   <2>,   <3>,
+                       <4>,  <82>,  <83>,  <84>,
+                      <85>, <209>, <210>, <211>,
+                     <212>;
+        interrupt-names = "store9_shdload",
+                          "store9_framecomplete",
+                          "store9_seqcomplete",
+                          "extdst0_shdload",
+                          "extdst0_framecomplete",
+                          "extdst0_seqcomplete",
+                          "extdst4_shdload",
+                          "extdst4_framecomplete",
+                          "extdst4_seqcomplete",
+                          "extdst1_shdload",
+                          "extdst1_framecomplete",
+                          "extdst1_seqcomplete",
+                          "extdst5_shdload",
+                          "extdst5_framecomplete",
+                          "extdst5_seqcomplete",
+                          "disengcfg_shdload0",
+                          "disengcfg_framecomplete0",
+                          "disengcfg_seqcomplete0",
+                          "framegen0_int0",
+                          "framegen0_int1",
+                          "framegen0_int2",
+                          "framegen0_int3",
+                          "sig0_shdload",
+                          "sig0_valid",
+                          "sig0_error",
+                          "disengcfg_shdload1",
+                          "disengcfg_framecomplete1",
+                          "disengcfg_seqcomplete1",
+                          "framegen1_int0",
+                          "framegen1_int1",
+                          "framegen1_int2",
+                          "framegen1_int3",
+                          "sig1_shdload",
+                          "sig1_valid",
+                          "sig1_error",
+                          "reserved",
+                          "cmdseq_error",
+                          "comctrl_sw0",
+                          "comctrl_sw1",
+                          "comctrl_sw2",
+                          "comctrl_sw3",
+                          "framegen0_primsync_on",
+                          "framegen0_primsync_off",
+                          "framegen0_secsync_on",
+                          "framegen0_secsync_off",
+                          "framegen1_primsync_on",
+                          "framegen1_primsync_off",
+                          "framegen1_secsync_on",
+                          "framegen1_secsync_off";
+    };
-- 
2.34.1

