Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F26969D8259
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAB210E3B3;
	Mon, 25 Nov 2024 09:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="T1w0GyYc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2043.outbound.protection.outlook.com [40.107.103.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18F510E3B3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:34:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLZyiyzPwuoUjVCjgn6pDjRhd6KB4W8PeauS/Mozy911CRRzEEaSPN7Z87y4oAbTLUvr7JpEFeu9fKel9aTGMOhri4S/xeK8hIlKLXiH9Kb1kGzaUfR0Ozf0R/mY6Jg4kgmazkd0/0Awf2UOejT4h7q1EGKRXvp5iajro1OMBTsnn7rucPRkPhb5GlFvt6qXfVBtGOCv/cbOVFwSoHbPhOIXySx3sp4TilButJ+gQNyvSKk9V2n+orOg/t+xl6UoJaTX3zZrnA6S1k8o9APtQoSKhftNc7lzxDAud+6+ZiS0XvHGSUOYaHmiPDv9kd+NiYheeBUJbTr3eprrJeXzfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAB7MCPKP2xoTyJesBIxICqSSRhrKqBvk3FTP+gVZr4=;
 b=ywazQdLTRzF6OPQICIG/HMhIANSpA7JQru++KskV6Tqpbcss8X9Y7Maj03ZaaSNg+kab//r8P/gy+O12YYXtWB/nusNgnD0HB5igDnRaON1+XVx42CDpDXSo2DiEiK37CmGSRxN80vFpJZFg8kAI17tnhA9CvLCJVa5O/XL/PXREq62qMiP3QWeTuyQdbq+/2ltK0w52416V8CYZj7wPc+Jyy32m9e++KO1cD3VpmPDtf9huHBElz2B8NVSf28wKHgypqxjPsfqGsEx9U3tT/RLD91SZTSuAi5NJSjtdg/D422BVbmAxI6TtwDJ3nsbBMQBXhd4QdmdWOcMt0vHYPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAB7MCPKP2xoTyJesBIxICqSSRhrKqBvk3FTP+gVZr4=;
 b=T1w0GyYcH7Z+vQN+l+R6lFr0AL49lsFWLAXqxc+sxFkTTwoCt1xhHs/MDiNtfC7ZkARtHAyRyi/kpyBHCD+o2Ggqw0jghpHH0wnSi5lTfPnCJwPUvwfcpc2cloX1fgP7Co/HEh55oQF6Xtgv5QGljcYg7fX6ygrtomITS+vet+yMJiypppMJGKgxGy6DsXYCqG15E5leubgsVnujfRtSWA4G1TM8Nhgt5ahMLacb3zwPgf3ty5AjzLVmxsVaz4wkT2IoGcsqWO+zGEhlprOJ3BreHdQb8l2vQJC4CK4CKpJRZzBT24lh68kIiTySFMUXwYNNOfp1sGHHts2sULciEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI2PR04MB10930.eurprd04.prod.outlook.com (2603:10a6:800:273::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 09:33:58 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 09:33:58 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org
Subject: [PATCH v4 07/19] dt-bindings: interrupt-controller: Add i.MX8qxp
 Display Controller interrupt controller
Date: Mon, 25 Nov 2024 17:33:04 +0800
Message-Id: <20241125093316.2357162-8-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125093316.2357162-1-victor.liu@nxp.com>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0131.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::35) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI2PR04MB10930:EE_
X-MS-Office365-Filtering-Correlation-Id: f6e503ab-0ffc-46a6-4ec1-08dd0d3449aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Nbzq1yhlBE1Df2QxLK928salwwf39XuVjt5u3+2Gv/HCIDYU6Fn76BDW2j3T?=
 =?us-ascii?Q?9gbBR2VWzeX+nEBuhE4Uzh3YTbrSWfLmheTKu6g/he399uhydldx2Rc5HqFR?=
 =?us-ascii?Q?s946/60sLpOyFQaMc76biOjElchH9+ZegwcNSEqyNj+vIhUCbthHxY9KXcyc?=
 =?us-ascii?Q?96Z5EDa7X6Hkdw/keuS/WYlLH99iBskimANhCvR1zdxmpXHO8mi6+qZ3MDMl?=
 =?us-ascii?Q?jmUh6p7qHFELZii5A0aXaTdnKxJwWsB8N9LOh+uWCA0H220rkyNCuuPfiWjZ?=
 =?us-ascii?Q?p5VSopTaEjoznVnjF5Q0ptsCgLg4vblW0dGgYlrbpxOieAA876TYIa2s0EzT?=
 =?us-ascii?Q?568F4XBl9bPWupXt6PpG/w0Egfav6FXy1A8upkHOggnNqUUodLDwkVk8xYXb?=
 =?us-ascii?Q?J8H+BALnuVGYe5RpJiejtIo8ctueLGAzdGa2ff8JXHQyEgieuufl17NwkcZD?=
 =?us-ascii?Q?ejTjb/I4jYg14SVpnPpJhSEca3tatg3UUsWt0UgIUth8g6XJxEaYYlmIHV6/?=
 =?us-ascii?Q?ZAMlRQOgdFk3qPY7FN8bf2xnVzqCdPJFNe/KldDQ+Al8NuJiGT4tC8xE6g97?=
 =?us-ascii?Q?1eoFPPczC4k8JKm5NP28m1Zeq8Nk1b4vz1dEXVWPVsbfAAtf/31Rm9N9Df9m?=
 =?us-ascii?Q?lTvM1GscPz8r04N/GFq4g5qfYECqRHliQIlow+z28qJDuUoUJEBbfuPQRCV0?=
 =?us-ascii?Q?WycMqaQQ5uo7p54hmZM2FQXTcKMyLyoU3Ue5szx9rNg0wy76FvRBO7cGrQEp?=
 =?us-ascii?Q?zVZW+tCFEoJeUzJ6NSOaTGqItil1L7W6VHdg1tSoQnLr2ym/N4jhBEfG5mvQ?=
 =?us-ascii?Q?qK/gEBTvQgK2fUainmPp27yZ6rDJeHPKy7862amWqeMY8XEgwsNLrP7U8jid?=
 =?us-ascii?Q?zS/psDX8KOwvBX/J8J2yZhAzW3XsTmGXYAtSYTXuGqBBNjYl6GE/KrON0M3g?=
 =?us-ascii?Q?qIx42TgfXzQ5xpsSLIQwx1/etgnsEnoGzumcxRwTpiCAvGAVHu5KICNzaqbo?=
 =?us-ascii?Q?PZqTKU5sIaZRdrgSWjbJbSucM/ZM3PiuFW3ZrI+RYNj45zBWCpD5OJVzA4Vk?=
 =?us-ascii?Q?JdaYN8Z7TqOxcPLl1AZs5s/CtD+8avRsGwZC2zjRV3ssYDqz5ZJ6n1nd4R+j?=
 =?us-ascii?Q?8rI/TGsBgSuGpRpcNS5qX/Get8Gqtmpkojw6WSK3lpd/2WN3OfNWtOwUN8Gu?=
 =?us-ascii?Q?AueK7FcMEu+MyhPK86K8LHki9riSZxOtQLXacfaD2YhX60PD6aXdFM0TRpvx?=
 =?us-ascii?Q?ogQlkk0yQmyE1s3r6QslGUdeSZNKg0tOq0jNv1VFmmERbnU2aoYton+cBVXj?=
 =?us-ascii?Q?W89Py2zyFECd1jRuluycY2I9/yMY9hKX2VRDs/27jVhXBCyHM3sfJPv95Zos?=
 =?us-ascii?Q?BSW2BVw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4bVj69/acvrMA0NlCcIPeUTtSzns6ItsL1DdwmDIjjsnAqaducsW3BOrI7a/?=
 =?us-ascii?Q?XdIMLBSwElkN/xeeB7QvImns/WX1iyBJbVIvVI258B460QMkhbGLjAuwfv8V?=
 =?us-ascii?Q?VJbLYyOvbOmx3Z87XSnQHLGd8uRiJydHFz+CHi2aqmwWiJMtAlweiC9Cz06c?=
 =?us-ascii?Q?SFWnL4efM54DciHbG4oCo1pjyJC1Z1Mbb9P8P4w8B+QAkByTD/i01vapa5t6?=
 =?us-ascii?Q?aglp4+vXsn4aWyGj5ErEoAPUOlcZxKe1+jzRofIMVBUQRdeBzgC7NfXKJweg?=
 =?us-ascii?Q?MLSwvx7q5a6HQIlQTA5jyVLUukJuSQxY9/aZiUw4RO9zfXs8QRex3jyX/CBz?=
 =?us-ascii?Q?WCJHu0f90lmE6QRUFBqMc1xFZr5Z7xhQFR5ELcMIJzPEQp4mCvCCYme9q6pu?=
 =?us-ascii?Q?ADfyN13TNP5/FTvVykwbtXjCJ3mRjxDQzUX/Jhfi9ZlRWNlrIRCSE39dbhK6?=
 =?us-ascii?Q?e2UWJRQhjptdJ0OF843kiFu+g3vpBpknwccZ9Kiq4U4xAVXAOEgxSdByi3go?=
 =?us-ascii?Q?rrBD7SVzHT0j9I/THNRb2lojsTkReuJD7czPutt5xKWGJKUPokq95TsS13GH?=
 =?us-ascii?Q?Pkv7oR9jp2PJFC77pCPGDo8WWL3m45yk/NCrUTjQ3J/mFX+buciVC3D0GSJW?=
 =?us-ascii?Q?RzvkbGWueDP5paPRb4o79jAJViOz6HoBGWxOM/PU21ql6lpZCB1EyDuiHg9n?=
 =?us-ascii?Q?mxZ3WGSBzNpJiwKEMGF8e2CvTGD5cUoqETE8TrTnA2DJDW7YhIXuxMRvkCSe?=
 =?us-ascii?Q?HELnq6aIzAMBcdwRw9jnDXgPAIXHGE35t/DbPyPYeEE3cneuqExDuWQolcKH?=
 =?us-ascii?Q?atLxQV6+bqt2w2t4H5Ny+Moqr4tx0avi4ih7SENzSgjHo0lbl1mPZfuXPH9F?=
 =?us-ascii?Q?ABLzLi19sYvg/llDmequWbMaWuDy5Ir3rOsgsA9t5IHijYn5nInjS0awP+Rr?=
 =?us-ascii?Q?o0EhfdQL9s0uq1A3ZLazvHZ7GMHwNxi9sxpP7VfO/rqdq0T4EGgj7n3NCSZD?=
 =?us-ascii?Q?7iG2du2oeb/itCouzU0TXWZ5os/QixvMroyD4vTX9l/PI/oNzSwFDCtPPAY5?=
 =?us-ascii?Q?eYispAU9My6kz6PL/HGZJZJd9ltzwmn09wmO/HDF+7/YOn6TlZCXD6UZM1sD?=
 =?us-ascii?Q?6+UW3HFn6YLCCw/zltYh8ws9LLOC4Px7XwcQE1jAyOZkbEVZR5WU0AKCDoDl?=
 =?us-ascii?Q?zCDyywTdtv/q5SsBzbIskSa03+pVZWGmf+p7320RJN/u3DjmkqJLi5IVh2GI?=
 =?us-ascii?Q?BZ3B0vLzq4TmfcXDK4gZOnomR5v/OHQeuNC9LSh4oswai4R9gyVy0KhDr+lr?=
 =?us-ascii?Q?Qd7LeV+aKtHT7V80564ADjzNiUZyRaew54HDs14B+IiacOrVspz/+jNfCOT7?=
 =?us-ascii?Q?jMlw9geJ7vAg8QAGMezgw0W5Mq4Xq9aYf9Bul1dQXFtN/GeyodqUrrPAFFlo?=
 =?us-ascii?Q?g3GwEmg4jShITbHAfVTmEYVb1quZn22P4pGz2L7SuFwBIhwibDMO19a0AdLv?=
 =?us-ascii?Q?4z69oR9EDdkPNYEP88NnBKbA8fysBeLeNMXzN69k1PqkQzi8gSnsacSP4Gy7?=
 =?us-ascii?Q?pbamna2UEBqIMepJz2T/SQDZV6SLQGEFtmAJ7YT0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e503ab-0ffc-46a6-4ec1-08dd0d3449aa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 09:33:58.4079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8IZOZ/89X9vWAJjUOvCd5mBPFKxWYXz/2rkhye0PZ9KYqCCTevyy9gaW2PT+C08xB1Mk0CeppkEQlOFk54Eqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10930
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

i.MX8qxp Display Controller has a built-in interrupt controller to support
Enable/Status/Preset/Clear interrupt bit.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v4:
* No change.

v3:
* Collect Rob's R-b tag.

v2:
* Drop unneeded "|". (Krzysztof)

 .../fsl,imx8qxp-dc-intc.yaml                  | 318 ++++++++++++++++++
 1 file changed, 318 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml
new file mode 100644
index 000000000000..6985ee644a25
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml
@@ -0,0 +1,318 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/fsl,imx8qxp-dc-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller interrupt controller
+
+description: |
+  The Display Controller has a built-in interrupt controller with the following
+  features for all relevant HW events:
+
+  * Enable bit (mask)
+  * Status bit (set by an HW event)
+  * Preset bit (can be used by SW to set status)
+  * Clear bit (used by SW to reset the status)
+
+  Each interrupt can be connected as IRQ (maskable) and/or NMI (non-maskable).
+  Alternatively the un-masked trigger signals for all HW events are provided,
+  allowing it to use a global interrupt controller instead.
+
+  Each interrupt can be protected against SW running in user mode. In that case,
+  only privileged AHB access can control the interrupt status.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-intc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+
+  interrupts:
+    items:
+      - description: store9 shadow load interrupt(blit engine)
+      - description: store9 frame complete interrupt(blit engine)
+      - description: store9 sequence complete interrupt(blit engine)
+      - description:
+          extdst0 shadow load interrupt
+          (display controller, content stream 0)
+      - description:
+          extdst0 frame complete interrupt
+          (display controller, content stream 0)
+      - description:
+          extdst0 sequence complete interrupt
+          (display controller, content stream 0)
+      - description:
+          extdst4 shadow load interrupt
+          (display controller, safety stream 0)
+      - description:
+          extdst4 frame complete interrupt
+          (display controller, safety stream 0)
+      - description:
+          extdst4 sequence complete interrupt
+          (display controller, safety stream 0)
+      - description:
+          extdst1 shadow load interrupt
+          (display controller, content stream 1)
+      - description:
+          extdst1 frame complete interrupt
+          (display controller, content stream 1)
+      - description:
+          extdst1 sequence complete interrupt
+          (display controller, content stream 1)
+      - description:
+          extdst5 shadow load interrupt
+          (display controller, safety stream 1)
+      - description:
+          extdst5 frame complete interrupt
+          (display controller, safety stream 1)
+      - description:
+          extdst5 sequence complete interrupt
+          (display controller, safety stream 1)
+      - description:
+          disengcfg0 shadow load interrupt
+          (display controller, display stream 0)
+      - description:
+          disengcfg0 frame complete interrupt
+          (display controller, display stream 0)
+      - description:
+          disengcfg0 sequence complete interrupt
+          (display controller, display stream 0)
+      - description:
+          framegen0 programmable interrupt0
+          (display controller, display stream 0)
+      - description:
+          framegen0 programmable interrupt1
+          (display controller, display stream 0)
+      - description:
+          framegen0 programmable interrupt2
+          (display controller, display stream 0)
+      - description:
+          framegen0 programmable interrupt3
+          (display controller, display stream 0)
+      - description:
+          signature0 shadow load interrupt
+          (display controller, display stream 0)
+      - description:
+          signature0 measurement valid interrupt
+          (display controller, display stream 0)
+      - description:
+          signature0 error condition interrupt
+          (display controller, display stream 0)
+      - description:
+          disengcfg1 shadow load interrupt
+          (display controller, display stream 1)
+      - description:
+          disengcfg1 frame complete interrupt
+          (display controller, display stream 1)
+      - description:
+          disengcfg1 sequence complete interrupt
+          (display controller, display stream 1)
+      - description:
+          framegen1 programmable interrupt0
+          (display controller, display stream 1)
+      - description:
+          framegen1 programmable interrupt1
+          (display controller, display stream 1)
+      - description:
+          framegen1 programmable interrupt2
+          (display controller, display stream 1)
+      - description:
+          framegen1 programmable interrupt3
+          (display controller, display stream 1)
+      - description:
+          signature1 shadow load interrupt
+          (display controller, display stream 1)
+      - description:
+          signature1 measurement valid interrupt
+          (display controller, display stream 1)
+      - description:
+          signature1 error condition interrupt
+          (display controller, display stream 1)
+      - description: reserved
+      - description:
+          command sequencer error condition interrupt(command sequencer)
+      - description:
+          common control software interrupt0(common control)
+      - description:
+          common control software interrupt1(common control)
+      - description:
+          common control software interrupt2(common control)
+      - description:
+          common control software interrupt3(common control)
+      - description:
+          framegen0 synchronization status activated interrupt
+          (display controller, safety stream 0)
+      - description:
+          framegen0 synchronization status deactivated interrupt
+          (display controller, safety stream 0)
+      - description:
+          framegen0 synchronization status activated interrupt
+          (display controller, content stream 0)
+      - description:
+          framegen0 synchronization status deactivated interrupt
+          (display controller, content stream 0)
+      - description:
+          framegen1 synchronization status activated interrupt
+          (display controller, safety stream 1)
+      - description:
+          framegen1 synchronization status deactivated interrupt
+          (display controller, safety stream 1)
+      - description:
+          framegen1 synchronization status activated interrupt
+          (display controller, content stream 1)
+      - description:
+          framegen1 synchronization status deactivated interrupt
+          (display controller, content stream 1)
+    minItems: 49
+
+  interrupt-names:
+    items:
+      - const: store9_shdload
+      - const: store9_framecomplete
+      - const: store9_seqcomplete
+      - const: extdst0_shdload
+      - const: extdst0_framecomplete
+      - const: extdst0_seqcomplete
+      - const: extdst4_shdload
+      - const: extdst4_framecomplete
+      - const: extdst4_seqcomplete
+      - const: extdst1_shdload
+      - const: extdst1_framecomplete
+      - const: extdst1_seqcomplete
+      - const: extdst5_shdload
+      - const: extdst5_framecomplete
+      - const: extdst5_seqcomplete
+      - const: disengcfg_shdload0
+      - const: disengcfg_framecomplete0
+      - const: disengcfg_seqcomplete0
+      - const: framegen0_int0
+      - const: framegen0_int1
+      - const: framegen0_int2
+      - const: framegen0_int3
+      - const: sig0_shdload
+      - const: sig0_valid
+      - const: sig0_error
+      - const: disengcfg_shdload1
+      - const: disengcfg_framecomplete1
+      - const: disengcfg_seqcomplete1
+      - const: framegen1_int0
+      - const: framegen1_int1
+      - const: framegen1_int2
+      - const: framegen1_int3
+      - const: sig1_shdload
+      - const: sig1_valid
+      - const: sig1_error
+      - const: reserved
+      - const: cmdseq_error
+      - const: comctrl_sw0
+      - const: comctrl_sw1
+      - const: comctrl_sw2
+      - const: comctrl_sw3
+      - const: framegen0_primsync_on
+      - const: framegen0_primsync_off
+      - const: framegen0_secsync_on
+      - const: framegen0_secsync_off
+      - const: framegen1_primsync_on
+      - const: framegen1_primsync_off
+      - const: framegen1_secsync_on
+      - const: framegen1_secsync_off
+    minItems: 49
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+
+    interrupt-controller@56180040 {
+        compatible = "fsl,imx8qxp-dc-intc";
+        reg = <0x56180040 0x60>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+        interrupt-controller;
+        interrupt-parent = <&dc0_irqsteer>;
+        #interrupt-cells = <1>;
+        interrupts = <448>, <449>, <450>,  <64>,
+                      <65>,  <66>,  <67>,  <68>,
+                      <69>,  <70>, <193>, <194>,
+                     <195>, <196>, <197>,  <72>,
+                      <73>,  <74>,  <75>,  <76>,
+                      <77>,  <78>,  <79>,  <80>,
+                      <81>, <199>, <200>, <201>,
+                     <202>, <203>, <204>, <205>,
+                     <206>, <207>, <208>,   <5>,
+                       <0>,   <1>,   <2>,   <3>,
+                       <4>,  <82>,  <83>,  <84>,
+                      <85>, <209>, <210>, <211>,
+                     <212>;
+        interrupt-names = "store9_shdload",
+                          "store9_framecomplete",
+                          "store9_seqcomplete",
+                          "extdst0_shdload",
+                          "extdst0_framecomplete",
+                          "extdst0_seqcomplete",
+                          "extdst4_shdload",
+                          "extdst4_framecomplete",
+                          "extdst4_seqcomplete",
+                          "extdst1_shdload",
+                          "extdst1_framecomplete",
+                          "extdst1_seqcomplete",
+                          "extdst5_shdload",
+                          "extdst5_framecomplete",
+                          "extdst5_seqcomplete",
+                          "disengcfg_shdload0",
+                          "disengcfg_framecomplete0",
+                          "disengcfg_seqcomplete0",
+                          "framegen0_int0",
+                          "framegen0_int1",
+                          "framegen0_int2",
+                          "framegen0_int3",
+                          "sig0_shdload",
+                          "sig0_valid",
+                          "sig0_error",
+                          "disengcfg_shdload1",
+                          "disengcfg_framecomplete1",
+                          "disengcfg_seqcomplete1",
+                          "framegen1_int0",
+                          "framegen1_int1",
+                          "framegen1_int2",
+                          "framegen1_int3",
+                          "sig1_shdload",
+                          "sig1_valid",
+                          "sig1_error",
+                          "reserved",
+                          "cmdseq_error",
+                          "comctrl_sw0",
+                          "comctrl_sw1",
+                          "comctrl_sw2",
+                          "comctrl_sw3",
+                          "framegen0_primsync_on",
+                          "framegen0_primsync_off",
+                          "framegen0_secsync_on",
+                          "framegen0_secsync_off",
+                          "framegen1_primsync_on",
+                          "framegen1_primsync_off",
+                          "framegen1_secsync_on",
+                          "framegen1_secsync_off";
+    };
-- 
2.34.1

