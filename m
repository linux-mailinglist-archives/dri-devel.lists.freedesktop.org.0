Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F296444DC4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 04:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52357B5C1;
	Thu,  4 Nov 2021 03:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2120.outbound.protection.outlook.com [40.107.243.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441B87B5BA
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 03:35:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMGaDsek5nuk0wrR9VicbE93Yr1o25fIxIEdE/KlHdqaXXkJmGMk6vmBOTTUWsmG1+ZGRk3WkUWIv0Vhk+7bGxuK6P/NQrduk+wGxKvQPeRCVIUBIAk+d03x9wlyun3G3KEnmp2gHVHyb0Z5CmbMSrHHV4Oc1FMqI7ZhZKNsg4GAI/PepAL7Jy3nDzrMQj5mWurJMr3OVd1Tm4Z1735vz9M/GD1HR3fSp3NybSOciuUI/kIFSRuNCUBCQ5ZaIW/azHttMFHltuMHtFwBY9Ws+wQrH4ULvgFY4qw+8ZFJkpzaU2H8zbyeYnYCxRk2UnuxzF+73Bh3C5GpchzwEyLJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgcYy4lW/lKi/h3lOI2sAmbS247uL8BxsYg8HYMkCBA=;
 b=cNmB0GGH+iG/ysn5OK5ATGzLV82ej5b/iEXGJWCkMk/KbqvlGzWbCoRNqOP+BcovxQVTJ/HX+DSqDs2y2N5juFWVlEEymVbfSqFhzHsHUL+OXwThzcJchcF/po376EjxipUt4d8jI2VNbRDgsWpqg3C1lm/j3yyhJ9Z/4KkKSU4L3ouuInxgMCB+atZZF/H2NmcsdgCf+UK0gnzdwyq3ltXKiI4IrfClk2MjHcoTkg2DMufrDqSmU4JrvTHMMRjiNOWX98xaaQkz/8L9P6cPs8oEQHmaOl8R7AJwgLsH02Q57+tXX0XikISPgljbXlJAH0QcP4LzlZxld6pnSHSq1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgcYy4lW/lKi/h3lOI2sAmbS247uL8BxsYg8HYMkCBA=;
 b=BG4c/fq9koPaacxVJxe5TbSj8oCwtTT5MLhrS2txXlTMTRqO/P5tRih1LaEcxgg7DMj5S1K1DTJ88rmrbYTUM7j0BcDPJrjnvqHgVoSVgsfElZi0dPdHhrc1cOBZdf9TJeh6PN6c0U+YAozYZWKrW/49shUTYDlgRgxjAEcC3PI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4277.namprd04.prod.outlook.com (2603:10b6:a03::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11; Thu, 4 Nov 2021 03:35:37 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595%3]) with mapi id 15.20.4669.011; Thu, 4 Nov 2021
 03:35:37 +0000
From: Xin Ji <xji@analogixsemi.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 robert.foss@linaro.org, sam@ravnborg.org, drinkcat@google.com,
 hsinyi@chromium.org, thunder.leizhen@huawei.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v12 1/4] dt-bindings:drm/bridge:anx7625:add vendor define
Date: Thu,  4 Nov 2021 11:34:44 +0800
Message-Id: <20211104033444.2634397-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0302CA0019.apcprd03.prod.outlook.com
 (2603:1096:202::29) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR0302CA0019.apcprd03.prod.outlook.com (2603:1096:202::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.6 via Frontend Transport; Thu, 4 Nov 2021 03:35:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdfde464-1e97-4da9-22e4-08d99f442ab2
X-MS-TrafficTypeDiagnostic: BYAPR04MB4277:
X-Microsoft-Antispam-PRVS: <BYAPR04MB42772D58DED1D24EDE45D020C78D9@BYAPR04MB4277.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wz+jm1p/9xgPlRB7RBz7fHm6Iev8k+Sa+ONLGd4qMVkbQ3sn+N5VG7N1LcjlecQHlSBXKqY29LzMsRm+I5mLQec4afgscsaecFtkyyC1TUQIK80ndqFPaCC7glResq6ZrQsTUySCBxxYSxTByqfbVlY2s13HL1c29ChOwxazJj0izBaW5ycKkS5jrkiiLrRivZRtuFfOVIgMkZV/TV4i5VaJdAkz/nePepMpQiVjuOT1hJNnVu8f4Cu203VITveHgg7B1rZ5SbauKJsU4CzxeV5z4tI5ZDVRabGyBMm6rogqqCAM2Ud0Lg4Cnz9zaCe0MVYUCLWsxhMJRn21Bs3Vc3h/FEGwBH6BbGmLtzmrZLK/FcY1W6HeCfp0UAduw9SeYleZVi29kIdKJKqFQ8YIxBnyb0pshqynwWilC3icl7rTyUsW0ns1ZTUN6sq9VZF9nwlxkRkYsGzyb6M/87HmLrE+NItePA0Lug+TvuTn0Dp+HXP6J8TLAQgdViItXnV5skTu21JRHWc5GCmXZchDxotvjG/G32dOmS914cFme8QlTA7aJr3N74VSS+doAWsFCmD1TWDJOXFDH2bImWPH2wz7I5hbgTLaawtWUTmB8Q/SRqOFdOfoV2N+U8uui4UJ1BmvtsDMbqpWncKzqnweg9NPBzIdNGXpt8jtpCOc6KHa8IaIQ27rZCcBqd6Botr78dFDXEiGHIxBiCumBBA7Lp2X8r6+u+O94s/y9oxr1LU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(186003)(26005)(8676002)(8936002)(55236004)(36756003)(921005)(86362001)(7416002)(83380400001)(52116002)(6496006)(38350700002)(38100700002)(1076003)(66476007)(66556008)(6486002)(54906003)(316002)(5660300002)(4326008)(508600001)(2906002)(66946007)(2616005)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xnIuGFPSDy2bTalMRSybZSR1cys+tsbxuwOBCqJbkh3oLkTQhLyBiX92r4SD?=
 =?us-ascii?Q?8zjF9lzEowJA/Vekq6Ihu+ZP9I4lsIuA+iE38raDDrz/PAzVvCFcd0Y1C79s?=
 =?us-ascii?Q?yB8V36OedVRU7irF+fMZveQmVGy4jkb76ytFApI8tcsqYdl+1fD4LZypMUKx?=
 =?us-ascii?Q?9Y235MOMaxqijd6NZLNexjTbSTxh08WXG+CZNApsUehPq3QMrNjPup91lKC/?=
 =?us-ascii?Q?rfCVL0FFzyJGE3mRySTzJFdUvKy41iEdrKX9HF3NIJTL9RbotKfZM5QoO31A?=
 =?us-ascii?Q?kbRHWv8MYmzHGpc2I7jrI+4ZKGHn6MQ24b38lDDeZEzA3nu6jK9jXKVO4wYc?=
 =?us-ascii?Q?iPvpc+huZVzFDPQwTVNtwFBUVCodOAbeW7TGFwbz8mtxQ7nAVL5BCCBu9sNe?=
 =?us-ascii?Q?T0yxyKkN4yUJqHjmVJ8JhCq9y6dvA3r/oECEMNRmkqlq5Bmi0UQcTIXyhqNf?=
 =?us-ascii?Q?o50Dx9eXdNseZkUNcC5tQESrqxDDf3NzBl2wNvLEJWh27iF1cNSpMvw9SbKt?=
 =?us-ascii?Q?pxY+MR2FfQ9GgsXIjIbtC9IJpvvw009OTbPBbG1TUcLEjTgrSF3ZppH5RhY3?=
 =?us-ascii?Q?gge3OiDsHKfja++lAXYpnzoA0J+/CTquA7jDzA0iM86UNzNxSgklFNKm3G2B?=
 =?us-ascii?Q?jh3FnpWuq7P6XCRuep0L4wll/xXFVJ6Yz9u6T94mQYkdNDeaiu+wifMTCQbF?=
 =?us-ascii?Q?+v+wbICGEECiKRaLCB7zW2hxJDjH2IKM15srOaRQH7TiDlgx4HlLgLae63Zg?=
 =?us-ascii?Q?EQupjoAx3FFxWqNrOgVlOY5ZTRcXPNRTZqxvvKQxWsoR5lab7pM7t7qHHT7J?=
 =?us-ascii?Q?Z2vrIRghuIManBNVa54r3zQudzVSkSP86+Sf52K5EB79c0uPfxKQCryx8pnP?=
 =?us-ascii?Q?UNmxOsbyp3Fu/xe699TbdmoLrGeVres0iINN+UCtrDHSEOb+UlEjrtWNfDrC?=
 =?us-ascii?Q?uYiPKwZx3eHuzTTDF0yBh0xwPd2Z4aY97nYjoOTwn3XQ1QAMhLKR1vQeDfbT?=
 =?us-ascii?Q?XWq974TKv6VWnrjnoYauqhnxqzH/mbiB6p5kAJEC/jofMzkegMh7wTZt31IT?=
 =?us-ascii?Q?PVQ+hmgWUV0jma1gPevwy0nlYxKbmz+p7zcmKAPKunyGUCEmPvteGBGB7cOh?=
 =?us-ascii?Q?+cJjJ1FCeBIbblJYnLExjY25cmALdGR9i3NnwzJg/pyBxqOQUpDvESQRDZWv?=
 =?us-ascii?Q?nZmVoVWNEHCEBtKOAEFrCv8WNdeNXJv15PgmE3TkDRKIimLibgBkcmP4Ccgb?=
 =?us-ascii?Q?6pblQp4+ESnJzvgph4m39hPCvNcLJvg7b10yZRQCSoon1z1bvAZ7PiC/iEO6?=
 =?us-ascii?Q?y0gbZy1CcTaih/J5VoRHQbsNV82e6dcH0fLBqvhT2X//qUBzD271ONSxVAz5?=
 =?us-ascii?Q?JflnWFovJvh0kYnulDoQYY7yUNBL+iirzBbK9zXHMDcm1PKdFq1795pHeuM4?=
 =?us-ascii?Q?zwSBj4mTlKk7adN4aKtPGIBZEZQroE1hynJ8BjWUEt6Hc5dtjfI8vwRh+iMh?=
 =?us-ascii?Q?L6GkA7wfHYB6Zbf3JpICVeWqvFZ6ztgpovV4NiXgtx6iMsG2/9G5t5mqU8jw?=
 =?us-ascii?Q?fHoAPQS8f2ES6LaePRAxibHQix8Cz4pz2oI0x3BpaOCrJsnHOHtj+md/d/fl?=
 =?us-ascii?Q?plDvoGy7z9BXSP09TYGuebI=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdfde464-1e97-4da9-22e4-08d99f442ab2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 03:35:37.3611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +vRZbdxEaMRps2I0Ck7XmcHWl2BlOrTWzcDd0BfPo5miW1Sdr7BIFMUuMak8KhWOuxLhLI1x681jeh3kkrOOhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4277
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

