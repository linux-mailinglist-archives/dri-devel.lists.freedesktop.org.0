Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAD23E1388
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 13:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675056E975;
	Thu,  5 Aug 2021 11:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2103.outbound.protection.outlook.com [40.107.220.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FD56E975
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 11:08:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=do4M/H74Ikfs9M1txVzYrEAU6kO+RBBjc57hSQXVntAJSx42wXJJ6SMEPROVPQEnzmmPM7qfr5oFRZzs+6S/J+DkugPWAISKE3z75zPTvLDltwrJ1ltlx60sYwiRR+5wPNR7Lucn9TmH1wm7Op8pPbJx4Z/PvtHtTbRmG0sglsFIUig+Zpkq7UuASTnryXS6U8YrN0s8l8370BOM4Y1gZZRs4gIpJqs/oPIZBxTTIN5lMmRBq+1SJyYfG4ZwExlqxsZPtEDabWd7rzuJSKAqTqw++fq28UJjB9ApqFVjr7s4U7XhkFbKMFajaBqzpd0eH9gbKtlizuCEJ6UTYMgqdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YARkm0GJjL/6R3CvGV07VJ63fHlM6K4wHz4ywxE4hI=;
 b=QGc8Gaaqi2cBQcDRQNcI9o93bmhYCwqojBLucABfclXO6qvOFcXdMescOUq7X9rOD+opy4nl9LmrxUNwqjvbsEFdzSagZlrWo0O3rEXd7wJE0YhdmBqR6ZvMLfby/v24FhZd7M1qWPJav0GpioOu28WzhSI7U07/OrrvbSeRmslTVKF5Qdmh9HFlF8Z2VYnv0A/W0CqtOGIX9lddOun6AaklNsE+BdR3ZIIQnFHktdUnRMKDaDTBKMFIfbvQBjjK1Q1b/KCyaNQpDG9atQwmUwDoV8ZIVvz2MnaZ4uee/fvB/SUZkBBKEGrC76OOnIJp5z0edVkhz/ZOHXo8ZoSIDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YARkm0GJjL/6R3CvGV07VJ63fHlM6K4wHz4ywxE4hI=;
 b=dQKEmMyzy+Vh48DWahAN982jIOGdG/Da85rqd8ywCe1fFrQ5ZslHrwx/n2lPxwickZgwJXeoiPl8TVqLuavAguUhk21lfZDJ+eCmmgj54Kv4goKJu3icQcgJrPS1XCpq9wwXboTKKW1Cx5pTKRSVjIQjV3ZEpMSoOCDzp46DxNU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4901.namprd04.prod.outlook.com (2603:10b6:a03:4f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.24; Thu, 5 Aug
 2021 11:08:40 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%3]) with mapi id 15.20.4394.018; Thu, 5 Aug 2021
 11:08:40 +0000
Date: Thu, 5 Aug 2021 19:08:35 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Nicolas Boichat <drinkcat@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, Mark Brown <broonie@kernel.org>,
 Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Bernie Liang <bliang@analogixsemi.com>, Sheng Pan <span@analogixsemi.com>,
 Zhen Li <zhenli@analogixsemi.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v11 1/4] dt-bindings:drm/bridge:anx7625:add vendor define
Message-ID: <e5f8aed7556535aeaf07b148bdbca7f5aec28203.1628161369.git.xji@analogixsemi.com>
References: <cover.1628161369.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1628161369.git.xji@analogixsemi.com>
X-ClientProxiedBy: HK2P15301CA0022.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::32) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2P15301CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.0 via Frontend Transport; Thu, 5 Aug 2021 11:08:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc9ec83f-7d05-4b16-f07a-08d958016138
X-MS-TrafficTypeDiagnostic: BYAPR04MB4901:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB4901EA13754786F7BDE10D61C7F29@BYAPR04MB4901.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BepDAOZ/OOdswEjQvyHfmZPlUusmf/EQgda/UsZhHqfirzWMj3IqPryQLAAsiEt3O/99+T1zPs1UUhmXFfxHo9WVDVa/YK2b8yWnfX/Viz91/Ta78l4BMdJ1XwSQZdApIiCXdQ/H2hOVYUzFdX4vasPbfR4kOQBWC2/TQFvp8FFntsIt2Lql5dZJNLFvAEsh8fzjJUMDL5z9A9Q5zo49QgflvSsdPExwMw/Ns3u25XYxlRdtjkXP6P5Lg2WpGFtOVswdgrdz7DmB+3/U5R1rmAmfno56r4BEDDo1btjpcbNAj/Amel9UWW7hsUJtGUOJFI0/6VON+QSUmJV9jwnl2ubQw1l67TJLyDwgwZP996f8Uq/r9Ork6ZmX3DLTumrLkFX9+4Ftzhfi8f5n95I1zNg9krb5AtFhJabUZinhe2YWb2RZ3onEKbREc2ttguSKtACYUWatR0BIUCydewbhPDvjy6SNCEtOjmLBvsBixe8luML3SiDdcZXXVkVMcIrUOA1yaQdeQUZQNTBonpnp8PQxi5ark9eEE+Y/gc9nqps+hvfjjWsVhw8OFWIzJUi8E9r+8ssafpyulxRj5TDTyiPHYcUotxdjZZgJ6DA2/CQOPtOvA/i6yuxoFo58tTufnWPXZX84/aIqlkXlWqbE8UNJQ38fOT+fbl87BxsrWTl6GWyF0IOENY8bAeCe2g8RLPulu9tYommYwXaCvrJP4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(376002)(396003)(366004)(39850400004)(86362001)(4326008)(36756003)(2616005)(26005)(55236004)(6486002)(956004)(38100700002)(38350700002)(52116002)(83380400001)(6496006)(54906003)(8676002)(2906002)(8936002)(5660300002)(316002)(66556008)(7416002)(6666004)(478600001)(186003)(66476007)(110136005)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jo9R3FkNxIDOEimpGwlxUdvNhmpMAXv+ra+Gfr0TqfUCsna/26muQByH+mAg?=
 =?us-ascii?Q?ExvFLGbbuYAAXZZOBuFeJkQ8Ivf64YSGX76TFj5wbngHe12UOGK2Jf/wRcIt?=
 =?us-ascii?Q?rhMXQZ4FZNEykmqgsrFf4MN3UkNwYRebYo3EeQ5qSbTiQOOXbqzqf7rr4whc?=
 =?us-ascii?Q?xmDAErzstBya6EmCmqok7O4nJiytEfj+aHPq7havSCM/Wt4pjHOtOY4SD5Xy?=
 =?us-ascii?Q?9b2E7NjZl91wKblxMvIkW651jNUt/Hv/3kNvHEyJtQsV+TcnqXxEjGIcOeKN?=
 =?us-ascii?Q?hX6aRgxpP40BMtnALxtRpUAIemwLjJl5njqfjtKP/HeK1xNeRtYwHtmZ/rUO?=
 =?us-ascii?Q?w3qodGdQKRhaOJYYldwlNvs6A+WCXToSvlW1lKv3LuCTloZN8lJ1DM+ZbkfQ?=
 =?us-ascii?Q?1sPocpb3m6ybyrjyPxgQ2HJL2aiIdcNSWbLnlwvyT3qn6NixsCnJC3UKgYCm?=
 =?us-ascii?Q?gixlX+lCxnPMNNt8unfvMVbhS+arMrkNHwpVSH9ByztU0wnDdDCcKo+Migkx?=
 =?us-ascii?Q?rzYNVkFv+ST6IVgRE88LJJSJ5aD7vrWlXLg4yBDZORHZMtaVa45Md1uJa8dV?=
 =?us-ascii?Q?ay1cRtXRVFlQjuzsDsuf/5mj3LXW1i1wkriAy5NExqgKOQnHWZMNdlWaNV2v?=
 =?us-ascii?Q?CINjBeSTMB/n88KALnL+TJKxziGb/X0qRLwlAs+lIuRaywK6+0/MEcWuXhmJ?=
 =?us-ascii?Q?5FDY8L9EJ0WclmaKvBEhQFJ8HQS1tRu4YLuIKDWzHcP8HBXwSlc1rj3GAE2O?=
 =?us-ascii?Q?ZK664sv1Lcz7rxfoB8SLMwChDNPKSlsoUd9YvCLSvJ8ErQeu8yvnf+JhCI34?=
 =?us-ascii?Q?LJ7CdOiUG4SygKshrlUQWFXtoF9ym0UX8DaW6+3xpg1Z0DyU0gY+g+uEqfkV?=
 =?us-ascii?Q?Jryy2D8sZXwMJXpRECkB8QBzOA67E9cMmcl96TPnU9QyViuDHOlnO8ili9pS?=
 =?us-ascii?Q?5pe2YyeDlc0Qt0Z3B/2Sofq69lRHABS4xDQRqajU0VDVKcPgCXSkxYhzuAl6?=
 =?us-ascii?Q?iWDNoRAgdqNtCAE9hNc2aznTK3oxxZmyBn88PGKkkzUX2oGx4D0iMCQ7OAxk?=
 =?us-ascii?Q?hcWUR46abmCqOhMemHZ0a7mCWXk0XiUI0IGGRC328hdkZKBCR+duxuLksbQq?=
 =?us-ascii?Q?qTMUTbEww9Nk3Vq4hHJ+A3iH0+5tZUJVpvy0N0b49moMyfGzeSDh0yJBoDEA?=
 =?us-ascii?Q?A5Vx/cP3rPZ5vqCfZGGPnrX04tAYJXYLeq81h4OqVMJRjXxN6wa+USTdqkmr?=
 =?us-ascii?Q?Qn7D0U0QSeBz7KsjYitlK6jHNpsV79d4POS6/vVz92wACuzXciPBd3DUeFuX?=
 =?us-ascii?Q?EI/4ivWBGNlN+2PmB6ZIi6QF?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9ec83f-7d05-4b16-f07a-08d958016138
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 11:08:40.3459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhDRjfMsL0LGIoii6GXPai+1tewdQoNBlnD4HRAmmpVtujKaWskggTpTBVHT+oAppqPkVOSprrxQe6xRBDzU1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4901
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

Add 'bus-type' and 'data-lanes' define for port0. Add DP tx lane0,
lane1 swing register setting array, and audio enable flag.

The device which cannot pass DP tx PHY CTS caused by long PCB trace or
embedded MUX, adjusting ANX7625 PHY parameters can pass the CTS test. The
adjusting type include Pre-emphasis, Vp-p, Rterm(Resistor Termination)
and Rsel(Driven Strength). Each lane has maximum 20 registers for
these settings.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 .../display/bridge/analogix,anx7625.yaml      | 65 ++++++++++++++++++-
 1 file changed, 63 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index ab48ab2f4240..1d3e88daca04 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -43,14 +43,70 @@ properties:
   vdd33-supply:
     description: Regulator that provides the supply 3.3V power.
 
+  analogix,lane0-swing:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 1
+    maxItems: 20
+    description:
+      an array of swing register setting for DP tx lane0 PHY.
+      Registers 0~9 are Swing0_Pre0, Swing1_Pre0, Swing2_Pre0,
+      Swing3_Pre0, Swing0_Pre1, Swing1_Pre1, Swing2_Pre1, Swing0_Pre2,
+      Swing1_Pre2, Swing0_Pre3, they are for [Boost control] and
+      [Swing control] setting.
+      Registers 0~9, bit 3:0 is [Boost control], these bits control
+      post cursor manual, increase the [Boost control] to increase
+      Pre-emphasis value.
+      Registers 0~9, bit 6:4 is [Swing control], these bits control
+      swing manual, increase [Swing control] setting to add Vp-p value
+      for each Swing, Pre.
+      Registers 10~19 are Swing0_Pre0, Swing1_Pre0, Swing2_Pre0,
+      Swing3_Pre0, Swing0_Pre1, Swing1_Pre1, Swing2_Pre1, Swing0_Pre2,
+      Swing1_Pre2, Swing0_Pre3, they are for [R select control] and
+      [R Termination control] setting.
+      Registers 10~19, bit 4:0 is [R select control], these bits are
+      compensation manual, increase it can enhance IO driven strength
+      and Vp-p.
+      Registers 10~19, bit 5:6 is [R termination control], these bits
+      adjust 50ohm impedance of DP tx termination. 00:55 ohm,
+      01:50 ohm(default), 10:45 ohm, 11:40 ohm.
+
+  analogix,lane1-swing:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 1
+    maxItems: 20
+    description:
+      an array of swing register setting for DP tx lane1 PHY.
+      DP TX lane1 swing register setting same with lane0
+      swing, please refer lane0-swing property description.
+
+  analogix,audio-enable:
+    type: boolean
+    description: let the driver enable audio HDMI codec function or not.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description:
-          Video port for MIPI DSI input.
+          MIPI DSI/DPI input.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint: true
+
+              bus-type:
+                enum: [1, 5]
+                default: 1
+
+              data-lanes: true
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
@@ -87,6 +143,9 @@ examples:
             vdd10-supply = <&pp1000_mipibrdg>;
             vdd18-supply = <&pp1800_mipibrdg>;
             vdd33-supply = <&pp3300_mipibrdg>;
+            analogix,audio-enable;
+            analogix,lane0-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
+            analogix,lane1-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
 
             ports {
                 #address-cells = <1>;
@@ -96,6 +155,8 @@ examples:
                     reg = <0>;
                     anx7625_in: endpoint {
                         remote-endpoint = <&mipi_dsi>;
+                        bus-type = <5>;
+                        data-lanes = <0 1 2 3>;
                     };
                 };
 
-- 
2.25.1

