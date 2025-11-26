Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB51C8A2CF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D951E10E61F;
	Wed, 26 Nov 2025 14:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wVyCO9mi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010071.outbound.protection.outlook.com [52.101.229.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B2C10E61B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:09:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3yIn/swla7/bzeDrjD4PD3abl7Itgiey8a0HO6vbqRXyv3aIbH8SWkQ/eXgGi3CSBDSZfcJ76szOmteXteTqNEwGu3OEZ8/b85bcrBtJCIpzB30oE284R4BfbrPme6HxKs72Nso80JX0IjOMSsTCOh456BF0+sfeV8qPtaATIL8sRAp4lEfC8cB9ktObhiX69+w4olOH8X91GZ2F6eTqc61hZsMEnUvEGeBeU8ZHhNoT0hDEYpQrsPd18xCaH6i3NHPrRGpc8df246SbF5iQhyei2S03gRK0AoU+VnvY4pm2P0Ss0AaVXMwXXaaRQ08SZE09aQUuGwBRlYEM1YHsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKNutU/B3xwBRZHCUW/c+H40lDAP8OdshrOi2w/jcV0=;
 b=d8OMNxAUN9NX3OIz8h5yL39GTbk09CJSegbvN4ucPteQU/oCyTD80uBiJvs6nHPRrTx2h4wSmP2g9b1oywIeJNXHUfWIMQzusxS/3TuUBwpL8MI0FjJmHDXxqrQCALkSFfGluw7+hXRQQSDHgcnNDjU+rdFhUCrtuRmBdEpzZ5uveG5ZjgjfvkFKzTBnB5CxJw73qMPDllgVQay9FauXPWMlP3Fs1y3CyzcUpGmVOpzOAd2Wvfh6i7CFF6E026eXbBm7BpZdUh3JX9rwhY6Q1mrA8v0eQ0yvRtMkrJ4ng3pPrcdjdpoVihmSLdTO+Unml8LGME7wIpXJkgReS75WxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKNutU/B3xwBRZHCUW/c+H40lDAP8OdshrOi2w/jcV0=;
 b=wVyCO9miURKTV0BR6i/v0YenWTIDYWQHStCPCqLe2FEKh+pELjBIxIlBz7vf27ZZjk3pL2p0NxAwz+DMAPsmXfE/dXhtolkN67+oUI6H8RjIpjJi/bnnCLj1KaRrMBnhsrbNcIvDCFjNtzkvlfsONZfOiOuZ9ML7FUvINDjqTTQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB6804.jpnprd01.prod.outlook.com (2603:1096:400:b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:09:37 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:09:37 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 09/22] dt-bindings: display: bridge: renesas,
 dsi: Add support for RZ/G3E SoC
Date: Wed, 26 Nov 2025 15:07:21 +0100
Message-ID: <1c7657d6c06d99bc2f90251995ad272b5704717d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: f44e00cd-855e-42d8-c8ea-08de2cf56ed9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?65GbAtZOHrWa1B3Pf5nuUgqW0810+wue+z79cX4ImxDZBokJMssTHvJkE1V2?=
 =?us-ascii?Q?kCVrHeeY8jH4QrU+VEu5eOydDe3dPB8sHe/KahDEEou+IDGNcsNTgoTS3j8q?=
 =?us-ascii?Q?KSEB8F1vYMtUA1kenQIFsPHgLqpH7qnrpJRVUwSIc8G80HfEMe1LVmyu11yE?=
 =?us-ascii?Q?EaaGFN2cCrUjnmAIKu9dvp6Dm6r9TKOSq37vXQO71TtKqoxmtVywDTbdTFyw?=
 =?us-ascii?Q?Ss9iz6gGlOjL0k8gij+htj7JPyKpKvMhpbiMYO/yJGcpAhCg5HubuuyNIJnP?=
 =?us-ascii?Q?QSRo5LKOqjXvZzM4KZJw4Kdyh8r4Os3HqolzMc4nuNnB+eCwKrabqqULsTrF?=
 =?us-ascii?Q?Wav6c71s9gok9clO/ccNag0GeonL7livpgtT/fx7npTRtOAWOJkVtJcvp5xM?=
 =?us-ascii?Q?/evsEfXEuI2D2a+RiAwxU3IozEw5sm5ZSj+4Je+DpcBgK6X+/dOStmwG/R7e?=
 =?us-ascii?Q?Y38nbyNEU1IA2Mf2oJ8+Rzx8CiqRZ5XLqkialhsDheg/THfay4NThOU2+jbh?=
 =?us-ascii?Q?RmCarxp4OJ9rApdL4QVCIsmBYBOiD46KdNR6OaSPdHi9WkqLbwRfAqJ/JSNV?=
 =?us-ascii?Q?5NKdQZG+wro9MKeVPUL12EFyG1ksWeg9MaNr2U5E0URc04H7bberDP+rVulB?=
 =?us-ascii?Q?CvkmcwJErOD6bGdhe1xm5Vnr/k0ud1QPapHs69V/bdidEka7FvmlMPXQWeZV?=
 =?us-ascii?Q?u2Y0OURYdsYh8v68eeRSHMwntjWEjgH1AH6ygXwfy5gOFvusSSeDw+MTkjRS?=
 =?us-ascii?Q?ZXP46CLQnhX6m4djTRvHjyXAlk0e1tnkNbfaisjzKexV3rWoeULpE+Het9/U?=
 =?us-ascii?Q?U4q+prAoQwRw3mRvx5RmsZJZjuzJ0AFk2IapOa/BjOgBZkHtIS/yxmiWfNHg?=
 =?us-ascii?Q?CRfln632c12cgKFKI89Sfv+2cqLeEWUPoFSETvjUgltWcQHuPfRheGu53f5C?=
 =?us-ascii?Q?pKfOYeiO5Re+7Jnb/dHFdFTRyZ7XBfDlH8V4HeqDLkgMgathaJ9p5FMRi4d3?=
 =?us-ascii?Q?tuGn/YYzOnP4dgPrD9BiJIt9iwu9oHLTwO8eDB4iu+Z6tFSaFwz+vaHA70zn?=
 =?us-ascii?Q?bBGaWUoguDKRB6WpYdFruU+B4jr2mvFSMX2AeAM+v8Pb89N50OdXeRwoA2GR?=
 =?us-ascii?Q?IfLuno9WoAMLaSz+sj15WFvFPtbMlF7ADWQNcZymVy/ycRvfM0E1nMEquNiH?=
 =?us-ascii?Q?WQ3g1UkGM8WKwMPTfEwPMfFvkiE659BijOQeJyWCZOhIOd1sXBvQJmiFeA6p?=
 =?us-ascii?Q?HQwVVKfOKwbSlS0JLgbz6nygZps+q/wAoPQ6DCjLW82mpEROrfwWsJK8bHh5?=
 =?us-ascii?Q?7BskzN1MDUuBkr4TUhJRAO9AYUn7dfvCfCG8MRCuOFbexPzSMdLI56WvT7pJ?=
 =?us-ascii?Q?U8FOG91hFuycbS0B7SUJXfXig2QJGeM6oX1w3uFwGMPaiyQvD1MhLubZNvUK?=
 =?us-ascii?Q?2skA4dPTfSB9BPeBj9QwKGsdVzFwKy0Pnfo0C8IHlliy9GprvkTKzaZnTb2a?=
 =?us-ascii?Q?BATd45gVbM07r91wlVci77o7tYFvI5U2+ip4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IJeJaYm7vHIJRpifXZRZdzAk0DUCQ4kxCAvQ0rj/AeN85h2WiNUmmfS7NrGy?=
 =?us-ascii?Q?vCrNFx0r1nI27bxShbMvMgb2DD6wbU0vS83sIpt3cBGXFyRTlK5LvKFspK7y?=
 =?us-ascii?Q?4GGbuXiPS3SHhoQHe28k1pye2i93L4Y/zq2jsKNU461sYUd7rRpjSFMQVTsQ?=
 =?us-ascii?Q?+m/YniPUTSHVOzuw19xGExTZdnnbvROMv3+6fcTALbun0Jk8059St8L/cAM/?=
 =?us-ascii?Q?XiC/kFcU07PB7TjPzxYE5OKqfNYuoEAUAKwa0J1ehJodgtVO8TLC3Fmi2n2k?=
 =?us-ascii?Q?QhXrSpEh/SFCn3kVH5kOznvQLXmdDU5Lh5/XCQgbGfhbqp3soB+JqlpTQRni?=
 =?us-ascii?Q?utWcGd0sjyZosHEftDfbQpvx3r1IY7aNblTnkTpNh/+oX9FphoQag1ETIh9p?=
 =?us-ascii?Q?gFooTn8xpWohPtUhZBuURC2EKXpzHWWvATl+aQ8IShjQbF8zUweO3psVaGFQ?=
 =?us-ascii?Q?LES4SWPJoJ+SFJqbrEI8pZkcHzmQSpRcClAnzjJWFAuj9NKHZRSeMB2qTRSy?=
 =?us-ascii?Q?xSRn4acdAbxbC4O5nxF56MfDZZedsfqomeuVLy00M7wIRaRDgY5b3tkwjfu0?=
 =?us-ascii?Q?u2s1Mg8/4gNGbsP45X8hem2DIufBJWCKmGYah3542ZKSr+BdZbPnkY+pbxw4?=
 =?us-ascii?Q?+l3t9/pt/2iaKWcVRWOzOhQiI9cIBwh6ngxh7sj3aUUqXUhkGs6LJSnZiaU0?=
 =?us-ascii?Q?BWSCJ7et/8ksrdTW5SHzVn6d3JzGaDwRtQTRbpSVlEFR1FwEm70HVet1IiP3?=
 =?us-ascii?Q?ltQorlBYGbVzXKpZw8HAy11sPpcs3uIJ2hKwGuXftbJcZqaTEhC2zf/1ONOP?=
 =?us-ascii?Q?GtvTIO6ZZhStY4xXFtd9wMQfGJmhZ6hHqWjC71xdyCxAr9BHaquTNarHToKc?=
 =?us-ascii?Q?S8zfFSJ5LDdKXeADb0WsXnhuz2UMrr1QVMpW8wCkjqUrlU7XGPTc7RSkudN9?=
 =?us-ascii?Q?Ge91yeIW3HvF1c72A60UgCFtDRJoeVrLh7ayZ57Jn8s5JopVDNd+IF944LEz?=
 =?us-ascii?Q?tjcnzspUFyoTl13q+Rq6LIE2/ER+VUyxRoX5Hu4cR0GdQz7eIyW5Goha5poW?=
 =?us-ascii?Q?eLJz0IAIE+W25libX6gkLJ3I2YoWECDDizPKX5Pn4on5KAwMPdf8CmqRnWjr?=
 =?us-ascii?Q?dSYdQqlIMGrEL2hG+H2TVdOHwb5YMkpl8kTcJIVlplE+JOdRTtazveIYTzCz?=
 =?us-ascii?Q?38ea2vvLnqR7zsyUcky7vh+RfpunetHIIlQ6d9KWHdeIqyJJrmHcvoFqffAZ?=
 =?us-ascii?Q?U0tGOPgcX2riKcZjYKF+4Hh+9m46DepjALPjm4YkN5WNF5oUEJi+Go6TH48Z?=
 =?us-ascii?Q?pxm/bYlBux8HEw3zYmQGTTnlcu9hxLkEdbgyybRQMLGNpYrhTr0b4lKMnENM?=
 =?us-ascii?Q?AArk3CPUUwQw1/gDipx8rqdP1SvGXOqpt8t9W9vGZMKSB1Bq9ANluU1vpXd9?=
 =?us-ascii?Q?ERZssoWZirJ5e6HMWpvvlNhHDOfKkCtwSGYNBBaRsWnPi1ILKwaEYDK59wFO?=
 =?us-ascii?Q?WT1Sj8cLUr0Lfj47UyC3RNtOhObnoqpR9DHtVZavadgTc3Umq+FGovR7bOs2?=
 =?us-ascii?Q?u/LtC1wMvNzxHQtODExorxHQt7b7iONGZIcmf8wOaPHJYOeE1GVZfCtddQz/?=
 =?us-ascii?Q?2rBXxjoOKLux0mhzjRmG2Z0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f44e00cd-855e-42d8-c8ea-08de2cf56ed9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:09:37.2386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVO63WOfqlflRDIXQkwGMMEdp3jS7rvgwBj1jeCf2pDhnnGEu72aop76KDt6XXuJCDEjZcbrON9JoWLXVRukr+ncTEnYchAlyCSBHWusxSPP4CKj2ADL4GSZGfcgPc9D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6804
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

The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
or vclk2 as DSI Video clock, depending on the selected port.

To accommodate these differences, a SoC-specific
`renesas,r9a09g047-mipi-dsi` compatible string has been added for the
RZ/G3E SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../bindings/display/bridge/renesas,dsi.yaml  | 120 +++++++++++++++---
 1 file changed, 101 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
index c20625b8425e..9917b494a9c9 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
@@ -28,6 +28,7 @@ properties:
           - const: renesas,r9a09g057-mipi-dsi
 
       - enum:
+          - renesas,r9a09g047-mipi-dsi # RZ/G3E
           - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
 
   reg:
@@ -84,6 +85,13 @@ properties:
           - const: pclk
           - const: vclk
           - const: lpclk
+      - items:
+          - const: pllrefclk
+          - const: aclk
+          - const: pclk
+          - const: vclk1
+          - const: vclk2
+          - const: lpclk
 
   resets:
     oneOf:
@@ -136,13 +144,6 @@ properties:
                   - const: 3
                   - const: 4
 
-            required:
-              - data-lanes
-
-    required:
-      - port@0
-      - port@1
-
 required:
   - compatible
   - reg
@@ -164,14 +165,76 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,r9a09g057-mipi-dsi
+            const: renesas,r9a09g047-mipi-dsi
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              description: DSI input port 0
+            port@1:
+              description: DSI input port 1
+              properties:
+                endpoint:
+                  properties:
+                    data-lanes: false
+            port@2:
+              description: DSI output port
+              properties:
+                endpoint:
+                  $ref: /schemas/media/video-interfaces.yaml#
+                  unevaluatedProperties: false
+
+                  properties:
+                    data-lanes:
+                      description: array of physical DSI data lane indexes.
+                      minItems: 1
+                      items:
+                        - const: 1
+                        - const: 2
+                        - const: 3
+                        - const: 4
+                  required:
+                    - data-lanes
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+    else:
+      properties:
+        ports:
+          properties:
+            port@0: true
+            port@1:
+              properties:
+                endpoint:
+                  properties:
+                    data-lanes: true
+                  required:
+                    - data-lanes
+
+          required:
+            - port@0
+            - port@1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-mipi-dsi
     then:
       properties:
         clocks:
-          maxItems: 5
+          items:
+            - description: DSI PLL reference input clock
+            - description: DSI AXI bus clock
+            - description: DSI Register access clock
+            - description: DSI Video clock
+            - description: DSI Video clock (2nd input clock)
+            - description: DSI D-PHY Escape mode transmit clock
 
         clock-names:
-          maxItems: 5
+          minItems: 6
 
         resets:
           maxItems: 2
@@ -179,18 +242,37 @@ allOf:
         reset-names:
           maxItems: 2
     else:
-      properties:
-        clocks:
-          minItems: 6
+      if:
+        properties:
+          compatible:
+            contains:
+              const: renesas,r9a09g057-mipi-dsi
+      then:
+        properties:
+          clocks:
+            maxItems: 5
 
-        clock-names:
-          minItems: 6
+          clock-names:
+            maxItems: 5
 
-        resets:
-          minItems: 3
+          resets:
+            maxItems: 2
 
-        reset-names:
-          minItems: 3
+          reset-names:
+            maxItems: 2
+      else:
+        properties:
+          clocks:
+            minItems: 6
+
+          clock-names:
+            minItems: 6
+
+          resets:
+            minItems: 3
+
+          reset-names:
+            minItems: 3
 
 examples:
   - |
-- 
2.43.0

