Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1539FCBF2F7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 18:16:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B08610E52D;
	Mon, 15 Dec 2025 17:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="fF21zecf";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fF21zecf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010038.outbound.protection.outlook.com [52.101.69.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8434F10E59A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 17:16:11 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BY63oN8N3GwZkh9qumw2OpnaOCYBReYu9YVkyD/R/ZLLhYyAT9DoTKS6npuvMC+C+N95MPfOHi0n9P5pmLdZBPHQAMB8Y5w1nU3OLIahdDD56QvKIgaDoswXIQPS9bt2RofALBtGMDzW2pn4/jNhq1dbRWedHHeMESn8SiLTB9Gq6AqHCyrAX7HvnEWcOzmCxw2MkDYcFDLHF2dmQY6pHmcNVXPUnrD1V7BxCui//ZUr6+NucN06nrZE0SihsnKtTRX58UfyA7zCq0oxlRxQrEYGEq/RXC70UyLinMzzirNrPAW88RzCq3rbEC2Mq/gvWHcTy9vzxz1V+8MEphCTNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBrd730H/8I46TDe2mce2TXJIW/eeLqdR4EZnZw9Uv8=;
 b=hp6bQwjzgfQt+2Y0a7MxXEwa8coK07LGk/+z7ua/6L0mrycic/GzJXR53nug5EG0lh2XVgU1b9a1rUzPw7BH6sK2aGlX0D6t+z/hFkZzEx8Rm7W2PAxViw8eX4wmDujy/NWLaknJSzfF+/CuClCf44mGH3E5VVf1fwBLTbEntOl4+Tj13yXJ668R0wrxBlKJSvtWN0oSwzptHqchLWsHXGsJVy89CUTCORYiMq8HTY4lTDmrNk53dq27SxabJX5FQYVx531zcA53rfwqY/x8WcrCg3qpuG0WPMoB04WPCiRA/iCs5jtCSpNUakD/h//fn23JmdTjZ5qQ+dbuP1bP+w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBrd730H/8I46TDe2mce2TXJIW/eeLqdR4EZnZw9Uv8=;
 b=fF21zecf1diWo6XnF62rZyxBGIab/ViFJwGgaclB7qnxE45WKtgO2nxaFaBhA644vRubOsYp1F2dTmb8UUwrRRKVEG1csAB46ib++q8L4dmN9A/qxZx4BtIq3ukqjMOMlq84Okt7ecWh8g0IS7j51TiDkCPltD1rfcstgVZ59p8=
Received: from AM8P190CA0017.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::22)
 by AS4PR08MB8120.eurprd08.prod.outlook.com (2603:10a6:20b:58c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 17:16:05 +0000
Received: from AM3PEPF0000A793.eurprd04.prod.outlook.com
 (2603:10a6:20b:219:cafe::84) by AM8P190CA0017.outlook.office365.com
 (2603:10a6:20b:219::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 17:16:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A793.mail.protection.outlook.com (10.167.16.122) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Mon, 15 Dec 2025 17:16:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRrO/lLUPdJ4aZSsSJMPtojXVl0qvghL4k13gBefcv3NXr0TwwsixSJEwRB25jUkV4cv8KBE1YrY/UpOYTBSDpPB/vtL3W+ar2WM04y/j6g3oNPgQA9k+YmwYh1ZIb2sECPnDun1jSP0717flFOHshWM8DIpH9D5q7DXj/UObMXjR8JQrGNKRLQ6Qto+vqZlhKTt1LL8gIUgNzCK1MCjld8Nnjewl8jowm01M8NFEAiKbLOezxYoFpk0IJvenGwqrY5hSW9sV8COeMY4miAAteOtDp/FLVjhXdshqJWgeBIfoBBESGj6TfaiftFde1fOsNYeEw+STPfEQz2skYa+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBrd730H/8I46TDe2mce2TXJIW/eeLqdR4EZnZw9Uv8=;
 b=aBTL2hA4pKwKLY1Pz+6LnEwBLx8ahQZ+drjrjinqEBQITkZ9kZjAmzLtLxZAZLt5zr5qP0zk1/c4G4MmOVzHlS98sCnaZnu7hzSz8NTZmbWbL1h0Yn3iLVlhfTlcsrzxpbHCMYCIG3hK66pJGp2VRJCpwg6LnaNs93XFb/+6yIUDzG6VfhZ3nXlX5/ftkte0f2obiFE36l3AMQHh7/A6Yjp71E7xwfA34PdZlDSlJQDICd4rv4ffq6PiGofnVn1uSAO83QRK5ykz0+RFzxs9LICwvOH0lpZPFDCv4agija7TFFb82jj2wEvtjPwqfkA16zvNN9mKNwd7AN/TjueHcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBrd730H/8I46TDe2mce2TXJIW/eeLqdR4EZnZw9Uv8=;
 b=fF21zecf1diWo6XnF62rZyxBGIab/ViFJwGgaclB7qnxE45WKtgO2nxaFaBhA644vRubOsYp1F2dTmb8UUwrRRKVEG1csAB46ib++q8L4dmN9A/qxZx4BtIq3ukqjMOMlq84Okt7ecWh8g0IS7j51TiDkCPltD1rfcstgVZ59p8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by GV1PR08MB10607.eurprd08.prod.outlook.com (2603:10a6:150:16c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 17:15:02 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 17:15:01 +0000
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
Subject: [PATCH v6 1/7] drm/panthor: Add performance counter uAPI
Date: Mon, 15 Dec 2025 17:14:47 +0000
Message-Id: <20251215171453.2506348-2-lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
References: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::15) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|GV1PR08MB10607:EE_|AM3PEPF0000A793:EE_|AS4PR08MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 673f7d1b-164a-4aa4-a594-08de3bfda126
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?dlBHdms2MHFmbmZZRFBKZndweCt3UlV3TjZtK0ZUbEp3WkEvS3VIWTJYQzFl?=
 =?utf-8?B?UUN6THJZaFpHZWl2bjNkZFVwa0Z5ZzRFV1B3YUJDVCtONGtJSlY4b0xOQlA1?=
 =?utf-8?B?SlM1NWtVUDArblZuU2g2NlBHQmwwd1U4RXFmYm1sOWE1dGpreEJFYnVjMnhI?=
 =?utf-8?B?ZkpZam11WDVYV3VwOWd6a1NMV3FJT1p3R3JnVS9seUNDRFVDd1lWWHRKTjlu?=
 =?utf-8?B?QUMzbHNpNzVCd0pZNFNEaVZBY21zaG5QM1pGckwvaG1CQ3ZoZXV6VEh1RUpO?=
 =?utf-8?B?VnBtR0ZDVk1WdFR2dmRtTHk4R2R3c0JPN1RuVkJONWVPQkszWjErdUE5c05t?=
 =?utf-8?B?bTBmTklMd0Q5TklrSmFzZ2JxVzBYU2F5ODZJK20xdERWdURsYWh5aENXKzVT?=
 =?utf-8?B?dkxqeFZZcGlGY0Q2UndkM0Fqa3lyOEdVR01iNk9QUnhmV1ZtN2R3UFZtWlJh?=
 =?utf-8?B?UGQ4L3hKMmpqejZBMG0zWGplU3hoYWZOUjlJRVpYLzNZK3haNlRyT3NsN0dN?=
 =?utf-8?B?YXZVVSt6VkNuV1QzVkk3Q1FLTmNsaEpFaHNwZWJnYVk0WFNmVUR1QVBMdlNL?=
 =?utf-8?B?OTkvSVlBRGlVdm5PZXZ1T0ZoY20vSDVRc2lGWGRrTWJhMVBEUGRxMDJDQVI4?=
 =?utf-8?B?RmFFeE45aUVuMjg3L3hiTWplUFRBeXptS3FhWG5zMHhFYWNyOE1valppODFS?=
 =?utf-8?B?OTJhUThKeFZzaWFHamhKN2lxY01GUi85OWw5aDliWVgzaTh6blNudUw5b0Q2?=
 =?utf-8?B?TlV5Y0txWG9hRTdqbUFxd28vbkR0eUxmRjRuVytwM080VlNESmRJcW1aKzdJ?=
 =?utf-8?B?NVh4Y09nVkZmR2hXNlJEcVlscXVwYWd0SEN3ZlhYdjM4UFBHM2o0RW1ROWNZ?=
 =?utf-8?B?Z3Q1Y3ZJY1dXZzBrY1lhcHNFWkxIQzdTZ1NJSkV5bGF4UXlVeHJnV3hhcjY5?=
 =?utf-8?B?OUcxUUdGYkZsOC82TkdkNlNXRmFhMm05WUlvUXBIZUw2dStrK3hQaUh6WVdN?=
 =?utf-8?B?Y080SGlrd3ZCaEpYMk5TcGFIRlFKYk1zY0F4QXBRWkpOcmpxQmpCamY3SDIw?=
 =?utf-8?B?eS9KZ2NuSTZCTVdremQxNDAvSmE1bWJGVzQyWC9ZV3Z5Y1d2Sk5mdDVZZHdt?=
 =?utf-8?B?eXoyUnh5K1hQbTJncWdsMk5NTzNIR1ZOcWVtbDdBNW1hb3ZkbTJsZXRtRzRj?=
 =?utf-8?B?c24xRjZ6eWNLOTFtSjBFYWtOWkNYa3NZb2FjUHFUVGlQRzViTkZURnhGNzdi?=
 =?utf-8?B?V3hVb2dIM3BVM2tLSFJrOUJWUjYxY0NvNm1DM29XTWt6SmZ2ZDFGbG1qRThI?=
 =?utf-8?B?VjFWeGozUGxreHUyMWZpNTBiYVFsYmZ6aXVaditFVlFkTHNHK2NpVXdBUGFy?=
 =?utf-8?B?U2wrODFuV0xWVlE3bUNhS01TVTRiMkVBalJxZWJGQ2MxOWVNOFlGMWNrTzU2?=
 =?utf-8?B?clloNTlXZGhnZ0hZMTBnb3E5VllGUjhwZ3hqQW50T242WS94bmpOUnI4VzF5?=
 =?utf-8?B?aHlZaXhIM1NPc3VtNHhWK3lvcTRzaG9nYzEzN3pEU1ZUVndWOE9CeXJ4YXQv?=
 =?utf-8?B?azltYXhBMVVMVlFFbmZSMTBxT0ZNM0JhWE0vRXJxMHdVblZaeVNMbDFCKzJq?=
 =?utf-8?B?YUF6MUl3QzI5aUZvcU1uR0w1cUZvcEpvY1FiTkMwV2xaOERtYUYyemM2ZnNH?=
 =?utf-8?B?b2ZlRTc2bXhKV2N3NG1pSmlYclhLYTd1dFZreFYxby9IODZLclFyWFN6MlJU?=
 =?utf-8?B?eU1rN1hZR0lSVjNsOWFWYzB5QmRhTHU2RDRyaWhiR3YxQkRtQ1lrTGY5aHYr?=
 =?utf-8?B?RTNVa29ZbHRTaFZXMmRud1BGc3E4NDhwd2FWWjhqdDk4bUQyaUhaKzhNR1JI?=
 =?utf-8?B?clJ2bkkvYUZGcTdwemJBdXJqR0VjR1JjdmRkbHJnSkttMTlYSGdHV0hjelFR?=
 =?utf-8?B?a2N4TEc1cnhBZ2tGdkpKQy85eWR1cld1U1lpSEdmVEYwaEpSQVUxZFd3eTBD?=
 =?utf-8?B?MWFUZklaaVd3PT0=?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10607
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6d84c389-05d7-4553-f408-08de3bfd7b72
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|14060799003|35042699022|376014|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2RVaDlaR3VLS2hKS25lRUNGVVBmK3J1NitVNURqWHJNVkZQVk1SZmIzOW44?=
 =?utf-8?B?UmYwVjFSWXBUTGZrZEdvRG5TN1R0TjJWRXBOTTNoeTZ5ZUh3b1VseDcxZGFz?=
 =?utf-8?B?aGlHVUVSU3RiZTVpVG8rczZaSXM4YzZYSFB0NXBsdGRqcDk0VlRNVEJrcm1l?=
 =?utf-8?B?Tk96RzRYUWF6NUt6d1lRNHBzaUs1bktFYWpHZTRHVjdSK2MzcVJja2VqRFow?=
 =?utf-8?B?bGthbkdWZGlzZkF1ZlNvTjZrdmxJVnU5UWZqOFBMMVU5UGZhd2c0dmllRDZu?=
 =?utf-8?B?VldjbklVZWl3L0ZDdEVOZjl5clVXNnZDM2l0Nzg2VlJnb090WW8rMzJVMjBv?=
 =?utf-8?B?OElxWld2aW9jVnFkNzNDczJ3c092K29BMTVzWFpVUTZEU01rbkFWQXROTFk2?=
 =?utf-8?B?dm9XQ2RWbFExVllXa2JTbUJWWVBCdERLekYxWE5rYVlFdjFrU1E0c1dBa2hv?=
 =?utf-8?B?Z1JyOGZZS0wzVk5STnJsRjN6TTYrSEZDYmE4anNjUzhNVHBZaG9JSStpVGQz?=
 =?utf-8?B?aGRnNVZ1TjByV0dVYm5BY282UFBlUXNtalI3RElFaUxzaCtVQmVDeWFsSWlQ?=
 =?utf-8?B?cEVvUHNNbGxMaTVlNXNkRE02d0R5V1FONzRzY0lWVWhsc0gvVGRwak1DMUxI?=
 =?utf-8?B?T0ZYRHpxYXFzdklYWVA5UWRmcEFnZFpSeEQrSnBxajlnMXhQZDJyU2U0Q0ZN?=
 =?utf-8?B?Rzd6a0F1eUtLZnBIb1FQUkplVE1ieVBFNWZ1V1pJZ3oweklod1ZyNnZ5MjdQ?=
 =?utf-8?B?dmhIQzgwUHFFZGd6bGhIK0RpZnFhcm1xS1o4eTdsTWZobkhuOXBkdVNSazQw?=
 =?utf-8?B?Tkpmdngvc056VS93ZzNWNkxHdk9QTUI1dGwvbXZDRi9kcnhpdzQxWld3angz?=
 =?utf-8?B?WndGSXhvdWlXZG9zaTh0dDU5ZGo0S3VyNjVYcmdhTUdLSElWdjJ3OWRxTEJx?=
 =?utf-8?B?V29jeEZ2RkhPVm83TmJCaERQa1dYaG80LzlZTWRpbFdjMEN0YlZxRGw4YkdN?=
 =?utf-8?B?QUhvTHNrRDMwK3dBUkN5T2htdGdGRnJqRUpDd2ViUEM2OVN4RDJraStyTUhX?=
 =?utf-8?B?a1FQbUduUWRpK0hCZFFOZlgxOFljd2w2aVFYUytEbDdLeVN2OGo1VjRINVpH?=
 =?utf-8?B?K3lSQURxVDRoM1hYQ1l5c0pCczlxWEJaK1pWMVgwV0hVdkpVUW1nUFBWWXUv?=
 =?utf-8?B?SGdvOXMvYnBqRFNlMTlOeldzMVNFMTRlVnNmM1V2WGdDV3FHYkI2T3pwTkUz?=
 =?utf-8?B?SzR0eHNRR0tBL050Q0VyWVhDOVpOYU1QTFZoMTdPb2pKVWFXOExVL2xEMzEx?=
 =?utf-8?B?MHdNa3JxMzVIMXdSajNXUnJETnIyUDlCVFNXbFVsMmJEUmFZZXJ6VUUzR1Nz?=
 =?utf-8?B?SFQvNEdTRVBkOHFLWnIvQXU5NUl4TjZlQXBXQUlNRHBJS0hGYjJ2eWdXQ0Nu?=
 =?utf-8?B?QkRxSG5KL0gxTFdRRTZpWjJkc05HYVVaQWdGaHpybTJ4YlRRZkRrMDJwMkN0?=
 =?utf-8?B?cGp4V2srbHFVaGRLU1hQMEFTdnJabE4wOXlnWTRFdHhKMy9QQk5tVTFUL3N6?=
 =?utf-8?B?bFlkY3BtcGs5enQ4dFJGQnIyWm1lcUtIR0VxZzJleFVuZTB1L0hPeFpHYTRZ?=
 =?utf-8?B?bHdOZ0lTMG9tOFc1Zk44anEySjVpMU83Ylc1TEp4WEZPZkxtQnVCbUtPejZR?=
 =?utf-8?B?NVF3SHhYN0xCYjZLMU9JTGYxbzNHWk9aR3RCb1RpcThFNVErVitxN2ZMOG1R?=
 =?utf-8?B?NW9lRGJJeFh3RXNXMXlYUnl3OEhhNHJxcmowY3JNNFdOem5TRWFBcFZyUFlD?=
 =?utf-8?B?SElrUFh4YngwbXJZNmM0a0ZyZHpkUVFtRkQyYUp0VFZMWkZsMUxCbHJabllT?=
 =?utf-8?B?SUpsbk5HUDB5TmM5aDJidjBYdmtpZFFBN3VZaXNoUzc0V0NLNHlUV2JRby9v?=
 =?utf-8?B?cFJFTlVWbktBRUdneXNhYzNPSERlOXhLQXIvUWUzYWVqMjNzY2tPeWl1OW96?=
 =?utf-8?B?VFhrZFE1bDhLSHJ5T0RhR2dBa210ZExWb1N2bGVrOHdmK3E1WUlnQyt6WTZ5?=
 =?utf-8?B?ZVVQZ2VFS3BGZGJJWGZYS2w1ZTE3T3E1M0JRdkx2QXZ3Ly9mVW9lNk5SOVVS?=
 =?utf-8?Q?gLGM=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(14060799003)(35042699022)(376014)(36860700013)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 17:16:04.8579 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 673f7d1b-164a-4aa4-a594-08de3bfda126
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8120
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

This patch extends the DEV_QUERY ioctl to return information about the
performance counter setup for userspace, and introduces the new
ioctl DRM_PANTHOR_PERF_CONTROL in order to allow for the sampling of
performance counters.

The new design is inspired by the perf aux ringbuffer [0], with the
insert and extract indices being mapped to userspace, allowing
multiple samples to be exposed at any given time. To avoid pointer
chasing, the sample metadata and block metadata are inline with
the elements they describe.

Userspace is responsible for passing in resources for samples to be
exposed, including the event file descriptor for notification of new
sample availability, the ringbuffer BO to store samples, and the
control BO along with the offset for mapping the insert and extract
indices. Though these indices are only a total of 8 bytes, userspace
can then reuse the same physical page for tracking the state of
multiple buffers by giving different offsets from the BO start to
map them.

[0]: https://docs.kernel.org/userspace-api/perf_ring_buffer.html

Co-developed-by: Mihail Atanassov <mihail.atanassov@arm.com>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 include/uapi/drm/panthor_drm.h | 565 +++++++++++++++++++++++++++++++++
 1 file changed, 565 insertions(+)

diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index e238c6264fa1..d1a92172e878 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -154,6 +154,9 @@ enum drm_panthor_ioctl_id {
 	 * This is useful for imported BOs.
 	 */
 	DRM_PANTHOR_BO_QUERY_INFO,
+
+	/** @DRM_PANTHOR_PERF_CONTROL: Control a performance counter session. */
+	DRM_PANTHOR_PERF_CONTROL,
 };
 
 /**
@@ -253,6 +256,9 @@ enum drm_panthor_dev_query_type {
 	 * @DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO: Query allowed group priorities information.
 	 */
 	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
+
+	/** @DRM_PANTHOR_DEV_QUERY_PERF_INFO: Query performance counter interface information. */
+	DRM_PANTHOR_DEV_QUERY_PERF_INFO,
 };
 
 /**
@@ -445,6 +451,135 @@ struct drm_panthor_group_priorities_info {
 	__u8 pad[3];
 };
 
+/**
+ * enum drm_panthor_perf_feat_flags - Performance counter configuration feature flags.
+ */
+enum drm_panthor_perf_feat_flags {
+	/** @DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT: Coarse-grained block states are supported. */
+	DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT = 1 << 0,
+};
+
+/**
+ * enum drm_panthor_perf_block_type - Performance counter supported block types.
+ */
+enum drm_panthor_perf_block_type {
+	/** @DRM_PANTHOR_PERF_BLOCK_METADATA: Internal use only. */
+	DRM_PANTHOR_PERF_BLOCK_METADATA = 0,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_FW: The FW counter block. */
+	DRM_PANTHOR_PERF_BLOCK_FW,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_CSHW: The CSHW counter block. */
+	DRM_PANTHOR_PERF_BLOCK_CSHW,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_TILER: The tiler counter block. */
+	DRM_PANTHOR_PERF_BLOCK_TILER,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_MEMSYS: A memsys counter block. */
+	DRM_PANTHOR_PERF_BLOCK_MEMSYS,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_SHADER: A shader core counter block. */
+	DRM_PANTHOR_PERF_BLOCK_SHADER,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_FIRST: Internal use only. */
+	DRM_PANTHOR_PERF_BLOCK_FIRST = DRM_PANTHOR_PERF_BLOCK_FW,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_LAST: Internal use only. */
+	DRM_PANTHOR_PERF_BLOCK_LAST = DRM_PANTHOR_PERF_BLOCK_SHADER,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_MAX: Internal use only. */
+	DRM_PANTHOR_PERF_BLOCK_MAX = DRM_PANTHOR_PERF_BLOCK_LAST + 1,
+};
+
+/**
+ * enum drm_panthor_perf_clock - Identifier of the clock used to produce the cycle count values
+ * in a given block.
+ *
+ * Since the integrator has the choice of using one or more clocks, there may be some confusion
+ * as to which blocks are counted by which clock values unless this information is explicitly
+ * provided as part of every block sample. Not every single clock here can be used: in the simplest
+ * case, all cycle counts will be associated with the top-level clock.
+ */
+enum drm_panthor_perf_clock {
+	/** @DRM_PANTHOR_PERF_CLOCK_TOPLEVEL: Top-level CSF clock. */
+	DRM_PANTHOR_PERF_CLOCK_TOPLEVEL,
+
+	/**
+	 * @DRM_PANTHOR_PERF_CLOCK_COREGROUP: Core group clock, responsible for the MMU, L2
+	 * caches and the tiler.
+	 */
+	DRM_PANTHOR_PERF_CLOCK_COREGROUP,
+
+	/** @DRM_PANTHOR_PERF_CLOCK_SHADER: Clock for the shader cores. */
+	DRM_PANTHOR_PERF_CLOCK_SHADER,
+};
+
+/**
+ * struct drm_panthor_perf_info - Performance counter interface information
+ *
+ * Structure grouping all queryable information relating to the performance counter
+ * interfaces.
+ */
+struct drm_panthor_perf_info {
+	/**
+	 * @counters_per_block: The number of 8-byte counters available in a block.
+	 */
+	__u32 counters_per_block;
+
+	/**
+	 * @sample_header_size: The size of the header struct available at the beginning
+	 * of every sample.
+	 */
+	__u32 sample_header_size;
+
+	/**
+	 * @block_header_size: The size of the header struct inline with the counters for a
+	 * single block.
+	 */
+	__u32 block_header_size;
+
+	/**
+	 * @sample_size: The size of a fully annotated sample, starting with a sample header
+	 *               of size @sample_header_size bytes, and all available blocks for the current
+	 *               configuration, each comprised of @counters_per_block 64-bit counters and
+	 *               a block header of @block_header_size bytes.
+	 *
+	 *               The user must use this field to allocate size for the ring buffer. In
+	 *               the case of new blocks being added, an old userspace can always use
+	 *               this field and ignore any blocks it does not know about.
+	 */
+	__u32 sample_size;
+
+	/** @flags: Combination of drm_panthor_perf_feat_flags flags. */
+	__u32 flags;
+
+	/**
+	 * @supported_clocks: Bitmask of the clocks supported by the GPU.
+	 *
+	 * Each bit represents a variant of the enum drm_panthor_perf_clock.
+	 *
+	 * For the same GPU, different implementers may have different clocks for the same hardware
+	 * block. At the moment, up to three clocks are supported, and any clocks that are present
+	 * will be reported here.
+	 */
+	__u32 supported_clocks;
+
+	/** @fw_blocks: Number of FW blocks available. */
+	__u32 fw_blocks;
+
+	/** @cshw_blocks: Number of CSHW blocks available. */
+	__u32 cshw_blocks;
+
+	/** @tiler_blocks: Number of tiler blocks available. */
+	__u32 tiler_blocks;
+
+	/** @memsys_blocks: Number of memsys blocks available. */
+	__u32 memsys_blocks;
+
+	/** @shader_blocks: Number of shader core blocks available. */
+	__u32 shader_blocks;
+};
+
 /**
  * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
  */
@@ -1187,6 +1322,434 @@ struct drm_panthor_bo_query_info {
 	__u32 pad;
 };
 
+/**
+ * DOC: Performance counter decoding in userspace.
+ *
+ * Each sample will be exposed to userspace in the following manner:
+ *
+ * +--------+--------+------------------------+--------+-------------------------+-----+
+ * | Sample | Block  |        Block           | Block  |         Block           | ... |
+ * | header | header |        counters        | header |         counters        |     |
+ * +--------+--------+------------------------+--------+-------------------------+-----+
+ *
+ * Each sample will start with a sample header of type @struct drm_panthor_perf_sample header,
+ * providing sample-wide information like the start and end timestamps, the counter set currently
+ * configured, and any errors that may have occurred during sampling.
+ *
+ * After the fixed size header, the sample will consist of blocks of
+ * 64-bit @drm_panthor_dev_query_perf_info::counters_per_block counters, each prefaced with a
+ * header of its own, indicating source block type, as well as the cycle count needed to normalize
+ * cycle values within that block, and a clock source identifier.
+ */
+
+/**
+ * enum drm_panthor_perf_block_state - Bitmask of the power and execution states that an individual
+ * hardware block went through in a sampling period.
+ *
+ * Because the sampling period is controlled from userspace, the block may undergo multiple
+ * state transitions, so this must be interpreted as one or more such transitions occurring.
+ */
+enum drm_panthor_perf_block_state {
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN: The state of this block was unknown during
+	 * the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN = 0,
+
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_ON: This block was powered on for some or all of
+	 * the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_ON = 1 << 0,
+
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_OFF: This block was powered off for some or all of the
+	 * sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_OFF = 1 << 1,
+
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE: This block was available for execution for
+	 * some or all of the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE = 1 << 2,
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE: This block was unavailable for execution for
+	 * some or all of the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE = 1 << 3,
+
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL: This block was executing in normal mode
+	 * for some or all of the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL = 1 << 4,
+
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED: This block was executing in protected mode
+	 * for some or all of the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED = 1 << 5,
+};
+
+/**
+ * struct drm_panthor_perf_block_header - Header present before every block in the
+ * sample ringbuffer.
+ */
+struct drm_panthor_perf_block_header {
+	/** @block_type: Type of the block. */
+	__u8 block_type;
+
+	/** @block_idx: Block index. */
+	__u8 block_idx;
+
+	/**
+	 * @block_states: Coarse-grained block transitions, bitmask of enum
+	 * drm_panthor_perf_block_states.
+	 */
+	__u8 block_states;
+
+	/**
+	 * @clock: Clock used to produce the cycle count for this block, taken from
+	 * enum drm_panthor_perf_clock. The cycle counts are stored in the sample header.
+	 */
+	__u8 clock;
+
+	/** @pad: MBZ. */
+	__u8 pad[4];
+
+	/** @enable_mask: Bitmask of counters requested during the session setup. */
+	__u64 enable_mask[2];
+};
+
+/**
+ * enum drm_panthor_perf_sample_flags - Sample-wide events that occurred over the sampling
+ * period.
+ */
+enum drm_panthor_perf_sample_flags {
+	/**
+	 * @DRM_PANTHOR_PERF_SAMPLE_OVERFLOW: This sample contains overflows due to the duration
+	 * of the sampling period.
+	 */
+	DRM_PANTHOR_PERF_SAMPLE_OVERFLOW = 1 << 0,
+
+	/**
+	 * @DRM_PANTHOR_PERF_SAMPLE_ERROR: This sample encountered an error condition during
+	 * the sample duration.
+	 */
+	DRM_PANTHOR_PERF_SAMPLE_ERROR = 1 << 1,
+};
+
+/**
+ * struct drm_panthor_perf_sample_header - Header present before every sample.
+ */
+struct drm_panthor_perf_sample_header {
+	/**
+	 * @timestamp_start_ns: Earliest timestamp that values in this sample represent, in
+	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
+	 */
+	__u64 timestamp_start_ns;
+
+	/**
+	 * @timestamp_end_ns: Latest timestamp that values in this sample represent, in
+	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
+	 */
+	__u64 timestamp_end_ns;
+
+	/** @block_set: Set of performance counter blocks. */
+	__u8 block_set;
+
+	/** @pad: MBZ. */
+	__u8 pad[3];
+
+	/** @flags: Current sample flags, combination of drm_panthor_perf_sample_flags. */
+	__u32 flags;
+
+	/**
+	 * @user_data: User data provided as part of the command that triggered this sample.
+	 *
+	 * - Automatic samples (periodic ones or those around non-counting periods or power state
+	 * transitions) will be tagged with the user_data provided as part of the
+	 * DRM_PANTHOR_PERF_COMMAND_START call.
+	 * - Manual samples will be tagged with the user_data provided with the
+	 * DRM_PANTHOR_PERF_COMMAND_SAMPLE call.
+	 * - A session's final automatic sample will be tagged with the user_data provided with the
+	 * DRM_PANTHOR_PERF_COMMAND_STOP call.
+	 */
+	__u64 user_data;
+
+	/**
+	 * @toplevel_clock_cycles: The number of cycles elapsed between
+	 * drm_panthor_perf_sample_header::timestamp_start_ns and
+	 * drm_panthor_perf_sample_header::timestamp_end_ns on the top-level clock if the
+	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
+	 */
+	__u64 toplevel_clock_cycles;
+
+	/**
+	 * @coregroup_clock_cycles: The number of cycles elapsed between
+	 * drm_panthor_perf_sample_header::timestamp_start_ns and
+	 * drm_panthor_perf_sample_header::timestamp_end_ns on the coregroup clock if the
+	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
+	 */
+	__u64 coregroup_clock_cycles;
+
+	/**
+	 * @shader_clock_cycles: The number of cycles elapsed between
+	 * drm_panthor_perf_sample_header::timestamp_start_ns and
+	 * drm_panthor_perf_sample_header::timestamp_end_ns on the shader core clock if the
+	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
+	 */
+	__u64 shader_clock_cycles;
+};
+
+/**
+ * enum drm_panthor_perf_command - Command type passed to the DRM_PANTHOR_PERF_CONTROL
+ * IOCTL.
+ */
+enum drm_panthor_perf_command {
+	/** @DRM_PANTHOR_PERF_COMMAND_SETUP: Create a new performance counter sampling context. */
+	DRM_PANTHOR_PERF_COMMAND_SETUP,
+
+	/** @DRM_PANTHOR_PERF_COMMAND_TEARDOWN: Teardown a performance counter sampling context. */
+	DRM_PANTHOR_PERF_COMMAND_TEARDOWN,
+
+	/** @DRM_PANTHOR_PERF_COMMAND_START: Start a sampling session on the indicated context. */
+	DRM_PANTHOR_PERF_COMMAND_START,
+
+	/** @DRM_PANTHOR_PERF_COMMAND_STOP: Stop the sampling session on the indicated context. */
+	DRM_PANTHOR_PERF_COMMAND_STOP,
+
+	/**
+	 * @DRM_PANTHOR_PERF_COMMAND_SAMPLE: Request a manual sample on the indicated context.
+	 *
+	 * When the sampling session is configured with a non-zero sampling frequency, any
+	 * DRM_PANTHOR_PERF_CONTROL calls with this command will be ignored and return an
+	 * -EINVAL.
+	 */
+	DRM_PANTHOR_PERF_COMMAND_SAMPLE,
+};
+
+/**
+ * struct drm_panthor_perf_control - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL.
+ */
+struct drm_panthor_perf_control {
+	/** @cmd: Command from enum drm_panthor_perf_command. */
+	__u32 cmd;
+
+	/**
+	 * @handle: session handle.
+	 *
+	 * Returned by the DRM_PANTHOR_PERF_COMMAND_SETUP call.
+	 * It must be used in subsequent commands for the same context.
+	 */
+	__u32 handle;
+
+	/**
+	 * @size: size of the command structure.
+	 *
+	 * If the pointer is NULL, the size is updated by the driver to provide the size of the
+	 * output structure. If the pointer is not NULL, the driver will only copy min(size,
+	 * struct_size) to the pointer and update the size accordingly.
+	 */
+	__u64 size;
+
+	/**
+	 * @pointer: user pointer to a command type struct, such as
+	 *            @struct drm_panthor_perf_cmd_start.
+	 */
+	__u64 pointer;
+};
+
+/**
+ * enum drm_panthor_perf_counter_set - The counter set to be requested from the hardware.
+ *
+ * The hardware supports a single performance counter set at a time, so requesting any set other
+ * than the primary may fail if another process is sampling at the same time.
+ *
+ * If in doubt, the primary counter set has the most commonly used counters and requires no
+ * additional permissions to open.
+ */
+enum drm_panthor_perf_counter_set {
+	/**
+	 * @DRM_PANTHOR_PERF_SET_PRIMARY: The default set configured on the hardware.
+	 *
+	 * This is the only set for which all counters in all blocks are defined.
+	 */
+	DRM_PANTHOR_PERF_SET_PRIMARY,
+
+	/**
+	 * @DRM_PANTHOR_PERF_SET_SECONDARY: The secondary performance counter set.
+	 *
+	 * Some blocks may not have any defined counters for this set, and the block will
+	 * have the UNAVAILABLE block state permanently set in the block header.
+	 *
+	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
+	 */
+	DRM_PANTHOR_PERF_SET_SECONDARY,
+
+	/**
+	 * @DRM_PANTHOR_PERF_SET_TERTIARY: The tertiary performance counter set.
+	 *
+	 * Some blocks may not have any defined counters for this set, and the block will have
+	 * the UNAVAILABLE block state permanently set in the block header. Note that the
+	 * tertiary set has the fewest defined counter blocks.
+	 *
+	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
+	 */
+	DRM_PANTHOR_PERF_SET_TERTIARY,
+};
+
+/**
+ * struct drm_panthor_perf_ringbuf_control - Struct used to map in the ring buffer control indices
+ *                                           into memory shared between user and kernel.
+ *
+ */
+struct drm_panthor_perf_ringbuf_control {
+	/**
+	 * @extract_idx: The index of the latest sample that was processed by userspace. Only
+	 *               modifiable by userspace.
+	 */
+	__u64 extract_idx;
+
+	/**
+	 * @insert_idx: The index of the latest sample emitted by the kernel. Only modifiable by
+	 *               modifiable by the kernel.
+	 */
+	__u64 insert_idx;
+};
+
+/**
+ * struct drm_panthor_perf_cmd_setup - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
+ * when the DRM_PANTHOR_PERF_COMMAND_SETUP command is specified.
+ */
+struct drm_panthor_perf_cmd_setup {
+	/**
+	 * @block_set: Set of performance counter blocks, member of
+	 *             enum drm_panthor_perf_block_set.
+	 *
+	 * This is a global configuration and only one set can be active at a time. If
+	 * another client has already requested a counter set, any further requests
+	 * for a different counter set will fail and return an -EBUSY.
+	 *
+	 * If the requested set does not exist, the request will fail and return an -EINVAL.
+	 *
+	 * Some sets have additional requirements to be enabled, and the setup request will
+	 * fail with an -EACCES if these requirements are not satisfied.
+	 */
+	__u8 block_set;
+
+	/** @pad: MBZ. */
+	__u8 pad[7];
+
+	/** @fd: eventfd for signalling the availability of a new sample. */
+	__u32 fd;
+
+	/** @ringbuf_handle: Handle to the BO to write perf counter sample to. */
+	__u32 ringbuf_handle;
+
+	/**
+	 * @control_handle: Handle to the BO containing a contiguous 16 byte range, used for the
+	 * insert and extract indices for the ringbuffer.
+	 */
+	__u32 control_handle;
+
+	/**
+	 * @sample_slots: The number of slots available in the userspace-provided BO. Must be
+	 * a power of 2.
+	 *
+	 * If sample_slots * sample_size does not match the BO size, the setup request will fail.
+	 */
+	__u32 sample_slots;
+
+	/**
+	 * @control_offset: Offset into the control BO where the insert and extract indices are
+	 * located.
+	 */
+	__u64 control_offset;
+
+	/**
+	 * @sample_freq_ns: Period between automatic counter sample collection in nanoseconds. Zero
+	 * disables automatic collection and all collection must be done through explicit calls
+	 * to DRM_PANTHOR_PERF_CONTROL.SAMPLE. Non-zero values will disable manual counter sampling
+	 * via the DRM_PANTHOR_PERF_COMMAND_SAMPLE command.
+	 *
+	 * This disables software-triggered periodic sampling, but hardware will still trigger
+	 * automatic samples on certain events, including shader core power transitions, and
+	 * entries to and exits from non-counting periods. The final stop command will also
+	 * trigger a sample to ensure no data is lost.
+	 */
+	__u64 sample_freq_ns;
+
+	/**
+	 * @fw_enable_mask: Bitmask of counters to request from the FW counter block. Any bits
+	 * past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit 0
+	 * corresponds to counter 0.
+	 */
+	__u64 fw_enable_mask[2];
+
+	/**
+	 * @cshw_enable_mask: Bitmask of counters to request from the CSHW counter block. Any bits
+	 * past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit 0
+	 * corresponds to counter 0.
+	 */
+	__u64 cshw_enable_mask[2];
+
+	/**
+	 * @tiler_enable_mask: Bitmask of counters to request from the tiler counter block. Any
+	 * bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit
+	 * 0 corresponds to counter 0.
+	 */
+	__u64 tiler_enable_mask[2];
+
+	/**
+	 * @memsys_enable_mask: Bitmask of counters to request from the memsys counter blocks. Any
+	 * bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit 0
+	 * corresponds to counter 0.
+	 */
+	__u64 memsys_enable_mask[2];
+
+	/**
+	 * @shader_enable_mask: Bitmask of counters to request from the shader core counter blocks.
+	 * Any bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
+	 * Bit 0 corresponds to counter 0.
+	 */
+	__u64 shader_enable_mask[2];
+};
+
+/**
+ * struct drm_panthor_perf_cmd_start - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
+ * when the DRM_PANTHOR_PERF_COMMAND_START command is specified.
+ */
+struct drm_panthor_perf_cmd_start {
+	/**
+	 * @user_data: User provided data that will be attached to automatic samples collected
+	 * until the next DRM_PANTHOR_PERF_COMMAND_STOP.
+	 */
+	__u64 user_data;
+};
+
+/**
+ * struct drm_panthor_perf_cmd_stop - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
+ * when the DRM_PANTHOR_PERF_COMMAND_STOP command is specified.
+ */
+struct drm_panthor_perf_cmd_stop {
+	/**
+	 * @user_data: User provided data that will be attached to the automatic sample collected
+	 * at the end of this sampling session.
+	 */
+	__u64 user_data;
+};
+
+/**
+ * struct drm_panthor_perf_cmd_sample - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
+ * when the DRM_PANTHOR_PERF_COMMAND_SAMPLE command is specified.
+ */
+struct drm_panthor_perf_cmd_sample {
+	/** @user_data: User provided data that will be attached to the sample.*/
+	__u64 user_data;
+};
+
 /**
  * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
  * @__access: Access type. Must be R, W or RW.
@@ -1237,6 +1800,8 @@ enum {
 		DRM_IOCTL_PANTHOR(WR, BO_SYNC, bo_sync),
 	DRM_IOCTL_PANTHOR_BO_QUERY_INFO =
 		DRM_IOCTL_PANTHOR(WR, BO_QUERY_INFO, bo_query_info),
+	DRM_IOCTL_PANTHOR_PERF_CONTROL =
+		DRM_IOCTL_PANTHOR(WR, PERF_CONTROL, perf_control)
 };
 
 #if defined(__cplusplus)
-- 
2.33.0.dirty

