Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721A0C853C7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 14:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFA210E3CD;
	Tue, 25 Nov 2025 13:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="NpQnFnNR";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NpQnFnNR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013056.outbound.protection.outlook.com
 [40.107.162.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC9110E3CD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 13:48:35 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=o6jN8f0rT8te80QY/2mi1mEIwLGPWw7sNGSsAwKlZJBs2ysLCSP0jXH6EBLmDkTt8xQlnFbrEl+uo3k3+bc6pUXZrjjekrhcNbkefhzOUMzWOPwcmlqKDTKThdnQB32je2SDNmsKN3tw/sZn0K09EnEe3MQKTrtu8bYhEfrFJpbdYOJcoNdJFMSkwW77GUvhZtGE2d3V6hezBr6Vc7qhberFS2rDLXxHEgvEEN0azRmOZPlZW7izR2Mq1/ITqeAc3deF1xM/Rsq5xHN+hUtGrUbvI79kntgvOibnZIId1mHlXmyiezMWOwiHUjJvH4c4n6tac2P12FiuCSAwHe2vHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W22L7Bm5nls1zevbVXyuNphSFEovkFw7vsf6zxiVllg=;
 b=JNUYodnhU44X1PAYcagiD5Y+e9kckScroy6OTEwYGOgHltOK/IXKrwW6PWxoRYEDnk2i9wlrZxDyLazjwlg66OgjveoY1bhNq8mHFuRdiGEYQcbxXjGsHxeGf1f9HK8zxb9zIMc4TV3LP1BlO4hnqKcpSZHZK38q/VZBm0tvyI89Aqt0fPErB7sbNUZwbsJmC9TzEOgqPd7C5JKQMtVKaSCpdNvZOGUqE7KFfjoxXZpSADJfpFnKJmDM8a8WfBd9NL/heMDP0QuAPTApBrsBrcwZ93L+Ekim3MwTvmnk4xSBb1DprMuNX0yjPwKt7pfg0p7fCFCTC0tRpuND1mTyRg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W22L7Bm5nls1zevbVXyuNphSFEovkFw7vsf6zxiVllg=;
 b=NpQnFnNRo5bk78xj6rymfFpHuTFvJTE8sh4ocTPz/7GMwMFDOhWSX3Q97c5c5Hhj1hgwHEdYhw5ixVw8D+dJIfADeIdWXH4lYKvzBQfiMtWPmiwZ/pJiglOV/yvFB4GLhKw2ev3SkhBQ8ceS0g4VrLiB1/lJYR7OxQ+cHOf1gh0=
Received: from AS4P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::6)
 by VE1PR08MB5614.eurprd08.prod.outlook.com (2603:10a6:800:1a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 13:48:29 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::67) by AS4P192CA0020.outlook.office365.com
 (2603:10a6:20b:5e1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.11 via Frontend Transport; Tue,
 25 Nov 2025 13:48:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Tue, 25 Nov 2025 13:48:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Slpd6uva5CJKQ+Yim+tRhCwTbkjZluwwAsfrxVdkh9TQH1NOY9XLi5HGeYUmlmtYKWOSkCMPtAa4Z/ZT+xXbqtU+8arFlIWkXOUABoEW26CqC8+9qvGgrAZOuMdQ9Ihs+uYb/n0sB20ZAvWvOWsBvZ2EnZjvBIapm8trZNLHvgZM+4h+WQ2aqewHDY88d0mhg67VOKGwnqP6hAbBOkdYycYZV9lhXRbCAJ2jrqIEiAgxDWMwNXq3fwr8TbSAZEDO+BnOEAs9sqZImDLTOh9jDT+9z/Hj85JWUBvyhC8+JiZDV54f+Ao0CYrgay1WlEAXyszAy024n96yLXhtvCmI5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W22L7Bm5nls1zevbVXyuNphSFEovkFw7vsf6zxiVllg=;
 b=vAAHOrbh3PKZbfHDwwQXHdF1/8f02fg4D8wARdCDU80b3Cui8syDWNcJtPL0wc+JTbXQvCg/QBN+oFHpxXYQ/Kz/ehM0H3MRaGhDTqFBY1vDLwbQNi8QFTkCrUILEnhmGlZWV7lUOaySVL78kxSTPagpoKfYXZ8sBDHkgYI7tzC9ez7vBPMj/werkJP+To202CrCqfFJR/RkPwYZkm5oNArLsWF4nLKXIKkhhpVyRJAkL5HAE6MaOkpvYIGHPmzP+/wrGtYxOC8OsPh8ajkrSnc1BxZn2wC88gLNA1rHWKQMhmSt6ZrpENDd96Nr3F9zrFZSnqr2QxdNbW1pO72Ttg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W22L7Bm5nls1zevbVXyuNphSFEovkFw7vsf6zxiVllg=;
 b=NpQnFnNRo5bk78xj6rymfFpHuTFvJTE8sh4ocTPz/7GMwMFDOhWSX3Q97c5c5Hhj1hgwHEdYhw5ixVw8D+dJIfADeIdWXH4lYKvzBQfiMtWPmiwZ/pJiglOV/yvFB4GLhKw2ev3SkhBQ8ceS0g4VrLiB1/lJYR7OxQ+cHOf1gh0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by PA4PR08MB6111.eurprd08.prod.outlook.com
 (2603:10a6:102:e3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 13:47:56 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 13:47:56 +0000
Message-ID: <c80da36c-84e5-4a1c-a467-3cc9c46bf956@arm.com>
Date: Tue, 25 Nov 2025 13:47:55 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] drm/panthor: Add support for Mali-G1 GPUs
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251107142440.1134528-1-karunika.choo@arm.com>
 <b28a4dfd-035e-429d-848c-dd67adfb8fa7@arm.com>
In-Reply-To: <b28a4dfd-035e-429d-848c-dd67adfb8fa7@arm.com>
From: Karunika Choo <karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0296.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::20) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|PA4PR08MB6111:EE_|AMS0EPF000001A7:EE_|VE1PR08MB5614:EE_
X-MS-Office365-Filtering-Correlation-Id: a586ee8b-c2dd-4893-5465-08de2c295089
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?WWg0anE0TXpYSVhhcGxsRktzTlYvSUl6RG1ZUG96WTR1K0lJUStqd0UydzFF?=
 =?utf-8?B?ZkhTUUFpdDJTMk4vRVBlU0NUTXo3VXd0UU4zcEIxeGpHTFB5ZUJIV0xDcXpI?=
 =?utf-8?B?d3p3Ymd2eG55cWhSRENEa05rSHBQQXdHWVU5Y3craHpKMWRZNEhRbFRkK0l1?=
 =?utf-8?B?bHEyT0E3cEhKTDNVSmtKOXZpVGc0em9PdEhvQVY4Z0lPSVlrdDMwME50QkxK?=
 =?utf-8?B?Q0NjWnkyWkZzbUVlN1NkakpMbDVvZWhuMzBmSjN5NUQzQWd6bjdsRE9jUklo?=
 =?utf-8?B?Z0lvM0tUbzdacmoyNE5Ga293VlNoTlFZYjdkRFRzWUtRUnNlVzlkMEJ4WFdw?=
 =?utf-8?B?QXJOWExJN2JVZWNFa0htZjd3WDBmRzJCTHZkN1ZVY0pQZkdYUTkvZ3ZkYnU1?=
 =?utf-8?B?QnAzdUk3UW16T0JHd2ljTStQdGIrYnhidGdDV01LajluQXlkYm81ak4rbHNX?=
 =?utf-8?B?eFdGSzF3blgwYWNKd2phWDMySkRlaVZZTGVoMEphVEdvL2I2WlBSbUkvMFhV?=
 =?utf-8?B?U3BvNE9Ma0pES3lRVGpXTmtneDgvNnNsVi8rcW11TlNtQTJIWFJvczEvSWl4?=
 =?utf-8?B?T0l1Mm9Db3hFQ0pCdk1NZGkvSGlRZVpubWhaOS9LcEswWkdjQmh4eWF1OGtS?=
 =?utf-8?B?NldRdnRWZ1dqZU1Tdzk3b0cxckZmYVJqaHZGVHptYzJLb3JKVkp4Q0hkTDUy?=
 =?utf-8?B?YkJBUUJ5SlJzWDAwZWNlWTIrUlBwVDNiWXhlQWlMUWxkeXlUTkRBOUZ6Wmkw?=
 =?utf-8?B?K05YTnM5aUlGM1Z3QVc5QmFXZkJqWG84dG12Wnp0RnllUmRoMW5uaUVDY3Ju?=
 =?utf-8?B?WjVzODcwemhDdHpiNzErVS9TMFFHaGhKUC85d3VTaE51cTAxUFl6Z1JEL3NZ?=
 =?utf-8?B?ZnI5aEFkTFJhSnFvUUVuUEJMS0tDTHV1WVgwR1lqcHYzMmdTTkxodnY5MGcz?=
 =?utf-8?B?RzFSUmJGRUw0QlJ3bUhqbklYMlhIdDE3ZGJGZWNQaUZOZWM2UVA5ZGNhdXg2?=
 =?utf-8?B?amMvanlKdDNVQXMrNy9vblQxbGFDRkFZajYrQkdWR1Y5ODNOSWYzbWhqcXNV?=
 =?utf-8?B?YVh0U2hiVXlBTmh1eVkwK0gxTDRHTXpodjdFRDdzY3VxM2xFZkdqTzkwLzBh?=
 =?utf-8?B?TlVDb09jZTdSZ0VnQW5yQkdzNlNqbllZMUJ2aTFHM0FkSUlkWlVoUmhKcllJ?=
 =?utf-8?B?UUxpYk8rUTY1dDloTWQvSTBXbWtOV0NNSVB4ZUEvRkJDN1A3VnROYmdKQXIv?=
 =?utf-8?B?Vm96WUxiWm54RjUwaVhvaW9lNFdncmdXVnB0RE9OWiszYU9tekorUURINEpx?=
 =?utf-8?B?dDV4OFNGek8zQXhPLytsNUdhUUs1LzNkMzNOWUI5NU45MHpHRTVROFJTaTVn?=
 =?utf-8?B?RXpOWlZoVm9CNVVKUUpERWpBM29NS0tvMEtuN284dHZHNEJjS0dXbml3anJP?=
 =?utf-8?B?eDNXc0pKVWpuQ2NSVUlkSTlISzhmK1dVQXl1SER1NE1FUzJTdWU5TDNmTUEz?=
 =?utf-8?B?clN0cTF2QUs5ZDJaM0U1Y00wL09nY2hiL3FuQ3pSbURVYlpHb0tMVlRzOEkw?=
 =?utf-8?B?c0dYdzZlWGpFQSsvTjJWY0NPbmZoc2RTN0dVTWZGM3BBWTE0T2lGN2RNTVRG?=
 =?utf-8?B?TjZrVUJCcUhrZTR5WDVEVVB1VTdaSExMK1RLMHBCNjkrWWpjckw5VE5RYWcx?=
 =?utf-8?B?Y3haUUVPSEhUcWFEaXZxQi95TVpNMXVPdG1DcDhLTDVJVmgwZkJTdWkzMkN6?=
 =?utf-8?B?bXZkUUM0NEkrYUxuSkYrZ0VnV1BPMjY2d3pTZnkxZUtodWd0bzd4bGwrMDVW?=
 =?utf-8?B?SVZhdSt1emtjR0EwT3lBaUdud0ZQblFKK256MU8yc3dpZm5QcENsVzJCVnNH?=
 =?utf-8?B?c2RmT2czV2M0eFNyRURadVRKMFRsVVQ4SG00aTVKbDg2MTdYS2R3RURFVUh6?=
 =?utf-8?B?ZG1SUU5EYVBIVmUxOUdTOUhjMUFiRjJuR1RLK3lyVDlaaGR1dTFnYWYydEJQ?=
 =?utf-8?B?YnBRc29xQ0h3PT0=?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6111
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f90571eb-0f89-4411-9d44-08de2c293d0f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|14060799003|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L09RczlpZis3TXd5dVhKU0lYZkFRM25YZ2c3Q05QNDAwT2RucTU3eGR3Syto?=
 =?utf-8?B?Rm5VUG1GRVZweWVadmt4T0c2NFFNcnVRNWNLUkhlWTZ5K3dCQWhHd29RZytI?=
 =?utf-8?B?TGxBSzdMektKUHY0eUhCY0RpblRZSkdqa3BUazMyTzRNM2QwMTcrbHVlamtX?=
 =?utf-8?B?dkhxOHdBQTg3OVpTUkpOSmJRckpBZWtrYXFMNk5JdGhrMHRNR3VzVmpMOThL?=
 =?utf-8?B?amlrWHZ3b05sSDMvaERnMGJKT3JFOHlZT01nVmljeHYwRWdVNDVMRHJ2eHkz?=
 =?utf-8?B?c3VGdVFRWk9uZDd5RENaeTYycCs4bjQzd0ZpN2Z2NTRPMUhZeW5jL29RSGsw?=
 =?utf-8?B?TXc3Mlh3UUcwT1VrMFBjSVJMdUFnNy9mRnVSTkFIdDNKTko1dEJkK1dQcklv?=
 =?utf-8?B?UHE1eUhlRjh6UWhiZG5NcXVBWHFYVzc1RjU4YksvYmtLUEYzTEpBYWFHejNu?=
 =?utf-8?B?dlNQcUdlOEhrMDJYN296T0FSMWZiLy84Z2FIL3UxeERBZ0FNYkZ4NzhEVU5X?=
 =?utf-8?B?RjBUbG8zQ2toT0I1L2hYdTVXYVdYK3plc3kwTys2ZGhta29hVHhLd0pUTG1P?=
 =?utf-8?B?Ykw0SGpCaUFtS0g2MVYwTWhCeXdRcllwaVV1VnJZVEx3TEFmMmJ2UlJFK1Yv?=
 =?utf-8?B?QXpEZWZoanFxdTlGZWhrQWdFZWlQbzZ5RTM2emYyZzFYTUQxRGlYM09zVnA1?=
 =?utf-8?B?SmpsbjluY2grZDNnRjQ3Q2Vrci94SEM3VVlVRzM0SFFsVFpqQWxqU1luTTN3?=
 =?utf-8?B?bEVMT3FjZnF0VVBYa1ZNQU5KQUp5d0dnRWozdDM0M0RNU0V5dzhHV2p2YktU?=
 =?utf-8?B?bkl5a1RJYkNiMW5CcHpRbEJzVFdqR0xBcGlNcFNuU0trWk91NHFrNDNDTlhk?=
 =?utf-8?B?RUUvYUdvbFcrVWl4dlBKZDU4eFcxTXg4b0pacWQyT0lXU0JHOTJlejUvT0tQ?=
 =?utf-8?B?eGhsRTNHOGN1UE1ud29WSXF3SHFTblZKNHFyN3BpSW9WK3lCaWF5R3NGTUlz?=
 =?utf-8?B?OXhMZkFHRUdZa1NhWC9uUjFMTG9CQ0VqcUZNZlR6cEwwZ1MrdGxIeXNSOUNa?=
 =?utf-8?B?ZlFDbnAyTjlzL0ZGMmxOSDNVK1J4WWIrWVpVRm5mZlJZaDlyU0pzTFNDK3NC?=
 =?utf-8?B?NnplRWdxVkZ5aWRLUmV1bXV1MlRoSXhtUTVobksrZzRUcURNblVQNE5JWG5N?=
 =?utf-8?B?Q2tqTzZkaHJiTDhwNkhXRlBZODlwQmNlYWdwZ0hJVVRVOEpRUjZPYVh2VkYx?=
 =?utf-8?B?Z2ZIQzdvODB1ckcrbTBieVErOEFyS2hOQW9zb0NITGlkT2RzSnQvblVSVTdk?=
 =?utf-8?B?eHlmYjRETUVxbkxNeEtsSm5FR0xJNE1PQ05tOW85Wk96QW1XdWZhZTV1ZkQ4?=
 =?utf-8?B?V0FHcVF1d01nb0Z6eFBDb2JvbXJSNjJXQm85S0wzS3VUTGYxTG1pa2VRQzVF?=
 =?utf-8?B?Ykw5bUdMcGxCR0dhRVV4NEs4MXJlZEs2aTNrdFI2Z1FQbnBOSjdaOGpVbFp4?=
 =?utf-8?B?TnRKSXNjd0IyQ254dUVjUHBxL3FxQWNMdG93eXprSnJZcFk2UDdRMnppMk1i?=
 =?utf-8?B?bnMvQncvZjFIT0o5K05ESjM4b3JON0xaUEdjSmI5ZFJzNjhSTzJid2swT3hP?=
 =?utf-8?B?S01KWTUzbTJ4Y1lYNWJTcElkdEJ1Z0Z3Z2FReGIxQmROMXBOUTlxbDNldGVa?=
 =?utf-8?B?QzNNY2NzRGR4eFJ6N0FXTllkdEpXRVhyUW83RXZtM01lZ1dnWnE5MEFPWUZX?=
 =?utf-8?B?dHVVL3RldktsSFdVQ3RnMUZFWTZyRFlTWnVyQnRYSmRsd3VrZWdJQlUzUzlx?=
 =?utf-8?B?N0hvWFQwbzNvTG5vcFVRWmpPdUI3bVpLN3M1NnM1NXQvOHNyNGJNRFNGOFVt?=
 =?utf-8?B?WGEwT09vcmVsdi9BcWJTbnFrR29hekx4dmhTb0J5dzR2dmFld283Y0JhYmln?=
 =?utf-8?B?RHJzMFRvVEF6MmFDYlQvWG9QemhjdWw0aFFlejNJeTZXd05KSERNOExFc2RL?=
 =?utf-8?B?K2liaTM3ZEtQWUt0OHp2Nzk4aHhZd2twUmZjRlV3NFlGeU56a1BaRHJyNFRD?=
 =?utf-8?B?bjNoR2ZxeDZnZU9XZUpoMVh3MHUrTHZJLytVclF0bDJpNlVETmRkcytLNEFE?=
 =?utf-8?Q?qQOkOQnLBP2Iza5Rj8dFOzHro?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(14060799003)(35042699022)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 13:48:28.8724 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a586ee8b-c2dd-4893-5465-08de2c295089
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5614
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

On 14/11/2025 16:33, Steven Price wrote:
> Hi Karunika,
> 
> This series doesn't seem to cleanly apply on drm-misc-next (and I can't
> figure out what base you used). Would you mind doing a rebase and resend?
> 
> Thanks,
> Steve
> 

Hi Steve,

I've rebased on top of ac364014 and sent out a v5.
Hopefully it works.

v5: https://lore.kernel.org/all/20251125125548.3282320-1-karunika.choo@arm.com/

Kind regards,
karunika Choo

> On 07/11/2025 14:24, Karunika Choo wrote:
>> This patch series extends the Panthor driver with basic support for
>> Mali-G1 GPUs.
>>
>> The v14 architecture introduces several hardware and register-level
>> changes compared to prior GPUs. This series adds the necessary
>> architecture-specific support infrastructure, power control and reset
>> handling for Mali-G1 GPUs.
>>
>> Patch Breakdown:
>> [Patch 1-2]:  Refactor panthor_hw to introduce architecture-specific
>>               hooks and abstractions to support the v14 architecture.
>>               These patches introduce architecture-specific HW binding
>>               for function pointers.
>> [Patch 3-5]:  Adds basic L2 power on/off and soft reset support for the
>>               PWR_CONTROL block introduced in v14.
>> [Patch 6]:    Update MCU halt and warm boot operations to reflect the
>>               GLB_REQ.STATE changes in v14. This ensures that the MCU is
>>               properly halted and the correct operations are performed
>>               on warm boot depending on the FW version.
>> [Patch 7]:    Align endpoint_req with changes introduced in v14, where
>>               the register is widened to 64-bit and shifed down by
>>               4-bytes. This patch adds the necessary infrastructure to
>>               discern the correct endpoint_req register to use.
>> [Patch 8]:    Enables Mali-G1 support on Panthor by adding HW bindings
>>               for v14 architecture, product names and path to FW binary.
>>
>> v4:
>>  * Fixed include and forward declaration issues.
>>  * Addressed code format issues.
>>  * Picked up R-bs from Steve.
>>  * Link to v3: https://lore.kernel.org/all/20251027161334.854650-1-karunika.choo@arm.com/
>> v3:
>>  * Updated include logic to enable static inline functions in
>>    panthor_hw.h for function pointers and feature checks.
>>  * Fixed missed replacement of CSF_IFACE_VERSION check with
>>    panthor_fw_has_glb_state() check.
>>  * Link to v2: https://lore.kernel.org/all/20251024202117.3241292-1-karunika.choo@arm.com/
>> v2:
>>  * Merged GPU_ID refactoring patch with the arch-specific panthor_hw
>>    binding patch (formerly PATCH 01/10 and PATCH 02/10).
>>  * Dropped panthor_hw feature bitmap patch in favor of functions that
>>    performs the relevant architecture version checks.
>>  * Fixed kernel test bot warnings.
>>  * Replaced function pointer accessor MACROs with static inline
>>    functions.
>>  * Refined power control logic, removed unnecessary checks and redundant
>>    stubs.
>>  * Replaced explicit CSG_IFACE_VERSION checks with functions describing
>>    the feature being checked for.
>>  * General readability improvements, more consistent error handling,
>>    behaviour clarifications, and formatting fixes.
>>  * Link to v1: https://lore.kernel.org/all/20251014094337.1009601-1-karunika.choo@arm.com/
>>
>>
>> Karunika Choo (8):
>>   drm/panthor: Add arch-specific panthor_hw binding
>>   drm/panthor: Add architecture-specific function operations
>>   drm/panthor: Introduce panthor_pwr API and power control framework
>>   drm/panthor: Implement L2 power on/off via PWR_CONTROL
>>   drm/panthor: Implement soft reset via PWR_CONTROL
>>   drm/panthor: Support GLB_REQ.STATE field for Mali-G1 GPUs
>>   drm/panthor: Support 64-bit endpoint_req register for Mali-G1
>>   drm/panthor: Add support for Mali-G1 GPUs
>>
>>  drivers/gpu/drm/panthor/Makefile         |   1 +
>>  drivers/gpu/drm/panthor/panthor_device.c |  18 +-
>>  drivers/gpu/drm/panthor/panthor_device.h |   8 +
>>  drivers/gpu/drm/panthor/panthor_fw.c     | 131 +++++-
>>  drivers/gpu/drm/panthor/panthor_fw.h     |  32 +-
>>  drivers/gpu/drm/panthor/panthor_gpu.c    |  12 +-
>>  drivers/gpu/drm/panthor/panthor_gpu.h    |   1 +
>>  drivers/gpu/drm/panthor/panthor_hw.c     | 107 ++++-
>>  drivers/gpu/drm/panthor/panthor_hw.h     |  47 +-
>>  drivers/gpu/drm/panthor/panthor_pwr.c    | 549 +++++++++++++++++++++++
>>  drivers/gpu/drm/panthor/panthor_pwr.h    |  23 +
>>  drivers/gpu/drm/panthor/panthor_regs.h   |  79 ++++
>>  drivers/gpu/drm/panthor/panthor_sched.c  |  21 +-
>>  13 files changed, 989 insertions(+), 40 deletions(-)
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.c
>>  create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.h
>>
>> --
>> 2.49.0
>>
> 

