Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE0CB1DBA1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 18:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E800D10E05E;
	Thu,  7 Aug 2025 16:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="bd/7pA9H";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bd/7pA9H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013036.outbound.protection.outlook.com [52.101.72.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3E710E05E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 16:27:27 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=no9fQrhRkzumWkbKULR3qsKvq2BokKzLsya37DrwMkh6Z6hOEMedHLlJsfL9UflY5uSLUrdwLNWbqNn/QtPkuPxuHErDvLgpOYakQeenDntENshJc2EPxBWOdIHYyeb6zk3x0W/hCqR33bGhVEjSTnS/IbrLh2CD9+MoCJnYyDDeXkOs1xwRbQJ/X6rNbiWAig79S5Y0QGZfxEKFHuwXhPcByV+wDOt58HvTJNIurzJm2EpMqot4seem6/bimeK/grv187aRJMmCyiyuLrJgC3n5RA4Bcl5VVh9ZtgGn8C5BczAJr6YSok6pGCEIv0yf82/NIjJmWAtuSKXPaK7oiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69tz7BkBZeaMynzsJ4gdXiZkv6CiI7d+q89jb8AndXs=;
 b=OhsqimMQpAXs3cM+k/D7R6LnzKixYrAOqMq+8wSS3VHoeUW6OBaCXBbsLyEKM5WP2AcHofEpARNqq5Zyn/eUWpyJmpcBAawOvuhmELzPq7gc9wP36q/DpN/R8kzc0uBDL3BZcENObJ2z4MfIIPEyi5fwRcBPI410QNufPEMhNQ8EAWhblCgtmXp8c4SVcSFpdWmWFH2iUmT2iF8Ku929ZGHW+KtIRUagkU5rwW8ZLnkFyqS1OQ9F7Q1RjFphuhaW7xtCxlgiYfHclcF23PDU8b8937gEVg8pLc2MDQK6DPNVAzV5k1xLbWFh+w1pxDJGO9ZpxCgiTCkz/Y6o8H3Jdg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69tz7BkBZeaMynzsJ4gdXiZkv6CiI7d+q89jb8AndXs=;
 b=bd/7pA9HMtF+lRMyZSubDauhD7gedBKx+onmWhvcCfRsnlXMTpwUr7dD/HZDy2QI2UG45DRLWtvbmmXbUjTOCyoNbTMRcQkZuWAKu6B2LzFM6traTxTj244K56FWAky8l8OJhOlDG23OJtNEvV6xksK7o447nR6MhHbJBhadvto=
Received: from DU7P190CA0015.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::9) by
 AM8PR08MB5602.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 16:27:23 +0000
Received: from DB5PEPF00014B91.eurprd02.prod.outlook.com
 (2603:10a6:10:550:cafe::13) by DU7P190CA0015.outlook.office365.com
 (2603:10a6:10:550::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.15 via Frontend Transport; Thu,
 7 Aug 2025 16:27:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B91.mail.protection.outlook.com (10.167.8.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Thu, 7 Aug 2025 16:27:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2hEvntGGGpei03Fuh/LfoB8zhox6VNY+RIUCMYd2eMi0BuzrOVzc4kGVVQk+vJOXv5rQk3yOLuLoDLtkyPp6BKByTWaChZYXkKFv+flJzayIBTXY7W37fQ58V8SnRi2bDpjOWrDCAwF+QkzpJpO2imz6Yh2Y1chfAUg73AYnKqWITQTk1Nm6Sz7xIG6+MBlzPkgnEnyDJQJAKbOZ03xfy4/bptiQ64SW+UiVlR4ueW3XltHwITMAImQaYdBbtRqzm8fZKcw0246l/zCg18FjlIo22a+8AKZpEJir8eqQn/9R5xsCrOhJWeDYQjz3FC8B9Trn3a8qznbNq3kc40ybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69tz7BkBZeaMynzsJ4gdXiZkv6CiI7d+q89jb8AndXs=;
 b=etqaFS5B1XAPvlcRbDoKH/qR2803dPpdvPL3yQZfUTOjyG3+delHIChoFHHb4J4kSx3+wCHflpcCzKBXaj8UKmmHeKs0IW1W/ykVC6GoqCf0jOUrJcC6Uo7Y39192r9Aqtfyfgsg+deRZ8gFQpSkavrGTEXFEyJ+GOcZ3ZfIkiPjjQo31XWh8cVKMhk0cPK2lypyAFRHWPxQdrdZ8ixs3YMCnRxEVC8MV624INHUwWytwERr6ZycD48RNfjMHgQwOYmGKn08lgZmgOfnCX56vCizbiZiWEDYkmQqA/NIXHR4wGDodNZhrkNAsTPWTh/dRp1CGD6s+Z8YcHtUY38aOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69tz7BkBZeaMynzsJ4gdXiZkv6CiI7d+q89jb8AndXs=;
 b=bd/7pA9HMtF+lRMyZSubDauhD7gedBKx+onmWhvcCfRsnlXMTpwUr7dD/HZDy2QI2UG45DRLWtvbmmXbUjTOCyoNbTMRcQkZuWAKu6B2LzFM6traTxTj244K56FWAky8l8OJhOlDG23OJtNEvV6xksK7o447nR6MhHbJBhadvto=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB9443.eurprd08.prod.outlook.com
 (2603:10a6:10:45b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 16:26:48 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.9009.016; Thu, 7 Aug 2025
 16:26:47 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/7] Add support for new Mali GPUs
Date: Thu,  7 Aug 2025 17:26:26 +0100
Message-ID: <20250807162633.3666310-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0431.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::35) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB9PR08MB9443:EE_|DB5PEPF00014B91:EE_|AM8PR08MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e067d2-071f-4564-791c-08ddd5cf4915
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?AaOv6IQRjUqMdI/xQOUTWIgCr96mwlpWEaAeWCmifb7BUsA420v3sTCvdZQE?=
 =?us-ascii?Q?A2dH3D+kee4tXob7iUSRbpCyYF/I45Tei+4la350mSgIZuy+0StKE9mon8rq?=
 =?us-ascii?Q?BlZ/MhcQsyg1mzMATHUQSHL2ivy9ZJhCgX4QG9khYg2ouSPPnRoK3tTmta+p?=
 =?us-ascii?Q?EMScWU6fLkKMNwxwh6QyVo0FKZacpH8SQnPhbfoJX2MNK6AZi/ov8ix9x9ue?=
 =?us-ascii?Q?RLfk2C003ulhaPdtEpKlbC8zWjillkAhzk1mM0J0/mUHYcnu+IRaQYRKmdYh?=
 =?us-ascii?Q?kSH4fef4BfQqyJ0WoLFgkF5U74Ziimol4KzGb198xoxKM6B2x8/Gd4uc3GIh?=
 =?us-ascii?Q?BpztvBAosJhYunuxEMCTmGJAiNf0x06wXU+t7LXOHbhN+bFj7iJUKzQrIbLy?=
 =?us-ascii?Q?Ag6qmVsv5JRZpHa43BSZJazpcTLqYqFS3nOfxc9XpUowm5s6OpxeVvNlQaFQ?=
 =?us-ascii?Q?4vkJuumpIN8ydLMY6IafuSE+BAUN4yVijokFBpuBoQvsYSKBrRlBZgXynYSQ?=
 =?us-ascii?Q?vthIin8566d1risNXodbJbsQKHwvz0TECqRJz6BSbRHgNUVU8tqs2d3ZrJy0?=
 =?us-ascii?Q?yXTNrr3X5FLu2h88NUuBUeuxwSoHtDEgUBWCW9C4xJvi4051geDmotYQ/Pwf?=
 =?us-ascii?Q?C/0wmYKttDBXulfexLsXsriGMCK7zRkRBy1kt8TOTTIB2fTgTKeO1QjnAbN7?=
 =?us-ascii?Q?1tKYWTYXdcEf2Hs6oJ/qE7EWVLn5u0ObCGWUACNgwylFSm7pPBSqibU3vYBv?=
 =?us-ascii?Q?eCDcxNbGkY3WXTivuNSsR/+ykvdu5R5btGfHXv2YKWkd81cWZDErPGQrgbtd?=
 =?us-ascii?Q?SPK1xhqnefJxdGAZ64j8a9zMYkHQjVAIdLuRX6E1NDL0i79ihsLZ6yShoW02?=
 =?us-ascii?Q?zST0hwFdw5tyctAmlhvKeYqv1Vp7vgInDYTkz5A0Zc9Bd05QTRQK0Dd9eaAC?=
 =?us-ascii?Q?Ai+WMwjG+SeT2Zc3b06iguoQj/e9AXSgOc6CL04hgprpUGxhtIfFGS7gE22p?=
 =?us-ascii?Q?8a3QUrTrx/+yM/Dg7d4McILtFZB01sDlXYuKYsGCrC0T0KhOD0np+aLKwYMu?=
 =?us-ascii?Q?Cw2gqB3mhMzXFLAxzUqGruu7siwZoekLuJ2mHzM3NmDH/9xi2ncLAsP7DkDC?=
 =?us-ascii?Q?V7hdGRfkRAofHC7XZtVSEUGseDRoQ883C4LRHtBRepT0W9xN7DvL4smq3rNO?=
 =?us-ascii?Q?b0t2LGxJp1TKigXHt4R7nsrApZ+SVAAxDhIJvFPKuUefmNE999ErmnQLx7oL?=
 =?us-ascii?Q?03jpGlbAHcjNhlRblfMKDB9lTVmbMGzMCKTiU0gGH+RXLPCEUf2iUVz9Kbid?=
 =?us-ascii?Q?pV08fMwRo2QOu7CfGH5z4NwserAAu1lc3RHYmi4RChDajfRofrypyfSNiOBi?=
 =?us-ascii?Q?rImf7RoCmNYDoSEJRGRRbxJf8Neb7mc0T/V86+HjpmhzlPkcYOuq7qZ/f8Q1?=
 =?us-ascii?Q?gQeERBPJnZ0=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9443
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8bb38d0d-2dcb-4d72-2209-08ddd5cf34b4
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|35042699022|36860700013|376014|82310400026|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2BxeAopJ4ZD2x+3frRMg1FMj4xF+QmTgFb297qI9ok5e6VOrkGk2K1YfFaJY?=
 =?us-ascii?Q?WtB4gHTFj4vhk1KQGHR2a9WFLbZyGSLbxVAysXp2dCFCMjt0kkm5NZPF1FWF?=
 =?us-ascii?Q?tYy5Ur8LDX+2fXS4Us13cpEtoRfVU5n97uvsnZFAIlYRr3zQ5SVOalDCbmYv?=
 =?us-ascii?Q?V/qspuXdV4CCWzk8j58xYXqxVDr3O4OaX67UuqDRf4xUoTgbm+Rc5nlT29k1?=
 =?us-ascii?Q?O447aXKpyBnURYd4baHDI6KCy/JHBVodJWTzGrtl0Lh5UVvyNkVZPZaLk49g?=
 =?us-ascii?Q?zuiIuGjp8JHsAa2+yUzesfGBw4Rnyv5Rm0dFL1iOnnugg19Rgg01WxwvyA0O?=
 =?us-ascii?Q?XKGa2aYpSROtmIzjzcVLQMwR8S6aJTmZXTE8bEYLpJvq1fG8G8y6KGVifJOJ?=
 =?us-ascii?Q?Tdy79emawACCNaMCEIlptQlt502CBMl+2wjdjwBO7jbJ2eVZyJlmO2s0DnCe?=
 =?us-ascii?Q?2Nt5LLLbOXQqNyDtnnsfK23VKwR09arQn/7qrj9rsXEQYTMJgGA8ejL43iD7?=
 =?us-ascii?Q?QNHcJOLquK6xita4y7mqRVLSo/SRF5Z4Yd6sG90iGVN79cm47ZhJdHLSpflu?=
 =?us-ascii?Q?DNiEYjSaX6lLs3DyedD4fVrHr1g6cPPnfh014kBVzR1DrsFQiQje+rG5IvLh?=
 =?us-ascii?Q?HDYSXKq3RpH0In6GXsMlpcTif3iUi2kcAjC81eRd1uf0e6iZB7Sx3OBKgcsD?=
 =?us-ascii?Q?2tk04aBevgFftGaTzLmy6pip4SjgWjb4a48FQAVRTUZimF5Ua0GC7naAgGCE?=
 =?us-ascii?Q?woScVBBN4hSFH+yifzPh/MDMulqs+7+Jm5tZIRCGPj/42zQx8qRxvraUyWOd?=
 =?us-ascii?Q?GOTfPURmv+PUYcn4zeXjt0s7Yq5I5H/WDnouDR/P5f0kZJu6Z6qRSUxz655F?=
 =?us-ascii?Q?hlXfLy+YqFnxnnxBfLuEqoNdDMwpau+7xCo0amd+5oVu5s0bdf9bCd0yRyFz?=
 =?us-ascii?Q?EE+/KT25M1twuJmAn3hDfyWeoJDS2JLOKdTUvXYPFI7k+y/XDV/b6URc+wlr?=
 =?us-ascii?Q?EGm8iq/2bhTh63Dz3S43q85BV0CNOAmMeFkcQ7F5Z2s/FlTiCjnvtplA+BcD?=
 =?us-ascii?Q?JKB7a/NiOagzhabPQwkTo1/RCHL3PV9gzJrkDX6mmlh/29NmhIMpSqZ9iZj/?=
 =?us-ascii?Q?CDDuFmvUA7guEKErrewb6UOk5AOX9WIrSf+P3DibwI79vlcwi7muVqk5XUvL?=
 =?us-ascii?Q?qqhombOKpLXPujh5NmtAN0WxwSU77fSnJUDlJZJW7hn2+YppkV9FGv7cLNGk?=
 =?us-ascii?Q?3PTCwWubAaxoAsls5scDZJs1sGk6IghRE5WwxL8CZsgVluWEkVyIPRcuUrGt?=
 =?us-ascii?Q?6aX/0Pqann69EEhPH7xkVnRG4iwGGNGXT2LYKePiI5zBRK1UxkM9qLjTWkCc?=
 =?us-ascii?Q?BrWTUzSNyFDVmLc0heClmoUlq9Z32m+TaDCg9sXwCfP0fPpKLL3WXpBY2hBF?=
 =?us-ascii?Q?NQn+lMfY8dp2O6daRqkf7dQ3qWU8HJNm1dSn0+Tn1dLmlgjoxvoPBV9taNNa?=
 =?us-ascii?Q?MUuHVWR4X+wCiPRDUm6/xVzXvopBu19csk0phiPW1oGfPtUneJrg7E6EGw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(35042699022)(36860700013)(376014)(82310400026)(14060799003)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 16:27:21.6475 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e067d2-071f-4564-791c-08ddd5cf4915
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5602
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

This patch series introduces some minor refactoring to enable support
for new Mali GPUs.

Key changes:
- Addition of cache maintenance via the FLUSH_CACHES GPU command for all
  supported GPUs in place of FLUSH_MEM and FLUSH_PT MMU_AS commands.

Firmware for these GPUs can be found here:
https://gitlab.com/dliviu/linux-firmware

Patch Breakdown:
[PATCH 1]:   Adds panthor_hw and refactors gpu_info initialization into
             it, laying the foundation for subsequent changes.
[PATCH 2]:   Simplifies the method of determining the GPU model name
             while making it more extensible.
[PATCH 3]:   Adds support for Mali-G710, Mali-G510 and Mali-G310.
[PATCH 4]:   Adds support for Mali-Gx15 GPUs.
[PATCH 5]:   Serialize FLUSH_CACHES GPU command operations.
[PATCH 6]:   Adds cache maintenance via FLUSH_CACHES GPU command due to
             the deprecation of FLUSH_MEM and FLUSH_PT MMU_AS commands
             from Mali-Gx20 onwards. This feature is extended to all
             previous GPUs as this method of cache maintenance is
             already supported.
[PATCH 7]:   Adds support for Mali-Gx20 and Mali-Gx25 GPUs.

v9:
- Added the FLUSH_CACHES serialization into this patch series as we
  enable its use in PATCH 6 for all GPUs.
  - https://lore.kernel.org/all/20250731130855.4068574-1-karunika.choo@arm.com/
- Picked up R-bs from Liviu and Steven for PATCH 7 (previously PATCH 6).
- link to v8: https://lore.kernel.org/all/20250724124210.3675094-1-karunika.choo@arm.com/
v8:
- Fixed missing new line at the end of panthor_hw.c
- Reordered Mali-Gx10 GPU names in arch_major, product_major order.
- Remove the coherency fix and SHAREABLE_CACHE feature from PATCH 6 to
  be upstreamed as a separate patch at a later time.
- Picked up R-bs from Steven.
- Reset R-bs for PATCH 6.
- link to v7: https://lore.kernel.org/all/20250724092600.3225493-1-karunika.choo@arm.com/
v7:
- Picked up R-bs from Chia-I Wu.
- Replaced GPU_COHERENCY_FEATURES register read with the value from
  gpu_info->coherency_features in PATCH 6.
- Link to v6: https://lore.kernel.org/all/20250721213528.2885035-1-karunika.choo@arm.com/
v6:
- Picked up R-bs from Liviu.
- Removed unused register definitions for PATCH 4 and 6.
- Link to v5: https://lore.kernel.org/all/20250721111344.1610250-1-karunika.choo@arm.com/
v5:
- Removed all of the GPU-specific initialization boilerplate as it was
  not being used.
- Merged [PATCH 1/7] and [PATCH 2/7] into one.
- Fixed issue with getting model name before the gpu_info struct is
  populated.
- Merged AMBA_FEATURES and AMBA_ENABLE into GPU_COHERENCY_FEATURES and
  GPU_COHERENCY_PROTOCOL registers respectively. Reworked the fields of
  GPU_COHERENCY_FEATURES and added SHAREABLE_CACHE support.
- Link to v4: https://lore.kernel.org/all/20250602143216.2621881-1-karunika.choo@arm.com/
v4:
- Split 64-bit register accessor patches into another patch series.
  - link: https://lore.kernel.org/dri-devel/20250417123725.2733201-1-karunika.choo@arm.com/
- Switched to using arch_major for comparison instead of arch_id in
  panthor_hw.c.
- Removed the gpu_info_init function pointer in favour of a single
  function to handle minor register changes. The function names have
  also been adjusted accordingly.
- Moved the patch to support Mali-G710, Mali-G510 and Mali-G310 forwards
  to [PATCH 4/7].
- Extended support to perform cache maintenance via GPU_CONTROL to
  Mali-Gx10 and Mali-Gx15 GPUs.
- Link to v2: https://lore.kernel.org/all/20250320111741.1937892-1-karunika.choo@arm.com/
v3:
- Kindly ignore this patch series as there were duplicate patches being
  included.
v2:
- Removed handling for register base addresses as they are not yet
  needed.
- Merged gpu_info handling into panthor_hw.c as they depend on the same
  arch_id matching mechanism.
- Made gpu_info initialization a GPU-specific function.
- Removed unnecessary changes for cache maintenance via GPU_CONTROL.
- Removed unnecessary pre-parsing of register fields from v1. Retaining
  current implementation as much as possible.
- Added support for G710, G715, G720, and G725 series of Mali GPUs.
- Link to v1: https://lore.kernel.org/all/20241219170521.64879-1-karunika.choo@arm.com/

Karunika Choo (7):
  drm/panthor: Add panthor_hw and move gpu_info initialization into it
  drm/panthor: Simplify getting the GPU model name
  drm/panthor: Add support for Mali-G710, Mali-G510 and Mali-G310
  drm/panthor: Add support for Mali-Gx15 family of GPUs
  drm/panthor: Serialize GPU cache flush operations
  drm/panthor: Make MMU cache maintenance use FLUSH_CACHES command
  drm/panthor: Add support for Mali-Gx20 and Mali-Gx25 GPUs

 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |   5 +
 drivers/gpu/drm/panthor/panthor_fw.c     |   5 +
 drivers/gpu/drm/panthor/panthor_gpu.c    | 100 ++----------------
 drivers/gpu/drm/panthor/panthor_hw.c     | 125 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |  11 ++
 drivers/gpu/drm/panthor/panthor_mmu.c    |  33 ++++++
 drivers/gpu/drm/panthor/panthor_regs.h   |   3 +
 include/uapi/drm/panthor_drm.h           |   3 +
 9 files changed, 192 insertions(+), 94 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h

-- 
2.49.0

