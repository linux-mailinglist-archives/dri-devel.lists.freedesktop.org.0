Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2DC92845E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 11:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C414E10E1C6;
	Fri,  5 Jul 2024 09:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="XA1rD+k2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D369310E1C6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 09:01:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLRGIwFocWVTNXPEnAq+XuFhWjYdCjJZaP6QrGZPLbRkTw4F/c37M4fKkQCaf5uAIgOTMvV9gJFL0y1dvmELDJ/PUQqI8obbxSdVQZyAPYGKaLcSJ9TU30qXVpK9gsMJNnCoIffeAbSfF6AGX48RGG0n1wxxd2X4qaALjSMcGZhvcG0BlWsnWF9z3HVIzmIZdM6Kml9KrjGBqXPSB3Qk8kuzXbby0GWNcluzTg3sdbXnU8f8XVmN/eaWU698v/eWZIf5fFZuIBu3QEPToBGRpRv2BtsoONKQF4AQe019ARh8Og6vJVG3DOGlD3xe+T8zFOY7yH6k0okpIRLcqEATuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEf55uT3XE4bKAMTSguNsBHXp+SCDYfJ8Atxn7qr09c=;
 b=LLV/0xFudb1FKoYzYpPji5NO6At/43eEo2eFLg8w6fn1NYu0vPh6nO8EDHsZSLuOcwzGu5Sr7rGOU0dx3IANxgXjy+dqBZu+9FWz34BSAalPFD8AM1n80TesCClEAQ5fq/4GMdRcTG6C5f1ddRnn2qEdTPHGC/RBihlATxXf6dnGj/fM4zHR6yWWRxIKiQY1uvlfFMUpVFhFP/6s5XV9D55OTAZjkkdLdLI5imj5ks8xS90+2EPd8JwNryhe5JVw4IM6hT0UStuwkSXQ4TPbB4u0cXMVuj/TYXRYqirpYsjjQpIqJivNibk2MJ0E67iy0GifGmjBP3a8GCJMfCV4aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEf55uT3XE4bKAMTSguNsBHXp+SCDYfJ8Atxn7qr09c=;
 b=XA1rD+k2MDZPp4N7MscH5kBQCume6Fq3RuM6Rvhqcnap0Ml2p+BaVy0ZOqf1S/0GFhJf/tq+OHDp5SKPlcJA2h79EswjturLXG/4G3se/GW1+nsPiVUgsmltydLqy+N+QgQk9zgTRM3dHgP0PZ07ZQXky38GAGrthHjIe7buHLI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9073.eurprd04.prod.outlook.com (2603:10a6:102:225::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.31; Fri, 5 Jul
 2024 09:01:11 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7741.027; Fri, 5 Jul 2024
 09:01:11 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de
Subject: [PATCH 04/10] dt-bindings: interrupt-controller: Add i.MX8qxp Display
 Controller interrupt controller
Date: Fri,  5 Jul 2024 17:09:26 +0800
Message-Id: <20240705090932.1880496-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240705090932.1880496-1-victor.liu@nxp.com>
References: <20240705090932.1880496-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0110.apcprd03.prod.outlook.com
 (2603:1096:4:91::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9073:EE_
X-MS-Office365-Filtering-Correlation-Id: 64804976-afa5-4ed2-0471-08dc9cd10459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2QVvSH34wrejbb413cQEPnuHthirx4tHqttmXX2YvbT5kM7cixkZAxFqEREa?=
 =?us-ascii?Q?PDlIPxVje9xWurVVe+O104nj5JtfeD4XNv+ZJ90fzn44qdroyijLmeqKgUYb?=
 =?us-ascii?Q?U7reE+KXCbY4nfBi1pTxv3eevuGB32+nZY4VT1ZkCHrWyqV1CwfZpJe+ALXd?=
 =?us-ascii?Q?G2FM8bBt1pZSx00M7aMhxU5ZVmTmAhgNVCnlprOdi6+D74xX9zvtzZmV/Ivt?=
 =?us-ascii?Q?pE595KU2pR+0Tt/Byops5FS+geu8rEiWJn9PziV04DdKXTysZs+lJIYh7cGy?=
 =?us-ascii?Q?4iasfOsqFkeBqAl0sdLMcgz0JqhAEd2IjTimsgcnVPdVAa8D/oNLCe82BkNT?=
 =?us-ascii?Q?ktmX2qaSs2Ngn0CqAG70oFftlC2/Tzmxnni7FbqZuIFSyedzpgtnmtRboNg6?=
 =?us-ascii?Q?pICryz6o1v2nUIk2ImNzlkLMcaXhvePwfb2oSWyVka/IhklrRkyHwf2CSrYZ?=
 =?us-ascii?Q?jsXyKnlkf9oQNkyBr0PFtmoY1w+JleB8cK8LWFBN2SS20xh/j26nhQO/+dvh?=
 =?us-ascii?Q?bes2Yo3U07SMTJccv0LOx3n9Pa/JLrdq3gE2NxiT72mrKiu0ThC3OrAWYWVM?=
 =?us-ascii?Q?iWDieUVJlqOjPI/PVkPK/+o8HAY7CgbxL0K+sLEz3ECqgsI9W6fAPV9nkBA6?=
 =?us-ascii?Q?I0cYyvVy9ALMJqVsnctxLCkwm3neNTBO3dSG2ILb6ZdZvhZS2m4cDhUmjb60?=
 =?us-ascii?Q?aoVumhUE6fLA9660+XbEnOa9iywDWCPEs7dxPuVPMK+coImqYFyIv99wK6uO?=
 =?us-ascii?Q?W/AAE5T0qPyMRK20i3BRyPMg7W80kN8IYyMN2C+K2qVwAn3gjr4+TvHmzg7z?=
 =?us-ascii?Q?ci4Gc4xnkiYoKCWHZouL2uOvYou9e1vrWVa4ZEQDpcUk3mLVJ5nuAxfEOHCo?=
 =?us-ascii?Q?ullsFjh8ww2YPxTSf/ywyWjaRv7OgU+nBDNXM99rNKC2Q6LLEcG8a4ayjiFt?=
 =?us-ascii?Q?kRXupsdzwgANaCZOMmu/mEFUnACEhMYNB+sslhx3YmXHKJzQjpWeDj7u8fpE?=
 =?us-ascii?Q?68VJ+t2gphyuSWEjasDuEHAh2Egj1iUfIDf5FBIlK3sLxi/QSWCCWlMnWDwf?=
 =?us-ascii?Q?U3qd/hk3y6G6ygH3VIvKz4G7a40kMfiHZqAT0OChdzu+AniqtJ26y8ZZD4/6?=
 =?us-ascii?Q?td4g2zX3uXzlTJ4elaHT+6t/YW/EetO9hi8MfO8zHShMhr9pfq9iUAjXPVFY?=
 =?us-ascii?Q?68uQhthA74HWg3L0g5zzCvbpw4afmy7FYujU4FS3Em5AX+1L49yiyOe2jO08?=
 =?us-ascii?Q?CaB8HxulnN0fuyhRmdaMP+GzHouLDTfFt7QfCpBNbKr/RikN5TGZOkd6vKwS?=
 =?us-ascii?Q?wfGNj6dzwp8MZisJTtAdOhzk+Oj9vQOIMsMrOTJi5aj82mIGcY2r5kWimPQt?=
 =?us-ascii?Q?GLYCl1Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KsHUyk99WqKZC4VVtxuoXg496aCo5Rcv38IqaMu2zgc5U6X5jErNvO+17Lev?=
 =?us-ascii?Q?HteTvo4O9Vhu0mUuIwDmtV3fSqQ81ZfNAA7+b6ClWWBSjJglQBcw5mTiBzLJ?=
 =?us-ascii?Q?YSOQvhD0dH77+rvuRDpgohPIGJqWDZ7WBFzeNItyDyQXTW5TQvXAEV+P7eil?=
 =?us-ascii?Q?P42MlGa6ENLnp2XLuTsbMT6nPXwR6rEOLmmJtFMX9oP0s8jJqOLuRIGoM2lF?=
 =?us-ascii?Q?mkRYaL4PFtJdki0HT0NJ4CyI//mDrhyBnapOK2MVFgobp7tTHOHn4xg2gMww?=
 =?us-ascii?Q?kiwUcwtJLt4E1ltQ0xjT8G6KvliGIy+SZJVrTrHapd3WJ5jwBWYA/FKG4qRy?=
 =?us-ascii?Q?99bzfDrK0tjVpSlUoH7SlAYiGvaLc/PnS3tzO5eH9h9wuuqu4agR/ZIyl7Su?=
 =?us-ascii?Q?xVGrY4681QtFNjm0BCBDO67epKlouF8iWKKoNYvyaG/hNeHaUxzUM+vjaSju?=
 =?us-ascii?Q?wU2evyyqLwVt4IVknCozd2zd+aoymSv8/beiWDUIqnAW4jwSQwvMG/2EHlkE?=
 =?us-ascii?Q?Co9ayxVeYSLgSrOpgSRDdR9awV6YBEimr2OzHP4ECkmHZ5YvQRfRbz696LyJ?=
 =?us-ascii?Q?cxWzAh+4VMeNecF45Zrp9TUaH3Cuc2/1eq8qU9h75mdStIbV87kdwO8ZS1Gq?=
 =?us-ascii?Q?FI2S2fC1wY0cPcUtVhvGcZK6omHU3PB3fJOZVKUdBgh/w19tCGsxgNnwl1NQ?=
 =?us-ascii?Q?DCFMly86vfRlZNm9MCg58rzQ8VT01+8a/pAetOlbfbQt6gOPWPg2PCf8MNJm?=
 =?us-ascii?Q?UVh/U0aFNlnA47gonIoc1fk02chNr448BAFOAmcE8cv6Bt8KBKNRSr0nK6Yv?=
 =?us-ascii?Q?VrYN5r9YjimKvWe2dzfLIE0emhCWKhfSIXP3h1NWM3moWqkdbDEoEde+9s2S?=
 =?us-ascii?Q?u6rWUOofzbYVZde131LV7QmZ/N598SyhlEFD84VbVLYntj9BVih29HZJrcYU?=
 =?us-ascii?Q?NQfsFV8eJNbMJWK2GcHG7ge+MmI0/avCJcm4I805QLg5UZwiC4gf9Kelxxz5?=
 =?us-ascii?Q?quDgPPtbFx8imMwbSehVm2JEOhwH3iDwUSIIgHNYgDAHrQ1ULKDkK9qwopen?=
 =?us-ascii?Q?csKBacKqAWxn4veJH4y3siFG4+cAaBdK2pTIErtJLhifM76fVlqXOchw+wVM?=
 =?us-ascii?Q?Rv7X7vwxa++fYzHflMnLghhmJdoJuiak2F+LYu8uem26vEka4CF8Iiby+Mgc?=
 =?us-ascii?Q?+WQmWMiHILDJez3Eoq6pIneNj8stSoz0LQD9xFGbSrKWk+EnQmHWjsQ8RImc?=
 =?us-ascii?Q?5PaWtXxZddIocbZNnWlpB/8cwBvy0Jjr3vj3SIL/uOE1ZecWC9IY1wbtKyIa?=
 =?us-ascii?Q?3S1UrYt6pmQITw9fwLAIf984NH9cxwICFxVkcEZYN2cRLzihT/sDK4asIQrJ?=
 =?us-ascii?Q?EtqjsW4Qx8gUXhmN9GcuigMei7nzivw3ThGKBBoVg4Hb7ylc9tuG4RygKmU/?=
 =?us-ascii?Q?5E2pJ7GIWzEG68kttzml9c3qHJHjdO/9u+kOdL+V4Qu96bgOKydMBg3RMNVO?=
 =?us-ascii?Q?btX8Egol7TVa+M+OGVBKkQ3IzqPb9IFxqroMFlAC8JM1PF5+tV03GHV/dcIa?=
 =?us-ascii?Q?l3yGP508z84GECD1UIV2P1aProupFHKPcv/4CDqf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64804976-afa5-4ed2-0471-08dc9cd10459
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 09:01:11.6841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KnNeKn7GUhc9ZgVvc1cSDWJhE0PtFtrd99uMlHDzBCIQX6m50Www7Uu0W4zTZl/yoBLWjbXfcO9zOYDRkbDXQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9073
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
---
 .../fsl,imx8qxp-dc-intc.yaml                  | 321 ++++++++++++++++++
 1 file changed, 321 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml
new file mode 100644
index 000000000000..3d0d11def505
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml
@@ -0,0 +1,321 @@
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
+      - description: |
+          store9 shadow load interrupt(blit engine)
+      - description: |
+          store9 frame complete interrupt(blit engine)
+      - description: |
+          store9 sequence complete interrupt(blit engine)
+      - description: |
+          extdst0 shadow load interrupt
+          (display controller, content stream 0)
+      - description: |
+          extdst0 frame complete interrupt
+          (display controller, content stream 0)
+      - description: |
+          extdst0 sequence complete interrupt
+          (display controller, content stream 0)
+      - description: |
+          extdst4 shadow load interrupt
+          (display controller, safety stream 0)
+      - description: |
+          extdst4 frame complete interrupt
+          (display controller, safety stream 0)
+      - description: |
+          extdst4 sequence complete interrupt
+          (display controller, safety stream 0)
+      - description: |
+          extdst1 shadow load interrupt
+          (display controller, content stream 1)
+      - description: |
+          extdst1 frame complete interrupt
+          (display controller, content stream 1)
+      - description: |
+          extdst1 sequence complete interrupt
+          (display controller, content stream 1)
+      - description: |
+          extdst5 shadow load interrupt
+          (display controller, safety stream 1)
+      - description: |
+          extdst5 frame complete interrupt
+          (display controller, safety stream 1)
+      - description: |
+          extdst5 sequence complete interrupt
+          (display controller, safety stream 1)
+      - description: |
+          disengcfg0 shadow load interrupt
+          (display controller, display stream 0)
+      - description: |
+          disengcfg0 frame complete interrupt
+          (display controller, display stream 0)
+      - description: |
+          disengcfg0 sequence complete interrupt
+          (display controller, display stream 0)
+      - description: |
+          framegen0 programmable interrupt0
+          (display controller, display stream 0)
+      - description: |
+          framegen0 programmable interrupt1
+          (display controller, display stream 0)
+      - description: |
+          framegen0 programmable interrupt2
+          (display controller, display stream 0)
+      - description: |
+          framegen0 programmable interrupt3
+          (display controller, display stream 0)
+      - description: |
+          signature0 shadow load interrupt
+          (display controller, display stream 0)
+      - description: |
+          signature0 measurement valid interrupt
+          (display controller, display stream 0)
+      - description: |
+          signature0 error condition interrupt
+          (display controller, display stream 0)
+      - description: |
+          disengcfg1 shadow load interrupt
+          (display controller, display stream 1)
+      - description: |
+          disengcfg1 frame complete interrupt
+          (display controller, display stream 1)
+      - description: |
+          disengcfg1 sequence complete interrupt
+          (display controller, display stream 1)
+      - description: |
+          framegen1 programmable interrupt0
+          (display controller, display stream 1)
+      - description: |
+          framegen1 programmable interrupt1
+          (display controller, display stream 1)
+      - description: |
+          framegen1 programmable interrupt2
+          (display controller, display stream 1)
+      - description: |
+          framegen1 programmable interrupt3
+          (display controller, display stream 1)
+      - description: |
+          signature1 shadow load interrupt
+          (display controller, display stream 1)
+      - description: |
+          signature1 measurement valid interrupt
+          (display controller, display stream 1)
+      - description: |
+          signature1 error condition interrupt
+          (display controller, display stream 1)
+      - description: reserved
+      - description: |
+          command sequencer error condition interrupt(command sequencer)
+      - description: |
+          common control software interrupt0(common control)
+      - description: |
+          common control software interrupt1(common control)
+      - description: |
+          common control software interrupt2(common control)
+      - description: |
+          common control software interrupt3(common control)
+      - description: |
+          framegen0 synchronization status activated interrupt
+          (display controller, safety stream 0)
+      - description: |
+          framegen0 synchronization status deactivated interrupt
+          (display controller, safety stream 0)
+      - description: |
+          framegen0 synchronization status activated interrupt
+          (display controller, content stream 0)
+      - description: |
+          framegen0 synchronization status deactivated interrupt
+          (display controller, content stream 0)
+      - description: |
+          framegen1 synchronization status activated interrupt
+          (display controller, safety stream 1)
+      - description: |
+          framegen1 synchronization status deactivated interrupt
+          (display controller, safety stream 1)
+      - description: |
+          framegen1 synchronization status activated interrupt
+          (display controller, content stream 1)
+      - description: |
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

