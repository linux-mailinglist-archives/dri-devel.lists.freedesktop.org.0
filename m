Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A00DD93AEE5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 11:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35DD10E658;
	Wed, 24 Jul 2024 09:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="CuE2Xx9I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011024.outbound.protection.outlook.com [52.101.65.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB4D10E653
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 09:21:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYwfB4qa8+dp7I1h+FiwBXsYIboZIQerGfxfE1yBk3tskQA9KhRPlwpp+nKfYeqJ7I6qKT9xiA/F0++IiWU4AyS1m51hN9sQm1soHpqxCW/W7w1sgS4JAmYm82zXwcqkp0OrAe/nBkAsSBpOwula8kkqU0dqsDFM/46o3MyqBfCNvme7cpNf5aBXWFh8ZxU2Ohz+Gk/ASfHPSD/S2pyFFJReWNi/n8Tz602tpeLNJInqkS/YD3sgwt/y56zRkHFLWbU5zP+o4W7LOcOJ7sQAR8mZHUl1fswH2BWSgFap16bISGBLpbtZCKVzEIN5e3VubC39DkL5oDe1nxxW6qsm4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNwSvLqxBgPyuj+vN99YQxyKL4magz4agxfOwEekEAs=;
 b=DOZyohxCx/0TNIJEALEJ+5LvBlKlLEcytRgnef2n1F7iDHi2W14frn0bHJG3X1w8XCZLIoRTFg0hm8seAFjXi5jzkLYBaUnKwZcnuJ24FJPmPuAoDtd4z+HqoUuE+6jnsqiAQEANmVvfypd6Sk03jVVW55wKTkxj/TMDsZtSXBcy5EaZo/xig27vAWT1PRwWAkVkFDB7EFljJDZhB9d6tB+JIU5hJgGsgl/+sBCAWFyON6fm0890G6jkmupxUApdc60HmIVSEBqvQtwY5VaDOU+PuOnj/93XNAUNA2+YzUdaE8eXlh+8osKDMWE7GuzKUPOL2smmqM69i7FV3s8bnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNwSvLqxBgPyuj+vN99YQxyKL4magz4agxfOwEekEAs=;
 b=CuE2Xx9IXoOY4Fn9YeyjcU6ySJRwcSTL87d5z6mTZt6XAxAv64zkvsYSBftHFIa8QsmwhaN9TpyTHmn4l5TlyRF7cMXk/JS+M8+oO7yNBLftehe+WEBP/X3DC5stAvZQhmdaCYuTRbv0FicOsmWjbnpTgXvMrwoPYZgLRE5NKrayWt1WpYtqK/FOwgPLsMs5a4U+PA4LXvYnUICESp4UrNO2NmhEW7PaVxvtJvf8Gt2rJa7dOLaKS3BRzJ319LO82sBPCws5H+3MjbO/6Y60L725zmdlbmF7Lcqmn+fSJpGozEwwGeYGgQ9Vcd58ic/cXMH4gEh+DnvtTphUDMEGKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8040.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 24 Jul
 2024 09:21:51 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 09:21:51 +0000
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
Subject: [PATCH v3 07/19] dt-bindings: interrupt-controller: Add i.MX8qxp
 Display Controller interrupt controller
Date: Wed, 24 Jul 2024 17:29:38 +0800
Message-Id: <20240724092950.752536-8-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240724092950.752536-1-victor.liu@nxp.com>
References: <20240724092950.752536-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0193.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d06aed2-f30b-4e4e-f6a4-08dcabc20ce0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?llfuPnxRgAdxywM1axo/nHKgklAU6fjLgGJQXmlWeVqHTKnMwSUoeJdZ5SAe?=
 =?us-ascii?Q?Df8PkEFds7RHQquVvEvciWycv26sCT4rnPQ11x9ojri5/mmt1OoysV0QjRHW?=
 =?us-ascii?Q?Xfm+lAxW9KWyFtUrQ5lx09P2za7PYN5Qsmj1qBJhSy79IfyFaOxqqamkVLZe?=
 =?us-ascii?Q?D2AN5bI3R3oihGX1GsslkEuxcpjZ0alV/R9wvvwTcfFOQeiCjIDwfD1JK2si?=
 =?us-ascii?Q?l9ihbD5QQt0LjshTr4ZSDZduJMU96ZhK64T8Y5K+XBfXXaO0c1+exHVA6cLx?=
 =?us-ascii?Q?hNcUnfTrvcJjh8sGMRQQWrhJJz39xB/KzGOksjPb4/uWN8CbNFk3gA/zQMkG?=
 =?us-ascii?Q?6Cou7JTd1SUOXVach62xzsMQGBdUSWdXPKk7yPsOtnfDfCUoeOAadeygeLc+?=
 =?us-ascii?Q?2ZzjDMeIUReclRe9j0cvsNluaRAZTtDvqaPJaObM56ru+oR0Wk+C17eKPfmE?=
 =?us-ascii?Q?DYnEqmIwALqsLzVhbZg3UOqrLfmALYMF/vCYaCGHBTGP2Z/Nu4O8XLGJsy7A?=
 =?us-ascii?Q?qysk5khIIo8EybzKRdeD+RR/ed0DA9wfcQhkhdSRTvfSWN1otTS+6A7gWJFX?=
 =?us-ascii?Q?P+xDb7Ya3aqAu6VuLEuYNeTNXVq5sJTPQsXj+3CxoYk1GzPn8Ainx2Z0ZtQy?=
 =?us-ascii?Q?BaZIfEbAUVzLaYvuJCKMq4okbqlXwp/WCZrwuz9WyCJxAxCF/g9Hu6kWo4gi?=
 =?us-ascii?Q?bbvn8idy0TwCcjVh3D3hy+/voujm/IMpH0dIpo/qFXJNBxayCYwm/rh5B8zi?=
 =?us-ascii?Q?7dC0RVm3Z4cCgwxslYq8kzuEFyHVsU887QeEof6AsnYYxb72bwrea4RkrAjk?=
 =?us-ascii?Q?mfSlJyENs4Lvgt/ZsGa/C5D6aoFvwsNTCm4Nf9XFju3J0mCLflnfsqLWqr+j?=
 =?us-ascii?Q?xGb4yBpi4agCu+il7r5O/VXCIu+GyqpmVbwatCs0M2SpbXL16uzuZQhs7QwY?=
 =?us-ascii?Q?jeNkqmeqHtBhIvi+OulwzOaYSmBwz65GCPzKSb/4jsxDTiDoIdxNtk/dzckO?=
 =?us-ascii?Q?eUtjuZyAJnVFG8l12YxbjWxwkGvl3HR6C6qQARdML2kYQIu+9G+BluKVX+1q?=
 =?us-ascii?Q?8TBJhwTWWHpbZxp8f4MX5I+dTOMC7Fqy6DKJfVOsTUeTPuvY3Lsc3QgCWX5E?=
 =?us-ascii?Q?UzzaCUxiQg1RF7mtI+dFmsLjwemhM+TMUD64VJbAeLvTR/zzRTde0Uu4EynR?=
 =?us-ascii?Q?Oa07nEsZ2O0eY/N+2lOJYXT6g+MkEcDe5BzcOzHcaMNgjePB05xu+iaZUEMO?=
 =?us-ascii?Q?cd5ED899XsSVeMimaKKku3neLBt3tjAT4zwEr9CR0MtPIbvtUr8tKPh3z6it?=
 =?us-ascii?Q?Wy9uqIpsrMXZCIz8GMlqYq+wYYaU2y0IClZdXHA0f6Ym/NIqUClYLtpPiwvK?=
 =?us-ascii?Q?q4l2ZWs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JmaPgTNPovHkZAvQqwkwB4AfN9Qd0QCcdWqDevWTeAK/47ckCT245sqAEWiO?=
 =?us-ascii?Q?emR+KvUCIW+PYcYfd9y6A89c6OrwXx26mwMeelKACkVhJNdCRwH2tS0CYomi?=
 =?us-ascii?Q?lqRtpxVivVwmSdmwezMspLpD2ppmGkjnsvAqmt7tE5TgqxjAE3c9KOgV9tEf?=
 =?us-ascii?Q?jPmfYnB+VS5bylt2bLlVr3TIrSUhb87LT/po339cNB1qhoqiVbdfqSJ1NUEn?=
 =?us-ascii?Q?RZbRX9YRqXpedbFDf1KO5YXrm//MMdFMTZyNCfJIa9MAXAKNQclz2x7HYF8W?=
 =?us-ascii?Q?VvXqoUtPUM6cMDu5lVdTdynAEDnnvJ26P8sRrrcTTxLV7qPm41ausb4mENXy?=
 =?us-ascii?Q?PuPGt7GeW+s6gr+BXMl/IWUZQHDwJUvsCrEGrEvmb8ZBvEFncLiHIc7B6qrW?=
 =?us-ascii?Q?LS6DWbUQHl7oz28DANzr7ioPP0X5TFQfPKrcxwvqMIzV+TDUJQ6yZvw19JgZ?=
 =?us-ascii?Q?JOJoh1wmAKV7mUWNZePXrZNQIiKzi3YYqoh7ABM/ipLkYpdC8IhFi9JOK97J?=
 =?us-ascii?Q?N/Bpo5E6xUWWhAdraEqItgKYXEpNvZOXW5k0iBoHDKKsSNbed9PVCJCAKKF2?=
 =?us-ascii?Q?/FEvlqbqGgeyngFIeNxYoCN5ENLlvvWTvSc/k9QJ3HW1PpLJmVzH/TlTXmEV?=
 =?us-ascii?Q?C0uf72Nndis7w3HtZoEYWoHzvXadCER193sQ6z/CiSZ+osHZ5ez36hxe5vFW?=
 =?us-ascii?Q?DV7vQheuqu7yyA1ngi+gxymz9wxz122qyE09gWcoQCga+UkOa4N2sgRgxebJ?=
 =?us-ascii?Q?/8wm/ccblphUztR0v7zOLugx/NIAticMvYK9yMzvCwNPoB0SmEOjHmhqUyxL?=
 =?us-ascii?Q?FtLkco4dMAnpcgfHNlniXCMCr/TJ8ealqpBTeR620hbyf7wLX5L9KUqfdmUz?=
 =?us-ascii?Q?3rZ28TMvEgfQ0hinzRyw8rg50Z8Yuv8WHwViUhcOf6vpOlTtlsTWXopm7pS3?=
 =?us-ascii?Q?EatyvAjDIPSNOsuVhIfCluL1BEgh3zbE7H252Z3uFJFUnMAuEP2qxuyfSSzy?=
 =?us-ascii?Q?GgHablKPdmC8cE3oJ0RW52InlQooaTtTR0aO50jMN/b4PQ9xhlhlMqlR7aID?=
 =?us-ascii?Q?qcOBSONLiJTNRvgQjCAOwZkQxaof7AMskKkXJe35zo+jNbudugRDoqHYbGBQ?=
 =?us-ascii?Q?ZBe0EuAybgTPEQ4ilB8esifajP4jRxBLplUVjuxrhIFGywGKlxzoobNdvha9?=
 =?us-ascii?Q?LQEZ2D9h7wjmfcPBuoA8QeR7wxNp+F8DSDPf3wtj+AvSs/DKcxsQSlRR5MmE?=
 =?us-ascii?Q?0i1aGDNaTd8/n/SznVitKhqmHzAoDgv0DnzlGENg7U+xukAIRsxy/sTExSQH?=
 =?us-ascii?Q?ucMJCixWbLYLfGqARnhXRKLdLq646WKmZWciiiwIwEinROo/iXnzuK3iiSYc?=
 =?us-ascii?Q?SkwU2TO9fwj6TZGMJAuewJTRWHbEtEx3C5ILB5sKugLpYmVpx7N03rS2QvRE?=
 =?us-ascii?Q?GNAIIvdlR0xJjzof7B0mOR5hpJvgoiugcdqRsFDn4wxLr7J5k3yUkU1O91k3?=
 =?us-ascii?Q?x+lEK5tuQc3zsGs8rPU7QZ7bWG/Z1DT6a0yim1XKK1ficM+/XvoR1acoemk/?=
 =?us-ascii?Q?MRKIt3PcWcTPI8ee7hosWxF+dJYw0uFRj0NJ9yIb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d06aed2-f30b-4e4e-f6a4-08dcabc20ce0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 09:21:50.9527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HO2835BkUoGIzuE1S43OBUdp5gRbSX7ROAer6AzPeoDJRE9FjMcI4MTgf7B7ZAX9/zcVfpWMuPrp96mplfNkwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8040
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v3:
* Collect Rob's R-b tag.

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

