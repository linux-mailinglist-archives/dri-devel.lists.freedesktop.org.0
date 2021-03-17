Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE5433E7EC
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 04:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BF96E0BE;
	Wed, 17 Mar 2021 03:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80080.outbound.protection.outlook.com [40.107.8.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492616E0BE
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 03:56:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5GrPrL3NhCVn2bsl+tMD3f9p8VcW/0dgVuxB8vQAllkqiHhnwiH8yFpNLhqt9lR6zqZUn3e4TT+bricLZdYZO63Gfp7BtGLEUhNMCiYVq7OaM5R+rxngK7dVFPouFMKwBebsqu66DytIapMJApWJ1QrGZ5+2DgIh5aDq9PXb6vgigyLM6DGkdD51lcLEHdPvXt68I5mB86cM7QeDgfhQoz9lOD3wjJ3DKcjzvMAJQ+N7DB84Gfdb1JEZMISuZ9NH5dI7CLboMv6JgwtsyG5ZAFfun3pQwnAFv7AfVCY1sbka1K8JpIuoLnO53KGoVep3yPlYFKi+QgFSX1ebxQsRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ci8rK3VRiEO5u5VqUZEUp+R2RaPHM1B0q9Fb3iCW0I4=;
 b=nXJn23kSWLv9+7TYGgoSHBRHDeMWCPBStkBvLBQpp9DW46Ir3XNg11VYRnsGJa0KN8w+KocnvqykTLBvGO5XEo6JiPdx5f9xOFwB1GsOl4yO5jR7fO7ImUXHAQ1tENqgSfluATuvJO2WtwGXHpoIlUbA4nJO7gT2jIhDVEfhl97Fp2IP4p2qMkIi67zLmaLRKKGo1eDvvCvk0WUTc1jtJgWb6u9khb0EGrmXErlB1CRCWSiATuZPNl6FDFNZHlATz/M19OZV23oC2BwG+LRReFjd03hxRB/g1dZYOOgAG59TyoR5aoNhvg1kMB3ypVXH79QQNxiLSV6Bk1LqIPL2Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ci8rK3VRiEO5u5VqUZEUp+R2RaPHM1B0q9Fb3iCW0I4=;
 b=ZzvTWNky85doXY31wKRkT2mD8PQThUfmwJYewaB4bf/gKZPNvHIldD9Y4RFylbLBpMUxGHiwakjetqK/rVhXYHnPF5trH9MR1LZq9NYVTzx+uW5yLUlfninzOGCxnxkd6T+V415pgzvnoA4rVk4VGiQC86jsKrJs9jaNhZPaN8E=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6991.eurprd04.prod.outlook.com (2603:10a6:803:12d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 03:56:23 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 03:56:23 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v6 01/14] media: uapi: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
Date: Wed, 17 Mar 2021 11:42:36 +0800
Message-Id: <1615952569-4711-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0090.apcprd04.prod.outlook.com
 (2603:1096:202:15::34) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR04CA0090.apcprd04.prod.outlook.com (2603:1096:202:15::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 03:56:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 90779de6-3728-45fa-d29a-08d8e8f8a13c
X-MS-TrafficTypeDiagnostic: VI1PR04MB6991:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6991D2874568B86D7F89E265986A9@VI1PR04MB6991.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:326;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zRXmZ0HK9KWzNko/LtnQMW2/rC0eXY0cspDedSQZcdLBMlHplmeurAWkgPi0WH9f6wFpz9RGibKC3p3kdKnk6NwykEke1CzUpr5NX//2TTi16f81iB9OYPGdmr4EbgdQ1Sy0qhKYVMDLn5Vgxwejpyy5xZF6la2CNBEHW88Cm8Zh2s2uv9vV+CP4shghEZgRiI+a1s+fulfdW7fkMnEPS3k3fZ0b1PIw4A2m7H01twAqmxMYeAYMxpENoKYNSTEY6n0eoPQgDXcsuD8fejPyaMFuu/lAORkPDtIGtj5hembygzkTJvAxzd2/3o5QAusfuHHqTdrQnVkctZRIUzd9wB+YEeUhzuI/TosnBvYLoIvwzk+MOqLmqQ3eA5jIF7D7db890b0TEX17gU/Jv7/pm916Dm5lvZ+EYavu2e+DSHa9os1YvFIvSKLr1gvvyBN8qVhw3sNlyjCerQaEwPJTZRD6uXe5v6sE3RaLwVb0LqrY6a0it9tVcoebJezHkQGnyVwgUf5RMB9DmvRBOfNTFJLt1qU8w1wdlQCP700QIkbKG7BiEZZ0akl2B1sAR7AYpqjHUSUVcYEHiywREXbtusZ3fqwSimlm3jyofR42PRE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(6506007)(36756003)(2616005)(6512007)(86362001)(6486002)(478600001)(69590400012)(52116002)(186003)(66556008)(66946007)(4326008)(66476007)(6666004)(8676002)(956004)(5660300002)(83380400001)(316002)(26005)(2906002)(16526019)(8936002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?I6nQy5wXa2i/zzPwxo2ysrqfV5lTbQhNALvdfnJqjfN7mbmsSvqOam2LvSki?=
 =?us-ascii?Q?0BZaTuEma9G8ZDtnmhWUbhm6AkUebPtJRffvt+cYeBnJEPGQC4dqmMFrh5sz?=
 =?us-ascii?Q?uxWcfPOh3k4YAaCP7qTZ70C/PpG2sH3qcjQsaeDe8efiqIDhl0Nr24ade1QZ?=
 =?us-ascii?Q?kR8Oot7ekFTx60yu5gB/gyG3d6bOQPHSv7VYE7eS5Cr9YHGvPZROBczMemzp?=
 =?us-ascii?Q?S23PYRdjx6y1vWN6a0ScufEAJQ2+fQaNTfuQZr90n/2Alj6vxetJ6m37+PPA?=
 =?us-ascii?Q?Bif9oROGtIilPBtaLvfF2BkbZgxI+Gd66k93hmorIjL5mLYbtHg7cix3M2P4?=
 =?us-ascii?Q?cl0PL3j2mQUqkxWzZlLmdBRTYEgDbUjKRUHRkeywvxShjvBSjkjWWTA8xYDc?=
 =?us-ascii?Q?XdJunCyweRrn1CsodUmrlGSoE52wiKKBf7RGDr+/yMBD9A3X5pfBJjZxswfF?=
 =?us-ascii?Q?fpufY9dC59aYBukNm4yuZGxuATYlgpEkMcctewzPooA7SbYhiNK0YO5RPKDx?=
 =?us-ascii?Q?V8ItfFy4GgIaUYmFibfaaKO8l4Vb3ViGNJdHORQBGwA0mwFRIbTsccAvbq/s?=
 =?us-ascii?Q?oFD1Id/DaN4o4gP5zK2s/PJB7dyp0ijSEfLjtrMy+GkD4jNvEevmcd9xTjjP?=
 =?us-ascii?Q?iIXChjgiYuCJnOxfioCIKp4szUQs6hsACH3qZVRUSmDXYGR3s/169ACX0kUr?=
 =?us-ascii?Q?ohjAC/Fah0vOOoq0d6vwGSEUGqHrAyAgjCml4YtA3VCIz+zk6+/u/n42RAHa?=
 =?us-ascii?Q?+5ZSdWMaKYG6Iryrf0zEfDQeu5LM0ndUrdQgB7nJpWhrjI9fRmsa7E/Bx/nd?=
 =?us-ascii?Q?SL5Ps3HUtU4lYOhqV9vLJQk+YrDOJYi6jvfCxV7GsMR39JWhFhLJo6lN02yP?=
 =?us-ascii?Q?RxGOf6/La4hlIcztF6JxpcoJmdZY7ec9DbvSGDepAxsFGLAL8CxQ+X6gp/oz?=
 =?us-ascii?Q?em3bnLRLzidJ3cUkwdvVGSWzoo3oIzaHIDkrjVM65UkYY6k602IWeiWabyQa?=
 =?us-ascii?Q?snE0J85gMMF6ltbOys5+lPYf0j9X5lr1I8E8/ERsfhc+ufSCIZM0pMyrjfAm?=
 =?us-ascii?Q?KsPtb0fg6I8Yuhev4LgxGiyy93gKJZ4mXg4E8WA4y9AZIC+JhY5/0WG+VVxM?=
 =?us-ascii?Q?5S0VQeevROAZHB5FQ4rxTt/xcG1tLv1YuymjSWDCa7/DPLrHd+vIj1g2YEEw?=
 =?us-ascii?Q?8f4khjCP06WkbmLIRD06PJbqaVHzW8YA0Hgst1w7YRHDJnfLNPWlEnWoDLeY?=
 =?us-ascii?Q?rEKSkM1g+ANiRaI7yIhRXQS4KOSy6JB7ye8GBINxW2bXjWJx2Iirirb1nV0m?=
 =?us-ascii?Q?Wi9OydGniWtyuef8X1hwRIHL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90779de6-3728-45fa-d29a-08d8e8f8a13c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 03:56:22.9765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bmrggAPn9x/qmTNtWGld/tKOITSJpkRPXrp8zMTYlE+pebkvwraS4lIfh3Wkblm4/vDK13G3qveHF3qKeORTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6991
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 s.hauer@pengutronix.de, jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com,
 a.hajda@samsung.com, vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, lee.jones@linaro.org, mchehab@kernel.org,
 shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds RGB666_1X30_CPADLO, RGB888_1X30_CPADLO, RGB666_1X36_CPADLO
and RGB888_1X36_CPADLO bus formats used by i.MX8qm/qxp pixel combiner.
The RGB pixels with padding low per component are transmitted on a 30-bit
input bus(10-bit per component) from a display controller or a 36-bit
output bus(12-bit per component) to a pixel link.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5->v6:
* Add Laurent's R-b tag.

v4->v5:
* Add Robert's R-b tag.

v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* No change.

 include/uapi/linux/media-bus-format.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 0dfc11e..ec3323d 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -34,7 +34,7 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x101e */
+/* RGB - next is	0x1022 */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
@@ -59,9 +59,13 @@
 #define MEDIA_BUS_FMT_RGB888_3X8_DELTA		0x101d
 #define MEDIA_BUS_FMT_RGB888_1X7X4_SPWG		0x1011
 #define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA	0x1012
+#define MEDIA_BUS_FMT_RGB666_1X30_CPADLO	0x101e
+#define MEDIA_BUS_FMT_RGB888_1X30_CPADLO	0x101f
 #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d
 #define MEDIA_BUS_FMT_RGB888_1X32_PADHI		0x100f
 #define MEDIA_BUS_FMT_RGB101010_1X30		0x1018
+#define MEDIA_BUS_FMT_RGB666_1X36_CPADLO	0x1020
+#define MEDIA_BUS_FMT_RGB888_1X36_CPADLO	0x1021
 #define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
 #define MEDIA_BUS_FMT_RGB161616_1X48		0x101a
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
