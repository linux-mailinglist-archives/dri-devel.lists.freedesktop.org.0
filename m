Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0135AB07013
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 10:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89AD910E723;
	Wed, 16 Jul 2025 08:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="o7jnsteV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D451110E735
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 08:15:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWjkthL+7hLWAcoGorR5TFNKscZ9ZDAUHiQ+GwXXzv5Kg+3lvo8piaJbdp4/Sb09KYcna3V/aqEejtwpMgr1HrUiH0DMVmLzpwEI1UUvrO73+yIZi5JGSQWURSU4sfEM5xkyb9LNyrM5WSx6Vjo0FKBR2nQPFqrbHrjtl1bVFV89hqu99JwDgnvhbqG5M9d1+SMueTwz+ygH5pFr72kOFovXxUtIq7jefgwBBgR7QjTuIkSgNTrTS4I7ml7cSEyVJoYJ/+VWMkTDOYWM23S86QzX8+dBb5RF4x2J2RBm3CF9s8e5/DZvCfh0K8tFB6nusMNWjyLJ8f8TxItK6XeO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C16dDvac08eUcTnlqu0AcIjMx/9wxDK3pjjoRQ2vzfo=;
 b=fygB5Lh9vYfLr0YR4I039wksV0kXol1HpEvhVyCdzrpgQW17zeF62JpH8jgA7objRMMJj54N7bJwAL1fHzW6qr+ahoUVlBo6wp5LGx9dwhKdcA64kHUzqQ/CVhcDISCzxX7w2Z5ZbEBhT+mML8ksvQMkGMECdgSePXwYYOzIdiHv7MQUzeeQt9fDoYHecUKo1w0PgoYPojNjO/PebWz+4Fnrfbubjz2ZRxS4U7S5cboY+Nl/J7FaOiCEgWnIJrTb33/50b/MTBr64QBEp/ZJ/c+e5+7ABQVSWkhmmk5a8BJNTx+z7KreBt14JifjGSy+yYJJ0vQEiGa9Elbat8H9bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C16dDvac08eUcTnlqu0AcIjMx/9wxDK3pjjoRQ2vzfo=;
 b=o7jnsteVMp7DHUEddySZQBtc1uWj6G/vX3UeCBoS9/Ii6mvWM4wB6hy1yCJ1BSai1Trg4Dym4jcNrtj6AR29Z30//g2/e8CDup5cLw3XRtgfkEskZKqx6gLNkdqfnoeKEOSU8P7iFCjVEoUKw0M7Lm9L9bVnr3mT68JFYXMswdIscdfK0bI/aVYuTC9p7WvOY5j8YeJRzCyH6H/90Z7F6nBdwIhGfWQwpOLLf96mygAH/fHlYebs6Y1wAzOzNaVriCqopUboLQgdScRPTPoKPjg9CfEnSLSgKJ64lzpXS8XlWBHW94nf0s5WaYfNlUX+iGOHVaUBkjZgPzs1sEIGKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by DBBPR04MB7820.eurprd04.prod.outlook.com (2603:10a6:10:1ec::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 08:15:57 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8901.021; Wed, 16 Jul 2025
 08:15:57 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Frank Li <frank.li@nxp.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/10] dt-bindings: display: imx: Add bindings for i.MX94
 DCIF
Date: Wed, 16 Jul 2025 11:15:10 +0300
Message-Id: <20250716081519.3400158-7-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::10) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|DBBPR04MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: 860ef268-e9e1-40f7-8b2a-08ddc440fde6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IMqmCK2I9HGtF1aMACEZjTT+WdjYnPBuZJ+oLmteh3d43fDzBqx+UjmjV95A?=
 =?us-ascii?Q?6tOenfWRNHQsYqm3zUbuQd/gSblDO/JPdsB1x5BvMCyqYobgv5udjs6hG3R8?=
 =?us-ascii?Q?bUQ0JevsEGu44cemU/FEqbJ5a+DInIM2Y+xhONaAuqZhaehnsyRkiGeD8u3d?=
 =?us-ascii?Q?cvuiHtPFY98OUcQb9jLAtRuhRFDU5bGHTh6TtstsGPq2FDbw+TQLC9z26L/c?=
 =?us-ascii?Q?0nwyz7vEF/RUHYH5mP+YB+ND1k0GTjIR9rHIsgJxO6nncHRXJfDKGZ+pHZfD?=
 =?us-ascii?Q?TFsasbCQeG8AG7r5vrXvBQ4qyoqxX/7ImcvVLSmUc8eoSRIyUbne0ddvXqie?=
 =?us-ascii?Q?WIqsk3Zhv8KvpJKhKzcV1mQn20U0bQwrWuRuBb910Sq6R1xRuewGfvSPfjj1?=
 =?us-ascii?Q?7xwEO6WahHbvxZZJfMI0AX31kunASGlQslj3Ylfqw1DU1MCfsYTly/HzxQvY?=
 =?us-ascii?Q?u3lE87H/k66Dc/3addw1I2/DkrVWiTHgHumROAZMWbjRKWUg55Afd5cgmPyd?=
 =?us-ascii?Q?heHDXV29KOCjdiI499vf9D/IPXRyE3ISrHOQzw15qytl7FKE4EgiSNyrePpU?=
 =?us-ascii?Q?Wyf916Y1qpBEVhJQKPF1yfn3Mywne1wBnHIKdt346o8yjFURIQnchZ9heeKZ?=
 =?us-ascii?Q?k0EKMp7jPg0D2NNeDH7w1UF/oq8ioabN/xsTMH76vjdMfRUW56HPkJmCkBRP?=
 =?us-ascii?Q?WuWJhkDi+mwph1Zi02LilUpTaz2hifLB2kyaeCf0PPv8XEs9Q0WYgrFTY+0z?=
 =?us-ascii?Q?MSrECuJatjKQvb7KoqZPPjXFApJGPOGA4OkTQ+8aDjC8fWx68+W4nRX9T5HA?=
 =?us-ascii?Q?gy/eVMZRn+VJbfv1EZp2jmM0Q0Ut8RSde4GnUMPDySAoe47FETfAsZr8osRk?=
 =?us-ascii?Q?jRDNHDAfaRW/1w9LCfE+90yhJCLw6E793qr0Pjk+fRNMRPe75O4tucPffFs+?=
 =?us-ascii?Q?d3W4FGp/3gEY7STORKGa/vxIsbUOfKX+08k+q0UIZ8R7lIdKTDGHhDIYm0c+?=
 =?us-ascii?Q?hslXbs4udO77x86LnWeJcybvyZh12SzZ3SU4N7jIkv79DbaC1X59fLdPpgCM?=
 =?us-ascii?Q?1TPNbS9eSkopTX+RjptgP2jG+KLTTLWlFbCSvozyfNHWC/vclcIcqRUKRFiu?=
 =?us-ascii?Q?Fh8ekoQvZJBVeAirzqydriq7lhpOMngMzII+DQOh57BKkOLBviXJxKXt2Sqn?=
 =?us-ascii?Q?He2ADFFTcaCpvopXJUmbxAAa+CJXofwyROifcW2ljXwKD1Zg93ofmp3YEH06?=
 =?us-ascii?Q?JmP3I+PO6y/UQbtfw2XTDHycEgG29nAYMqQx0/QsFzlv8Dp7FYnastIFxDgc?=
 =?us-ascii?Q?oTThEclwB4kZ4btSZ4Sihi4Rve6Wq1LdUTUMZ/5up4fJjw3pdKRLM5aevQze?=
 =?us-ascii?Q?5qzzMwM3zOkMtT9nIOS3HOFln2dUsqxLcogQ1xFfB1kGXAtZOR+3fPefL8aQ?=
 =?us-ascii?Q?7yerkWaOcVc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cpoJ4jtRVPfn2HGs9jZ3Y4s+knt/0YJvU/ETDV4Jska5PFQ4d+0Bv1wnCrNX?=
 =?us-ascii?Q?yZQgIfypGYzktbHTj3YI7OXV1UKAEZ7ubv/lmbfArxQWk5hlVzw0mBV97wcB?=
 =?us-ascii?Q?pQHyKAFndppgdAe3Tu3FkG49VlTAr8+U6xSBtGtWFqbmAwzgDQ0Os/hyNYaO?=
 =?us-ascii?Q?ujcby0m/NKSt8HS9WhrRGwXEzpk7S6ZsMcxRlkjtZvj9cRexOfY64V0n6dBb?=
 =?us-ascii?Q?dT8QQueNhLa0wZw7GRsrB6pKszrpxOBgjAqW2KNYBMqR4KtM8AuDPzPSVKyq?=
 =?us-ascii?Q?/kw7wFfYZPBlc16LJPc2rIenWJ3FfFdU85JyEgOGKU2n4taEslewTg4jScnp?=
 =?us-ascii?Q?JRCLwcKOfzNP8SpAi0Dx8UJ4nuv/fyUnnrA2ib4UnhrXdv/GcfkQq7beRqMR?=
 =?us-ascii?Q?N4zVRbpxHwahU+/+icxnMOICBdklAhyn5NkDt6MgsuT0NYQgWzcMWfbNgZEX?=
 =?us-ascii?Q?KdGqfXS2tjVjA1EzqEZoSwpxsMUZJczRnRXCaio+czOxDx9cVJpiAdZ28Efm?=
 =?us-ascii?Q?1UY2dGVkgEpFlAIqOgNVkJyRPD2gnZgDSIqYPK47aItw0+r3sJ0CugCOSHqe?=
 =?us-ascii?Q?ASLcKeQ/qnq6hpJhK6MFbdr1kQbCqbjVXcgVo4zD7PQ/GWO2ZBku2bMVIb5b?=
 =?us-ascii?Q?ABLl96MlbKjS3JSCBtwTRVYd7YiGheKrvPRcrwChBgzBylK+sYuxNXH61t1e?=
 =?us-ascii?Q?NKsSHU/FmD5W5+mEP8MdPdjdoQMvrBJdedS7LLVLYdC06nxAT4JHWX2mrRe7?=
 =?us-ascii?Q?pRWtHKKOg+ASBm+BcDWKz8UoqKOf9LdLMAzvQLqrwmAkGIbL89nBRr3/yfLp?=
 =?us-ascii?Q?vQRq/UVYvHvdRICADhF2OqvitTQ+NKjuXuNLAeCrdMfZj7uJ8zUxWhYkoMzl?=
 =?us-ascii?Q?SScznaBMTjZfyz5uWBQuCztkbr7Kzh+O0tfbFr9KXQA5jsTQ+AxVueHw1Wz2?=
 =?us-ascii?Q?ilNWzIsKwQ7CyVJkPnko/BZvljRyOQQHVBCGSKBRZ6x6P/nXLFzvS/icTj/Q?=
 =?us-ascii?Q?9oI6a+CxMXc/YhK9Qjgvc8m+x47zwmDjTWWmm0/f+FY6C420xf5rFqRkeWts?=
 =?us-ascii?Q?TOpV3BW+mz3zxfBBaEySGavccpAifwpNDlTw0WZygORUW6dgmQo07G5xQm5H?=
 =?us-ascii?Q?z4NRJSYnZDZJWs/S/kJNUOHY6lHRf8oAJqPy55g9tPffH66OQc/RdUQhzBSz?=
 =?us-ascii?Q?MBarDGUThOWvs9i5KTOms2BKQAYTxq64TU3J0tbNvX7ITHq/7vX/P5rKkCek?=
 =?us-ascii?Q?ZdwyG575tucchvOnp3fLaovDKy5+jCZKrCNh5q0dU6ol3Nvo8C+fgmrBOmQZ?=
 =?us-ascii?Q?6VMaKijPaJvxZlFd6N8wOTd8yhfdahPdvWhr4LZ8nturNRCkRPLkOFe/MfDi?=
 =?us-ascii?Q?4buah9FzjCMeTjo/36hzcUlQmTnB9MyjWLhrPvOP9purwR+LI1DO1acQVEOw?=
 =?us-ascii?Q?g8j1WVFZ2XerjO2dnPTZaz7xYO7f4snpzrdLbh3wAKlUSd/tOAdUUmGCGmgL?=
 =?us-ascii?Q?OOHWdM2in7zsvnTggSdI2aYpnr1ZaK/Kk8JErHGqbp9N2P3lG31d/WOvV+85?=
 =?us-ascii?Q?d2ZAO1Ev99B4eTTfbigCLI6BnG+7UsL49MyOo4iqiqEfSgsfYqhEI2YNNWUO?=
 =?us-ascii?Q?2g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 860ef268-e9e1-40f7-8b2a-08ddc440fde6
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 08:15:57.6226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OnTuy61R+rsCZOmUn3UyyeVuwolh+Nzas78itUMHnLEEYCTVKBJ3jzn2wVEugo7hfslpmXqmMOk8OaJgi3GrAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7820
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

DCIF is the i.MX94 Display Controller Interface which is used to
drive a TFT LCD panel or connects to a display interface depending
on the chip configuration.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 .../bindings/display/imx/nxp,imx94-dcif.yaml  | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
new file mode 100644
index 0000000000000..207ddf0f550df
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2025 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/nxp,imx94-dcif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX94 Display Control Interface (DCIF)
+
+maintainers:
+  - Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
+
+description:
+  The Display Control Interface(DCIF) is a system master that fetches graphics
+  stored in memory and displays them on a TFT LCD panel or connects to a
+  display interface depending on the chip configuration.
+
+properties:
+  compatible:
+    const: nxp,imx94-dcif
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description:
+          Interrupt output for CPU domain 0 (controlled by common registers group).
+      - description:
+          Interrupt output for CPU domain 1 (controlled by background layer registers group).
+      - description:
+          Interrupt output for CPU domain 2 (controlled by foreground layer registers group).
+
+  interrupt-names:
+    items:
+      - const: common
+      - const: bg_layer
+      - const: fg_layer
+
+  clocks:
+    items:
+      - description: APB bus clock
+      - description: AXI bus clock
+      - description: Pixel clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: axi
+      - const: pix
+
+  power-domains:
+    maxItems: 1
+
+  nxp,blk-ctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: A phandle which points to NXP displaymix blk-ctrl.
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Display Pixel Interface(DPI) output port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        display-controller@4b120000 {
+            compatible = "nxp,imx94-dcif";
+            reg = <0x0 0x4b120000 0x0 0x300000>;
+            interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "common", "bg_layer", "fg_layer";
+            clocks = <&scmi_clk 69>, <&scmi_clk 70>, <&dispmix_csr 0>;
+            clock-names = "apb", "axi", "pix";
+            assigned-clocks = <&dispmix_csr 0>;
+            assigned-clock-parents = <&ldb_pll_pixel>;
+            power-domains = <&scmi_devpd 11>;
+            nxp,blk-ctrl = <&dispmix_csr>;
+
+            port {
+                dcif_out: endpoint {
+                    remote-endpoint = <&ldb_in>;
+                };
+            };
+        };
+    };
-- 
2.34.1

