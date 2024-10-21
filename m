Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF959A5AB2
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 08:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BB710E410;
	Mon, 21 Oct 2024 06:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="CD8rRob5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011041.outbound.protection.outlook.com [52.101.65.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F2E10E410
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:46:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+AkTtI550diKcF0n5K4MGIF2youbHXOrN9K8lzaB2YDHTPCsHDVaNTxJur+LlSj/dp8o5MtNauTpZEBZd3z8//8oLkMise0WgQlSX6c658lGfRKVqs3nb7oW7cHAfZlkgJZG7yNVaw8OqgT7FJIKa19czJXICd1meAWdLNdLmgOpqq3nX3NEDsZwiUQsxdqVdkbpDZ2RPOftxHS92ZhTWCt/NkYb2ncDquWuQvfdZ70j1405h+kpoRl6INvVf8nxDKbO/gPUfZskz7ZFLY4HLvzuZKDGcOchadXWIpIn8xMDi8LG9syBIUsxcnmYG7ENkv71x95BwCjSHbkIcH2qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DuV7KFTyFyicCDR/hyADtZQbwKk5waEIVAObtX4OHk=;
 b=ZY7bVKWSx04ZiQz/dZVnESipftiWb5kHe7qoUv7kQpBpFCuTgmxtRafQGuhJw9Q0VI2RM1JaFi/sl3S7y9a9QhhmYh63Cbc731QEl62W6mqtSmYKZ6ttg2g2i9dMmpXuZFtKwmVk1PVuX2XOHVoC0E4ifm+qq+3pV24zTSroY6Jo6c14lQHGZ07UsS1arj6LOPmMj/Ku0iUxHz6mj53nIEEBee8qZLUXki+iVQ/soX4zxPifgER4h/wYoay6TquBjjI1tt41SGkvHSrzoa7okVLzJyuDMIGbOu6/VnCOvS88WHkqOVnON0gjXu8CG757IxeM7d8Zat53kRLi5uxUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DuV7KFTyFyicCDR/hyADtZQbwKk5waEIVAObtX4OHk=;
 b=CD8rRob5XOHRkQNkfHF+yieOUGlHcqOlEnN4mb10Q+NMxUgeQkvpro5FGvEU0oz3Rimo06t0JMF8v3S4qDtjsToNzvZPIr5rnelZTbL0UWCAJ5IlfHJr5GeffeLG8RxmbVk4qZj8w1RPOImV/yIxcTOjzYlvTqBLZhQ0Pv08yWx8H5IX93FcToic1Tx5eob6u5fGGMsL1ffJCetfkERpiTF7AE+7JuDM6IUapkOwKolefj7ROchv3Pdrp0QhX01C7iTF6FvXY1JQMBzIV7I1r6nB9gHpnSviE/Z2HheTantzV0a2a9WsWQsdSt8ZjzqGuTmTVCg86krzsRrKP0y8iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VE1PR04MB7374.eurprd04.prod.outlook.com (2603:10a6:800:1ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 06:46:33 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 06:46:33 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v3 07/15] dt-bindings: display: lvds-data-mapping: Add 30-bit
 RGB pixel data mappings
Date: Mon, 21 Oct 2024 14:44:38 +0800
Message-Id: <20241021064446.263619-8-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021064446.263619-1-victor.liu@nxp.com>
References: <20241021064446.263619-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:4:91::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VE1PR04MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f7b0406-8efe-4dd3-8a2d-08dcf19c1a14
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|7416014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QN5CL0jLcGhGXvVbiWJ4g/XPgYlG4zuibpYwLt70Vdt4AihJqqq0A+G5UkBS?=
 =?us-ascii?Q?tm5jmA3gEnvqPcGGh4b4h39kxLdYZTxXNvz9G55jzkwitcUxgPs7s/l8NFdA?=
 =?us-ascii?Q?KA4OhsTRQmtEPy+eY/f2kcPH1uu9INzpwj8VcJuG81gJT6uOc7UjX+cR2Fv4?=
 =?us-ascii?Q?Qu7LQZHckdfTZj9uhgIe/LOejq2/OQIcCJsXF8403ehsQX3bp2MsqnMyDeJI?=
 =?us-ascii?Q?gWUqY9Qudy+X74EwjU6tVnBVuDh6+SPUnKuG45PDGEgCBZgQWrTvClvJAVfT?=
 =?us-ascii?Q?8bUEwxynLAJ1MzPSoZr9/FmbyZ2N3wNZTBU80tE/TdOTHIcNx5FuJ1dUnEPr?=
 =?us-ascii?Q?bF4cgSvhtsQkKSZJOMP4LKT/MpmlryAdHoRAXDrdsZ8REjCFnAGDN7xmuNip?=
 =?us-ascii?Q?B9xb5nrRwo3Ub0yNGlsTDPk2XuLvd+7npzr276kbWrxFeIgiTZ1ChszmyLC3?=
 =?us-ascii?Q?SHZOr59HcAgjE+c91tv1QjhNSFT36Hulq/CKic42kxF4iR8iPhogNHMTNxCf?=
 =?us-ascii?Q?jjwqaASqrIqVS9dijCqnb0ufx1kXWH23Lswlno5SzGi0t9bedgwaluPKuaDo?=
 =?us-ascii?Q?Vn3EPmjVg7/1koD6dwENGw/MBczFCMgaR2ToafbapKOHEJ1qHQKdHNe5FZIR?=
 =?us-ascii?Q?Psff5Kd6kMZtOyHM/J4Ghq8DtI4t5My//uYbPyK295n/eO4MxI7SU+ZrC2mI?=
 =?us-ascii?Q?/axRkKXwlbitNB7YuWb2YITO5f8btCJqADFvIic7PGYb0t2MeS32pxLXgZu4?=
 =?us-ascii?Q?MZSfc1TFwkz8h/8i8ZBADPt+q5r/hqLCpsA16w+yVk3ISsE/9hlMCKRkFlmv?=
 =?us-ascii?Q?35mHnKWgehkCWTq/+oh1LpgJ2YdLUNVGqvEcJsEu1x29+S1ayGXbHNTpRseh?=
 =?us-ascii?Q?8+ATOXIbG9pUoAHDcoeyCIP4sGPT+AmJ+kxCeVMAG15h3E8kfvYTsKioxJYB?=
 =?us-ascii?Q?JHLwc3gB3YPS1FJAqFG/4JBN0Ds4moxwjN6Cb250K0sThG/1y5O10XoEiQlI?=
 =?us-ascii?Q?8hk4TzoYN7GK+G3yge+vYgjR9RPr8EOaK0eWrXEJOK4FgDEm0HhJnUekNfYh?=
 =?us-ascii?Q?tgaMuduDXyyEXojEK3UWC48VZDgyHS89ICL0SOyGEqr2Q4mroNi7Ta5FjkLs?=
 =?us-ascii?Q?O1IV5SjFt0ISp4V3PIRrhFISqDyT5dv42Y9mGeXjqJPCkAvWDaIV9sedP4Ix?=
 =?us-ascii?Q?dk15EIUXFlbs8G4z00LBq68yz+RxXQLENz6G/6EBUE4t1y52S0Gt4BCG98Gr?=
 =?us-ascii?Q?1XJ41L1Q7ApPZFb777zZ9t4nBvBt7YuPnNR2vbcp8XIJtIY4uswNvB+bcGa8?=
 =?us-ascii?Q?zhBaG3AbDZF5vC7xvgKA337UA02DkO3mmRJboPq9bIqgE1ktZ6mKSOjLGOWf?=
 =?us-ascii?Q?SuOkvrc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cY7gOJw9IisfTNBu3d3eIZ52m5WZEHgTvqL22PCuD+D5wTsyZNka3zeY+Mrg?=
 =?us-ascii?Q?TVSgQuKPqEvRapP772/IOG7kNNcg8vDLxfvHz75kgKznLhddThckMtzPapOy?=
 =?us-ascii?Q?xJMXEPDepWg79ugLZqT2deDXIois3uoL04tYZFcWZNWnsxo3dMf7xbi+T9VE?=
 =?us-ascii?Q?eZYb9H3oiIDUEDTQ2nbu/0+DHASPduPFYkWjqjKGoKS3OCJtnrPV4PRVXdFY?=
 =?us-ascii?Q?9tRssm+5FX6JO/5eNItZBg+rlF8pXvpCaJWHVHnBLuLcd4rsrIBu5/OLP2PG?=
 =?us-ascii?Q?4SUDPgXvPTtVkwHU32fUsE4JkcsDh5jbkShmQ3M+tHc0Lu16trqVuHzFJ12G?=
 =?us-ascii?Q?A107SjypgARVeNxZhmiLmQvkSXRSKd5Y8m6m1RMNaGe/Xq3jrEa8VKye+y8+?=
 =?us-ascii?Q?qb7/CP9y3OPrSoAvGYXxOuH4ZXI0pnUh5v3qUc6mZXl5VPEMdkRKVg0nz3mu?=
 =?us-ascii?Q?VBttgfO8QFxfsraOAqQmwn7T/2YaOoLBgj/D0OhbQ1ymOclk21H6n34Mt2Bq?=
 =?us-ascii?Q?gHbQK7SJU0wTROC3kdS7Xz6QTtC9NlolIlfemOhcy4no0CDFvOEwS2SbGsON?=
 =?us-ascii?Q?FFIUwEJqBM/uEhXBMxKIe1uNAx9uWfDT9+gt+NIRpFr3MAyOo99VL4nx8j4l?=
 =?us-ascii?Q?rp4oZ+Nr1fP9WHX7qFALN7U7wcu0aTW0Ko2rspzjOX7oUP+wAhWi6PH1A/iU?=
 =?us-ascii?Q?1tJxW4L3stPvtm+XOjT3xcGCwaLVtv62mrGWPLeDySpiOgc1HazNWNzi+MfN?=
 =?us-ascii?Q?115NQ8FkgCfezpWGSc+KCffLxkXyf/XBTuce9VDIQI+EhntFByOPTJFOMtg7?=
 =?us-ascii?Q?JtEFMn+TamuGH378/kzSA2Hl11Ze3mRhhCk/03fOqPBy96+dFzzlEWSoWTRQ?=
 =?us-ascii?Q?U301T9VeNTarcrH6v6An2ZC0iQM/5w9HrZDVLUn7qyj92dhxvlVOdMh92GLt?=
 =?us-ascii?Q?mL8LxwlirKn0jgYtlGHsOb9cUCwSmVwcq7tIMJdGSB/lS7KsA08ouTsCpL1w?=
 =?us-ascii?Q?8QZnzONScDqAdstspXUKEku/6CNWoAMQOMRmSjP+PycMVRd/Yl8hkcG6gGV7?=
 =?us-ascii?Q?5mt8UTpQvACrGSBUmlVHV7NV0IUhS9bsRVT0Q2TWB76BLc6CjA3SAq4+WROm?=
 =?us-ascii?Q?+TYdnUHTzQosN2hImSmlHMXwmkWvbKCsfGFSUcMtA08xuZehY4DWkjp+Zu5i?=
 =?us-ascii?Q?YMWRf7AXGObhg4l544BL91C2Ar3c2xoO7jYdY++jA7mw1uv/VpLY0nPAzHxK?=
 =?us-ascii?Q?8omVPnJixqThHKHDR0aMn2hqannOCVu5JzelFZks1wslcJV/MgJrk26fH5Pm?=
 =?us-ascii?Q?0z+71l9tlKNggr4u70GVyjw5yBA8ltSeY0Ua1MwILlIRn2KbiOqqq+fjBkF4?=
 =?us-ascii?Q?/QC6XfxE/yi7f6Lqccj+L2Ij7jr8SqxLKvVDV1ujWbkIFp8CW6EdE0piQwW2?=
 =?us-ascii?Q?AYFvovLAbn0+ExdtejLb746y8glpTBPAggcf4AydI2IQqey1pVcsok4K25lJ?=
 =?us-ascii?Q?sxOxEnK5ghLHIdf2voWkeaf/QtHupRZl9Nmgu88AGnMzYNBvC0FdXI1T5wcb?=
 =?us-ascii?Q?MH3bOdJhVVE5ELQddVdPTGTfryIsx4aD8JGBB7kh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7b0406-8efe-4dd3-8a2d-08dcf19c1a14
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 06:46:33.7009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlVh6pET/L7+ysGFi7vPkLxmPA0tGPgGz0QIvLVbXR4NOOhJtzmzzmIQhsOqThTDUz8WesQxjNGSbO3GattTAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7374
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

Add "jeida-30" and "vesa-30" data mappings that are compatible with JEIDA
and VESA respectively.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
* New patch.

 .../bindings/display/lvds-data-mapping.yaml   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/lvds-data-mapping.yaml b/Documentation/devicetree/bindings/display/lvds-data-mapping.yaml
index d68982fe2e9b..ab842594feb9 100644
--- a/Documentation/devicetree/bindings/display/lvds-data-mapping.yaml
+++ b/Documentation/devicetree/bindings/display/lvds-data-mapping.yaml
@@ -26,12 +26,17 @@ description: |
   Device compatible with those specifications have been marketed under the
   FPD-Link and FlatLink brands.
 
+  This bindings also supports 30-bit data mapping compatible with JEIDA and
+  VESA.
+
 properties:
   data-mapping:
     enum:
       - jeida-18
       - jeida-24
+      - jeida-30
       - vesa-24
+      - vesa-30
     description: |
       The color signals mapping order.
 
@@ -60,6 +65,19 @@ properties:
       DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B7__><__B6__><__B5__><__B4__><
       DATA3     ><_CTL3_><__B1__><__B0__><__G1__><__G0__><__R1__><__R0__><
 
+      - "jeida-30" - 30-bit data mapping compatible with JEIDA and VESA. Data
+        are transferred as follows on 5 LVDS lanes.
+
+      Slot          0       1       2       3       4       5       6
+                ________________                         _________________
+      Clock                     \_______________________/
+                  ______  ______  ______  ______  ______  ______  ______
+      DATA0     ><__G4__><__R9__><__R8__><__R7__><__R6__><__R5__><__R4__><
+      DATA1     ><__B5__><__B4__><__G9__><__G8__><__G7__><__G6__><__G5__><
+      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B9__><__B8__><__B7__><__B6__><
+      DATA3     ><_CTL3_><__B3__><__B2__><__G3__><__G2__><__R3__><__R2__><
+      DATA4     ><_CTL3_><__B1__><__B0__><__G1__><__G0__><__R1__><__R0__><
+
       - "vesa-24" - 24-bit data mapping compatible with the [VESA] specification.
         Data are transferred as follows on 4 LVDS lanes.
 
@@ -72,6 +90,19 @@ properties:
       DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
       DATA3     ><_CTL3_><__B7__><__B6__><__G7__><__G6__><__R7__><__R6__><
 
+      - "vesa-30" - 30-bit data mapping compatible with VESA. Data are
+        transferred as follows on 5 LVDS lanes.
+
+      Slot          0       1       2       3       4       5       6
+                ________________                         _________________
+      Clock                     \_______________________/
+                  ______  ______  ______  ______  ______  ______  ______
+      DATA0     ><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
+      DATA1     ><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
+      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
+      DATA3     ><_CTL3_><__B7__><__B6__><__G7__><__G6__><__R7__><__R6__><
+      DATA4     ><_CTL3_><__B9__><__B8__><__G9__><__G8__><__R9__><__R8__><
+
       Control signals are mapped as follows.
 
       CTL0: HSync
-- 
2.34.1

