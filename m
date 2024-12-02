Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DAE9DF923
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 03:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9747510E2F2;
	Mon,  2 Dec 2024 02:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="EeLl5F2V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2069.outbound.protection.outlook.com [40.107.247.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B36B10E2F2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 02:57:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anErY7Icq20oKxnfmJaiodJcymnxTcaucO00fGf7udvh3AEAVroE1CsrMbZXSQqBlTOZX0OWIbWmBOVgXO6aBlhp13REQyRuO40Q32G9vzfzRlwnRjw2qX7kwC5OMqR0M9iVL54zNaVvKRDlPm5hJ7l77N5cX/H2SMK045wifzE3ZVjwRqS83jn/ZjfAbExB93JNfjqCTbj9SjzCYmLLPCIK0dhlcweYY57Ai0uCjP/rc9fOFWLqujFFnJHm3bBMO5/6jq1uiyCr3L1UJPrOylgjTmGFMNki1XA6nbROmugvSw6rp+Vt1VXhjZw4OPw/4zb8X4EQ1aQ8xVFAhxT8xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPS25qix5oSxvleV7DCckXOJ7Y6uAI7TqTcvsXwaH3Y=;
 b=oWhMrg+et7DrC4q95W2ivTtr+Ltnxt/Z6bfaAwO4vrL180DLjbkMGl7Y7iYeIE/Qqnk30/YgHEFR0ZdHnEaiLYioJUw1/K+7iowbGZlAQJLYWGM0ax5uJ+hJ0LuE8/2lzT1V1g38mG4ELYdiVgY51C9UeWPcbgfsDPVCo/p/hcI5uZQyBKfEflz4eWpEvu+th3WCezxrXgfVyca8uK+wKntv3SBGRauCwjgEYWKBID5un0cuRj7Kw0ECOE6yLj6hj4DZI8Xk2MusgtZkdOmrzD7Wc7tXaeNsYysC7RIJjFxpMpMvUqt0i0BoyBpgOIvqRubvWvAg119ZatjNT3DLjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPS25qix5oSxvleV7DCckXOJ7Y6uAI7TqTcvsXwaH3Y=;
 b=EeLl5F2V9H0FcExXEtOyi4QrSc5mDg410T7rsnFs9UsPIMuj2PyswkxQVvpPxXPwECSZoTDOCsFfMjh8ZnFIkglgZ85UKyQ4MVGO9160LELTYuxAAvap5B5PeGZcnQzD7C1mkTPgq+WBzSDXCgoAI54RPHLrU19NCqdR5UJEB2QQM3QhUBnifmfF0YNxzD3IXgCT6OF9yJdGW8QE8TuxDa7gePobDxwefBtn9X+qRWoQhKljj0NpSfWJkLzJaOtmlhWnNkV8l4OwNvm96kWVPRfBvArDVtojhRyRQwWORFGbpk6mfwx1mIYlDzB7UP/BpfpsI17D1xZ0SueeZ+6Dow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9318.eurprd04.prod.outlook.com (2603:10a6:102:2a5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 02:57:04 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 02:57:04 +0000
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
 frank.li@nxp.com, dmitry.baryshkov@linaro.org, u.kleine-koenig@baylibre.com
Subject: [PATCH v5 05/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller AXI performance counter
Date: Mon,  2 Dec 2024 10:56:21 +0800
Message-Id: <20241202025635.1274467-6-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202025635.1274467-1-victor.liu@nxp.com>
References: <20241202025635.1274467-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9318:EE_
X-MS-Office365-Filtering-Correlation-Id: ac31a5dd-ead9-4beb-5239-08dd127d0031
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R3sXNFlamHel94Puw8sDN0NB/OE+xQhGo9NPY6qjbIFB7mSLYzWDr+OMral6?=
 =?us-ascii?Q?yZQA2AMRzpQDhTHvtIroWRcNvjHR870aHrUH/zZNqKbbDV5rdmDx96ctp9A4?=
 =?us-ascii?Q?ZlES/0uE/0sMzFeX4HIT0TdzSPoeLEb0UQfpe5CKdeWgladjzHMwpvLKYdbw?=
 =?us-ascii?Q?EIgQ0RooLWILRwlUWl/BTjGM0BLhb49toesDQvVQe1CwbfnL6Wibd/Zgo0EJ?=
 =?us-ascii?Q?4KarDpzq/w+vz0xeIPeaJ8Dazv98GFRPa9Ot+/nZGBQThm/NV7/bDx660w/f?=
 =?us-ascii?Q?WTdjSCx112cw7Td1mJXdHj0Jsfr1w803yQ77VC+jNX+LLImx8sGo03c9XFvY?=
 =?us-ascii?Q?OjndgfWcMCg4x2MavYifhsZ+4ucEgURtWXNoGUnIlhOHblpcTRMyUrHLQN1r?=
 =?us-ascii?Q?siCPGSkQCxdG7I3H5R7rDjFyRu8kPm6E/00QP6bj3KoRfgc2EqXNo+ue0hSo?=
 =?us-ascii?Q?nWs3krNSup7+Aa/I6Ccjn8FHzwV6cCNT+fJOoRD1XYZT7B22XgFYrCbzImae?=
 =?us-ascii?Q?nOoxkc6RFUB3hEejt1kJKX3neJjedJW4Cu7EY4m2TDU1ibsxGn0QxYgOL43a?=
 =?us-ascii?Q?2ySUiU3Ha8aR3zdnJmZSvyQDmVdcQbfXJmT3D/WBhfcOq9TVuQXS7ouJ+07d?=
 =?us-ascii?Q?u2YufIC92+OTmEEgsvlNf74Gnxz54XO+V5lCWD0ii2oo8QLQho0nsdtREtep?=
 =?us-ascii?Q?Cc18spZLhoKfgWOx+Knwciw/L2W8Iw8s5QP+nmmzcV7bfIzR4xyq8opQwPtD?=
 =?us-ascii?Q?Q07d00F9ZbWxHpEmZq6wSsNXVI4SFOIni4MSNi0ExzkBnOoVqAvNAOjZm4sW?=
 =?us-ascii?Q?z/+IWCiBVg4Qn4ZyXYquwFi4zvf95QQ3SepqdeNf9XBCaLwOy5VS4USGiHhy?=
 =?us-ascii?Q?la2BGRxawVEIioMoLrym2pJDhzAF6aD/Kw95EtuHigjkpoA24m2ySQ2qh+kr?=
 =?us-ascii?Q?fJ9aATWi1NRlBvFmZhqEZrrRIXOT7FrNtHixezWyUVYIcbJond5zgNr92L8T?=
 =?us-ascii?Q?j7ZX7pXjuNe6PpWEpMKyEdyiWc+JCZboyF9ysuacLJ2rB6ioRYi5ATbD/Ygk?=
 =?us-ascii?Q?GQarhcFsdHvNlhrYlEEU+ZihLucXKgnbUoxiJtNrHDGhS4qjyorzJgbZ7jPN?=
 =?us-ascii?Q?U9TJXeJAt6iTt2gogVdu4mDfZE838GVkfw2WgbZwvFWUWcGak9BNzhJOlZUk?=
 =?us-ascii?Q?UlJBpwaGzJSPUps3sII5xEktz5KQAaGNZwdCNc7A+og1eflM0JhFT1F3ZjCD?=
 =?us-ascii?Q?8cHoTAEhHZTLILtQWL+EA/TuQnYTlUmzsPoH0b4VDl2OzzAzbfK+MTFGVGg6?=
 =?us-ascii?Q?CQLiSI/wefuVeHIhVzBuGsupiosDTjHslQRodOYtDDdzPw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tBjGXfPrPKdY2kRY5Wj4rvTtDgfcKzIo0PoFw1sWmbrgpIqBoxr6VxaPa8KZ?=
 =?us-ascii?Q?VBYD1Lj2CvcP3fYHX79vN1uPYU/8VMTET36J4r24J/fIphS8hPK0TR+9gUMW?=
 =?us-ascii?Q?4DQbK7cf37QGrklYegDQuJz8U6niQElt5D/OFbRrftCJ18ttp2fiUYNUfIVr?=
 =?us-ascii?Q?CAvCFuQb7dQTgrSql9PnZrn/YaGTtCkXLZJ6LpBBSTwUX+HHkTdEJiR2tVaj?=
 =?us-ascii?Q?mgNxZB03wkkCCL4O5YYBeW0sdKCl6s7xFWhw+GupALItpA6xasNIRt+o7su8?=
 =?us-ascii?Q?34mMmcX0pPAKziAr0rCCO+du4T0hXaVHka4M39RihpSE9VWIGcBmz4gkOskh?=
 =?us-ascii?Q?KYr1mZkamocvAa8h/V2Sz9i6B8qqJbdelBrHycY40ct+pI4QjnKLbVj9mcre?=
 =?us-ascii?Q?a9djevHlE/FduCaHr4/NZUZZGLpmAylfZXyw2DKMxM4IH0QpYLT4tLyhbaXv?=
 =?us-ascii?Q?6EOAnoZgwCq4NQkjpUFuobL56N2UjDXX/+9xK0M/ol68GBwxY3U4ImoiY31R?=
 =?us-ascii?Q?nYdXfx/zj7QY50SKOufXN+GloG7Cp467a02KnQuvXG+AexF8xK+hJdUv9DiA?=
 =?us-ascii?Q?1UHd0puPgLV64zgUYJtR37UVppNrd2Q2k9bGRf3nV9EIrp229khTvnaB+Vhb?=
 =?us-ascii?Q?9bxJH211M3DddXi5Q/O6qDAyRe3pc4bGYDRjY3X7A0rTPfg7iM+FnuEjHAs3?=
 =?us-ascii?Q?2FfnKdUTzub9t5plBMy9MUdnMOLueCaECiRKpLhLkHdEHKT7WvTyfSqlPO/B?=
 =?us-ascii?Q?hgdkhfKdCaNneXxnUuA9cB7B2YdHAeTCh7J+iGdQQaU5VGEH9VX2mZgDsys4?=
 =?us-ascii?Q?zdp6ri6eSE201xXnkbYquVab7yetKI7z9shp83B8QzbguHV5Ow9dvRByhbTB?=
 =?us-ascii?Q?6Nevx5oSV0Emln1AdBFg+Kp2dbc6VTqvc7uIOrbBgRdsZOhILD3aXgxNhO+K?=
 =?us-ascii?Q?Lq1nHDivIHy9eGJnNvOOJhWHkeiHF2lNOd/EM+Baxb5p6iPbVak+pCOK82Zv?=
 =?us-ascii?Q?ODF6rrvtwuQ71NJvb9E2a+gzEfFVpMJFduuOWHY9TNr4Xga0okU0pYXC2P6D?=
 =?us-ascii?Q?YXirrZ1iF55Sq39vk6zIkRaY7q5f+KWbFle4N02sv3gcH0T7cU0WNKgZQ6bR?=
 =?us-ascii?Q?2uHBoq785oyE+tywvsyoRP/WriUvJ7aioZndHhpOvigWYf9FmqsIAXmMReCf?=
 =?us-ascii?Q?iobQedPETumnd5vfmDxnLLlMGlsy9yUbKcik2MguOz/k00XvT1xuyncl1P4L?=
 =?us-ascii?Q?OxCUBonzHO504mJs8cBcYyrdaiDkbg3MxoUDnOkxeJWkKUk4p1tgAFO/rYie?=
 =?us-ascii?Q?/FMXI9Y4X8ztCqsP4hT0TudhViwUcHynDFftNZOkIcqt0rKy/ttJ4OHeWghb?=
 =?us-ascii?Q?KS6UqnOPuuH0gMQG/twGDmAvmVwKwqLntThvmsJv3oM2OUnLhjO7YHdVrkg3?=
 =?us-ascii?Q?nYeQXzh/zlebkR1i2lYvJDXo3e0YsdxMEr4IClXlbhwgr7GYPmExFjkBfa/o?=
 =?us-ascii?Q?hvWk46cqTaTGVIKwuc3/luW4YxFW7oGlAVFilYMZ8CejroCKolGY4QY2ev3I?=
 =?us-ascii?Q?Vb0PXEckChtgNkdX+oDUtbmit1kgoeObEQMITzlj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac31a5dd-ead9-4beb-5239-08dd127d0031
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 02:57:04.2613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kDrViIy0LCW+pvTlPCnwEKkHCXThEWVjZsTunXDLdTmzgK2GzmK4GswBrYYsNFFnhoHGTWdDYfwUViFL7DEINQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9318
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

i.MX8qxp Display Controller contains a AXI performance counter which allows
measurement of average bandwidth and latency during operation.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v5:
* No change.

v4:
* Collect Rob's R-b tag.

v3:
* New patch. (Rob)

 ...sl,imx8qxp-dc-axi-performance-counter.yaml | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml
new file mode 100644
index 000000000000..1d6501afc7f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller AXI Performance Counter
+
+description: |
+  Performance counters are provided to allow measurement of average bandwidth
+  and latency during operation. The following features are supported:
+
+  * Manual and timer controlled measurement mode.
+
+  * Measurement counters:
+    - GLOBAL_COUNTER for overall measurement time
+    - BUSY_COUNTER for number of data bus busy cycles
+    - DATA_COUNTER for number of data transfer cycles
+    - TRANSFER_COUNTER for number of transfers
+    - ADDRBUSY_COUNTER for number of address bus busy cycles
+    - LATENCY_COUNTER for average latency
+
+  * Counter overflow detection.
+
+  * Outstanding Transfer Counters (OTC) which are used for latency measurement
+    have to run immediately after reset, but can be disabled by software when
+    there is no need for latency measurement.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-axi-performance-counter
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+
+    pmu@5618f000 {
+        compatible = "fsl,imx8qxp-dc-axi-performance-counter";
+        reg = <0x5618f000 0x90>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+    };
-- 
2.34.1

