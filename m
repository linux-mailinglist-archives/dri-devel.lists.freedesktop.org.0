Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE6A9BAB4F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 04:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F4910E35E;
	Mon,  4 Nov 2024 03:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="REVl1M+x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2076.outbound.protection.outlook.com [40.107.103.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AFA10E35D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 03:29:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2q0tSE9F8lWSVUwVubrRQr42ZUsFdiMhVV4IoeYlKeDe4ca2qyKVeJXaqaalQrB8avaxo+pnHO7aqHKRNVYApbkOPsgeMBxKwnibPFhkppRaTfOLZckvHgagLXBVRJiYrYoBboc1IIuiI304XddzmhN9TiG71ywiRMWkxLP0hQC5K33yjOUztakCEIs4fulTU+RE8knNtcRkfQ2nJgjT5/j8Yd9xsG89R1g+wYSyXtRxHo9WsB4Z7w5q0WKWwTlPcgmoFLZyOpRy+RlkLHY8aIcE4Jna9F+QhdbZ4+jJiGkrZ3Iv38DHQnWZmyeN4bKsJf0XzWCmwhSs3jk/+HsHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOJ6hUZBUjjiafj1p+dZhh6hiR6sWQVveCsXDuD/myo=;
 b=xC5Z8/ru0zVnAtS+qMI3h3DRoAab/tcmHC3wPO1S2E02gfH0hRipRovzCVNIWAIpiGFEwfvJ1hzXXPzgql9wclqEoWb/yLOAnjnsVF+i7jAZ+faqZejWd2rO/Wxal9a/aBIw2DyaV2jHagsUjI+6rX+blbgmkaoKyr7VAXTsu/EbzTwRuNZ2tXXilPeujymQrVbjRKe7oj+5bdePh6IF2YzHYit43CDls5bvgLgYaF/Ou5iJWTvMtDNcHwmNaYnPEwtsbHrZqG2aDCzyg7DTXbO7tC3UnXv37wTqR7apax7pkyx6oZNUCePyMvpHhmKD4x25uNyUUIMvtuL66mn9fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOJ6hUZBUjjiafj1p+dZhh6hiR6sWQVveCsXDuD/myo=;
 b=REVl1M+xgeBcxZBNJ+GXV8EUwR6eoLa6f3W7yGOI/JTxcFtlI1zbQ6b10Rm8yx90qZ5TGcEmlJsuN5/XYctWUBiAac3u78O6BUO2CiPiJNXmYO4+zxIxyXh+xJI7c1X5S6pn+Hi6wPy3ChNYWdojUoiQ1soov3o7DvSwrU/jKqGKJNpszQQzg01srNflB+JO/m/kEcB3mCp3GzQoQdea4foyvb/lkG+Nunke5yGz+e9UBojo83D4wTqi19g5otRXui/ZmckNS8P1rpxIOFTlACOIwxxgTd1izH8DixeKzktkgYjWFcRRb41Jn+ZshGWAn60Dy3oF+yY6yJtJ/fLd7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB10602.eurprd04.prod.outlook.com (2603:10a6:102:490::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 03:29:06 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 03:29:06 +0000
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
Subject: [PATCH v5 04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
Date: Mon,  4 Nov 2024 11:27:57 +0800
Message-Id: <20241104032806.611890-5-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1f09f0ef-0c4e-458a-ed85-08dcfc80d640
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J2DY6qMQmXbVe2uND5UAn8A5hnmOkAUSuMgNXCuBwmmT+LM9/K0MsG/nZAo5?=
 =?us-ascii?Q?h/xJLtXM9R6P3hcqydFV8Q0ln/aKuu6T8EGuJYxQ315EmhZBIgYnrAv3eQOy?=
 =?us-ascii?Q?et8QlQfqL4puJ8BJNdZ1dl99ahJsoYCplbl9/nFetNfO86Y4KxvGwXOU0p2t?=
 =?us-ascii?Q?ZbR6DntcuQ+a5hjXXkX+CKQ1/MyDKH7FZwbkkeIY0Yd6/MM3wz+AqsFYMCJA?=
 =?us-ascii?Q?2zVZ18nM5lFS+wHDyV6nedYM/WhHZhyXVctjxeV8nrsrngYPZ9wkWKiTgNQM?=
 =?us-ascii?Q?/Eo+F+Oo1IzBnZbkcASRbmUVKWe1UB/A6P+z+1T4SHM1Ajkt46cLUKwL1gSj?=
 =?us-ascii?Q?Jis67z1/Qy1yaY4zw58LOJXzKbfwlOK6rt8uOgaapsW0FkhR9sJVkxd1ho84?=
 =?us-ascii?Q?VbADPjxnB5Q0qF9iCBr1szFElW6JkZVhg/7coi8UJMXoLt8kyfiE0X8wdy8c?=
 =?us-ascii?Q?LIXp7ZxUShsMEgvJ3mePLiR0E1+e4uzSpIBehadsiSVJi7Vi2J05XKuBIc6W?=
 =?us-ascii?Q?wERw9MP9vOGo9vRi9y7t8ng05Oom4LfSVqSJ8OX7tgBk7424p5S/rayCACw9?=
 =?us-ascii?Q?47OzXW10tEFwbyTomiCHnORo/TiRfBkz75CYyWz+nQ3XVhaWOJFmB5hgX+fB?=
 =?us-ascii?Q?P5XVxUfEmaIAVms6EdLDoyu9FpsvDZSzjmBwpM1DzK0VZ3GOfFAbCRktXDMH?=
 =?us-ascii?Q?vFaatTUFW8dyA8k4ebNLekNxxJC/XVusIBMQ6qSP9lnGyDuOuqt7Q7Zld5cf?=
 =?us-ascii?Q?U4Wd4OvpTGAksIrr9xGCFZuhqLGO03401PbePUfkiJ2E+cy5MyA7SdSvsoe/?=
 =?us-ascii?Q?CoTdpJM2YXPuse9m13TfPEKIud+UxW3rajBjPZndppJz69WsdaIjYmRW09YK?=
 =?us-ascii?Q?b/s8ci+m6bx+b/FBkxWYy6NFQU0Y7KzFZTug9CVfuDMmUowGpfwGZDF03r+J?=
 =?us-ascii?Q?TumFiveNXOWGlINy1+9dki51CL+/Vv9aNuutJ+qSgM88MSDxKgy7vfI5aZLB?=
 =?us-ascii?Q?xZv8i2NFP74MAahi9kxusr0RXeBMf8fC1QLImOPSK9SKj6ONdBNwwg48kqog?=
 =?us-ascii?Q?qc+51L7yExJY+pnUa7UPCI+4HD4ubOiwaQZexYSuYZ2GBk+uQQhB51nvPVk4?=
 =?us-ascii?Q?v0+g9qwLX/RPxyeHULyKzdjzDVyuZLfVjlhjjMPChBDhC5GacWvbCaOYE8KQ?=
 =?us-ascii?Q?oQLCeEZJ7+AzhcKznFueEDBkiII7HSgDTWhQ862FIsmDadzKto6E6jq1HKFC?=
 =?us-ascii?Q?2gXT9QX0trI9yQuQSxA+0Sm2pD8dXlICByHK4ihECxLb7eBvmesCIwpZ0E3o?=
 =?us-ascii?Q?KCXzTxRs1p3sLgbOJkcZ4fMLLML/yApl1nl+VC79+a7k/pMCerXZUvKOPj5T?=
 =?us-ascii?Q?FO4PGTA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RwHgj1lsG/XkmQXxBUxEECcTLGPkUCgaxPV0CU3QFH4Wv9Mq1FoRiyLPk7Uc?=
 =?us-ascii?Q?Cy7EbVkG55/AMHuMvf6HPlVmJF5O0x8irZoFWRR0WNQErh2me/kCZJcuirZE?=
 =?us-ascii?Q?dZPU34oDngIA5Z2u33sx4KmRFahL7rzZg3lYJG6S/a+XKJnr7Ttum0rNMQue?=
 =?us-ascii?Q?FJRkNUCuiPGiCiYa8u/jIlifsS/hOn/a3yMjLf8yagjOYVUD4dM1oaqNcrN9?=
 =?us-ascii?Q?XH4HX3HH92rRDwrcMbTbOV0XSGCTqlswzUzhrwxZB3JuQteR1Ku1hMZdG9M5?=
 =?us-ascii?Q?2Zj9qH+hCvfRdWMf4Q2h72j3h6+LjqG5yOCe6Q5BIB/d69DWFutBP79CRwQ8?=
 =?us-ascii?Q?FvTiL3JzP2SE6648/xd9NI3Zp6jeOvQzhPM6pVJM+HuBqrzbSVfOt1EZ3vf4?=
 =?us-ascii?Q?u5a74/ESGbbrMM/xa/A7LZN5aQFZtuO07XB/Y/Nl5q8wWl/2qUmrAWXXUSlk?=
 =?us-ascii?Q?82W4/Too6JBC0NgbIXA20JVjFsvwTN58iOzpAAecuCT3F/myCBcNdlkrSvRM?=
 =?us-ascii?Q?wGtSDe1OyobHIi3DPqaNmZcrlStbgWVnLwMc9TG1OTyvMMNAEAwfTyKNMFOm?=
 =?us-ascii?Q?I/9sw9fvAJ1Mx8CbRabaySvrIJluEAPqtReHnEoMaeOrFz3pNVFQolZQ+EnB?=
 =?us-ascii?Q?fVb1uMriVEmQMIwE8BdPCbcMulUpyCmtBrLBPrMtGxt5lpHWwTEbQMeUSO96?=
 =?us-ascii?Q?kbNihfpp55AeD4EbudFyx3/OsjgqVwW20qRxivJmCtACTHA3J0Tj9Rdk6cdf?=
 =?us-ascii?Q?7pQxonVN7m37LFJEY/Ej9v8nHvyL/j4PYUjpGYVQ/s0F9vdaSkijdSSEvkqa?=
 =?us-ascii?Q?Rd6aUZC/9AwpjkNF/RR67NGBz4p0c860FAk/XQ0tMdk4L9lVF5lkhviYr2yH?=
 =?us-ascii?Q?YNN2Xy/CZOan0zl+e55BEwzaifQu8XuQ2c7eMJnc43MqL3ipjercHh3D/up0?=
 =?us-ascii?Q?VaUsBldWYQvS5lTodnbnB30Rzmos6z2AWpB/CMkre+fPndk/5rTNbj7vtSCu?=
 =?us-ascii?Q?tdGMb8Wt6qiEaVizHwN9dFZdtTbdHaBXOs/i4ZFIX1K8ksVHsq+T5ppOLmLz?=
 =?us-ascii?Q?zqCYioSJsi+zKYM7J9fnIDge9HhLrfl27q8g1aDBW0XuvJ3rvMvVq3fVKVIV?=
 =?us-ascii?Q?x3AskkHilF8C+obO+YFdXlKiuRC4dNja+JKL5iAYfaW4vPocWqNEB/vO2jyB?=
 =?us-ascii?Q?bG1vmvG/WPNMHIInq7YE1IacP1LQHrymRu+0EG3JNZLQ1fcZ+gk20A9gAuKk?=
 =?us-ascii?Q?hmtwuo8N/KuTHMOZW8H1a3wuYdNeyHLwfKIv2gdVXgEYvnZDKPWmtzo2LcOz?=
 =?us-ascii?Q?QoTscBD55qE536TWzskR0bVgvIyXFj2eHmfy8fhNY5NMdmyBo9c/cJh+jCOD?=
 =?us-ascii?Q?NykR8KThuzX+2EJeG0y+oDZqJr2ipy3mbJb70PN8RJzeDmbpTzX589H7nlN4?=
 =?us-ascii?Q?igdttetDTT3mTknB9TF5txkMrUTbVIkbNNfELiicygcUjl9hHGUD9tl5paNL?=
 =?us-ascii?Q?dHN0FyxsT4HTzXsg9OoLHrq+h1/tV48wCNubeeCeiKfMvqsNAfT7NlZvup0S?=
 =?us-ascii?Q?AHrDzOcx0nhm1LthCwr5xAF6PPViLmesnbV5EQBQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f09f0ef-0c4e-458a-ed85-08dcfc80d640
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 03:29:06.4193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SoWushPs1X6U6s+JvI3DJoe1jXM+nvoklNX6qwiN/BIh0jHTf94OyK754OIy+e08I7w70G04FPW1pgMRMh42Og==
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

Add two media bus formats that identify 30-bit RGB pixels transmitted
by a LVDS link with five differential data pairs, serialized into 7
time slots, using standard SPWG/VESA or JEIDA data mapping.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5:
* No change.

v4:
* No change.

v3:
* New patch.

 .../media/v4l/subdev-formats.rst              | 156 +++++++++++++++++-
 include/uapi/linux/media-bus-format.h         |   4 +-
 2 files changed, 157 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index d2a6cd2e1eb2..2a94371448dc 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -2225,7 +2225,7 @@ The following table list existing packed 48bit wide RGB formats.
     \endgroup
 
 On LVDS buses, usually each sample is transferred serialized in seven
-time slots per pixel clock, on three (18-bit) or four (24-bit)
+time slots per pixel clock, on three (18-bit) or four (24-bit) or five (30-bit)
 differential data pairs at the same time. The remaining bits are used
 for control signals as defined by SPWG/PSWG/VESA or JEIDA standards. The
 24-bit RGB format serialized in seven time slots on four lanes using
@@ -2246,11 +2246,12 @@ JEIDA defined bit mapping will be named
       - Code
       -
       -
-      - :cspan:`3` Data organization
+      - :cspan:`4` Data organization
     * -
       -
       - Timeslot
       - Lane
+      - 4
       - 3
       - 2
       - 1
@@ -2262,6 +2263,7 @@ JEIDA defined bit mapping will be named
       - 0
       -
       -
+      -
       - d
       - b\ :sub:`1`
       - g\ :sub:`0`
@@ -2270,6 +2272,7 @@ JEIDA defined bit mapping will be named
       - 1
       -
       -
+      -
       - d
       - b\ :sub:`0`
       - r\ :sub:`5`
@@ -2278,6 +2281,7 @@ JEIDA defined bit mapping will be named
       - 2
       -
       -
+      -
       - d
       - g\ :sub:`5`
       - r\ :sub:`4`
@@ -2286,6 +2290,7 @@ JEIDA defined bit mapping will be named
       - 3
       -
       -
+      -
       - b\ :sub:`5`
       - g\ :sub:`4`
       - r\ :sub:`3`
@@ -2294,6 +2299,7 @@ JEIDA defined bit mapping will be named
       - 4
       -
       -
+      -
       - b\ :sub:`4`
       - g\ :sub:`3`
       - r\ :sub:`2`
@@ -2302,6 +2308,7 @@ JEIDA defined bit mapping will be named
       - 5
       -
       -
+      -
       - b\ :sub:`3`
       - g\ :sub:`2`
       - r\ :sub:`1`
@@ -2310,6 +2317,7 @@ JEIDA defined bit mapping will be named
       - 6
       -
       -
+      -
       - b\ :sub:`2`
       - g\ :sub:`1`
       - r\ :sub:`0`
@@ -2319,6 +2327,7 @@ JEIDA defined bit mapping will be named
       - 0x1011
       - 0
       -
+      -
       - d
       - d
       - b\ :sub:`1`
@@ -2327,6 +2336,7 @@ JEIDA defined bit mapping will be named
       -
       - 1
       -
+      -
       - b\ :sub:`7`
       - d
       - b\ :sub:`0`
@@ -2335,6 +2345,7 @@ JEIDA defined bit mapping will be named
       -
       - 2
       -
+      -
       - b\ :sub:`6`
       - d
       - g\ :sub:`5`
@@ -2343,6 +2354,7 @@ JEIDA defined bit mapping will be named
       -
       - 3
       -
+      -
       - g\ :sub:`7`
       - b\ :sub:`5`
       - g\ :sub:`4`
@@ -2351,6 +2363,7 @@ JEIDA defined bit mapping will be named
       -
       - 4
       -
+      -
       - g\ :sub:`6`
       - b\ :sub:`4`
       - g\ :sub:`3`
@@ -2359,6 +2372,7 @@ JEIDA defined bit mapping will be named
       -
       - 5
       -
+      -
       - r\ :sub:`7`
       - b\ :sub:`3`
       - g\ :sub:`2`
@@ -2367,6 +2381,7 @@ JEIDA defined bit mapping will be named
       -
       - 6
       -
+      -
       - r\ :sub:`6`
       - b\ :sub:`2`
       - g\ :sub:`1`
@@ -2377,6 +2392,7 @@ JEIDA defined bit mapping will be named
       - 0x1012
       - 0
       -
+      -
       - d
       - d
       - b\ :sub:`3`
@@ -2385,6 +2401,7 @@ JEIDA defined bit mapping will be named
       -
       - 1
       -
+      -
       - b\ :sub:`1`
       - d
       - b\ :sub:`2`
@@ -2393,6 +2410,7 @@ JEIDA defined bit mapping will be named
       -
       - 2
       -
+      -
       - b\ :sub:`0`
       - d
       - g\ :sub:`7`
@@ -2401,6 +2419,7 @@ JEIDA defined bit mapping will be named
       -
       - 3
       -
+      -
       - g\ :sub:`1`
       - b\ :sub:`7`
       - g\ :sub:`6`
@@ -2409,6 +2428,7 @@ JEIDA defined bit mapping will be named
       -
       - 4
       -
+      -
       - g\ :sub:`0`
       - b\ :sub:`6`
       - g\ :sub:`5`
@@ -2417,6 +2437,7 @@ JEIDA defined bit mapping will be named
       -
       - 5
       -
+      -
       - r\ :sub:`1`
       - b\ :sub:`5`
       - g\ :sub:`4`
@@ -2425,10 +2446,141 @@ JEIDA defined bit mapping will be named
       -
       - 6
       -
+      -
+      - r\ :sub:`0`
+      - b\ :sub:`4`
+      - g\ :sub:`3`
+      - r\ :sub:`2`
+    * .. _MEDIA-BUS-FMT-RGB101010-1X7X5-SPWG:
+
+      - MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG
+      - 0x1026
+      - 0
+      -
+      - d
+      - d
+      - d
+      - b\ :sub:`1`
+      - g\ :sub:`0`
+    * -
+      -
+      - 1
+      -
+      - b\ :sub:`9`
+      - b\ :sub:`7`
+      - d
+      - b\ :sub:`0`
+      - r\ :sub:`5`
+    * -
+      -
+      - 2
+      -
+      - b\ :sub:`8`
+      - b\ :sub:`6`
+      - d
+      - g\ :sub:`5`
+      - r\ :sub:`4`
+    * -
+      -
+      - 3
+      -
+      - g\ :sub:`9`
+      - g\ :sub:`7`
+      - b\ :sub:`5`
+      - g\ :sub:`4`
+      - r\ :sub:`3`
+    * -
+      -
+      - 4
+      -
+      - g\ :sub:`8`
+      - g\ :sub:`6`
+      - b\ :sub:`4`
+      - g\ :sub:`3`
+      - r\ :sub:`2`
+    * -
+      -
+      - 5
+      -
+      - r\ :sub:`9`
+      - r\ :sub:`7`
+      - b\ :sub:`3`
+      - g\ :sub:`2`
+      - r\ :sub:`1`
+    * -
+      -
+      - 6
+      -
+      - r\ :sub:`8`
+      - r\ :sub:`6`
+      - b\ :sub:`2`
+      - g\ :sub:`1`
       - r\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-RGB101010-1X7X5-JEIDA:
+
+      - MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA
+      - 0x1027
+      - 0
+      -
+      - d
+      - d
+      - d
+      - b\ :sub:`5`
+      - g\ :sub:`4`
+    * -
+      -
+      - 1
+      -
+      - b\ :sub:`1`
+      - b\ :sub:`3`
+      - d
       - b\ :sub:`4`
+      - r\ :sub:`9`
+    * -
+      -
+      - 2
+      -
+      - b\ :sub:`0`
+      - b\ :sub:`2`
+      - d
+      - g\ :sub:`9`
+      - r\ :sub:`8`
+    * -
+      -
+      - 3
+      -
+      - g\ :sub:`1`
       - g\ :sub:`3`
+      - b\ :sub:`9`
+      - g\ :sub:`8`
+      - r\ :sub:`7`
+    * -
+      -
+      - 4
+      -
+      - g\ :sub:`0`
+      - g\ :sub:`2`
+      - b\ :sub:`8`
+      - g\ :sub:`7`
+      - r\ :sub:`6`
+    * -
+      -
+      - 5
+      -
+      - r\ :sub:`1`
+      - r\ :sub:`3`
+      - b\ :sub:`7`
+      - g\ :sub:`6`
+      - r\ :sub:`5`
+    * -
+      -
+      - 6
+      -
+      - r\ :sub:`0`
       - r\ :sub:`2`
+      - b\ :sub:`6`
+      - g\ :sub:`5`
+      - r\ :sub:`4`
 
 .. raw:: latex
 
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index d4c1d991014b..ff62056feed5 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -34,7 +34,7 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x1026 */
+/* RGB - next is	0x1028 */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
@@ -68,6 +68,8 @@
 #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d
 #define MEDIA_BUS_FMT_RGB888_1X32_PADHI		0x100f
 #define MEDIA_BUS_FMT_RGB101010_1X30		0x1018
+#define MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG	0x1026
+#define MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA	0x1027
 #define MEDIA_BUS_FMT_RGB666_1X36_CPADLO	0x1020
 #define MEDIA_BUS_FMT_RGB888_1X36_CPADLO	0x1021
 #define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
-- 
2.34.1

