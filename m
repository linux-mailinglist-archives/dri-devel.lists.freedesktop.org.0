Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4301BCBF2FD
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 18:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951F510E59D;
	Mon, 15 Dec 2025 17:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="fuOA8nLH";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fuOA8nLH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013049.outbound.protection.outlook.com [40.107.159.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA1E10E59D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 17:16:17 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mEwUjAm/IpVKJOgGGyHHnmnntukQ3B1WJ0UoQo08X1mzJ/kcFZBy7SmVCFDz/m5hqCDgMORlXQF+nTYb+Zqiv1ACu8YXCUx9lomlVso1BgQZZKBzpZ0Igch1xXupcjnjCltT1mQ68uxjwZ4kFu7zm0TkdeI0IOY+GWxRVpTn5LWt5fF1DX+jKWAJzxM+YWKWPHAxLfgTjKl7KbloD/WQJ3BvFg8JZBj5CNkSno+tyyOMasSRW7tiYkbI+TeVAJbjFJnjruDbbgXsi2kga8GlsnWgvUneapXdIJia/KBb7elIgGYRZ9EmLTH+gFrEpgwPXN5LDL5nNPqusHa2Sx1VGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2D72W7ITS3jUHO44aZf3BghBLRWYGHACnY2Vtv+VyYs=;
 b=V+PnDiAihBGGtjclm1t3UexwO75xhQ9ntqKhaqnWldunUPo0zpAPR+r6CUg9zxouPdtoGVXiOaYzeB/mLiVNs0/0llXK6SkjJbuDWUhqWixKStCKHrg13202x6Tlehmpys97uafj21WjmRGN4NthkfQNxEM2NghUAimj6ao6FZbpBlC/CJ7+rGRTXTI5DjYBePJZ8bdw8lNzwdaau0Zg28Izv3omX26QtGolVFzRKMfhXnYRwyZgLHnhaP34Rokv9ehDnRz+zksLuoGqcY0zdXh/nfI6wpM6J/Idy1QqgUAgnY4LatbsyeXj8Rujn8hiPoVBxD9zY7yL27brjnBN0A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2D72W7ITS3jUHO44aZf3BghBLRWYGHACnY2Vtv+VyYs=;
 b=fuOA8nLHnpuXP3iJj64CPFlR/NWZyOw8BCTAi0juPuEMbsO0m4IJNucb/zxuDBFToUCMYKjxLhG3cFQ7l+BfDMn9GHqkHVSZHz5pbrB/83O3a52FDG/DfDR2zLdQW1Zvt43JNbtGte2kvTCVrCADHVokX34oAxUm+nrcFNZP0as=
Received: from CWLP123CA0128.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:87::20)
 by DB8PR08MB5403.eurprd08.prod.outlook.com (2603:10a6:10:116::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 17:16:09 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:401:87:cafe::1f) by CWLP123CA0128.outlook.office365.com
 (2603:10a6:401:87::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 17:16:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Mon, 15 Dec 2025 17:16:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+U04vR2UMAIu845lPIA3kKKhJCcTO+ynyahYTnlSe/DZWhEBovbvljAfCOzIzhA0YUj5I6XrmRtCwyyYjSMW54W8zFG0km7hC6O0LIJuZCr7NvaylbhKTvB7xxKHWoV5eXhgZ1+pcqtRKslhsLElebUJdkUzO8nCkBPZefRoI0c8pwDdV936oNP9iOQw4d5HyLOPO69wA952vVwnCNutshQieP/UuJIO9zzYQ4n885i1G8+eWI+8Q2bfqNQSFa+K3NXXH9lJ6WT9jHy+pKsWdOEsMJzEYq3CgWUe4Wc2Qh7aZnBJw/XXgjn2aGFcQoPyajuqsVStDHXaExDmvSGIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2D72W7ITS3jUHO44aZf3BghBLRWYGHACnY2Vtv+VyYs=;
 b=N+BUMMQV9nLYeDMVQ6qBFOrb8jky4SiEPrnes7NLGDN3NbqXvtUZrXEerCWk9CV7a47ejSYzaFTloeX9kwW3BEvgzWhKsdwZLLLBButDwpXj2GS4ORGjFzLIdD7C/xMFQD5GoQx0QZfHQtE/BSs8S7aXDp7ZYjB7DgtrbzxwSmOoNPVO71HJO8t1gpqyzr0j2dFL4XsB9CotEqxentgYBZS+oKH6fPzsLYD1i0ugrXDlo7jk1gh9fCZHWNUk92+xh1T39WQPDxn74IZBgyssFZ75VblgcHpSpd2UUyBQrzqr8eVlWQRB7NWeThO/VzgbLpj0sXj+sRprMlq/APjMNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2D72W7ITS3jUHO44aZf3BghBLRWYGHACnY2Vtv+VyYs=;
 b=fuOA8nLHnpuXP3iJj64CPFlR/NWZyOw8BCTAi0juPuEMbsO0m4IJNucb/zxuDBFToUCMYKjxLhG3cFQ7l+BfDMn9GHqkHVSZHz5pbrB/83O3a52FDG/DfDR2zLdQW1Zvt43JNbtGte2kvTCVrCADHVokX34oAxUm+nrcFNZP0as=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by GV1PR08MB10607.eurprd08.prod.outlook.com (2603:10a6:150:16c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 17:15:04 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 17:15:04 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: nd@arm.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v6 2/7] drm/panthor: Add DEV_QUERY.PERF_INFO handling for Gx10
Date: Mon, 15 Dec 2025 17:14:48 +0000
Message-Id: <20251215171453.2506348-3-lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
References: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0455.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::35) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|GV1PR08MB10607:EE_|AMS0EPF0000019F:EE_|DB8PR08MB5403:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e52389f-9fda-4e6b-fbc3-08de3bfda3a7
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?YWV3Ti8vWXF2b2VSbk5wRDk5OU5DM0J5dHhUL3V4WGdlZStZM29Gc2NqZTZK?=
 =?utf-8?B?UUdUSTZSZERCU2hKaWMvelI4NENIYlBESG1Lb2FXKzQvVkpoQzRIQVlsd1FT?=
 =?utf-8?B?SE1RSkRnYXdxVlU1L0tjaTVkd0NFOVV0YXFOWkZjVzV1cjBEanVyVnJHZHNB?=
 =?utf-8?B?RjFqQzFOZit2RktjS1dNUU9scWJUbmI1empXZk8zQ3pXOEJ4RWlsd054SkJh?=
 =?utf-8?B?eE5SYUlscmphdFp3WDBVSlNka3dVY21CWUFzZU5XcXg3Uy9Dbk9ycjdLWmFV?=
 =?utf-8?B?dHFOV0VKMlNEZXo0QUxwanEvdmFPbmRJLzNFTW9waWpMa2d2K1c3TldrMCtC?=
 =?utf-8?B?c0JUU1NxOTExYXNwQlBvbTJwZ3BXWWtQNHRlVHlIWkJPcWZjZkxVTWUyM1N2?=
 =?utf-8?B?K2t3WlJiSFFDSzk2Q1B6S2d5M0VaRFhMUU9WOHllNnlqNmhHdGJVOGxwdUpP?=
 =?utf-8?B?dmVVcnBvVC94eDRVUWk0RXpya2N3QlJKdTUxbG9salppaUhCTEdDdFg2Znpx?=
 =?utf-8?B?WTJUdlEvRDc5UHNFeUZSSUhxZFYxR0pSZlE5RC82Mzk5WGF2WWlzVk12RVhD?=
 =?utf-8?B?ZjlrbUM5OTZiU0tDS2s2YlVtYkZaTUFYMHBaaDUrVFFMMzJTK2dIV2xmMVlV?=
 =?utf-8?B?ZkVvc25KNTdMUGhCckFNd2J1Z2FlV0lRQk9TL1VJTDQvZk1mTjBBR0Y3VnBz?=
 =?utf-8?B?Snp2Ulc1VEFiN2RGY0JKL1d1MXlSR09mb2h2bWg5WG85Vy9oUnkwNSs4SkJO?=
 =?utf-8?B?Q0FiQy9zVEZta2RJSWk4cUlTUi9CVU90VkNGdGRzVHNrRVdiUlJuaTVoUzNZ?=
 =?utf-8?B?RmYvbUo3emRCa3pIVWxlQVI3SWFFSmNlVktyT21hQUpPMXMyRjlaOENMeFhO?=
 =?utf-8?B?Vlc2OGFWNlFxYkRiRU9wODQ4YlBrcDNhN1RDcEdsOE9Kb055R1YyT2VnbDE0?=
 =?utf-8?B?eEVsUG1qbkRkZHFUZXdWcldlSitkR1BKSTg0bHJBVEdNVXJ5VnJVNEEvYVc0?=
 =?utf-8?B?SGpEOVAxeEVyWXdJWjg5UTRZVmxQSW83OEM2MFhyY3J2aGZna3FuVUhTcldJ?=
 =?utf-8?B?OGFoYkF6bGtuYStER1Fwejl2QytHSTlXL2RKcUJJZUw4Q0tUVWYyNmJaOWlU?=
 =?utf-8?B?Lyt0aDBac2VoZjdRcWhSeTNJbFlMMWtHc3Zmb3EwTEJRL3RyT1VnYTRsU08w?=
 =?utf-8?B?eHd0OFlrRmphRUJFajhDejBQZzd5RmZjQ1FxN084NXl0S3hEdVNtbFpKekU4?=
 =?utf-8?B?a09IcGhnNjV1ajNwSHg3M1dBVjJGWFFrVTk2U1NNQm51R3I5TWZzaFJVQzVt?=
 =?utf-8?B?ZE1mNVRDSWZBTVlLd1kydTdGMUVSZTk1Vk1FWEtoTm1saEJ3SnVueVgvM1FS?=
 =?utf-8?B?UFBSQjZzZTR1azhyV1NVTDMrU3REZHNTRmZqL000RktKNmZRU0pNa1VmTmRi?=
 =?utf-8?B?d1FFNzdBOFBXbEN3UUloNWE1ZTRtS2FOeWo2ZDFCV2JDbTJkYVdmVlh3MWFj?=
 =?utf-8?B?bmRvbzJRUithZHVxNytDd1JwcUw2dW4rdXB0bCtOSU83OHlZYkk1K21namUy?=
 =?utf-8?B?WlIxRzJLWDBCOTBiWmdrYXZzQmxOY0s4b2ZJV2VOVEVNVk9OTURvNEZvdkpK?=
 =?utf-8?B?SDFqclN3WDkvN1ZieW42ZlJxWTBEUFZPa1RlUmtjblJDMXdOamR2b05oUXdy?=
 =?utf-8?B?aXB1c0x3UWRhMXljMUtaQ3hPOWFKVDZSSzg5NXE2WS9FcmIvWFlMZVNuWGhp?=
 =?utf-8?B?YnNpbkFKQlhoUEpRcVYzeTduL2FzZ1ArWHVRYTNPTzdVbzdwTjVGU3NmZ1ND?=
 =?utf-8?B?T25CM1E0SldRNzFiQUpWVmpnUmJCMm9YVHpNc2R6djhFQ0FLajBnaTRGQ2lW?=
 =?utf-8?B?V0d4UUxNQUsvVnBReTlaZ3g5dytyVk81ODVjYnNhV25TTEpJVUxURHNXRC9y?=
 =?utf-8?Q?lznklLfmOo/LH54JxHAhuJS3EebJeY+h?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10607
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7cc8c0e3-6fdd-4357-10d9-08de3bfd7cd8
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|14060799003|35042699022|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnhXWklTbkJNbWRjR2VKdk9WTkJiV2FUWnoxeXpHSjAxYmRwbmYwWURuQU50?=
 =?utf-8?B?cVVwSHRYUVU2eExwNzF6QTdUUlBOQmNwbjd2SVAwR1Y4MGtPemJZbGxYK0Z4?=
 =?utf-8?B?R0NqRVk4clZYa1lGT3RXZExkQnUxYkJEclVPbmZQcHphSWpYUHJyUkxLS0VQ?=
 =?utf-8?B?VTRWYTQ0Y01TNHcwZ1I5RWNZUnZUSkFtbzJPTXlXYjZMSlcrK2ZSeEdtbXFK?=
 =?utf-8?B?TkxMSXRIUkE5MllzbmtBYlVHQkVPQ1NOT3hOMGVFSUNyVHoySVVmbWVzbGZy?=
 =?utf-8?B?MUNkc1I4QWp4MjVxNGhrQk5vVFI1SzVBV200eEVxMFVBcHUvcExLdjZnOW1i?=
 =?utf-8?B?UXpjajVJbkcrTGp6aEVoZTBKTjlwUjF0aDc2QVEwQ045TUVoNE9BekVKWXEy?=
 =?utf-8?B?WndWejdNa25wemhxQ1dRZFFaa0VMYXRZM0tyS050bVVVNExxdXBCdUZYblBJ?=
 =?utf-8?B?YUYzdjNydElqL0tlOGs0RnovRXdEOWg5OUdRRDh6RFJYWnhMSldTT0kxSy9l?=
 =?utf-8?B?Q09nWkdYTDhZeXNHanN4S04wRFN3MU4rSm50RFBleHFZeFdod0E0QmoxY2V0?=
 =?utf-8?B?c0NFT1Zvb1M0RWl1enZmeCtsQjBCNzZRT0hPUDR4a3VWdENLcmt6UkMrdVZ4?=
 =?utf-8?B?d1dmRGtsTmJBRktkNWxmK3JjYWprUUwzZUNEOWxObnkxSHdHSlNpVlBTK0Nz?=
 =?utf-8?B?YWVxUi9wRlpPUDMrRVBabE83bnFXYWVjVk9IRzRQcUxKSlNqUW5ESHVOMWt2?=
 =?utf-8?B?Vk81RUJDc01va2NCaWpSemk0NDdHUGlkc0V3cnNPdHJ2TldKSlpwanhQQmVJ?=
 =?utf-8?B?Qk8wT0xmcUpRZjJUSko0UkQ2Und4N1JrRk1xcDFFQUlpRUNTN1NrZWpmeTRv?=
 =?utf-8?B?QkJmMHJMUTRaZ1lhb2FwL25TRTZmUXV5WmhyYWltc2dML3FHRm9KQ29JVmJK?=
 =?utf-8?B?dmM5bWlDMWY2TEk5aTBBRmZxWWI1WWVHZGhvYmxCZmhNTE9mbVZQcmZ6VDZn?=
 =?utf-8?B?VkdOZmZWeEtQOC85dUVhaUVCNmF1MlAvT2FjWVFUeVZHalpwUUhtQXE5Qk1Y?=
 =?utf-8?B?QUhNZENJR0I1WGtxYzltT0d2R0Z1clgrMzFKdnFMTXh6SC9vT2x6SHZRaWk5?=
 =?utf-8?B?empyMUtjR056Zy9PVmJ2Q21pYWF4M3FlaytMYktIMU5TTlBDc2lMamNTOEFY?=
 =?utf-8?B?TEJyYkx1eVhkOTUySXVOZlorVTM3a3J6a05nbEFvY1VkbUtsRlJUY3diNHBv?=
 =?utf-8?B?SDQ4M2FaZTA0SkQ3YUk2cFBSNnpSVEZWVXM4QzJOK2Z2NnhxZDR3bkJkS2Yy?=
 =?utf-8?B?emM5WGM4cUxhaFNpRjJBM29JZHdyZGE1UmpjTHo3ZGdRM0VmazNhV051c0F1?=
 =?utf-8?B?d1orU1dWNzVkMXhDcGIxdlAyK1VFVmtEZEVTeWJsR0VIaEhPTGtZVGZ2dTNi?=
 =?utf-8?B?Mm5uQW52Smg0R3drY0JXeGtyZlhhTGs4blEwOWFBcXVCQy9OdTZ3cEQyakE5?=
 =?utf-8?B?aWp6bDlFbFhvMDR4aDhyQVdRMTBWNzhUMVFVWEdzOFJ5c0dUSitCSVMwT1Rt?=
 =?utf-8?B?OThPVjVvSnBCWm9EankyOVJ0REVVSzlxcVdMTWVZNnF1UGlGM2o2cms1ZzM0?=
 =?utf-8?B?VmRCSW5wS0IySXFmVTRqMWFGcHNZOTc0KzYyWkxuLzcvR0p6NkdFMVRRcWQ0?=
 =?utf-8?B?NGJtbVYyVHRDeURnd3QvUXBFQlpxN3Bod24xUUkwUTVDWWMzMlMvYlkvTHdB?=
 =?utf-8?B?cE0rbG0ybjdCOFdBSzNwcXBodytDUGN2blRQUG1IdW5pU3Z1VTF5REVPc016?=
 =?utf-8?B?WXZ5MGJsWEhkcyt0SjEraWhkRE5JbWE2SGUyOGh3M2dESjZkeEs0MHE2bDgv?=
 =?utf-8?B?eUpwZ0tmMm9nSE5ONHNZako1UzVLaTRVdnl1K2V3bTEvdDhzMC8wOHpEZHZ5?=
 =?utf-8?B?ZGJkNnNYUldwa0ZBTWovL2FWUCswQ0h2MlJ5TkxlSG85cEZIMjJ6NDZ5OW5s?=
 =?utf-8?B?VE1nMXFBN1VQSDFwTTJHTkdRUjF6b1hta0dIZHBNaGo4RXBBNzk2SHRuM042?=
 =?utf-8?B?bGxWeHI1VEMvZzZ4VDBCQnhlMjlKbXdsWlFjRFlpTWo3bGFGNmkrVHVRSW5E?=
 =?utf-8?Q?ZetI=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(14060799003)(35042699022)(376014)(82310400026)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 17:16:09.0708 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e52389f-9fda-4e6b-fbc3-08de3bfda3a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5403
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

This change adds the IOCTL to query data about the performance counter
setup. Some of this data was available via previous DEV_QUERY calls,
for instance for GPU info, but exposing it via PERF_INFO
minimizes the overhead of creating a single session to just the one
aggregate IOCTL.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/Makefile         |  1 +
 drivers/gpu/drm/panthor/panthor_device.c |  7 ++
 drivers/gpu/drm/panthor/panthor_device.h |  3 +
 drivers/gpu/drm/panthor/panthor_drv.c    | 10 ++-
 drivers/gpu/drm/panthor/panthor_fw.h     |  3 +
 drivers/gpu/drm/panthor/panthor_perf.c   | 89 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_perf.h   | 15 ++++
 drivers/gpu/drm/panthor/panthor_regs.h   |  3 +
 8 files changed, 130 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.h

diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 753a32c446df..824e5d6e9e3d 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -10,6 +10,7 @@ panthor-y := \
 	panthor_heap.o \
 	panthor_hw.o \
 	panthor_mmu.o \
+	panthor_perf.o \
 	panthor_pwr.o \
 	panthor_sched.o
 
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 54fbb1aa07c5..dc237da92340 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -22,6 +22,7 @@
 #include "panthor_gpu.h"
 #include "panthor_hw.h"
 #include "panthor_mmu.h"
+#include "panthor_perf.h"
 #include "panthor_pwr.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
@@ -305,6 +306,10 @@ int panthor_device_init(struct panthor_device *ptdev)
 
 	panthor_gem_init(ptdev);
 
+	ret = panthor_perf_init(ptdev);
+	if (ret)
+		goto err_unplug_sched;
+
 	/* ~3 frames */
 	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
 	pm_runtime_use_autosuspend(ptdev->base.dev);
@@ -318,6 +323,8 @@ int panthor_device_init(struct panthor_device *ptdev)
 
 err_disable_autosuspend:
 	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
+
+err_unplug_sched:
 	panthor_sched_unplug(ptdev);
 
 err_unplug_fw:
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index f35e52b9546a..64b0048de6ac 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -142,6 +142,9 @@ struct panthor_device {
 	/** @pwr: Power control management data. */
 	struct panthor_pwr *pwr;
 
+	/** @perf_info: Performance counter interface information. */
+	struct drm_panthor_perf_info perf_info;
+
 	/** @gpu: GPU management data. */
 	struct panthor_gpu *gpu;
 
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 98d4e8d867ed..f9e01c42d237 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -178,7 +178,8 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
-		 PANTHOR_UOBJ_DECL(struct drm_panthor_bo_sync_op, size))
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_bo_sync_op, size), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
 
 /**
  * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
@@ -838,6 +839,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
 			args->size = sizeof(priorities_info);
 			return 0;
 
+		case DRM_PANTHOR_DEV_QUERY_PERF_INFO:
+			args->size = sizeof(ptdev->perf_info);
+			return 0;
+
 		default:
 			return -EINVAL;
 		}
@@ -862,6 +867,9 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
 		panthor_query_group_priorities_info(file, &priorities_info);
 		return PANTHOR_UOBJ_SET(args->pointer, args->size, priorities_info);
 
+	case DRM_PANTHOR_DEV_QUERY_PERF_INFO:
+		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->perf_info);
+
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index fbdc21469ba3..dae78618a080 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -198,8 +198,11 @@ struct panthor_fw_global_control_iface {
 	u32 output_va;
 	u32 group_num;
 	u32 group_stride;
+#define GLB_PERFCNT_FW_SIZE(x) ((((x) >> 16) << 8))
 	u32 perfcnt_size;
 	u32 instr_features;
+#define PERFCNT_FEATURES_MD_SIZE(x) (((x) & GENMASK(3, 0)) << 8)
+	u32 perfcnt_features;
 };
 
 struct panthor_fw_global_input_iface {
diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
new file mode 100644
index 000000000000..842d62826ac3
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2023 Collabora Ltd */
+/* Copyright 2025 Arm ltd. */
+
+#include <linux/bitops.h>
+#include <drm/panthor_drm.h>
+
+#include "panthor_device.h"
+#include "panthor_fw.h"
+#include "panthor_perf.h"
+#include "panthor_regs.h"
+
+/**
+ * PANTHOR_PERF_COUNTERS_PER_BLOCK - On CSF architectures pre-11.x, the number of counters
+ * per block was hardcoded to be 64. Arch 11.0 onwards supports the PRFCNT_FEATURES GPU register,
+ * which indicates the same information.
+ */
+#define PANTHOR_PERF_COUNTERS_PER_BLOCK (64)
+
+/**
+ * PANTHOR_HW_COUNTER_SIZE - The size of a hardware counter in the FW ring buffer.
+ */
+#define PANTHOR_HW_COUNTER_SIZE (sizeof(u32))
+
+struct panthor_perf_counter_block {
+	struct drm_panthor_perf_block_header header;
+	u64 counters[];
+};
+
+static size_t get_annotated_block_size(size_t counters_per_block)
+{
+	return struct_size_t(struct panthor_perf_counter_block, counters, counters_per_block);
+}
+
+static size_t session_get_user_sample_size(const struct drm_panthor_perf_info *const info)
+{
+	const size_t block_size = get_annotated_block_size(info->counters_per_block);
+	const size_t block_nr = info->cshw_blocks + info->fw_blocks +
+		info->tiler_blocks + info->memsys_blocks + info->shader_blocks;
+
+	return info->sample_header_size + (block_size * block_nr);
+}
+
+static void panthor_perf_info_init(struct panthor_device *const ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	struct drm_panthor_perf_info *const perf_info = &ptdev->perf_info;
+
+	if (PERFCNT_FEATURES_MD_SIZE(glb_iface->control->perfcnt_features))
+		perf_info->flags |= DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT;
+
+	if (GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) < 11) {
+		perf_info->counters_per_block = PANTHOR_PERF_COUNTERS_PER_BLOCK;
+	} else {
+		u32 features = gpu_read(ptdev, GPU_PRFCNT_FEATURES);
+
+		perf_info->counters_per_block = PRFCNT_FEATURES_COUNTER_BLOCK_SIZE(features) /
+			PANTHOR_HW_COUNTER_SIZE;
+	}
+
+	perf_info->sample_header_size = sizeof(struct drm_panthor_perf_sample_header);
+	perf_info->block_header_size = sizeof(struct drm_panthor_perf_block_header);
+
+	if (GLB_PERFCNT_FW_SIZE(glb_iface->control->perfcnt_size))
+		perf_info->fw_blocks = 1;
+
+	perf_info->cshw_blocks = 1;
+	perf_info->tiler_blocks = 1;
+	perf_info->memsys_blocks = GPU_MEM_FEATURES_L2_SLICES(ptdev->gpu_info.mem_features);
+	perf_info->shader_blocks = hweight64(ptdev->gpu_info.shader_present);
+
+	perf_info->sample_size = session_get_user_sample_size(perf_info);
+}
+
+/**
+ * panthor_perf_init - Initialize the performance counter subsystem.
+ * @ptdev: Panthor device
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_init(struct panthor_device *ptdev)
+{
+	if (!ptdev)
+		return -EINVAL;
+
+	panthor_perf_info_init(ptdev);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
new file mode 100644
index 000000000000..3c32c24c164c
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_perf.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2025 Collabora Ltd */
+/* Copyright 2025 Arm ltd. */
+
+#ifndef __PANTHOR_PERF_H__
+#define __PANTHOR_PERF_H__
+
+#include <linux/types.h>
+
+struct panthor_device;
+
+int panthor_perf_init(struct panthor_device *ptdev);
+
+#endif /* __PANTHOR_PERF_H__ */
+
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 08bf06c452d6..9e66c207b9fb 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -27,6 +27,7 @@
 #define GPU_TILER_FEATURES				0xC
 #define GPU_MEM_FEATURES				0x10
 #define   GROUPS_L2_COHERENT				BIT(0)
+#define   GPU_MEM_FEATURES_L2_SLICES(x)			((((x) & GENMASK(11, 8)) >> 8) + 1)
 
 #define GPU_MMU_FEATURES				0x14
 #define  GPU_MMU_FEATURES_VA_BITS(x)			((x) & GENMASK(7, 0))
@@ -75,6 +76,8 @@
 #define GPU_FEATURES					0x60
 #define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
 #define   GPU_FEATURES_RAY_TRAVERSAL			BIT(5)
+#define GPU_PRFCNT_FEATURES				0x68
+#define   PRFCNT_FEATURES_COUNTER_BLOCK_SIZE(x)		(((x) & GENMASK(7, 0)) << 8)
 
 #define GPU_TIMESTAMP_OFFSET				0x88
 #define GPU_CYCLE_COUNT					0x90
-- 
2.33.0.dirty

