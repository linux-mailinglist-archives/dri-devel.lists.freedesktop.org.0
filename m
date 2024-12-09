Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F119E89BD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 04:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D91810E294;
	Mon,  9 Dec 2024 03:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="U06r9yNS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5E110E294
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 03:40:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sS9s66Y6tI1ArvEtHLwzCG3pY8BPQph9NMVzAgnXjYyaR1NJnk2PwEe/OS2bmQhqWFQcqUl9m1ARfenBBTP8eHsNCf4Zlbyo0RHa9QSO+zWlXs3a4XsFi+oAD/sv6dXaf9AWZQdCpfFdSJvHmLsh07eGcmIWG+e821C+2W/I9nBP01azroPsFCfC0gTcZoZltDKIVuUIWDbJK2p56McUdTWb4TfBhnw8lwCFleIOMvWotT3HjLU0lhCoAdw9/ITH6tkL6p7eGjlPHH7Y6td3xf6Oj1sDUVzTM/m7AmkesViSK9LLgwEEipsEucWbbWryiUabXJWAhpQOd8WkacSz5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HrlyVkJlHO9vZnO1B2/BU/NF85tFWcntRjhWcul13k=;
 b=vTqK7IeZmtyxLon2ure8pG6N6zXAJVmaskHZwiwBUcvzgn7jTXWhXJMLeRSJRwGV2rqlUPAd1Ngqzt20aG+dfJs+5juOK01ZTWtbmGI4PkFaKlIlr7xuqW7a7o70PVlkFYtPzl6L+1r+xG4/5cra8pcW0zpFrIReH1i7c7JpprzRUTEAVoUYKdxAe8P+BDVrmktH5UXXZW913NdeDmwcOjXxNq/yF66x+ZNle9++RljdYExofbEjjfD5VVUcQDtjS3wekrKTvIc/7HJSTMZDWpqKQfSzHAbUUC/ucxPqVvsdTHi3BNHIvMe1F6e/rqe9jnS2ATJ9AUlLHWmDsuDaTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HrlyVkJlHO9vZnO1B2/BU/NF85tFWcntRjhWcul13k=;
 b=U06r9yNSefgI9QOQtJDsVswO6O7lh4HHzgl3cz+mtRyploxmuKtBGyWjCe39/vPSRZh87r5HzM2LemeSj11lbovckmqntEUEwRZ5xPG2Ckq2mNpNJnBi0pQiwrsWzOZc5Gdq3vqhpCRiZFqqhbWgYKmpAv+G8lrFlUpigGUfrhq+GfoN8Ar9bPIuy4JUByhSWIzX5vuz1XJGg2UHi8MBc0tXuckh5gPyZn0w9la5pLqj6sXW7seUtLfjzlSvtsD/kHkc00taCDUyMfeLFZrVov+tcZXfvPDmWq9RYi3q+j+GcbidpiuzXlH/YNLqhe2q9apKPQ0F5kR1t14xWfZOsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10212.eurprd04.prod.outlook.com (2603:10a6:800:243::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 03:40:07 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 03:40:06 +0000
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
Subject: [PATCH v6 04/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller pixel engine
Date: Mon,  9 Dec 2024 11:39:08 +0800
Message-Id: <20241209033923.3009629-5-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: b90a0d7d-8a2d-4110-e424-08dd18032c7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FCkYJrI8CxY54n9Iy88hXlhN5+2vIdSegDaUjloedlzXtKzJdL1bLWNq4zJt?=
 =?us-ascii?Q?v1RVnb5kkgOtEwqBUZXJykAN8hhwVWLycvlRB3Fhov3RsqxzW8P3mCJxUklC?=
 =?us-ascii?Q?MGoMmjUGXcbMsI8yGcpmCphxofY7wGX7wfxMaZl2dmByaa+XNSgEUGMbAOa4?=
 =?us-ascii?Q?uu3Dr71POfUUfUOWIAdPJSsjkkBbPgTG05LwF8RMPcTEW1AnH0keQubqC1ed?=
 =?us-ascii?Q?WBh+5RXQZS+7Q2WpyBEjgRTBja16oAHBHiRI0RQkZuvimStLqtToj+CC6MsK?=
 =?us-ascii?Q?JnML2q9lmMjAUJyc1AsGEwdHdK5I4oL3FCIV+vEoLRE9wo5oMy8QkKioeBT2?=
 =?us-ascii?Q?6WMvSAcIIaNgzv4I6sHlqBt8kUGabrl3okbmQE00+FWdM7ylhv3NI/lu2Db9?=
 =?us-ascii?Q?3SXPP+j5LVj2QCsq+8ZX4D5NGkmKrrUSM8l7eG4nIjOLTl6x6YlnwZ9K3Fxq?=
 =?us-ascii?Q?kCnAmHIFwNX3hu8dhpTNuLR0Qmobt29zctxxv1/CvPKwX6+qFXc/KMHp/QCS?=
 =?us-ascii?Q?X8pqYb5qm32ELIE1/VcjsETvfsU0wNMk/i4TiDAza5G6KCVL0rvg6lER3x20?=
 =?us-ascii?Q?769KAo4D/OV8lVim34QS2nqc89S4FSsQA/MBv0ayYxbXRuG4ffgDgdxYvlf8?=
 =?us-ascii?Q?V52lTTf0kL+AvO3yD2kHqIxutjMnnmdFQlJQLO8VhyVJ0yjbYncEnOMyqLIt?=
 =?us-ascii?Q?SmVThhTP8X5ALtJuaFnz/S19FEN+WDyz7bMs6wvpCsvRGWB7dp5CtgEqqAF6?=
 =?us-ascii?Q?UXhuLrkctxIsUkWvMU5EudYx71h9KUSW2LyODQNfIXQq0ZclHICdvPOMpOe2?=
 =?us-ascii?Q?6aBRKSSug3GjjKIYImIeIPmHyNQgtJFhrwtnZNBNBN9IJg/2qs9y5mmSwEuG?=
 =?us-ascii?Q?cUH/KnbCqeue9PweuNwFS1psisTv7nY6oApeOd7BarHYmXk/ub3OmSl6zCl7?=
 =?us-ascii?Q?eNGHsbATsZ2W4rU4BopQOoUBmPIuJnPYJWf0k6WlSDUsO0SQzeqCsXf0yGTm?=
 =?us-ascii?Q?+MgvNcSDwqt7K9eb9YyRp3bft9bvDL7T9QBeN0HDNDUO7+KKspGUbUGUSPxZ?=
 =?us-ascii?Q?+jZPXMB7IItcBCvGNz8C+KPIOAxQH+5zVA6tMZqrgfD7gIGxWUi+Zqe3k5gP?=
 =?us-ascii?Q?gqTzHoSHhd5TMRN+LL9A9VWIbslSP/BgxS9cMOVbY9TISLfEnwlAN5HG7dRO?=
 =?us-ascii?Q?viAMYmMqyHzvVFN7aktjFnXxU/diSFG0yKTpfd5MYxSYEAJxq0SL7MayM84o?=
 =?us-ascii?Q?v7Ia9E3q1d5+cKkKr5rUkhvs6dJrmHuf33UnnmuE3SDUdOu/Hz1IthQKn17O?=
 =?us-ascii?Q?UXEXJpqDrO3iwaVuEu4n5MbNooV2KtTGKxmLgqzmFvkYkA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HCLZ0EN/2NI0DFq0/zVB8SVZDxK/racOaeB/COE3HtlsNk/5yK5go0Xha4wJ?=
 =?us-ascii?Q?IHVpGRfY8xXr1rXTS1dskwRTbRZN1e7FqtwRLnWoOQGEjEhuJt2/8nFCI+qz?=
 =?us-ascii?Q?auCYH17y+xDT67lYj0PjrkxfSZMjrt8/3oFEMP3IxLS7KOTlpmUGeNXqq0sk?=
 =?us-ascii?Q?lf1aFUj3iGGJlqKpBjCZh5DNoUzzn+9NrxjLoXNwJMybuP7CIhDDeywPvR9M?=
 =?us-ascii?Q?bJ+s3fhOWEFL/Pijp7hazGR50Rm4eLS/8iQWHkj4T9xvZ1H/FPyfHBUpqs5O?=
 =?us-ascii?Q?2z/OUffs4DMhtQnfzegWrxDrVslI30NHWANH5ZFUUVYOZM4OHJ/Ea0lnH8/c?=
 =?us-ascii?Q?4CixE39tHBjDMioYo6M19/wb27zLT319GwNU81zyYsEUUApK4LP4LKjnOIDE?=
 =?us-ascii?Q?q9YLgh1wxgNx74DviY0w7Av4uTbcZJ/9j+8khurm4twpxSNl4EqkjmDoT7jJ?=
 =?us-ascii?Q?y5+XLhWNnlxWlxQa5WJO0d1qwJJbRoFePMeENuw5sNlcRhf32PWBEX6/NZMv?=
 =?us-ascii?Q?lq26yJ1Y62iel+5DtqyLOWxEHwI2xD873Atxc5tabsoSyNUBTikPS19rauz4?=
 =?us-ascii?Q?Ov9Db6NjPHqVS3Lc3+NODjTtoH4SIGmU0j55+zLwpSeqRZn6B/urV95Zitpz?=
 =?us-ascii?Q?jm/Hh7c5vwu+v/wB1B9/DZchs2goy/xkNjCmd5kxSTJyXAKhT8Jng/E/tijZ?=
 =?us-ascii?Q?yDCrq4D8nunNhggtxL9VHhBx4A1Cpw7HUDo+lVf2jGtlNCR7lnMfcs1Leb0h?=
 =?us-ascii?Q?6QjxfANBT1ucGmnxXmY2fFaZFSYSdjCuIYTpYLTRXU+ZZAidRIafcemBot6e?=
 =?us-ascii?Q?6yRAYpKweFzsWdCpsOMQZIWVwqALQzeErHPKbzlNYvIC3gjjsU8Tf5+MahEL?=
 =?us-ascii?Q?DYEbrI5+JA0Xxlg8dHhwR/R1PiYARv/Mgli0K0PlSpiG9C+ImTrwnRGPRxNz?=
 =?us-ascii?Q?Mab1+bt9b34A3WLvrT0Bi0Xuco9JjZ/gAhajBOvPlAg8suvkVp+R0FrnRgmq?=
 =?us-ascii?Q?qNYCMP9Fm9ZsStzROSZDxmgvwS+ZBbpQgmlXa8l3DHrr9qTF3H66sRs9yN71?=
 =?us-ascii?Q?943uq634i2Rr5tADIJAC7uOqHHrtjlW4QrU4/qKIWYHhmdH4mfgrCoQpVMSb?=
 =?us-ascii?Q?Y6Kb1119eTx9PvV9Z7XaBdO6GkmlKYX0hsexKmyMvmqduSFzt2E+Kf7kFfk/?=
 =?us-ascii?Q?EENlM4/2pGq6XabspwtGtDeKQoHmkNUvdzjCDSYYp70pbsXiogPoYXL1cXuD?=
 =?us-ascii?Q?ylG7SUTsC5ws+1XWwAcokaIStGSMsBfSYqi1jNRgfRxoXbvyGWQZd4Tutycd?=
 =?us-ascii?Q?JjmOCkPs13tQA/cRli97DVlgijXNo13y4qfXyv3BYWkrZ7T6Lva1wwuMHxnQ?=
 =?us-ascii?Q?cyYtUlZ6JJU9ufEOPrnUbAG9MWJzVG7eQdN+ysitKpafVA2YQAX3B9cRQzO2?=
 =?us-ascii?Q?JNx/iVJZUrgC0i0NkujagBt4QkT5AXW7SPpUbNx3/IN085Yy9MUmDhYxw1Vf?=
 =?us-ascii?Q?GX6mNExFM/RSFaSc+CTeqr8RCZlMf1kgQmrIzDmDnh6WTGy3r2p46dvnxeFJ?=
 =?us-ascii?Q?/d80WGg+hADh9ccObV+U5togSqBHrO6NHjqyfMKj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b90a0d7d-8a2d-4110-e424-08dd18032c7a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 03:40:06.8703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGT7hc51v3eFQhzg4QxQpCdfUdvqX1ruz62QGfrkKa9cXLWezaQlpQmsajGiA8HySQhPUu6OdKHtIH9154INnA==
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

i.MX8qxp Display Controller pixel engine consists of all processing units
that operate in the AXI bus clock domain.  Command sequencer and interrupt
controller of the Display Controller work with AXI bus clock, but they are
not in pixel engine.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
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

