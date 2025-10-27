Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093E6C0CFB3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 11:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE3C10E43C;
	Mon, 27 Oct 2025 10:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="JUJ/iiG+";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JUJ/iiG+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013061.outbound.protection.outlook.com
 [52.101.83.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF2F10E43C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 10:36:56 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BbyD+SxPn64lQQem7XTLdEES2kWI6ncTipLQYpTpcYXFr50kU8GdnrvozvrNW8mf8KG7hCpKaHdNuv8QWh7tSzop8W5Oqj5dBRmuo/y5Cw4NJDH+Qg1nWVORY28WWchHF7eIbzTlq5qFQft95bfjjIFkGkUNr1s2lznhH3IB6VI7K7iV/dSJu9kVxC8gTXFRp6rY4kkpMbZskT5QnCsdsweq541pBHp3hNhBotmZOd7OA+pbvjenQkYi/ujWM6FJK63f1j3ufEdNXAv1ABEB0POsTNlcbPR39II74/WOsep9lUJBBg3i0iWf48bekJjq5fWqqzP2sWmvr5JHdRprvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nl95ZUKCcWig4KMNs5D8G9q4jPpFX2dBy4CFdnVigDc=;
 b=xJ6J1x+C5cDBo0y66lxHtYNEenFEyjxoT1KCTD4SpENclAkOIraVAlkXGltffgqZ+zaas1TzaZqGF7jtUqVc90x3hOrDOZ3ncnuHDDncKJWcmBWCN5j1H8WYlvncrDkeL871Is6LoIZeAsoxN2dIqvCh4dYmZ0wNVjZYe/ZXRQB6BFP9QlQZrotQg3PV1TaCq9+HhfOEdxf7jSzlql2K180YG2pSJWX3y59AyotnwDI9B6pkRZtZTpO5eu8xOwTt8TWLYhDi1j62gpBknIf5fdpunxXRhgrrFA2Yaw2/9NGXNKblCsNYaHaPBgT0nMw9MWPQy1x6JzWEdVudgd030A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nl95ZUKCcWig4KMNs5D8G9q4jPpFX2dBy4CFdnVigDc=;
 b=JUJ/iiG+Zg72hBDexF7ygpC384KgZ/0vGNCVrQBjFfOLiZ08wEQ317V3uIQtt4LkeUpSNtwQ4CZHonJktaCjGshhA1zq/1JigUTHWihQpBopBYD4WKaWhnaEjtWnYgxqOytHqXcJBk3y5Qm4sTdzSKLoee23MsFm1woefa1lyEs=
Received: from DU2PR04CA0245.eurprd04.prod.outlook.com (2603:10a6:10:28e::10)
 by DB9PR08MB9586.eurprd08.prod.outlook.com (2603:10a6:10:454::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 10:36:52 +0000
Received: from DU2PEPF00028D12.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::65) by DU2PR04CA0245.outlook.office365.com
 (2603:10a6:10:28e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.16 via Frontend Transport; Mon,
 27 Oct 2025 10:36:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D12.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 27 Oct 2025 10:36:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1WX6BIv16/vSSbk8DYrVB0LzA7GJoXApcL+xf16aH7rBaC8dLtubXfnWfdJMSZoUwn+aeTQ/IIpjhbwqNLVAWbI/0f8cuw6CBgrwUCPKjBjG9dTu7QIV7+o3VfKEoo0jz6RsxOr3il7E89KCGeDqZX3Ojit/K/7k0qD2Aa1TTPkw7PX5dVg88QoHqjZd40mChi4/gPKotagp9dFgwwTTz5/zML6ccxr3DM45GvB4Z6O8uuJONh9MmLzz/1gAQa6Somf6hPBWztRMczwtsp29PeoO3qaaQnGYq1Q/XPVXNSFOzQqiNW6r698gE10KG1DnQpl0ybE0fBRdmJzFkXaTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nl95ZUKCcWig4KMNs5D8G9q4jPpFX2dBy4CFdnVigDc=;
 b=zDSRPhQLpOQxfq8yGB3gLvmNrvfE0egYSaTvkBEa0aSomNajhDeaNHuv9pARfL4IfFaGVIJRwrvErtF7Ah228gPknsjE33ZpNXRLOmjI9ijTFFFAr0A/vVC22rqpXPPplavyqzFb8pUdVwmSOyhVUMLSDlQUl/mOcXajxiy3vcZGQzWECEFdD5M5eLzzixpQm0ddA0KBNHI9wMDFsMTo7IEu1CxaadKl9qzxa7AEI8/zzegdvhzXGDpXYuAa4oo3wScuLv1UjGMUYY0RSDwT5ahfaxW99zAuczWZk1AVefqJj9jxg+CBHM58r6P72TZTAZyitB/c2kWKmuRtux84Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nl95ZUKCcWig4KMNs5D8G9q4jPpFX2dBy4CFdnVigDc=;
 b=JUJ/iiG+Zg72hBDexF7ygpC384KgZ/0vGNCVrQBjFfOLiZ08wEQ317V3uIQtt4LkeUpSNtwQ4CZHonJktaCjGshhA1zq/1JigUTHWihQpBopBYD4WKaWhnaEjtWnYgxqOytHqXcJBk3y5Qm4sTdzSKLoee23MsFm1woefa1lyEs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB4PR08MB9333.eurprd08.prod.outlook.com
 (2603:10a6:10:3f6::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.16; Mon, 27 Oct
 2025 10:36:16 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 10:36:15 +0000
Message-ID: <4cea5fa2-83da-4620-aa4a-97a6378f62f8@arm.com>
Date: Mon, 27 Oct 2025 10:36:13 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] drm/panthor: Introduce panthor_pwr API and power
 control framework
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251024202117.3241292-1-karunika.choo@arm.com>
 <20251024202117.3241292-4-karunika.choo@arm.com>
 <20251026091310.4046f061@fedora>
In-Reply-To: <20251026091310.4046f061@fedora>
From: Karunika Choo <karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0239.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::10) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB4PR08MB9333:EE_|DU2PEPF00028D12:EE_|DB9PR08MB9586:EE_
X-MS-Office365-Filtering-Correlation-Id: 32fce087-1298-45eb-9abf-08de1544bd6a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?ZWVPZENuMXkwYlVaV21yYVNiaVVSdGNFMEp2NTM4QUNhZTM2UmxqMFlCL3RB?=
 =?utf-8?B?WUl0ZHlqdTQxQXA1YlAvU2loMk9lZTdWc054SC9sWmNwM3k3TUZPcmR0WE4y?=
 =?utf-8?B?bURPOWFiKzdBSGVNOG9xM29JSVg2QXQzQ1VHOFhsOVQ4cm8zY2MvL2lqeDdh?=
 =?utf-8?B?WXNUOHRjKzBHNStzNXF2Z3ZSWkpPN3JPVk12c0VVUzlWOVZVdGJtU29za3da?=
 =?utf-8?B?aXJackRLUlZBd3FMS0Y4OFE0aFQ0S1pINFFRTVRxd0ltM1N4ODczbFgzTTNH?=
 =?utf-8?B?VmNXRFZmbmcrb1k0OTJrcFUzUHgwcUtOeFRjQUlTelM2RmpqT2dvOS9IRUJ5?=
 =?utf-8?B?Q2l3Y21SQzNlVG5leUJWMlc4TGJqNzhWWTlUUjJ4TlZVd2Z0TjZiUzRXdGl1?=
 =?utf-8?B?RlBvUkQ5TzkvaGk5ZkZYTFhBSTlYV2FTMzVWQTEzMVNQWkxUZ0ExMSt4NCs0?=
 =?utf-8?B?MXZJNXpad0pmbVFnVXVyYkNtanVsUDl0a1oxOStHaDVuVVpCZ0UxbDdVSnlp?=
 =?utf-8?B?NVZwTUk5Z2QyLzdkemNNS282eG5UQjJXR1gyNmVkRWNYM0d6VDNSSnEvYS81?=
 =?utf-8?B?ZytNbEpUNjJ6VDk3QTkxeko2NnhDU2diMlp6b29vejdaUFlwYWxZR1p2MDJ5?=
 =?utf-8?B?ZGVOYjNJUjhySy9MWmpCcVZmaEl4RDFDNXpKVFR3bHZlRzBMQS8rdnB5SWhw?=
 =?utf-8?B?M1UxUlBNaGtpdVl6bFZTS0ZUSGtiMnpBOXF2NTJkNjJKYmdDYThLRVlTS2sy?=
 =?utf-8?B?L3FLanIrL1diWUtuNEUyd2xpY0JYZVlUUi93dFZlYnFrekF4OTdLd2F6Z1JM?=
 =?utf-8?B?M2kyRkFNZkdJZnRMNmlZZFpjdi9RN3RPZjZKTXRDZDJHMlNJajc4anNpR0lV?=
 =?utf-8?B?SitOTlpxejhXTTRCZjVId1VZdC9uSFBLK1ZidXlGdGQ3RlBqSlRyZ28zWlRM?=
 =?utf-8?B?WEtLV1F2bWRPNW5Sd3FBL1lXeDNQeVFUQTN1b2hGbHlaa3l2UGRvdUxmZGZB?=
 =?utf-8?B?dVAyd1N2TElTQ3lTYlRvYVJmc0owNFFWMUZZZ3FZZTR3OWVOM00ycVA4dkU0?=
 =?utf-8?B?SmhXbVR0Wlh2dyszdTZmWll0YTU0MS8rdFFqNENFVUlVZlI5SHBQa2JOYko2?=
 =?utf-8?B?Ui8rdVhydmpHQUhSUnlnM29XVkkvalhGWG1BejJHS0x4MDM4Z3ZRRGN6Q0F6?=
 =?utf-8?B?dzgxY0ZIaldya2ZrWTV2Yk1RNWJzMVFRSzk0ZGtWcEk1NzBGaythakJ4Q2xi?=
 =?utf-8?B?VUl6RmVCU3NuMzJKcWhRa3ZFQzJ3Szl5dnhtSEYwVlNqL1Evb2pYMnJrbDJh?=
 =?utf-8?B?WU81SkNTMkJ5bVJ1M1hxMXJUVldCd1Y1OXQvczFRdy94TUxnVnpBU0x2WTlP?=
 =?utf-8?B?T2phU2F0cmdQZHZHSDg3YWw5UTVQWDBXcm9hSGJDZFA0bXFEMitvY3E1WlN3?=
 =?utf-8?B?cWZuc2NnaUZwbVpCMW9XeFVoREJlTkZibzNUWDZaMFh3N2RYdXVsemwrYmNB?=
 =?utf-8?B?SE5iaHByc21OekJTOVVhSWgrazdyVmN1MXBNU21wUi95bEJVa0paSTdGSEZQ?=
 =?utf-8?B?U0EraS9lYmhGcmRWRUpKYVR1emRCeVc0TmdhN2pqclBmc09lbHpFSStLRVBu?=
 =?utf-8?B?dkNvWmRhclpUYXJWeEpxc0N4TDNSVXhwN0t5aHFOMGdCRnlVek5yakdQQkhu?=
 =?utf-8?B?aE0wVm9FMFd2VUQxR0g2c1FzbTlHOWdKRlRtdlRPY0RycUFVVWpNOU82THk4?=
 =?utf-8?B?Y043S3I4VHZHQnJ0N0hVMjZDTHBxcEMxbTlXbjdjZHgxbFM5NTgrN1IwY0ky?=
 =?utf-8?B?UG9xKzFsRTRUM0pycGN1VmZkYWNYZjhMcE41SXg4dXg1VmJNYXo0QXIxRlJZ?=
 =?utf-8?B?TTVldUlwcTFiam16QWsrYXAzZiswZ2pxRndjWDZFZGh6U0J5WHN1ZnU3c2Jv?=
 =?utf-8?Q?eYkomqIwJF6cHMVAXIo/L3jJJwQ7nmsc?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9333
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 66a4fda3-1835-4f84-91b3-08de1544a7ab
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|376014|82310400026|1800799024|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDB0am85RVgvTjNyeHNxL2pIaElqTUhGWC9RK0xmVzhVV0YwWWpKRUREZlBZ?=
 =?utf-8?B?QTR1YlY5OCs0bFI4YzFEYWtEMjhvQ3lab2grMEJ3M091K0gybm5OQk1WeDBG?=
 =?utf-8?B?ZnVnNUxrUURlY3lWTnZjNzdJRDdmY1BqOWUwOTdXeWFvbXRrTWZXSWd4bktk?=
 =?utf-8?B?QmxhVWh6SmE4bGdsWTlzMFZBWU1uUS92R01ORVpaQ3pPdUx5OGxndnNOdmNs?=
 =?utf-8?B?MHJyUFVkSDlhOU9HM0thR0FVZEFaaWRJUDhKejVObyt1WWNRazVVT3Z3OS9h?=
 =?utf-8?B?WENBQlhiSE5KOE4zNk9HMXNuYm9sTmdjcDhadkVPUDIrdGRIZGY1b1lvcnlO?=
 =?utf-8?B?RHFtUmE4VmdHTjZ3RE9NNThreDhOMCswRWtwSHlRUExFdEdxbW41UnBRckMx?=
 =?utf-8?B?bFJHcWltYXkrUW1sWFptOEw2bDBOOHZlajdGekR3bGlNSytzQ25RcUtzOVVm?=
 =?utf-8?B?QVZpWjRFVEovRkRxS09yWHp3N09BQTBaTjBhZjFCYTZXdU8vaWRHampyZ2J1?=
 =?utf-8?B?VDdBejVmTDV0WTFNM0tBYVJ0Z3pMWWxoZ1ZlUG5xYTdaZzRsOXhrRDhWeFhW?=
 =?utf-8?B?ZktUNkxQbEx3N1UxMXRicDNPTlh3RGViU0t0UjVManYvWmVMNlpWQmJKMzRM?=
 =?utf-8?B?SXBaYXFBb3lLYkpWeXJ1cG5JVEVMQ2QrMG4zaGNmT0RJRkp5R3c5RlVmdHhQ?=
 =?utf-8?B?MXBxY3JnR2crU3ZvVFA3d0I1akRKWThkR3ZiTEQ3WFBmSGg1UmdrWnBiTlZL?=
 =?utf-8?B?b2R5Ylp5NzRXK0xEeGdrREZSYkNoaUdmNjF4NTZaUW45QTJVZkYvNUhCWjVV?=
 =?utf-8?B?SDVRK0dTNVNLRmppRVF4eDJaelk1MlpTcGhKamJnVDRYVFkwUXZSSXloYk5k?=
 =?utf-8?B?cWVGM3p5c24zWExSVnEvVTQvbmV1c2pJbU1zMnBQR0ZDcW5SejJUSmxianRO?=
 =?utf-8?B?UnQ0K09KdlNwalF4T1lraUdrZnpLZmxnMG8yZGlRNkZ2Smh2N01VTk1hT0lO?=
 =?utf-8?B?WnAzUzQ1aTNoSGhWWm96SXhXN2JEanFDRWZ2Y0Y1ckxEOWxJVnczd2ZKdUJX?=
 =?utf-8?B?RTJlZER5UDBuUVovMEFsblA1UTI1NnJaSkhsZ3RKeEM0ZEdtUW5VdGsyOEoy?=
 =?utf-8?B?TnJMU1ppNlBHU1NzSjZwb0FFSFJFaHBsMC9JVmJvUkFJZjVsU2lObEZXZmJC?=
 =?utf-8?B?NjNUQ05PK0huM0NFcmFYTFdUV3BWL0NsM3lITGlTQk1OQm5KYjh1cGUvb2tx?=
 =?utf-8?B?aEk5TE9tVHY2b1dQUGdrZ2owNzNLb1JxTTNwT1Vra0RIOGgzcTBSMjJPK280?=
 =?utf-8?B?MTlVb1NyTXQvTytaS3dsbTI5VGtCbndKblZUTnl0TmdhOWVCNDRTZ0NRam1j?=
 =?utf-8?B?SHRhRm9tUmNBbUVMUWpMamNFMU9LMDVwbUFEcTRMUDhzZkdHK0ZoWHpJYWJX?=
 =?utf-8?B?dUkzbkZkQkFYeFRKck9jdTBob1NoVnFVbzJYd0xOSUU2QXVSZTZvYVo5NnFl?=
 =?utf-8?B?UjdHNHh5ZUdoOU9Ta0tTTmpvbGszN09SL2FTamw2NUpxdFBvYzFsOXlGMVZx?=
 =?utf-8?B?a1Q1aGxBaEphZlExNW1BenlLWUw3U0REcUdETk1ROGpoREJnanlGM011Ymt2?=
 =?utf-8?B?SGs2VXFNdG9mTnN5UHowQ0Z0b080NmpsK3VUQ2ZoUDN5a2w2NVFzQVpOTnFZ?=
 =?utf-8?B?Q0s0RUhRK0VQZzFraTcwRjVpQUVVMTZ2SDZkZFJrdUsxK3JVODZXNzVBTTdk?=
 =?utf-8?B?MFlQQVF3VmZjYUZ6VkQ1S1BRcU9IRHJSYU93bzlQWEV3Tm1oVmE4VXRSVElo?=
 =?utf-8?B?c0hwd24zVmFQZFZjL1NXeHgrb0xZYlhaY2hNRXBiNFZtNnd3bjdocTI5cWt1?=
 =?utf-8?B?T2VPQVdjSFlIMnUrb3UyaWhSUnF0Zk43SFBXakxkcnkwRkMyYnhaUk8vaWg3?=
 =?utf-8?B?akJqaFovMzAya0swUGJ4OXpOSElsQXoyd3NXZTV1VVFISlJRcEZacDZPOEdu?=
 =?utf-8?B?a28xM2FWd21PVnRIVzU2elduSHg4SG8yMk9vV1VHOUVyL0hQNjgwM0lyTnBS?=
 =?utf-8?B?R2M2U0hScGFYcmtYUjBLWHJhRE9pUE1Md1B1d2UyWFkvSXU1dGtOT3Z0SGVk?=
 =?utf-8?Q?Ypt4=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(376014)(82310400026)(1800799024)(36860700013)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 10:36:51.2048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32fce087-1298-45eb-9abf-08de1544bd6a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9586
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

On 26/10/2025 08:13, Boris Brezillon wrote:
> On Fri, 24 Oct 2025 21:21:12 +0100
> Karunika Choo <karunika.choo@arm.com> wrote:
>> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
>> index 092962db5ccd..09aef34a6ce7 100644
>> --- a/drivers/gpu/drm/panthor/panthor_hw.c
>> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
>> @@ -192,3 +192,8 @@ int panthor_hw_init(struct panthor_device *ptdev)
>>
>>  	return 0;
>>  }
>> +
>> +bool panthor_hw_has_pwr_ctrl(struct panthor_device *ptdev)
>> +{
>> +	return GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) >= 14;
>> +}
>> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
>> index 2665d6dde2e3..4c71f27d1c0b 100644
>> --- a/drivers/gpu/drm/panthor/panthor_hw.h
>> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
>> @@ -32,4 +32,6 @@ struct panthor_hw {
>>
>>  int panthor_hw_init(struct panthor_device *ptdev);
>>
>> +bool panthor_hw_has_pwr_ctrl(struct panthor_device *ptdev);
> 
> Let's make this a static inline function so the compiler can inline its
> content at compile time.
> 

I wonder if making it static inline is a good idea. We will need to move
this function into panthor_device.h to be able to do so as we need to
access the panthor_device structure. Would this still be desirable?
