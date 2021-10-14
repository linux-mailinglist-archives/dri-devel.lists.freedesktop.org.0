Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CF242D33E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 09:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B622E6EC1D;
	Thu, 14 Oct 2021 07:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320134.outbound.protection.outlook.com [40.107.132.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E781C6EC1D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 07:06:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E71tXMSPUCATpk2AvXsD9d+w4nrBVJOJbsFavED19krVoa8qNSA2cjeSbe44x67Sv4DH7hlvQJkTMj5zZaq/dwk1kYfOpD8u7iViwLEdYvdNShickXi5qqpp3TdgodsS2FyiwCQj19UYfJDg5cfek+CIu+xSG1Sh+u3Q+9UFL+Mb3TJbxNzbglZMBa8z56yizYEATPA0F+RuboTSLxmSrHRM6gNzwetPioLaQOea4tHxS7NxHJzrc+qdRiweB06/eJGctKtLmWqNfn+TyzmYQzCdnlKCwWoFoR6+o3IQK9Xrvrx9CRBM/mlcdkpb5WttOJnEt6oTI6MQ9Si4geUAlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9JHsvqTmOU445Gn6TPAU6BXgBaEnhU4Jl5RC9wrwM8=;
 b=MmLyWItjvpkJ6bZvEXeswIQxafwCmm0vExnEZ9Od64/5ALGB/tg2C3GTXbeOp+Yo5hBbnOFXFj1GwxYm2GjNahcDbbDccdZjk3oo/c3Fz4/QXxj1V0IjYjTRtq2Ejd05IqliMu5S8UN/YgmmNvg1tLdHbTsh89TNK91qN7n2tnn0qE55RaRisS0gIA1VDhgDgHXAEW4r8cmntYgF5uev7JKboaDwsgCohRLoR8WfUQ6tTmssdVwDt8QAR+FRgbhthh2rArGM51P7mY7WITd2N8LSGnztPNT3XBVog5+5J/pGSu9Pf0QKehZ2hhn92ZBalcMdEsmqoiNzCf3NJXG8mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9JHsvqTmOU445Gn6TPAU6BXgBaEnhU4Jl5RC9wrwM8=;
 b=omk5xd7QEmV8dS8KzfEZkXE3ReMyHeyFnGzkuwM4HwRbyAWwBqpBdFiYGsz9rYK40v8bR3TPE4MpYIPQAgR4ATFaV5Si3RrBEpKHlT/NFxOjlg9DaKzdGpkcKGPdvcjLH1O1H7jvDV8IERsCh40SANSM1TiwB01zYA8HhvbB9Oc=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 SG2PR06MB3191.apcprd06.prod.outlook.com (2603:1096:4:6b::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25; Thu, 14 Oct 2021 07:06:42 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0%6]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 07:06:42 +0000
From: Wan Jiabing <wanjiabing@vivo.com>
To: Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: kael_w@yeah.net,
	Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] drm/mcde: dsi: Add of_node_put() before return
Date: Thu, 14 Oct 2021 03:00:36 -0400
Message-Id: <20211014070036.13491-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0192.apcprd02.prod.outlook.com
 (2603:1096:201:21::28) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
Received: from localhost.localdomain (218.213.202.190) by
 HK2PR02CA0192.apcprd02.prod.outlook.com (2603:1096:201:21::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 07:06:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40b44b52-a102-4a09-57ba-08d98ee12cf7
X-MS-TrafficTypeDiagnostic: SG2PR06MB3191:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SG2PR06MB3191E4BD9D2C552418E1D452ABB89@SG2PR06MB3191.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8zllkOosT7ouI/um2GypItU6SYjpPDHIC/LDl6V+bvy9Am5W7WOM5S5ROq20K3vJgk7CXm7sNq3sqQhnYVxDL6MJNF2ca6Eom9blvTNhayboyTIkMYPiDK6ccHW4BkC2fECNRbzAsRrZlFDhAl214j06LG5hY8H3SxtauFkKg3YEW0yaleYh/0HpQL/y0PttioPMBQ2A8CSjLHEn7fE9OlMKabCTk0eA6vdo6IiKA+7wysWuWZdau52+fI4I+M0B3MvnTk8fGu0ezMItRmhEsMwjRjyZ5ADqle9Wjdunp9upvxouN4Q+15JCNctBJ8uNL0nrjgLlGGClcDL+bobnCn9OyrqeAMVpNZ3wFKeyDzQC7ExUoiwK1s/HNr6XHfAMpN8jsRAe9sNdkYnN9jeQWkwg3gczuLNu17y+R1UX6TOzojjd/q7jEGaGcdHHW+XuR7Mw1p4CyncXNM5n9kmw4Dv5JTeXaLrux5P8OlgfkEJB7GfSbD1ybWM9t/DN3DWNIQBNs2M1gz04c+DdhStOswvPX7bStHFU2lFxyMfq1G7WttJg48Z0hv3QOG8qEq3HU1JFa8SsF1c9mwf8tPe0dtL6pszxzy72nMBq2Go+AhGYo5aHa8Pkz1mQByC5mZOaX2W7UcBMoMdkzNYVmRspfO4wY4mNRD7pKFWv+qaSi1HH3V3ae0Yl8HQIt6+tQpRxHRnNlzEmPJIow79hl/fE7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(52116002)(66476007)(66556008)(6666004)(956004)(38100700002)(38350700002)(26005)(2616005)(36756003)(508600001)(5660300002)(83380400001)(8676002)(2906002)(1076003)(86362001)(110136005)(4326008)(316002)(186003)(8936002)(6512007)(6486002)(4744005)(66946007)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?08hiKHfGwLKVLpG65+oYAilI/zknIn4Z9NMFK8UdAPHbwU5S3LSVCDC/Sq+R?=
 =?us-ascii?Q?eWZGtJXzCvEiYrXLPCNvGw4t0tBbNuQO4wkMYzBTxYTA76S03Uh9vwndnkqX?=
 =?us-ascii?Q?+h77BWSvue2mgg9wg+iptplSESu6Kzx5/G2gsMVob05qUqIUDPdV9Di6LR3c?=
 =?us-ascii?Q?3jNOLS3jXcyi0bnONgt7OR6TesWtdHXaP46QRCRb078O4NdTnDk0CGEpgfjL?=
 =?us-ascii?Q?XEVXm4PqtNT/KEdURsaxBXcZU0Huh4KPyUMLop2mZ7R+SJPQcHiQJe8t0YTN?=
 =?us-ascii?Q?BRnhAYQElfmqT4Y8xDb2Hat4yMpu8gy27/3u0giGNk6g6ZXJwS8K491XhGJ3?=
 =?us-ascii?Q?vf471x8vz3+h+uuS17/vYVYlBu0Ggyf9It69W3Z50PpmejxATdCzoJDWZ2qQ?=
 =?us-ascii?Q?dq8IUw7umvaIUN9R6ltSNJAkp3a1y3+MYnJZKkmOLu5Jz1hjMj8THW8Jc8uv?=
 =?us-ascii?Q?wWNJrkvczSsWQ/0eunyipPXWOBLxG6m+vZ0mHDH7LK+sLbFH8Yz0h34GlYDD?=
 =?us-ascii?Q?/l2HlujkcTRWlGKT7Y8Zw7ErUfPmOj8PPMET1WhzaoLWDAXbofpXQWJVt4DT?=
 =?us-ascii?Q?Sfw1b5lOYHq1rPrd+kmH7UqzbkcJjppWl8BL0+dQbiLYHCBmQNwMW1qggV4J?=
 =?us-ascii?Q?/sScdWaGsKV+u9U0jEnB2bN3M+Ptuo3ZbKwJDzy2qguCBsGgitO9kTgJkcni?=
 =?us-ascii?Q?w46Kkvr33JXtmGGuA0RRmAiY2qKuw6FkCAVuJ2QQPkpJpTBxsNnV7aLhfZFy?=
 =?us-ascii?Q?AxCW0ZjWlUljVTHMrtU3sRRd4g+5vg8cS+5jKJmtNThvfb21xagVrtz6SS0G?=
 =?us-ascii?Q?btXPbQKjKJYcFE8OdvhCzWw41OnpLoQvu81p2qFxJWN9dO2KF6xEyjTXzQ/E?=
 =?us-ascii?Q?t3Og9Fj8euAhz5aE/43G3W65wdNFRjGZIMM7SoqSWgMqhty/VP5hq3GfX5+C?=
 =?us-ascii?Q?zy8RO5Spg2qFz06Pz5h+NXzUW8cTSuH3rlAFSTf9hRB/u09pAhwsQ4he2/ok?=
 =?us-ascii?Q?ZtTTMEN84+ijjEBAhiZPvyIUW/P7UjXR+NNUdxxcAunOsNDYkar40Umqh8Dg?=
 =?us-ascii?Q?G5CRHgw13q73f0LqwEtkZbMnzEBb7fbGavSplrjQvZDdDdka+/9quDi5seqg?=
 =?us-ascii?Q?aO0VVzcdol+5Qg8ay/QtA4atnsm0SGQXMQrhDVHGkFTDZnI4oA9XDHm0YEJf?=
 =?us-ascii?Q?DnL+sIUcD8iKl8citv+xJ+WbWLaXRk/QroZVf0+mg0AILqRKyq/XLo66xE9o?=
 =?us-ascii?Q?JAJ7/OKK4r7WfWQxOfv03plWEoqRjlUiVFyMhjuYjQoy1lA200TitKkwOclb?=
 =?us-ascii?Q?Je3EW4slapWXhrqtsWZuYaEf?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b44b52-a102-4a09-57ba-08d98ee12cf7
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 07:06:42.5287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1z3oJ44O9F/5bfw28nd13dxGqg0KkbPkx/sTP2a1yLJ5jIsqQXkDFKJgAztBoN/6n4Y58mpADBz/sjtW8ZY3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB3191
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

Fix following coccicheck warning:

./drivers/gpu/drm/mcde/mcde_dsi.c:1104:1-33: WARNING: Function
for_each_available_child_of_node should have of_node_put() before return

Early exits from for_each_available_child_of_node should decrement the
node reference counter.
 
Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/gpu/drm/mcde/mcde_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 5651734ce977..9f9ac8699310 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1111,6 +1111,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 			bridge = of_drm_find_bridge(child);
 			if (!bridge) {
 				dev_err(dev, "failed to find bridge\n");
+				of_node_put(child);
 				return -EINVAL;
 			}
 		}
-- 
2.20.1

