Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30EB9E89BA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 04:40:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491D210E453;
	Mon,  9 Dec 2024 03:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="kPmdAYYj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3900510E294
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 03:40:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pt4MXG2VHWQz3IKY3dxhQJ1pA9BBiaM691aczz8lBK+UzEyM4sxsnnmetfbMiNdB4bVS5q8oX3jMcgHXpuPJh7ECrBUfzznHggLq8EPZfczrj3MkNPSKGMUJ/KkRfdsXKI81vmcdnHp+fnQFfBppPE+fSa1eJ5CxYDGjLeFTQyInwZuH8zXpDn4a56vyJ1gSxMJXVjrF4vVBxuBuJd7UjuBmq2KsA2+pwtK62wK2PrNiNkC/K/dUMnLfh1xD0nHOAmW5QytrP8rKXz/wT+KkSNwwdDv5UchCIDniXax9Mh7pK/uwFt1Q3SmvAOyt1/iPMsPL7uZZm6qnUW022UxGkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4Fs8JMMLB26AzSNA7B2loGfZmags3f8h+j1Q0c74JM=;
 b=DZ5bP7tqlCy9bFsyBsykOmFHHz2YS07GYL+cZx81tm7zViuJDDDxuhhzrAZwgdknUXVV1p9PDc1b8VPSV0IZOaiG1m2vTNRkzxlvV+Sn96jcBYhhAJmT58K6efyU8uP7xaGLLGmcO1w8McwXTQzAmi90bGJDHCRhwuvQ8NmGAmawWhD0R5+hDpC3tdRtHnXT+Hcw1BhEKP4vVBNfAwdaY8eXcILs3IWCRxHrqRtalTLZSvtcTv4Tt9peOBGpKNgXGvUPRyNsASEgxzWuxDkEztr49IabgJpvAmz3Kjcw2UacKvCMHLs4D36Mh5uBbVGz7Vx2LGc86JQk70ZBEG2dPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4Fs8JMMLB26AzSNA7B2loGfZmags3f8h+j1Q0c74JM=;
 b=kPmdAYYjan4azSAqw+9tl6nwIYzILNnIhD+/2KiYnX1c16PmwjiPiS/1YVqayuNxz56UkCyK5bHwaeSVtD2jBm5DqLS8AMHB0XJSe9Og+vBdhVuVwPamqwVfNNWkPklDM7skXuSNDa2A1CdItrR5cnGttzxQHIasxAXkT2Up523bxGmc5SdWkCoXm7G+U8Fkeeeq9707A2CHSkDrkGWym1WCalWE4db/F79yAk575TYpNKgjp4GyUG7/DSr28XCnS8ouw8G05vIoqZ8HZNyDSVabIjrhoh+WMvq20veL0xTVv7P6Hh+dbSh9y0ue7kEtU5V6kehfcNkWtsDg02N66Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10212.eurprd04.prod.outlook.com (2603:10a6:800:243::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 03:39:59 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 03:39:59 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com, dmitry.baryshkov@linaro.org,
 u.kleine-koenig@baylibre.com
Subject: [PATCH v6 03/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller display engine
Date: Mon,  9 Dec 2024 11:39:07 +0800
Message-Id: <20241209033923.3009629-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209033923.3009629-1-victor.liu@nxp.com>
References: <20241209033923.3009629-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::18)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10212:EE_
X-MS-Office365-Filtering-Correlation-Id: 7738d13a-ebe8-4208-874e-08dd180327f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IxhUPpBdIucBfKzptEaF9n9+G7y1DX4+onXXt9EI4Od9UUUOJjQoS5YXzzl2?=
 =?us-ascii?Q?WOV/Qy/LP9J2TVnVaUwXGvAp9Qb/rwo3divAXnNKylevc3HWUt8/DSHjKm/r?=
 =?us-ascii?Q?I8VfRKiVsW4B4i0pXk8pCI/Lwj9T0JtyzTbDX4Mgo4nTWy0xPLey75DzDVAz?=
 =?us-ascii?Q?mmKe6oksYBW7tjDJuwYq0ecSS2FW2w7IfOPzaEQ/mFuiPTLiWkR90k4H46Cb?=
 =?us-ascii?Q?HFwmM8AoyySh/l4fLGMpRWZht1oqgezgSdpqwI8Vz7/VtvCTyCgkY76AqF93?=
 =?us-ascii?Q?GKVfa3wIpMybKSGNjZCqWHv/MdA9FY1QcvAYvVXJHpAB27pyTOeSPArKw1KV?=
 =?us-ascii?Q?jhdh0RHFCHOovb8BbNe+Mcfpp7poGhg+dZgm/KF3VcAFKvDWnfQ3yuCrnZcs?=
 =?us-ascii?Q?NJ/umt5bL8KCKPPLOzuPDpm9TFyasJjL9V/H0TTJKoMKK80Vo3w65FPLo7gN?=
 =?us-ascii?Q?KgYTRM8qk4+8Sp3eyS1QIcUbIyl8Gyx0rWx5/mflJOuyXswSPHNa6POtG61/?=
 =?us-ascii?Q?7A2jiW9XlON2mCktzFPhcPZDkDaYZSOm3tPOiTVRXfB8qd6f1VMlc8BWP4Ft?=
 =?us-ascii?Q?SGrqiAYO8uJLLSrlONm7mgLwkDR+YhjE4Dgaxjst5YuNIv4KsoM6taF6DinT?=
 =?us-ascii?Q?D6PFl5SWx+pxG2sysuRIPWXY5c6jPhfXjL5KlumBIe1nxYNeyZzVgaaOm12b?=
 =?us-ascii?Q?VlM7yvosvi9HC/q3+6GxMQSE4e/XgCpl6TaFgOGREURFTLBIcOTIhTeHKRHi?=
 =?us-ascii?Q?4EYcl+AYZddAs2N+3uqHxHxOFpBg6o3acbsaWTwQNnSYVOs3pItb3+mPmhL3?=
 =?us-ascii?Q?p4br3b1b6kPODlBEmsOYGOxpY1p5hTPESR1g8Thw05qzRlR5V3CMvYHuEibk?=
 =?us-ascii?Q?lwwmIfeF33MiZMPsMnEIRSBWTqPMlqP+PFK3uR783znWHf5vfoxNP27PNMvE?=
 =?us-ascii?Q?y3wsvENbMW95KvRI6Y7Mi8fvOUlBtqK7oawwtiKCQkbhsP25eqAaUJPrpbUx?=
 =?us-ascii?Q?/YmbbQy+5ffG3dJ/Hqp81Hup7nXAS+up/O7qYgDlId+S4Mucn4+4FkfBHY8U?=
 =?us-ascii?Q?suxcrEeilZTPdKj8AuTrRedFs66zr6NCvq9kS4vC4ahCqWR7kPPJ6maojMwN?=
 =?us-ascii?Q?7DBORN9Rro3QM9Iyv3aczyJz9GQcXKMpF+gFvk9Omw8ri2fG/pfoAQ3he3JT?=
 =?us-ascii?Q?Ce4EGSoHmhGz2c1+3Gw6ynn2wwEjK1IagrgVduNM+LyYIVwtJIiHEzZEnkQg?=
 =?us-ascii?Q?Dn7i5yvzbXKPO7tYuQsN9XmBWN3yKNJsaJT9g4mJkPz89j5THkSFsCqVzAhp?=
 =?us-ascii?Q?cj1x/hX9oQcvweKn443grmAiaDyhOiZqAa3YW9OWHdfwDBVzH9jUnwXedPTJ?=
 =?us-ascii?Q?2OIVizA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9zWkMsyAyPn1iCkpkC/xYkJGe2z6CrtoJo5ZsWin3b/xBcG7UDYEumb2Baxj?=
 =?us-ascii?Q?fwOUw+3/AxBs6qRfzr3XwPjSQhSyXIDSgXCBRLeV9LGnoXamvlYw2awAvUYp?=
 =?us-ascii?Q?5mNv9D2BrNqaI4iRL9RC3x13G9p0CMOjr3JqGnjM8XtbNGzXGkABE+u03+el?=
 =?us-ascii?Q?Q49yuRCymVFe0VtixqBJ2xnyi8Zt3+ri6e7iAsI0L7yQWuRVzuhXevDJi5Ai?=
 =?us-ascii?Q?KhDVQOwRaMytv/gx5JojUTkv+vZqu8x66BEVZDK8eWMrSt9ZQ8ZphD17/cPF?=
 =?us-ascii?Q?YIxKGKV576ABGz+ImnbpKNUplMG2eNJ2Bqe2mCBrd2HSL8TOFIWt9+DIEWKO?=
 =?us-ascii?Q?r+JjUwgy2X2ZE2x1DiniU+0lKe6SaWTVj2uh4a5tMA4wOXRaFheUGSo+RqbP?=
 =?us-ascii?Q?CcyNPQQ6N2WhQMGBxC+ytt7oeZwWpCB/guWjsPmcktjFFJS64vQXGnjhh7TG?=
 =?us-ascii?Q?9t0a8y4JUh9h/LwCTn10llhBxefLxpm7V9gveNmh/M5dwLLSUJ99qpCLHguv?=
 =?us-ascii?Q?omiCv9eeV6PXZN/VU0fevgtPZI+lr7xLKuXTmjcv1PyvLFygSzXS81ASsF3n?=
 =?us-ascii?Q?nNRQ7mSFN60/CLhqhOIJGv4xfEd4vAJrSv0CbFU1S4WOPn0veL20iDqxcrbL?=
 =?us-ascii?Q?0sGeKt8Ma2G17Y0y6JBy5SzINwsTV8pTFThHSUHnC06WvayexyydNjH8TRNe?=
 =?us-ascii?Q?S+pwJfqrkEk22I0ILutXg4V9hocHjIvGsP17BlrPpdMer6oAEuFM8bO/Vg+y?=
 =?us-ascii?Q?WVi7k+elpNsxK9aojZeHo2bblDY/xLQXBQjzfmNQ/rUUday4tJ5FeBi4o9eq?=
 =?us-ascii?Q?J0K0n1sK1sPvIK4sS9roy7zYhvOtgWNOlezFn9BPKjju6UWWjHeudm5SLc35?=
 =?us-ascii?Q?hi6Rojbkxw8h4TWKaYWLZl5VWR1iOQOZbnJ+Lq5RwDEgQM0WEdG4mqDRuxb0?=
 =?us-ascii?Q?orV2MtMrGvdXW3vgZg4thAykPV84UbSUzRkzp6mJ6W9An18uRZv6cAFIxbrA?=
 =?us-ascii?Q?XNn4Ld7AdH/Nf9/vFMxRZRv13OZdBugjRc/0gDYz+QYReZOYng6auhGBWhG7?=
 =?us-ascii?Q?n5jX4a4ZnHpAmvDYFuLOqe7D+GxXLYla6qFWfM2U2M/7w42DfpO0eJcIKF2z?=
 =?us-ascii?Q?Eu50SewmTPBSFr4BcajQruV4bbENYymEZiTPGfsKPAQRaAkTgNqqHy3SRmqw?=
 =?us-ascii?Q?m9xlT5pHgrdNsRlMxCNoCfeNHhOXH2vD5ihQFnJdyTpANJsM7qt6A57EmP9d?=
 =?us-ascii?Q?rdKdenp8KIBK01d/ljO7ZwRZd85EISH0PtvsTNW0hFbC1NTUGJEa8nlmrHwg?=
 =?us-ascii?Q?Tm9ptxAqMPsgoCPYRjtViWc0z9q4+XZJwxTM05620JLC9MHhePg/thdPX1Oz?=
 =?us-ascii?Q?OWoZvM8cUeWXW+Fq6CFNKRRwnXERyDO84yzb9EOhVe+WlJFWtr90cHsVph89?=
 =?us-ascii?Q?hOC/eaJJRglTYfZnuy1Ci15N3knXHcjdmsIWBViIsdczXY5YuBuXNqPGWm+5?=
 =?us-ascii?Q?kfzLYhVT5sFK4A8x1IEmQn+AxGUvvDmZo2pR2N6Hg2Y0LddgeQKk1vYL6Jhj?=
 =?us-ascii?Q?d8zERA7EYONRUxFGx38cJdlEyq9EqL/ojvmE2HQU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7738d13a-ebe8-4208-874e-08dd180327f7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 03:39:59.3049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oO6ORGj6rUIcWhC0l5oMZa+Bj7ttBBqbp3ZgzQeQ4RUyalRo5tSUJLRmw83XJoI8HZ4xpyIUhT0yZljz/MOL7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10212
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
---
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

 .../imx/fsl,imx8qxp-dc-display-engine.yaml    | 157 ++++++++++++++++++
 1 file changed, 157 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
new file mode 100644
index 000000000000..b5da0bf3a1f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
@@ -0,0 +1,157 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-display-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Display Engine
+
+description: |
+  All Processing Units that operate in a display clock domain. Pixel pipeline
+  is driven by a video timing and cannot be stalled. Implements all display
+  specific processing.
+
+  Each Display Engine device should have an alias in the aliases node, in the
+  form of dc<x>-display-engine<y>, where <x> is an integer specifying the
+  Display Controller instance and <y> is an integer specifying the Display
+  Engine device instance.
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

