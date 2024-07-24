Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7253193AEDD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 11:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442AB10E654;
	Wed, 24 Jul 2024 09:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="gyCyaUyT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011066.outbound.protection.outlook.com [52.101.65.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1336510E64F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 09:21:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIS8MRMjGY7NMifdxZ4HYL44Aluqm3v2fOW1Eo8UDp3pUDixQ1+kOi6OTqlM70VGlElhc0Si8XdtfCfzYc4Yw5rKNOhvBaDitrJb9ceaexRfYfbT8T/gfwOvsTVBenpypxmHd2UTo3XjGQn17efyCeofelhQhk7hnzn+nmJ11V4ZcZyKAbsl1ZrHY89rO95Z0t59I8LkHIshjdp92rv5AztYn0PJY6AgSk6+2p7vMnER4TXzxX4RqRg0xr4XYPSZw0JJSfxcxWhBCqg9ZTrnucnAzVa8Or/NQ7luXK1MxR3FzOWY+GvoILAthwxvzjV8FHS3oNRsbNnJQl5qxnzGpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9e+JPWQgEMg7XXBJ9fix3X7on5bgdO53/+bnJWiHz/Y=;
 b=G5JUz7VU8esSZ4X7COLyvhVuIWPYW3YiEFuKjky+clO5znH+EFbcz6sj9nQXQ7UyrrXH2Y0cMekputApqnuCchlhRbcCHqSyQA31sxQQ/QefB/ZqZ0NBg/at+smwcHlOZI7OzYYHBNZA0+8dfQ7wi1YC7IIkYdQwJZaKUvcrBv0XxDYkMDJ6f+OJGOoPoNAcbT3HI9iSdej9A9/v5P+GjOQDpWqg7lTihdBU+ZfGDEgESAWxUqqeE9q5pLLRjnpzaMsFgsBHXarnxXHe0CjYCSONv8KmFouA+PQB7iQY8OpaDapZcq6uVzdj94OcmRP4/A4F3kciXtBHhvPrSPPyfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9e+JPWQgEMg7XXBJ9fix3X7on5bgdO53/+bnJWiHz/Y=;
 b=gyCyaUyTXHd8AylVDpcEeQ5Aw+Yx9T8M2ysYTSX7xmS95Qhc+aLu4BK3gkQGh6gCfVnAiqrBfH6XQizmiahkhpWcmyQ1f7+0dsw/Oi1oxMEQhHT3jpbsz+joAbAMVHVG7rMHSAAEae3D0GI8qIXwNHL/p4seFZ5dqV63LhH+un7k6kAaQoTT5f0tN3J/OiONO4s7uGW7TV1uogE0L3g/0yk+Tic2gJaqWIm3xqwGp4qfUUUOKMNA7MIMWu+B9ZM38CFfXeAWF3cju8scZAXdN0I4xYbLYFLW97XCBN0fsIPKDnDgBTUDCkusmcI7eCDrJLZSQbO9QjBrE8y0jzd2sA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8040.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 24 Jul
 2024 09:21:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 09:21:43 +0000
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
Subject: [PATCH v3 06/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller command sequencer
Date: Wed, 24 Jul 2024 17:29:37 +0800
Message-Id: <20240724092950.752536-7-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: bedf2b29-67fe-41b5-17e3-08dcabc2087e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v0MdfmGNh96+eaP7XmjwLYeyfnFrdHwv89M7YFRHSv5g3H8l4HBsEGgxt15v?=
 =?us-ascii?Q?sjORN44eplZi3Ef66uWZHJlU8xLR0gNTXvx+l/xlsxVKrRjEXPp3OkPaDkPL?=
 =?us-ascii?Q?Nqu4ZsqciwI+IZJ4bGzCK65JwComJQGhYwDLrIn63/dXK/MjzWOPdzdoNgGY?=
 =?us-ascii?Q?KFHoj9nhNBz0DeSepmu4pCWmVOIF8iCQkM6D6CAiPyNk6HDOD5ErSoA97zf0?=
 =?us-ascii?Q?1oCmUK2KBqW0Xo1MyMrSQvfNEoDSBJcbYvuxI3N6pHaYpYfJGCGOj88RFHab?=
 =?us-ascii?Q?s49lu/ij4HFebZkCt6VsNDdRuYsFZ0jlKI37UysQVLjlxgBduRYoz7w7yBrq?=
 =?us-ascii?Q?yjuWw2+4whf6ppWyZoGPwmpk9yfCyO4f1E0h62h8b2rgGJ/L0abR6tRKK8+t?=
 =?us-ascii?Q?jHCTJ4HiEJ4sq0l/3tOM54YqDcfpGySwO32Gt/zVKO9HJOQbj/es7xm1Ka1e?=
 =?us-ascii?Q?OAuyGPye7vNB56BdIwkFlcXYCXTJZhHHUFqFv7mOf1sztodRUdH1CRjgUAzr?=
 =?us-ascii?Q?hpnuBj+4fPpLuNV5/0wDXMQwrifu0hYF9Wkra9HfP0isdpGNL5339WpeXY6G?=
 =?us-ascii?Q?N3j7KVEGvo0mPwWO+hCGnmFZvfM+Qon1mlRsodz4b8IFkaFJIeZ2BcqVK0/U?=
 =?us-ascii?Q?aDKICaZnC2V09mVbSnE007yJBNe9MKRqxAWUvEeZMmBiYSOvYiX0KZnfnyPB?=
 =?us-ascii?Q?+FLp7dBGwsNW32wtIcl2wMISaDggBjzif8DspoOCaIuoWcU5aA6LsiwiAyEZ?=
 =?us-ascii?Q?fMM8R/hIAcvYETp2nIgDnwyNtXdqEOm2ECG4IAE6tpKlLgJbQtEzpYhfJjRD?=
 =?us-ascii?Q?OcO/5HjzfEmcr8LI6X0OFk46wgHUCWV/pStPOPv8aAT2kVnNKvQgmeXYQkWw?=
 =?us-ascii?Q?WSPwq8sR7K2m0X0NtcVogZKxiHCxb037cCwQamnvLlO367/haha/jjbi1n7j?=
 =?us-ascii?Q?MP9hb3/dXt9XjFEM2VFrEeUKjJokZeWeIpnO5LxEMqA5OOWCZJIezBN/VadO?=
 =?us-ascii?Q?dzmq1G7iHJUHP8PMlUoOAI5Vdr1yGdrwasXKybik5U/8xOvT18bpNdXRmqHQ?=
 =?us-ascii?Q?3PD9OyjYebDI5naZx81W2tp72NZ6+/hpOwRIZru36a2oWDaUEdoi6F6rJqrC?=
 =?us-ascii?Q?Bg/CfeLAU/cziXSSdC4FoTlyBbNnrIyo1QhAK4TTMFKOgCW7chjK3aheavaM?=
 =?us-ascii?Q?VcrlBfk8/Q5nrh5qWVx8ui/oP0ysjC87mCDgIkSFkBjTYkevCfgtrO9mHtgx?=
 =?us-ascii?Q?fEXalZUOjreCyMh5QQbsQDBelRe6Ri4p7F0cK+WVMSePEk1iaugCDUvnl4QX?=
 =?us-ascii?Q?X0aHGJpPlj+AVw3yz6Hh2bDNlp4OZO7wWT7RpdiF8WAKwg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TehHxmwG7CBFMU6OOFa4acd6mqmxQm3/PzfaK/C+bp1xXFqhTFZKIEpLIOXi?=
 =?us-ascii?Q?cNbbIL8KoW3chqByAYF8lkmK0gj7+98RjtAGm9m9YktKFnRRcw8r6WpA3rZK?=
 =?us-ascii?Q?O9M3un2ZQ+PXgcsppbDMJoStrHMLDhXwUJkddDdWpZTiXnw5HbId1YxFAy/0?=
 =?us-ascii?Q?TjFm4DlIYI0vdYNOEmbKlocq6yAbfVAIvJR3HF+AMZO4hgMyVw7hFmKJIiNh?=
 =?us-ascii?Q?Lh45bc2BAlHzYU6VSprIO9iosxEwf6ccf3qVTT/Uw6KBZh/5kOG/H/k36UOP?=
 =?us-ascii?Q?WhqTAwlURqqiCAwTmiSiBdtIDBHBYvG00ggnlhpmj2iV3RYEv3R3uaB3FZbt?=
 =?us-ascii?Q?GCxImh7QdueNwjlFvJWDsTgYrEfVG3XKW0w0+ti39TsXcszoVzOudHFa01a6?=
 =?us-ascii?Q?LBodVj+XiMuUZzRqRLpUn8NgMsTcLrfkXOzynmpEUxwIScRkjaDG5G1rPmyY?=
 =?us-ascii?Q?49RGe+C7eEE33AY/XzHxc0Duy+xlRtPt8GYNPeENOwkhi9iyVzYlfo2aXrAk?=
 =?us-ascii?Q?StsUbteKnY0aiXWMvdU9Vg2lHjMMhU/ltuinp9phbQC8XmmmQKzCWLQ7NTjk?=
 =?us-ascii?Q?k73KE74rLEYJz87wPwvIUrHASnCTZJE45K50e7bSKiEiEIxUMUAWExu0+JPb?=
 =?us-ascii?Q?vQqBA2UdCJT3XJJPx8eUYLtZHhyWF/c8lkgx2fXIVDybvl/1ZQ8KJtI0YbGk?=
 =?us-ascii?Q?XAM/e27o99GkgZ7tYEWMvVY4fad4Rq3tJDHU/gfIiSrzyDCIZD2T1ZJdHoNb?=
 =?us-ascii?Q?L8Ur9l8b14mkJ16zFDkJTwTjmtRlNTnTVlMbdUec5uMXxKtr+7rJcXzguD5X?=
 =?us-ascii?Q?PHplcA0oIb1DHNnSG7CyUv1JrEEz7gehuhyLYIv8rvjUjMwAUHkaQyNohOoc?=
 =?us-ascii?Q?bxZbM4s0+px7eXPYeYYSMsiuHp/KUCTUu8EICQM6eAGd3vGGyOJ4lXnCJ5um?=
 =?us-ascii?Q?gsC3qLH/kR6S2BpWzJ4gkP1Sj+o3yPvlSvqbMOqn5mq1IANTrwRq5JOauq2/?=
 =?us-ascii?Q?QVLxB8WnwGrOhuE+L2ht9YgxR3wkqmw2SjeeAOmYAvLHjjihg97yIG/Obl37?=
 =?us-ascii?Q?4Bb4J+/FvucFaXNWBqOyPKw2s+x7srIKGHXO6kiZRR2JaQElpUO8D95fZuMp?=
 =?us-ascii?Q?d4GdaSvmfAMa+Fa6fk6khB0idQGxiSE1D+FxblphSV5emOQzueCIDb/qFN4d?=
 =?us-ascii?Q?SlWigI56plDkgXKcxpHjqs+WP5aRg2UdHdE8r1RyGJQywO2q6ZNHDS/5ESpb?=
 =?us-ascii?Q?X0UbJ6YsUXPIhvi4CE5wJ2pjVduTBkfCTL2RA8tJv/ly+6sF77J5k+5wZK3j?=
 =?us-ascii?Q?gcdokkQlHxTTGfDiRSIIrIoDuBYJcWX0hzd/nFlqM4RCtDdgu4ZnetKrWKaX?=
 =?us-ascii?Q?8to/2Qjka7CqUrb5c7wb50OXr6+mhGtTORSYBb7QQhOI+lzdBpe0F9eq3f95?=
 =?us-ascii?Q?oq3y5HM5NJGMUvTFBR3FF4D8OCt6FUM3dOmzi2jOk83fenolnmM2ukRXbRhH?=
 =?us-ascii?Q?XBBdLOCLrOklQh2vQwva6KDktQI3wfSsaKk5zj4wd1LW6yh5SnwG6esj5b2/?=
 =?us-ascii?Q?T3qE/p+i1xQe/mE2ko7X+WoE3JIxGNjtneJj0Hpj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bedf2b29-67fe-41b5-17e3-08dcabc2087e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 09:21:43.6829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8uXhtbNChK/hjy1WAYvD3BuPGLhoTRJUpomOOkt+ELngD2gyk+7/tAOQeKsFMWvOsk7u6wgkOTVkSM1MKBpBQ==
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

i.MX8qxp Display Controller contains a command sequencer is designed to
autonomously process command lists.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
* New patch. (Rob)

 .../imx/fsl,imx8qxp-dc-command-sequencer.yaml | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
new file mode 100644
index 000000000000..2e0e8e40a185
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Command Sequencer
+
+description: |
+  The Command Sequencer is designed to autonomously process command lists.
+  By that it can load setups into the DC configuration and synchronize to
+  hardware events.  This releases a system's CPU from workload, because it
+  does not need to wait for certain events.  Also it simplifies SW architecture,
+  because no interrupt handlers are required.  Setups are read via AXI bus,
+  while write access to configuration registers occurs directly via an internal
+  bus.  This saves bandwidth for the AXI interconnect and improves the system
+  architecture in terms of safety aspects.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-command-sequencer
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 5
+
+  interrupt-names:
+    items:
+      - const: error
+      - const: sw0
+      - const: sw1
+      - const: sw2
+      - const: sw3
+
+  fsl,iram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle pointing to the mmio-sram device node
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+
+    command-sequencer@56180400 {
+        compatible = "fsl,imx8qxp-dc-command-sequencer";
+        reg = <0x56180400 0x1a4>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <36>, <37>, <38>, <39>, <40>;
+        interrupt-names = "error", "sw0", "sw1", "sw2", "sw3";
+    };
-- 
2.34.1

