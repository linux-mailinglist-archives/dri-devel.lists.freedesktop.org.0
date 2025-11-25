Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5824C850A4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 13:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0165010E3CF;
	Tue, 25 Nov 2025 12:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="PBdVKOyf";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PBdVKOyf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010038.outbound.protection.outlook.com [52.101.69.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0185810E3CF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 12:56:50 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UsC8c6mvev5mcGKtmF96gE+Z7iyjHJzRYxWPgRYJqItpD1z1tcoAasIwHl5NoSlbQ5WCMaWhKVsmSQ6+nN/MquN/2af2mGZyNumxUKEAm85NEMOhhKKawVeDgUUS2uhlDfa/lZONJ3efz0cGQSfN6LYXykx/QpzZJQDX7WsrEwospnPRb7QhEX/a1Fd8iXbe5ZYemmM2i5YmivQ1EeKlOuSYDpZ1+zjaLmhS4Q3o8rfEDnJ2H96ItQLWMECJnZoS9BQ/W0fwOMIBgtFCqcotbFouOY7tQCle0xX1ZyrnNdXI+NvpubhwP/kSeaX7up46fJBEknO8tLIyJrzbzdreyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APcLSWkyjRv9VtrqxlSbNuyDAzta1RHCiBwiJzIj6RQ=;
 b=P4RD0fURqxeBemL2Q5ul2wj5besgrtNzn6OnlFZPVop3+W6A7hSejd1QoI5ATLzs959XXEIutXlaAnFKpWJXPep2T+ndFhsjCYlsX2JRB75eRvXcFt3NO20kCnVNUjpyvOEtmY6J4htZe3jXN5iS01rNDgHaGBs6FDjZZnoDOnwklpIlN7CtbnrlVKsqg7r9JF33J1csLZjwJUosfc3T/mEJEkAbhoKsoAaht847fjUNmZ2Lv81RnWrfCd3R3ilCznNhHob2hZftzQGNnwjf2hLLle+vHrtLPKrXR13+w0DH/53Irg2+MT4lMnhTMxOO7EeWYoF39D0XysGaud8Vqw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APcLSWkyjRv9VtrqxlSbNuyDAzta1RHCiBwiJzIj6RQ=;
 b=PBdVKOyfoG0hitx7DHgtOqgeSYOvHjsWEGuK5rfQog4TjzulAVairmm1HPkNGykFONS8xw2MLyuHWN0biA10XwrloXZ+weM41rW5k8rq2BIn7lCx5IHdo31VjOz8dPhDQXI6YErfNcnSDEe6EdunJdh0Q2pD4Y7G3Q5C5B8LSfM=
Received: from AS4P190CA0061.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::22)
 by PAWPR08MB8911.eurprd08.prod.outlook.com (2603:10a6:102:33c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 12:56:44 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:656:cafe::90) by AS4P190CA0061.outlook.office365.com
 (2603:10a6:20b:656::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.18 via Frontend Transport; Tue,
 25 Nov 2025 12:56:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Tue, 25 Nov 2025 12:56:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FyDIZyDnnBn9xqK+wrCPCuMsphiChyCgkc0j6+emddKi42eWszmI0FlIBFRc3K3DZ0wLY5EP5qyEz+b5uc6/xG7KxMqhJZ6+GV5kk+DwrpOPJj4qz2VSDuOrIajFVLWTj2/xcxTTSdVTfNtMJJYOINLX7gSRqmGcRKHXV4gBq5D3daEI/4lv1emdDfUje+cmuEpr20C3vyXygBNNmgp0PH3swuu8MvFtIuHcsTHkWDcIwnEccgalmpUqRC2mkG7DdfYRrSMl7yIDABPFNV/feNqSvafzUHTEJvRtz/m1oFOez27I43yEx0FAi6/oY9m6OwPkkCpCmzr1R/MaQUSHpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APcLSWkyjRv9VtrqxlSbNuyDAzta1RHCiBwiJzIj6RQ=;
 b=anmg1owJUfbZLCqhGSWgMeGMIWg1mUB1FXZEu3s6nzaSUtWeAzO/X/SfwD/MvQTGEStd8NOweLXKDDxNGelrzl2r3t6VpFzM4R0AC9Rb7GreonVUMd3K/Zu9HB/s0bdbkFQRORX0vMuqPM0l9nT4O3EDQIgY9O9sEt9dxB9W/08HELv0PU/ID5A4HkPa/K9KQHYY/64qSLPpX2Rrcf03Ab9Y2Gw7mK4ninWZ/qyoIjKDfwskceRY2jC7sPhj2U70rq5zavXyXB7TkanSLcgMFm3nNsvTeWFQdnGyWZiT/YuGgSivtA0xgwzuA8TfEK86xLY6tCkppmIasI1ffqnPtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APcLSWkyjRv9VtrqxlSbNuyDAzta1RHCiBwiJzIj6RQ=;
 b=PBdVKOyfoG0hitx7DHgtOqgeSYOvHjsWEGuK5rfQog4TjzulAVairmm1HPkNGykFONS8xw2MLyuHWN0biA10XwrloXZ+weM41rW5k8rq2BIn7lCx5IHdo31VjOz8dPhDQXI6YErfNcnSDEe6EdunJdh0Q2pD4Y7G3Q5C5B8LSfM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DBBPR08MB6108.eurprd08.prod.outlook.com
 (2603:10a6:10:1f4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 12:56:11 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 12:56:09 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/8] drm/panthor: Add support for Mali-G1 GPUs
Date: Tue, 25 Nov 2025 12:55:40 +0000
Message-ID: <20251125125548.3282320-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0040.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::9) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DBBPR08MB6108:EE_|AM3PEPF00009B9C:EE_|PAWPR08MB8911:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b53da48-7b9c-48df-1661-08de2c2215ba
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?3CQkhU06BPnLmwjcGmQd2tzL67FFg2zCOxaES96M7Y3a9Bzwban3KvtSiW4X?=
 =?us-ascii?Q?vUAxjrm/p5YeEDbG5zUAIlpWxxvRhDj/ED7hojpBr1u9e0rIYEkHVTeJf2Gp?=
 =?us-ascii?Q?YNvVXUKvxe366mlo5sow9jrOX5Om/SjLUPQZcx+ZbZx3jplQv1SGiFZvzPhc?=
 =?us-ascii?Q?KKnL34l2uEovTZei3u6m2xGHhML611+BdOAPSwurfKbEgfJvczxBpsvLx8Zr?=
 =?us-ascii?Q?NPDxuRYSURcgw33Tr0jHSb2zhfurCEUaVCH/6lFtzH8YiZpflEsRdYXwcVzr?=
 =?us-ascii?Q?ZKQJVpNguGxsDw9ZpPtU4h5tjMNMc3xHtVglijfEZN4e5d9v/VxRFTuHx6+g?=
 =?us-ascii?Q?W52hRYgfTPFu9aud5byysGJJy85N/XEMktGYqfGQM7Z8xVfrrlyPfnyAdm7T?=
 =?us-ascii?Q?R9i27bgdMPVYzicvQMfxhWH6GHoglw008Er53AN0te+FRI07UxPRJdpUVTCg?=
 =?us-ascii?Q?V12OnukTtadl2+54+2cTb116aXFhMXu+BicgJ2d3IouOWT98CSDvOKNwvjG3?=
 =?us-ascii?Q?Si9jP/2SUkxBHLJYx2yAF6wKA0E2zIJ8nAUbca4ncYJcfu4QsIdA5eVeD4hl?=
 =?us-ascii?Q?mKD4Tfkn+Tdsc8T+W4UFulOYwetAt0GIREMbtgpcVq1/71/NcYqo94MSwLTK?=
 =?us-ascii?Q?Sd2lD3IUOBgFyRv4dS5kacqMIRrf+RaJhyJnUYHdfK2y6DTyfT5SW+vV55M6?=
 =?us-ascii?Q?BRETioBk/22zbeC2Pzwn91guMun/BV1g7lCavskvBmIBxBqejgSebNzKQUR9?=
 =?us-ascii?Q?VdN2ytldpTY6IJ8Qtx0q6IueQ6mJpDV4Pn/S5FG0CVSp6G2QpLkXw0E+a91T?=
 =?us-ascii?Q?keZhTYqwB6onUlxkHO5YTCaj3eDFhmL7SmQ6oNpv/yG89HYNIW9udOHQgm0L?=
 =?us-ascii?Q?BJRsui7SCxyWUjftTuiuMzaOipf/RhLCdcNa3verjVuNCNuZ+W2a+ssxFBmg?=
 =?us-ascii?Q?md1BW75MLVpbgoNBrw8hwDY0CaGDB2cgQ2qOXmfA0ZsVomgwEHH+neZFxj5C?=
 =?us-ascii?Q?ppKmh0TP4ln2GZlrq/1PzVizhjfuYmV3whXgmIjWQ2iyrg6iU9/bUjkV1KGE?=
 =?us-ascii?Q?YsRTUScuHMMkmOcuB/u19CyN4YaQS1cFwo0qHog80sTAhLrseX6Sl4C9cHWg?=
 =?us-ascii?Q?hXm2tzVZ/Bzeo8ZAEO/1QQmIVKCPPx6k5t2aFagz8XcKK3TqgNEQ1M7gRYOP?=
 =?us-ascii?Q?kE9p79+TxDYUmpw3SWG2SwTvH0ycSRjJtmxLQZQX2Q5TbpjRATR8xO5ZMSIL?=
 =?us-ascii?Q?O4KYr+o6x4+Hrq0KnkNfBPSeny4/FBht3XqQ2qlpR6uM4vMT7JV56y27W9ZC?=
 =?us-ascii?Q?z+fC8y23WgP7xLE0R9Hz8U2yBNWK6xHLJqAowvq5QJGhUj5qnykob4uOSLqa?=
 =?us-ascii?Q?tpWM9nFTBMfoiRTef4TkydSuwecA1X1W5YCCAN/U01h+u883DrV+RrtVag3t?=
 =?us-ascii?Q?duPqDTJ9ConUTu163mHcxCYfic3zmn3s9EEoxgYiPmYVBneZjX3oCw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6108
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c08d1b5a-4aa5-4510-034e-08de2c22009a
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|376014|1800799024|35042699022|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rj+ueWsAgqwuzzASw+RLLdh/uzafssl0s9Ldkg7y4/VeZsvA8A0r1gCRgluI?=
 =?us-ascii?Q?rW0sS+ec/9bDy35NNYMb12GGRKi41dZP5yg+3Tp4JDV36luFnGEDMpbIeW72?=
 =?us-ascii?Q?Oe0sKbynbTJ8o392sRVG9pOvpo6eOEeRQ8P2egbmCcouctrlfw3mAFZNHL2o?=
 =?us-ascii?Q?BlOu2ELtuezy4MF3N+CMSWQVYnGjdYoR+kcbQq35ctaFdiRMKWvwzqTadsPS?=
 =?us-ascii?Q?QVIc0uPJiJ3txicJFmmDjshilD+JUDZ+f7OulqL+KbBQWelWi0L9Ya9HQ47w?=
 =?us-ascii?Q?/7USrc+Hr7i3A6djimGnKAS8sPxkb7UP5asKoGUie31kAL8aaf6ItbeOJzZb?=
 =?us-ascii?Q?E8Qf7f/w9iHAQmNFOgfFgoJwUi7VGc2b7cInz0fAgISgvP68JRjgyZol74xz?=
 =?us-ascii?Q?eSRnksfCezTyWL4QMZM9MBLGhn+Nu+mzfrZAAba3W4umS5JO96TUx8eyqS/a?=
 =?us-ascii?Q?LyRApCF4z4bJl653sqHdxqKUIJXKtIKgB/hsQVsZwiVF7R5TnXpjjy4321qF?=
 =?us-ascii?Q?1H/l0/lWPeQf5HFL0nhusc/tX1gDsPkzy+Q9a9K/ePdCvO+hph7DRSx2ta0c?=
 =?us-ascii?Q?LIfdjpqUDFPOXU67YW4J/TAAB3d/aLNXRpO9kc8oUWIU6ZcHx03KiO5NH8z2?=
 =?us-ascii?Q?fQb+OnnBzDNqfqrfL+EGamQFoGR9VpvJDkRktLtFV3qxlWqxPtqUzWDdEuYD?=
 =?us-ascii?Q?peEDxo/JLVWWb3vWh03I0xFaNA4L6ruTlaLFWOK11SrQQer+SUJ/Cz+Lvybr?=
 =?us-ascii?Q?DqelMAUueu0TzGsy+Kpmb4Jbdy42DmYnSw/fJldp/7G4xbY604XBYMiZwRY2?=
 =?us-ascii?Q?gXlUwNF08TagEb+Tp0lfVebWLjQIF7C/zBEqSweVDxZnI9XGf/2ZX17tBIT1?=
 =?us-ascii?Q?vZSMZlbsO8nqb4ZwMXFl/ps+z71WFPSFhtY7bL2/BXoZnU9AMjcmsMah8vV3?=
 =?us-ascii?Q?R0djyqG31JQ8ibHIz/J8+RbvK4yy/U1zvCXbEM0z5YNTc7mGkQwPWv49p15C?=
 =?us-ascii?Q?xP7jh30VUQGIrc47jKCTXSQTlM5Jcj9vQz2/JTPI1qLX9QV97DoxNiWnhqcW?=
 =?us-ascii?Q?Jrg0ngHIoBt4fYremTZ67hTNnNZM6evIMlcMFyU8KDYpYvhvSe6/maMU6TMA?=
 =?us-ascii?Q?GTMzgxfvRDv/IWcU5LLqeMEuRfVvYtNYQBJimZxeZEEkAEm0SOlNVsw2xiwO?=
 =?us-ascii?Q?6DzK5oLBQwV83mRmZab+MrcFVTxDiYWnJ8QncKjuMaVZDsgy7iUoOJTu+fqg?=
 =?us-ascii?Q?vl2lrc1Q0xOyYQHtw/8Fg5mTEIJ0LU3M9gIsd23earc/SbSaxSWaCsxQLus2?=
 =?us-ascii?Q?9EiOrVGmKTYt74o/0Nw2TbsAsU22o2r40Wf6c68OXTW5lCZFS0S0dkcw/pFr?=
 =?us-ascii?Q?DOYT0T1T23jnzgPzirnCBKvjBImU/8ZbgNPbPrY3J31gUGblc0H6/fC6wH/W?=
 =?us-ascii?Q?crZF7BIEbsjzebYjOniWIZ3CKIafSqk3xGZZGdRWhHRRseFFm0J7xARf5FFA?=
 =?us-ascii?Q?bWCftXGD4ybSMe5x4/x7ZTNXVrLYSzXjDi0ogWvMpc3JAn8l8bNE8b0fnJ2X?=
 =?us-ascii?Q?Iw4qoi4MWl9q8eutuQTgdCloEXkSxblLAtyYxdel?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(376014)(1800799024)(35042699022)(82310400026)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 12:56:43.7255 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b53da48-7b9c-48df-1661-08de2c2215ba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8911
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

This patch series extends the Panthor driver with basic support for
Mali-G1 GPUs.

The v14 architecture introduces several hardware and register-level
changes compared to prior GPUs. This series adds the necessary
architecture-specific support infrastructure, power control and reset
handling for Mali-G1 GPUs.

Patch Breakdown:
[Patch 1-2]:  Refactor panthor_hw to introduce architecture-specific
              hooks and abstractions to support the v14 architecture.
              These patches introduce architecture-specific HW binding
              for function pointers.
[Patch 3-5]:  Adds basic L2 power on/off and soft reset support for the
              PWR_CONTROL block introduced in v14.
[Patch 6]:    Update MCU halt and warm boot operations to reflect the
              GLB_REQ.STATE changes in v14. This ensures that the MCU is
              properly halted and the correct operations are performed
              on warm boot depending on the FW version.
[Patch 7]:    Align endpoint_req with changes introduced in v14, where
              the register is widened to 64-bit and shifed down by
              4-bytes. This patch adds the necessary infrastructure to
              discern the correct endpoint_req register to use.
[Patch 8]:    Enables Mali-G1 support on Panthor by adding HW bindings
              for v14 architecture, product names and path to FW binary.

v5:
 * Rebased patch series on more recent drm-misc-next (ac364014)
 * Picked up R-bs from Steve.
 * Link to v4: https://lore.kernel.org/all/20251107142440.1134528-1-karunika.choo@arm.com/
v4:
 * Fixed include and forward declaration issues.
 * Addressed code format issues.
 * Picked up R-bs from Steve.
 * Link to v3: https://lore.kernel.org/all/20251027161334.854650-1-karunika.choo@arm.com/
v3:
 * Updated include logic to enable static inline functions in
   panthor_hw.h for function pointers and feature checks.
 * Fixed missed replacement of CSF_IFACE_VERSION check with
   panthor_fw_has_glb_state() check.
 * Link to v2: https://lore.kernel.org/all/20251024202117.3241292-1-karunika.choo@arm.com/
v2:
 * Merged GPU_ID refactoring patch with the arch-specific panthor_hw
   binding patch (formerly PATCH 01/10 and PATCH 02/10).
 * Dropped panthor_hw feature bitmap patch in favor of functions that
   performs the relevant architecture version checks.
 * Fixed kernel test bot warnings.
 * Replaced function pointer accessor MACROs with static inline
   functions.
 * Refined power control logic, removed unnecessary checks and redundant
   stubs.
 * Replaced explicit CSG_IFACE_VERSION checks with functions describing
   the feature being checked for.
 * General readability improvements, more consistent error handling,
   behaviour clarifications, and formatting fixes.
 * Link to v1: https://lore.kernel.org/all/20251014094337.1009601-1-karunika.choo@arm.com/


Karunika Choo (8):
  drm/panthor: Add arch-specific panthor_hw binding
  drm/panthor: Add architecture-specific function operations
  drm/panthor: Introduce panthor_pwr API and power control framework
  drm/panthor: Implement L2 power on/off via PWR_CONTROL
  drm/panthor: Implement soft reset via PWR_CONTROL
  drm/panthor: Support GLB_REQ.STATE field for Mali-G1 GPUs
  drm/panthor: Support 64-bit endpoint_req register for Mali-G1
  drm/panthor: Add support for Mali-G1 GPUs

 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |  18 +-
 drivers/gpu/drm/panthor/panthor_device.h |   8 +
 drivers/gpu/drm/panthor/panthor_fw.c     | 131 +++++-
 drivers/gpu/drm/panthor/panthor_fw.h     |  32 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    |  12 +-
 drivers/gpu/drm/panthor/panthor_gpu.h    |   1 +
 drivers/gpu/drm/panthor/panthor_hw.c     | 107 ++++-
 drivers/gpu/drm/panthor/panthor_hw.h     |  47 +-
 drivers/gpu/drm/panthor/panthor_pwr.c    | 549 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_pwr.h    |  23 +
 drivers/gpu/drm/panthor/panthor_regs.h   |  79 ++++
 drivers/gpu/drm/panthor/panthor_sched.c  |  21 +-
 13 files changed, 989 insertions(+), 40 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.h

--
2.49.0

