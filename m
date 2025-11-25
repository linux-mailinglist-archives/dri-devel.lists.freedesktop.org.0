Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAC7C850A7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 13:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AAE610E3D0;
	Tue, 25 Nov 2025 12:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="jv1ZkWlP";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jv1ZkWlP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2986B10E3D0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 12:56:53 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LqMVg5mzzX6FOt2Z6gLPgNxa5AwSmLb1pFGuzKDWklENVUcNhCBS36bKqC/zF52lBkihznEnhhbznINDgWDF+XZZe967x8y1TKb8ai0TDsDtjncbisreiokLHcR26lBv9KxtIc9mir0fx3DT8YgVWZ+HtS7/pMtqOJAs7HCIX9SIr6QcTPDOOJ6eLBxTQmdjaqMY2cl6hmnT8MOP6gfdgF+GTXTcw54hhnItnLoQ227QxPLG5e3COcUpssvE7lJELROaL/P3/Q7SbxNyoMN4vABKIYiLKup5dVJ3GICMX5aPDVFbZR9ovA24DE/zaHli2+KAPLUmW1jZTnHwven1ng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjUXr0ZT8DBiX1rKXGvJKfG/SGWoGav+2lrw3HSTJ48=;
 b=VWMkENnUJKF04KzVOS6+NUtbENl/u4uTl9vIN3SfNFzkb6c/ZXBKnba8thEz5oA1gTbu38c1c4PKIxjVYxeCrw8cwjSbb2P/uil898yGctbJJg6EeRpREu5rHV3hbXQfa8xCG+ufE8E68r3Nsju+obYbOzdduaipIvSbet6SHbKDQY/eJ8bPe3i0wIOygavhhT6WK3HC3eisgUJ5FbtTksGsLhMRjeVGDcZB4BKjtBGIVY/lCtj4hud7I0qjRPA+q9C10ugnO+a73w7PegFzwqQkid24P9OQ7h+l4QeAS6eUc3hQhcGhDjNekYA3tvC9hBCiYp3YkqSU9RKop16Nww==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjUXr0ZT8DBiX1rKXGvJKfG/SGWoGav+2lrw3HSTJ48=;
 b=jv1ZkWlPjnxV9TacWyvRFxtBEp2J0dyvypDVPl6PxLjlgbuLxyp82LbTZhA16MjZLD6gm+hZTBpU8QBA5w3uJv8SLcfWftIime5F7rfLQiJSCnhAbbvR4zcJK05An3BUa3Vn9tYewvelFHj3Zv6qjJVLXb6qjPbjzQVsE0WLE8E=
Received: from AS4P195CA0031.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::10)
 by PR3PR08MB5643.eurprd08.prod.outlook.com (2603:10a6:102:84::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 12:56:49 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::e6) by AS4P195CA0031.outlook.office365.com
 (2603:10a6:20b:65a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.11 via Frontend Transport; Tue,
 25 Nov 2025 12:56:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Tue, 25 Nov 2025 12:56:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I72wvf9CRKy9KW8AphTw6th+F+HnKMOzjYjJ9FQwgp/pfUlYtOxvrNYxX6Bez5jOndrJOUCp3EO0GFyorxV5oD3pcDptL8Pege1MBc8iFdHXz8C0F2PpH2ncZn5g6Uk1Iffm7o3kxl3SceoAJxSXYSenRbg/LWr9bFlZQPnkOctgldDaJVZ33O/gYl5iTXp1lD7kUJji1pX4Hof1zaQvWzXx7pAng6bWTAAxq/+d9EKEk6g6zZdYmJ3jlHFz67p7PRHzHiHvuea8qOBJ/0EUlQk+OgNa6A3tCzrLUlgM6gU5RFvyploNMJWv2KJ7npWQKoyH3nq56qWy14ImcwcPow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjUXr0ZT8DBiX1rKXGvJKfG/SGWoGav+2lrw3HSTJ48=;
 b=FzzMMJHYtGHV1J1G+Kq5f/EMvBq81dSJ9vM1Y0etf4RJihVAJK160akCZK8gv8+6ZuFHolDMkZW6na/zBGQTF5kcfaCBKAE9irrSv0eEoIjieeq1LB8mhG5QP1smUjuAc1JibJItl5Lfg/znOGAPG4Fd+CaAHfeccZRxw6oEQeE9juC0qj6daTKJKs4G8WM6qLcpSuCGiv854OWfN/DHeH9jDulifOBDEovuMist8yvClSx9scfJzwnJ6Nt7z4wOe8Bp7FRjnlwOQcOO3IPZ3w8qSOFdRCOgR116eMhgrPXza+HtNsI4ccERq7Cx/j7YSAejT69oNNreAEUaan8zjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjUXr0ZT8DBiX1rKXGvJKfG/SGWoGav+2lrw3HSTJ48=;
 b=jv1ZkWlPjnxV9TacWyvRFxtBEp2J0dyvypDVPl6PxLjlgbuLxyp82LbTZhA16MjZLD6gm+hZTBpU8QBA5w3uJv8SLcfWftIime5F7rfLQiJSCnhAbbvR4zcJK05An3BUa3Vn9tYewvelFHj3Zv6qjJVLXb6qjPbjzQVsE0WLE8E=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB3PR08MB8937.eurprd08.prod.outlook.com
 (2603:10a6:10:43c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 12:56:16 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 12:56:16 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/8] drm/panthor: Add architecture-specific function
 operations
Date: Tue, 25 Nov 2025 12:55:42 +0000
Message-ID: <20251125125548.3282320-3-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251125125548.3282320-1-karunika.choo@arm.com>
References: <20251125125548.3282320-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0677.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::20) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB3PR08MB8937:EE_|AMS0EPF00000192:EE_|PR3PR08MB5643:EE_
X-MS-Office365-Filtering-Correlation-Id: d305acc9-e6cc-4335-41df-08de2c2218f5
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?MsuwXNaqwm66zme2SbGRpkU71jwJ7dp+S9EHa0VJKIx5E+vdBzxaYtK0Zl61?=
 =?us-ascii?Q?U7Yb+aGIHZX0zn4yiE6iX3opleLcsLAJtTv9/YIb+KBY9Gg4sMf3uYxKI6vq?=
 =?us-ascii?Q?xMyrhaBiZrxgBpUfw7TwKTwV2AhE8qJQkVjY6g6RLAPL/Sj1bJmiOuj9HTh+?=
 =?us-ascii?Q?ZUrXbrFGbq4/VwsNX6cHYLrMImRe94UqaZl4QNSE8dSJYobq2I+OCsfcZbEN?=
 =?us-ascii?Q?vdDCG5xCET02kF7yloGAr8WbBa1sfoBA5/ZBUn5Cnxpk7MNIUN3pJOOpQOaC?=
 =?us-ascii?Q?1der+tsntebhjM4VaQ+LQ6dBElrro1O1TBjfWHY4j5NVXQki7RH13WXZ0JBs?=
 =?us-ascii?Q?WO3gQfRW4959lLI6DwNAKnIVGOzDW2+TX70W/eQBDCMibIpjHOnfNje7lxuN?=
 =?us-ascii?Q?kP+ILvJBUsov4kDQLCdcMQv9WWQxziDB3LGXJDMd+KcUPTe+2xZtVlYVi4JD?=
 =?us-ascii?Q?mpLQmrKwrIwNEDcJcQ5MolqbChsHc3MgJJ8HpRoZa+oFnqG1j4DCoxvgaA6Y?=
 =?us-ascii?Q?+4T+oaTryDMSqLUbCVgKZS81PqHEME4mm4/S2mX0fXuyZ/jETZkcHyPYM9D6?=
 =?us-ascii?Q?bkUi3cEloFblOM6GZgcjq3gdCCacOd+UwbWJ/UENpC4BwIio0ur27tZhKrwR?=
 =?us-ascii?Q?bF10ulsa4XAPri8dVR10uLUGPx10r8lHVDfqUE1s0OFw472tlDYTv0BFSfeA?=
 =?us-ascii?Q?+TddcALMO2nDgMVD0yAbailiqAtt5scuKBPiLYZ0UV84l2kgLqkFOaINO1D5?=
 =?us-ascii?Q?bnJVbbEJbh/loe0jfS4JoBNOLP+7XHGOJgnJ1LTB2hiBNI2kdnUMf8heIY4W?=
 =?us-ascii?Q?XeLSJo5GsWk2o+kGXd3XgdKrTTVNrDhEWlhRmq4gbRIKc+jelkUnZ1Zpc+AB?=
 =?us-ascii?Q?V8XkqNrTFS8lP2X6I/iT8y/82aPKPtKTevhZ7idglCkhrlZ54ZsKfCk897VV?=
 =?us-ascii?Q?LKuu5LK3hLDIMNyQpekYglooMCbfqXGRSpeWmD6FLeq0rjIuAvJh9IyGUJHM?=
 =?us-ascii?Q?QntZM16/b50rImpmN0kL4w3brZQF9p+TCo1ThdU5C2sZd9vmxLZPzJFoi8yf?=
 =?us-ascii?Q?AUbq2GahJbCvD4C99auKPti1KanNy2Ro8BA6Gg8N+wn7AC7sR9QGE/kcP1ue?=
 =?us-ascii?Q?OdOLNe1wF3fE8Z6sKueuRg29a7JCdbk3bxG1mrCgNBe/sgC/hZx/L1ieRgc2?=
 =?us-ascii?Q?dDkauspHnB3G7IARaCFWRXdN/VBX0kqHhI42HLMQkQ8YOCSbs3XUaU3zKWKK?=
 =?us-ascii?Q?wt9WN1pcnwl3Lv+OCTPPNg9pGMkgJZaAX95UyBGMA8hcD/HocnHIAaqOGO7t?=
 =?us-ascii?Q?qvEjQGqzrkDJwu7KLdxVBhbXjiHlbwyyGtuzHgVcaIU4LzWFiBO1N0XbaCMd?=
 =?us-ascii?Q?Yy1EXzv4C3LhDysz376AujKieHF8rQr7k09yM29yPm/XOp05vzd+tPOsnIuO?=
 =?us-ascii?Q?XUqYAOiK1OlBUQWAegb3aV+uBz9ODcrC?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8937
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 14c20cc2-f214-4f30-3494-08de2c220502
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|14060799003|82310400026|35042699022|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zW43FiYbvv0kSlSO58sKKDFgzrFxlJu5CUYrtq1GXv2dn9E0KFh6FDFUJ+Rw?=
 =?us-ascii?Q?V40tPN+GXf4lSglg/BPewtoBlIj8pyUB43ds3+lpBHgDwLVFUJgkEECPT6Lt?=
 =?us-ascii?Q?iZWz3IP+b5MCwZJ5RZiNbT3OEoWWPC08U9s2mLMHcw9WCmCnxn6ZrH1BmNE0?=
 =?us-ascii?Q?WLaZtQxGwpgkB9nda/U+dh204oTmLaSm6kos5gR181QvZNltkX/FwaFdBFMP?=
 =?us-ascii?Q?D+ybKBIPpEKWj4/NaewjQjDHIDq5JdVE1F4+0z11AHwfT52hfqjZCd0P64Ym?=
 =?us-ascii?Q?iSnY9UiQ71tIsvnBByPf+kjtJbPT9Ijw4HQZn8lI/MMKR2z/iuEYvX1VqltO?=
 =?us-ascii?Q?sVejFQVw6hNBTDF84/HUGtPJqZG38z8DNh9jQYylW+40zEwcH88AUGDemznu?=
 =?us-ascii?Q?MFL59Nr6hBx60NW6c+c6y0cU6wgj8QELOYP7+2Abc1P/QJqLSFgQr9qxEmpZ?=
 =?us-ascii?Q?5ineGFEHd9yrN5cdEMUV993tolPP5nochjBGkdKUW9iklcCigzAs60WN2Ec4?=
 =?us-ascii?Q?/yxqwhrj1QPzCSZPm3pODH2dI/2Ju6ezsO3/8VlbJ1a/uxWE+9azgXYiZRlm?=
 =?us-ascii?Q?kpGDA7ZElF9iOgG/D1/4bHSTwjoVAAzLlPJjjURaBthEG6M3DI4hgYttu04x?=
 =?us-ascii?Q?FYNi9JDBtXrMeEL0p5atD1nBA+ylcW2Emg9c4QwL43DMIiiPehj5ZxjC5riy?=
 =?us-ascii?Q?cFdqxqiehHcK/PrYGrTzVwT4YGYG5rA7+do25sSYrFb+S63sno+Wj3M4lZSj?=
 =?us-ascii?Q?Q32DnMMZd6SxShr1/Y0OAp3SkSATyWxS83cEbz9eC/BnQ9aBis6H7BcA8+yg?=
 =?us-ascii?Q?B6IkfCdSVGLQ4Q/4bw361lx1NLZJPl1/HFeeTjZ/RmyCos+ocP5ll4GLMhY4?=
 =?us-ascii?Q?24PDw6PKT1BAvjyPHgcuIXxl+/ewdvMgx8PDI/S3KBA2AupI6wudZHO5IulY?=
 =?us-ascii?Q?BBAQZpOd4J7awPYcQkz5jVw5faspgBGEfOfYDSfxvKoCU85B2iTmTHJOBHhD?=
 =?us-ascii?Q?WWyF6lPo2+zo2/Qeyus+AxlQmG9dAev93h4CEH+zRhUs4NY9l+AORGlSRvVK?=
 =?us-ascii?Q?PrTqGrL/csxFD8DF3Vq3PR1TnAukZQXrMyohQa9/ZKpztkSltdzuDendw8wS?=
 =?us-ascii?Q?zJYDQ5HqnxW6rBpo1389bulFNk5Tea2Hv/LFbgMjzjoIIpndFczZtP8gu3Op?=
 =?us-ascii?Q?bWhrJYSbLemzO8qx0gSM5g7AVuvHMm7BaGcHOrqfisEWoi0Z5Ua3/pj3E1fE?=
 =?us-ascii?Q?pZV26+b62aUoki+QlAChf+CbMpln5f3Ro1ThsmJAGJ/Y1fmW62fVIPff0cMC?=
 =?us-ascii?Q?lDqWnaCVmqB/lmmTOEG/qJhDnBcCl3v4B8crF/2BiAOt6SjJeFXBQ2/ppJ8x?=
 =?us-ascii?Q?0GpdmoHHujT0jlznYz4PA2xIcL/Pe7mLOEtvtbScojvXMzThxY3HamqVAncp?=
 =?us-ascii?Q?dRc8iVN6nZAX/brcZZGa8KNkcMTqtaG6OnqyWth9qWN8niPzFnD7ezp9OMWR?=
 =?us-ascii?Q?vC+0xzlBjn3VGogQ+p0FV4qHbBFPmjU8BV9gwoR2e9gssJ38V0fpQladpA37?=
 =?us-ascii?Q?/bU1FauHdPeliimyFKM=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(14060799003)(82310400026)(35042699022)(36860700013)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 12:56:49.1403 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d305acc9-e6cc-4335-41df-08de2c2218f5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5643
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

Introduce architecture-specific function pointers to support
architecture-dependent behaviours. This patch adds the following
function pointers and updates their usage accordingly:

- soft_reset
- l2_power_on
- l2_power_off

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v4:
 * Restored mistakenly deleted forward declaration.
 * Picked up R-b from Steve.
v3:
 * Reverted includes changes to align with the include behaviour of the
   rest of the driver while enabling the definition of static inline
   function pointer accessors.
 * Moved the function pointer accessors from panthor_device.h to
   panthor_hw.h
v2:
 * Updated includes for panthor_hw.h to allow static inline function
   pointer accessor functions instead of MACROs.
 * updated l2_power_off function signature to void instead of returning
   int as we have no way of handling a failure in this case.
---
 drivers/gpu/drm/panthor/panthor_device.c |  4 +--
 drivers/gpu/drm/panthor/panthor_fw.c     |  5 ++--
 drivers/gpu/drm/panthor/panthor_gpu.c    | 12 ++++++--
 drivers/gpu/drm/panthor/panthor_gpu.h    |  1 +
 drivers/gpu/drm/panthor/panthor_hw.c     |  9 +++++-
 drivers/gpu/drm/panthor/panthor_hw.h     | 35 +++++++++++++++++++++++-
 6 files changed, 57 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 31fb8ed68199..0ecf552caa5c 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -152,8 +152,8 @@ static void panthor_device_reset_work(struct work_struct *work)
 	panthor_sched_pre_reset(ptdev);
 	panthor_fw_pre_reset(ptdev, true);
 	panthor_mmu_pre_reset(ptdev);
-	panthor_gpu_soft_reset(ptdev);
-	panthor_gpu_l2_power_on(ptdev);
+	panthor_hw_soft_reset(ptdev);
+	panthor_hw_l2_power_on(ptdev);
 	panthor_mmu_post_reset(ptdev);
 	ret = panthor_fw_post_reset(ptdev);
 	atomic_set(&ptdev->reset.pending, 0);
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 38d87ab92eda..027c4529f3f2 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -22,6 +22,7 @@
 #include "panthor_fw.h"
 #include "panthor_gem.h"
 #include "panthor_gpu.h"
+#include "panthor_hw.h"
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
@@ -1186,7 +1187,7 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
 	ptdev->fw->vm = NULL;

 	if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev))
-		panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
+		panthor_hw_l2_power_off(ptdev);
 }

 /**
@@ -1365,7 +1366,7 @@ int panthor_fw_init(struct panthor_device *ptdev)
 		return ret;
 	}

-	ret = panthor_gpu_l2_power_on(ptdev);
+	ret = panthor_hw_l2_power_on(ptdev);
 	if (ret)
 		return ret;

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index eda670229184..06b231b2460a 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -19,6 +19,7 @@

 #include "panthor_device.h"
 #include "panthor_gpu.h"
+#include "panthor_hw.h"
 #include "panthor_regs.h"

 /**
@@ -241,6 +242,11 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
 	return 0;
 }

+void panthor_gpu_l2_power_off(struct panthor_device *ptdev)
+{
+	panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
+}
+
 /**
  * panthor_gpu_l2_power_on() - Power-on the L2-cache
  * @ptdev: Device.
@@ -368,9 +374,9 @@ void panthor_gpu_suspend(struct panthor_device *ptdev)
 {
 	/* On a fast reset, simply power down the L2. */
 	if (!ptdev->reset.fast)
-		panthor_gpu_soft_reset(ptdev);
+		panthor_hw_soft_reset(ptdev);
 	else
-		panthor_gpu_power_off(ptdev, L2, 1, 20000);
+		panthor_hw_l2_power_off(ptdev);

 	panthor_gpu_irq_suspend(&ptdev->gpu->irq);
 }
@@ -385,6 +391,6 @@ void panthor_gpu_suspend(struct panthor_device *ptdev)
 void panthor_gpu_resume(struct panthor_device *ptdev)
 {
 	panthor_gpu_irq_resume(&ptdev->gpu->irq, GPU_INTERRUPTS_MASK);
-	panthor_gpu_l2_power_on(ptdev);
+	panthor_hw_l2_power_on(ptdev);
 }

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
index 7c17a8c06858..12e66f48ced1 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.h
+++ b/drivers/gpu/drm/panthor/panthor_gpu.h
@@ -46,6 +46,7 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
 				   type ## _PWRTRANS, \
 				   mask, timeout_us)

+void panthor_gpu_l2_power_off(struct panthor_device *ptdev);
 int panthor_gpu_l2_power_on(struct panthor_device *ptdev);
 int panthor_gpu_flush_caches(struct panthor_device *ptdev,
 			     u32 l2, u32 lsc, u32 other);
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 5b5a82e15f86..5d220a0e2c22 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -4,6 +4,7 @@
 #include <drm/drm_print.h>

 #include "panthor_device.h"
+#include "panthor_gpu.h"
 #include "panthor_hw.h"
 #include "panthor_regs.h"

@@ -22,7 +23,13 @@ struct panthor_hw_entry {
 	struct panthor_hw *hwdev;
 };

-static struct panthor_hw panthor_hw_arch_v10 = {};
+static struct panthor_hw panthor_hw_arch_v10 = {
+	.ops = {
+		.soft_reset = panthor_gpu_soft_reset,
+		.l2_power_off = panthor_gpu_l2_power_off,
+		.l2_power_on = panthor_gpu_l2_power_on,
+	},
+};

 static struct panthor_hw_entry panthor_hw_match[] = {
 	{
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index 39752de3e7ad..64616caa6f05 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -4,14 +4,47 @@
 #ifndef __PANTHOR_HW_H__
 #define __PANTHOR_HW_H__

-struct panthor_device;
+#include "panthor_device.h"
+
+/**
+ * struct panthor_hw_ops - HW operations that are specific to a GPU
+ */
+struct panthor_hw_ops {
+	/** @soft_reset: Soft reset function pointer */
+	int (*soft_reset)(struct panthor_device *ptdev);
+
+	/** @l2_power_off: L2 power off function pointer */
+	void (*l2_power_off)(struct panthor_device *ptdev);
+
+	/** @l2_power_on: L2 power on function pointer */
+	int (*l2_power_on)(struct panthor_device *ptdev);
+};

 /**
  * struct panthor_hw - GPU specific register mapping and functions
  */
 struct panthor_hw {
+	/** @features: Bitmap containing panthor_hw_feature */
+
+	/** @ops: Panthor HW specific operations */
+	struct panthor_hw_ops ops;
 };

 int panthor_hw_init(struct panthor_device *ptdev);

+static inline int panthor_hw_soft_reset(struct panthor_device *ptdev)
+{
+	return ptdev->hw->ops.soft_reset(ptdev);
+}
+
+static inline int panthor_hw_l2_power_on(struct panthor_device *ptdev)
+{
+	return ptdev->hw->ops.l2_power_on(ptdev);
+}
+
+static inline void panthor_hw_l2_power_off(struct panthor_device *ptdev)
+{
+	ptdev->hw->ops.l2_power_off(ptdev);
+}
+
 #endif /* __PANTHOR_HW_H__ */
--
2.49.0

