Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF08AC812D
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 18:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD07710E76A;
	Thu, 29 May 2025 16:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="NX6lwUFV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010055.outbound.protection.outlook.com [52.101.69.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D270A10E767
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 16:48:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+tvVKvL4qwXJjmB1/kujMzKoZyoWnfZcqAnGaneowIU4su2Z+40f9TolqeM2h+Yw3Cn0gME19sXja1x2wCim0adI2rXhxdw+UbyB9lwCIg+ShuQL+lwcF8qsXkCXTkHWMYAUPWFCR8zoeRLSvfvf4dqODZyyPshdrML3E/Dlv7h24AQXZt9EH+0S7aJkk8pdDXcw3rS5591UVmyqy0gQt/+o231kLhUbKY4PGwTGDzFzJlrV93NFOQ2M1dOkvYK/4I45TTohFA3kn3wjR/uFaVHSlg1TAyikYMwX0WQua7BVVsSmTqWDtlTJxgRrRrIIrRPTEAR4SWScMy78yUTDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdjosiCtXFx819UxH1RXQjXC7+awOce84PgsJ+PD+T4=;
 b=qPZqLYoskq8pkdhCY89y98uHIll7Gbdbhx6o9O5XyWfq+CbfOZ72tCUeGl8gok/u3of7O5A5Ur5P1eh1liqI5vH6CxpCrIJxXT8UPSpLOUN9n9i1xJgLgwFbZWBQFB9gS5lBpw46QKiLkPn7C/6ouMhPo0upRQMVsfrL78uqmGStIIjmlytBvhE4KPtaE17MT9aU5VWirjbomCHSC5yG7teOzRPTH1wJin8OvAoX85hhK/87WEKkx6VWO91NwKBS+PZSzS27zjWNe5/ZVXFzk1sQbGXwmW67C6dFq+lanZ8Gu3ljwAR/cV1ltAYwje+QPTpKiHfL+qIh1yIbG+YbPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdjosiCtXFx819UxH1RXQjXC7+awOce84PgsJ+PD+T4=;
 b=NX6lwUFVq6SPVoBAUVhyj79vuTroCe9A4OoqSyYHGCh2yV15GrV44JiSXGrSEd4aQg2X41wuRFa/3t6MkOamWpNV6YDPc7794gzURD1C9BzN1elkrAhagZvLh6R4upcWMtLqXU+cCImHw9t2fNWl/i1i4vDb1DtPu5qp6LiQkw/1n7WDgYR6/g1XW2VO7a1U6IPaOLs+HcRAiWx4230CvmUOXEZjteSm4PRimg8u72kc6CvDeVOvyYeWJNDRkp3OwzPk0tRRw9IB18fh93wXFTY4h+9DyHgdEB/Lgh9G/uvWRZy1qWLvNPtmBDjqkXiB8ZxY7vcP72LZpqNMeUiMQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DBAPR04MB7414.eurprd04.prod.outlook.com (2603:10a6:10:1a0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 16:48:39 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.8769.022; Thu, 29 May 2025
 16:48:38 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: display: convert himax,
 hx8357d.txt to yaml format
Date: Thu, 29 May 2025 12:48:21 -0400
Message-Id: <20250529164822.777908-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0047.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::10) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DBAPR04MB7414:EE_
X-MS-Office365-Filtering-Correlation-Id: d1eb29c2-f28c-4fb5-ea39-08dd9ed0a932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PQw3UPQHE8m4D/YEu9vFr4jOcSJ1LxW9t27ZcMBy/MmndMYhpfh/5pdABECQ?=
 =?us-ascii?Q?fp2+9K6age2va8fZxQxtc+e5hwheTcX7uoN+/2BO5KC9v41VLQ5KJR1y4vq4?=
 =?us-ascii?Q?Cq5+uPLC4rBKYNWzamqiVmtoo6Dk3ISm+u5zKcz4TiHkdGJPLHeb/vWJDe3i?=
 =?us-ascii?Q?GuaxxM1mx0nZxgOIKz4EF+DEF6dSQVNquzwh2LL8QL1q0mn9jMo56gBHKyXd?=
 =?us-ascii?Q?l5+yIVwx3bDQHh/pBiqXBfMELicfKB2An7pNseGdOeJakD/kh7oOLVWHA+Qt?=
 =?us-ascii?Q?Qtl/GmPW18BV3lK9QNpcC1McD+h/UfzjEYPdfnowpnupDvEqJQRIu9miPXZR?=
 =?us-ascii?Q?WsIBLkPcugJn2gAwd7Ox+x2J6EPD4R2Jfp6FlnnP/NDa96tq5RV5SGy5iFZu?=
 =?us-ascii?Q?k2fSnb4X8/WROu6qkTAe4tiAG5pS5EMSidKeXuqeXFjRkSPXeTGdGFuRg7FY?=
 =?us-ascii?Q?/5Hoy/UfhJ0VsDh5l4Atzzhv1D6Xk1okj5VIUlXkR28SkabUZ6SvM/Z/05Bj?=
 =?us-ascii?Q?kh06UAf4hVX6h7Cwlcdl4rhGw/B4Dn/jC2PbkMEO/kv8R+a0K1dpPM4khUou?=
 =?us-ascii?Q?ZadRgYzFYKhbDzJ023IDa5K4ZfXxVj27gTxDG3B++J+ZmEtdjAkPOTkcixbu?=
 =?us-ascii?Q?B+VXxyI+HMqxQsBbAWRemWV7akHKIt70ujRBkQ/dhTjC7bt2WyrPxDH7LWDk?=
 =?us-ascii?Q?Bf7wFPN2r26sv0sAa8NMCaxceUdXP3y/wOJ/bkOft298fXUKiqs05eENPJw6?=
 =?us-ascii?Q?V4DJNuYyYBIxi5Jg3i5Ebu58MS/J+/XHsCTzChUJ0nH69vX2IVeXRDvBJ1c5?=
 =?us-ascii?Q?xanKl5ZP9dQx1Duewoy3qrXXIUf4+Uq+yBDqz5/mU7Juv9nzp5ydRBwsb/cs?=
 =?us-ascii?Q?Xu0zrX9ZvKVoBdEs5c4aDj6PnibEMSWMzrNod5L08op4X69kGvIOvXDEuSCs?=
 =?us-ascii?Q?gmKZlojB/3T98Uaa7zG347ur8QxV9t5OwzGHwnSBRBYA5V6zkfAQGrpAOknM?=
 =?us-ascii?Q?43flBWRPHgrPSrtVajq2Ke6N0o70CLX0DzFuUpnoTxJpZHiBh2eAarXJeR7b?=
 =?us-ascii?Q?/O+ZBOwKStzH5xw96E0gQCnWECli/fI031MOckrEMz70EVHhTCZP6F/6UV5s?=
 =?us-ascii?Q?nh+JBapDsUScPWGNJnc1fuj2aq1kcQU/JhUQpAiGe4xIuBiSqp2QW+xv6hRG?=
 =?us-ascii?Q?iJTbnInB8FMdI1x46YX1bX8qMHFCzuDLIxrbg9JiDLkYQ4A3Mkz7M/gqbWy1?=
 =?us-ascii?Q?YrBlCwohbd8KkspW3yWewj8n7VHI+5pzAvkiAFts9l1JA+HmqgVomxMWs7dg?=
 =?us-ascii?Q?zsmVw7a/Giv8Mzg46jweM+cXIC3IQpCDVCvDg/6Pz5hymvLNZadIDCbCzC9p?=
 =?us-ascii?Q?EO1ZI9GmyY6AQ0rEUvMuNWTS4GXe6ir6CvuSpIm5aroppvU9natUqBFUe4nm?=
 =?us-ascii?Q?IF1snFPGd40ovCwJZcPvNwquz66mIyr/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9626.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HJfldpavjPUYDGcYqp8dn0f9X5DqMW/FgrWihV8xzOZ27Z36xo2dk3CD7ELb?=
 =?us-ascii?Q?SJkPKI1TfyidX0abqJnIHEqZFUqoxK8IjV2y6ruBfiYP7IVpnpidLbGOSKiM?=
 =?us-ascii?Q?/aLZYU/Li3KAt3SPEaxffvt0WbIqoaARrJYwwjH6hcogT2GwJRYxQZrIEVr9?=
 =?us-ascii?Q?pKMLv9GyRwPzgHze/GeakMnfHfoFOrl3mnxy4RZoHKQbygLfpb/ut+TnGQuY?=
 =?us-ascii?Q?9ANgc8M5cA3RIQTxvsAwk/ZO2Ykt6YsDP4TM4wf8SsBitdvmm5Yo4ET7AEKl?=
 =?us-ascii?Q?lRiLqScIFBYzIexLZX7f5u5I1XCR1Pp/zLummu/7g8M2Pgw1LIXnaAGKS+an?=
 =?us-ascii?Q?mTD4CwoHxrXwML0nLUFlKuu/NpGiq25BjRiAnnV6qKKfaxJ+hJy5e4RH2kRa?=
 =?us-ascii?Q?cx/ikkgQxMRwpFtBHbZD32Zg9KfxIMzOjPZakSBd9H6rPyC4m9KNTqtyBRlB?=
 =?us-ascii?Q?/lJ+ZU5U/2oUJSU4OaV2aqAxMRs9/9ABNY5gVqkKHCmTjEc0bl8AfA+ghFUQ?=
 =?us-ascii?Q?qC/sLLBVT8J2ob9AI46bVbOPfuCRNAdzo6lctlB/GtDS1m+VffW/nz62RwM0?=
 =?us-ascii?Q?EbnwegtwfNJlTDz236of/YAg7w0TvW/Wypss55L/lLc8v322padleDNGmtpL?=
 =?us-ascii?Q?o4yT+a8+g00o6oJuC3uZOo3c56vdaJZAOVVKdrgHAKLFOBfN/AC2D+QvZy28?=
 =?us-ascii?Q?VL9h2bVC9gVUKfT+WoD3CZxA6uW2oMLP0Q2g+ohWJWfU01nIXMIX2n4YBPcK?=
 =?us-ascii?Q?l7suJVsX8WVzt2E1y9uzmYPdSYCNPBBnJ5QOXk/C7oDBH/w2WJruYY1sKoUu?=
 =?us-ascii?Q?7pU2v9B70q3v+M1A+AzEdC8/NVztHdRxE1+C020j+6wF0I4ST80IynddFcjI?=
 =?us-ascii?Q?c5LQXsbXKBUxNI1i/l1p8MC53BvQcrfXBRgM6Y4IMC3suLssxDcOftqz+Id5?=
 =?us-ascii?Q?IS7CC/hMae0y3BaMFYCN+xGxwOcYLQgtmwMx4D1pEL9zLknU6BvG6xuIwmJT?=
 =?us-ascii?Q?32kpEAXcVRSH56jWAGXE2WSg+0kBIDNPNvMWUWCDlb2CBRqX2OHmgFPujzTy?=
 =?us-ascii?Q?Mi3Py2/qkwAIQHrpG14JaRBI9Y1Xb35LVcaSet0YDEmc3bKs1SVHtW5fGpst?=
 =?us-ascii?Q?nZHGFVpSac2YkRmHowfqxS4+7V7UgAe7yK5L2ETE7mHoOVp8vDACRzOWyT+k?=
 =?us-ascii?Q?4rfqK0fb9AmxJ5r36yK2PrPK7uELfaiiCjgA5PR+zhuMKwHZ5dHY0nlgtqGt?=
 =?us-ascii?Q?xHCTN+nApLWymgE2vaZpfeERSrdquuBsdX3C/2oG6KUmUc1zG2AIM9cWGL1Z?=
 =?us-ascii?Q?Jf7t0oAYSH2quwY9dUprGM5nM67vDbK90tnEi1NlP27aeBJlx/FCF27h2gCA?=
 =?us-ascii?Q?aO6Cx8MaW1QaCt9JFKiSMeCWtl3b2H01We7begnOe96ArG8E7LfZBFi5ig5M?=
 =?us-ascii?Q?oJJhfsBj7mDJ3xjQ71frpVlJyEkvScP6phlBeda6+1nsO3dlwFbdd9zpYA0M?=
 =?us-ascii?Q?WGrNfiZdHx7BF2ouyGKlVVDHc4GHbM/KN5oJOePJv59g1koYOXdhzAVdSQt8?=
 =?us-ascii?Q?K/dxwUTSAKkw8WrDF+AWwUcQTjwgVT3QcwS266yX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1eb29c2-f28c-4fb5-ea39-08dd9ed0a932
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 16:48:38.7923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nS4SgrjWegf3nJLa6s9DIGQeO6PkyisiNPkiDWAccEuns/QvQoA1tSgBLnJjoEyct+JLUqOs+w24hhnln4S8ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7414
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

Convert himax,hx8357d.txt to yaml format.

Additional changes:
- add spi parent node in examples.
- ref to spi-peripheral-props.yaml.
- change himax,hx8357a to himax,hx8357 to align driver and existed dts.
- add himax,hx8369a and fallback to himax,hx8369.
- allow gpios-reset, spi-cpha and spi-cpol to align existed dts.
- add im-gpios for interface selections.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/display/himax,hx8357.yaml        | 77 +++++++++++++++++++
 .../bindings/display/himax,hx8357d.txt        | 26 -------
 2 files changed, 77 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/himax,hx8357.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/himax,hx8357d.txt

diff --git a/Documentation/devicetree/bindings/display/himax,hx8357.yaml b/Documentation/devicetree/bindings/display/himax,hx8357.yaml
new file mode 100644
index 0000000000000..b5e1f77c11102
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/himax,hx8357.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/himax,hx8357.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HX8357D display panel
+
+description:
+  Display panels using a Himax HX8357D controller in SPI
+  mode, such as the Adafruit 3.5" TFT for Raspberry Pi.
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - adafruit,yx350hv15
+              - himax,hx8357b
+          - const: himax,hx8357
+      - items:
+          - enum:
+              - himax,hx8369a
+          - const: himax,hx8369
+
+  reg:
+    maxItems: 1
+
+  dc-gpios:
+    maxItems: 1
+    description: D/C pin
+
+  rotation:
+    enum: [0, 90, 180, 270]
+
+  backlight:
+    description:
+      phandle of the backlight device attached to the panel
+
+  im-gpios:
+    maxItems: 3
+
+  gpios-reset: true
+
+  spi-cpha: true
+
+  spi-cpol: true
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "adafruit,yx350hv15", "himax,hx8357";
+            reg = <0>;
+            spi-max-frequency = <32000000>;
+            dc-gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
+            rotation = <90>;
+            backlight = <&backlight>;
+       };
+    };
diff --git a/Documentation/devicetree/bindings/display/himax,hx8357d.txt b/Documentation/devicetree/bindings/display/himax,hx8357d.txt
deleted file mode 100644
index e641f664763d3..0000000000000
--- a/Documentation/devicetree/bindings/display/himax,hx8357d.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Himax HX8357D display panels
-
-This binding is for display panels using a Himax HX8357D controller in SPI
-mode, such as the Adafruit 3.5" TFT for Raspberry Pi.
-
-Required properties:
-- compatible:	"adafruit,yx350hv15", "himax,hx8357d"
-- dc-gpios:	D/C pin
-- reg:		address of the panel on the SPI bus
-
-The node for this driver must be a child node of a SPI controller, hence
-all mandatory properties described in ../spi/spi-bus.txt must be specified.
-
-Optional properties:
-- rotation:	panel rotation in degrees counter clockwise (0,90,180,270)
-- backlight:	phandle of the backlight device attached to the panel
-
-Example:
-	display@0{
-		compatible = "adafruit,yx350hv15", "himax,hx8357d";
-		reg = <0>;
-		spi-max-frequency = <32000000>;
-		dc-gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
-		rotation = <90>;
-		backlight = <&backlight>;
-	};
-- 
2.34.1

