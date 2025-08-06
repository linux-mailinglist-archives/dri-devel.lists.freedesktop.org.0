Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFB9B1C839
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 17:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E7310E799;
	Wed,  6 Aug 2025 15:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nWbLYhC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011069.outbound.protection.outlook.com [52.101.70.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F09410E796
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 15:05:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chqTvtBi4eMOv/39LnbWbt6NwhVwjE8GYfUCgNR5OeZcUgqCIYDjdLDG12IhxInpJNKwfSUDdHbP4uW5UwF7j6ZdbCkrh+Z/TSlktPk17U6vA+WZVvL/mxNxG5IcuBQgzWgg57LEQxoXxZ+Ijj98DMVAGgjnSz/cKvcGLp625ZeWeOOajtaufSozeiuEFGumix+U3VKvA1q4umLUy6XSJc0st8N8KiRdSkj1/yWnxHP9F949DQjQYqHrE2S2P6dVUXKPKBlT19yUr3a0dHsnaRHrxjtQEr2cMwiv1X77k6llcooGA+wTJI7JHXjrW0ahCWDlpG0XwHgqC6FS52LsAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvNJvdnuYL6rjw5LY0fKwamRArZ8aIt0mEWbFpknP+o=;
 b=kexWO+pT9yAHarRKbHpY7AdO0C6W49ki+DlnwJF6U2eJJRCCy1Clpxv42Asn6wY6jwOebjjYc/qo1UR1MBjZ9fntlCp1ci4FHCsKAgdUYL9UOdaDxtD1aPcTxHbH2rEhz7Xf2EX1V1k5opwXlgo6xEkDTe1eTwGYSaF9/14pXVNKClfLZj55zLwW1yQx6b2JBv9vl54HT4a0ILm2UCMm+/lBmE0fCPXKfjIKUtDCncOI8g/vEB154GfscKfQC2yjiYT92lkmfqtr5LLoGZNXCkM6GyhaQ+D3XuxutPadyLCRK+GxYy3K2agtoUhD4b0l+uhG4+cy05KO8Tip4DgiWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvNJvdnuYL6rjw5LY0fKwamRArZ8aIt0mEWbFpknP+o=;
 b=nWbLYhC5/XGBeUf6OJn5VVAy73Yz4NzWZfUiEmVapAjl5NjIjKAX2e6tkEawmN/yzv4b27+nYRtq/prTlCIOIESc0b6dvnQee6Dq8NknCr3kt37EJ/tzjIz49/Ra1BoxlgrmzWnrTHR4w3gowoGm02IUt06uT6T0Uax5bVieEcAsqRKsbN7DPErmZonGnMxfC6pyG6Py6E539OAUSsFVbJOtUED4fqS+NJhxnPBW5yv8mThK0g3n7Bnaqz2kycKJP7NTTMNXCgD5L/YfdTImhUmmOTYEBKjV7hWfZIHzrD2ADv0a9WB59VW4RJY/sHhWC/rnL0HzHhsNvyzRRRoGXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by AS1PR04MB9429.eurprd04.prod.outlook.com (2603:10a6:20b:4db::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Wed, 6 Aug
 2025 15:05:46 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 15:05:46 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <frank.li@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/9] dt-bindings: display: imx: Add bindings for i.MX94 DCIF
Date: Wed,  6 Aug 2025 18:05:11 +0300
Message-Id: <20250806150521.2174797-5-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
References: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0021.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::31) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|AS1PR04MB9429:EE_
X-MS-Office365-Filtering-Correlation-Id: b6254cd5-46cd-4664-0a11-08ddd4fab8a5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q384nsAkmqVkakKVMSbf5UZ/KPm4HyZJCiZW2HhH64GZiaqGgP6f28uVkPOt?=
 =?us-ascii?Q?KkQNLtNtMGF+KPyszvGItznBaCXH6eUIoAEajhvQXiA7OqS4rqlgoI+wEilW?=
 =?us-ascii?Q?X6+FwylKH9PkfnLcAL4cFPMREYRj7VTdNZAXScI1FyanfHeJHRm2LSsun9+F?=
 =?us-ascii?Q?lpPGaVQVuY5KmTF3fXpF9o6bm/r8fV1WiufVXpOBW+029Bn9eIih3viG9PsQ?=
 =?us-ascii?Q?/1nYrc1oZhb6MA/dGCsSI25ocBxwrqjP2iJOAXZ8td+Ak3NeFYJ0GEy6iRwi?=
 =?us-ascii?Q?1/iQJSjMQGOx45wl7zOTLjSZrCV88KrrRVm/fNEA5xW6Q6eKEpVIZE3eSkdc?=
 =?us-ascii?Q?HyCSaOxihMYPu++1CtFLZGyPzg9X3qiorx87Cr4vjjBGsR5LAWAWeZ4CXLQd?=
 =?us-ascii?Q?8KOi3r2WC0YDKP68qlRfG1LP6Pi59PevIqfjAewiEwKJFcJ8D7Xyk3WXJu74?=
 =?us-ascii?Q?HAfVONVkIDqeuy2c8GUNZMYbaSmdlUsXo+jCi/o1YQU8YFpPN7RH0AaMK9zm?=
 =?us-ascii?Q?Q+gms1wIKMjm5LpfSGUcSsVFI+5AVsxnfXRWm8WWNoXipbQ3fWTTyAUL8hu+?=
 =?us-ascii?Q?4QSFSdFP2zzYlM3O16QL3zgSrYtttbCTlTMC9s6j27mDxee17KjLIcYDGudM?=
 =?us-ascii?Q?SWCB84ocgdlrP1jMK+5kiP4bKh5w7ntOCVyWF3wa/W+V1xkQg2+xuIfwa86a?=
 =?us-ascii?Q?u2yu9yzws2EJ1f98bEloNfpgRUGAuwQUGt0JvfX3q7YT7qFQlOCRHDKAiNRD?=
 =?us-ascii?Q?MM5/Jc1IRdqhzTYn4OQ7QXd61LWoTWjk+vvGXRgmUwzo8BmwGHxBM49KiT7v?=
 =?us-ascii?Q?TlUvuMiQNOwx/ym4jO33e2/AE3q6hnsdnShKRJ/uxJR/nDeijbTpe0Taavw7?=
 =?us-ascii?Q?luLr93T3s/BizdCXtS/+viWR3Hy9h6UsPCRoSTeSpqi0zB0gSxR3TC/U1CJ1?=
 =?us-ascii?Q?LWloPXE6kSVSYWL4anuiOe4HKhq6Pw2mbcTN/JAd/iPM06czjGDxuStAhzBA?=
 =?us-ascii?Q?ObfjiqkzxR0ZXp+s9vmRZrg4KZOu2j2agkdgGfSlZGgt+tkXavxvrJ9s4aRs?=
 =?us-ascii?Q?WTllLy61UJk24bLkIib/ciV7dB6lsd27qkM/Vn7UTfkOeUoPugWlNHyGGZ9f?=
 =?us-ascii?Q?fWDpH/zI1QjBVeMqldVUqrlfQ9pxLdqTbypT51TgjsnEQW+gdyI8Pk1YdIl5?=
 =?us-ascii?Q?egNRUniE2jehHArjT6pH6/OfM5+1xY1XJW4eef8EJBFz2nQurIKxpzgSZRpA?=
 =?us-ascii?Q?69PClSksdtnA4GEpFkh+/pyR5QHDNBgFi43AelP0IAfJoESbs2VsChwGa2KR?=
 =?us-ascii?Q?i27V6kGjabPTBqLHHjBWQ+7ASor3qUf6l2BRjmLdAAjiEl3VGvIwhVs+uujs?=
 =?us-ascii?Q?bBi96Uf/fuzEqDKoF7Pl9z7BNjJZ6w559xMuPmwd3sSfZxNHACYhOLGhBM8M?=
 =?us-ascii?Q?D/RaWfvQnEg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YWu6zgIojgUpgiLJB75dPGYxQ/s6NnOieFydjogAlW/K9bsRk9BzaEnjbGB2?=
 =?us-ascii?Q?cA5doB+v/V8E952YH7yu82/DNX+WFi/GAdEk6Mf7SfaLepFO+r8myNHZ3ysC?=
 =?us-ascii?Q?t/wcby0GNmVgAoVNi5TFwc3tYDsHEekb6zWzjP4qdcNbcgubGvWIuq1UPWru?=
 =?us-ascii?Q?x1HHRaixbRjhnUmIvjPWt6/VmNO7efiramlGCogPDV5CNj2asp7aSpmA7mQI?=
 =?us-ascii?Q?tOzc6luv9cFXFtz9LTIyz3NeQwWWa/SjOjpYgbOhfKd8cFK6+1FOXAsqtLbh?=
 =?us-ascii?Q?ZyjrW9nkvFSfUMrhl4OmB1HFNmyrFmEKQBez9Rk3C67AlAQmm/MxvVnWDe/z?=
 =?us-ascii?Q?QDRxJDcj/V6X45YU67Stj69LmS+i0XnbFLE49nONJTVUP2o1egvOPRz6ENSH?=
 =?us-ascii?Q?T38bOlq233AZ9OdUcReyBmtlJkc4YkZSPmPdeUsv2QIXfEiXHw+zCPv1cLAf?=
 =?us-ascii?Q?bwTaGi3xKCB8XVhHC8dP20wp54Ls9XnmFaT3YMMmISqoakXG1FT1ZHC9AucD?=
 =?us-ascii?Q?9Adq1MlyQ6DVHw/14ps3vfijbCSaI4/mCv/f4t7kUOSwXkcSLzX2pkeNxHQm?=
 =?us-ascii?Q?IULVqyqGAmjf4hH9y1ODJCjVvITEFXnbMUCTZ0tSTH+OS+ViIjQWjOoF945k?=
 =?us-ascii?Q?0pxaRTY85RHV8njBU+pybiYK82JwpiV3Yi37keFLwKywctZRwchxC38TTNBU?=
 =?us-ascii?Q?kKcw5tWeijmDMV3ED/P44yzZIiHlftkI3ljfPbGUQqe8eoWkf82/J22s8tTG?=
 =?us-ascii?Q?IuNaO1KPT4/X/PqYo1ILWaeCG+Tm4FUKxcwEH6bb5CtvGuJWj6KD5dd5zsz6?=
 =?us-ascii?Q?An0SoiOa51BYtLypsaomvnXDUMyqkVlMBh2A8smjMCEQPJh+oamDgyuFOT9E?=
 =?us-ascii?Q?Lb6vrKlt7yAvB7Bn0GmzPrKZHjTfriFFmvdRicHgIv/cVAuOhROEN3jqq2Qd?=
 =?us-ascii?Q?K2OONi+R14x5SOy9Pc5ZaaRkW774GcEwRHR4N3SNKuWKrVbNG/Q7T9gcrSM6?=
 =?us-ascii?Q?f2ZjWUbhSO0N0O7873GpBELlmiOX3KGsxYv+nhdFQtwrPvHAMICPmSzN0IIu?=
 =?us-ascii?Q?0VcNUOugGegelNwfgHHqH3A2rnb0N+1pfSqcmD4XFlL5amkcztJD64ej34l5?=
 =?us-ascii?Q?B6F3arutrEqE8qR5J+kO2fZ3ohinzNqAuaf6zn/huVoIgZEI5cSeRp9CF/s2?=
 =?us-ascii?Q?vFnsr3h6Dav297dhIZUTLuI03NGDl1O4EeOcMXM2QC0s3FE912o2P6ojGaIT?=
 =?us-ascii?Q?9WfITtAecf+HRZ55v5K3daLwW8THIpYf8/j143azy2+DcMNFv63mgJ0iwEin?=
 =?us-ascii?Q?ft0eexCrhazyw3MFNoSkv/EegceUJEAzUETkFSmATHcmFgQr2ezb48FR1SlT?=
 =?us-ascii?Q?8nt+RX+OUCpjkj9zTqCnpdFzgpBJeyqS4FB/u1PWcS2TRA4cjjafNcjO+ywq?=
 =?us-ascii?Q?i/r/n2rOv118pxvaT8WUamjo7K4JwAIA+K6lp4okL3TUO6Yogfyy+SrWUVIH?=
 =?us-ascii?Q?2nnQaJXKJUmD8DjidJ14pM52ZKGAxYc+vhEFSTjNUMk9017nY9I6wxyRF8z3?=
 =?us-ascii?Q?alyTuXzNznzFP8FdRrEtygCpWaEosFeJI/+ZEhjTLbpfbNFTNCl35FOVwHs7?=
 =?us-ascii?Q?Tg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6254cd5-46cd-4664-0a11-08ddd4fab8a5
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 15:05:46.4068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+LvZXE9zkHq+TIC23rgZIrKss9JtE6zGvOHN+B434EpTorIBfG4F7+2TeEDbcvGTMWIqPjsWaYLA55hFeTkjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9429
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
 .../bindings/display/imx/nxp,imx94-dcif.yaml  | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
new file mode 100644
index 0000000000000..54419c589ef74
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
@@ -0,0 +1,82 @@
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
+      - description: CPU domain 0 (controlled by common registers group).
+      - description: CPU domain 1 (controlled by background layer registers group).
+      - description: CPU domain 2 (controlled by foreground layer registers group).
+
+  interrupt-names:
+    items:
+      - const: common
+      - const: bg_layer
+      - const: fg_layer
+
+  clocks:
+    maxItems: 3
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
+
+            port {
+                dcif_out: endpoint {
+                    remote-endpoint = <&ldb_in>;
+                };
+            };
+        };
+    };
-- 
2.49.0

