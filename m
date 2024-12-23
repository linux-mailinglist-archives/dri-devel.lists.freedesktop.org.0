Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0AE9FAA8F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 07:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7391610E363;
	Mon, 23 Dec 2024 06:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="an9t9+JG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2056.outbound.protection.outlook.com [40.107.20.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20F710E363
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 06:42:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYh+5/seUuJTw+6+PIzv/laUNb0n2993P3frkYLCSDbUEe6+1SuLbd/bv2kW3U9pHVOPhgIplQ+LvO4Ds2NH+v8jVA4MpD2NabzpNm6Hyp38CazL9dMvVKIGYyV2CspAZc18BU9j92xFKdjY3KuAfL8NGltXjankAnTxrLMllumDLcIjGAxiHzXEn1Splc2702ergctrpiW5uvw4eO5p1fhFEEKMXqkgydbP9VAskNDaPX39xFXsQWXcfKIFFGUrH+cLnXyqFkF6l/XwFDNyhF9P4In35FvYmIvMDn8YRsfdggLaDgJ01QBdWECxAHoTjz/w+7kjPnm65V09er8ucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdTl4XzLq3uK2kVhxKL533QhbD0oSbMsy8gP1DoynRc=;
 b=kT6zPk+lZX/fLIyGNyT4n4uvcb+DfqMo8LebUk4BoBv+ZMaKGOYiVDoiu7cmvf+Rg5h2tQLFisAnc1Pg2wiHZmVGijnRIummiCj4xnacU6VeWI7KqsOSXECGJnYe2IigUsSbq8nOrnHwo4dGJcjD0rkDDyWgKNIRBgVvWJi1D2BExkxlyU86qZVCg+HY1IPVRELHZQLVhgyGOyR4g0nEtCS2GYDRpgDff+S0/befz4DX7YGVeZrhT0gvwLgPuPqYM84Ceqy/AgYc3+BO7DVEzjtafZbeKucQUjpQ6rvjCgpHQNQruwXzVGFRP8XSFmaR135424XGO6clmYTCwpCDMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdTl4XzLq3uK2kVhxKL533QhbD0oSbMsy8gP1DoynRc=;
 b=an9t9+JGPKUc1wxKAP9EsylZ/ymhyjFhVEmjS80ERhbgnUyN9y6rj/YWPCZR1wBX+IZS81ZvfZD224m+pPzm9kW4F4GylPi8Lqo1CuY4bg0FVbUt7gNqLcvEoEqGbIvQ9zpMIvBtHvwSyTgWtzp+fy7icjV1PYuu9HvMqWp+5bYfQV3BC3BnCgDu8phvUVmPEBqrabSgzM7HhfuhfPGLO/L9xLMhAAyZW9dp9swFlC7Meuo2WdK4uXOWlkWHbrO/sk/wPi7qm0DBAzxQ8KgwgSoItfh2TjjovMRAJex1RO/vRFUjXWGc51rohXlRgCnE4KrH4fpXV9ly6nV9Gx//kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7941.eurprd04.prod.outlook.com (2603:10a6:20b:2a6::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 06:42:39 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 06:42:39 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com,
 dmitry.baryshkov@linaro.org
Subject: [PATCH v7 07/19] dt-bindings: interrupt-controller: Add i.MX8qxp
 Display Controller interrupt controller
Date: Mon, 23 Dec 2024 14:41:35 +0800
Message-Id: <20241223064147.3961652-8-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223064147.3961652-1-victor.liu@nxp.com>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: bbad2e8a-f1c5-47cc-5ecf-08dd231cfe41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?he9r79dISTelERZGWayILJ72HOHwou0C1QgwGYqiZTzq9FHoLyiT3c05BL2y?=
 =?us-ascii?Q?BVVjgLMTtQYACw8R7I45/bNEU5h80hy2vX9dDMnuo49LQ4/kYdyJQtVSEZEm?=
 =?us-ascii?Q?/EJRTlADJeGAuRhrIlAB4VPFS0wtZveBJk5I9Aj34UIxufg4CRTQ0ddjIAds?=
 =?us-ascii?Q?ytlQ4WnuUbunRkNvk1W82D51LxwVvm9yIl2EawKhs9juEKQb4bc228xeehZF?=
 =?us-ascii?Q?NZ6eXwFvtPIEQAUv9RBXY1iuXtwuRPq5fdCfhyrp9y21Ek/CsFkb11f+GNMD?=
 =?us-ascii?Q?+CuXrRbk89R64fVjx7u6PODhajpUMFDvzoCyP2NwpvTPloXu1CAWKzuVgvej?=
 =?us-ascii?Q?97R1npuHN5dSVJnvasDLUhWQWTDGoGcTXv8Tq6VPvP/76i/wV+f/9k99RCra?=
 =?us-ascii?Q?2f7LDvuKciVk8gh0MdOu7X1Bv6BER96V4FPQrajrNA2xdjT2b/pj5ZXk7dHv?=
 =?us-ascii?Q?q5krrLfNUPTLUyUpVk+bRHc1e4/3O0JJHZQR2Xe0MWeah/ZAElSWDAVPNSvN?=
 =?us-ascii?Q?IPAy+uxIlRMXQKUsOXpZNPRZn3bTwAqMPMMHm0QDcgBcS9eAWeQSupaj3ntH?=
 =?us-ascii?Q?eWLW/nf6AJ+OC6MVME+EvSBNFHotMgheh3lPlUAaB7CgsJbtNWYcftCfqFBN?=
 =?us-ascii?Q?kyzS/66bTget5mFCfKPnl0dIyI3e9FvzScQS1tIUBtrpegxt16nTPoh81Eer?=
 =?us-ascii?Q?w+av8dy4Qn/OjtZXizCOJJ+o9tAtLLEKgRIMi06xylO0nU3gou6Hy6NBn3nf?=
 =?us-ascii?Q?iqDCbvt5UI/m/wSwCSmPBHopWaQtIdFd7gU8z6Qenr5n8I4iPMVA/0gUmaFO?=
 =?us-ascii?Q?nW2VK5XTlbZE+6AOSG3Tg5Otvnc+iHTkWjXZ134M4Po+fmkPfUBTR+U3v/RH?=
 =?us-ascii?Q?V0VIfmZjva9HUGrNcpiwKmpxj445TOWKb8Qiv6Q6VrkI/zpsPmG31nD6co1D?=
 =?us-ascii?Q?Vd4FhZdjIol5juvqK+mfx+WGck3ivD/bDAM5bmX7xqHFvMwEtpgQZrUrDa/z?=
 =?us-ascii?Q?cbdVIDAkA8JNzRe2ikvG8eZQaMqrOdqHoJ2mpGXulx+iLwiYbKHp88JJ7h1+?=
 =?us-ascii?Q?o85Z9ZllQi5VgltNIwwdmIH1rBGKN8DaUKq4U3D9BgH/oPs7WBtgiTgZPhIa?=
 =?us-ascii?Q?w5LPfILrTGrR8rpQhngqJn+I4lQ/8CaKs5OpD9HxCKnryAFq9QOsQ0vMddEi?=
 =?us-ascii?Q?c5HjwvIrpHpo8/9HQB+S8htj7cf7reXBObW16rW0WiHqnHWA7tBst87Tsv2i?=
 =?us-ascii?Q?YSj6oe+ik2DLz+YDtzCZkhndQ7L5IoUQ2FjvT+VGDqwc2JX3wXaHY8BrBn59?=
 =?us-ascii?Q?gkmuniPnkTr5tDXvJCg7oijVd2X9ljCRQ5NMYbYBGHwBKz4h7Fe1+qF5Krzg?=
 =?us-ascii?Q?ShuVG5mX6xbcEkCBIzCEij4w17FK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?91kjVZTth3VIT5XTnecEqRh6ca2zc4C6Q1K7B/4mzFyHRsWio3vQsbnKpQUr?=
 =?us-ascii?Q?QKDJLqE7wx6A+0fzooOB15IeKpkQqxBoA+Jlgh3qinHigxW/0XQirpDK7sti?=
 =?us-ascii?Q?M8phoS2GWGpWLZMjvHSYmXYbXC6GO2/+EsbzLMr0lTqHuPjOvxbb6WDCqEOp?=
 =?us-ascii?Q?3eHr8yQIgq64lCVvQYStD5Q5VRnLUFUBTXTvO/QhgEGjwSo8zfJM+Sxpc+52?=
 =?us-ascii?Q?Ra7slPeBysp5IU7K3BxEKC/Ohu6jrS9w3tbv566z1WS/AfAZX8ZVHclC821i?=
 =?us-ascii?Q?Uj9FMtasBJYpYjPMDqfILTRlroLLXbhfRH0/WFDAI89K4/bYydHo0gw/Zs3G?=
 =?us-ascii?Q?rPYExhNeIYKLZxE3INYVjDTRK++r3TepsCppSuyG9yKS1OeGxafmMueN6ln6?=
 =?us-ascii?Q?jhoyyYs5fY3xX96Z1nDHRBxQSk9hjQasRrwAuPbE3GBx+n6MXwMD27QrPZz3?=
 =?us-ascii?Q?Bk8KHQSqSVjZCbk+aDm0zlzWCbB5YkwCeyQUXgQMnBe9ap0Xttzf2Jnypslg?=
 =?us-ascii?Q?an/HqTP243fc/CLxu3Rp5Ftj3DV2rL2w9PhSWhL61p5K/hBAFgz9xy3a+Weh?=
 =?us-ascii?Q?6JfcnbC1sgYATYeD1rfM9B8WhXfUs6ShvQVf7K2vNALUhoZbKinuijTu4X1g?=
 =?us-ascii?Q?QcKPpxntlh7JLs9xWmADfPwpxdOUoEKzvhtUF4FJIaJErNTzkdN85WB23rG5?=
 =?us-ascii?Q?b5GK/TiIl/KL3WlL9y2jYcCySdhitSC5VKJJ3jCCbwCqUXCWtDKO6FVCTET6?=
 =?us-ascii?Q?8SjxdKIz6kG0DduNsiG0kVZps6oaCmo3FMbEC8vJEa7BYTTIPSV9a4iIXv2b?=
 =?us-ascii?Q?skZvlNyJSFl207fLgx/RKb1ZfeMncyW6vCmi4ECHGh0ZS0qFlks9x9iR17dF?=
 =?us-ascii?Q?AtHKs3T/YybZfetrqjgidcjpDiDIuRht+XeRIA+SG6LXSMz/RP3D50cMuVeB?=
 =?us-ascii?Q?P0LxbDyjPrfBpmULUqo4JqtDSDV0wALPw4pm5s9iT13L5xbwT7Fcz63i9yF7?=
 =?us-ascii?Q?sGFvyHXlqsaFsS5aKWNx3tXJPSUbKEVpozFYNwlBDpig9+Z8YwzSVSinm7fn?=
 =?us-ascii?Q?Ux5qcc9qvB8sePi4/PS4r5ZpWUQuPS0RFBALbXe65KZjxVyN7yJ0YcBgRLec?=
 =?us-ascii?Q?2na+2mNgpmTOdSLI5e52bJ2gPxlvY+nVkrGADZnq3f5FoZvww/yoEPw1j8sp?=
 =?us-ascii?Q?PJdX16OAooCrJubQGOxrb7ZeTDQE/Ob2yovp0R+QOdGgybVVJN0IeVE5di0E?=
 =?us-ascii?Q?q36QNodBjNBbMsVeonqUcaAsfp+pdxZfNv5QqQb3aA6t+mhZIcCKeNJi22dA?=
 =?us-ascii?Q?jsqAvqXKnmpBqNSXo68ZNP+M7BxDNXecbrjvT5sGRM7ZCvWCfcDdMMirY7/b?=
 =?us-ascii?Q?RmYiQHcWuUCVuOa2l4+h10H7FcJ7iIkGXVptEZboh1CchMHWtrAE5Bq03gLy?=
 =?us-ascii?Q?vDIbBad8F3tRdBjs7+fTbDSM5rQAqFjisqOb/EsEJQt+4vfddH1XoGX7SiLZ?=
 =?us-ascii?Q?4AlRPu6IYcOcm6TDhAfF8JkxBJx6qDdHkOvkhSq4cI6qQ6+YbHylL9yXZkjR?=
 =?us-ascii?Q?a8Mv8wru6b3ogFAGPCu2+XWSGjfgHbW//GGxYoe1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbad2e8a-f1c5-47cc-5ecf-08dd231cfe41
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 06:42:39.0856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/YKQEh3RiRYRCNjYDN4lEnYZrW4jGxrHbAe/r/wsNe8mg5193bnb2mtLpmOhgbq3aTNHCK/rMldzLocwsLfMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7941
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
v7:
* No change.

v6:
* No change.

v5:
* No change.

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

