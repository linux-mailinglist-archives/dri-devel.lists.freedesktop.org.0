Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2E99BAB5A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 04:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE5410E361;
	Mon,  4 Nov 2024 03:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="WMdLn6pq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2081.outbound.protection.outlook.com [40.107.103.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B8010E361
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 03:29:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jg6tlSkG3kgeer/Xms0a5c7/zgUPRcJ+Xbic23S3oOeo+oHnSLBLuXPJUFx5gPpF1V4Ch+pZELFpm3aybHGrOdz919qE/lQdDuR5IJaUge/ImxKGIokaVO89Vz0NJmyrFP8UqI7EMIsAq6UiP1HL9JcABN6Fi/YJjw4Vr+Aktw7u5ooHLsml3B0y+mue07dCSZuXH1ThhTNRJEgQBlctUtEm8VAdlaJqXamokR9pFpvl/CnboXYvHTHY5uMksbGnFcNI8MAhci/rziCNkrRgScaPQKijRSLNvW3OIQCZe2geSt+nvBqVTw3gAbhVv68/AdSm84fkBxEzW6N+FU/I8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gOBNbnJSnnxg836bf5WghF5VYpyYcxTCh3be4zUFvM=;
 b=yDF4+6giB7WUdTrH7jil3ak7gEqHW8Cd+8FqdDFgsMsbDZtUCpmW4dBGyyJ4pmY2MubJHmD4zJbK+O7mPqCtBLaEIzrhjRbCdpDnZzl4CARvfGlYN1VpauNliUNLgevK+b0IjhMchzYHAPRXDZBeaiJjZ9R3n2OP4Fn0kR3cczFxJBxdHauaujkQH/naOD/HcypuIj2LnydBw1dGykTK6gEQ9M+McT2NI0TDPHmAINwUJBwyV+LOScLqRERIXGbexGzXMbSm7yUfJjzsCujGHrjUlwMkGGtb6b/ddnUDRfsZCz6W6xucagyts5QKv5wV/ChgL26rsdtpa01wwcRYFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gOBNbnJSnnxg836bf5WghF5VYpyYcxTCh3be4zUFvM=;
 b=WMdLn6pqxNwvZwlh1/fC3mvimvXm8Fe/VN/DNB3gmF4UuD/DlEgDqE2LU9Ww4buXcYOOJEkm6AAhx0qIuspeq6XuqGU4HOBuZudu9ttvzcgxJMaplkI+A/p1C8i6qhy7NZNNtQqd6Z7lm8u+2XUMHRfrvObRAO3BVwOj00+FdZ4IGBvJX4G4ePE4hJ8XvyMiq1kpidq00hIXgQpNoZ0PrsNIsNz24YiFlVCvsA0zfnMWkCSIMjhEiYJBGBXE6ySuUqL8keESjgp+BfPNvIfozVBVQm0TnKc5hdsq2YFd9ttAelcKb4kLIV1oDXd3u3NXrDfXDWV8eu5IYYlOZFg9aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB10602.eurprd04.prod.outlook.com (2603:10a6:102:490::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 03:29:49 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 03:29:49 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v5 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
Date: Mon,  4 Nov 2024 11:28:01 +0800
Message-Id: <20241104032806.611890-9-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104032806.611890-1-victor.liu@nxp.com>
References: <20241104032806.611890-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB10602:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fa3452f-1654-4e08-5ece-08dcfc80effd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1S159AnWlgBAkVqHktkpjD9wIq7zdskMaU4VYZzJnUF7Y9pk7E45Ezo6fmjY?=
 =?us-ascii?Q?lzhDIjJ6PuMB96GppVwcBFzCRI2Qn5Jbw8YkudECPho9omra4I5gknmc6Thi?=
 =?us-ascii?Q?deSj8uR4qWYiCieypYaOOOE9kB448UMaRsVrtJ+ntPicvh4gf/ywGIf1ASDq?=
 =?us-ascii?Q?io+Kqqvx3YdiWKsk0C5JG8k/jf/5y3f6Rx9WWt1tvoY2TXC/N6hA/HEMJ3Lp?=
 =?us-ascii?Q?Z0X5F9fBg8aMfoObmDh+kPWeW+6WLcKj1Y6I/4cV6m4+lbE/CeGnCvpjNJ4x?=
 =?us-ascii?Q?pCSm07W/8ZIDr5ZpYBJSKEw28x2fI4KCRaEBZVbooBXuFf+rOUXoDfYZlkiB?=
 =?us-ascii?Q?5dSlIfCDrTCqz6e0StiMFwmTr0Ar6N3AIFDA0WiQxhkSYLirmg0GjRGhZTub?=
 =?us-ascii?Q?kmSexgPQ5UyA4lRXSjDph93ZZwSxExD8YJiBIiWXW5QYKiYbzNECROo7YiV6?=
 =?us-ascii?Q?mQt3ChMirafUKx35Ac6zpwrBaMTi2PPxwwJ5I4BHyCJu0Nm4WCwPIqlPXAlt?=
 =?us-ascii?Q?H0QotH9eA5MXWRrUSmyLemgCVeifCmcCbB7xGMAgqFJhPto0fabplGOG05on?=
 =?us-ascii?Q?6weqk/Qw2TYT9IXqzq7Q6vUdjtQvdshboL+h8f44PvXIjLcO9TMhZGcZgN4H?=
 =?us-ascii?Q?d8pTKVYkvfY5R1m42HKNYahkLtgf063cDqFBlN4o08rCkFIt6R/WYHW3wEq3?=
 =?us-ascii?Q?O7/8SQLMW13E8gwNk8pgchQxFulPrTNBPf6mcYDrpblO52OoaKcraEPrigVu?=
 =?us-ascii?Q?ajjHm0Yy6KnH5L73IpGOwg4ebtA4p61TcCSXOPWWEs5FR41kz0do++7Sigq8?=
 =?us-ascii?Q?7ORhcXXJyndsTgRUe8/856VPnn0bx/y7618S+oq5yLK+JdLcee9JruaM/g4v?=
 =?us-ascii?Q?aW1hPGpILuAKn32CLMDLDeCR8RghmjjcQcvbbpUurx5glN/W6FRTt27DQ8Bv?=
 =?us-ascii?Q?dnJwDHchnn4yblg4Er/wAJbSnYeQuJfuzgGCTlAgzvLcy5IY4XMk0wCUJNZ0?=
 =?us-ascii?Q?aQ+rbAJAZHcHE1TiqIPyuc/zAPGzoCzT0ikppA+zPA7GNcre4+ikIK4w65gR?=
 =?us-ascii?Q?RHVDA+ewl0caoJjkuapxTfE8L0fKcMb5YSCW12WMlTnygWs9mzovdf6j5SR1?=
 =?us-ascii?Q?H2mCb7sYnB997iSSoEohn1Y8VY/VvxJUjLc86jCiU1I9np+VI8QNXmexruD5?=
 =?us-ascii?Q?CcxfJlmvOWOc32jDxPXHsyJN87ybMPKwwvAQj047hyOcoEga2PGBHb717Z13?=
 =?us-ascii?Q?3eeFQV12/9l8IezImblDQJJmL/inZBDgemPd1S2i/B2wf4+/RHVCgGgEcnWN?=
 =?us-ascii?Q?7FPUgxywARBgBe4oNaPm10Kc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K+trcXKeeybs+qoykGGNb+cpnslx3JAzrowS2AykSe2Mfg27SIp2kh1ufXq0?=
 =?us-ascii?Q?sENYkVkXVI2HtThmYTvn1gDTsXjsIDhafDiYQx7GJXJg1AS57oCxBHrnrmrf?=
 =?us-ascii?Q?bBPZ+L8Q70uScw49K2Udg3ST8qO3pt8QmXXJS/JwnK7naAb36qG7ItdFkjSm?=
 =?us-ascii?Q?XWOjwRtr2/wsj9YFou75hnrKxZBT/AVvKwG9GL7hRgh0OBcElz67Ruk7p3qE?=
 =?us-ascii?Q?O1MxLHYVS3omJyqdiv1ZNCx/IRK88XvKx4FlXoM3kQcuIsq/AESk2b6j3g+1?=
 =?us-ascii?Q?s4uyxYjCyhfqYk+KpYABe/VWc4mmqEVMmJ0h/y7wOb6SjGIwi40Jlp4qNseg?=
 =?us-ascii?Q?muo4knqEDHBJYxB4DbzxOcTBA8XebTapbqJN394uOuvYd43Pzo/Rv/XK67jA?=
 =?us-ascii?Q?EEXwYOWmAPC5kXevoK/AFnGxuplVkOlC48YA5dnF6MOiiLjB3O58Z36cQ9NL?=
 =?us-ascii?Q?gSFoocPWCbHxdBeSPwtQC9Rdp2fW1ZLt6M96QYaAyNQqmEbV9UGfmcTOoBHj?=
 =?us-ascii?Q?vAun3gMpex82j+LvklX2tqEPgjacbyI2o+aKzBXY+EfPYB2/xN8X2PTgSUwz?=
 =?us-ascii?Q?2Gg+V3LvTzWBxtJ9BQNcO3Fy9j/RSFCIPIc28AJEuCoGH3PBuqB1Moaqjl6J?=
 =?us-ascii?Q?AJ+JfLI47xxwSxRYstgDmeTkz2N2QttcJJNVZgGv9jFPpPTKWwyvjE0ZigqH?=
 =?us-ascii?Q?2Gn8j8ANJPXCarmtV8Urzhgg70mtuaS6GvN69nfbTz4oAekDWrPwKZeNViij?=
 =?us-ascii?Q?h4v7Kp52OjrQlIJJahv6UVMs2NlG/PpPGpwxRivjy8G2wUSuZm9UcRZoxDvh?=
 =?us-ascii?Q?IHXYEMuvCxcVxXJG3XbEMV/JdKGwkzAeKZy6LPkgIwR5CJmaqVW5zFI1Asei?=
 =?us-ascii?Q?zL7gNLBrUcxiCgJkAPVZF5H4rfAwPxyUjneVe6ZCmjikMshfcK3W5xWn2rud?=
 =?us-ascii?Q?kfpLKexRtFph2J7sHFXwIm9M+r/KYmnw5VMCeQmRQ1KL8Kjs19+Qb/686f1V?=
 =?us-ascii?Q?S+RGsiPe+YfuX+iPZZf4BTZDfRQ6C/JQy4GqHLrsjWY9X9RdMZGDEYWSJqn0?=
 =?us-ascii?Q?V07xH4QdCGlhVP38/BR3qGefIzQsAETk1evjlbhFcnNxw0JgHD9RaaggdZ/F?=
 =?us-ascii?Q?u737D5YKuPDdrFtlwpMOgDUKeG4PbVywuRLsU/hsQDdope12kLvJhJS723tM?=
 =?us-ascii?Q?Ch6GVj7Twlp02k4X34ZAr4djl187FKLs6hdNAmIngxVXBcyPVvTA/7unzgpi?=
 =?us-ascii?Q?/M6oF3mSm+y7qmR7ZNLFdeKUCRbvUQ83oIwNoGV1VqUEO+UVQSeMgjA1jYY2?=
 =?us-ascii?Q?4XlMvUJrG7YFDZI+2qYb1QZ/UO42DrhIhFTjFdJzhqF1VQi6zM9BHKLULvBj?=
 =?us-ascii?Q?1hkThqfBK7q4hneI4xboNOLAslXbYsPc7zE/8rpDCUaoVA/TcEONA4c6X3hL?=
 =?us-ascii?Q?la8Ri6psNnorzkDS64TRKbIPlB75bHY2e9UtlWxV2ggThYevuX37uju4QN1j?=
 =?us-ascii?Q?YZ1Fc2FyYEqIG7nByAE2DowQOG///A4vbz37nfLB6S+6xIDeq5iThANNsa4n?=
 =?us-ascii?Q?ZSKkDKoaRaIMZae9KIlDxUCE3oUVgLQ/Mli1GuRK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa3452f-1654-4e08-5ece-08dcfc80effd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 03:29:49.4108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3yD7tML5yLLNqcStZsGtjGXBAfosJ2T9Mk8VSl8OiMjwlZIc/HYgZiMuopAdg/sJ6D3rTBnAuHZ7G/juIv5s8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10602
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

Dual-link LVDS displays receive odd pixels and even pixels separately from
dual LVDS links.  One link receives odd pixels and the other receives even
pixels.  Some of those displays may also use only one LVDS link to receive
all pixels, being odd and even agnostic.  Document common properties for
those displays by extending LVDS display common properties defined in
lvds.yaml.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5:
* Use patternProperties to define port@0 and port@1.  (Biju)
* Require port@0 or port@1.

v4:
* Squash change for advantech,idk-2121wr.yaml and
  panel-simple-lvds-dual-ports.yaml with lvds-dual-ports.yaml.  (Rob)
* Improve description in lvds-dual-ports.yaml.  (Krzysztof)

v3:
* New patch.  (Dmitry)

 .../bindings/display/lvds-dual-ports.yaml     | 63 +++++++++++++++++++
 .../display/panel/advantech,idk-2121wr.yaml   | 14 +----
 .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +-----
 3 files changed, 65 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/lvds-dual-ports.yaml

diff --git a/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
new file mode 100644
index 000000000000..785701fe1590
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/lvds-dual-ports.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dual-link LVDS Display Common Properties
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  Common properties for LVDS displays with dual LVDS links. Extend LVDS display
+  common properties defined in lvds.yaml.
+
+  Dual-link LVDS displays receive odd pixels and even pixels separately from
+  the dual LVDS links. One link receives odd pixels and the other receives
+  even pixels. Some of those displays may also use only one LVDS link to
+  receive all pixels, being odd and even agnostic.
+
+allOf:
+  - $ref: lvds.yaml#
+
+properties:
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      '^port@[01]$':
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: |
+          port@0 represents the first LVDS input link.
+          port@1 represents the second LVDS input link.
+
+        properties:
+          dual-lvds-odd-pixels:
+            type: boolean
+            description: LVDS input link for odd pixels
+
+          dual-lvds-even-pixels:
+            type: boolean
+            description: LVDS input link for even pixels
+
+        oneOf:
+          - required: [dual-lvds-odd-pixels]
+          - required: [dual-lvds-even-pixels]
+          - properties:
+              dual-lvds-odd-pixels: false
+              dual-lvds-even-pixels: false
+
+    anyOf:
+      - required:
+          - port@0
+      - required:
+          - port@1
+
+required:
+  - ports
+
+additionalProperties: true
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
index 2e8dbdb5a3d5..05ca3b2385f8 100644
--- a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
+++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
@@ -20,6 +20,7 @@ description: |
   dual-lvds-odd-pixels or dual-lvds-even-pixels).
 
 allOf:
+  - $ref: /schemas/display/lvds-dual-ports.yaml#
   - $ref: panel-common.yaml#
 
 properties:
@@ -44,22 +45,10 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
-        description: The sink for odd pixels.
-        properties:
-          dual-lvds-odd-pixels: true
-
         required:
           - dual-lvds-odd-pixels
 
       port@1:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
-        description: The sink for even pixels.
-        properties:
-          dual-lvds-even-pixels: true
-
         required:
           - dual-lvds-even-pixels
 
@@ -75,7 +64,6 @@ required:
   - height-mm
   - data-mapping
   - panel-timing
-  - ports
 
 examples:
   - |+
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
index 10ed4b57232b..e80fc7006984 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
@@ -22,6 +22,7 @@ description: |
   If the panel is more advanced a dedicated binding file is required.
 
 allOf:
+  - $ref: /schemas/display/lvds-dual-ports.yaml#
   - $ref: panel-common.yaml#
 
 properties:
@@ -55,28 +56,10 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
-        description: The first sink port.
-
-        properties:
-          dual-lvds-odd-pixels:
-            type: boolean
-            description: The first sink port for odd pixels.
-
         required:
           - dual-lvds-odd-pixels
 
       port@1:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
-        description: The second sink port.
-
-        properties:
-          dual-lvds-even-pixels:
-            type: boolean
-            description: The second sink port for even pixels.
-
         required:
           - dual-lvds-even-pixels
 
@@ -88,7 +71,6 @@ unevaluatedProperties: false
 
 required:
   - compatible
-  - ports
   - power-supply
 
 examples:
-- 
2.34.1

