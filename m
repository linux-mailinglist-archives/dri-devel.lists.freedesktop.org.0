Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3216445E80
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 04:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371D46E125;
	Fri,  5 Nov 2021 03:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2134.outbound.protection.outlook.com [40.107.223.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5756E125
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 03:19:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4cX+/zLIsERvwi/2QHerNjisUD+4lrJRgD7pnB8lfTyd9XXjUACvMOqZdnycGrm00UkYK4skKpmyV1BPsEZYyQdV2+wkOEgR56k32hDdg1WnU7CfNrFBsKqDtkFabBVSdrP9PNFAINpySitBf2gy4OYlcz22t6GL3FDrrTwFe0GvpAMpvTykoXbd5vmOuj2sjMdW2XASl93tnmGaU4+B9kgjFjj/r7y18LM5FLNsN3SAf0O8tSz31BZtbTlGlxYfgyZyu3oao0sdSLmo91lCAJAZsc2lAcmgABS6f1kZalDXTERZIQguWpvCNtU4FQds9Z7s8NR2k2kFUdQcOJgng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgcYy4lW/lKi/h3lOI2sAmbS247uL8BxsYg8HYMkCBA=;
 b=mvCZ+RPq0Z6BNt5gsl8ish11zM/48Rb5bBlJfd39YxBL+p8MRLkk1/qcOosJ0bQXuzyNoUWYVi4zydSWeKjPqqQLko1LuHoVjUO1G2kJQQoaj8NjLhkej+J7/4mrV6MY/XoZnJo11/JFe2DeIG4jppLzJt8R8rxyN5nTVALOeCXOqw+pThDyLbjxQtXi4+dnPTTeUnlJI9VvDuU5+6Kz746msCgmyhE2+5D777SAwEJ7Zg/HzrWzsjnbxd6nyXipZZdyrrBAgAYkt9zCQgMZ0jmVtEO2eZMy6ER8y87uEReS2alZx/sNwbL6hywqMibjhFZz1jCBACx9z+Sud8WTjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgcYy4lW/lKi/h3lOI2sAmbS247uL8BxsYg8HYMkCBA=;
 b=qs9X8yYBg6N5f8El40uCMfn7N1t94oS9Xb//Q2pJyoZIjGBY/iwXW9ghIckk8gQwtiAygdsESzVI4QRD5szY4OOOvW0AfDRoOEjLOBwdcMmiwU+tJ4XYMcJnHCcJiSOAA48duW1OO2b0+WE/I39OsUaHLF/8EckdrDkZhfyYDmI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6438.namprd04.prod.outlook.com (2603:10b6:a03:1f2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 03:19:25 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595%3]) with mapi id 15.20.4669.013; Fri, 5 Nov 2021
 03:19:25 +0000
From: Xin Ji <xji@analogixsemi.com>
To: a.hajda@samsung.com, narmstrong@baylibre.com, dan.carpenter@oracle.com,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, pihsun@chromium.org, tzungbi@google.com,
 maxime@cerno.tech, drinkcat@google.com, hsinyi@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bliang@analogixsemi.com, qwen@analogixsemi.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v12 1/4] dt-bindings:drm/bridge:anx7625:add vendor define
Date: Fri,  5 Nov 2021 11:19:01 +0800
Message-Id: <20211105031904.2641088-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0100.apcprd03.prod.outlook.com
 (2603:1096:4:7c::28) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 SG2PR03CA0100.apcprd03.prod.outlook.com (2603:1096:4:7c::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.5 via Frontend Transport; Fri, 5 Nov 2021 03:19:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b4214b1-3220-451f-40f5-08d9a00b1183
X-MS-TrafficTypeDiagnostic: BY5PR04MB6438:
X-Microsoft-Antispam-PRVS: <BY5PR04MB64384723B14CAB0219845ABEC78E9@BY5PR04MB6438.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XngJ50VFQjIn9hR1K1FsXuhiColrYP9hhciYJ5g+wgEWCRUYDe22rIo6a18Cqd2xQtyNfT7DaYZjcl27Nv+dpWoxK0UwGO78jdp6CGei1XHD+BeOI9QNMLeLc6h9ozwH9CHUObBtnoAZLpFrKX+c3+NB1L37I6wNSq3oNRj45MhJctYVzPmBKCSwcK/Yhac5QHjevPGiawQazqqN1zYX4LAtBdLmUdmv1Z2shnADd7kf/oUvyc322W2Vyg31oS0gMI8SeVDpjCLj9wClx13cxSFP+ewK+IE1y+9UK+qxekEe2CgoQXFErizWmzvKPq6kZiqSm2xPpaYoyxUgbtUZQSVQFNQGcbEXu3I+/m/ZCZxtJYTsr8o4jwK4kv8zPI4xFJdo82Nj7Tx35FetMYeJ5LlrMb2HHDf2d6QpOHxruRPYH5hC8Inpv18mqj8sxKtwjduSNp2K1FClUTUeow14goEtFTKqqkIFf9nmBYq3q6T9fseCRkjbzqzIGeHgaXs/5e5eY0cYfUTVGEBz7u8uqMc7DDop31955Gb0paHZaSw5cUVfl4Ll97JeCG6jDs2J802pzCsgrB2HRpyAIaMXvYuhad6FhmwurTFTlKz8dCk4I8k3Dfmof+vzHJJh7kz+bWTlAsxhPQvx8zsJO8R5MIsirQKH0yFtf9Zc2ri+RUB3MrlfYiEuHKN1rkT90JtlpQQ7WS/2BRb9NcCZiiJJWhap+XaCtrZB916gk8SrlSQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(66556008)(316002)(66476007)(38350700002)(55236004)(66946007)(38100700002)(54906003)(8936002)(4326008)(7416002)(508600001)(1076003)(6666004)(83380400001)(8676002)(36756003)(86362001)(921005)(26005)(186003)(5660300002)(956004)(2616005)(2906002)(52116002)(6496006);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WhJFPaq/GYNBxnzIffxUJrHTL80LAPAxlBp6NhWzmn6ejvcZx5O67B9xKFQ1?=
 =?us-ascii?Q?fmKuzS7X0McDD2ybYcB62KuYnH7yl/jcuPE4YQY3DgQqtewd1VSxowRyUYNY?=
 =?us-ascii?Q?KY8jYNG3ZxDagW7+PGhqAIIwxRxSmmcbu6HGTtDxJhyTUe1iCn7Sk7w3wQ92?=
 =?us-ascii?Q?AP4TxT3gYzNbneXHX4opVFjEduZBhFtxL97iHzQm18ySzhPxvxXCoatxy3tQ?=
 =?us-ascii?Q?yN8PD5ex4azDh3TQQteQGxo3m+H2gJZZ2KvFGzpbDcZxxGgijBTDQJTavw9m?=
 =?us-ascii?Q?BUAbGMGU10363XOFdecld7/kgsWo3YmwpFpwe/5WM0oMaPqzCf+3+n49WGwv?=
 =?us-ascii?Q?YPobSwQScWGCOT2474IBqxkQn4WLQtbb7NJGq/UjoaxBPr7G64R4proEcKyl?=
 =?us-ascii?Q?jHrycfmYpvSNNpMKbE/LCMHfv8Ue5iT5hW12s1eOWAMbTF6ZT7EGg1ksjPOC?=
 =?us-ascii?Q?Vsp2DjrfiOODHISKsIzaoO1txK0A2XuWd8lkLOtNw3b36EQbSXN+AHYWmJLp?=
 =?us-ascii?Q?i5Yc9UWB9uV3j9R3C1y0EYBqVqxzkR3daceGBDmccPxCjLtY9zLWuJVUs8Fq?=
 =?us-ascii?Q?eLMtOf6Q9Jotn+dTi0drJsq22Pf2KfIGcGGgPrTwIbvX09iIB1QaPyceykIm?=
 =?us-ascii?Q?nMAlGxwNPRAiOPu+WGJoKCTqtBob7bWoSFv/3wuzJE2clwXPcf6VvCHm1L+a?=
 =?us-ascii?Q?pEgMEK76ve7IC7nhEKuPgcmR/xXXaJ8TX0Mz48hDb8NIekoEz2+I28OHRrLf?=
 =?us-ascii?Q?WvFNbu9akVOWIxYfDX0clY9MVpYEbkgwQxehzWZS9nROkTZ3GQ4Y1CFfeoVv?=
 =?us-ascii?Q?MSkJ6XFyey10I3nlxNbEBHW73rbMumW8cblzOppatKxjDdAmFbsfB0OulH80?=
 =?us-ascii?Q?KwWOyimkJKvWR/l+0AvngE8tabltz0yWqk+wtZK+W8dNL/5MBvCpvt+sTMda?=
 =?us-ascii?Q?D2FJH6mlBGPnvEA4cjq31U/99LOBieIA6mVHXfNldGls6EUt6RJci31QUIjr?=
 =?us-ascii?Q?dtunopmDHonBhYpJO4YJeV+ony9JbFC3QMCFzPnJsO/7jd2cGaFucazTviMy?=
 =?us-ascii?Q?ZDsie7vOOdrMCy96pFe307P89AYhj0r7p47hAhr4s4ut52baXYuOCiwm1+hW?=
 =?us-ascii?Q?/5j/FO0d4AoJYmR/4Ivow+UU4BnyYNFXmmTfuOy9E6YWuT2O+TjunfcABY/1?=
 =?us-ascii?Q?rAu1YhjniirChub2RYnMy5aHEyJfpDo6sHfmfLsJxaGTQ9uU93QsoouejJNH?=
 =?us-ascii?Q?GGL1M9dWFAKZAQlZvrl7nV8v9Wh+TLxQlM7V+mG/aVeCFy+LU80jJOOmMbZP?=
 =?us-ascii?Q?Kp4G/Sit++AbnpS76n+LvZ7ZMoOTDWAZqhmT3xzp4I9wXqOhZ2NpXBTUcog/?=
 =?us-ascii?Q?tnfGHNBQIfYoBjsbDcRVFxLCBNlI78c0rtO8ZuXZFZo3HyTwcxbbu4ue9Bnn?=
 =?us-ascii?Q?Jh3bcrT4xl7jHKJjJ3l60BmN84luSWKh8KK/PFZTCTrZEaK4hvGyeenC8iIy?=
 =?us-ascii?Q?L8WhVPDswoVzzsSG4xwbiiZfQOF0e9WU+uzOcvcg43Tv/uuy0gU5KxRge4CR?=
 =?us-ascii?Q?qHsUP1y5CY/BhySjNJEXPgVQWVtL2qTPHYcaDRc/zIHd4Ii5/GDX5Rj4PMSL?=
 =?us-ascii?Q?jKaPt1nycg/opKzNgnjlJ1Q=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b4214b1-3220-451f-40f5-08d9a00b1183
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 03:19:25.0705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7a21ZDZBmdgJdFEZB9uQMVGmq1YwwX0Me0CHXjB4peDSeaTs0bKk6wjXi9GWARnRmmav3jw0MicGNRPhKOZLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6438
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
Cc: Xin Ji <xji@analogixsemi.com>
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
Reviewed-by: Rob Herring <robh@kernel.org>
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

