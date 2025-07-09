Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BB1AFE8D2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 14:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224B310E7CB;
	Wed,  9 Jul 2025 12:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VMMwo08z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012011.outbound.protection.outlook.com [52.101.71.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A9010E7CA
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 12:24:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQkUORacFcTUSvo8EzwDCDjIlemNVhfKItqvl+zsb6ElizlkdUC77AcWx9nn90J1v9pvXeMNP0eHuc9ykEMY4fFp8p8bJk4lnxyzCEx1zJK0QT9xp60ozFAEOiYHuRQbuXF3CjnG5k+ktq4ZrN94Fnq4wjrs33WG8ZcvsU7b47TfbqLqmB8P2EJXZHmd4/oHCUCdEKNYxlVK9y5faoDOwwLYCdsALNgm0KzorHzKgUtIG5yxXoG2sUdgu8ATrxCkRtEpqz2D1EQFCcztWvMMJzD58pwsNhDixHFaTiCKrTHTyImqdZdZjQPjcninM/XNWc21UAMiLj5Yz/CFkodopA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbrsFSKCCzkZLQ1rIRI2KvWSwLAy9f4cQ0/K1APDBTo=;
 b=WQMa68EpBARPcjjM72HzuuzFUNV8waYD6xH/sAQvVP/O7OjKlIrIWLoZbq3U51+fO7SqVZ9Q1fcnrsgSJWhwM3yZuMGedp/z2sRV5IbfSEpGDAGULH9X757zoTuBui+UNe9e6ydr3gMQVwM0528eU2KW1NrF1ZbQU6hl9V6NZyqOCKsoqhiqPKyPYWZ1Xca0tXQlj3YMhwcS7Rasumz0JrPnVwQ2k0rDpci0mHd/hFk45houWlB5dqd+H4g4XN1vur2GFX+cft3BH/R/Po9D7zXSP4b00OYzIE+3qoZMMe5RrZQGXXqEI+FHScteRWvMrFmrPSpqFXOzEM8cpygMqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbrsFSKCCzkZLQ1rIRI2KvWSwLAy9f4cQ0/K1APDBTo=;
 b=VMMwo08z4YmDE7+YSIyFWA8AwMC9xSQc26/wlBKMtMGyH8lPa/rU2cKk83B5PjVHPJuouI8vfej1b6d0j3LkkWuHUvB3aOEFBVAivoXzCTDbgMnBtxyLUePRI/x5/F5DiDUvncsDCGuQ0hoGZs7UyQaK9XwQbsWpTVOSp6C7+d2PNhZuelq5Dy1bP0G8ozzb6R/dYSfnV96mV6DmLplR3S8GB71FoSCDsnwchHRyf3GsPzguxppnC8CW91EvoROIqVEiwkoCk3PHmDcrf0xk8XJ7639T5ozxiSbh9W3lVgHPq1tuR7y1OWY4zElCNUVquVo73EoThUYHb3a9k/7K3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by VI0PR04MB10712.eurprd04.prod.outlook.com (2603:10a6:800:261::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 12:24:37 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8901.021; Wed, 9 Jul 2025
 12:24:37 +0000
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] dt-bindings: display: imx: Add bindings for i.MX94 DCIF
Date: Wed,  9 Jul 2025 15:23:24 +0300
Message-Id: <20250709122332.2874632-6-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
References: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::13) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|VI0PR04MB10712:EE_
X-MS-Office365-Filtering-Correlation-Id: a0f24826-a84e-4b73-91b7-08ddbee39212
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tO95knyx1Yh66P1Zr9EfrWIqMVHr0zV+jN1T0WwUSTINujGPu5DoAaIr8aDk?=
 =?us-ascii?Q?vl0TCeyxWyXZyf7teBu0UgBQ9DufJwMpFmNtWLYELwcugheYzL9YK3ZB8t7a?=
 =?us-ascii?Q?jrg/UO5zQYbdVSbGuCc75r8leuAMm8eHulQdstnKRPwJiI5AwOWGZuK0tTD5?=
 =?us-ascii?Q?eqlXlAjgppQdH9G+yRskNy5xf0xWXALZxgALOGNLjlewQfiRsciKl7dUI01Z?=
 =?us-ascii?Q?Q6gms7sxoWHCWAz/Ao3WizlOfPQTdjAoj76SyYwSpe7hIyiStBXKHuibsmgb?=
 =?us-ascii?Q?a1sWpViEFHORXbPm+GsSbc954v/0u8sSxksLL1qmDG0ErWlfJ1KN4xnsz4v0?=
 =?us-ascii?Q?K2IheTXHC4LD7WYt88HvZT+hMJeMjQvQdoo5LpKJNtRS9dzlZkM2WGQK3U3e?=
 =?us-ascii?Q?EZutAWg9ecfp/LpmZxlt7c7ZZxh8ut7OckAzLTr/wLPUJo+8SM34iWxEw+Ij?=
 =?us-ascii?Q?YiChApy1ZIbv0a5Blr9llhhMIR03w1kiyjS9kDw3W6fa35slh1kPrYHqf3Pk?=
 =?us-ascii?Q?VLoFSEreaWhVidE/e6VM+LG6WbvfcCNP8eo4CH938z3dkl6MfhDXutkzNpYU?=
 =?us-ascii?Q?/1btes8rt9Xu7mWt1/20uWK8NKlE3sOf7Q6E6CiK5Jj/FdbVmGzbapYGOmEl?=
 =?us-ascii?Q?0/AOyJztFpfFSJ61ZkaaA7zYssOu5NwBEQYBvFYVTvwd+YHpZWvde+9jwx53?=
 =?us-ascii?Q?IV7XxYujoQUsbD11virFRYOCgoNSlih7Nnl8jWI3GSRWRG3pg6zUEm8LTZKZ?=
 =?us-ascii?Q?0eedIXk5gBr32E0iPXtwiCJVdmdP9Ec7AM7AJyMAGLJMKPqOxe65WwquZSJ5?=
 =?us-ascii?Q?GMR2+3VPzx82Q7RFIb1djMSgL24vmxaAPec2bsCqAFDkdPEFkRiJnqZTAywg?=
 =?us-ascii?Q?9nKVcE7Sf/vpNDxbogtEPg2RRQj6Ydj06kQuiM1jUJ/b4Dir90KpwXjJoNPV?=
 =?us-ascii?Q?2LEWVXHyzQXcArfQO4Dq/+N5sNM2NJH+0E62GhMEw0ApZwOyi6a/CrHztX3x?=
 =?us-ascii?Q?bZ5myqEOVQnGDf9raKKQ8ma4y7Enc7HLY+lKuDaFWjIrjnryYBCOqgh+w59f?=
 =?us-ascii?Q?1Elo+SfEfRZoREHsxdXI8xN/wve5IcYULJrjFqHQxgH1sqoOWj56R5Pp9q9i?=
 =?us-ascii?Q?xuBr/hDYzhSOOO3mUpnOPCjwgly4Klhwwgr/n9zxx7swsUFomM5GzJCui1TX?=
 =?us-ascii?Q?w8+x0Q1NnlafAYkQdcovEHgngvgVRN9oKcS54gqqIqm8kYJFGJYkkfaosrqW?=
 =?us-ascii?Q?aLpLutubyO6sTYAaYBAMs1ZLcsoWPWjnKscheby/Iv3hw0kppNCJUf9aBZo4?=
 =?us-ascii?Q?jqOCYoyGVpfmEKxBprbAdR2u0NlIwYuwiZsD+avyKagtSgs6Hqduin+3PB9l?=
 =?us-ascii?Q?03hf3x/b/aOP5yRsEW9a1RtPfactOAN4udJy1/t0oFlMVfhSIYMmn5O4mJ6z?=
 =?us-ascii?Q?Hd31vbUDLbo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LdTdbOgGP5s6RfuY2FOiB4LGcQPd06LHx1pdsppk7TJQj4WhxEn1VxK9ov88?=
 =?us-ascii?Q?tSOu7WYNkC8UIcByzgz2IJXPCOvIFX/P1P3pEvfsrJW5q/ShpBGCac5vZQ5S?=
 =?us-ascii?Q?sH546aETobN3Y1oU19axwBB01VcIO6b7FcN0BQmfhnHrNl+NFo2PNbBIBFCl?=
 =?us-ascii?Q?3yBU56ILn6zubTS7CHhFdpi9k2qJ69YXbshH59XBL1jDSkS0ExQv7vhYmtAg?=
 =?us-ascii?Q?VtJboB5kL9WNZ0L0+xHiTiTV9gpsWak5EhUTbKotqX1OmbGqHXt9TfTOg3TT?=
 =?us-ascii?Q?SCmMDQXfVHCsBDWbV/6TpEhXe31fDQzmvkf4uCAdvpUGfcNBw1UYH3MUp3vf?=
 =?us-ascii?Q?MIQESI/AhufjFAW8dKXigyAjr0UJ0Lg6mGXMqPthX7ScoApudWOh/bPqzIFp?=
 =?us-ascii?Q?3xhbVpSlQotUjt2rYBs4xzS3m0P97mvIv3sNVLceXpthMp6NktYydfOOSNRW?=
 =?us-ascii?Q?9dLiYV0EfzUJ39MEW9s0HirIeo2e5K520Q+Tvgl2+XebL340s9Ls41wwaKHo?=
 =?us-ascii?Q?r6IGbZ2MEaFmTtXNMlYXUY3vAWcs/h4/nTKVDpfhI5EvuX09TYdKuh+wesJy?=
 =?us-ascii?Q?XgAP984A7sg0l6CNXCVxHgqmE3rwwBlQrrTcpl3n8ECK9daHeA0fR9J/v3eC?=
 =?us-ascii?Q?CabKYsx1gx68rny9t+/qGmsh+doduX9/8fd97pzOhGuBG4WLTd/VNE2Zjtl4?=
 =?us-ascii?Q?XVuNU6/vMOGjSzcBPs19hIffJXw4H832kMk5E2xul4sqZdYol+z4Sp6BcjTG?=
 =?us-ascii?Q?bbGti2n/Rv0tKgd2LrbgrtnKmQCWAke3Q/1r9Ks0NmL2dvUm/8HhOPQIzem7?=
 =?us-ascii?Q?qLVJqh+ZDWPVF2knLEUpe0MaVKlexd/GA5b2d8rCHyUEwRhhej42wS/4ik2p?=
 =?us-ascii?Q?ng6dgyyU1j36kRwV25ECkFG7zOcot16SitUikufnl77/2thpOORdPd71SEb+?=
 =?us-ascii?Q?rjf5uyReZbIRp31IDlKKqBTuEjnHM3iyOjllJsY1PqK/URgVVmZ+LVBZMMyv?=
 =?us-ascii?Q?byYcqavnQtyi4fzy1SQYlDfDukLVfv0fcOfUjEAuDrUAHu3ynCQ/eOD/XXPh?=
 =?us-ascii?Q?tpDFKFTJz3ABICeaOJRn6IVL8enV9yMBLz6uOKDPghToX5N7RfHtyZ/95RcK?=
 =?us-ascii?Q?JqWQkSNd8l/nZErM4nftAWxyKN1O3wK1bJvItkUZNmTsadOQA7ZbxTfooeyn?=
 =?us-ascii?Q?dTaW3phVlPvDxEZr8csMkJrc9WkrCW2ejTzwghKPz14Hruufni7xB7pZLgbe?=
 =?us-ascii?Q?RUCpy+4VHPmV1u8nAPfF6wpPORbLhsIwmGe0shd6/YGY58k2hoqbEyKhpcYw?=
 =?us-ascii?Q?KfruOVZnQvZcGKc9+CU0XzCDoQT/l0pRyZVUcLV9FXe9/N6CRg/yhheu9jgN?=
 =?us-ascii?Q?10yfoB8QERU4/8kAQTitjFd+caAIoV2dQnALoJqRf7oPmzwAh7eRCNRVe3vb?=
 =?us-ascii?Q?oLPpRJLARvBMAsMvSpHyDq+CR3RShkyIf0dghLrWo8TY5E6JidanQCXT0/3e?=
 =?us-ascii?Q?jNkqB7DJHL9jhr+IjdNNGq0U1j2PLj7EGZIlkcy3ILZ44yfNRbU5pGmHZiNd?=
 =?us-ascii?Q?N/zmlqkf0GRfQKyiFo8guXOTcOfcnwf2uXraumOwTSP/cEmmNrG96+6Lw/H/?=
 =?us-ascii?Q?wQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f24826-a84e-4b73-91b7-08ddbee39212
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 12:24:37.6545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: McnvvkLyFzEcCxiHKy8yYss/M1wgd9lF9A7VQXi3S6YJGtJ1rF/qvor16pt+46hX9cQcW4fiK+HNOQwvxUSkbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10712
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
 .../bindings/display/imx/nxp,imx94-dcif.yaml  | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
new file mode 100644
index 0000000000000..e4cab43c77ebc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
@@ -0,0 +1,101 @@
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
+  assigned-clocks:
+    description: Reference to DISPLAYMIX CSR clock mux.
+    maxItems: 1
+
+  assigned-clock-parents:
+    description: Parent of the clock mux.
+    maxItems: 1
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
2.46.1

