Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C652493AECC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 11:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE0F10E639;
	Wed, 24 Jul 2024 09:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="VmwyFUom";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011059.outbound.protection.outlook.com [52.101.70.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E878410E621
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 09:21:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlTFrQIgB9rp7WBx1IGxI2i6QZTtPLIEHkAlgzPcWoISMMrBhewpArKw5xe8wV1d9NnRXoammrFXKuil4S59Q9xl0+ObXHefhjms0b1eGRlOcKglmJchlsT7WcVXybzQlYw9vK8Ac4BIA+vgSapxRfha/ThAd8nIc5yXf4ZcSqCLxths+ZDxHsU0rKgfq1V0dJ+b7ksJfHBk0Lc4N869kgjXN/mmITMpvM3Dh384QY44VC20s5lunAiGU+o9+XnMiCHQoKqWQaSjC9vO67M/f126SeGfijlL+6dr6BKPiDrMDugURA8UlxbO0OORtfwUqHqJh+HWRfPIJCiHpQ0KqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iddFpx6nvD4WYbN39qUdLm3X8vhYiAoliqnbdDsKZR0=;
 b=km/6m6nSlJC94v+G/lj+JYew9fX5CO9HEA8ER5tg4po2RKIBUiMLy1cewb+LdNkjm9/ZUDfAE82l3tsa6UKYBEBjgdvBsd2OHhr6Hx586T1vd7ELKobf5kKqjz8xajXG83fO4J+7U3o+cLEjesH2RleQZMGCLIQT8/V1/4yUyFVCGslLjNj6aSixPs43BXMN58fWdjnIOkLkE1RIzQZYKLwIf9tz/v62TUuGwCm7aGg1VFXYHrao6OC5EZANfvm0arwZgMwToeal12zs62tQ51aDVWH7Q+DHzRR31xYaUdlAroeaHJbCVLo64R8HI1P1X7EAbPjutP8NWSx4qBXTaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iddFpx6nvD4WYbN39qUdLm3X8vhYiAoliqnbdDsKZR0=;
 b=VmwyFUomnEam3Taap4uhf6YXmgil/kohGt/BxkbvIGzDFqIPQHhKzjyMNMVgQKsHC8VGDtqLjdN3Yg2XqAS9MMJPB+0SMrs82arye5LimyTU++dORpVlJ+/P9uwY0eWHlmsYhRrBN+vPMuZcUyPmcKJp/agDqemj6sg8yNa796XK9Tvvfizu/Ufj6Nsd7O+Sf9miBECnJORIPf64UTNC2QpmwH7/U14oIll9j4gYx8puvKoWChKChiJt+TWmQreKmGQ3B1RNPn+rd9vAJ/lbSVasuayXABrCe7GCJo95pi5mfPkbM8QBjRgh5XqBVBxygwHHOdE9+L0dJKD6LLFSKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8040.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 24 Jul
 2024 09:21:22 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 09:21:22 +0000
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
Subject: [PATCH v3 03/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller display engine
Date: Wed, 24 Jul 2024 17:29:34 +0800
Message-Id: <20240724092950.752536-4-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8fb811ee-9d68-490f-5a3b-08dcabc1fbae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pcxFMrp5pFf/ZGwCuMD0fGbarkedoJQ2p0HejAzCBH1Xg2bm8XpdCXagl5b7?=
 =?us-ascii?Q?IEMTpwegBmMYbuQh1coO/xLoYSEZW5UcD2qfpcIyks/CoZK2bYkPxClxaHVT?=
 =?us-ascii?Q?TRsJsMPZmVMtQjVPgo0ESKCagzy6xxMMJU/A6pSMZ5x3xLLPF560ou9IFEbB?=
 =?us-ascii?Q?mzQqnIKBCffRhuJo0H+5MV1deHXMIWyF7PL/aEssMjYnCb+ejRJmtbdUPLU5?=
 =?us-ascii?Q?z/ftz1bbP8tuUGznCRM8M/QUVq1aNdun1tD0fK1Af62IGvQZn9fTb5ctVxyg?=
 =?us-ascii?Q?GeqEZVcO6Gca7GUGFfzKWi0TFIcOahIxZ47/nEoNhIsLes8ryzKpKQUGAP8M?=
 =?us-ascii?Q?rMnsTHH+ia+3S+bEQ2/USLyjJ8/9s76eQkyCSy+0ghACkfANqRlT5UEl4MTl?=
 =?us-ascii?Q?iH5X8FrepTcEC0uZvnf3slIuvMmPbl7S4fgzmY1zjTynQz1z+fGTYUjtUeEA?=
 =?us-ascii?Q?HQBDLdMb6clfVdrLdB5l1k3wJAq8rGxiGDHzfTCFQlEJrnIC7NIkkAWRMf9f?=
 =?us-ascii?Q?Nb0vipYS5nH9baXF7cUFLTcPANlpdTnHBKtqM41Su4ri+OsSawGlCqUcwcj+?=
 =?us-ascii?Q?9zx2XftALYEZYnd69QF3mLFaLEE2Tfm990Z6/XdtP0FdPuS91Nz+hFqclY6e?=
 =?us-ascii?Q?+Tl2h8++qDnSlpWV9z0eSn5R65g2UmNv+QsrMkPOcoWJXeqAYKzDy8GIltsO?=
 =?us-ascii?Q?7PckljViUaVgRNJaK+HHISEAO/8mwrHcmKQiVe8vA5rtmGBmymF/9e2HWktg?=
 =?us-ascii?Q?3HBMuDyNgStUFf9lYwSbllZQiNw1g4N0ePAl5zZCwqnVrfE52MmiXMyEv07W?=
 =?us-ascii?Q?HnsP/uxmlxgqWqkiYVHkp/nWaE3eDUGxgMmpzQWrRX1VtkD3XSBTv51KsocZ?=
 =?us-ascii?Q?kymWmRe74xxrBMNNicG+933peQdEtsn04y5T2dASpXgjvpPji1kNns6tUUy7?=
 =?us-ascii?Q?L+lMsjJpj0vRmDREPYOPrTfgUA7hbFYoD9APiQf0tcbQIs1pox7+Wbw5HcD0?=
 =?us-ascii?Q?s/zrzPm24BP3RsB8GZGOpZiZAv8NXZrpf+Tm0WBOmk2KDAiLwYu9MpH9oLaV?=
 =?us-ascii?Q?vpgPHixB6naihtw+S585pSRoRZ8LeoScIS336iNdrLUvTp+6bY8PLg9WEQ14?=
 =?us-ascii?Q?/nOYHML4C4AdckNgCEcqy1IidEKocdLJxvIUuBiSuBYXoSY4F8v1obn9uZDr?=
 =?us-ascii?Q?ITpHV/qlPbcumB6/DxXcw4eVj1QTZ2UTU30JE7cIZMucmk3i1EE+4BFJzrOj?=
 =?us-ascii?Q?YQzpw96lbYLaOGh2RETeqH8JD6H0tWqgmOC1ZhOtsvacANfP24Z8byGndeeZ?=
 =?us-ascii?Q?vxDgT17L/BMGF0jouy3RVtX4XbyS06GFvIVoksv3cp+wkVjKrhuzUMbvx32k?=
 =?us-ascii?Q?t/gUvuI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zucM2Q9z0ejcjyo5nioqmSODkVFgQHM/cDm1tuqfKW5Ou/8UlAPEq1ckTbBY?=
 =?us-ascii?Q?EdP7/Oamz8UHvHXYCKYzeDcgLPw25DM0hvAsl9J8XsjLH1KfHM5P2iZxMmkT?=
 =?us-ascii?Q?zJYzJDWfhXH/zhBhOojuKgtrrp4x6B2pLrbxmFLD2h1eAiRKvqf93/kYNp2y?=
 =?us-ascii?Q?MNQZcRasaCKLD/F7AfyoWtClYBw8H1uXJOVdpaoBpRkQP1wEub+VVo0nqjLc?=
 =?us-ascii?Q?jCg07YWSieEU6PkmokcrnLUBKowAsercZp0/E8S3c1NCSdEUm2oEJdUn0/qP?=
 =?us-ascii?Q?rAm1hIG1Ji7VTP3/vwFVcSPgA7j3bfJZZbZADFL8BvkSUHjMmpiTIbLwGKzz?=
 =?us-ascii?Q?TwFt2rbfZsOJ5I7gV3OCED3MNrm3ggcTNKIDSq75WbnQLf3LrV72TQYVMALm?=
 =?us-ascii?Q?kZVTJ2xycPH3qpGwLs/fGwYf1rdZyuS9iDjo1CYqtZV9asEkX1IqmofS4ze1?=
 =?us-ascii?Q?IJ4qzn1ZkKRK1rv7MywiSdz7R53Z7w8lqq9d/7TzEgiA4Xzxrz48ygez6rXW?=
 =?us-ascii?Q?xQWbaT4vNP723XW3AH7qYkWFkRqfpOoVRSs5FUVY9oADEji4ESzJAwu30tyc?=
 =?us-ascii?Q?RpHEnRWQu2cVSqrQjCG0p/x+AWNnb8gUuOF2Bl1+yjUixe6ay2nIN8A4zRDY?=
 =?us-ascii?Q?lwZag7o/xDojmhen0SIvRmd5cenQlU0YUBkfnmsJsMNOn5q9WN5Z0b5PAIim?=
 =?us-ascii?Q?Oxa2Zxx0zcglgnBjBZVgZc1Jf2ACxjFHn5EVgFQ5ZKyaROn8p+fWZWFLs4dB?=
 =?us-ascii?Q?mkwVXsOI7Kqhj/emVuEVLcybwv7iJkJ9nYXEyb7vw0DkY1PILCXMh15xyOgU?=
 =?us-ascii?Q?I2L9PkN8it7OvBk19jOCBBKuE7nKfNlmcQAWCDv3nbHaXNdPiRkBgvqKZ4Nw?=
 =?us-ascii?Q?dAoBKQG/EXmHp3m5k4Q9dtBVamsZOrkhVhZEaC128LnYC97s4GaRjV4BUFvu?=
 =?us-ascii?Q?L/39h8ZwKBjSYygJjWYbhjiVvtsW7BgtofsWduPV0Nilh1MDJpjGIEXw66AS?=
 =?us-ascii?Q?dmGtYEDS1mauEET3LG9raqyC8IKns92E9JDYaWQbKU8QoKFwGqaG51A7HOfi?=
 =?us-ascii?Q?oJWMuYztkCqRI/0Pw4VlVUD2a6Gp7K3cLZwKEbuBYxRgL+BLo9Xcyk+opoFh?=
 =?us-ascii?Q?mpLM5fYWc0M7Ef/FbSZx2Klo5rvJcD5WO+ZeKXvMMyPg6gHR6Vh7w+Pdi1Fz?=
 =?us-ascii?Q?5mRS/Iw+QHoE0r681tERgQrV16aFbFIgiqRliDx/xIAVgzHrNOSAJmeGAFtq?=
 =?us-ascii?Q?ipMHp3eNEh7OZ6WsPZPldtpbV0jLpfKuR/j8DD9aNhL6W7GlVLrUxn1cNkNN?=
 =?us-ascii?Q?OGE3ic67HyfrkqJQNcLTJJaeLEgOOuGwS/drbegls7zX2JBFrCgr6DtsTwVi?=
 =?us-ascii?Q?jUnyoAoHlqCmqf86h79vlTMn1lNkSMoC9MmlhIhORtZ7OYyI8GaQ6Gli8YzB?=
 =?us-ascii?Q?/N1xJylXUHysu+MyWvgEpja7DfhvH1z4tExqDyz/RaUiRhDWD9D5XG0+7l9S?=
 =?us-ascii?Q?MiZtQ9jUSQgO6lSRT4IG/nnhKU/j2Xm3NzeKlkx8QlKi7e/YB3BWqDYn2uEU?=
 =?us-ascii?Q?4rdybYLULjR/Nv9c8+QRIxxKLqD4ytVEWqh7WuDX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb811ee-9d68-490f-5a3b-08dcabc1fbae
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 09:21:22.1143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fagZS1tKR13M31FKMp2u8EDAne4maxTeyoDWVcE0Djq8BARB0se7cnHfhcRTCdOtALzVEInzy3JmYtEHGHKqUw==
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

i.MX8qxp Display Controller display engine consists of all processing units
that operate in a display clock domain.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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

