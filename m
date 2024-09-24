Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0F0983F4C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6378C10E5DA;
	Tue, 24 Sep 2024 07:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="QlAC5z9m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013070.outbound.protection.outlook.com [52.101.67.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D44F10E5DA
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 07:38:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/t1dwHP7bUEZDGmZaaSVshtsHYVdr6Z1VXC94kTEk8Dg61K+M/rVoIJ5d89ErrcU+EUpEQWQXIgnYC8euR2nyRqVlegcn5yllygSeMOmBNo9rAF4aUwuu528yTRnHkAYhamjmf2qz/872buCcZGulh07npQT/5yp2aNDl9ShbkxyD0wbyTw/jylYm75l1xdlq7O4sc3iUcaX/i52uo2VAkNewead2fiKS6bAwdS3yhQBiJiiMHaHDjLNfqAnyT9rMJ/csXdnFq39gm04Zv9uxQ6AuHjliVAAjrP8siaCZgBy07tTmjTiBsixLC9o/RK/h/NLrn+MGVsL2AO3Hg8AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhMvV8ZI6om/xAMyPUg6V1q5i/7Rt0cXDmn4F0AbbP0=;
 b=g+pJ959sYyrX6YwJjbTQtLdNDtx50tFpWQbpgJy3cKyxKlRU3upuoB5szuFHBWwk95pcTF2808kmnJiO0y3T7tjkHb3IPiNegKUDcUhZpuT/vOcsuWUKVdjjP+jipIxGqWi7SvD4ySrOUoLIWS5YIpYmu9Th9SXHBFEw9g7PG8ZWdGmNFm0cKGRKmTprdb/glApvqvQto+KwmYZ+elw7pOf0nnvTcXmi+vY+VDvzUks2WXim4/gqCBylAPwtrbLZ7UOBAXFZHitRYrMR8UCpJZDivqfya6ABkTv01Is6KQfYMVo31pGJLbj7XuFkmoxDHN5NMKPemWTMmYAqv4/mNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhMvV8ZI6om/xAMyPUg6V1q5i/7Rt0cXDmn4F0AbbP0=;
 b=QlAC5z9mRQzJwNt89rCfmCpxhM5bt2iRGET8vWETmvFgckblUyy1He/8xVYnedFNMrRIsNrGs+y1DBhTwSrrtqSvlMXkkJvohwqkd3JdSmH+XquMUz1b79d/KnlHRLcEpZ6qSqZD1H3bmzL8VfQlE3xquxfEhk3u2T+tLME4akOiufzt6mVez1542ffUYI8KOlT7BqQLZAPYNKzWeQzLCm9MIFAvyX231FwiKpLSdedI0JGpkja5UkH4DKNUjlaZjMfluJ8mP+14+XR2PDrWj+CX89YLWUUoKiYgrB7rqvScoeTHxOIT+iWncZ+8fDwmbFmJQjEg4nlFfwRiG77Fkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB6881.eurprd04.prod.outlook.com (2603:10a6:208:18b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 07:38:19 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 07:38:19 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 mripard@kernel.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v17 3/8] dt-bindings: display: bridge: Add Cadence MHDP8501
Date: Tue, 24 Sep 2024 15:36:48 +0800
Message-Id: <b2e1d26f964a03163ec7a1ba6ac8d7c88d6cb111.1727159906.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727159906.git.Sandor.yu@nxp.com>
References: <cover.1727159906.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: d33037ce-613f-41db-ed32-08dcdc6bdc22
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yGBHaJotht/VeSehQE95teb6WOKfI+zkUcNok1ZzGdSWUiAvWj9lvZ0WtdCF?=
 =?us-ascii?Q?VS9abgu5BYdRe1tREy7NXfX6BqQADprbvgMVcLmfDIDqsrStbws0nQfbNsQ2?=
 =?us-ascii?Q?o9G5CdQC9Zj9vNvDLX89dnns1jc1m4Y6Ea85KuQsy1K5DBZHrNbW+xmgCYJi?=
 =?us-ascii?Q?eZlUsnh7A5jjpDThCDm+OQwusbnhOiG1v/EOEoaB4Z5V7CSt6s0zbUYC8BQR?=
 =?us-ascii?Q?L5bumqrqTiW36CVXVOHtSg8QJXTeUoOSd3475v6DKy0QIHlGMoL2PgzKV7ol?=
 =?us-ascii?Q?ZMSeMfjgcT0w7JBkxXosQKA+DKVP46KaP7KyUL9psvIT1XFFuxcjPKviqWaB?=
 =?us-ascii?Q?TFH4nosTMxY5QoG/za9wbC/pbrYJwBGzUsFQjGqChqHs9EzmyQZKytfZGAxG?=
 =?us-ascii?Q?5JX0SZG6GFTfas/TJYfGP3TlCtpYeZFAp1blbIwJS7X/e8nKSnZf5pYiniR7?=
 =?us-ascii?Q?4ark+mx7foUS5hgCkZflfshO5WsInbuBOzPrhnD6J7DDANSILOBwzjWgejFq?=
 =?us-ascii?Q?/Y1DHI/HsS6e3mbA3NxW+vjxqkIizCYgsZHIEBcIWOiN+6rp75AwoD1l5vN/?=
 =?us-ascii?Q?wpThkrR2Aii73dmZpKxP1d0eRkzHLpMCplkRrGSWWi0VpqceqmSt8VVEQTnJ?=
 =?us-ascii?Q?2p22JDwTRhPo72Ftv7bbx3N3jNiuS+225IEg27SRkIlF6ZkzX2mNwkN3BzTV?=
 =?us-ascii?Q?FKuN6F2eiKdOAQSSgyO7oazdLgKjwN/W9ETRb0ExRwB6aPnYdUKYXSUIozSb?=
 =?us-ascii?Q?lfIVbL2DG1KYa2EiVeF8unlo46cxvwEWrLP8BKA0l43qLhP8yKb7OhOHBTnN?=
 =?us-ascii?Q?YlEDL58ANSiTq56UCBfnn8XhxlZxl0tixRQENba2IZESTtl5Cix3fCgRV17i?=
 =?us-ascii?Q?bp+wHjrboVr/dSAzvob30P+50IimqSZQn4MffbCBmwd2cte5T2DJnzV1wbJo?=
 =?us-ascii?Q?Spr7tSnaZWw0/oFNzDywQtIgGj7ftjOg8LF0AASORoQR24DRJAdEOUKZwBFq?=
 =?us-ascii?Q?pt6Q5+OhCIxr80P0l19F+X2vzGjODtQNu7oFXnAnOy/EleYoApiY337/F/nf?=
 =?us-ascii?Q?nVxoXY4GVnXSLANeJQwKKLrMiYQQJa1MMJVjeZq42CWTyPn+UdTB4ZcQOXaR?=
 =?us-ascii?Q?QmYfvo+EkhQTVzfj5RiGCjTLwj2GWVdt7uMF2ippZJx8u8g5vpzBIdIVI1YS?=
 =?us-ascii?Q?z/TRis9W3TiqC9zLGkiEVzVWlrC/T1dqI62PeNIYpPzf4L5KqnKc0iKhrMhE?=
 =?us-ascii?Q?chuVRh7tMe8UXdliGVI/Ysm3fIky+usGjVGn1mw8ArYblJ88wF/1zZNXUvfJ?=
 =?us-ascii?Q?PTcuUuProUI3R0e74UVHJ3fDOG8ucDztmvf8VfN6oUY22GgHTXk4onOihoNp?=
 =?us-ascii?Q?/wVBTSJxI5aE2pZ7nH6d9J7YyGnI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?riIdd8Q+1gn1wfyhAh++hdNVy9SuAIXmzAkCyt/wkZjOyxY5uU07ur0lW3zJ?=
 =?us-ascii?Q?fpWvdk0WwfUcGaFX7F9HlEYpa/E21eLiiFewE7TrucIlRqsuiCRLvMnGItC/?=
 =?us-ascii?Q?ai+RYJ+LVw3K6aLERFcQERorN8xCI+QR6yK2UEsBR2YXsfqkXIA2TILHPn28?=
 =?us-ascii?Q?5Cm6gHFnPzqJUZ1J78BiLUZFqBojHhXLzBSmbxCr4u7WF/aNRpWBovVRROF4?=
 =?us-ascii?Q?Njq416hLGaL7/MOP6Z4NPUQKtdxFP0jbcnZLK+USuGFad2E7zMT0WFxHDqpk?=
 =?us-ascii?Q?C/v5mBLbSEh9h22bLTHy47cC28ko/2C/cFZvMX29xo0AKChgfnUp8VH71LD8?=
 =?us-ascii?Q?ax/lqKzbhWx3kSMXbpo1FRSzM0rpTcKBwhSGL29BoSvGKQUj+BKEeIKY14mS?=
 =?us-ascii?Q?5gkApuSRk9JMqmO6UUvMLL6iEOBSwD9uUiC1T0vmUhk5d5jirJwMKPjD1K2D?=
 =?us-ascii?Q?q5mMlkXXV/gGy3xCuXcUB3TzUtJcMOvSnejjbXGon+Uc2PhuVKs45zLrW2LD?=
 =?us-ascii?Q?yFVGlG5hXGCSxOvli2TXGwH9cdMCpjkkBC/jDgkzZ0hK0N4Ens5jcotpwZRN?=
 =?us-ascii?Q?JdSJMYC4YGvYkyz8q82UE24wW1uI3Sj62kAkqx8gHgp/kKMNw1VtOVxpXT4C?=
 =?us-ascii?Q?Ex005qiPJynlxuH853ha8fuHA4EdRVlzjy8j1GAFJKuyr62Xf7/lsWaDtems?=
 =?us-ascii?Q?qF3NB6hhhVhJCa/KsoLE3o84+UtslpNrmB8dSfnWwLND0N0ZScTZdF18A2D4?=
 =?us-ascii?Q?HpZXCAaHzO3WoP9WcDYjdWadHxfQ0kSBuXwaSmfh+puD2mg82WDNFCEMLfA5?=
 =?us-ascii?Q?DwpEFUC74UdbXNPMPvQAjK3nx+x5yDnBiS4vZ//t3g0+phQJKX7Pne8Zz0JX?=
 =?us-ascii?Q?oTJ0IPXsCuUXWzi4WebD46mVVkuUg2NtObAwQrkPllz/F/UeDJrDocChLeN4?=
 =?us-ascii?Q?rPmSmmi7dYQV3SswqZPahTCnnZF6UJNZC3Yh3GjA/x6B4x8n02DOS35ZjrRX?=
 =?us-ascii?Q?R6HpPKd7MUv4vyXSLGQEa/T4qLhYQa1gVPz4ktzYXo6zgG+ZyjWO7h0N3nyx?=
 =?us-ascii?Q?JKhp10XpZ3x694QmK9ykxzFSmyWo4FHTyzDavdpXBHH9+ypSoyFYh+yagq9Z?=
 =?us-ascii?Q?Ua7M9/LbsiRCuBmA8el8SjHx+8mIHg2GQW65tNcFB8N05uC9g/AnTsyxUdzb?=
 =?us-ascii?Q?4dLpLUk1KrUomwYsvVRa2MN0jfCUKUMQnFuF+4bmuIUUQOGS0L/L1J3rd0VY?=
 =?us-ascii?Q?orATGoJHs1N6eOvIMF9DCi3BASDkXB977tTVtiSwD02ON0fmrzZa09G617Bz?=
 =?us-ascii?Q?HfuZSyqHKVzZrRXHpuS3i0Z9QyI1mP/yryc9V99Sz8fy71u6Lw6LTDoCACHZ?=
 =?us-ascii?Q?ehkhqsxL0Fg2QLZ01c15OGNMkrXhjIzEQ5BbD45jdQ00NlhPOGA7uGZSYySX?=
 =?us-ascii?Q?6GMp87iPc2FZ6//fOZBozDCMVIuFWcijpm1P6zRwQeFPhgY8cRNgyvCXuil+?=
 =?us-ascii?Q?3/Xf66kKL/vxCoAniRcCfNFBHbsXFYxV3jk1PzDEqQGZAd1aBM3VFRaGKo6x?=
 =?us-ascii?Q?hkgLfodxYtVQpbYgJBeX1LYhQFzTNiL9RSPjUiV4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d33037ce-613f-41db-ed32-08dcdc6bdc22
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 07:38:19.4713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5UMNevjtTNxPfDh8vxNoqW+pMP7koXGC5w+ziYtHWbNJD3GrDHLVKuYu99l618b4LX2Cet//SfVgpTcL6ROGJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6881
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

Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v16->v17:
- Add lane-mapping property

v9->v16:
 *No change

.../display/bridge/cdns,mhdp8501.yaml         | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
new file mode 100644
index 0000000000000..3f79f328c7425
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence MHDP8501 DP/HDMI bridge
+
+maintainers:
+  - Sandor Yu <Sandor.yu@nxp.com>
+
+description:
+  Cadence MHDP8501 DisplayPort/HDMI interface.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mq-mhdp8501
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: MHDP8501 DP/HDMI APB clock.
+
+  phys:
+    maxItems: 1
+    description:
+      phandle to the DP/HDMI PHY
+
+  interrupts:
+    items:
+      - description: Hotplug cable plugin.
+      - description: Hotplug cable plugout.
+
+  interrupt-names:
+    items:
+      - const: plug_in
+      - const: plug_out
+
+  lane-mapping:
+    description: lane mapping for HDMI or DisplayPort interface.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port from display controller output.
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port to DisplayPort or HDMI connector.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-names
+  - phys
+  - lane-mapping
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mhdp: display-bridge@32c00000 {
+        compatible = "fsl,imx8mq-mhdp8501";
+        reg = <0x32c00000 0x100000>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "plug_in", "plug_out";
+        clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+        phys = <&mdhp_phy>;
+        lane-mapping = <0xe4>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                mhdp_in: endpoint {
+                    remote-endpoint = <&dcss_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                mhdp_out: endpoint {
+                    remote-endpoint = <&dp_connector>;
+                };
+            };
+        };
+    };
-- 
2.34.1

