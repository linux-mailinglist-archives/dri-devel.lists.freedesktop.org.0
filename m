Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C5FB0A3DC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 14:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BA410E99D;
	Fri, 18 Jul 2025 12:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="oMoZeRCd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013053.outbound.protection.outlook.com [40.107.159.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEF010E93D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 10:13:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tu+ePonilIp1LNXSGZprromrE7h5UkWfBha9AKwQGASe02R03YHdwsqSsSG1ShjtlmzTkM10O5JZhN7hHBhBWGdbuvCSXVirUmpyazrWYu1NP889lA9+2oVQe7i1xM2w1DbrUtFjvaV5BAOeCRZwit30MlRHS7mKgkuLeeI0WvsAqXKKO+HvZe6ZJ9G5LS/XjBkbNorQHN3Gy+1ytL5PZbsEuhMm4NyYgHnMSkYx9XWQPXLnUsfHtj/9ENjcV/jo5K0SoSZP7TButWskRXC1tjIsuMuWggQL4c+CjFn6peSSERqKdw7Xz5plJSuF7H8hlp66m0u9id/XB78DuLCqlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eF7RZ9fYwHoUPEJVK0rpvba2B2ZwCFmJEhIvosZOjTM=;
 b=FW94u9yGwYzjYLVuhFItPbj8zjgaBmTALvfYR8GIndEeKN4KNGfTzux5iNyJWb6b0vIJUUV40C5weipvFjNSslKwrcB4mQ4C99JT2HNkplr8mTJK0nEBbFCPVAHBv0m3bXCI5w+6k6dWWa6Mmp4VNfRWInwEYyyBqY+exTi9ql1YcOO0jWJWO2/pGtkD3VKbN/DqgiYR+RvBdQR1OPm2wth8ijUgUiufFh9plYcd/lcAwSGOJMsh57nDiO5poqrgOpv1jWcd6qqilVmwrzac2Z+toezerm4f+BrdRYGly1hENjdL2FMG9yfwO4Rhr2WmN4nxQSQnyOjXZDkzMRdXNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eF7RZ9fYwHoUPEJVK0rpvba2B2ZwCFmJEhIvosZOjTM=;
 b=oMoZeRCdDsj9l2nUjqGBb1FIT61w9Nlk3mxkltYy5kBuEoo2So5jHDeBYuH7Ks7QWt9oGXZse+YRyTCzQKau3GwRrIE3ceW4fVXe8kwdicvMm84PhpXmZzr+O94q6+rSZEOJF5roT05phgod09WRG//oP2/70Q3Ear0eVzxTSL9BbV8diZVTLywLnlWE7j6x7UwNesnKjdknl8YGt4npRGfaBGAEpQyKt56uEyRdm1OCgDkMrix9SVPLxBRshZCFWmAUDPxx/pgAYPCtLkae0UjrplchMuAQRAY5XedxRU5/BSJAZqV/1vpT2rt5dubCFNAw6ovwSkXAc5XvC3QPQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AS8PR04MB8738.eurprd04.prod.outlook.com (2603:10a6:20b:42b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.24; Fri, 18 Jul
 2025 10:12:56 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8943.024; Fri, 18 Jul 2025
 10:12:56 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com
Subject: [PATCH 3/4] dt-bindings: display: imx: add binding for i.MX8MP HDMI
 PAI
Date: Fri, 18 Jul 2025 18:11:49 +0800
Message-Id: <20250718101150.3681002-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::19) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AS8PR04MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: 98773167-91e0-489b-a76a-08ddc5e3aa68
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+i7JHpgx0RdUoCyXMxLr9Jo/YvtmbdgQU76R2bemgxTIMeQZrAIFkNc5Q7AN?=
 =?us-ascii?Q?DJSxeKpAelRB5SB2A/UXhKfz/AYQmeyZn9HMTOrUdqrGmsRIl7BfQnErdqSc?=
 =?us-ascii?Q?HXNzNDKDh/b1iYbLrDfmbrMB1gSxmi8vG9rmLbVt0kvbx5Hnj2pfu4qmCvBu?=
 =?us-ascii?Q?XREeSOQnxzf38TOf4aeqcSCh4OZk5d3uRfyqZDxI5ncnbfYu8HHFU1FBgfz4?=
 =?us-ascii?Q?0foNPILSbcauKzotAz1/E9WC/19sxLnkcE+cyy5HUgHzoxsZm2wU6SI3Ml9X?=
 =?us-ascii?Q?7DndsIEMc8mEFDraNXY20kQx38Ii5E96I/2CjvP86SOYrlch5uoeeoRTNLwH?=
 =?us-ascii?Q?YapfjxMiVzvExqxB0fQ1208g79v4rVAszpFcf9vCCNfpmcejzUMP3ZR1Voxk?=
 =?us-ascii?Q?9eSqmPoNQh0X9m8fLYu07ddk7XKJGFw2lfpJ76tgEqhFSZLsdLxugC9N6eqE?=
 =?us-ascii?Q?23zpzVStIUbFb0wuE5HWFLKuA/lgUo84CThObloCYevdFVFa3XqIFAVohb4x?=
 =?us-ascii?Q?/ErRUg0XU6NZQF8RTeUDSXRqKX1GHRgeeQDTVAztUcradlvk3JzC2oqOFudX?=
 =?us-ascii?Q?9O3Z/0g9O9jnOBFPO+ZwZmUIKA2Aym+8KSXud5wA8PZfsSVBFWdoKHZ5XfKm?=
 =?us-ascii?Q?PWuVEyHLr//8azWUqR4nCS/zkE3aSW3hQo7LkdMn4FHla1wBQ2aEofTD3l2A?=
 =?us-ascii?Q?vmqtTUMQgx6MuIbJeJj0+p0nVYDVnhgbaNH5K2O09hQkhowG1TGeOQ/2yiGz?=
 =?us-ascii?Q?HWDRJQFmY473IV8qShpNGyqEC7FsYTJGXWHps0yNw9kUvZnReQ/aSgA5QTRI?=
 =?us-ascii?Q?nxlN6I1qOBCfzxClsg9no4pDL8K41XgnyajlF/57pEy0U3Zo0IjIzuD7Pvll?=
 =?us-ascii?Q?aVFS5lZhxJPkRc+vgvb7bl+W9JIQzyPwHLZbVt++bc6tsjMD5LhIc4SZcjQe?=
 =?us-ascii?Q?Qwaju/9BP2c+kApwY5ldrkQCbLWi//GNaHMbWyoM+HBmiBmRIltVbGS+owdY?=
 =?us-ascii?Q?KsDIwcnbieAUIbv7YjYr1W+9qF7f47p1rDk3S1ahBTnhKBDXoFFyJ1q3TPFi?=
 =?us-ascii?Q?0SZPyfE/6xqlreZwbfRJxLHIdvdTTfHEteAUXt5/Fs2FfFP/NamHIqze4HLy?=
 =?us-ascii?Q?uYOhfgXuNHMvgRyVY3y6vHJJGD8xSCJ4qTewHlya7TgWP0/tFAQiDsoOtk0X?=
 =?us-ascii?Q?xs6cIuiRoxqtvoi61xCiTN1t/BSkJU6PtqHA6eJ6nTtcuGgHuEons8yam2wH?=
 =?us-ascii?Q?o8zbmHCDMHt+HCCM+IHqi/MEktnAyhlOvhJCawzoloB/zAtYJI+5j4I0wwd/?=
 =?us-ascii?Q?3qwfWELxrNsSkN6S7wAV7QWvcJI1SwhvR5qBtF0LOAkUgRwV1AesF+hlbreX?=
 =?us-ascii?Q?n4wv9FxIxIL7V4gJ0H/aLp18lD0GQzBsdqA2Usn5bhqk5e1HYw+z1Kd0g0N9?=
 =?us-ascii?Q?2u19xsP0bAc53oLsH4PfFtWywEpytfyv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nhCDFCDst43AWPpyRoDIdhhmcpRorx3OyBqFgW6tMm/EeyJamW9XHYlr3mcv?=
 =?us-ascii?Q?9+oY8gnWKnJMelWcFqYFp+NAz+Zt2nUMeGP8vS6N8g4XuvE7ngCXSIbUDrqU?=
 =?us-ascii?Q?VzbuKlk/Ezq2BK+4CjAS7Iv7EX9lfaqhm7P+QKe1DZi3QTz3wtjba2F7ilu2?=
 =?us-ascii?Q?YlsnSlhGZqcdzcbddruRcvR7FdwFKSG24Mp99FFefnE39xraU0dSJxa/2uCm?=
 =?us-ascii?Q?HXUtAP0jbyof3HJHeGnWEY++4tsBX6SZ4bSy8qdqBnyBrCw5YDo9fgdyKhjP?=
 =?us-ascii?Q?iyOj3q5he9V8V0ROXbPaaY9Ob7+N7RrEQmpKZNKYJ24pq2gJxCwf1hvsFroU?=
 =?us-ascii?Q?1sAfXnbd4rMBIWm1v2rAXSFLfg5YXpX5Bm2hF/+1XQmi+UoPAGk/22cl0UAF?=
 =?us-ascii?Q?Fc1Yg6vLFsYB28c2DilPK21xR+5qyjOIfYeGkGaVlhntU1HdNcZB/NYjiRkN?=
 =?us-ascii?Q?TCs52zlZdUU+RiIofEE13LCfC6uXOtNP7w+VLrBFw5MVAY9OqRSA31bzNtLw?=
 =?us-ascii?Q?Bjg9kxZ5cf3ngSPBIDHiBsKjQPwpyw0j7Jp6Wq9j17vu0BUd6LD8pMhVv0Wc?=
 =?us-ascii?Q?9fIwSoAZb1lY4vf6Sr2HE0yGvKQ3F8t5wKEP/y5enZzTHZyjGW4QwvbWWjlG?=
 =?us-ascii?Q?cwlU6Qmv87ZYyn1gefi1bHiRDFdM06bLPDZ9B8iFiOXKqtmDLRUTt2j9RxEp?=
 =?us-ascii?Q?OUwuwTO+WpPOuor8rXDj0Qq43FGztOqq7/AaNo5ANW9Lr/yUnvWt7fyhzxGu?=
 =?us-ascii?Q?azFXBLtv+EP3hquIufCv4LYErr2vb0NDwcsbOjudSGQ32ugbLcr3RjM8Movb?=
 =?us-ascii?Q?sF48DO0V7RisyP2Po95oDMOJPhsDBriY1ods/UhVXO11VlR0ig0Glso6MTQv?=
 =?us-ascii?Q?geRxcInRrzei4uOcRI6E9PVYajTG6Akp/dVGHttve3nBIgyW0CrBzgbnnMQC?=
 =?us-ascii?Q?Z2NsncVpM7oGIV/0be9rzD5YHyQIqd3l01bHVAcdw0W7VZuhlSvgWUhLEChl?=
 =?us-ascii?Q?vBD5FwXjOMBLLOX4xC41axfHLBvzFhx/Lzd+eviCnzDd+s5bI8jNQpwelD4B?=
 =?us-ascii?Q?fsEfjMvwwwks2ZzuE8SENTsNX6Un4YsGtVEm4Df6mfEVaRZkezpILWUrtIMz?=
 =?us-ascii?Q?zPySGJqPn6aE9LjdjO3ts3wg4V2pWF2P4mtluMEdK/LUWX2D1AdmUJqIOtUj?=
 =?us-ascii?Q?h28jE+/LmnbZWzOSUfxsGweSpZishxbzI1X521/8+nLG0E0h4JEh6qixpTO0?=
 =?us-ascii?Q?JhJhz/99MJYkORzuGCo/SJcMW25CgKH8bXxiJzLgTbZfM6M8tTcXsUXHpw0F?=
 =?us-ascii?Q?LN9aHP5EGc6Vcs5VYMjqLujl20AwcEjn2lgXF3NIVX5FysDvgIFbqAnBb8KD?=
 =?us-ascii?Q?B1GUO1PoDtgWbswXLFwDgLA2sSPXyNYmyFQyzXwd3m0oLglTVLASKR1xzUXG?=
 =?us-ascii?Q?bAwM7rJDx/OmcUXUykcKIBT74pKl+o2BNYuVrw2gtJA2Ml8aPCsVOr2Wx3bW?=
 =?us-ascii?Q?xYY2qg9d25/SoWyPUw88PC0bK7sMQz/zWuQ7w7+Q14e0lqREETyK64lpf+AD?=
 =?us-ascii?Q?+GsACBLOERmMDq+ee0U0Sx5ccifU9T7AHHiOhalI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98773167-91e0-489b-a76a-08ddc5e3aa68
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 10:12:56.5893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/byBVdUBlWTe9s5/OmibdRYz6XMZl3DdN2KBqqWgRwtjq8DcoKT13fq0PkRj1SLY5l0AB32OP+AMjrqNT+VeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8738
X-Mailman-Approved-At: Fri, 18 Jul 2025 12:09:10 +0000
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

Add binding for the i.MX8MP HDMI parallel Audio interface block.
As this port is linked to imx8mp-hdmi-tx, add port@2 in
fsl,imx8mp-hdmi-tx.yaml document.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 13 ++++
 .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 61 +++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
index 05442d437755..cf810b277557 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
@@ -49,9 +49,14 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         description: HDMI output port
 
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Parallel audio input port
+
     required:
       - port@0
       - port@1
+      - port@2
 
 required:
   - compatible
@@ -98,5 +103,13 @@ examples:
                     remote-endpoint = <&hdmi0_con>;
                 };
             };
+
+            port@2 {
+                reg = <2>;
+
+                endpoint {
+                    remote-endpoint = <&pai_to_hdmi_tx>;
+                };
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
new file mode 100644
index 000000000000..d2d723935032
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pai.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8MP HDMI Parallel Audio Interface
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
+
+description:
+  The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that acts as the
+  bridge between the Audio Subsystem to the HDMI TX Controller.
+
+properties:
+  compatible:
+    const: fsl,imx8mp-hdmi-pai
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Output to the HDMI TX controller.
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/imx8mp-power.h>
+
+    hdmi@32fc4800 {
+        compatible = "fsl,imx8mp-hdmi-pai";
+        reg = <0x32fc4800 0x800>;
+        interrupt-parent = <&irqsteer_hdmi>;
+        interrupts = <14>;
+        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
+
+        port {
+
+            pai_to_hdmi_tx: endpoint {
+                remote-endpoint = <&hdmi_tx_from_pai>;
+            };
+        };
+    };
-- 
2.34.1

