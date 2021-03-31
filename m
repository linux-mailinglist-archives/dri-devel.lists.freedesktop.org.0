Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A6C34F901
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 08:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BC06E9E0;
	Wed, 31 Mar 2021 06:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2076.outbound.protection.outlook.com [40.107.21.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9618B6E9E0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 06:48:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRvPtnHqI8mxbbtYFz8yR0b9x+A5auRa0NSGNfOavdsxemIlX0s01K3Yjg7XkRAOObygyel1ebsUPwR8aBpBZ2oHee6xRMfur4OjGVQJpSKtLQR0f86dLYf5Wpk3l1Eyte5UMbDX590CAk/1qSJeWkFt2Dr4GL9Iw2bayAYRU/MrdKgr5REt2TXcxiG4kxHjK1bFGU7XYisnXDhPlsq9gWowwu63n/sf6JslhA/zcs3cNPPieGuCENFcKkoDaPLKshPsp+5eACa+mekaSSHyzfFFEz8DEReXmqbJA5cF5bm1OElcH6uPKlqJ1fdnmnp9Pq3zcAVt3QQA2mEktG1Trw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bGkJWV6xCvtperfmZT8t5blnzN8BHYwX4xkycRkLkI=;
 b=Y2N1NO2Y9l7BybSz07b2Phw2ZRYGQQKcZbu6RPL4A9v0igoynKFJv3Ca1rqfq+lb1f6LygoSUVZ0oDAo3DfCkK+xQ7+Npzh+540w8eOiyd0bbqd2+uJxLYEW9aWjU2YLeEuh1KDSWaf60999t1E1LAGbfBQ4V7g0/f9LTufso+Wuns5DanCiuDIX7rgXKXjAk1Ig0/zQB+pQUkY3kOWVhfXBqBeV9s6xvm7Mkogm17+nn8ZDXsYgxdPxPubBVCwknyZo+k1IFfdXPVxODzzZhWUyfUsuR2iQDk6Cjxr83mm5DQwsUOjDu/ICJptif/J5ipqPFK4QpQj0mt1UXsa8JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bGkJWV6xCvtperfmZT8t5blnzN8BHYwX4xkycRkLkI=;
 b=m5rU1aLZSmG5+2l4HNe5T/dmxnkAW9jjVwJ6a3rKuthnLk+QFGWos4T/NPaaKHgPyd+REO/Ly+0NL8cB5im6+Sv5aaNONUKungNxQ8hbQfo/70WVdNYobJ5jF7lKG16jT4yg8CgfPAgkWB9SatCclHxm+dyRuiuWaJ6F2LIT57M=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB6349.eurprd04.prod.outlook.com (2603:10a6:803:126::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Wed, 31 Mar
 2021 06:48:32 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 06:48:32 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v7 01/14] media: uapi: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
Date: Wed, 31 Mar 2021 14:33:12 +0800
Message-Id: <1617172405-12962-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
References: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::21) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3977.26 via Frontend Transport; Wed, 31 Mar 2021 06:48:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 59c737ec-5e82-4f28-e418-08d8f410ff99
X-MS-TrafficTypeDiagnostic: VE1PR04MB6349:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6349C13DEFA295D29505D734987C9@VE1PR04MB6349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:326;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kqPNZNiJRcxudBYVbh0cdoyqzJfSILgEQuuy7Srheww1zb/tYKFnZHOP+eZVEQBFkUII8ifRXcRIRruhjTtD401uRiU38nHD1AFJ+1n3lLknweW6kk6K5P8rJkg83YQ4as3KHg2eSY/yQmhi3Ewx2Asbzmf92w1g4D+p3/Wudus/+PUBm/zBSElgdtGbD6WpNmnY+ejW8HisORh25CKtqHlKvOAa8DXz387eGpclYTsb0Jk68YpZWpYREH49i+d7koOO/V9uqlKfoJkrjxFWV1XAzngW7+UPmzifvQPb4EudHnA+lE/NTCs4QC5nIgkCG+mtSMoed/SOchuLKtUdKuDuTlTZ92qrZBTMQEynYJ2hFEGStAEDYy41x+f4p2MFG9PxrqKtHoxklX/eiqiKe+CMpmzMrfeCp5zAPAOcvRbXZyK6yUEPEWTDyZ9UZb/oX0fdwuu1nMZ8ue3B10y1mPisk9kX475YhcRZmtLqZ8LppuhEMuNkgSxgDWnF8w0aIgmtDt4sfdRWnjv0couuxLbyoysRm1EfhUDjnvuMUxdtOWyYZ1gWuwYP93EX5+ckkpa9YnsttPJ0KdOKFcPIOJV31cdhsXDIvB/sddVymdEBjjOkeiic0MA5CwHE9kaNJ4fmH/IargMkr7vMETpKmKrSoRXWYG7+yiGqn8ax4jMgk2lXx2Wt8HTw4Nju4yfA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16526019)(7416002)(52116002)(86362001)(6512007)(8676002)(6506007)(69590400012)(186003)(66556008)(5660300002)(26005)(498600001)(66476007)(38100700001)(4326008)(2616005)(956004)(83380400001)(36756003)(2906002)(6666004)(8936002)(6486002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qL8/EwbUBej0CFws6YyDDkaG/g+YmBwCBILJ6voZraV0zY/e0kGP9BtKNnpl?=
 =?us-ascii?Q?yH3X5mfg2VfYL5SYat5kYtumypNiGQOQFKTGnlh5DEZiHz0k1I0B5ytplt5f?=
 =?us-ascii?Q?PUjRYh0a9KJ1sQTgKEgJuKTLLz3AbJUrshbIPI7jud+GS4Ddn5t576Kiz92L?=
 =?us-ascii?Q?Pp3KGIUMNMr1KksTaJs9ty+OohkywizwGnpECNLSlBZPzdQWEFjG4ghmuVmj?=
 =?us-ascii?Q?lNeipKyWuLhhjtLpkQlg3LlLAsjrFnNVKDm/vlASvwZps+/vX+O0TMZCTToo?=
 =?us-ascii?Q?jhJxFfYNW8Lkl4U4nP+GMiZbzluJe5i/kOc5mHfpervAV/nfU96ek7wt06UW?=
 =?us-ascii?Q?Zi4MA+wdhr336e6VYUaMo7NZihyzlXJYZ4WicYfdpDkar9pwhIZKoTV+PTOY?=
 =?us-ascii?Q?QC4IP8J+ooXjw1/HR4u8l1ZkgSla4PAS7/B/kp5yprmdP/1sMMD0HN6QSoVS?=
 =?us-ascii?Q?XIV0TLIn3FUiIstr963vCJsbd74929xgZf2WO3CsyZ8XPWS8UH7uh8Vf1Be8?=
 =?us-ascii?Q?ysWRulsYmWnV/R9j6LW/2doNQX717UCp1PaaSeUK5qR8K3zgkTYd9EWXDr/v?=
 =?us-ascii?Q?a39/cn1oSByiwAixYocmXUmKQKUI+jlVDEYb475fCYsARrSaY/Z3Ojnn4jp0?=
 =?us-ascii?Q?zBzEccfcV+F3EA4PLVZIcbESktsAai5/OwP4mhRHhTcxjx7Y9hnaPvhaw9nO?=
 =?us-ascii?Q?vAEy9OMZHVlzHPOsCcKxFwdhzy/JDXYM1wWNc9iXpnEQ1biO4nadUrSyxE8k?=
 =?us-ascii?Q?StN5rLEWgEDNLgns5CiOyBBTVVdaQpM8TwGbcy9mr3lJehgXNGHFwIrCwF4T?=
 =?us-ascii?Q?OAqWSEvovU55ko8cNMIu0D1y4Ytjhno5eokg6r5+ASkfmG8bm2NaE6UHDjPx?=
 =?us-ascii?Q?8mAKJHa5Pm8ORSfA/fxqzQKrPV5JAOOjrCuaLdIa2UShcWWYmXXn55O/7m3G?=
 =?us-ascii?Q?f2nhSDNmzZr0ZsnJKb+NR+tDMmAvG/KJXIGJ3jDq79CYZ3nT+IFlxCUaxWw3?=
 =?us-ascii?Q?pYk/nTZJCTUHsmy/sUJeIxCj9fCIHkXTe9a2Rbi7YNgBGygQiPBwXeAaPM/R?=
 =?us-ascii?Q?6ux1FvYh3qF8NI00A40p9xaUIcdnH/wEdmIEhGvem9BOBmx2fTnWzVvi33Yi?=
 =?us-ascii?Q?7eyq8iofJRPrBj1f9i0Dj/GKFzJp7H0v0+ejCYGEcAd+QKNAJXcepmOa8fOL?=
 =?us-ascii?Q?zS79L8Um1i5x95c9maqHu+BGpKIwkH5tOuczD8mYtZqkb0s3z0hg/p5KMhs0?=
 =?us-ascii?Q?oOGeDWNEyCmKT6GdhhwFBayXoaRlkkgZMZWIRmRtrclVicN258Z1qyyC6b1n?=
 =?us-ascii?Q?uBJlRcaEArR6u8o3gRCxAT6U?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c737ec-5e82-4f28-e418-08d8f410ff99
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 06:48:32.0413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvctNh4D1bXdaNRyhVkGSQ3kc+syil9v2OEERORhqVhPeuTF/fgSmCq/yc+ljiqCIvi0K2oaOjzhF6fBDP5xLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6349
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
Cc: jernej.skrabec@siol.net, marcel.ziswiler@toradex.com,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 Laurent.pinchart@ideasonboard.com
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
v6->v7:
* No change.

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
