Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E98DAA8765F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 05:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C51D10E45D;
	Mon, 14 Apr 2025 03:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="I6XG+ATH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012060.outbound.protection.outlook.com [52.101.71.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4B510E45B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 03:50:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iI5SPENAfk5/f6CCi5gPikpHwZFLzmzDeiLIn31tSZyw6jN35pYWu6lByWuXXHvDUxTUGLvg8GrlceTwnAjG89XF49Up0vOiA6iVKLePLRRyCVaepLGLZkusZpngpOTOpxSStYjKnIrw/9pnCTBX4cf55PaChYoAHInaGAbgjL1vI7/MhT3eR+TgOPDCEIXDQDA8oZYrXOENIpSVD4BgP8K2QKfmIFFd1HW1AV1E34AYh7Icl0wttZAXcq96gsLLIBRoDU/MNIu0CBiatfo8R7Slfo1lhZ2XqHQUMeab2f4ywWsyohASaAz1Ce6hP6Z1OY5t+/pUpG0k6dSE0BeBMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWfentN1EBY50+4yudctNv8XOktvcmcEHjtdaTlibMo=;
 b=Suyq+pfJueXDn4fwQiRlMxblQy4sn8fjywMk4tLqHaIhoFKQgpNB/vlfNeoxbTqP+KyPhNMCsCHK9L1xYJhu5P42Dm/lVPOoisAWl/qJgxCQ7RdnYp50ZHATzUk+UvxZX9lvboMCBJUHvJbNqqiuY1Zjl1bnNXpS8hqhaDLW+MR1j330Ftjr4arsATEAsQEec8VyUR8DEARVO2Igy1VTLtwT43RPgtpRLlFBT52diZMXe05D2ZUxhSgzzrKiMGxGraiw/fGAQaSwULF43xdLRlFsPiNHoqQgpDQnwLVJQ0NT0RFiDxDWqc0NJPfjYWzVowr/jkPcvn0yvwex9DMEdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWfentN1EBY50+4yudctNv8XOktvcmcEHjtdaTlibMo=;
 b=I6XG+ATHfsqxiHEwcPCo3Nl2YtT1xNacXK8h7WvSou8+fgqfEY5gtRQvRCtood2kYtrTNAwJCAsQifFNC4LatnBoZDnEkQkyVyP9VUKz5JPDaf8Qza9a43+fIH4uMAZdvl9bDT+Ked4rj6uL6LGHdzHz3HmyvZu04u4Uaml41DcxhLD3kumwbc5HueB+DfgLx7QZKQd4lJUjd4LAFqbq1qeuMhOfasBYaEaoYR7J7IimZcbf29n8quuoZaNjcS+yx23vK6EEze9aliOh4mSFPadx0pW23ssQDbpOLrmXvdFdQnu2ghKWZIlp87epxVGtlOiRqOFJdemG45oCgfLwzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB9803.eurprd04.prod.outlook.com (2603:10a6:150:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 03:49:58 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:49:58 +0000
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
Subject: [PATCH v9 04/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller pixel engine
Date: Mon, 14 Apr 2025 11:50:13 +0800
Message-Id: <20250414035028.1561475-5-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 46d3ab5c-8b0f-4aea-f413-08dd7b076cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UeLp+rTBkt/ezdnINhNOCJMhPlhemLbpmAW85wg5a2pUtZLV0pim0bu7pwKT?=
 =?us-ascii?Q?RQgYRnAxc4+prF66UwRSoOC5LUuJWmG/UQdMnjGc2hrmmjM5F+NUoYnU4qYq?=
 =?us-ascii?Q?hF/rDkeDGWxxeOfEUOuy4iNAyGeMXUeBw3KbJ/YQR6ssGViVHLP45ghsLV9u?=
 =?us-ascii?Q?OF00oUII1ZwcEv5jnoC/Z/3ixylw3WKdUSb9B4r1YFT2pnSdAFzShE6d1q8Q?=
 =?us-ascii?Q?iUnXIZ/AyZahgM/8Wstsu7SqZIzlzhYknz3OBMrxWy216jogFYwSPID788mI?=
 =?us-ascii?Q?c+JXH3Bs2LKdVaPB5IjcDeAkDxFk0NiToO6tJa/ps82aeh2tsS6r4EYY5RVQ?=
 =?us-ascii?Q?KtRuMl+jWh2U1oDnk+NO74A6voN00j8ctp2+vnJBHB2e+EzCEyT2GpuOoEOz?=
 =?us-ascii?Q?RmXXE7iJv40ji88NQqardXCAxXFrAWn4vX5lzpiSNZmxCdfUDA3nSbDBcfiJ?=
 =?us-ascii?Q?92/y33N3LxqqdCmx9hWA/biv5HcGPyMGOWKniR96NLZ8D3VeaXo7VlW/o25x?=
 =?us-ascii?Q?gXXNADi5/lriQ4Bn9L4R/7CYvZjCvm3HD45Ftw5xyldvpEYpK/Meod/zggnK?=
 =?us-ascii?Q?gPSLquUk4Yqq6YgD+sybGaE8V12Wij5Coaexj/J86auQYsMe0lVExdZhQF5G?=
 =?us-ascii?Q?oQZF96gzwntrX0D1p6jW7/cVSxgYLZSwKv6WaktHwvj+2PYQ/Qw1WTfENG1t?=
 =?us-ascii?Q?FVdVV8+X/BJE+ffXNYajyTrr/ZMetHAe2JOvjzRIRGNmCzXWboJoz4WyOgkU?=
 =?us-ascii?Q?AaY9hTRIfiv9D8kTMyM/gWsZMKxMXjpCm/1dV1f1ob8s041JXaXzV5r7hY13?=
 =?us-ascii?Q?pVBZCArSK/o9yOubBSUOfoDTLVUTgb14OYgtZq5anYed7lIajq0ES0RJlh0H?=
 =?us-ascii?Q?pZ1fn4AwB4kl/CE4Rl4/TjtjjnV5owo5dG3bKI5HpAyJlgYYY4a+/r+c2nkF?=
 =?us-ascii?Q?hX+aJkZ/V/aScBPxp53FOd80cMZaTS/kQCFPtiBRRhkcNw/UfrTbp3JxBUSz?=
 =?us-ascii?Q?c87F7NSX4RkVn+qfgWngkNodHE/Lg7eN0K5d7VkImQIrHIoecNRF0PslorTy?=
 =?us-ascii?Q?kevNjTzHO+L9KfX7AqvAbtCPAnPbR5FAAdHgirNIeJQXkYkVfiwatOJds8+X?=
 =?us-ascii?Q?zba5adTe6i1PMxmslroTF8i8eol6LyTF0ntNnRp2XmiWngyPc2KbSYI6GX2M?=
 =?us-ascii?Q?+WSgBKkxeusEKrnJ4p9hJizKdetQjTH5UUhIg8LaIlzivWugS/4O66xgATk9?=
 =?us-ascii?Q?aRcOUgcq/TW02Zbxav1CgcH5tEegc+HZvEe+hu6/3RWPI01cEOVIbZG2sNr2?=
 =?us-ascii?Q?klnfXgb/JhJ18P69RZ0sfyiHZTaAJ8u6YAJAJL5aiwa/2yN7JpseJMhksI/P?=
 =?us-ascii?Q?/FcsItJb6v51V7KaW+pDpgKPkcPaWGYtP/32xQzZmGmNgmHixZwNXMZwHxHR?=
 =?us-ascii?Q?+NVtp3auluw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DoTKpqKiQSLN4OHes2Nw6s7V6AQNXKRUOqVq8QuV4eD8owg0FOu89FoeJC0i?=
 =?us-ascii?Q?k/36qZ3Wj0+wfd8Wu/asnsJbDQ5Q5Z0nq3Uum6A7dnlaODWKT+WdPXyRYMLM?=
 =?us-ascii?Q?HJ95oU3Szl8qNE0hGBplhgzOlXtxsfNonHQRoQu7Apjspc6pli+1htRZD+Ug?=
 =?us-ascii?Q?4J6/hdGxCL3ov/9HtGsEBOWN7TMsmw74oKHExI5mW2diOd3riVBS3rJH70L8?=
 =?us-ascii?Q?9jPWHTvVufLgOe27h26E/L42gOcpGM5BRGGxw1pKvLdypc5eYNoSbVhuA3Nf?=
 =?us-ascii?Q?61lIX0MNJJVwm/vs9j8PJWgE56NwczX3Xl6Bk11FURbB9V808RB7yx0jG67J?=
 =?us-ascii?Q?8C6D1V0eDq4iZB3n24XPvXJ9xe+eAaCZ7a/LP8DdH/7jd6mukPt/QErfHIzN?=
 =?us-ascii?Q?EoUmnQlA5F+INnN1O/XCxgl8IoBSevchKqQgkaQ+nSvXk/xAzG1JhedGd5TV?=
 =?us-ascii?Q?AFGdlSoL/0pl1hVs3JSZlbM75TVm5PnmaH/qXlrn9qv5gpctSZVSUzGzz1r6?=
 =?us-ascii?Q?CQHuy3PYqQ3PKTkMa4N9I2jCeAT2aIwv/aCnahwGEvxv2tgbjbNd8CjSRE9t?=
 =?us-ascii?Q?NrCWm3dwZ7lPHze4NDvSvPSwgxXjD5J+lQTINo8fXhhPFgUyYXNUW/bxQTSM?=
 =?us-ascii?Q?1EevW/3X7zh50CofdHIu1X4/P1yR+2HlkiWkdzn6EvPqcsxPcvG7LGKOapYS?=
 =?us-ascii?Q?WNimVId3j7i/0uxsSIIWfg+lVooWC+dlgGpI2LPR72CFcgQTDOC/xTevmP2/?=
 =?us-ascii?Q?9OrVicB4Rf3UD1pKEZwtDd2EZwIeRINaIZtmpQ9eA1ijf7uEcZo/GF7NhUd5?=
 =?us-ascii?Q?XCN6ltA48/GXTsZtXf2sG0jkZGcbYcvH2Kxij3DN+W0daiyGrTNt7uhj49aI?=
 =?us-ascii?Q?9UYibCcxSEjxhZi5UNSsfGXk3mm5PXfRq7YErkdLaBYGPeJtR4faxzHhU3Ot?=
 =?us-ascii?Q?c8gV+xpAKuR7A/ZNqMuot+2syS7BUUHpdp2JvawI7vIHfyPsbvHZBpRe/uFf?=
 =?us-ascii?Q?DfwsytNUIddvxRmbwGiV7VLpO2+4AxSqb29m9IwraXx1bKl0Rvd8Wzyk18us?=
 =?us-ascii?Q?ckdIwx0U8RpfKRNxzGxSrMRqYX4AyHLiXphJg3Mq8ZemItg8b4WXm3Hhv/A1?=
 =?us-ascii?Q?MSWMmLE17l5/BxjtBBAKwQDanP4sr8Px89rNumVPel4RYJFdpGr/Rk4RhMDJ?=
 =?us-ascii?Q?v5zZegQFB1YV7pBWhy4s9HPnnNOLtCqeBlan1VW1O0eM6UXHX5fjZh0VOcAU?=
 =?us-ascii?Q?jLZ4ZugrgO4jFMCUZPMz/XCnNehCEWu8XuvI0ZlJ7Lrzrh0KCaRjD1k147zo?=
 =?us-ascii?Q?N4hScs+h7NCj4F2zHyAnS5FJgr7ASFou11eBLIWXlsrwuLODR0wOHS3mNWoJ?=
 =?us-ascii?Q?gzJEuK1zdaVGJWi9PcR+aK+p0/oCTF/gAR247ybRjVCtECqtxlEXgXGzRmy/?=
 =?us-ascii?Q?qfl8+6Ku65rtPrXuMQUVvg7EKCuWtaKkt7XRNq5ALHdG3KeH6nD8GzgLUTQ3?=
 =?us-ascii?Q?rqyWRrSVoH90CHZAgeT3uAEZ9UUHFXT0DaXEeSeqEyI61kh9ox3eonBP652R?=
 =?us-ascii?Q?/RILQSEo8SFKKjkTXciQZ0/FoccHyEmCCUL2F+It?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d3ab5c-8b0f-4aea-f413-08dd7b076cc8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:49:58.0480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qK/UutmLFSFutlPHnpA5LaPhQ55Svb1h/B0ZDfUGJO0uvtuIDfhlkZG8O8qTr/qfRTBt4ISLjJaD3kDy/xOCWA==
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

i.MX8qxp Display Controller pixel engine consists of all processing units
that operate in the AXI bus clock domain.  Command sequencer and interrupt
controller of the Display Controller work with AXI bus clock, but they are
not in pixel engine.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v9:
* No change.

v8:
* Drop instance numbers from compatible strings. This means switching back to
  the patch in v4. So, add Rob's previous R-b tag back. (Dmitry)

v7:
* Add instance numbers to pixel engine internal devices' compatible strings.
  (Rob)
* Drop Rob's R-b tag.

v6:
* No change.

v5:
* No change.

v4:
* Collect Rob's R-b tag.

v3:
* No change.

v2:
* Drop fsl,dc-*-id DT properties from example. (Krzysztof)
* Fix register range sizes in example.

 .../imx/fsl,imx8qxp-dc-pixel-engine.yaml      | 250 ++++++++++++++++++
 1 file changed, 250 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
new file mode 100644
index 000000000000..633443a6cc38
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
@@ -0,0 +1,250 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Pixel Engine
+
+description:
+  All Processing Units that operate in the AXI bus clock domain. Pixel
+  pipelines have the ability to stall when a destination is busy. Implements
+  all communication to memory resources and most of the image processing
+  functions. Interconnection of Processing Units is re-configurable.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-pixel-engine
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^blit-engine@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-blit-engine
+
+  "^constframe@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-constframe
+
+  "^extdst@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-extdst
+
+  "^fetchdecode@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetchdecode
+
+  "^fetcheco@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetcheco
+
+  "^fetchlayer@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetchlayer
+
+  "^fetchwarp@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetchwarp
+
+  "^hscaler@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-hscaler
+
+  "^layerblend@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-layerblend
+
+  "^matrix@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-matrix
+
+  "^safety@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-safety
+
+  "^vscaler@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-vscaler
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+
+    pixel-engine@56180800 {
+        compatible = "fsl,imx8qxp-dc-pixel-engine";
+        reg = <0x56180800 0xac00>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        constframe@56180960 {
+            compatible = "fsl,imx8qxp-dc-constframe";
+            reg = <0x56180960 0xc>, <0x56184400 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        extdst@56180980 {
+            compatible = "fsl,imx8qxp-dc-extdst";
+            reg = <0x56180980 0x1c>, <0x56184800 0x28>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <3>, <4>, <5>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        };
+
+        constframe@561809a0 {
+            compatible = "fsl,imx8qxp-dc-constframe";
+            reg = <0x561809a0 0xc>, <0x56184c00 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        extdst@561809c0 {
+            compatible = "fsl,imx8qxp-dc-extdst";
+            reg = <0x561809c0 0x1c>, <0x56185000 0x28>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <6>, <7>, <8>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        };
+
+        constframe@561809e0 {
+            compatible = "fsl,imx8qxp-dc-constframe";
+            reg = <0x561809e0 0xc>, <0x56185400 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        extdst@56180a00 {
+            compatible = "fsl,imx8qxp-dc-extdst";
+            reg = <0x56180a00 0x1c>, <0x56185800 0x28>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <9>, <10>, <11>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        };
+
+        constframe@56180a20 {
+            compatible = "fsl,imx8qxp-dc-constframe";
+            reg = <0x56180a20 0xc>, <0x56185c00 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        extdst@56180a40 {
+            compatible = "fsl,imx8qxp-dc-extdst";
+            reg = <0x56180a40 0x1c>, <0x56186000 0x28>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <12>, <13>, <14>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        };
+
+        fetchwarp@56180a60 {
+            compatible = "fsl,imx8qxp-dc-fetchwarp";
+            reg = <0x56180a60 0x10>, <0x56186400 0x190>;
+            reg-names = "pec", "cfg";
+        };
+
+        fetchlayer@56180ac0 {
+            compatible = "fsl,imx8qxp-dc-fetchlayer";
+            reg = <0x56180ac0 0xc>, <0x56188400 0x404>;
+            reg-names = "pec", "cfg";
+        };
+
+        layerblend@56180ba0 {
+            compatible = "fsl,imx8qxp-dc-layerblend";
+            reg = <0x56180ba0 0x10>, <0x5618a400 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        layerblend@56180bc0 {
+            compatible = "fsl,imx8qxp-dc-layerblend";
+            reg = <0x56180bc0 0x10>, <0x5618a800 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        layerblend@56180be0 {
+            compatible = "fsl,imx8qxp-dc-layerblend";
+            reg = <0x56180be0 0x10>, <0x5618ac00 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        layerblend@56180c00 {
+            compatible = "fsl,imx8qxp-dc-layerblend";
+            reg = <0x56180c00 0x10>, <0x5618b000 0x20>;
+            reg-names = "pec", "cfg";
+        };
+    };
-- 
2.34.1

