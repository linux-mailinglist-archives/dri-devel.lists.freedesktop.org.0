Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B36532DDF97
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:32:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1229189A35;
	Fri, 18 Dec 2020 08:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150042.outbound.protection.outlook.com [40.107.15.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0680A6E235
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:08:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxwkW7atjxBGt2c6k3OwNaAIQWpGy24HfLyYrz36IbipdMR5zkgdj06D4Dao+p03EDTsfjBhRwdDCqNDkDm0m93G+IEb8gBwZvZIzZEgcuGyJYR14Rgvg9RowdM5btoCxNHzEnfNvAIjHEzq6Q4Q4aMZpjAoWJTH5U4yX+4Cp2bU6J9Pn8VSVla0Tc1hyrw/v0ZugpCz6qzhilWNrJSJA1DcEh6PSpV+UaV/gydDH1Nyohui3LohAPlFnJig0gDbvnXrR/JOf8b+zdBfE3APeJPfkqAukESV+8umX5ffupDfOTmrnAuafsCyReBHriEDEQnLOGrf3zim3Sr9yk73pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwmTC36H/3TnbjyPrW8YxFLHlUgkodbvGfp5Wf6JY6M=;
 b=A9Q55pxVZ4UUAPpg8tM4rnAwpU4rZCko+kYu8yA1bBj/z7HI8DAhXZnONvAxpfGY/0ahONIq9+/CdzW6N0bLrC7jx3MuNZSBRZN9OWsPEbHt4lml78oc5NNk3qKK+JBfJPtKMI/3TwuCLXCMNAvzdLwypo3e8RiLcYl84t9CNdMQNBuurKOZmJsOM5JmY0sXAXIZ5/RACZ2TqY7nnkuImyjI53p7A56NRlS2TGNZ8GMwg2RM0DErZ1fmO6fijRv/b0BZv8HHGSMHUovC2rQ2d1Grt4yb3mC4yU5pTdbVLeoWYIeI9a6oMPTtG1Bn1OWawvc4s6o8nCATFI8Xb7sf5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwmTC36H/3TnbjyPrW8YxFLHlUgkodbvGfp5Wf6JY6M=;
 b=sfJrtPMoBW9xsP/gDVEzVGD8gZbtXZ5f/FjU5uogsxPYrNZDkrXXGnjf+KyZsOwEGChomNKQ+W4vX0N+eiwNTFQ7/fYWeIyNOqRLqgsM7pzOwi7nzI75JuKn/VRQZP3YHNYNwSXWV6Uf6KLwzJiBoXRNKVWXJQUw2fgH0f2NWoo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 17 Dec
 2020 10:08:32 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3654.024; Thu, 17 Dec 2020
 10:08:32 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH 02/14] media: uapi: Add some RGB bus formats for i.MX8qm/qxp
 pixel combiner
Date: Thu, 17 Dec 2020 17:59:21 +0800
Message-Id: <1608199173-28760-3-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3700.2 via Frontend Transport; Thu, 17 Dec 2020 10:08:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f0803abb-2a49-4a8a-3d15-08d8a273b576
X-MS-TrafficTypeDiagnostic: VE1PR04MB7312:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB731266E7AE29F9C0FCF1185E98C40@VE1PR04MB7312.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:326;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fhcXv8KCGj7KOdkeUcMsvoev5tgrKYjZogBiJVGCchFbf49+X9uz6tgA3KsjMefVBFF+0aSohFb3Xdtxs0K9S+p6uUxa6aHBYFLSQgmRLZBrqNLSLVmevxF/BFtYAzsT4g6f6wa10NGBL7v/S6kLIBwYuqwVppdgy1bQA412mW6keSF1eNapkCs7vtD7TYNiBzhCrMt6V8E1SQq8JbCJR123jhQDzEJuMuct2eZgxsRqQBZMwskWsZNnsOLiHGK0AaQLJIYC/WY7gQN0Em/gMMTURpMuj2oCFJ4ati8D7hq7Qu/geGHodMBBzR1+IjZjJcZSzvb2rF+f412xbGo7tnr/KBuqkT3XfvGUzza+esgcF5Ub6U7xZBkr5bqp/r/Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(6666004)(316002)(86362001)(6486002)(2906002)(8676002)(6506007)(4326008)(52116002)(26005)(16526019)(8936002)(7416002)(478600001)(2616005)(186003)(956004)(83380400001)(66946007)(5660300002)(6512007)(69590400008)(66476007)(36756003)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ouWeSV1rIHeN0j7jgu6sSKfT9ImaDUsJLQ3I38V4b4uLPXGk7r5umdfkuP5I?=
 =?us-ascii?Q?oYqvw2jhLd43J3yY2KEpxUH/daCSQooFPKL+Pm+KIYa5ns2CCXxQpm17cbBY?=
 =?us-ascii?Q?GAocM25pvISuayum8/UbR/cnMLG0DIJkmq99GIe/bqau2JpvqqQIyoHt+SZK?=
 =?us-ascii?Q?0sZzyiJuLTlI9gTYopS4M3JjI2hI0G1i2gTgVlzAzXJNsQTggK7IYjXgkxqv?=
 =?us-ascii?Q?n2no1yZrs6Q7BoD1Wy30m4NEAFgQDOfJHMFTq1gxF+oiezrXdm9PKZ2r+WPg?=
 =?us-ascii?Q?Vsz9/XEOFLOHTpnQtb1Rza8qQ8x9LEPenn5BGaWcbGKIYbsuvyucHlfhOxCX?=
 =?us-ascii?Q?1KpZf6FExpAcXUhrXnFERN8Q7nbDGMfxiKDQ4Kh9MoKIv61FMfvf2UPlTUGs?=
 =?us-ascii?Q?crHMYooi5CEkQwuNgtDZu6oqYCNuMZxlz8i/0KcMQ8eIZ0euhZz1W0PRH7xp?=
 =?us-ascii?Q?7KEE7ZiHEXCIxgc1PBorktZxk8tEUevP1xIBFipJiLYDMa8iAH1BiEKhP5WA?=
 =?us-ascii?Q?9hSYqgGOxuP23ZBmwXAFdIDuixjVxrpW8fCSTyqciU+ZoP1/f8kHY/pQCxem?=
 =?us-ascii?Q?5h23v6F5579g1BbFQDZQjQpmczS8i3sGZIR5HIQCGgSvkLwVfr/6rda4rLHs?=
 =?us-ascii?Q?M0Qw8kYSJ27Q0i3gVqwT8LMg90gSOBMD/YZaGCKfmk5rQ4nR0NnV5NVS1ZYY?=
 =?us-ascii?Q?6E30HJrpsQS3FbAdBzFnh6QFhM7+lNUhLMGgIT0saX0OJ01fZ7J7Qe+e2L4n?=
 =?us-ascii?Q?C2zHZuzInBSTFGqaij2fiIIgyoQX/E3utbGPL82C9YqGEGN9/L7WDHVvOHFE?=
 =?us-ascii?Q?JFgQXYkSUpE+VFPvD0LWbLCXYvN5CG4gSQXbA9c0qjgYsu25LbfnnDcBN8qr?=
 =?us-ascii?Q?TUitBeKVObnCmeGca5ziKWpLSzepw06VaN8xOF5vkUjDJxQgtW3qwBB3+bVh?=
 =?us-ascii?Q?j263OtRkrVFvahgqMp4lrJIp6u9snfBsXz2Wyfq/rcgekEgLc0ORALMbguyU?=
 =?us-ascii?Q?VoYs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 10:08:32.0899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: f0803abb-2a49-4a8a-3d15-08d8a273b576
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QYm1UGEynIw43mef+Q1N37UsKx5UFsxCec5rllCLE8vq8+DiU9NzCPNTMFrk4WEob4EMV0ToWQlYqt49EmtGjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
 include/uapi/linux/media-bus-format.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 5d905ad..b218282 100644
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
