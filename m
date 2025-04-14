Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8158DA87665
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 05:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C688810E459;
	Mon, 14 Apr 2025 03:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="eTpQGyS1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013011.outbound.protection.outlook.com
 [40.107.162.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C452D10E460
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 03:50:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLnQmBByn1zXJfGWFfNSf30huXgCOFg4gmIDIb+OMz66PZqAXqGGxODs+ZBvya92JRR8UGofvsjOMEyTNpcTJxxLEivNCqtNIXnOqK9kgyaI9hwnkrQ8n9xoHTtzdZ9W++J8XHA1aDuAVRAEB6vS7DhKyCROrm47mYMHzLgi/nL1YcnvBcQkUAydK6xaktAbvLDAb50lyyONebSDFZBkzPG1RodoFBeYewNMOnRWkSCKWwuUGAyc1SLGTzKJhF83GHEhWRf4PH7tHe3fINHrmiSR6K/rBg7n5pxwu3hTtJY8Jtvvrfo0oOQcWrPT6ptT6kvC6Nx2OZK0OGTuqFLXUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9uOzw1oegqFipREb/XeQEr64JRFoI9TD+po4oJ9dtc=;
 b=Glmq6ubwrFp3cuXApZdmFz2ChxFyCbYoIq4FbgWB3xE3i2qB1MrL2gmIWv9B/NtFdvMTcw9ipHNqaLODdAly43wR3Bj1tuXd072FyJtHYwP48gnVVFR2n81WErBcbVAJ54jEULpEm5o8+87Vl5A2neSNVTSPoIxXftoBehmNIjs7LCsPHGxKyEjJ0g43wMA09ICAj0aODMypIZwzqgEOLSYIoXEt0xe2ZYcSAQmVMmtlhAC9RPiTNKzPD2frfVECYeXH1kQ0sOZhKqsSMnw2QadkJVEcrnDWks/ewq2WU1fmppuxEocehtvCtdDqX9WKOGAeoNdHkVnoDpE9MxvqTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9uOzw1oegqFipREb/XeQEr64JRFoI9TD+po4oJ9dtc=;
 b=eTpQGyS1YpnA/5xz9YkKBQyfbbQO5Vs5XeVNrgAfrkXOzMgtNjz/TwfyY99mXly/F2vTVX1Hn0B8WMI/dw2SuPRhV4ZRQzZgztCuzvld+mw4jN+JcdDQkLcRM7llrjhEuCmlKEPJtIlqxXeyG2dG9xh0Wj5my62R/Kfv2FxF2GlVqJPPZhvTjKJM5DMU5XNYiOw0wuPLmS6TZNHbXAje2l7zo9HF1wXHbO7tsyCFGWhSg7kuN0hH0ZpVQvLfTAIFwrK/lyQPZH3tgl59HYzQ5fVzY+siPjaXdBuJSCNpSy3be8FMk76esqMPaTvhEbTrMwbRML2gkF/H/ymH+Pl7Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB9803.eurprd04.prod.outlook.com (2603:10a6:150:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 03:50:21 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:50:21 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, Frank.Li@nxp.com, lumag@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, u.kleine-koenig@baylibre.com,
 francesco@dolcini.it, dmitry.baryshkov@linaro.org
Subject: [PATCH v9 07/19] dt-bindings: interrupt-controller: Add i.MX8qxp
 Display Controller interrupt controller
Date: Mon, 14 Apr 2025 11:50:16 +0800
Message-Id: <20250414035028.1561475-8-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414035028.1561475-1-victor.liu@nxp.com>
References: <20250414035028.1561475-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::29)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fae991c-f802-42d3-77a6-08dd7b077a8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DmLIOKhbiDQeJuiO4MAKFBa79AQMiIJ+caW3ANI13XVTRePzutDLpPexveef?=
 =?us-ascii?Q?rx+KMzYnAJ1B2XJLn37RXO/FyMwtd9e64mVCFPRNl7YpPreGLI8c2cAsSsDZ?=
 =?us-ascii?Q?0N89KiJmPAJe35yCHOj9vGYpSO6KqJOuvXD+SbZIEf7NwqHetqBxDE8AzvXV?=
 =?us-ascii?Q?Q//uqFdEsVNbzp6MeIrx1I6Smxm9mADckrvKc4hkCQ1bEI26J1cPiTXy7ypx?=
 =?us-ascii?Q?2NRREvMkmkIzuBS637FHrwkuOGmUFygRRJIf6fuj1Fdw1yepNgGU5uKa1oBa?=
 =?us-ascii?Q?x6f1Aix+mWrMKLfx0TM8aocghMgUWMiwDt8Of0w3wA8hva4KILp4siybK4yc?=
 =?us-ascii?Q?fMmex0cJp0IidX1DFbvJjjMpgjOerBOat6I3+aaEryISWMIRC3zcznmAZvxq?=
 =?us-ascii?Q?yOlTOkakmfFnmKV/6/PwLA/ksQFexKyA2BHOSPuSEjeuAWc3PoPi2wuBwEXh?=
 =?us-ascii?Q?aeLryMuHibDLcy/V1m8XxxJHolzB7tOc55AsZYZsCzYGklpVwlwoC8UQ9R+d?=
 =?us-ascii?Q?th+2bdu42PSOFjrqmJtLi1eOfg0fU0C5hJK0ISTjP6zP+LxzWu0qlTvqd8k7?=
 =?us-ascii?Q?NFDfvT77Zz4+XXQwo4ItBVfZn7TF1AGt1gnRT7byNqtFfoOoWaDlN6dqV6nq?=
 =?us-ascii?Q?/uPQRcAk0p7yah9rBgDVzrmdxlAkRTcYRNZPzvj9/kPYRApaqQJaoY2Xavrd?=
 =?us-ascii?Q?YzV6cRUYZiI6OoGJlruXR+2fnKqTEL4l3cY1BZOl2AlmeRP5yws/OjFlqO9O?=
 =?us-ascii?Q?lL9+RfYQRqP52lfsczWG5YSAvqV5UoysZJobAOwDkOvRn2lGn8GVnmhSDVSv?=
 =?us-ascii?Q?lHuIGPwy/rbkKrCdY4hhFs5YtZqHaMN1H6PtB/ycuz59VihvgiMJOAc5h5jz?=
 =?us-ascii?Q?NlxjUEOIxrcSDL1ysAf1QNydu3T28bBHAKpZF2gvEEvKPikYBLaL+i7QqX8l?=
 =?us-ascii?Q?T5KVHWyoT+MPWY/gREhp7ycVjzMt7/U34Gh61kCmb4TrZTysGliKwxqVtJrY?=
 =?us-ascii?Q?HA2DQnV1TqCUwBX2fohT1fzhn3BEtV5xSBdMIbtlQjM0au+1SnG+WK5ksB5b?=
 =?us-ascii?Q?zP/wXhhXYFY+yz5CEPJ9SGLrgK63aO41X8XJootE1ZKCvlqxy4pm4ghVeTXR?=
 =?us-ascii?Q?DRGO4a2DdchsuUSg+ZLgTxsckR2dp6tam9FgOxrvFZ3n+zeTkuMnalub8xcV?=
 =?us-ascii?Q?52VogiEcGNT9RDkJ57sQkuWf8JcMbL/UB0xZQu/8Z7lM+cStps2sJi75qu8g?=
 =?us-ascii?Q?WdgC3M9t+ELVcsFsZ6Brb08dVVCp1ldwbzBWBNuWQ9MkXIbosUAbGFbMNCQ4?=
 =?us-ascii?Q?VKlDGWu/WXr4kIcEO8qV315muLllUhKdOpfCKEFWMQ9QhOnpoOOsm3a0N+pU?=
 =?us-ascii?Q?HqBsH8yZhn6UllVVxSmvEBeXsSwkEw4ys/6QNk7OzYF1F4ieSUjJkGNi0696?=
 =?us-ascii?Q?OYuMWSuYN7g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tx96DfcLsY+Xdj7DrciBuz8l3fcg/gDXt+hZtzVt+UGNsfZSMIP8Njm835Q0?=
 =?us-ascii?Q?YMcQ1cuPnVfFfNlWDFz1Ce+n5M6sr3guyqzUjqNGx3URMKHdhmHcHbuBxf/J?=
 =?us-ascii?Q?Tx0KY0KORPr/gE4fJUe4qF+uVXk0MHlQA2yPmbTu2irvAoN/adeQo2LM/s0/?=
 =?us-ascii?Q?fAjLNaHSCaJOh9lsPbB87NWAIMrin/AsUSZWacUhmR8RILu4jVA5IJX++qbo?=
 =?us-ascii?Q?39a+q/i+N1uMU7DmbBKxltN8ml+4ECcgEssUJlB+WbHBqDT0bwQb+c8fmmR1?=
 =?us-ascii?Q?OgDFhUM+b0dk5rqDOWTacsKuCAJF8mTD557uTY54ynogfc5zoQgPm+CgacR8?=
 =?us-ascii?Q?sYL5sJBVy+WD1dyHPN/clObhdjYYUle8N5dYedHHY54XbuixwQOC8SE+6/ww?=
 =?us-ascii?Q?ayWDsTCpycUdySleqtxZdhnt7kqok1PKCqrJHH9z1j2ccCcb9cRP73X0Nytq?=
 =?us-ascii?Q?hxPSPzMKw4G3IQwxKaYxYP2sBUWGZUTNSKXNoy1WtG1nUyx+wXxLTvjEUE0Q?=
 =?us-ascii?Q?nNFR8TRLxayzZ2W4bh74E84OIfPwtkP0+LAFEGadwjZHJ/cfIbnTQr8Y8OxS?=
 =?us-ascii?Q?wN8rwb9efnJ722s39KnPs8WKJFZ8O7TBRoA6pNoXV3bkIOFHaYqC+uDiwJOB?=
 =?us-ascii?Q?wS92r2Dkg35orvY64zNz+m1Varl44I6i6vspcC2keJSxhBYg8KRmd8UfRaT+?=
 =?us-ascii?Q?VlKWtzVTmUrvsjNGXiWKQccTWEabN8Fi6NACeP0S4o/P/9RCHcKbDFkuKXdp?=
 =?us-ascii?Q?Qi2QC+yEPz969fmO42VO3LublJUUr81gE/C0FuqI3JhutqnU/ih44EYlpVCo?=
 =?us-ascii?Q?2SK6gWz8B1OWHGcifUf8DSMu3nrNYTKYnbEhO8nQI7xb4M2jdbwCukEpfsvk?=
 =?us-ascii?Q?y2VSil23G6UTyxKNkuWy4L+FlwMZhy+D1ZlraZiDjcEFyc8/9S8YwWDa6wqH?=
 =?us-ascii?Q?9SKQ5VC2BaXnDGJxPDp0s4VJDa6C/iGH3hjXkikb5mfYayAHUTkMUVHD1sSn?=
 =?us-ascii?Q?Y5Uguxcrfw/zOxxGOflFBhbrlZXDMiuavV5p5TdMf52Rx43B7DYRxpxhOsci?=
 =?us-ascii?Q?5nxMwNnXYJRv5DOWoBnz0rt0KkE7adD2Z+Kx8Vzy2BVhKecX1L+TzwsOrV+V?=
 =?us-ascii?Q?7G8ecbHiGscsa+FVE2bA6n9GASHh6HiquLWPspT2Ldp+iFGi5ACX0S2jVfs4?=
 =?us-ascii?Q?W6D/bCwlJYlSzZGpfMEkZ7Y53novHagWoqTS2RADlZIBgMhTQiwWQDfYKSp8?=
 =?us-ascii?Q?uwtiIGetKnXL/apfEi6pCZab34vgbEK3UwZ3m0+iPP5pwS01rVnU/XFop1la?=
 =?us-ascii?Q?tQQRfVPXHhEN86VpEeu8RKXPy/7yqRxX/GzVcEN/V7iFsDstvVmpAhu1uR1l?=
 =?us-ascii?Q?9Ls7H4cbwAVamHyb/NzXXmoU4AHQzIVQASPgA9yhXsiDUGEw3DjzVxDuXKZK?=
 =?us-ascii?Q?pFB3W8DzW0YtAKv4nnTwZIBpeWPQfTnRcbM1vpT+BUe0NtTZysn9Mj7uS/7r?=
 =?us-ascii?Q?d9Oi4PYNaEyq+hbkqZTcfd+xV/vAF5hWP4rwbkoU5yNFDs8in53g9goqhXpf?=
 =?us-ascii?Q?BGwf2foIhTQpc2KBWDnXlBLjC5C1cIQJTjAjQube?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fae991c-f802-42d3-77a6-08dd7b077a8e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:50:21.1271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62Ej5M+XsB/0WrdknBhjeq5sFgbbd0TVZwU0YKzwXjuDgHmSm9NKVI43sqSkxjDK8pIDFNRHD8CdAoMXXXycoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9803
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
v9:
* No change.

v8:
* No change.

v7:
* No change.

v6:
* No change.

v5:
* No change.

v4:
* No change.

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

