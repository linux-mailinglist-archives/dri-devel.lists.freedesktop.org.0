Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D47A8765A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 05:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF1D10E456;
	Mon, 14 Apr 2025 03:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="d7HWVYm/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010059.outbound.protection.outlook.com [52.101.69.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2280210E456
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 03:49:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dcBWGd3RRyvkGqIgmPD/DDa7rjG5a+AtVhph2Jajm1qcCLVfHoi0zpxoBNnLlwpsMHBbl/Zr6kxrlLmnozcFp9GHmIOv2PhsH9W0npAo06sWWrcnT7gJkoBIsunfA+OmhTDmPHgeA4u6fvwnmN/ddFDcN1D9NveGh1eCp8b7XkRS2C7gJJrpy89+H8Yv8OZxOcvUQiDW5AfP2SUzvJpD3cUDB3EdeYHRwbWfkYuA+fi78LOVX8DyhggzWfX5tyxLoOR2tB6G2cwIBJ8aUP0fdHmKCINfZzPFXz8yoU25VBtobG5KT+B73lASf8eZGVg1nXTRrNl1ErX9XmSglywvRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRQbKnC2QTmoYTPDqaDzOYduUC4mbO160svvHKS0aB0=;
 b=MgKE9fzm8qkWchEj6AlNw0BYLdGO1464fDgaGkGLmC6BLsvgPkLZsn3G6BZjQ0TM77a/A/74dhQfbhLstW9TLIn2evn2JwRwim2S5zzoXoq2rTlLSFvKTDdIpTONDYXsdZIPbuBVnCBmHYKgCeoBNpwqnHsnYkgT2Bj8VvhEqK12+d0fnEh5LxSH9nn+ZwmyKSxlc5LYwMXagJrt3pga4bxUOQaJytnEpz7YNKyZmUJfzQsleNvMS/cOY1I4x5NjnkFnZdIR/JYHKjEeZw/r1+5Y4EFil7gIJKwGHydIhUkN1DWsDMul1xQypCbG7avtmAMU4Dmz+7zI78KNv6jJDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRQbKnC2QTmoYTPDqaDzOYduUC4mbO160svvHKS0aB0=;
 b=d7HWVYm/NdIYrtQiet3ifgyS76NBTtwdih6Euk1KbEbgVO7cBP0PgPhu0B9xOT9nNbNZN5ck4+LD7Sx58tXVLj3M/HjOGkNDZutkQRzFtzhq1dI2aHAA34LloTfl7PIxB/ga0pp1L38eyfuAMIvpw0TELfThA2pn5nFmQ7MDCFU4YwwJiVTI5CA7vZOm5wGgWAgf95SIeO5UzyPIvuWOCYM7EGh5s9LO1PCmivHwvdXp4ftyd63T5eKPOa3fp5apxrpXBkDVJXyILnWMXhSlFaMxLL1MM+rLS14Y8enXXQ3fEeKDlF/05NN/fxg1zPilTm0v2hlzr7Wiy6eqNchWLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB9803.eurprd04.prod.outlook.com (2603:10a6:150:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 03:49:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:49:50 +0000
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
Subject: [PATCH v9 03/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller display engine
Date: Mon, 14 Apr 2025 11:50:12 +0800
Message-Id: <20250414035028.1561475-4-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 41585c9d-bfce-481d-0286-08dd7b076844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SJyvWw9peiFvVG0bA8bUE4/G017BTjcR5S2p9hrvp11EXDKeb5mJ6bPOP4ky?=
 =?us-ascii?Q?LIyBBxfDEVRz12kFKe0+yGQ9MiO+JnLw2guTsn1Xny1oVmBGsAayNe17WcXG?=
 =?us-ascii?Q?1d+GeFnmakwjd4BhmwcOrmlH/fxA3l99Eaw4l+pxP1v3bnwKHuEUKQXCOkEF?=
 =?us-ascii?Q?qThrtOHjrkUIq4wjC6x08f0VeMrFkCdBALKl/bupwAKCGqqAq+mXURAJqnaF?=
 =?us-ascii?Q?dFL8CQPg4GxouzMBzuOCqjCVeGNQ7jQcxUAs7YT6y9t2u/VaUFzFjGorpN+V?=
 =?us-ascii?Q?dAc9MQk7J4rYonTdrnOEf7IsMA2E9Un3j5sbp7ogWrmCerUDi/fQpFw/0iqR?=
 =?us-ascii?Q?CmyULNoWa+RWGUof7UXHxvjYJqqg+xXxBBnQkKXcrUeto/7AzqWsNjn7Eqb7?=
 =?us-ascii?Q?P65gR9eV/zfCQXT7av8gCDOUd90lyOxQJvC8TBpdfQYZi9SC35ELMREoy0Ab?=
 =?us-ascii?Q?aNDIiQSwpKPzcNabbv08G5tWhT+G5xEj4my96py0Q3SRyyRGRgsrs5GGcgI+?=
 =?us-ascii?Q?O2n34mPzY8aIpCJuR+5d2t463+dHqtpcwiHEevT44sbS6Nkv3gHFEbN5nMeq?=
 =?us-ascii?Q?G66nN20BVM1z5Lmv1EY1ka8TAC+hL364skTWqO5nA2mnToBqG8sUC4mLekd9?=
 =?us-ascii?Q?0CrNuhdrwsXKqBEzedU3bE/a58U/XQC+xD5Jk1vzDW38cmIXqyDbTDBRGi/D?=
 =?us-ascii?Q?HKTa/k8Lt1d4mtlKtEZgt5sRaFpee35cnvk4aL7e6QyuoQCZGxr50+Mu9OP8?=
 =?us-ascii?Q?otEeGLnyRHsUOBkd9J2pWj55naBrc2INBiYtHAtOghrPnt2R/74PLuKQtpFL?=
 =?us-ascii?Q?NDYluCTQWH9xeqKoujT85Jl/jBHYApkwOmeitS49lklgUWzYZTz464nIQBZh?=
 =?us-ascii?Q?zkwwP1XuAGFSP1WZNk6Kca4s1JdNqeius5Xzw29goeB3hXowLjfewpJVrUoN?=
 =?us-ascii?Q?iAVM2bf+EAwf/Ive+9mHExmHYgi1hnLj2WQ33JyDLLQLSyVlLvZXM/J3q+u1?=
 =?us-ascii?Q?FEFGnCyHNzcToVHKYuKUuY+PTSO3U9VxbKxAuBRrUAE1L7JTVc44w872NX9I?=
 =?us-ascii?Q?JTHSAGnBvZGsHm+FUPXsbS/6qzFK+UZKtg/U1VWHI49e+dpP1ai3Jc8X7T7Q?=
 =?us-ascii?Q?xE2gX6Fg9u2Rs75TyUJH4wEO4JXAayMyCO70E/tqnljQHK81VBroptGSViVo?=
 =?us-ascii?Q?c6kWGexp6QKFrEAhL+8FhbGM3rS4JZIPyPXW2H5iMcUv4FHEHlPVhM2OKc4e?=
 =?us-ascii?Q?MnPApZ/QKd4/z7FEdNY4tXiPR1gR6vsnZnk/lAZfI2r09ZJJ4R0Wv0WfeOJY?=
 =?us-ascii?Q?V3TgJ3LAqRfQn+AiQobxgzzNdxm+deBd7WgRzQnilTUZH3HOfw/uUTQ8MTWO?=
 =?us-ascii?Q?GUOJ7p9EVj8IKLEjc2Jfw6G5km8EdbmIE47GmcoycYUwvC4XwCCkfoCrtSPD?=
 =?us-ascii?Q?srTkgfrwY7A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RuMG+NdvrS21245MBZf2OaO0NN9bl7gnt4VI9zrxZkXfFdvOZumrn0yskN1j?=
 =?us-ascii?Q?Ib+wvp5eMO9Dym/sg6Iht/nF1vOAm2UQoif3n8nsoFeWxWZ5+7poTHq31w4w?=
 =?us-ascii?Q?c+1XK8iHltodcMoGFmyY96E3dwTobP7PVxi0s/c+i2YtnqqcH4J6lBHxGcsN?=
 =?us-ascii?Q?NaAd+4hqtnt6ttPKEVynJyHBmvu6U9Ce5hntJCUBoq3ldUtJcYk7H2UVObxd?=
 =?us-ascii?Q?sm5uzcsf9zKcMNPaQ+65G/YZTtW1G5Ph+QT3bjX4uzVYQAr1hJZdxOJw6KEC?=
 =?us-ascii?Q?49tmm2bA5JSjbliAFvxAGS1kQ82N1eFHve5e4iDXCr/aQBqQHtJ84rBxT3jx?=
 =?us-ascii?Q?o+alrkE+EZgYUIVb1Z6eflVbneGnLdHTrpvFAtQ2+vCwdrWSLGyuOVsNAohO?=
 =?us-ascii?Q?YWcq6WTkszeSdbAxF3sEZAoM5deKSNRVorwwclE46108d9jvbyiDPwjDnuQM?=
 =?us-ascii?Q?TwyTgqJ3etOj5PCZL6zpm34MNGycbJgUb6vRjxOt8GkN/acxQ00nykpslqv6?=
 =?us-ascii?Q?2aWQlcNX5z0yZDN3k+EU5WVrnVR17J4vSStb0OtkeFuUFk3WTS15VLLlE0zo?=
 =?us-ascii?Q?YPI0gF4rO1pj1rsm9Yh8x6tBgJWJjNooWxiWcQUh+np1NcDI2nI3T4YLj8b0?=
 =?us-ascii?Q?ZxZOlepojc5x6tQ+OviOXxJ1QRUebuu2yZ7W/fqBcdQ+10S+VXC+biaPqbZv?=
 =?us-ascii?Q?4WcXn5WpchM1Uq9q0W4KlMBuX+X93HuzKLmtPkr/4Puj+BBness8zDOb0EYk?=
 =?us-ascii?Q?5nYxcp1PQOnXfDy52Adux0EpGcYV3LYSnsZeCh3/zJSGYAUlPUZiBn4dDC5F?=
 =?us-ascii?Q?tLP9aLUcGyBfeXIZioVd1v80l8eLs0xy7PENG/XOfXIOt61+PXMY7yMAAIme?=
 =?us-ascii?Q?eV5W4CIy7Jk0CgBhaTLUjdcqtHJR+d9oVltxdrhYcFeyBgxw8tDJMDmIAdNr?=
 =?us-ascii?Q?ZRkeLtNB4Ynq1LFNrBGHRdtv3UMtkAvgEdDTAv6i6fsrOCW85yXvfd+OT9s7?=
 =?us-ascii?Q?aWazXZDyB3/C2VdoVo0wE+Fx7zPVyuq26N1tyvWNpGUNP5dvDvY0Wu3o6kEs?=
 =?us-ascii?Q?ojEAarlJlm2UV9rlBzhBuRow3bgDXeLbow2Bi9Mv9fnd+LVlaeobIasD201C?=
 =?us-ascii?Q?UO8FotXp9OWTtXXuZjxwUmgSC1kSL5tmjjA29SSqqAaRdqq9/Wprk+6TPvaC?=
 =?us-ascii?Q?rLS7iWzu5oY/F9YHAmwkf3YiOy95Cg+AwL+NWOpZyWBpUV9WUCErLtuJBPRn?=
 =?us-ascii?Q?GQD2H4ZAQcI/rhpsXGyR4eNr8tgl8NsKnY0w0DIKgHeNWiqU4JFSDIjO1ywv?=
 =?us-ascii?Q?JLfqKOkh2K6UaeHgRsJb0nLumIkW4iwtGs1OozXBOM9mioVmzeGauf0+i1Es?=
 =?us-ascii?Q?LszaAr1V+ol7rv9sKEsdovWt1r1nPI+rQ9A4Km83D1Wl+Ulq0M5Wk8gUsr2W?=
 =?us-ascii?Q?6mvQP28ZUIIoqTY2vRQbTm+oecbp+1REAS/rwlS7PJlJ69JXlUVmOMFiCTW5?=
 =?us-ascii?Q?L7Ivi+NYKfVPdHDsdAobVPYsTmS2kRJs6GmUYz+ByVWtWC+HvjSMqhBin3ES?=
 =?us-ascii?Q?RU1IWzrsqowp96xBwr9/NzW4J8XVWY0Vw7YFCZOu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41585c9d-bfce-481d-0286-08dd7b076844
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:49:50.2454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kb82XTVTvTsvFdGdkOw5hjkIxmh1xrpifh1W3ClWeK3OoroZeo1/xf6nVkNquPAUz4Co2LUfBaVEAanNSoGVOg==
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

i.MX8qxp Display Controller display engine consists of all processing units
that operate in a display clock domain.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v9:
* No change.

v8:
* Drop instance numbers from compatible strings. This means switching back to
  the patch in v4. So, add Rob's previous R-b tag back. (Dmitry)

v7:
* Drop DT alias documentations and add instance numbers to compatible strings.
  (Rob)

v6:
* No change.

v5:
* Document aliases.  Drop Rob's previous R-b tag. (Maxime)

v4:
* Collect Rob's R-b tag.

v3:
* No change.

v2:
* Drop fsl,dc-*-id DT properties. (Krzysztof)
* Drop port property. (Krzysztof)
* Fix register range sizes in example.

 .../imx/fsl,imx8qxp-dc-display-engine.yaml    | 152 ++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
new file mode 100644
index 000000000000..91f3bb77d8d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-display-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Display Engine
+
+description:
+  All Processing Units that operate in a display clock domain. Pixel pipeline
+  is driven by a video timing and cannot be stalled. Implements all display
+  specific processing.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-display-engine
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: top
+      - const: cfg
+
+  resets:
+    maxItems: 1
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
+  power-domains:
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
+  "^dither@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-dither
+
+  "^framegen@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-framegen
+
+  "^gammacor@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-gammacor
+
+  "^matrix@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-matrix
+
+  "^signature@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-signature
+
+  "^tcon@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-tcon
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    display-engine@5618b400 {
+        compatible = "fsl,imx8qxp-dc-display-engine";
+        reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
+        reg-names = "top", "cfg";
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <15>, <16>, <17>;
+        interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        framegen@5618b800 {
+            compatible = "fsl,imx8qxp-dc-framegen";
+            reg = <0x5618b800 0x98>;
+            clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <18>, <19>, <20>, <21>, <41>, <42>, <43>, <44>;
+            interrupt-names = "int0", "int1", "int2", "int3",
+                              "primsync_on", "primsync_off",
+                              "secsync_on", "secsync_off";
+        };
+
+        tcon@5618c800 {
+            compatible = "fsl,imx8qxp-dc-tcon";
+            reg = <0x5618c800 0x588>;
+
+            port {
+                dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
+                    remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
+                };
+            };
+        };
+    };
-- 
2.34.1

