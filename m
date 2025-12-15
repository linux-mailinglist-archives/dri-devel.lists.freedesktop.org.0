Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE63CBF315
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 18:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD68B10E671;
	Mon, 15 Dec 2025 17:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="PdNXcM1v";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PdNXcM1v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013013.outbound.protection.outlook.com
 [52.101.83.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D78710E671
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 17:16:25 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iQEL8Z8JcJujXXcqLlt8TapNFa4psWRjHk/AjdaaZylF5ir1VB3i0vlb8ZUkhpKgoFDnf5KHQQzXysX7azcGPvISU/Ash/PSVGl0xk1yK10/A3892Dfvh+HoqHJCMtIqDHyuVqgdjIIDttx6dPqKfqq0kJ3zfG7pKVKomRA3XQq8RI9aD+bvccO8ahgO9ES61vZaaecr7CkLT23rkeq34EHSpHUSLtmhFXUr3NkmeMEpGlmNKTEH6xlYpOP5UIhEZgDGbp39p4jn6tXZ1zyRgE3DZ/kCfl7MzPuUMkIjsL4q1SP13Pe/TBJb4tKfr9SL3RujRosfYp9AGlS70T4s1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4llMfgrNuUQwWDADwe6bVrm37cZ/4qEQzQT5YEy0LqQ=;
 b=rTUDHhwWz25nPKsWp2M+jeUqvvlhBtrvUmRu0Tvfpn90fL/pgZ21i/8l+XNOPdMy5npVMia/vmC27Ihc2HeHhBGZzh1JHFL6L3Rho1mArsd9+g/Pn2DfZDuNkVsE+W1bbvspXDoQh8jVTrH5UUAJdW2hfEqRPCH64XYDpI2QODjx3oCyEoXG+oWomLJ83uvZYXCUx+46byOJpgMgP5kcl5+hfltiadaEjyvtKVEbUE80fm5Zfubf08yag7eP6B03fa8XiSL66Q17ibsMkuYQYsRcPEAp2DSliWa9t633VSxwMwjnVcEItdenbnTXyrlYl+/xJGs8GtKunbafa4ucUA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4llMfgrNuUQwWDADwe6bVrm37cZ/4qEQzQT5YEy0LqQ=;
 b=PdNXcM1vcOGDJp+kuPu8oGi/h0pCCh18hGFEXAl1PbXtFXsa8emoK0Tj3SrTnquIUqI7JV8eB6SL9Xt0aiA/lAK2QNEt2MoDmxqxCr1TLx+2Hi1r/eC8FuL+od0Y37M/Mcp4DPohZz2jAn1ZT0HlepxwHgrhPP4vEpwoQ2POK/o=
Received: from AM0PR02CA0173.eurprd02.prod.outlook.com (2603:10a6:20b:28e::10)
 by AM8PR08MB6594.eurprd08.prod.outlook.com (2603:10a6:20b:36a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 17:16:19 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:20b:28e:cafe::d5) by AM0PR02CA0173.outlook.office365.com
 (2603:10a6:20b:28e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 17:16:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Mon, 15 Dec 2025 17:16:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2Zws8Oha1IHEbCV/2V/24Se8+CmM14R8W63fXqr00pPEEu+Yb8zguxcd9/jACbrVqIBRe8xpLVMmGJXLM+YM0Un9pta6tQnaOCOeW3PhrW7QN/2QvcnHsSSxxCyTKPE/afn8P3N/qSGt+xJ2tBRptnaOkH9gncT92FmXmhD7j8okx7ziGjX4KORg+oxVYxeL7535STXL2dOAfZvRHlvYBAZQyv9dytKxQsKty5HZIurOKPLYcXHqFmVWermMuQqdUeFpTSX5kkW/HqUbt+2oxHskyAauzbzhRCExMV1g7ntB6ynOhiiHiUQwxYj3iiPbds9a4UFzppagmv7ZL3s7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4llMfgrNuUQwWDADwe6bVrm37cZ/4qEQzQT5YEy0LqQ=;
 b=ncAI3bpSm9Vhwl310HEFdxy79tc6QWZVPCPx0OrWu/QlCauIXzp4m1p5C1wvl2KfwMXG5TfiQnmtYwPf+Y0xRdhHfsDpBGPzcItZlBo/Jk1HLPjKBZChGZ9JHFR+Gy6klGtfxZK3+VEY1Vbbk+1BqUbD4ftdKUKKrRs8gF874vJ7E72AneyNGnel4srMJD78/pka+ETl1duzwv7ouBxaHV3SJhkaGkR5YgHiLrZfZDNt+Oc4pz8l2i0T9LNGoNV9yuq9H2HVS5QdcCO0U7Xc8zCQIdGIcB7sOF5W8ECSl2X1kyMbnkMwQVnXkesBakoMXrogjj496r/RpfXaGprM/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4llMfgrNuUQwWDADwe6bVrm37cZ/4qEQzQT5YEy0LqQ=;
 b=PdNXcM1vcOGDJp+kuPu8oGi/h0pCCh18hGFEXAl1PbXtFXsa8emoK0Tj3SrTnquIUqI7JV8eB6SL9Xt0aiA/lAK2QNEt2MoDmxqxCr1TLx+2Hi1r/eC8FuL+od0Y37M/Mcp4DPohZz2jAn1ZT0HlepxwHgrhPP4vEpwoQ2POK/o=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by GV1PR08MB10607.eurprd08.prod.outlook.com (2603:10a6:150:16c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 17:15:15 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 17:15:15 +0000
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
Subject: [PATCH v6 6/7] drm/panthor: Add suspend, resume and reset handling
Date: Mon, 15 Dec 2025 17:14:52 +0000
Message-Id: <20251215171453.2506348-7-lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
References: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0119.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::6) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|GV1PR08MB10607:EE_|AM4PEPF00027A5E:EE_|AM8PR08MB6594:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e071e1-d7cc-48ca-ee27-08de3bfda980
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?9ZZGWaE6hjyaKuR7HPn4PQzAqPZ0F9JKs4Rleme8PgfeT9N7Bu4oYqBnOt3G?=
 =?us-ascii?Q?JfdD3WG+wbMHLstxmiCpOZ4sFbuedXbyoySm+WzCkIWUO7iMErFiyebUr9s/?=
 =?us-ascii?Q?c45NG7LdRcWJf1JyZZeJCLIgYrF9cx+tqMPEftkYenbKjzySCXIk0GfJYk3K?=
 =?us-ascii?Q?lrpF16l0YqEYynB4SGypUfSnRuJh9XMFXUTMWvyWtngJ2tQeGTaNbGzSy3VQ?=
 =?us-ascii?Q?zGI9Ht1xEm42V7LN0xvY4bCzNm9rMhEwQvRWOdaLwwMxyk4NHj4GPYhSqDJY?=
 =?us-ascii?Q?wRJ2ipF8GVDlGv3eb6qZYZNkJitt1ou2sy/t0ExzC3YtYudGbwsp8vj8wYP2?=
 =?us-ascii?Q?/3iW8I89AhDkWCtTq5r5ZLN7N6lSCJvwFX3jdu2yepIiLnUNqNZpJgXO713H?=
 =?us-ascii?Q?fofJU7wEOz0O0cowZF8hXhIPv1vyN7uozP9ye0iLaU+4rmaThwQFUnmi6AdE?=
 =?us-ascii?Q?ny28FBH4bw0AKvDA1G3a6wqH6MUePIkIkw9s1hysUFJ0MGxCD2dgyXAgvC/s?=
 =?us-ascii?Q?bBgIXggei9yuh4WVl91K7/k10CCNZAXc0ijBcF8rUAkSBrjpfQVvbczUxweL?=
 =?us-ascii?Q?EFBeiI6n812I5e3xr48wGc53n/RqfOgRfeAZP7O7P3HPnGHVZbcK+jqVnEYv?=
 =?us-ascii?Q?V0Hgk79Yf/Q69I78wq+waUdPwmZMHfGc5NkgFXdmure7wWw2LKh1BxQ4QuUs?=
 =?us-ascii?Q?HLvjWBODUiAqil7Jv87UpKJAgxyHAwrn2gtnoEbAtKv6t1fdC7bW1cerBuTi?=
 =?us-ascii?Q?ZUI7Y/jxfkxylzNUZLzJu8T94g1T4nw8R0fBqpmD2jUu5IiJxsFvIRWnvCyT?=
 =?us-ascii?Q?LuQOqDb/HJfIsFIC1YNgpjSA0BDorQeKc4bgjOqBN3W5Yv/R+EL6VyYwHRwI?=
 =?us-ascii?Q?aA0lZJZJHUfj8rCfVjXArsMIDRArG7eQSC1O0gKDLT/9BC69atHL06P6yBZP?=
 =?us-ascii?Q?CDEAFzSl1AWkj0J8WUHFBf/9w66DL/gqBNPC+OktoPBSQJ2QU05G8buPdeVx?=
 =?us-ascii?Q?MXIIUGXR11glTsQiGPku3BSZgm+qyllmluGXO5G7KFAabt1EiV75f5zB6oWu?=
 =?us-ascii?Q?3Dggkb7alpHOyy2MD8gTiyBLHYolg1rWI0roD0D675ShzBbQLSJ1/AdzsAfm?=
 =?us-ascii?Q?7Q2jgDmIZXptzJdbOZnxkpczQRx+++gl7i9DuA/fxe9HFUEZ2R0KSMhkj0uF?=
 =?us-ascii?Q?62+ZSdGQx3vsDqUmNLIAawd36Cgl/98fb7C/06LUMIttCMp4U4JeDbf2eubu?=
 =?us-ascii?Q?MziQNtV8fCtbDtWncfyNGEnSgV6trBWiyDm7dRLQx7f1Zq7Q8eLYHYAx2B44?=
 =?us-ascii?Q?xxWLbo3hBzxb0zs+lGvTXgAQR0LLa0DOHNcsdIz/CsMtN9jAZ83UHCCZnRPq?=
 =?us-ascii?Q?gereQzJFxJDZ1otfPXW+DhSBvioNFfqZQqojYt0irvKMQPgP0iI01I0stPXl?=
 =?us-ascii?Q?vMWl1DF4HINUprB0SWiQuthSip6UDvQB?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10607
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 68c3e2c4-39cf-4c5c-1489-08de3bfd8364
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|82310400026|14060799003|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aTukTC8L9/k/4ONpYzaZYBYGcPnygC7ZCOS6mjkfAh4T3qh2BB6Tit6NLS7V?=
 =?us-ascii?Q?gL0UBcE1z0ZEesG/lkOR0zoJAddHSVTUUXDPzVGfGoI1jbWpzP/9VSvQWqWp?=
 =?us-ascii?Q?xbuln7/dW//9TMhDKsxzSX3cikGa2+HdJ98i0H3xEVXuYYmPZHrp5dWuTof9?=
 =?us-ascii?Q?fWupNRkwDDdt+dhcX9tXEHlJy0pFqHWX4u0p23JGBXduMXR8zvH0KUZnf0ll?=
 =?us-ascii?Q?aHPQvVkojv8hjJooQFGdCSQfnAFkdQV4qChsP4JleNks27T9KPgzzqz31oRy?=
 =?us-ascii?Q?xp0jjwr/0G9qLyuQQzWiFLnOqllgauma3qJQ57hCceUckYzKCgYmI912lwMy?=
 =?us-ascii?Q?qLQ9UkMMFMDo+uPCWGP+liISGHrdQTR2IfbyNgy9GHcOthX1cSo4wPHPjiOi?=
 =?us-ascii?Q?T5499yD6IlUXk6PruGQlPwCp9OkTKzqPEAZaiTD5aI1l48OSWNGasH4UNUgz?=
 =?us-ascii?Q?To3SVulYRGWnmGdTA59N8nJ+7SK1NaO1YA2RRgp7rQyTC0lPoDSp9UnmLE2m?=
 =?us-ascii?Q?gOWEU+lkE3AGrh3YiiNvBo494ZfatljMgNOJU2Lsl/v/t6NuO23OXItWHsIa?=
 =?us-ascii?Q?pI8WiO1XAdmWbyMPxSgU8LC+4qXMu638tJ0erbzU09TNleQ4k1H0lIuBUco9?=
 =?us-ascii?Q?sAwwC0f4p63bGsucz7xuVYydPnzyNNeGem6TNKbJSiy4KyhhJ0eBAlkqCdPm?=
 =?us-ascii?Q?RRdqg8CaDc3+6MM912uih6lAnC3kvverVV7PtuYaetdBgYaaa/XLyU2JWRjA?=
 =?us-ascii?Q?zxL5eR3FhyuOXbzl2b7ONWXkmHvyfdY0iOFSptRPyT+SBgj2hsYYj8OpS76h?=
 =?us-ascii?Q?iDPQcH4inPSEYGffeO/OuNv0rzwo9dOGsJVu4ooppzWvEal9VGx+k0L0A30q?=
 =?us-ascii?Q?6JBmhALXCxp8cEw7wA3IEPZgvR4HRWkSWrDCFADkIyuOGIrJ1NV9mFlV1V0C?=
 =?us-ascii?Q?W/tGO+S4VM8o4zTL/o4MY/MfqibFNwaPg9LIJh33MGqX9AKpScP+o0U2KJE0?=
 =?us-ascii?Q?efL2IpiEOugC4/VuZFE5eZL9g/zrQCIfNfBj0pMqECq4NRXnjRfkqrIbgdbh?=
 =?us-ascii?Q?Qqr1E6Gj1Z7Wh/9N/VraUuJyscbraUKCPXIDk8aG4bHR19vLm1ulFRgmbVd7?=
 =?us-ascii?Q?DuF+knesOvz4PmMeFYh6pjePXcfVNIAPwvn1KASmAnyYxOkwjmMRiUamNAqn?=
 =?us-ascii?Q?bg0Asx9xIcy29u1SCtnBt1qA1YSs9f0wfI6my4R9nxtZQiv30qmaTR3Mkjo3?=
 =?us-ascii?Q?uk3CTzqW0tqa2o0ftM0Gkho2EGKvhkDcJKdiqjnhj/acKe0WpH33t2IpESD0?=
 =?us-ascii?Q?aDu+qyyc01lOzX8qBZNDj0Jv9SIVV6JisTG/vI/DEf2/8X6+WJczN1qARog/?=
 =?us-ascii?Q?v8uZP1NUN1b0a/XGrKkSf4Z73PA+0dU0s06fRicq6Egd3cV/q+TA7eGgr1FK?=
 =?us-ascii?Q?+EtLShT9xRn4Y/ecv1vIKOobGuRCxtggaiFhZ6bFSsLrZnaeH19r/nxfBDwj?=
 =?us-ascii?Q?XdWcfBqZX++PJLAAJOI5L5LHCC6eH6JovfiVqwYe06CHXM3IlgBXtWlMdw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(82310400026)(14060799003)(376014)(36860700013)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 17:16:18.8788 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e071e1-d7cc-48ca-ee27-08de3bfda980
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6594
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

The sampler must disable and re-enable counter sampling around
suspends, and must re-program the FW interface after a reset to
avoid losing data.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |  7 ++-
 drivers/gpu/drm/panthor/panthor_perf.c   | 71 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_perf.h   |  6 ++
 3 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 3063ffbead45..e6e279d91eae 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -162,6 +162,7 @@ static void panthor_device_reset_work(struct work_struct *work)
 	if (!drm_dev_enter(&ptdev->base, &cookie))
 		return;
 
+	panthor_perf_pre_reset(ptdev);
 	panthor_sched_pre_reset(ptdev);
 	panthor_fw_pre_reset(ptdev, true);
 	panthor_mmu_pre_reset(ptdev);
@@ -171,6 +172,7 @@ static void panthor_device_reset_work(struct work_struct *work)
 	ret = panthor_fw_post_reset(ptdev);
 	atomic_set(&ptdev->reset.pending, 0);
 	panthor_sched_post_reset(ptdev, ret != 0);
+	panthor_perf_post_reset(ptdev);
 	drm_dev_exit(cookie);
 
 	if (ret) {
@@ -549,8 +551,10 @@ int panthor_device_resume(struct device *dev)
 			ret = panthor_device_resume_hw_components(ptdev);
 		}
 
-		if (!ret)
+		if (!ret) {
 			panthor_sched_resume(ptdev);
+			panthor_perf_resume(ptdev);
+		}
 
 		drm_dev_exit(cookie);
 
@@ -614,6 +618,7 @@ int panthor_device_suspend(struct device *dev)
 		/* We prepare everything as if we were resetting the GPU.
 		 * The end of the reset will happen in the resume path though.
 		 */
+		panthor_perf_suspend(ptdev);
 		panthor_sched_suspend(ptdev);
 		panthor_fw_suspend(ptdev);
 		panthor_mmu_suspend(ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
index e8f26805fe3a..208f93d516d4 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.c
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -1894,6 +1894,53 @@ void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_per
 	}
 }
 
+/**
+ * panthor_perf_suspend - Prepare the performance counter subsystem for system suspend.
+ * @ptdev: Panthor device.
+ *
+ * Indicate to the performance counters that the system is suspending.
+ *
+ * This function must not be used to handle MCU power state transitions: just before MCU goes
+ * from on to any inactive state, an automatic sample will be performed by the firmware, and
+ * the performance counter firmware state will be restored on warm boot.
+ *
+ */
+void panthor_perf_suspend(struct panthor_device *ptdev)
+{
+	struct panthor_perf *perf = ptdev->perf;
+	int ret;
+
+	if (!perf)
+		return;
+
+	ret = sampler_disable(&perf->sampler);
+
+	if (ret)
+		drm_warn(&ptdev->base, "Could not stop sampling before suspend, err = %d", ret);
+}
+
+/**
+ * panthor_perf_resume - Resume the performance counter subsystem after system resumption.
+ * @ptdev: Panthor device.
+ *
+ * Indicate to the performance counters that the system has resumed. This must not be used
+ * to handle MCU state transitions, for the same reasons as detailed in the kerneldoc for
+ * @panthor_perf_suspend.
+ */
+void panthor_perf_resume(struct panthor_device *ptdev)
+{
+	struct panthor_perf *perf = ptdev->perf;
+	int ret;
+
+	if (!perf)
+		return;
+
+	ret = sampler_enable(&perf->sampler);
+
+	if (ret)
+		drm_warn(&ptdev->base, "Could not resume sampling, err = %d", ret);
+}
+
 /**
  * panthor_perf_unplug - Terminate the performance counter subsystem.
  * @ptdev: Panthor device.
@@ -1927,3 +1974,27 @@ void panthor_perf_unplug(struct panthor_device *ptdev)
 
 	ptdev->perf = NULL;
 }
+
+void panthor_perf_pre_reset(struct panthor_device *ptdev)
+{
+	struct panthor_perf_sampler *sampler;
+
+	if (drm_WARN_ON_ONCE(&ptdev->base, !ptdev->perf))
+		return;
+
+	sampler = &ptdev->perf->sampler;
+
+	sampler_disable(sampler);
+}
+
+void panthor_perf_post_reset(struct panthor_device *ptdev)
+{
+	struct panthor_perf_sampler *sampler;
+
+	if (drm_WARN_ON_ONCE(&ptdev->base, !ptdev->perf))
+		return;
+
+	sampler = &ptdev->perf->sampler;
+
+	sampler_enable(sampler);
+}
diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
index 5a14854368eb..1044b0a1cfaa 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.h
+++ b/drivers/gpu/drm/panthor/panthor_perf.h
@@ -14,6 +14,8 @@ struct panthor_file;
 struct panthor_perf;
 
 int panthor_perf_init(struct panthor_device *ptdev);
+void panthor_perf_suspend(struct panthor_device *ptdev);
+void panthor_perf_resume(struct panthor_device *ptdev);
 void panthor_perf_unplug(struct panthor_device *ptdev);
 
 int panthor_perf_session_setup(struct drm_file *file, struct panthor_perf *perf,
@@ -30,5 +32,9 @@ void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_per
 
 void panthor_perf_report_irq(struct panthor_device *ptdev, u32 status);
 
+void panthor_perf_pre_reset(struct panthor_device *ptdev);
+
+void panthor_perf_post_reset(struct panthor_device *ptdev);
+
 #endif /* __PANTHOR_PERF_H__ */
 
-- 
2.33.0.dirty

