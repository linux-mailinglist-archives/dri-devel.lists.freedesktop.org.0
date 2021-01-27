Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7277A3070F8
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA2F6E91B;
	Thu, 28 Jan 2021 08:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60056.outbound.protection.outlook.com [40.107.6.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E826E5B4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 09:02:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AwXR8OQg9xJ8okqTqJHX67bZwUxGWXgp2koDihmQJP3eKOuGhl4gzbhjRXNyBUnMZ4qZDrD1o6QZw4vSubE7ap60A+1lWppknONkD/yaQYi9o2c6dIIGtf+nO23/hMlQvLHUx1fkIjUunLe9nqir52xv+qQ7zd4O2CShAjzB1exvhFvAJMxOU+k7Zjktr6WyLqkDqWBmZ1/Lazl501GlAbHgJTQjESNRiPffnvmfNtz7rzlbtsdlboqj9ItoQJWT3phqBzjRaY5i1bF6jkgLJCOeXS6ivtFwXu2AUqXiH9nDBlzbSr0pHEcQFx9E9OAMGAUVH40Ymxi2ig4tMFz4OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwFOMuVKshgQDKiBAsFggICil7yw7RtDrxCYg25axfw=;
 b=etPbWKPCrNvJ30MW3FecbKSqnX5dI4lkA2utk2+D7Srtsef/1IEds3+1tIfN1neSXJe1vTzB3So+6eyVLj5nXxsjE7NFDCaDggM1ZcXq5WDFDLspKb8xaRZPrCZdNsfrR1eBJbc49W0mBroQHqwxKhcDTg72v6iXhr2yj8GQI25EQ/yLmJ1ElxQ4ym7mswfpUXz0MXin0Ou9d1Maq6KynhoOxSnUwmH1C46HfnCUZT3Ex9vu6COqOUuXGBEizUp5dOJR6yzmEclvsVT4Koi0W4dqtQF+6CEF8IMfqEmTzO8hDc/KWIJrBkzt1AWw1b6jviJdjs+ghZHCdy0vYbZEJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwFOMuVKshgQDKiBAsFggICil7yw7RtDrxCYg25axfw=;
 b=B4Lar6J1am+ndUCYXCyNOiD6PmvhXSPEV+Dks612hBxJe8AtzZVFeupaxRbGFAAeLCZw1C3nwdt6Kwwly/ey9DuO7ZLx794q+pj6GEesTHwyOQWgWgKMKrzobSfOpV/5gBz3HnZkopU7oqL7EaQlFWp6xEXIdPV9yv2RQV0SZlg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB6559.eurprd04.prod.outlook.com (2603:10a6:803:126::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 09:02:30 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3805.016; Wed, 27 Jan 2021
 09:02:30 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v3 02/14] media: uapi: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
Date: Wed, 27 Jan 2021 16:51:16 +0800
Message-Id: <1611737488-2791-3-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
References: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0049.apcprd02.prod.outlook.com (2603:1096:4:54::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 09:02:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c733c30e-3333-4259-888f-08d8c2a2468b
X-MS-TrafficTypeDiagnostic: VE1PR04MB6559:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB65591649AA54F62CB222366098BB0@VE1PR04MB6559.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:326;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JUA09FL1/U2a+ji0lx0mh1tePnqpn5twtcOkftomRNLVf+s+D3aFAS29Nny6qPJufaxNWaWlWoBulM1iL1RkbAKWwPpN5GIL8MMRGvk96aR3b4uBKCxjAGbbEiq8ILyOLcmrwvST1JcCaHN9f0lktUqoFXLCSJzglfLT9ure7S6tK1OkmSylPvRvQspLRM9c+YK+YR9bQ2NtLbNz/YDyclnszTQik9EobwRUfey+mOitvUODAHJNUlwqwll2OJwrqLET5lnOWiiF9sW7Gcxv5/KFYD9aVi05FlEbk8dP8PgJoWl1GCec1r9TDOYpnj+42Pydv6yyZl6+w6DaPB/dEfde9PmuMZFQfUnadsWArb3EAVkYg6FlnpFopkxozYJssG67ZCfFrucL0iDlnq5DI+y9pIpVBjtQ/pa23BYLbohyU5L7AjHS1Lwf0jVoTkxxUgYpd4BI30F2itxxIMZ8QMLBFXJZiTU+AKhkzxfFzxZelXhmYkQHaGxtUfNhrtP7tjJ69pbh9dvrexBg1oRWfthakz9b2uGKVK7NxL4Zyuu/0bizvrJVK1OjY5tRdRiOX9NCjybaTiJwM7KVFiOymQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(86362001)(83380400001)(6512007)(478600001)(6486002)(316002)(5660300002)(7416002)(8676002)(8936002)(2906002)(26005)(69590400011)(4326008)(6666004)(52116002)(66946007)(6506007)(66476007)(66556008)(186003)(2616005)(956004)(16526019)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rIM1F9brxpa/LCh2+whEBVsKw+sez+qozxGUHpZ89kD2z4TC5mJyEJh6MbkK?=
 =?us-ascii?Q?gEal92Uj5ihmsuOVny64+l7GupzwM9FATw7BB8dau7pRnExR5JzMqvwSiB1X?=
 =?us-ascii?Q?mp4PN8iH7cBc/P+90sT2g/yfRqAywpCF5udDwOK9cjHzaHGcRbU9sEeKONIo?=
 =?us-ascii?Q?pn5MQAit2wZ730LgURw08KSJT1cUyDMDQueZK8TI3CTnsqpf4bnaD29lDhEl?=
 =?us-ascii?Q?o4Kn0mBPUlgtNgPemGfXcvS/mFOk6ULaElk4szoWgPJQX3EEWWJQbRhsuS8l?=
 =?us-ascii?Q?eD0LR7ZXXeDi9hTAnkpL/SEcPpKlIOuL+iTYFyLawZ42Sd6Vn3vDzAJChW4D?=
 =?us-ascii?Q?7UX+B5DFW4utEMw3Xr69US4/0OFh5dmWOMhu0QVVZKm7yf++0ymw9E68N3XU?=
 =?us-ascii?Q?HL0EIvEePAmCpztEtV1GWnw3yGRmhgF0Moyc3LVxmZnrybKmgoLmEOL4GN9o?=
 =?us-ascii?Q?hZi5e/1aYsqfNtzZjKALNj8Egq5TA6c34W9t0Wvs6Ag2xqxsqU7oJaworVn5?=
 =?us-ascii?Q?yNnBwi5Kj9LfbQm4kg7pZ68LvNEPv89Er3fXd0GZaBWy8TASkZdnDE8elhZd?=
 =?us-ascii?Q?J5rVT4jLQEwImLgXKMWg3Fc78qbAMT70h4b8r4JkvPOWkY12PmGWnxglRuQy?=
 =?us-ascii?Q?wL6BY9CG248CjmMtqpmkk4E4tNpugdU1lBTMIErK9rYG7EjUsSJZZOf6iRoM?=
 =?us-ascii?Q?ImXAwdbSTm5RTPczEjzxfpA//Q/lQnX7b7a/unKGczR9GW5dqCdeW62s+dz5?=
 =?us-ascii?Q?n8XzocW2scYlFXqO7BaYohCVRDNkLOGM3fGYX9FzbpoNK4iBmmZqLNdhnzoM?=
 =?us-ascii?Q?G93HZ9rgD65gpIqZqk4SyvogIU27nhNDFWttNqcUY1+MpGAuYcBDj7ZgH1BY?=
 =?us-ascii?Q?r5muaxsLxMf/yu5Qc+24TFOLw4V9NzWIGVvArDozgGBQKqtY6Y2Hj2Zi0EWU?=
 =?us-ascii?Q?blEM8sN2M6e5OE8j2K8tOsPcW8WPX+P2GSza0lIIgJel0b2tQlEgVajXR/NT?=
 =?us-ascii?Q?ySF6bo0rIa4M5SGx6cCGm1PFmKcgdFDgezuj6glvTz8BF1x/Ycznn/YdibNq?=
 =?us-ascii?Q?N2/4EfG0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c733c30e-3333-4259-888f-08d8c2a2468b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:02:29.9403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adfg38S0lwYDvv78PnfOhTKVI/JXdhHkQTz35rxuj9ZZ+CTz8EguHoz/+wO0+M0Z8/+X98ny0KQHTmyZjCta0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6559
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
 s.hauer@pengutronix.de, jonas@kwiboo.se, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 mchehab@kernel.org, shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds RGB666_1X30_CPADLO, RGB888_1X30_CPADLO, RGB666_1X36_CPADLO
and RGB888_1X36_CPADLO bus formats used by i.MX8qm/qxp pixel combiner.
The RGB pixels with padding low per component are transmitted on a 30-bit
input bus(10-bit per component) from a display controller or a 36-bit
output bus(12-bit per component) to a pixel link.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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
