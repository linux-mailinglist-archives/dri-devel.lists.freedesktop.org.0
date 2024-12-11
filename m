Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3189ED2B3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 17:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9965C10EBB4;
	Wed, 11 Dec 2024 16:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Qj4CMfTS";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Qj4CMfTS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2070.outbound.protection.outlook.com [40.107.22.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDE210EBB7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 16:51:16 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gpBcc6dhdCiTxssKW7q441TqgabkzCULzBLGQf6iiwxtNOL8U1qv/XjLVo9AYMCtNiWkNHMZUWSWD3DTG9OeE+4JBo9aep/FXKyxF7NVJzICyF4DFINaHOgOY2Zl8nloMlkpVgxYWTENBB7yxMZjAEF7EMlJOzL18VPZvJuMhfPAXq2vSTQ2zjErlkxnf2wwW+ppQ7zNCkGqzyXVgNkBEvaFRNKa3CMBcFEHswtOEmR4qATJzsRlM6WWdQnCDnMPrf7EqD1wMGe9T7wBdjLcgdIiZ2oR7Yp4n3aTGC/Y+kKHsrfsvYYphzIbXzjbF18nZ4z009mTlUaaBGt2IhQZUA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPFjvHzurYcGRDPl+eZz5UpIXNhjbNaySmNYBE0/D/4=;
 b=RMhNqR4G5L+fzI5KKwBSKxiCCM6y4kCgkQFOks4MUxQj8lLK3N7339RIpVnsIwBufiVa0YRrHZeuIvh5yi/zY4qsRGzu2C5r/8T2ygNQqB9ZdK9kfi8p1BZlvdrWL2GRXQeKhPL1tuj5q502zdkHftx8tgNtoN6M1E6YmnIlXD1GK7OO9/8QhtRbQt7juA5ENEnQYEsAdAJobBbJZ6aE6FIpt6LKX0jUbfk0I5FGy2NKERB8YDV2iIgCrXg1fizf1RYIMWjE8hUinMBmQxYbbsQV6FZCJhZv4kfR7usbbz7AeZX9uGgEVsedKSmKUnxbxeWtHH8THD/27Ap/Yd5gkA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPFjvHzurYcGRDPl+eZz5UpIXNhjbNaySmNYBE0/D/4=;
 b=Qj4CMfTS+CWqpeVVkek4FwE7VYzXG1cNs8RSPHrQptRmLRDZrK0bAsMUGX5a7yAyeu3EZtaJWo87WrRx9kxb+rRR2egk07UKPyNFZSvIl0ud6D8aW7b07didUuInF3mYiZjq+zn52hiiMM4RpDMSQd8qKhCOh0RTN49Ivhkr+FU=
Received: from PR0P264CA0108.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::24)
 by DU0PR08MB9026.eurprd08.prod.outlook.com (2603:10a6:10:47a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 16:51:06 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:100:19:cafe::86) by PR0P264CA0108.outlook.office365.com
 (2603:10a6:100:19::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via Frontend Transport; Wed,
 11 Dec 2024 16:51:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 11 Dec 2024 16:51:05 +0000
Received: ("Tessian outbound 20d64b55c711:v524");
 Wed, 11 Dec 2024 16:51:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d5046944b1377f70
X-TessianGatewayMetadata: lKDehNbMszKsgNrnshmMjwjqk/rb/dPNqPQwW1p/B414W0QqvtU8IAgqrZZ1mpQdjicC3M/53+/KRHu5if/qhnQkLZnBQNfa21aDzJom7vOU97jTHsXunXR+2kvI9Y2tmXNGp/k4feLqjsiKNg2+riZvRRW2i1wU16sGO7h0jKk=
X-CR-MTA-TID: 64aa7808
Received: from L0461535056b5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0E5C8FBF-BB58-4C81-8256-20ADBF4A650D.1; 
 Wed, 11 Dec 2024 16:50:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L0461535056b5.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 11 Dec 2024 16:50:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrP90VwBL4RMsJH2Tcsvxxv/PJdGMkVHiNSdcpOJFkOiBXoeCQvJhAfUYfPBpkFa6ueQFHI7OFcBIGeq/BYXE1xhkyGINMZ5hZxbgdUCuG/YaRu2Lrv8uwWowkz/QJZfouxA0tK0P8YTUtcDwjkBa98X5yQkwvtM62TT4FsSQwV5wxfQiTWsWyf72gCQGOFkN6gBIb6vf7geyyu0QePBUUo8WQwWyWUG7NVQPu6J2cms1Om/X8aH57AektMtIZwrYMSjVF3gk8PTCRqO87/LgcfgJVFS50vdDc7LB/fglB+DVGWPAmOdOUdylJdqtsFo7BetCj+tY+JZnSATzfqW+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPFjvHzurYcGRDPl+eZz5UpIXNhjbNaySmNYBE0/D/4=;
 b=guCIir2yg1Hp/FB6Sr7V2OE8fM9RHrQtz9L+Lo4ZlLHjHojWVLgkldWKLdKW6v/cYBdx51rDDk4mKEz0d/TBrKTpOiNasED/bo17LpOtbaqqJY7oRBSc/BmxvRif+QORFB+e7Sekf8e3CY/rYauCnIe5UYJ66j/W2udVZ5RH87GPC+nOw+7RY/Rxja+mC/skzcsvNAMJY+4bOURSQKdzMxlVcXKnZvoTvVRy6szbbt74Td6he/v6hP4FaC0iuFtQjBOP85cW5pFdcFBANFaD0x1n8r0e3Y6YT12dHFJn5jhDsvPc7cCV28rffztYKNyf0ac1CnXfLeClaS5yj541cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPFjvHzurYcGRDPl+eZz5UpIXNhjbNaySmNYBE0/D/4=;
 b=Qj4CMfTS+CWqpeVVkek4FwE7VYzXG1cNs8RSPHrQptRmLRDZrK0bAsMUGX5a7yAyeu3EZtaJWo87WrRx9kxb+rRR2egk07UKPyNFZSvIl0ud6D8aW7b07didUuInF3mYiZjq+zn52hiiMM4RpDMSQd8qKhCOh0RTN49Ivhkr+FU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3317.eurprd08.prod.outlook.com (2603:10a6:209:42::28)
 by DU0PR08MB8422.eurprd08.prod.outlook.com (2603:10a6:10:406::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 16:50:56 +0000
Received: from AM6PR08MB3317.eurprd08.prod.outlook.com
 ([fe80::e42a:494c:6581:1897]) by AM6PR08MB3317.eurprd08.prod.outlook.com
 ([fe80::e42a:494c:6581:1897%7]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 16:50:56 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>, nd@arm.com,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [RFC v2 3/8] drm/panthor: Add panthor_perf_init and
 panthor_perf_unplug
Date: Wed, 11 Dec 2024 16:50:19 +0000
Message-Id: <20241211165024.490748-4-lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211165024.490748-1-lukas.zapolskas@arm.com>
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0069.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::33) To AM6PR08MB3317.eurprd08.prod.outlook.com
 (2603:10a6:209:42::28)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3317:EE_|DU0PR08MB8422:EE_|AM3PEPF00009B9D:EE_|DU0PR08MB9026:EE_
X-MS-Office365-Filtering-Correlation-Id: 5283ba3d-ea06-437a-f3d1-08dd1a040143
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?CZi/BeiXLDmTi6vumbQKSLWbyaJx6rpwHCSNpe9UMVZceNZryzuDTHKGTRqm?=
 =?us-ascii?Q?TmwTI5mVS8LoFjWCZ9u7lM9VUHNTxueWUZPzuQLQEoPftKOUXgrFVgdaMlU4?=
 =?us-ascii?Q?I8QfTujHQrdioXKvFbc/IPq1XlfBy4yVheOg94T/IV4FR03L3pJ7nQCoRPbL?=
 =?us-ascii?Q?dkIVNci92mUKqbewQwaEYEQdt3/CHrmOqX7UhmRa4sBWAnfBJ4byWnlIFm04?=
 =?us-ascii?Q?E9sH9i0xbHxESFr6KnVx6/Lt3Kmy2Q11oMGv8UCYU3H661dIc2aKnWfj4hyd?=
 =?us-ascii?Q?CPVADyMkMrZQRUPGXIkqWE3AGFO7igWmEbhU7UrJ1SAffbCg+9giToPr1iul?=
 =?us-ascii?Q?nKighefjvhTFcYK4U6I3nPWmVeI3E8I7c6wMG207Bj2IJJ4kvk1F6xGc4RdG?=
 =?us-ascii?Q?kiezcUZRwCGnGISUXCJE+HvGkjEqmJ0SsP1QMve905pQHEz67I0ODZib1rSF?=
 =?us-ascii?Q?ff5OW56iwQzQ/ALn98EGChiu90/jtLKkg2Mib5vC5ztEt980c3u/YS0yQwdN?=
 =?us-ascii?Q?xqOvvCHWdDxhK3XdL6gg/qBbjZNTDkIDnBBZgRAKmDF7F3cknltPb423aN4/?=
 =?us-ascii?Q?eYurTM0gxRUQhfBp1Z97kUDp5NnVok7H1gm7txpl4R9hIAEz0sWY89qSg3cK?=
 =?us-ascii?Q?DEegeVywcGpap50VveQpz3mF11dLcPtPEXVFNxBpZW49Dnf3feONQYspA3KH?=
 =?us-ascii?Q?qwEB/xxUkkrwjy9ABrt8Fa8rCzbnkZ+PseXEI89uhEjM91Yw+6wgeV3mvwYN?=
 =?us-ascii?Q?bkRcRJxTOAfuLTG4ZOc4xbsZlbDxST5IIw6376vM7mluAiHRgXTS6FNlI2QR?=
 =?us-ascii?Q?vkkaVka0WZf4lKf7PKtzPJKbYD8bpchG83rh2saLEkMoO33mwuqyhn56u4wg?=
 =?us-ascii?Q?Hw9o9si8hfVR5uabP5SuOUztaDjbE4BVQw4JvdSENbBCoR1MeYAeMofPf39s?=
 =?us-ascii?Q?d3cb9n+pkhpYMie4hXEUeiXBY3k7o43zMcpYZgqmXume/kiGrAnxE8xkCkFB?=
 =?us-ascii?Q?dY3FjFGTY5qaiESG2XrEukaQuEyactUQU/qaPWKQQRtgUqQiGO7cgEkbhLQ7?=
 =?us-ascii?Q?qVaX0rwHGqDQS/Mdv8wfbEMKNSVxuzUDWvaPNAvpfqRXXba4X67im5lmCVzF?=
 =?us-ascii?Q?2tXT3PHNFt7wVGC6HeE6clHl/bXVrlcRmtOVIuup0HIrZIFbLCObvpDWjayP?=
 =?us-ascii?Q?+w9GMUlJ65ourf7KYynnrUUXD1y+8MvF0zFQcV9M/cPHCNCGHtxsQHm+0syZ?=
 =?us-ascii?Q?xUmpVP0fOzANFkcIS59IUZ+yMRgXxKicqF7Tk/OwzoYwNasfM1MwrFQkgoDb?=
 =?us-ascii?Q?AjE8BmXMSTa2LA476+7IRcbaNKDmkWspSLn5FYwtgsYkQg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3317.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8422
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:209:42::28];
 domain=AM6PR08MB3317.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c1d530cb-7b09-4c56-ca7e-08dd1a03fb80
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|35042699022|82310400026|1800799024|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EFK0oxYLhbB54LIK9ypNuyi3FMY/33Zq9pCIFewyLIkOwXvFOJSWbNR0Cffz?=
 =?us-ascii?Q?Y5dQChylrF5K5djyouS51fkqslxuhID5jg6rKZ+mgEYdjcDCRbLgFSO/hZzC?=
 =?us-ascii?Q?9lzsViTJJ93t4oR/WXKp2aglJ8rTFbRvBGMQuVKFrgmV7taxmFTq5dNJKWXs?=
 =?us-ascii?Q?iWCqMgLy/s6Kg0WQhFhpXmbnFRP+VuvZqyu1yvZ7EHwGno1D4+6EbC1KHV4D?=
 =?us-ascii?Q?HR2lwgn8qG9ABQMk7a98JgKYt4S+3foIYvUp5H41kJy/ZJ+0JoOEbhsuSRN4?=
 =?us-ascii?Q?fna/aUPsutE5kELnbs44wmsAwgCA9Jq7d7EG7ucuMKA85jZ5EsjMRMRxZxjo?=
 =?us-ascii?Q?yQG+bGjN+kzlsrVNT5DuBZjf+5hD2dgevgOhjYjADK04AOm2L7yDRKwniJCK?=
 =?us-ascii?Q?LQmZrnxTcOQM8+fZYTfBQ2Ov/9qCKV8CyVkeX/ByfgL+7sxwngNCWeBuQ7Ol?=
 =?us-ascii?Q?Noi2bwPubhKRsi9kr6k+pCw3XTz8RV3VUX5arwrKT4lGgzdEMSn8WrhJGGb8?=
 =?us-ascii?Q?q5I3SZMM+amEB7Cm2w7BHOHzbYJZ2xaBRWp8hHY7kG0Pk0Fgu/KDtPZFSfLa?=
 =?us-ascii?Q?W1iFLW1VaX9/INTLAsxXxPKhRUThe72mY5lG6KqwdnvG7cofNsqzIP5sGDMl?=
 =?us-ascii?Q?3JRz03qp1kQY11hmr+dcKH4G33+71zw6Zs02qEmZUut9hDw6TvdhRcJgCFr+?=
 =?us-ascii?Q?8ldMMa00UEJ5scZjJlUnK+Axk0epI0xPxoBJN6IFPVsk6UAk57JjXpFAPs7n?=
 =?us-ascii?Q?t2krATFiYsIVNOx4taF5uSW8lAIsDxxcpZ4MFBZN95GXzjx8aNeqwPgmMa54?=
 =?us-ascii?Q?EPQqFF+KMSFo8W6X/se9ZBQ8mvfyYoxX1tU06ABfap0Ty0tLan4igrIfitbv?=
 =?us-ascii?Q?0F8BgG6bkMLPiEYENiYrY4M81CN8wkeKnV2gA90ZZnZx2esWaxpNek2W9bSS?=
 =?us-ascii?Q?HYmFW1eR57Ja9jEb/NlPNjFTt4Hx7qjBbbJcZoU4sBWaxQ8hO5JWJ9su8RW3?=
 =?us-ascii?Q?x5SQM6Q9YdQa2deRWlIvgzuUKdITNLY+yXxlsFNrSYzN542d3QTk4ZJDx1hs?=
 =?us-ascii?Q?95NfGNqrL1vaFDv3nzWDK1Gre/1aoYVGfI4crRAEmjbkHqppMiKPTkRwmCsd?=
 =?us-ascii?Q?baJxchFsLVeXZBrhLUjC1NR7/W7oyYe2qv/UhJWb6LOX7kbhkdhv8/1UKrr5?=
 =?us-ascii?Q?upl02u2lezbYzDQ4n9A2DZIYcBI/hVZECPNsTKDQGJ87odFqeH98gGuIkrWK?=
 =?us-ascii?Q?YuOYVAfpITM6D8Qzc42L583bFIdrqOSJ7agR8Gk9+3sQiud12l1jP/dVwZJX?=
 =?us-ascii?Q?kv1jhpZgwbIicg/GUxBq09pU4AgaWiRtpJ4/SREVwN9tHeP8Ekk0O03KMwWG?=
 =?us-ascii?Q?ysaOo8ron/+DCf2zBzcBP9XuLMJVFq+DYSuTENOir+rwmTMpAXE/DD+a51aD?=
 =?us-ascii?Q?e2IdZCXEX4tgSIL2y/WtbpzT9dMeqN9l4nlMPeNGzt0PV731jOXUdw=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(376014)(35042699022)(82310400026)(1800799024)(14060799003)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 16:51:05.9275 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5283ba3d-ea06-437a-f3d1-08dd1a040143
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9026
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

Added the panthor_perf system initialization and unplug code to allow
for the handling of userspace sessions to be added in follow-up patches.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |  7 +++
 drivers/gpu/drm/panthor/panthor_device.h |  5 +-
 drivers/gpu/drm/panthor/panthor_perf.c   | 77 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_perf.h   |  3 +
 4 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 00f7b8ce935a..1a81a436143b 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -19,6 +19,7 @@
 #include "panthor_fw.h"
 #include "panthor_gpu.h"
 #include "panthor_mmu.h"
+#include "panthor_perf.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
@@ -97,6 +98,7 @@ void panthor_device_unplug(struct panthor_device *ptdev)
 	/* Now, try to cleanly shutdown the GPU before the device resources
 	 * get reclaimed.
 	 */
+	panthor_perf_unplug(ptdev);
 	panthor_sched_unplug(ptdev);
 	panthor_fw_unplug(ptdev);
 	panthor_mmu_unplug(ptdev);
@@ -262,6 +264,10 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (ret)
 		goto err_unplug_fw;
 
+	ret = panthor_perf_init(ptdev);
+	if (ret)
+		goto err_unplug_fw;
+
 	/* ~3 frames */
 	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
 	pm_runtime_use_autosuspend(ptdev->base.dev);
@@ -275,6 +281,7 @@ int panthor_device_init(struct panthor_device *ptdev)
 
 err_disable_autosuspend:
 	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
+	panthor_perf_unplug(ptdev);
 	panthor_sched_unplug(ptdev);
 
 err_unplug_fw:
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 636542c1dcbd..aca33d03036c 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -26,7 +26,7 @@ struct panthor_heap_pool;
 struct panthor_job;
 struct panthor_mmu;
 struct panthor_fw;
-struct panthor_perfcnt;
+struct panthor_perf;
 struct panthor_vm;
 struct panthor_vm_pool;
 
@@ -137,6 +137,9 @@ struct panthor_device {
 	/** @devfreq: Device frequency scaling management data. */
 	struct panthor_devfreq *devfreq;
 
+	/** @perf: Performance counter management data. */
+	struct panthor_perf *perf;
+
 	/** @unplug: Device unplug related fields. */
 	struct {
 		/** @lock: Lock used to serialize unplug operations. */
diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
index 0e3d769c1805..e0dc6c4b0cf1 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.c
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -13,6 +13,24 @@
 #include "panthor_perf.h"
 #include "panthor_regs.h"
 
+struct panthor_perf {
+	/**
+	 * @block_set: The global counter set configured onto the HW.
+	 */
+	u8 block_set;
+
+	/** @next_session: The ID of the next session. */
+	u32 next_session;
+
+	/** @session_range: The number of sessions supported at a time. */
+	struct xa_limit session_range;
+
+	/**
+	 * @sessions: Global map of sessions, accessed by their ID.
+	 */
+	struct xarray sessions;
+};
+
 /**
  * PANTHOR_PERF_COUNTERS_PER_BLOCK - On CSF architectures pre-11.x, the number of counters
  * per block was hardcoded to be 64. Arch 11.0 onwards supports the PRFCNT_FEATURES GPU register,
@@ -45,3 +63,62 @@ void panthor_perf_info_init(struct panthor_device *ptdev)
 	perf_info->shader_blocks = hweight64(ptdev->gpu_info.shader_present);
 }
 
+/**
+ * panthor_perf_init - Initialize the performance counter subsystem.
+ * @ptdev: Panthor device
+ *
+ * The performance counters require the FW interface to be available to setup the
+ * sampling ringbuffers, so this must be called only after FW is initialized.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_init(struct panthor_device *ptdev)
+{
+	struct panthor_perf *perf;
+
+	if (!ptdev)
+		return -EINVAL;
+
+	perf = devm_kzalloc(ptdev->base.dev, sizeof(*perf), GFP_KERNEL);
+	if (ZERO_OR_NULL_PTR(perf))
+		return -ENOMEM;
+
+	xa_init_flags(&perf->sessions, XA_FLAGS_ALLOC);
+
+	/* Currently, we only support a single session at a time. */
+	perf->session_range = (struct xa_limit) {
+		.min = 0,
+		.max = 1,
+	};
+
+	drm_info(&ptdev->base, "Performance counter subsystem initialized");
+
+	ptdev->perf = perf;
+
+	return 0;
+}
+
+/**
+ * panthor_perf_unplug - Terminate the performance counter subsystem.
+ * @ptdev: Panthor device.
+ *
+ * This function will terminate the performance counter control structures and any remaining
+ * sessions, after waiting for any pending interrupts.
+ */
+void panthor_perf_unplug(struct panthor_device *ptdev)
+{
+	struct panthor_perf *perf = ptdev->perf;
+
+	if (!perf)
+		return;
+
+	if (!xa_empty(&perf->sessions))
+		drm_err(&ptdev->base,
+				"Performance counter sessions active when unplugging the driver!");
+
+	xa_destroy(&perf->sessions);
+
+	devm_kfree(ptdev->base.dev, ptdev->perf);
+
+	ptdev->perf = NULL;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
index cff537a370c9..90af8b18358c 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.h
+++ b/drivers/gpu/drm/panthor/panthor_perf.h
@@ -9,4 +9,7 @@ struct panthor_device;
 
 void panthor_perf_info_init(struct panthor_device *ptdev);
 
+int panthor_perf_init(struct panthor_device *ptdev);
+void panthor_perf_unplug(struct panthor_device *ptdev);
+
 #endif /* __PANTHOR_PERF_H__ */
-- 
2.25.1

