Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B14430E05
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 05:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4206E938;
	Mon, 18 Oct 2021 03:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2139.outbound.protection.outlook.com [40.107.94.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A8D6E938
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 03:03:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJzXYb6OdFI8c1ZkAfStYerWQh5/KW78+tRsq1MKdLdYEQAFZiTMY4NWHH/GIcRxdH3IOIVgqT59Z8GseS5F1vUl7liFcRLEvJ7EVSR4yQ6411fzkozmqgdwFSuoBvaqKiDiIFJlrETww0ChGljH2TtwP5JmyXrw2x08FtKvszkXDo/CxVTj+T2DZM3d8+bdXf1hgoUT5Gc3+bE9F89BQ1lAackE0lw58YQFf0cj+0TNRwRvfFCphSTQFkwJQHS6za1JhDVA+/Wf65umJdd1Fv7fyabgw6AurUAmDkSGsDemfUDZ7U00YadzQdx0bix4BVySBkKk3Jv7/cuhwXxrgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YARkm0GJjL/6R3CvGV07VJ63fHlM6K4wHz4ywxE4hI=;
 b=gANriTwWE0B4m5hS0eB27YITnfR51+QvHwERaGItODrn44pqYA56qx5xJntGXb8J+SqrDzVfLb97tNbPpsSRxS10Lc7gO5zpGG/cXy39pAk1blu9yHem8Y4INF3gdHWjx7+dnr9h/xenvGequr59QnO5mQ5Sdiy+FWj839MzDrzu9bnsAmIU7s/4Bc1G9mvFpV1wpS/9v3WI34eaEMG4a6WRcNfonRMr3jpOoNXp6JKXJ6rZWwk26EbDDAV5xz9DS+iHqE1twtijJkNxzSbJxffYZMjqLvHq7QXmfK4gdfhh+uVeJuoKkCOZ6v1oj0ipejHYdrQ46+K23/bV2dCTNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YARkm0GJjL/6R3CvGV07VJ63fHlM6K4wHz4ywxE4hI=;
 b=LMFvndKz+WaUGZVKSHaBUVB/827ZWAep2L3NpPOsRTtmwGJp5q/bCYvKghrCz/I5WiuJl9h7+osZ0KKmYbdJRITRRG7aqSbWkUeLasS0cVwBsDtyE9HoGCl+yv+FXh+ZHe08XQpcZz7uu6iVySqjXZjIElwJWNT870LTwAqnmoI=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB3862.namprd04.prod.outlook.com (2603:10b6:a02:ad::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 03:03:50 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e149:c2d4:fd23:a682]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e149:c2d4:fd23:a682%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 03:03:50 +0000
From: Xin Ji <xji@analogixsemi.com>
To: xji@analogixsemi.com
Cc: airlied@linux.ie, bliang@analogixsemi.com, broonie@kernel.org,
 daniel@ffwll.ch, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, drinkcat@google.com, hsinyi@chromium.org,
 laurent.pinchart+renesas@ideasonboard.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, ricardo.canuelo@collabora.com, robh+dt@kernel.org,
 sam@ravnborg.org, span@analogixsemi.com, zhenli@analogixsemi.com
Subject: [PATCH v11 1/4] dt-bindings:drm/bridge:anx7625:add vendor define
Date: Mon, 18 Oct 2021 11:03:23 +0800
Message-Id: <20211018030323.2055114-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <e5f8aed7556535aeaf07b148bdbca7f5aec28203.1628161369.git.xji@analogixsemi.com>
References: <e5f8aed7556535aeaf07b148bdbca7f5aec28203.1628161369.git.xji@analogixsemi.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0210.apcprd02.prod.outlook.com
 (2603:1096:201:20::22) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR02CA0210.apcprd02.prod.outlook.com (2603:1096:201:20::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Mon, 18 Oct 2021 03:03:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a480fe3e-f00b-4931-53e1-08d991e3e893
X-MS-TrafficTypeDiagnostic: BYAPR04MB3862:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB38629EE40668D0CCCADCD154C7BC9@BYAPR04MB3862.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iC5lNqkzz14BNrEpJNMuLG2DMUr3aa8EQS61OUNruJfOJDZtR6Kai5qkJVRqNI/SyjnHsjrHQSbM3GpF1AcminPSPSWbN5eM+QXCUCQR5stMvEu7SkDn6UiTRS2xKsDoqvisxEPIf64rer5bZl3FL38BCl9Rf3Et88oNUuCBKCL7gkGUk6RYNc926LHEVEIKzjwflN5nUZW+8835nbaOux0ZizH6GavtNmQeOV6/xvvX655GLN71ERQ1ValAJgGYs3CtbMKn90TZ01/piGtIrmuOGK0iqEIbJJVHvasqRJOQc5BA9n3tYgNex/W77mm9FAUJ874Q3bj854F07dpN4MyjxVKq5gwFKRB1pVUC1gGV9Uw6Ph5eRESv3eIWlxTZPwG7qDPK7AhrwTzn+u8RKm/RcPhKXVLoengSuBxI0ghLG5fAX51P3BlfJF0CfEi3UK6idLTMJqDuev3c0rn8oJdFxbfHuMuATwLoFMswfqLSTbqvJteXVLfXtLGbTNh+dBYOLsT/03+AvnrQ6gHT+khrfDUrkj69sjdnRnQRwVEo8tQ57AF1ROgTX6ycI7Zq5o2UwjtYmJu0yQ9HVZblFaBNvos804RbFVtBAKRm32e6N7v0TPu1MeGX9/q9UT4pQfLGIMARQRgu/OCAH5S0nZpSiwxOidDxdvzUDUVAaivjPjDx1BTZWFMzFaHf/Wtw76HyEVjXDmgC3E0uODnEpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(2906002)(38100700002)(186003)(6666004)(1076003)(34206002)(6496006)(55236004)(52116002)(107886003)(36756003)(2616005)(956004)(26005)(8676002)(66946007)(6486002)(38350700002)(7416002)(5660300002)(4326008)(37006003)(86362001)(8936002)(508600001)(316002)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fuNJNN56z5R6+YO6WEiDN9Yh/7DarZ8UAVkqPFIvrlgTqITWr2Le/qmkBjo8?=
 =?us-ascii?Q?aEt9x/2yCxUA1iIhY9QipURcwZ9Lr1s+06YU6aLTRPkJybBDotOzXKwhvemN?=
 =?us-ascii?Q?eKEbKqTVKMVxNHfzONl59g6qTMT3XYO72uVjok1rDdlH6SJZKjw4pgeZAClB?=
 =?us-ascii?Q?zzhWFQybHBpm6giN3JX8urRHpkblrQJV+SagFRas2wHSfKNrK7Mv77+/33W9?=
 =?us-ascii?Q?JbZXj03JWW659asEAeujN5hfQIPbQpzbHXgGwuWw/ZlOoP2F3uEldco46Nn8?=
 =?us-ascii?Q?9mEyoR3qQ3B1HQrjUOhEKdapK1Vu58FDUx8ssGlsG+S7TfVWv7r+Bcdb8RZ2?=
 =?us-ascii?Q?MpOmtFXARxLrBgPC5NRp/w1XSe7WAqvKFeh/yfxHiJBwHyY3Nbx6W26TMDTp?=
 =?us-ascii?Q?muTaCyGkzqXmE7q/jZX5T2rUozXd1uGKrZyPNPHHiXyn/cS3FHbS2bu7eqQe?=
 =?us-ascii?Q?TS1gYMtqSmVpBk16KzIsmOR8IlqNXJEF2/tl5cyILwrMPs5/9dQJJHAMzdAR?=
 =?us-ascii?Q?8PVDl2018x7mzoRn2i7ELDMVDXSNEpVNHeaeNwThHeZbVDyn8AQJsz6BUet0?=
 =?us-ascii?Q?VdATcpGS4WtpoX28wjKfUuIrGThcZFb9y9ZtWu3PU7mukcUCa4liYnY+PMQ4?=
 =?us-ascii?Q?xZE+cVdP+eE7WsN6nrxeuKImrBQ1WQzj7jwEkBhtZo2ZH4lBLo2BaL/K8Lx+?=
 =?us-ascii?Q?6kvm7yRamH61Y2VtRuF+h7GuAnGg40vB+C+JISvuLVBIkMz00uSfJU02ujy0?=
 =?us-ascii?Q?tF/whboy5FxC8R9youyTL5bYCe/GS23XJocusgf51e8xDwwm3EO6ERkCX1ha?=
 =?us-ascii?Q?f8ECU6pbi6wMTpj37+8osdd69XcP7fU1a2/4y2/hu0gJKV2vRDLE83JOO+zh?=
 =?us-ascii?Q?M2rhivpuhm1h/UM3pp2xoHYdoXeDUHp/xCnpoult65UuwvA2+xmAFP4g8GZW?=
 =?us-ascii?Q?JAlvfKYOQSehmMx28Kh0dgee0cV/VrTJd6Tt/VJ7RC+NrJuJXCSqN4iudvsP?=
 =?us-ascii?Q?EdHVPK6Qsp+OQi5nex3cR+B6nSZS7Tr+Tw6/JIrwaIgKToEnJ7espdbXngCw?=
 =?us-ascii?Q?kfbOHuQdxN4o/0fB/6njI4RGcRrtyveEVwmecp/1Tb1Ezeoe/tCbx7+1VilB?=
 =?us-ascii?Q?GkkX+4Y/jdgy+XNO5kU2KpSooorWIX7HFQJWup33Im1di9fuKOU8wfZ0Z7zS?=
 =?us-ascii?Q?QftPs2vPoTArsqSojbtoHPDCmPVQvdzhelsFvxXTGEMIAJTTeCD9JYteNlYN?=
 =?us-ascii?Q?7MQcMN/U26dHdSLL/iFCXPvrIYs+2cPYyPUrtIccO/c0YsSs/EHyfp7yRX0D?=
 =?us-ascii?Q?vMJbaqCOFZANwPxF0r7bUpUx?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a480fe3e-f00b-4931-53e1-08d991e3e893
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 03:03:49.9679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kbEKIOKvvVuieTdQy53/G1bfJ/PIe4J6zuyf5MNCFPurZkj2GEH1iyihz+iacjPES0qPKgze/r+jd1Nhkwby6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3862
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

