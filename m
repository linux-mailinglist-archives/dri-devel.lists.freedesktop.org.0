Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5433A91C73
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 14:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D522810EAF4;
	Thu, 17 Apr 2025 12:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="VKBhLv94";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VKBhLv94";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2087.outbound.protection.outlook.com [40.107.22.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A23F10EAF4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 12:38:12 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BjVA6bsdKBwuozMkbCS1ZS+9uyNTAkm+CTWTrHQo33XnJM4fIZ7rCFKgc2Rk4Z0ep8QvbAbLaiuiTIfYxwiDgA08l45+lKFSKDmlhPaYfsJV2Yp13fXkjzQm/pCM2gh4+N9mrXRsp4Foq5x/7bYl3H4hR19GmPPoYpuUct1wlD1E/9NwS7rQvTaNtAjEXa5EXJ2PqXzn7dXgNUAQDxyegfh3cddl9ACjS+q6US/cptikFUl4iY04kjn7fLmM+hEsM8QfD22u/RMYkQREn4ATVZqk7g/wTJ9jRbdEElstxjQYjEY3k+CEJrVFwDd9J0tB1MG3oA4MdInEUSYSc5AETA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exT6HbrUjHcLAhEaDpu/5dSs72NYlHjla28zhU7bNdI=;
 b=tII6AOQY3wEctkepl9hh5KipOnmxNT7fOrfqAel7G+NayENX63j97OkAhHLsnpRV/EtwDJVRZ3lyvGKjsunXzsFBFGmB+EJfcvuZm6rYcq9yfK9gEJ2W/xgawrM3XeuXSEq3GtSe12g2CTX26XzLUcJoZKH/i0WC/lSJblZg0K16wLpRf52kX8qPe2qh6BaWDcjE4FezCDT/aXa8mDWS/L9RWXpDGYi+DZdU5HUozChWQu09QC9aSawzJgPx+7exLpZ2WLeSO2yOpOpenYAdMEJRtcFSRn7phDzgENee+7qKshY3aPPrWMSQc9g6l2MZ/RJSUz5oqL0i0vXRZELzzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exT6HbrUjHcLAhEaDpu/5dSs72NYlHjla28zhU7bNdI=;
 b=VKBhLv94sWmmWwU2409EISWRafrUl+kI607jtTDp3skepu1UgkIaZIp3VJ1DsGCO9khJYZJ2TRD9nYFaitvnj9qwivQqiQVclgYJALBE7/kouwQQjUN0fpeE6J9yoS0m7sADiKQJNule3FE7/rP4MO8H9fBFrQHmsC7cOKBicdE=
Received: from CWLP265CA0412.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b6::23)
 by AM7PR08MB5301.eurprd08.prod.outlook.com (2603:10a6:20b:dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Thu, 17 Apr
 2025 12:38:06 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:400:1b6:cafe::93) by CWLP265CA0412.outlook.office365.com
 (2603:10a6:400:1b6::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.36 via Frontend Transport; Thu,
 17 Apr 2025 12:38:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Thu, 17 Apr 2025 12:38:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LfsS/UKjipdrHjR/Dg+p1Kz4MXfMld5LQSeYhOjLO95gHpwewG5jCZLNl1bzZVNFN2CRzssjkmgcYozDPFv8omaW8xaSRB5SaFxdrgopcsRinLTW7DItw8sp8X5IWtC/q3Pl2i5V+CKRqTz5ck4qq1TKUcSi6ut45Gi3oytRKLAUtGYQM/TY5v1nR2nU20Iyn0h12gkenGCk84R8HuvpOyq4xnDIV0MT2yh1SxbxnwEmOi25cAmbFHiOZr0n12K5XeVRxObhqvlvKvSjgzTiGKbVYy2TKuCXM9jNKnWrQ0UQWzOt032mGrDllpVaY6aS6UD7h74cNTBBXV42H6sgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exT6HbrUjHcLAhEaDpu/5dSs72NYlHjla28zhU7bNdI=;
 b=GpCFLy1gPrNIwi29FKXJmiSfOdrpI/sJoV7DV0119PgaLQj3drt5qHDzqd6Zmc28gFwebeSd9heheRZxuWG1azZsP2jNPhYRkeTkfG5lAkmqCwuCjhZv+7buDF8sv56WI0qx2umgixCt8Mof5WhiwVdCa71rOW6nC9BTp8eo/S1E5jskO5o1GKz3XpuZ9HOKvhlI+K3bmrrVXir4eyFUWgrg+t2tPTSfHKssDBbsZzhPCNWgrt5HjBTBCBnzvCjAG8L2GdHa1dLDKCf34GxHwby16FPj+IaNljJ4EH9SYDkLy/W2CrbWEM/6fP5V/O+eRoyXSCnLAPGfU0aR8JWpxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exT6HbrUjHcLAhEaDpu/5dSs72NYlHjla28zhU7bNdI=;
 b=VKBhLv94sWmmWwU2409EISWRafrUl+kI607jtTDp3skepu1UgkIaZIp3VJ1DsGCO9khJYZJ2TRD9nYFaitvnj9qwivQqiQVclgYJALBE7/kouwQQjUN0fpeE6J9yoS0m7sADiKQJNule3FE7/rP4MO8H9fBFrQHmsC7cOKBicdE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS8PR08MB6023.eurprd08.prod.outlook.com
 (2603:10a6:20b:291::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.27; Thu, 17 Apr
 2025 12:37:33 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%6]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 12:37:32 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] drm/panthor: Add 64-bit register accessors
Date: Thu, 17 Apr 2025 13:37:23 +0100
Message-ID: <20250417123725.2733201-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0222.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::11) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS8PR08MB6023:EE_|AM4PEPF00027A63:EE_|AM7PR08MB5301:EE_
X-MS-Office365-Filtering-Correlation-Id: 1684f4a1-8fab-471a-7757-08dd7dacb340
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?JXMDLymn0b6igGKoJyLNg5lkVVnAFe7zUcOYKRTV4ntxjksTS2bskuWTe2VM?=
 =?us-ascii?Q?RM+fa34G9Y/FZNRLlOUgYPSSMixmKr0BzD44AaJD97LOzJ7gpUwjXVf0UYnR?=
 =?us-ascii?Q?Ddo0b/PCbAQ9Wmzdhxxa5wcAcup4KIUsGHJqoGgKk80ik2uPMVTFXzfZf2BH?=
 =?us-ascii?Q?pMUhEDmhsEknPLF9mSeD4mP6FCVbQ/sKqfe1xyf6USqBG8a6uTLLFNhgXp2c?=
 =?us-ascii?Q?GmTcGFNrEehXz8JLScp0KnA7OKoL+wXzIuinQGVtsG/hl1eL8JKyJ5UbXkpO?=
 =?us-ascii?Q?H7sL21CDNbBzIw2tZgcQSZIMnEhUFCzESHhY72qBfZzfp3SqJsO/R+E4xmHO?=
 =?us-ascii?Q?nUK3Q7ToQ3R3FaiknlLL2mxig50DyO39Wl2MgLZmIJoVE9NdoJJUUmzsi7MJ?=
 =?us-ascii?Q?9s7wHnj+nbuhFKAORWK6ksqi4RQDhCDuWhdeURVMTBBQx+D9Z4XiV8FeUx2w?=
 =?us-ascii?Q?/VzmkFlw2AGbGVOevd97CdlnzlFZYEFFdMephq9a4eGT45rrwyNK5Oib7CUa?=
 =?us-ascii?Q?YMqZHe2Cvvv2Cz1QvCdTOWYyLENVpnTDiDWJLDyFePCAa7jW6iYVgp+rZ2tX?=
 =?us-ascii?Q?9K2Fgm6oeofXPo6i0dbYkrPG9HEx5DWMla8L+B2fbeojHLInCmAq0Atx0gqp?=
 =?us-ascii?Q?vZNb0dPUfE2K5HTEb2DVtljx2ZndUs+2ThtntfMacCsPZEIgk8n6Egn6nLQX?=
 =?us-ascii?Q?Ncon62Dsq+YTLlxFWrgyQbx3NJE101LzS8D8wnhk/qJmD59YPsvI7JKV99Sx?=
 =?us-ascii?Q?qFeCCxVFLWUVvZxKDxdov5OVxwRpEgXC5CthjN7GKjNLytyAUh25aJykuqYY?=
 =?us-ascii?Q?KwnsXxFM1YsdHQa9q3doUefPmLifq+VBXlo6OVUGUDGe3Qs6B31DXLUtkGrC?=
 =?us-ascii?Q?ocNwhaV1RF7uPhT5KScYJb/Ax9WLZCQsXgl8/xmmyJdSa5QFcwfcRP4kGl4h?=
 =?us-ascii?Q?2U8b1w+941ViTVvbeY4drlMxGAhy5zZi8RIFuyX+fqvVCCiDOEzbnpcW7mxz?=
 =?us-ascii?Q?47lUJiX8P/VXiAPdkAUOsofWk93plq6ZsIbDOLnBmSEFYPzYjrx4MO4pYq0v?=
 =?us-ascii?Q?z9b3kvGzsKaJ2lVsvDtX53ZGn01er5IHcCzhAF5uGWTZ4V9XTX1aLlExJ7+H?=
 =?us-ascii?Q?2SEh1bjXvO6IjiZJNKweIOfoNgYpPMNwkIc6LCkeRhi6KL4FNzd99t48pYet?=
 =?us-ascii?Q?7Sw20MA3cw4vv+dJ4uoCHfIWjPlAQMjP6h9EpUq8j4uNcYNjeJIhqel8ddy1?=
 =?us-ascii?Q?RQzpOEL+j6ujo2BO4hjDq3cKBtMusculB+DXkFMIjAAQVKCV2kGjXyucLnUA?=
 =?us-ascii?Q?JSv9x1rjcS5TGDE+W0QOeQ8x+/v6TOQrVHr3yBpINdxOOcB7B8yE3SKk4E0Y?=
 =?us-ascii?Q?A8yJy3ueA3TLPEZd6LPEFooZmAHg2zOqNY1tYYqzib1BvzAYiiJH5QOZMBzo?=
 =?us-ascii?Q?fd34reV9qBg=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6023
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e1904a08-cd5e-4ea6-9d87-08dd7dac9fd8
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|36860700013|1800799024|376014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p5vlRnjrvyN2sokrGmz9117sHWDl3DGv0sy9R6U7sgVSfvgsysRojbCE2xzg?=
 =?us-ascii?Q?nXu2w6vz1zbCKcU3AGIhfBstMpI2tmSH3eiAgeV3rodoI9BJD1HeCNpMTbqN?=
 =?us-ascii?Q?KuifpTknRlgbJ+wD+yp3Zfz5tw78B6TW0xy6T1gQZzUCufeb2RqzhiK9H9uG?=
 =?us-ascii?Q?DvylzyYINrzdL7VNvTdpiN+HFXc4xb5/RT5IrQ5cNseupIfd4rm+Iir5VDOh?=
 =?us-ascii?Q?Aj4b6HFXjxkuqfARkElAnMxlJRkU5G+oMKleg8xcZ3c1ODWPYwE8Qa9fBCS2?=
 =?us-ascii?Q?G9ZGy3OK7ROKxrY87/Vky+BL7zIOJxzejVAPOZKbLItDTnGO4eEAssmg/y97?=
 =?us-ascii?Q?Us0ipi5O9mgtNB9MC8rrqRzrXVpt3d8NhqsOSYd/QYwNXhvU0FHdMAKANxcb?=
 =?us-ascii?Q?I01Xt9TcpkuSpOWfkMz6dzmcAqQis8y1CnU0CTxCkVKuElpxGEuAOl/cDcdg?=
 =?us-ascii?Q?vS8w5xuQhE1bjcjzgNcKrARg5vtT9Ed1SSKTMl/+gWEE3ntvTCBOykMWI2M5?=
 =?us-ascii?Q?/k81mDAeKmpypy7VaL6SeHd+5NRuqIPjQrgrItV+SH69CNvZOitwnX2s0cMy?=
 =?us-ascii?Q?xOTytxyA/2SJJyWixI5vTv9msLvS4Z0jXgPSuUvqxBxwpn0DFzGjTXQv5y7o?=
 =?us-ascii?Q?h4q8EH7/A4Gt8/vUNuWU9/nmMHuuZ8svM65fPxi+UtkraUaDzhfUg+sq5H7Q?=
 =?us-ascii?Q?IhxJwdIf5STX5xkJ+HuNuaoR3o684nwCuKGW/uC2kCy26U0TGVx7sBYedz9h?=
 =?us-ascii?Q?P4wHsu9F7vUTHqF2a2JpadzM/ACzkpDqVbS6ud+/+4miYsEY6MWnl1vpoMv1?=
 =?us-ascii?Q?AQtm5/0VWplZ+yn5Zby6NlEisNkXZ5HTmNueMOBu+ApzRMTGu8sM3QZfhoVu?=
 =?us-ascii?Q?PnNLWlMVt3W3k135ZZ/5lMUxOmcDc4NJ/qDh8TKdSwx6mhhtRWtd/3+TNa8v?=
 =?us-ascii?Q?RHx3qY8bIIJTo5VVFZMa6NHAVNSAlAjNVtxo8PyWQct0Ezw/urWspQGtGqon?=
 =?us-ascii?Q?/YjYIvTp/UeEphMwmFThVzMEfx+eSjR6PgZd9AXMlNv9CMl6GUldde1No4My?=
 =?us-ascii?Q?flUfk7lB2GRIYdlI5h+uiEltKaf4k/6fPZD5Y6Blfi+ls7nAx+ivHO36BXWm?=
 =?us-ascii?Q?LXNzHG6wbTZVJ7pkhZ0Be2w3CNcERRPzIe423mVEDmUrCjPDoiIPMOBiLoip?=
 =?us-ascii?Q?8cvh1FkRRmH0WBfBFA8/MVnanZ3JmVRgdIUhXT4eOQLqArrwxtRuOhwJPhO4?=
 =?us-ascii?Q?1OUdu1wG2KzzvS5CvmiT12xn8qZQiMLsgL1QzleiBUoVOwCeQ6HveW9wjMNJ?=
 =?us-ascii?Q?kqIdDVLDW+76CpoRHuZMm2P1qmH0B3pSc4BFd9NpLvvn4yKCSoyBIyY8MiXs?=
 =?us-ascii?Q?GUaLoeQmH3sw8ybIt/dll94T9Uvq0OM+YzOubyPi9UrqAtYHogp/FPhAf420?=
 =?us-ascii?Q?zOx72G+3rKHoFfLsCHtM2TVuNTkhp58Y17w5xvhierkFZwi7ExVn0yan57MY?=
 =?us-ascii?Q?X6dKmRa1+KDAMf8IOkWYb6RTcov830b1RL0c1Xcz+nIxf19qaYDJ/eckCQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(36860700013)(1800799024)(376014)(35042699022)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:38:05.0734 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1684f4a1-8fab-471a-7757-08dd7dacb340
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5301
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

Hi all,

This patch series adds support for 64-bit and poll register accessors in
the Panthor DRM driver and performs a cleanup of the 64-bit register
definitions.

The first patch introduces new accessor functions to simplify and
standardize 64-bit and polling register operations. The second patch
refactors the existing 64-bit register definitions for improved clarity
and consistency.

v4:
- [PATCH 1/2]:
  - Fixed missing check against mask value in PWRTRANS register polling.
  - Removed panthor_gpu_read_timestamp() and
    panthor_gpu_read_timestamp_offset() in favour of direct register
    access as they currently only serve as wrapper functions.
- [PATCH 2/2]:
  - Updated the register names inline with the removal of the two
    timestamp functions.
- Picked up Rb tags from Liviu and Steven
- Link to v3: https://lore.kernel.org/dri-devel/20250411164805.2015088-1-karunika.choo@arm.com/
v3:
- Picked up Rb tags from Boris.
- Link to v2: https://lore.kernel.org/dri-devel/20250411151140.1815435-1-karunika.choo@arm.com/
v2:
- Updated padding of the poll functions as requested
- Removed *_HI register definitions and renamed *_LO registers
- Link to v1: https://lore.kernel.org/dri-devel/20250410163546.919749-1-karunika.choo@arm.com/

Kind regards,
Karunika Choo

Karunika Choo (2):
  drm/panthor: Add 64-bit and poll register accessors
  drm/panthor: Clean up 64-bit register definitions

 drivers/gpu/drm/panthor/panthor_device.h |  71 ++++++++++
 drivers/gpu/drm/panthor/panthor_drv.c    |   4 +-
 drivers/gpu/drm/panthor/panthor_fw.c     |   9 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    | 159 +++++------------------
 drivers/gpu/drm/panthor/panthor_gpu.h    |  12 +-
 drivers/gpu/drm/panthor/panthor_mmu.c    |  34 ++---
 drivers/gpu/drm/panthor/panthor_regs.h   | 100 +++++---------
 7 files changed, 162 insertions(+), 227 deletions(-)

-- 
2.47.1

