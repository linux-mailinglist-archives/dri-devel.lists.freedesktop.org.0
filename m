Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4F0B1DBA7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 18:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1583D10E88E;
	Thu,  7 Aug 2025 16:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="RWrX8PFc";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RWrX8PFc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287D410E882
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 16:27:53 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gKXdmhMqU8VM6EDAPBTA7BChMNMgbmgYDrV62J9uA45Kwxx033QttKeYEkhlizm/y2p2CNLcoSDknrDuwZAr2SaK+FfwMj6b/LhfvirIUL0U6sXS+1vfdX9XR/nub7p5Ib7yIHVqFFXld/zd3PA8zl/vFcteHlGsD2vv4ZhiU+AbK0/7UeqegO9pCt6TwzYNdranzoa2v2B5X5ayfXGa0MIIL9QoHzgOFYSoyQ8HBkyVUyd6HLgvu7o6OHCCEXJMHGeKWNPUjdgIYIBlHDMvnprMoxLiPCvWy2Bqme1Z0XqNkA1HGbdij5sutXjTvLX9rkGIXe2hElDdkX4tR4uPlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cX0lVxuc3vcustMH6MsbS4CtipjD5IDpDsg7l0aUso=;
 b=K9U8kdOocuhmgqNeHxYurUK8XPFu6HNgJbPlg9h/uW3E28CAahbFnvLAQEapd+xj3pVN9VzaZ2KdPrxziVTtueqVmkmtiJxBNi4aCNgtrErRuOGkJdY1IdW1LL4KZwJsoNJ+qgx153jxJ7gSruOpSR4zhrP3f8KLPILfyNSo15Yt672z1MXHiOkor2kd3rQk7U4fcm/AXx776Bev2hmlMvIitDuL57kGTruiZxFFH3tUypA16Y2z2iZxOpyGmJg7C6GPleK6cwc9Ov4iEYSQSlRQ5HpXRnJvAKWBgYOj/Y6A1ceu85Fd4MGngQjOFGQzyMX2NfyHVtaKbfCdjCdOzQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cX0lVxuc3vcustMH6MsbS4CtipjD5IDpDsg7l0aUso=;
 b=RWrX8PFci0kI3Q/H+JHCDSoZn5AxontxyGjTrT16zIHhn+8o1lDVsCkY6EYD6v2i7rTT3aeS0ZSAyg6CVyXpDU2STJyAggRMAzK02NY5VHgyiOxERE6VDUZaHQrdL9NiE91gfosrT0xI3XIorYmQtIKFwJ5sI2uv37/B6dp2C0Q=
Received: from AM6PR05CA0004.eurprd05.prod.outlook.com (2603:10a6:20b:2e::17)
 by AS8PR08MB5943.eurprd08.prod.outlook.com (2603:10a6:20b:23e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 7 Aug
 2025 16:27:49 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:20b:2e:cafe::57) by AM6PR05CA0004.outlook.office365.com
 (2603:10a6:20b:2e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.14 via Frontend Transport; Thu,
 7 Aug 2025 16:27:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Thu, 7 Aug 2025 16:27:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXzkjCqtNOKu7XWfc1at6O42pDCt/4mNAs1HQ21LljDHCChnVSpNRNPMpc27UiNHnyYzde3JpVzFv7XOomABWr73KtwQZEVLpsGH+tME0MHgxtMLcz21iD8Ex26zdjcGztQL5h2vY4/kIyj3hj8qmsDgb/8ro2KTL7muY08+EO8oiszd391b9o+kVDOsj6wbCDE/zhFsR7qiyqopYUMlPkOI3RveANxIG+vWDf84QBqWtHPH9Vpof4KBKyqTqHXeY4Z9tsjppNA93QlHailghBgmtbtXVAEfQFBYnXZH7WXBwt/BWKV6Xf8Xa9PIcScPF0frhez6tfQ9qKfm069tgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cX0lVxuc3vcustMH6MsbS4CtipjD5IDpDsg7l0aUso=;
 b=SQ2VfQyf/eLuNTtGWrpE7MtAm5FhWrtR3wjCXXYWAy4MSwrNtE6oVKqJnTE9LYCzXWZyGfek7XoCJAHJ8/yiSvhueJE6mG5lie4W8oH3pvxRKk80GDXmb1eHp6AnOXuHpCeEiGqZtdli6sG0XRSDnk69XLeIbOFcgW2YZCA8Wf4T/efbHC+pQaWmUWK9wdzdN1IUf2cOnea+qsVXL4EgFvuh+nHBbKsbHE5cVRegh3hkvmzrj5MZjc5PLCjZstLPiCRWu3qaRNxoPUM3bWwTk+6+Ct89OnLS9ZaEwJeyslX4QArgNVlScW6bSWcLKsjBisR/urGxslRYt4yfbgLevQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cX0lVxuc3vcustMH6MsbS4CtipjD5IDpDsg7l0aUso=;
 b=RWrX8PFci0kI3Q/H+JHCDSoZn5AxontxyGjTrT16zIHhn+8o1lDVsCkY6EYD6v2i7rTT3aeS0ZSAyg6CVyXpDU2STJyAggRMAzK02NY5VHgyiOxERE6VDUZaHQrdL9NiE91gfosrT0xI3XIorYmQtIKFwJ5sI2uv37/B6dp2C0Q=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB9443.eurprd08.prod.outlook.com
 (2603:10a6:10:45b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 16:27:15 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.9009.016; Thu, 7 Aug 2025
 16:27:15 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Dennis Tsiang <dennis.tsiang@arm.com>
Subject: [PATCH v9 5/7] drm/panthor: Serialize GPU cache flush operations
Date: Thu,  7 Aug 2025 17:26:31 +0100
Message-ID: <20250807162633.3666310-6-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807162633.3666310-1-karunika.choo@arm.com>
References: <20250807162633.3666310-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0285.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::33) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB9PR08MB9443:EE_|AM4PEPF00027A67:EE_|AS8PR08MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e42d3c-7ef2-4dca-d216-08ddd5cf58bf
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?1viBti3kIBmQxYe8XABluHeuWApEjjNdpgZWg1YIlouTiBEbiO+s2CYmYbgY?=
 =?us-ascii?Q?twoCL51hECaYvypZql9PFPwid022oLgsGJllLiLf0ii78BHlLqxEy6iHXHU5?=
 =?us-ascii?Q?7Ac52JbU7iw6+Ebjq/rdGJiWCHmHZZ0GRRtpd8Lva9rOCLQbybDtARrhygzL?=
 =?us-ascii?Q?YGU6KSEfnp1Z41HLwoI4qg+VXoymUWuARympzF7ckP2BhqrTh3oXzdSmimt0?=
 =?us-ascii?Q?YASgSbV44FyNRwOovbKtJsQV5b/f8kyDq2cdjPGcLvWUeqSrghF4J/7XrGPG?=
 =?us-ascii?Q?DCNuSF2a5fGTcgQMuaxbefJMSEuN2a/0InIzi6Efw476W7Bs/ELJh73K9WRp?=
 =?us-ascii?Q?Hx7AOE4pn4mAk8e3jmvTnD5e9ZpkC/oYfWlrHOYiH4+om4lL5WT6XPrnpO2f?=
 =?us-ascii?Q?R1aUOW3M8LJrqNlzw56YioM9ajLNxruRMVfHhAleIWEWtDdDOCdD81HLnXix?=
 =?us-ascii?Q?C/l1h5LgJ1d9PRlRo1zFjOw9NREr2qXvV5f6BM9wMZC9a5lQ0MKDlrZVAop8?=
 =?us-ascii?Q?CiYvJH8uwmRNe1NHq5pyLxJKmAuIuW/0JlGSqgmFvDxjtDF8CzdQODcrF4Ay?=
 =?us-ascii?Q?818koypH9nnQxpiNkZD7F5dSQ5NVtorOxrGsuZgzWmJlJJnFwmAMkj/87X+I?=
 =?us-ascii?Q?Gl/ClvniVlma8CuNjVhD6KIIw2vYo7ZEabd3hHdPM86qtANTQFUe68NvUOPl?=
 =?us-ascii?Q?OcmRAiGvsoHeAbpt5XogpRogPP8esYYDrHdWhWJRFc+x0ivQadiz3IrozKRc?=
 =?us-ascii?Q?1hmsvacbjE/t25cMsGTM3yXA4UhmIWf04+1uZI5nedudqcFJyZdAcpFB8OYA?=
 =?us-ascii?Q?CpLp+ZFsZw8UQdZoGyiBGUk7O58x1pUSbKILzcQpuorBue1reeY7OQd12XHJ?=
 =?us-ascii?Q?bK8JD9TIo/StXWcSqTPg27K2Zh6UWXXL3IH52CrDncxDTrAV+o3d1ZtlSUs6?=
 =?us-ascii?Q?aala13XQ7gmP0qZH3bDRMcxxRkPefFnzEno8QpbE+TrOAI9Yth6VypKNXoId?=
 =?us-ascii?Q?7/jZK1idU3a0UTh1nY6WwSgDUQnNm2a7MWatS8w9kWUJHKbL9hdR+aGLry/8?=
 =?us-ascii?Q?O3ba8c17LAyP1GFQ7ZZ0yZbbKdc61R7/EIqQfJ907p2YtNfT+6cP0qI6Ehvw?=
 =?us-ascii?Q?IQuPOLXPFHlkL1vJQ0HmBHcIULm9VI4Kzz9bKXxj8KmktG/iqK8ORgtqnzzH?=
 =?us-ascii?Q?6wfjHy9c8SCwNlk5nMNkCuienVzG+5QBiii1rrwsorSQmgybmlUimJVImHfh?=
 =?us-ascii?Q?07wZKYgJihMMci8mSeCkF8J23Lssj9GbWuGOAoj3+sxitbo27HiZmqGB+qa5?=
 =?us-ascii?Q?PY66jLaTZirIhbN7Ad6ETJ01nxdjlpRuofHijV4g2GUfDEtC7nn2DUeCkBac?=
 =?us-ascii?Q?isRLV4n2ezgzosnnsayfEkfPJIf8nJcO6ntJnRUpm3jxI4Io42MZXk7H1cHV?=
 =?us-ascii?Q?KEGmdNZ4eEk=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9443
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4a51f9a7-d502-4f12-fdec-08ddd5cf4569
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|35042699022|36860700013|376014|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wnP/tgdWofVWOH7i/rdDei/wxxGXUacw2jThOOM5giVSl1rhCcwW7+jTTOTE?=
 =?us-ascii?Q?Le1cqTpu94dZsoY5oLS5xiAv721gcKuV35/niVJcdheBxkHBf1h5jDROUgsX?=
 =?us-ascii?Q?30o/ByfzVlMB0aeWidEfaSuCtxlsEzgPC1ke0NH/tFfI4++6pn6YcVzS2m8y?=
 =?us-ascii?Q?/yibCefVOt7F0xYM3P/0MnmaqBV1s6LecP2nMKGQVqHBJmKEQUnIKvXnZDbE?=
 =?us-ascii?Q?95PC+yOxgN59fix1MPmiljp3wdOeyPENCldeB7V4dk7GWzfbW3z0lpWmVtMU?=
 =?us-ascii?Q?5bKR2khe2lGDQPN6Zrwc98r1eUP8W1JAkH+xdSdyweWETCGLjyMoZkJ+uw7A?=
 =?us-ascii?Q?1bz6gtXdZFOXAJ2Lo+Qrc4jwWS77Tg5NKez8csWYxOeI1UIbmsYtyfwCaqh+?=
 =?us-ascii?Q?QDGb/y23Gx4rEpULl8TM2mrfApqv7foa3tShsjgqGVocmxSfQibAGhYw9QxD?=
 =?us-ascii?Q?aQbRw9DXGhqsPT3GGseYYqTqtNE+OVTKbWU+Lc/0a9Et2ooKPKmHDTaxWBwV?=
 =?us-ascii?Q?gztdRUHhPuxdLcZRqXQMyJ2WKVcq6oLOh+/LTyWa9nYxI5fXbJAzMUyNSGpg?=
 =?us-ascii?Q?3yrpGgmHNdxp/ehgPwOEJnRcSzZ0KO7r+oNG+TXL86vorPa3tHp/Jt9OtztO?=
 =?us-ascii?Q?CbxK/iQf3LmU21ZeXPHIewnXVnksFy1+2Gd3dbiT+hV7yIED5zO4hWrnkQP/?=
 =?us-ascii?Q?SKyM0u3k1eSV7YJlD0QklVYORjCQ1YGYCKqhOzAMRGG4CxwDPwz51z9HXD47?=
 =?us-ascii?Q?fRDE5zTBHoJtNUaG0vCjkhHkU1NPsj/TpVbasZah9TKhmDRLHwy/sIkhbx6Y?=
 =?us-ascii?Q?oFRLNK8ttaYds1I4X1OBJ+LQpxtTcgsKttbwUJGXioFeKGg3XzRFZvhRjcBG?=
 =?us-ascii?Q?DcekcRUxyWZYjp+j8VzTL7ampFZaNwjaAN9ef6CuNKKtVdLo8QnshZ875pV5?=
 =?us-ascii?Q?FpuMEyhAhd5wz6bzba1kv1vLFttSmWwgL6jf+EDtLEsONRRtVFwAe5HWoDC2?=
 =?us-ascii?Q?PAYXoZpuNOwJKq+hUJ8mEomokMTfvTb73pk83BFssixmNSZH0ky8tgkker3T?=
 =?us-ascii?Q?qGJUXFR0FaZlAq0OVcueQB9JqEHGuxP/5dhyWsa/Vhv33zWrnB42IYYqBY4z?=
 =?us-ascii?Q?QAr4IxJ/nXZrlQJWU3vJIEnMtRQklIAYbK8gJxSmtztIgzV1C3uyRksFJUcv?=
 =?us-ascii?Q?USqqsFrqC0cE5OgfcP729o8Dy21JJXI1s4TNjlp/EdCdqkFX1ZJZEXKov/CX?=
 =?us-ascii?Q?DAwppnKxTz0j6GC7iQ831UfVj2TaRcRqmFQPDL17l9TR/VtWhITHpjfnL6ut?=
 =?us-ascii?Q?06F9gPzoUkOEgr8HglmHS5vdEoXHI2ZOKL3jI7f5r7IhaHTRCyVcPaHBPM32?=
 =?us-ascii?Q?vbR6Wjo92UHLdZfGUhW/9sdMRWHd7wvyaVlNLZ5NSon2ZwuMWkXVpoZ+Gb28?=
 =?us-ascii?Q?eThvqUU1hhfWF3Oqw7lFAF0fkG3b3sfwaCrLYAcpxm7KFbKl05kEtWznhn4x?=
 =?us-ascii?Q?MF3gKjyx1AGeLvzHeHsti7jF+gskudRymEwq?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(35042699022)(36860700013)(376014)(82310400026)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 16:27:47.9537 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e42d3c-7ef2-4dca-d216-08ddd5cf58bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5943
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

In certain scenarios, it is possible for multiple cache flushes to be
requested before the previous one completes. This patch introduces the
cache_flush_lock mutex to serialize these operations and ensure that
any requested cache flushes are completed instead of dropped.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Co-developed-by: Dennis Tsiang <dennis.tsiang@arm.com>
Signed-off-by: Dennis Tsiang <dennis.tsiang@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gpu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 5e2c3173ae27..db69449a5be0 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -35,6 +35,9 @@ struct panthor_gpu {
 
 	/** @reqs_acked: GPU request wait queue. */
 	wait_queue_head_t reqs_acked;
+
+	/** @cache_flush_lock: Lock to serialize cache flushes */
+	struct mutex cache_flush_lock;
 };
 
 #define GPU_INTERRUPTS_MASK	\
@@ -110,6 +113,7 @@ int panthor_gpu_init(struct panthor_device *ptdev)
 
 	spin_lock_init(&gpu->reqs_lock);
 	init_waitqueue_head(&gpu->reqs_acked);
+	mutex_init(&gpu->cache_flush_lock);
 	ptdev->gpu = gpu;
 
 	dma_set_max_seg_size(ptdev->base.dev, UINT_MAX);
@@ -258,6 +262,9 @@ int panthor_gpu_flush_caches(struct panthor_device *ptdev,
 	bool timedout = false;
 	unsigned long flags;
 
+	/* Serialize cache flush operations. */
+	guard(mutex)(&ptdev->gpu->cache_flush_lock);
+
 	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
 	if (!drm_WARN_ON(&ptdev->base,
 			 ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED)) {
-- 
2.49.0

