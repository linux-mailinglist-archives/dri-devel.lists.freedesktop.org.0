Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E79EDB12076
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 17:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D3010E216;
	Fri, 25 Jul 2025 15:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="pypG/oWH";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pypG/oWH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011002.outbound.protection.outlook.com [40.107.130.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D114410E20D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 15:00:01 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HmazwhZhKu8EHOXMWXgQYIrtJGnu+2zcjv6QktbT0wRevEpqw9ZR90ZT5+WWtI4wSYIJe9l85B1y227pP9ktctMq8Uvyyj77E51AJXWtyD0Aw0Ok8c3GyJlhJd1jHRKxVmclCMVWdAF9ovYbsa43RCQAnk3H7VuP1fKTNKg3kVEYbGg7NplWDr/W1rGqK579gkadny5X0y32txGHJ2fikVOFN04a11L4mnCXVXDI6T0K+EQamwnOPF+RyLhIvIsKtMKa+IXMEha3pksgGpMmUR1MRM1uVpvI3E6PeDCuKev7dp5GlwWO+1o5kFGnAIQooFLHgOHBpyO2Qz9SnI131g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGic56JTfvh0F/Tw6+l17Pn7iDc1UVii59fuwT/iBB4=;
 b=STHv4lo8nBYoOs6L4qovDMTe7PUa+YBag9kPRqFw2LQBVc+6DmzSDNZGJaRgakUKLd5T7cvOr6KOBb1FAmpFUaG+5pdj7q4CiLWKP16doXf0u41ao0lH1Qb3Y7w8S6LFwTnpKBltnm+VNXTN7ZirRJ6xoS7++0oG9D7ojB11obyJMeK2Wthwy+hDXWqHE5lQ8g3GJbxpT15y2sI+ufQAbfwrAsyPWGyD6thKZDmLccdn9RBC6sA/S4FTwECVB5JOSAOXDDD6I3kmTit/7AR8hUmrJaqvfmBF3jHnpRW6EWaVQuxIxU5lTE/MaT78JgmZnb4p+J3u6VQZ3ANLmrwHGw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGic56JTfvh0F/Tw6+l17Pn7iDc1UVii59fuwT/iBB4=;
 b=pypG/oWHPbonmNA+LozrgH7dVGrSLp9bTY+41NUyZxhkK+Hder6XNW8JbdZFTKiV2oejwqt4SOFuRDTXb1CKqa9HroZh9nMj9Uey1rP+fWtd887+PEbox4QKV5LTgPHCHJfn8WJsCKoAk7vNal4mJixXNSysqrVhG5rITovuqYM=
Received: from AM0PR01CA0156.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::25) by VI1PR08MB10052.eurprd08.prod.outlook.com
 (2603:10a6:800:1c7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Fri, 25 Jul
 2025 14:59:58 +0000
Received: from AM2PEPF0001C717.eurprd05.prod.outlook.com
 (2603:10a6:208:aa:cafe::2f) by AM0PR01CA0156.outlook.office365.com
 (2603:10a6:208:aa::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Fri,
 25 Jul 2025 15:00:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C717.mail.protection.outlook.com (10.167.16.187) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Fri, 25 Jul 2025 14:59:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjLwtNnyI7q5xg6HoOTZfUBX6ppwf4En2CTC+b39oYcDFXRAnMlVAtD5WzwDPF0HDaA/sRAfpR4NmHHdVUVdTBQk+7RYYHJR5NCM7sf2k5ge1odSeno+w/VKNVaeO1PSf+x4e508rXhq6avbKxaksqzr8EWpCuSkTB/BGaKdFH2OvVzGkV/9joA0RXoaW1chhWimFPqunukCdODoJL7bWFNRNJei0OHl0TYvCJ1QXakCfSrLG8YSr3o6DzmJNoJc1yX5AduApnqh/ref8Rdxj8yJnyA7JnvvIcUSoQXINU5wWrl+wFCUtgFgvVhuGY8fW0ICcCgAF+xEd8Gw4TTp3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGic56JTfvh0F/Tw6+l17Pn7iDc1UVii59fuwT/iBB4=;
 b=mgCUG4bIW3lcGzqqXw8najPlfl21z6vfUMKLbCOPyj7Omd/e9yUIhC1uR6JO5c7U7eCVVKFkkvYE0h1vyIWLQH42SqnkpKJo3JJ2Z9QP7RNDsxOP5SlFGKbK08VhEb2+L0ebp9yzeXsYTekRDwviiwakDRTQF9hHkbHTUtZMXcsu6YF2qBBdw/9haohS9doDQcnjr73ZjAmwfJDicW06k9aCiqhETHkg52W3xW1nJjHOIkPiBFjO5USbfGVFv4jt+QQcF9YsQ6H0VhTufzGYbBgDCYraov6Ix/PyFCxW0vaTpp0dlXJr1si+tycHPjq+ZAAO9Bsw9zamQ5PIeoBBVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGic56JTfvh0F/Tw6+l17Pn7iDc1UVii59fuwT/iBB4=;
 b=pypG/oWHPbonmNA+LozrgH7dVGrSLp9bTY+41NUyZxhkK+Hder6XNW8JbdZFTKiV2oejwqt4SOFuRDTXb1CKqa9HroZh9nMj9Uey1rP+fWtd887+PEbox4QKV5LTgPHCHJfn8WJsCKoAk7vNal4mJixXNSysqrVhG5rITovuqYM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by DU0PR08MB8471.eurprd08.prod.outlook.com (2603:10a6:10:405::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 14:59:24 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0%4]) with mapi id 15.20.8943.024; Fri, 25 Jul 2025
 14:59:24 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v5 2/7] drm/panthor: Add DEV_QUERY.PERF_INFO handling for Gx10
Date: Fri, 25 Jul 2025 15:57:53 +0100
Message-Id: <8925f2211994f1a4b34f0ba8c61bd0ae2af7d397.1753449448.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <cover.1753449448.git.lukas.zapolskas@arm.com>
References: <cover.1753449448.git.lukas.zapolskas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::12) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|DU0PR08MB8471:EE_|AM2PEPF0001C717:EE_|VI1PR08MB10052:EE_
X-MS-Office365-Filtering-Correlation-Id: adf71240-fe14-4505-c0f3-08ddcb8beb3c
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?aTd5UVhVV1hUK3g2d0UrTWNoVnQyYUVDYlQrQjU1VzhaR1QwU3MxbzhYT2RS?=
 =?utf-8?B?Tlh6QVoxK09sblJkVGI0b3JiZ01IQ0FVZGlzc3lLU0wxNmJMc0NRUi9oK1ZG?=
 =?utf-8?B?bGMzTUxUM2pvVGtKU2FDbzBrZEoybnhJQ09BdHY4TDA4azg5aS9XSlZQWHR0?=
 =?utf-8?B?Yk1GSzZQbkVobGg1ZGZReGFPZ0VxMEdVOHVrbXRKeGNWY1NzcDVBOVp1Skl3?=
 =?utf-8?B?TFN4ZkYvTEJONDVwS1ltYWVxckxTMEF6YTZpMUVnYjRjQ1BndWM1ajFtcFNh?=
 =?utf-8?B?V0Y1L0hodUV6bkxFNWM4NGhOWEkyZDZ4eWpteTJGSjA4NEhqMHRSU0RKQXFa?=
 =?utf-8?B?K0FuRWVrVUNJbGdEaEhlSFY0UisyQ0JtdjA2TVo2eTZCcmhFT2NJMjZZL1pY?=
 =?utf-8?B?blY3SDBVZkY3MTlua3Q1c1Q1a2xpUWtjQ2RSS21KM0RhT3QyblFRK0Z1TXNX?=
 =?utf-8?B?cFJkU3hON2tiRVdFZkgwYm9pZXFmdko4SEQ0MS9mRWlDd1YvaURVWi81V2lw?=
 =?utf-8?B?bTA0eGVCZEtlNmRtb0FWdUwxeGNtSGFUWm9ONjRFdWx4WnZiamI1TmtYbThv?=
 =?utf-8?B?ZXJabGZlZmVaWWpqN2NYSEVXQUdrbmVueVlTdEYxWTExdG1JUXpyb3QrYTVC?=
 =?utf-8?B?cWoySGRMRGY0Rlp0b3pSQWNZckNnY0x4RXJCcTFqS001aW9vTjZRRjgyeTl6?=
 =?utf-8?B?Um1lckRMUmhBaERoc3FabVlsY2VnbXdHcUJoRW81R0RtNFNWT1JqSnI3bk5F?=
 =?utf-8?B?dUxzUGdScjJ3VFZTQVprODQwZWdFYUZJRnJhR3kwcFhoR20zZ2huZkxwcGZm?=
 =?utf-8?B?MGk3ejhVcVRwRTNoL0JpWktjN2pkbnM4T3AxNUoyeEdNUUMvSDRrKzBNZGFv?=
 =?utf-8?B?WWZLT1dhQWF2YjVUZ3lRSDJ3YU5UN3ZtOWVMeDdkajhSZkNqNDhtdHNmZ3k0?=
 =?utf-8?B?cG5aSkRqRDJUQmRVcVRWeE5PYWdqN05pd3dvemtSeG03djdId1p0RkRoc05t?=
 =?utf-8?B?MjB3VlYrSVk4NkpUMlRjcnFhcXNwRHVhejdodGxVbFN4MzRuN2taK1Q2U0Nq?=
 =?utf-8?B?a1lDb01QWVRSNmsrTFQ0UlNUaDlubjlieGM1dUVQbnp0bHM5RWdDaVAySTRR?=
 =?utf-8?B?NUJRRFcweTJvR01MZUNFSW8wWkwvTytGVFdiZlQ2b2NOU1pVb3hxaE9seUt4?=
 =?utf-8?B?amx4UFlROVJrb1Y4anV6ckFQb0U0aFBpTzN3N01pd2xMVlpiWkVJVE9LTldn?=
 =?utf-8?B?Tkk2WnlXcnpOdlRjSTVielRqbVptSVpOK2p4UXhRTWN3U1l4Y3Z0UVZKK2Zy?=
 =?utf-8?B?dHMzMUE1eWNDWURlRjZ6Sm1aMFBmRklmUkpaL1NnK3ZPSTZDT0RzZXlsMm0x?=
 =?utf-8?B?emNBZWhZV1dDeUlTZ2lROG9hUUw4T0pBdXQ3UHpIL1dzTTREeVB1SytmeGJE?=
 =?utf-8?B?eFRhR1k4OE82L0FZWGYvM1R1TG8xT1I3Qm9vbFE2UjYyTUhjZHZkT1RacGdJ?=
 =?utf-8?B?dkRydytLZ2F2UFdDZGNRUlZVdHU3enFOTmdjMVhNVEdGcmdxbkh4U1lDcTFK?=
 =?utf-8?B?SDVGS1dSZDY1dlJwYUthNklGK09Hc0VzTTNJcXpjblVvMUxBVGlLTks0ZFdi?=
 =?utf-8?B?Z2wvdTdsK0VVMXROKzhEdS8zRWZQSGdFZ0k2UTFQemc5dHg4TEhMUmplMDY5?=
 =?utf-8?B?d1h2ckYrWlZudHZoZ1d0a2diVjMwaUxzOFo5cFNBcXRWZHVrNU9hVGlkNGU4?=
 =?utf-8?B?NDJVVmlYRWVCajU2VWFEK2dSdVRzVndnUVdQUGxJREZlN2xhV1U2NXNNNzB5?=
 =?utf-8?B?Rm1BL3pOMjA4TlRlLzQrSGpJaDNteVR0MjNzZmxiOWhUaW8yamdnMDUwMm9s?=
 =?utf-8?B?ekl0Qmg4anE2dy9HREE1WEs5YjRqVkVleGwxMjlBMjZEaEE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8471
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C717.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0ed0a009-a552-4606-7216-08ddcb8bd805
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|14060799003|35042699022|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3RaRjVwZkttNmRSVUJHU05nU1daWERrSEltYkhFRTFEbDFBeGpXQjZNSWMz?=
 =?utf-8?B?bDZXN0tpV2xzUzJUZGtXNmt4cEJQc0t4em9zdVdJM1pUdDNKQXJ5M1dRdlNx?=
 =?utf-8?B?UEZFelVnTlFrVndsY2FEZnFqV2Q0Y2dpZXpJdnlKOE5sK1kwZVM5K1NFdlMw?=
 =?utf-8?B?U2RuaWY2YVVSMXRhVTFxY3BXSk9XYk9id1VsaEVZcEtlOFNOYWVZS2FiYWVy?=
 =?utf-8?B?NVpFTDhxM3g2R2F5R0ZzNHAyUjRrL290ckFaelRtd01zeUZtRjh2UUFCRzU1?=
 =?utf-8?B?d0FaYVpQZHlrRXhaL2pORXoreTBKR2ZjZUxSMnRxeXdiYWhlR0dhNWM3Qmo5?=
 =?utf-8?B?VEljK2hsY1NnNjZ5SlBodzR2Qm1XalpJRm9BbGNQWXlDc1dXTXNydVd3b0NG?=
 =?utf-8?B?UGxZcStCOUxnMDJlYTh1eVBpWlJZMUhQZnNkUnF4aEIvQ2xmaCtBa2I4RUo0?=
 =?utf-8?B?UzNxc0grbHpoTFhhdHREdGllQWxRL01kQlNJY09nUnBUZ1JvRXljaVlUbzh3?=
 =?utf-8?B?L0ZURWFGYksvclFldW1zYzQ3cEpUbEVHOHUrdklTdmhPTEpLK1UxRFk1TlVa?=
 =?utf-8?B?Vzd6Y1dPSmIvMXkyQ3NvbVJPZ2VOL0QwS1RlRGE3dzRqOUg1UldxTG5wS0dr?=
 =?utf-8?B?ZFAvWGx5dnJHVnlLc0xDZEtISG9kb3ZSMW9TalJJMXh0aDFDMTN6MkRZUVc4?=
 =?utf-8?B?Zlp2ZmNQdXNBNkFLSVE5SExGNUlJRU9jYjJIaTM5dE1pRHR5L3d0UDRQbS9E?=
 =?utf-8?B?YjViSHVHVit6THdUWUxxbG9hWm5uNWhLdnR3cFJRV0tsSXhLa1B2WTdycVI4?=
 =?utf-8?B?R3RnREF3RXdRRDh3RlZpejV4SkNQVG5QMkt2VlN2WU10UnhsOXFSbmdjek96?=
 =?utf-8?B?QklaWVNhUFgzTGo3aGlXakdzcEc3b2hHZUtyb2NYK0tLL0wwaWp1NXdodXk4?=
 =?utf-8?B?dVJ3VmhNb002cHNaTUt5ZXlhTGt0WlJWMk1mSzR5Sm5ROXVMclFRcUlQYTE1?=
 =?utf-8?B?RTRrellTc09uYmUvNGVna3laME9tUWI0M0JZd2poWDJOTlhqbDVXMkRIb3ZL?=
 =?utf-8?B?L2FZUWdYVVhNMXRoeE5WUTRlemh4SUt1aXhpeXlVbTJ2QnA5Ums1OXpRT1U5?=
 =?utf-8?B?NXZUVTRhcHUrREozaWhxTFVxL1IwaDRNc0VSV2lPNFdFWmJPckN1aERDRStR?=
 =?utf-8?B?QU5UYUNwVm1VS005QzdZSWRsdGV5b2FKT1V0d09SMU1WS1YzOTlleG1EdmR2?=
 =?utf-8?B?ek9SdU9tcUtTVGZhdHVraU1SL2R5cGlTL0ZUOVpxQXhzTVlBUGJLa3BxK3VJ?=
 =?utf-8?B?L2ZCNTJrbnU0RCs3dlg3ckVhczVpaVlZUzdMOEs1SjNFSXp1a0Q1VFR1VXFM?=
 =?utf-8?B?MkVtS0JTb2lJeUFyU2hTbHl0dGpVb3NudU9MRHBtR3hwb0RmMTNYd3F4YjNN?=
 =?utf-8?B?TzdtWStrVzJPU0ZkaHo4UEhPY2RiY2k2K3E2VXdiYWN4SW8xWGpwVVJ2SWh6?=
 =?utf-8?B?eEFFRlNPMk56cVAxU0NoUDBvVzNDZXVXa3M4UGdEenlIZ2tQZ0I4RkEwQzRB?=
 =?utf-8?B?Q3g0QmUyWFJnYUNVbi9odzFOcDQwWTJaVEVyVWhNRXN0VXdUaXlWWU90OXZY?=
 =?utf-8?B?MTNOaHRFd1QzeUVTNVppT2p1R2NNa2JWMkxoNEl5bkUrbnFCLzBnTUNzcnFq?=
 =?utf-8?B?d3FuY25ZNDVnTUxDV2ZVT1kzZ2M4c2xyaU40VzNhWkxPZUU3SklRa0xzRXox?=
 =?utf-8?B?RUZkMCtOVDNjc0lEMWZMRS9aNEtiOU5VbmhaejRSK080MU1ENGszR1NFM0kw?=
 =?utf-8?B?Q0RPcHB4Z2hIWUtsaDZNRzgvUTVnSHpybXhlQXpvQ3g4cWhnbWtwVVhJQlVv?=
 =?utf-8?B?Z0EydlMyRVRERjc5WFNLa0xZV0ZkcGdyb3pkQkxVL2tsM2MxTEZXMWJQTFg4?=
 =?utf-8?B?emJkd2l1eHdLWUt6dmVHdVlndHdMTks0L0plYjV6SlorWER0U2NhTWEyMHhy?=
 =?utf-8?B?Z04xbFZzRmU5M1Bua3NHdGZxZ3lxZDJ2Y1NnUkZ0ak9vSWVhZmh6UmhCL3lp?=
 =?utf-8?Q?z7scgw?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(14060799003)(35042699022)(36860700013)(1800799024)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 14:59:56.2951 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adf71240-fe14-4505-c0f3-08ddcb8beb3c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C717.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10052
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
 drivers/gpu/drm/panthor/panthor_device.c |  7 +++
 drivers/gpu/drm/panthor/panthor_device.h |  3 +
 drivers/gpu/drm/panthor/panthor_drv.c    | 10 ++-
 drivers/gpu/drm/panthor/panthor_fw.h     |  3 +
 drivers/gpu/drm/panthor/panthor_perf.c   | 77 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_perf.h   | 15 +++++
 drivers/gpu/drm/panthor/panthor_regs.h   |  1 +
 8 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.h

diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 15294719b09c..0df9947f3575 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -9,6 +9,7 @@ panthor-y := \
 	panthor_gpu.o \
 	panthor_heap.o \
 	panthor_mmu.o \
+	panthor_perf.o \
 	panthor_sched.o
 
 obj-$(CONFIG_DRM_PANTHOR) += panthor.o
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index f0b2da5b2b96..15ab329722cc 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -19,6 +19,7 @@
 #include "panthor_fw.h"
 #include "panthor_gpu.h"
 #include "panthor_mmu.h"
+#include "panthor_perf.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
@@ -264,6 +265,10 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (ret)
 		goto err_unplug_fw;
 
+	ret = panthor_perf_init(ptdev);
+	if (ret)
+		goto err_unplug_sched;
+
 	/* ~3 frames */
 	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
 	pm_runtime_use_autosuspend(ptdev->base.dev);
@@ -277,6 +282,8 @@ int panthor_device_init(struct panthor_device *ptdev)
 
 err_disable_autosuspend:
 	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
+
+err_unplug_sched:
 	panthor_sched_unplug(ptdev);
 
 err_unplug_fw:
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 4fc7cf2aeed5..720d39b9e783 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -120,6 +120,9 @@ struct panthor_device {
 	/** @csif_info: Command stream interface information. */
 	struct drm_panthor_csif_info csif_info;
 
+	/** @perf_info: Performance counter interface information. */
+	struct drm_panthor_perf_info perf_info;
+
 	/** @gpu: GPU management data. */
 	struct panthor_gpu *gpu;
 
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 9256806eb662..8b1e3e38b12e 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -175,7 +175,8 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
-		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs))
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
 
 /**
  * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
@@ -835,6 +836,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
 			args->size = sizeof(priorities_info);
 			return 0;
 
+		case DRM_PANTHOR_DEV_QUERY_PERF_INFO:
+			args->size = sizeof(ptdev->perf_info);
+			return 0;
+
 		default:
 			return -EINVAL;
 		}
@@ -859,6 +864,9 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
 		panthor_query_group_priorities_info(file, &priorities_info);
 		return PANTHOR_UOBJ_SET(args->pointer, args->size, priorities_info);
 
+	case DRM_PANTHOR_DEV_QUERY_PERF_INFO:
+		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->perf_info);
+
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index 6598d96c6d2a..8bcb933fa790 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -197,8 +197,11 @@ struct panthor_fw_global_control_iface {
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
index 000000000000..e58a62ad7988
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -0,0 +1,77 @@
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
+/**
+ * PANTHOR_PERF_COUNTERS_PER_BLOCK - On CSF architectures pre-11.x, the number of counters
+ * per block was hardcoded to be 64. Arch 11.0 onwards supports the PRFCNT_FEATURES GPU register,
+ * which indicates the same information.
+ */
+#define PANTHOR_PERF_COUNTERS_PER_BLOCK (64)
+
+static void panthor_perf_info_init(struct panthor_device *const ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	struct drm_panthor_perf_info *const perf_info = &ptdev->perf_info;
+
+	if (PERFCNT_FEATURES_MD_SIZE(glb_iface->control->perfcnt_features))
+		perf_info->flags |= DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT;
+
+	perf_info->counters_per_block = PANTHOR_PERF_COUNTERS_PER_BLOCK;
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
index 48bbfd40138c..d613ce723981 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -27,6 +27,7 @@
 #define GPU_TILER_FEATURES				0xC
 #define GPU_MEM_FEATURES				0x10
 #define   GROUPS_L2_COHERENT				BIT(0)
+#define   GPU_MEM_FEATURES_L2_SLICES(x)			((((x) & GENMASK(11, 8)) >> 8) + 1)
 
 #define GPU_MMU_FEATURES				0x14
 #define  GPU_MMU_FEATURES_VA_BITS(x)			((x) & GENMASK(7, 0))
-- 
2.33.0.dirty

