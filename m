Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D52B10190
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 09:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0652D10E8A1;
	Thu, 24 Jul 2025 07:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MhPGrUF8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012029.outbound.protection.outlook.com [52.101.71.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6411B10E8A1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 07:23:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSm30q+70UmkF78e75qJCn1I9ekTpGAZywI7IVGOUKuUUBc6RxipG3YiPjW1PKfXFVo6TMDioxvwOqCtWpSYDYOItLU03t2Zq/dvli8VQpZ9DDXy3OIeCtn8xZlPcCY7Y7AYUApLpN0lo2kou6zu1fS4MxH05uhbsEu6XyBh96INMZ1P87Y4efYUxJJEc+totS3/33c2tUoBD34qaoPu6ifsaq+P8/napBRK/Iewsa85xICymOEKbcHywxPW2RD0kSK7bmKeok28P3u7WK4sILVuWU51x909aJaBl+yqFg91lGXPvVr2HEHqRT6HcbOGVzXbWuroSdJimosH9A+iZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kd92D99qtw2T+jcdsmSultJlC2eDyp8ChZ6CsNaLbps=;
 b=FYG9EOKWqjDQHyJgHOeI4EbaW1/LusL2fAGlHyvsQOzhb8Z5ZzoTHUefCCUoFpUSr/Aw5bpEnWiS2HOKkBdjXo8eXbXTG6MTeiFSqzEhJYw13AnmQSozwdqmT3z1uV9npUHmts8/n9k79DOZB0a7Vj+l1r7XiAhcEAx2r5coNtXtD29DuTAXYwhwF6v+qHq33rhD/V+29ZkvtXtCO6Uf1S+5SzBDXHiixniakQqCDE6EPoU7iAixmnmXQ1MnlgQLnBlDuxHyQQxx3t/6faOQr9VNLRUQh01BhW5gzX5A0MLlvSUnR4mQP9Cq63f1KjtCfmsnl2b/AKXvMUYCzqx/bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kd92D99qtw2T+jcdsmSultJlC2eDyp8ChZ6CsNaLbps=;
 b=MhPGrUF8V6DwVmtOpKnRpxEqmLgrEPCMw4Lo3bxjPw6Qmaf/5KfuOcHWmhYdpk9gjPu0EBmnl7azRA6BXCxGRTKWnIQ7Z5LAvPC89ZYpBnjxCHerlDflrunJumAXeCvprHWJ/oJW9PWkcA+EBRdeD4k6/mZ779PBbT1cchPtBwp4oTmVZMZO1ownKjRH1P4RdgfK0PMvkGcgCORN0gXUfLd54dpnz3yHqJjZ/BeqtLWqJnjvyIn/uvKDwy0Xh8y7u6OYUsAgcaIRO3TzDNFG4SNKGwGLtqBMW6ylcs8xddcqGhhkrTJ1Mv/OGUWvcmzGqKp9I6tmLHNyoVRz9KIvfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM0PR04MB6915.eurprd04.prod.outlook.com (2603:10a6:208:187::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 07:23:24 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 07:23:24 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: display: imx: add HDMI PAI for i.MX8MP
Date: Thu, 24 Jul 2025 15:22:43 +0800
Message-Id: <20250724072248.1517569-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
References: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::10) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM0PR04MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf48271-7431-42ca-a078-08ddca82f9e5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sQ+kKDuvPZ5N5YhCoqD67NfSqdYAtWoYBZEANH46Z7rwDDDBhw4bkPTh3X4r?=
 =?us-ascii?Q?vdmr6tLSVVnCNjcuEyZOZ73XjV3zM1vj8FxJqgkBrQTIvPPg7hw8xa50w453?=
 =?us-ascii?Q?TLJGz1qbQdduO14An4QPt/bNpvDKWT++tof7TXab8Rc4wvBFmJJ/Rait4V3i?=
 =?us-ascii?Q?RHLwTYZb6VMLT2FqKGR9CEjPOdnFLvAM2rr+gqVWQfWB7yktdHshmL++WepN?=
 =?us-ascii?Q?YV34NjW3ibdculp9EpogOmH7YlEhVnZeVf/kYuyzUbrnH6LcpDIR5Vj5hW1S?=
 =?us-ascii?Q?VCIGEHWtIqC7/Tmfn2ZGyu56OgfDAjkWh5hD9QfiNpOKFDoHevpUWB3puAqw?=
 =?us-ascii?Q?MS9m9If/tBllsfe9dq1Ei/KBlAsWrHN7DLh0TjXiTWGYdk6UcsxX9JgpjfLP?=
 =?us-ascii?Q?FYr3KlvgOnnCVyodeOFzNv1FnUKdHfJMUjpfIMITuxzjgO+Qlr7m94SKxEaE?=
 =?us-ascii?Q?L3nm6lDlFI/GcfWEtsgztEREtSNT8Y2DvrTwKXDvnN2Gf2HA/dyX0ln4H5of?=
 =?us-ascii?Q?ypf1uT7ui8hyGuadKVIEl1tNHSCmXXFRsl5O0sED1prQFDzDTQcbomOwWyoZ?=
 =?us-ascii?Q?F8AKcWF4fz5W9yk1k5CMgcveaHYj1/b4Mvz0HA75H44rYvEhk0wVNM02Z2Jp?=
 =?us-ascii?Q?OOzlqBcZQ6bI4/sME0fBiFt1Q/aRfqgwQbrb7dXHYTG8o083ZsShdelHk4sv?=
 =?us-ascii?Q?wYLtGPIaGhzCZhcItpQokwIKismYYaRQzwKSBfMTDT3QU1uk4C8lY5kjdpqV?=
 =?us-ascii?Q?XPEvdZ98nsW2mu0ER/9kTXZezdkU57gk8Q6Y0+lUyJ7SX5YX4CsaADA2hhsY?=
 =?us-ascii?Q?EtjqlSHHQVKdPZUb8fX/MaK/1P4sZqZOrdyVgCWZvOj6wWDK53jwljiPbIcG?=
 =?us-ascii?Q?jdyNWuDF3tcvnQt9RM1BISNkk5PG+7QnN2uB7J+5VMHa6jqQvif8TvserlLb?=
 =?us-ascii?Q?vALvRYA96AhkWIRf9duaA1cLy/8SP2Y7t8b9Ed2a7eFOlmSHUd6C8+7Trji1?=
 =?us-ascii?Q?caHaUObHWN6oqK8TsCtqLCyyVBaDwSER7UoTDZ0rwTY/YQow2ZCk4QOd39BJ?=
 =?us-ascii?Q?aay6HSGaynSAQNNy4Mnw7w+9UV+rkcnwipI+3oFZh5ARWC/gCYVkpej+CAkt?=
 =?us-ascii?Q?JOBZm7cEkad447UnipkqLM/BN/juACIwqzlMOFHr7PV0qSbBCCHouYvMV5vt?=
 =?us-ascii?Q?Qtt17eUm5sqbLtJNmmGu+J3ffaVbtm79Sec/5FhfydXdDh2s2HW7tdcv0YUy?=
 =?us-ascii?Q?on1Kxi+Bx45ZEj1QNq8IGzOi4qMQnt+6BKOq9T7EWGEjKltFmtnsx00P5czL?=
 =?us-ascii?Q?map+FmcignQLjwfetFj6khcPpy8k0kyHph65pgvunUdGV1NnU1xm6Gpb4OL0?=
 =?us-ascii?Q?/Abu/0ALaiOoFr6P7REM/J6s0suXmj5P8sp2MTe/FTEVBiDLMe+MAV8OjJ2z?=
 =?us-ascii?Q?hXIpqyPLdy9Xb3n2bvoXh2/OOSzUx2Zk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lPjQwQWCI0iNruutrouXtisvowqfDeQgy6VGiU5Lv7SgeUfkFEUpU78tUJql?=
 =?us-ascii?Q?dZHfWNk2PkTfmtFNt/gXzxBwVudYy4aehvojilyJcMtP7D/Fbvg2hv66fFXN?=
 =?us-ascii?Q?q6IsRqSl7YdErD1SxexcJ97WXS93v8ZWWKekSOBKNeI0aBu5s3wZ8t49b2w5?=
 =?us-ascii?Q?stvyGev/Ek1Kd+EsSTtGfSIiClLYR7urkpe+C3ydonvEpiU8qVG1jh1984Y5?=
 =?us-ascii?Q?71u1/+xQtwPF0b3KqjDXLHZOttDR99D4+s6W812GfS/F+/FMWLjlwmGtPETJ?=
 =?us-ascii?Q?M/0VyY+Y8LLGvmgxQamPX5cPr01GcrfvV6+PUt9igGbzd+B5/awnUhyMzvuT?=
 =?us-ascii?Q?66D2lj4sXY/7XTRY0Mq323NK9Y5umIeBSnFdoQRukojqibk1xOtsuQWx9t57?=
 =?us-ascii?Q?9wKTX3AEH/FrB06/xmcAajpi4z9OwWbgeHjYW984E+7lPOt4oE4lHQisnqhk?=
 =?us-ascii?Q?GAfy0KlRp20f7JusyBSd5lyUoMy0pMo5/V9bkGwmnIO1jI5aPrpa4bu+n6gP?=
 =?us-ascii?Q?OMrtaTF9f+QZt56smoqT/kUEp7AqggvNGb8TzQw1mk7jIQc6WfFoFVrN3Dg+?=
 =?us-ascii?Q?aYCbmHsKCqpRNjhr72pl4hnstjj7noAsZaaWGAnixVWj15MByjr8VEmVfYLs?=
 =?us-ascii?Q?yQXhhWJxflIkoZAPTax9tRq5jS0lDaNeZTT9vwskkQRFLfEDCGUcYZgJbIgl?=
 =?us-ascii?Q?kPYIjhtYXVeLbwClnDRhBuvSWhNLkvzt8doeu+cOCOfhD/1zPeA8SQn60Ty/?=
 =?us-ascii?Q?Zn4DelLwu6fwYnG8b5JM2eiG14f8iFOU5YbKoviRelJM/gZAjHz4jrEjwzqG?=
 =?us-ascii?Q?YdHb5vwPfC5UVoq1ZILt3C4OYMAWa6e9dGac7TvKAWUTA7/fmxz7lfw6WBR/?=
 =?us-ascii?Q?XB9lHG1DNSgFEqkirML3wbd2zEVJQZQ2xA0xMTuMAkBSKCWCkv6j3mwS5m+x?=
 =?us-ascii?Q?5/6q6OCLU5ESE4qD/q9ZAOMH1JbD+nKHjgQaqu0SSGPV6LEr0WxGD8fKGxUi?=
 =?us-ascii?Q?WUEbl7CHOibn6A9h1oArZ3zpFUV4qf7l34UAcLP5KkL5uHTUGbutKQ6zSelw?=
 =?us-ascii?Q?bqVpmGLUR51479HnMh/NNqTuVbGz/K8M/srMaMPMbEEBMlLeuZkLhA2iHg/q?=
 =?us-ascii?Q?ldz26Ka6UvbGHPSOSRYlRqTRcMFzJ++puay6i8iC9OFsTRCLHRP4C8gfJSzc?=
 =?us-ascii?Q?zDXKpuXiR2QOjYNkZsfAKkbLHL012H7RYu2Uk+OX9MHhTQD4LBZ1GJBCj6m0?=
 =?us-ascii?Q?4C4ltz/hgys7sn3ZG8yUxNSN9ayjyIimVc0WNtS7Etk2usP+Do4mLzSPCwOo?=
 =?us-ascii?Q?7uJ72WtrbluFaMt0Sfeg8Tw9PaTKJsng1CMAtKbZ5rcKBv8mhI9tOIUg4eER?=
 =?us-ascii?Q?3fbI2o/DTuqq8bMYtIuF+SlrLMvqi0A9u/3jUl0jPDMsgWfowql2FLo+xBOo?=
 =?us-ascii?Q?DRS23r4Ap51uBVessQ2yk29zlxHvUCuAfCZpZI46l9tYtElf2lYVaCHxkNl0?=
 =?us-ascii?Q?aCPgf7AZWE/bk0peS87v3VioM2aGwUUw35XctPrsNuuf11CfgEB+IPTbVtsB?=
 =?us-ascii?Q?d6uA9s8SY7Y9BkhLKyyUKMVu0mwQFgLXkOpJPLJn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf48271-7431-42ca-a078-08ddca82f9e5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 07:23:24.6551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TFf61CrbDvusm0Dt4+pDw8gH37kJnetgFEPM1U/vlcyeqPhkRKQE/hauCovZuDJUN7fvR1EwL/Ek/f8+XKVjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6915
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

Add binding for the i.MX8MP HDMI parallel Audio interface block.

In fsl,imx8mp-hdmi-tx.yaml, add port@2 that linked to pai_to_hdmi_tx.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 12 ++++
 .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 69 +++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
index 05442d437755..6211ab8bbb0e 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
@@ -49,6 +49,10 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         description: HDMI output port
 
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Parallel audio input port
+
     required:
       - port@0
       - port@1
@@ -98,5 +102,13 @@ examples:
                     remote-endpoint = <&hdmi0_con>;
                 };
             };
+
+            port@2 {
+                reg = <2>;
+
+                endpoint {
+                    remote-endpoint = <&pai_to_hdmi_tx>;
+                };
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
new file mode 100644
index 000000000000..4f99682a308d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pai.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8MP HDMI Parallel Audio Interface
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
+
+description:
+  The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
+  Audio Subsystem to the HDMI TX Controller.
+
+properties:
+  compatible:
+    const: fsl,imx8mp-hdmi-pai
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: apb
+
+  power-domains:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Output to the HDMI TX controller.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/power/imx8mp-power.h>
+
+    audio-bridge@32fc4800 {
+        compatible = "fsl,imx8mp-hdmi-pai";
+        reg = <0x32fc4800 0x800>;
+        interrupt-parent = <&irqsteer_hdmi>;
+        interrupts = <14>;
+        clocks = <&clk IMX8MP_CLK_HDMI_APB>;
+        clock-names = "apb";
+        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
+
+        port {
+            pai_to_hdmi_tx: endpoint {
+                remote-endpoint = <&hdmi_tx_from_pai>;
+            };
+        };
+    };
-- 
2.34.1

