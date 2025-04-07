Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB9FA7D7D4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 10:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F2410E32B;
	Mon,  7 Apr 2025 08:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="QwABbXMv";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QwABbXMv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2052.outbound.protection.outlook.com [40.107.20.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05FA10E2E2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 08:30:16 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZVCizO/tCu9UauzYpmN2Yv2LrcE/H6cLFjWbYkubi+K9dav2w3onYIfGzjp6a5/CBG7yt3Tzwj4gyJPoBI3ISYNbSEpegzBBxyPrLnNWwJx6KAYGbQ0+zEEbTN2MpP3G/szmFmldaPMOujLcSzBQPznpfOnK3DRlgzRMDlQXdpUO5Sf85Rm9sS7fB17jAf0gAVMDl5JCG9B1upGanJ8TATHNZFdvPWSVV7htLV09vsFFOVwgGy4CrPSEBIgyu3MD0NkOjrxEMY2ulpf0L6eNeZ9r7UpNYe0FTrRIrHpavSNlBFlPHpBUzeQtwd2HksuRxJR5idBFsjOR2pqyOQJ3yg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dKuSoNfHqza16CbTBo3SDJgU9GG9caAJdMIXtgvdB4=;
 b=wp0CDCkEZ3YI32BBtz4CBqzJhFzGmrNhwEeA67nCf8oO4DlB/3lKBhkGuECecwWhlg5MwsBsntv0wAXvJGF6SMQC2s32ba8YAOZoDYKHMp7BjyVNx4kf/YPgvEuYjhm/rBogA56G7gjam9yK/Abixm++NA/UmkGcLiSC4puObuPXcQHNJz0M22Kjzls7FCcziRtekax/JfEnkuE6dO7rKbkMxW1GPBTNtLYpSXblgxIyug4W7x1c1X0KI7C4c8r8K1vfxF1eX/CQqEtcDSGg09jah1K5t5RvYYJ74iFkLhR2CrN+3yGjTAxcTGhKw3XqmTfRBK/RRjG4HypLuHTEzQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dKuSoNfHqza16CbTBo3SDJgU9GG9caAJdMIXtgvdB4=;
 b=QwABbXMv6X5kgYA7vMI2dzw66y1fYOlI+6yBBOn4z1byyu6wlaEAJ3Qm4t1TDBE1gx9JgsXMBsBoJ6g/HDeUD/LA/lIG8KgbPguSa1sAsNnRjup/EdlQLV4VgB+jww18MJW5jpF7WwCFHmBFnBPVMAtJDsw2vxZeYgTk+/596q8=
Received: from AM0PR02CA0150.eurprd02.prod.outlook.com (2603:10a6:20b:28d::17)
 by DU0PR08MB7485.eurprd08.prod.outlook.com (2603:10a6:10:355::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.28; Mon, 7 Apr
 2025 08:30:06 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:20b:28d:cafe::87) by AM0PR02CA0150.outlook.office365.com
 (2603:10a6:20b:28d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Mon,
 7 Apr 2025 08:30:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Mon, 7 Apr 2025 08:30:04 +0000
Received: ("Tessian outbound 3c1eaba55dec:v605");
 Mon, 07 Apr 2025 08:30:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bc08c817926a06fa
X-TessianGatewayMetadata: FAvx6NrIy+NSyzdco3P5eM+gf7dSbPakkz8MsHelAZ+Yl/XuzlDtcPYLTpwyHIsvrPe9nXC693H5n0UT+i8eQ/Aprz3uxwZggco4+8TfL6CasTUSjj1o82ePebMKciBrRzZGNPZabZ0Frog7lS6y1YCqsYxIA7YFBnzIXJvQf7U=
X-CR-MTA-TID: 64aa7808
Received: from L542403903de3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EC5DB5D1-4863-4F13-8CF4-ADB68A3A5657.1; 
 Mon, 07 Apr 2025 08:29:52 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L542403903de3.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 07 Apr 2025 08:29:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tsbPrD8OGxtYbLpB3vn10grSKGpoSrwVTQonf6VGnOaXCv7BiMvp/9XwdD2GXxgr0DOzddL0GybBLHlTlYdhAFSxvFGXXUaOVLmrk4H/AP9/kITyS5UszFCvT/zkLt78IFw82jrssrkWXYWjGDoPcW5mSHQzXs3vvBqnWXZQMfLZQlkUEM70QqBsRZm+kAni1vohFiQoKq2frtXLJk1VaLvyANKdMAaIovlHBgJXWqAt35ucb6jJpnaFE2aMezKPolM+s3zzoEq8Ivc8kvC1FeeOK73NunfMPQIUHTyWNZALNRKvKanM0m9h6Hs+/Bv6zP9vfLN02EJkMPmfin4mZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dKuSoNfHqza16CbTBo3SDJgU9GG9caAJdMIXtgvdB4=;
 b=hxQggtRZUm8c+au7iD2uX2NwsKOf68eNbuMQxyrsVmPhfkd7cLIAeMsmtPyi79rb0CK12ypbiB1cUZjiyI8knLzUfsLPJ+WzDR9ivHlg7gODv9c4hNlsp6zVxqrp4gefWXeUhAuBi1LAuiHBSXDhE7cFX4oQzRUZd682eHcMDWXjwJGVhhtbAWU5kWxXr6GFI2yn4rWzBRgmgpy/+JwLk/VXbq8tjmNVabj7vcAv11ZnINyTb/PvgUZEb5RLZ9Wd8+KmXiwOgObwsNmyxLqRBSgDrElNZDRSKb/uDv16KnwRuBO60ahAAQO2CRejzHEiZ9kXIV+/C4nSHmmj8RgXsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dKuSoNfHqza16CbTBo3SDJgU9GG9caAJdMIXtgvdB4=;
 b=QwABbXMv6X5kgYA7vMI2dzw66y1fYOlI+6yBBOn4z1byyu6wlaEAJ3Qm4t1TDBE1gx9JgsXMBsBoJ6g/HDeUD/LA/lIG8KgbPguSa1sAsNnRjup/EdlQLV4VgB+jww18MJW5jpF7WwCFHmBFnBPVMAtJDsw2vxZeYgTk+/596q8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3317.eurprd08.prod.outlook.com (2603:10a6:209:42::28)
 by AS2PR08MB9667.eurprd08.prod.outlook.com (2603:10a6:20b:605::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Mon, 7 Apr
 2025 08:29:49 +0000
Received: from AM6PR08MB3317.eurprd08.prod.outlook.com
 ([fe80::e42a:494c:6581:1897]) by AM6PR08MB3317.eurprd08.prod.outlook.com
 ([fe80::e42a:494c:6581:1897%4]) with mapi id 15.20.8534.048; Mon, 7 Apr 2025
 08:29:49 +0000
Message-ID: <ea4dd14b-5923-4838-bf3c-42f78fad85f5@arm.com>
Date: Mon, 7 Apr 2025 09:29:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] drm/panthor: Add performance counter uAPI
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
References: <cover.1743517880.git.lukas.zapolskas@arm.com>
 <45c1f1a99427800ee154f22070648c41e0d3dfe9.1743517880.git.lukas.zapolskas@arm.com>
Content-Language: en-GB
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <45c1f1a99427800ee154f22070648c41e0d3dfe9.1743517880.git.lukas.zapolskas@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0546.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::17) To AM6PR08MB3317.eurprd08.prod.outlook.com
 (2603:10a6:209:42::28)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3317:EE_|AS2PR08MB9667:EE_|AMS0EPF000001AF:EE_|DU0PR08MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: d0ce5891-2a76-4133-f0a1-08dd75ae6587
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?MXB2QXQ1SDltSzBIcjUybE9OMDVabWp3Tnp6RUQ2OWt5SHJjUCtGTE5KZW9W?=
 =?utf-8?B?UmNxeHpxZm9ZRXRucFdjdzY4Z2thWkZUZHNXejR4RCttam1lRG1XVDZCTXlB?=
 =?utf-8?B?TWtXR3BQWkx3aDluNkdlQXY1cXFLQiswRTBEUjVMOFl6Y28wc0lWbFM5VzlS?=
 =?utf-8?B?WVlJMmxlWmtPS0lBNzZoc0IvaFpoZUVHRkxvMmdYdW1yMUgzcVo4MVcyNnpT?=
 =?utf-8?B?ZjRuVUVPQ0Fqb0JNM3lvSjh6eUNTckxybzFjbFpNUER4dmpTOGlwUVdxdGJq?=
 =?utf-8?B?Tms2ckZKWlIraVZDaDhBQXlUVmFnL1dxd25seVFPaUtLZytJL0ZVMUNIRFlx?=
 =?utf-8?B?dnN3Y0tqaUFBWGdJSjk2U2liemtJQlNvbmp0UzBZNEJidGlmeGIwVTg5b0E3?=
 =?utf-8?B?YzNDWkhFT082SzFVRkpWQ1JKOWRXWGZRdGZZZDBvOVJOdm1vdUtNaXRIYjA1?=
 =?utf-8?B?SXA3WUkrTVVLV3FiZjh0bFozemxGeWEyb0U1MGZsSzgxVzN0SXJmbHRPM01j?=
 =?utf-8?B?S05Id0xhb1UvMVhtK3lFMzRGdW5HTlBKN2F5UWFmR1RhdThzODJTVk9UNkpP?=
 =?utf-8?B?Znk1RmlRQktmWnJhbmFTVnZsa0Z0Y2luSHNpK0JRSGk1SWhDUk52V1BKWVhq?=
 =?utf-8?B?a3RtYVJXM0luRHlnb3pHK3hNTnJOYUZ0MXNRNjI5dnhsM3d5cTFyNlZ4SjVB?=
 =?utf-8?B?N3d0c3hoTWZvZGJYQWNqL1YzbVl2a21qRmtINzBvQkVPZVpHVm5KdEw1aCt3?=
 =?utf-8?B?TGJpWENhVElhNjl3S1QrN3NlYmg2NWFFdmNzS1dXV3NsVDREbkdXUnRZcnor?=
 =?utf-8?B?RjhoUHNvWXN1dCtzKzBYK3dpWkFZeEZZZTNmR1BGZzdvYnFiK1lVc29UdDI0?=
 =?utf-8?B?NzMvVXJpWVFhVVlnREJSeHdLc1A1R3N3d0sxSmVETVUzSUkwWTRnbEk0OWRa?=
 =?utf-8?B?TzlMaUZtQnFvMmtnNWJmd2ZReXJNcTdFaVFYengweUc5T0JEaW91OGR1ZXlB?=
 =?utf-8?B?ZHEyTU1xeGxHdmY3YmVxaER2WUxKSlhBSUU1VXZUSWp4cjZ6QjdkSGNVNU5G?=
 =?utf-8?B?VnpYQjZrUmVlYXg0bVlSRE1ydUt4a00vNXpKK0ZDVWRhUTVqMmlvQ0U1Ym9y?=
 =?utf-8?B?d09CMGlYRWFxUjFSUEwvVHJtRTl5M29oNnZLSVB6UEZLaVpuRkx5MzVMVWZv?=
 =?utf-8?B?V0tnMCszb1NBWlpwVk0zUXRQSVBYd2p6bDhnQysyc0dkUDA5ZE56UlUrZXBu?=
 =?utf-8?B?VEdSRWQ5UU1lNGZDWnJnRE9uVkhIMXhxU2U4M0JiWnJpQzhjOVNZQWZ3WTJU?=
 =?utf-8?B?cXdQNUpwZ1Y5VnhHcDk3VzVWeGdIM0RNY0dFbFd0cWUrMGh1VVc3RGtDYmxM?=
 =?utf-8?B?RG1zS25tUGVnOUhTeGhXL1RwSzhNNm1wWnYvUjJEWE1DWTVxK2ZNUENFRFdn?=
 =?utf-8?B?akx0dm81czBBVVBmdTQ5MGJuUDFjNVJqN2lpZHRzS05HV2tDVkJoNGRZNWFw?=
 =?utf-8?B?UGNWMDlpRlg4Uk4vbFFQTnBHcWRIOGJjaXh1UXJVblRQTlVIWEFrM1BOdVU5?=
 =?utf-8?B?WnlENmtIeURQNXpmeXFCSkdwUFRRKzdrdXNCeHU2R3AwdTh4aFhkZEdtZVk3?=
 =?utf-8?B?bUtJcDV5akRLNXI3bGN5YjNNWWthL2htRUJaWi9qanJLaXVTWUhlQ1BSaTBD?=
 =?utf-8?B?eUJCK1JPK1R4ZU5IZ09MSmFFUmQwYmcwVDlZbWdqRVc3dzlZMXJ3ek9hTkV2?=
 =?utf-8?B?V0xRdnZqWFpzdXRtMU90RVZrWkc5RGJ3L01JbUZjc3JFSFNDdEd3cG9leU82?=
 =?utf-8?B?d3dRbUtJOWhDSFpHdnk4Y1p0KzFSQnIwYTAyNXBvU0dQUUtpeTdZZ01QUXpG?=
 =?utf-8?B?ZWNGcnNRck9BRGFPTGozY2grVUNyK1NZVjM1VUIrWXZhN0dYSmFkN1pyTG9L?=
 =?utf-8?Q?Y/gOt7mgWac=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3317.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9667
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:209:42::28];
 domain=AM6PR08MB3317.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0f85ec3f-38a7-4bd1-4311-08dd75ae5c72
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|35042699022|376014|82310400026|14060799003|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2hBeVpGaW9DWW8yWTliT2gwQ2xpbFpZOVRvL3c5SWZONTl3MlpodWhwM2ZL?=
 =?utf-8?B?WEdycjBxYXM3Kzh6MjlNRktjbGhIaXpSQXRMekc3TFhkcUtzWFQxSkt6eFRm?=
 =?utf-8?B?UXhlZ2Z0OGlrVldpYnAxcFU1M3U1cVBRYXRRKzZzbHBleExUOGM0SGxMMi90?=
 =?utf-8?B?RjlJa0w3UGhzbUI5SVpONVBaMHFBdElTNHVrdWxmT014QzR2cWpGZWwrRmFS?=
 =?utf-8?B?b2dvbEYzL2xadk9uMVhYQWljSGcwOFdwM0tWaXhTNURnOXpnMGxJU2NlOFpv?=
 =?utf-8?B?WHBseFFFRk5FakxlcUgvcmZIMUlGeGZpUEFEbEY3WTRKb2NpWTdmcDlvQlQ0?=
 =?utf-8?B?TFNQaHlwa3lrMWxUM2FZdlpPZWE1eVJPT0U5U3JrWTdxUzJCN2xvaW04M1lr?=
 =?utf-8?B?cWtsQTVaK28zd3AyK3RWK2ZBbmlFc1hPR2xTaGpHSzRuQ3ZrUnZidi9oK0sw?=
 =?utf-8?B?NFZPcVFnRXY0NHdndVBJNE1qZzdROTROOGVCaFIybmMzUStxSWgwMWhLUnVJ?=
 =?utf-8?B?RHFWMWR1SktVV3o5VTlBeUcvRDdmQzVPS2JIZ3NHNTZuOXk3UTgvR3dRVjBk?=
 =?utf-8?B?eVVmejRZUXhnT29hTVJhUWdSR25TdFNJWENCaXFWTFNMcU9jM01GREtSWC9l?=
 =?utf-8?B?bE9QajczZXkzMzVpMHlNdFBZL0ZEdTZMc29CRVcvTHR2ZzBhSzMxWlRXN3BJ?=
 =?utf-8?B?QTY2S2Z1UmhLdllvbGlTbGdCeEgxWnpoNUlvcHpsalpCL3hCaUg3bnM0ZUJx?=
 =?utf-8?B?dmlYbU1TNFdZQkU2Y1g5MXUvL3Nnb3dLY3VXelovQnZxSC85VU1lTkRDZGYy?=
 =?utf-8?B?ZUtOMGpML0tWaEdQRExuakFoRHpPZG1wbHJBSzZWVG9KSmFGT3ZQUXFRU3JU?=
 =?utf-8?B?MDRDekY0SUczNkFKUlFxQ0ppbVZ5Ynl2eVloRm9zQldwNjNnaXYvNVBLbUhY?=
 =?utf-8?B?dkxNbmhJd2V5ZnZoTzdmbytESEJ2ZUJuV21Kc2d1R1JGbmpXWjJmblMzcnJU?=
 =?utf-8?B?QjhlREtzOEE1NEpQN0JPbjByRkgvME54S0dGUFE3bXVPdUdSWDM5L2s5azla?=
 =?utf-8?B?emg3MGNIbEI4K2Jmc05mSGFSekYwTkl4bTE1QnBkQnl4Z2tIVnRlYkZCemVB?=
 =?utf-8?B?NnBzSlZBbXJESGRRdEl0d0x4MnJHdUVsbXFrbFFCYUMvYlBSMEhnZ3lvUDhk?=
 =?utf-8?B?amZLTjRzZ05Pck9VTkhLdERPbWhKU2VXdTNOQTNCSnBJL0xpTHQzbG9rYlFQ?=
 =?utf-8?B?eXVwUE1Ud0hDMyt0dEI3TXB3dTA2NmJIdkVjb1dJSzltYUZKQmJVQVhadThw?=
 =?utf-8?B?ZDFTS3p1NDE4eklaS0x1M1lHbDBPQmd0M2VtSGk2RWh0ZXh3RW82UjNUWHc2?=
 =?utf-8?B?QkZxeWROTFBwd1lTczA2cGV5Z25NWWcvTjZJakZDTld2ZlJSUVVtRGs1RDI3?=
 =?utf-8?B?MUFSejEwemdGZmRibUVybUhQQi9lbVovK1N6QStSME01Y2RHdzZ0MUNHS1J0?=
 =?utf-8?B?OWh0eFg4QmVGL3R2VTdvNzc2SUJuY2R2cy9UQTR1UFlXWUN4aGt6R2lJVjZO?=
 =?utf-8?B?NzJPaWp4cXVjcC9NWGVlVWt1YlQxd09zWloyeXdBR0NSRkF2dEFGYXNxUGk2?=
 =?utf-8?B?SDAvV21iK2xjOXVSUk5BSTIzdE5LbmRSVUdlazA2eE9hRjFVYXp3R2F4bVQy?=
 =?utf-8?B?Mk9ieG95dW94TytIK3VtRm9NLzVUaERzaFRkOGZZLzg3b2taS0x3M0lKNmVS?=
 =?utf-8?B?NzM1cUUrM3B5RlNucW45WjZzS0J3RDVzNDVDZmtuWlF0RlIxdHVndXRaWU9O?=
 =?utf-8?B?OWFOZVh1RTE4MHVtY1ZQTlFwNlduQUFEb0JDNFVadEdZcFNRZjBMZGpwM2k1?=
 =?utf-8?B?UW9nV0g2UTdjOXRuVkRuaUxhMTlDNEI1L21uWitvb3FSSk5tdnB6TFNYclRR?=
 =?utf-8?B?OU9qR3c5WHhndmNxYzlHaVZ2Z3hLdlJPbUdWOUQ0c3g5M1VwZmhiVHNtQy9q?=
 =?utf-8?B?Mk56OUlFL2k0TlFGeHhVT0xPdXV3UDZNajRsalNzc1lXZVFRVjdZSE5KbVU2?=
 =?utf-8?Q?/KqlfE?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(35042699022)(376014)(82310400026)(14060799003)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 08:30:04.2926 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ce5891-2a76-4133-f0a1-08dd75ae6587
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7485
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



On 01/04/2025 16:48, Lukas Zapolskas wrote:
> This patch extends the DEV_QUERY ioctl to return information about the
> performance counter setup for userspace, and introduces the new
> ioctl DRM_PANTHOR_PERF_CONTROL in order to allow for the sampling of
> performance counters.
> 
> The new design is inspired by the perf aux ringbuffer, with the insert
> and extract indices being mapped to userspace, allowing multiple samples
> to be exposed at any given time. To avoid pointer chasing, the sample
> metadata and block metadata are inline with the elements they
> describe.
> 
> Userspace is responsible for passing in resources for samples to be
> exposed, including the event file descriptor for notification of new
> sample availability, the ringbuffer BO to store samples, and the
> control BO along with the offset for mapping the insert and extract
> indices. Though these indices are only a total of 8 bytes, userspace
> can then reuse the same physical page for tracking the state of
> multiple buffers by giving different offsets from the BO start to
> map them.
> 
> Co-developed-by: Mihail Atanassov <mihail.atanassov@arm.com>
> Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> ---
>   include/uapi/drm/panthor_drm.h | 545 +++++++++++++++++++++++++++++++++
>   1 file changed, 545 insertions(+)
> 
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 97e2c4510e69..c63cbdddde76 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -127,6 +127,9 @@ enum drm_panthor_ioctl_id {
>   
>   	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
>   	DRM_PANTHOR_TILER_HEAP_DESTROY,
> +
> +	/** @DRM_PANTHOR_PERF_CONTROL: Control a performance counter session. */
> +	DRM_PANTHOR_PERF_CONTROL,
>   };
>   
>   /**
> @@ -226,6 +229,9 @@ enum drm_panthor_dev_query_type {
>   	 * @DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO: Query allowed group priorities information.
>   	 */
>   	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
> +
> +	/** @DRM_PANTHOR_DEV_QUERY_PERF_INFO: Query performance counter interface information. */
> +	DRM_PANTHOR_DEV_QUERY_PERF_INFO,
>   };
>   
>   /**
> @@ -379,6 +385,123 @@ struct drm_panthor_group_priorities_info {
>   	__u8 pad[3];
>   };
>   
> +/**
> + * enum drm_panthor_perf_feat_flags - Performance counter configuration feature flags.
> + */
> +enum drm_panthor_perf_feat_flags {
> +	/** @DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT: Coarse-grained block states are supported. */
> +	DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT = 1 << 0,
> +};
> +
> +/**
> + * enum drm_panthor_perf_block_type - Performance counter supported block types.
> + */
> +enum drm_panthor_perf_block_type {
> +	/** @DRM_PANTHOR_PERF_BLOCK_METADATA: Internal use only. */
> +	DRM_PANTHOR_PERF_BLOCK_METADATA = 0,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_FW: The FW counter block. */
> +	DRM_PANTHOR_PERF_BLOCK_FW,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_CSHW: The CSHW counter block. */
> +	DRM_PANTHOR_PERF_BLOCK_CSHW,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_TILER: The tiler counter block. */
> +	DRM_PANTHOR_PERF_BLOCK_TILER,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_MEMSYS: A memsys counter block. */
> +	DRM_PANTHOR_PERF_BLOCK_MEMSYS,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_SHADER: A shader core counter block. */
> +	DRM_PANTHOR_PERF_BLOCK_SHADER,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_FIRST: Internal use only. */
> +	DRM_PANTHOR_PERF_BLOCK_FIRST = DRM_PANTHOR_PERF_BLOCK_FW,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_LAST: Internal use only. */
> +	DRM_PANTHOR_PERF_BLOCK_LAST = DRM_PANTHOR_PERF_BLOCK_SHADER,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_MAX: Internal use only. */
> +	DRM_PANTHOR_PERF_BLOCK_MAX = DRM_PANTHOR_PERF_BLOCK_LAST + 1,
> +};
> +
> +/**
> + * enum drm_panthor_perf_clock - Identifier of the clock used to produce the cycle count values
> + * in a given block.
> + *
> + * Since the integrator has the choice of using one or more clocks, there may be some confusion
> + * as to which blocks are counted by which clock values unless this information is explicitly
> + * provided as part of every block sample. Not every single clock here can be used: in the simplest
> + * case, all cycle counts will be associated with the top-level clock.
> + */
> +enum drm_panthor_perf_clock {
> +	/** @DRM_PANTHOR_PERF_CLOCK_TOPLEVEL: Top-level CSF clock. */
> +	DRM_PANTHOR_PERF_CLOCK_TOPLEVEL,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_CLOCK_COREGROUP: Core group clock, responsible for the MMU, L2
> +	 * caches and the tiler.
> +	 */
> +	DRM_PANTHOR_PERF_CLOCK_COREGROUP,
> +
> +	/** @DRM_PANTHOR_PERF_CLOCK_SHADER: Clock for the shader cores. */
> +	DRM_PANTHOR_PERF_CLOCK_SHADER,
> +};
> +
> +/**
> + * struct drm_panthor_perf_info - Performance counter interface information
> + *
> + * Structure grouping all queryable information relating to the performance counter
> + * interfaces.
> + */
> +struct drm_panthor_perf_info {
> +	/**
> +	 * @counters_per_block: The number of 8-byte counters available in a block.
> +	 */
> +	__u32 counters_per_block;
> +
> +	/**
> +	 * @sample_header_size: The size of the header struct available at the beginning
> +	 * of every sample.
> +	 */
> +	__u32 sample_header_size;
> +
Thinking about this further, the DEV_QUERY.PERF_INFO must also provide
the sample size for backwards/forwards compatibility. Otherwise, an old
userspace cannot compute the sample size properly when we add new blocks
or remove old ones.

The block size is computable completely from the data already provided
in the uAPI and so does not need to be provided.
> +	/**
> +	 * @block_header_size: The size of the header struct inline with the counters for a
> +	 * single block.
> +	 */
> +	__u32 block_header_size;
> +
> +	/** @flags: Combination of drm_panthor_perf_feat_flags flags. */
> +	__u32 flags;
> +
> +	/**
> +	 * @supported_clocks: Bitmask of the clocks supported by the GPU.
> +	 *
> +	 * Each bit represents a variant of the enum drm_panthor_perf_clock.
> +	 *
> +	 * For the same GPU, different implementers may have different clocks for the same hardware
> +	 * block. At the moment, up to four clocks are supported, and any clocks that are present
> +	 * will be reported here.
> +	 */
> +	__u32 supported_clocks;
> +
> +	/** @fw_blocks: Number of FW blocks available. */
> +	__u32 fw_blocks;
> +
> +	/** @cshw_blocks: Number of CSHW blocks available. */
> +	__u32 cshw_blocks;
> +
> +	/** @tiler_blocks: Number of tiler blocks available. */
> +	__u32 tiler_blocks;
> +
> +	/** @memsys_blocks: Number of memsys blocks available. */
> +	__u32 memsys_blocks;
> +
> +	/** @shader_blocks: Number of shader core blocks available. */
> +	__u32 shader_blocks;
> +};
> +
>   /**
>    * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
>    */
> @@ -977,6 +1100,426 @@ struct drm_panthor_tiler_heap_destroy {
>   	__u32 pad;
>   };
>   
> +/**
> + * DOC: Performance counter decoding in userspace.
> + *
> + * Each sample will be exposed to userspace in the following manner:
> + *
> + * +--------+--------+------------------------+--------+-------------------------+-----+
> + * | Sample | Block  |        Block           | Block  |         Block           | ... |
> + * | header | header |        counters        | header |         counters        |     |
> + * +--------+--------+------------------------+--------+-------------------------+-----+
> + *
> + * Each sample will start with a sample header of type @struct drm_panthor_perf_sample header,
> + * providing sample-wide information like the start and end timestamps, the counter set currently
> + * configured, and any errors that may have occurred during sampling.
> + *
> + * After the fixed size header, the sample will consist of blocks of
> + * 64-bit @drm_panthor_dev_query_perf_info::counters_per_block counters, each prefaced with a
> + * header of its own, indicating source block type, as well as the cycle count needed to normalize
> + * cycle values within that block, and a clock source identifier.
> + */
> +
> +/**
> + * enum drm_panthor_perf_block_state - Bitmask of the power and execution states that an individual
> + * hardware block went through in a sampling period.
> + *
> + * Because the sampling period is controlled from userspace, the block may undergo multiple
> + * state transitions, so this must be interpreted as one or more such transitions occurring.
> + */
> +enum drm_panthor_perf_block_state {
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN: The state of this block was unknown during
> +	 * the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN = 0,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_ON: This block was powered on for some or all of
> +	 * the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_ON = 1 << 0,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_OFF: This block was powered off for some or all of the
> +	 * sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_OFF = 1 << 1,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE: This block was available for execution for
> +	 * some or all of the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE = 1 << 2,
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE: This block was unavailable for execution for
> +	 * some or all of the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE = 1 << 3,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL: This block was executing in normal mode
> +	 * for some or all of the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL = 1 << 4,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED: This block was executing in protected mode
> +	 * for some or all of the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED = 1 << 5,
> +};
> +
> +/**
> + * struct drm_panthor_perf_block_header - Header present before every block in the
> + * sample ringbuffer.
> + */
> +struct drm_panthor_perf_block_header {
> +	/** @block_type: Type of the block. */
> +	__u8 block_type;
> +
> +	/** @block_idx: Block index. */
> +	__u8 block_idx;
> +
> +	/**
> +	 * @block_states: Coarse-grained block transitions, bitmask of enum
> +	 * drm_panthor_perf_block_states.
> +	 */
> +	__u8 block_states;
> +
> +	/**
> +	 * @clock: Clock used to produce the cycle count for this block, taken from
> +	 * enum drm_panthor_perf_clock. The cycle counts are stored in the sample header.
> +	 */
> +	__u8 clock;
> +
> +	/** @pad: MBZ. */
> +	__u8 pad[4];
> +
> +	/** @enable_mask: Bitmask of counters requested during the session setup. */
> +	__u64 enable_mask[2];
> +};
> +
> +/**
> + * enum drm_panthor_perf_sample_flags - Sample-wide events that occurred over the sampling
> + * period.
> + */
> +enum drm_panthor_perf_sample_flags {
> +	/**
> +	 * @DRM_PANTHOR_PERF_SAMPLE_OVERFLOW: This sample contains overflows due to the duration
> +	 * of the sampling period.
> +	 */
> +	DRM_PANTHOR_PERF_SAMPLE_OVERFLOW = 1 << 0,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_SAMPLE_ERROR: This sample encountered an error condition during
> +	 * the sample duration.
> +	 */
> +	DRM_PANTHOR_PERF_SAMPLE_ERROR = 1 << 1,
> +};
> +
> +/**
> + * struct drm_panthor_perf_sample_header - Header present before every sample.
> + */
> +struct drm_panthor_perf_sample_header {
> +	/**
> +	 * @timestamp_start_ns: Earliest timestamp that values in this sample represent, in
> +	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
> +	 */
> +	__u64 timestamp_start_ns;
> +
> +	/**
> +	 * @timestamp_end_ns: Latest timestamp that values in this sample represent, in
> +	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
> +	 */
> +	__u64 timestamp_end_ns;
> +
> +	/** @block_set: Set of performance counter blocks. */
> +	__u8 block_set;
> +
> +	/** @pad: MBZ. */
> +	__u8 pad[3];
> +
> +	/** @flags: Current sample flags, combination of drm_panthor_perf_sample_flags. */
> +	__u32 flags;
> +
> +	/**
> +	 * @user_data: User data provided as part of the command that triggered this sample.
> +	 *
> +	 * - Automatic samples (periodic ones or those around non-counting periods or power state
> +	 * transitions) will be tagged with the user_data provided as part of the
> +	 * DRM_PANTHOR_PERF_COMMAND_START call.
> +	 * - Manual samples will be tagged with the user_data provided with the
> +	 * DRM_PANTHOR_PERF_COMMAND_SAMPLE call.
> +	 * - A session's final automatic sample will be tagged with the user_data provided with the
> +	 * DRM_PANTHOR_PERF_COMMAND_STOP call.
> +	 */
> +	__u64 user_data;
> +
> +	/**
> +	 * @toplevel_clock_cycles: The number of cycles elapsed between
> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the top-level clock if the
> +	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
> +	 */
> +	__u64 toplevel_clock_cycles;
> +
> +	/**
> +	 * @coregroup_clock_cycles: The number of cycles elapsed between
> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the coregroup clock if the
> +	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
> +	 */
> +	__u64 coregroup_clock_cycles;
> +
> +	/**
> +	 * @shader_clock_cycles: The number of cycles elapsed between
> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the shader core clock if the
> +	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
> +	 */
> +	__u64 shader_clock_cycles;
> +};
> +
> +/**
> + * enum drm_panthor_perf_command - Command type passed to the DRM_PANTHOR_PERF_CONTROL
> + * IOCTL.
> + */
> +enum drm_panthor_perf_command {
> +	/** @DRM_PANTHOR_PERF_COMMAND_SETUP: Create a new performance counter sampling context. */
> +	DRM_PANTHOR_PERF_COMMAND_SETUP,
> +
> +	/** @DRM_PANTHOR_PERF_COMMAND_TEARDOWN: Teardown a performance counter sampling context. */
> +	DRM_PANTHOR_PERF_COMMAND_TEARDOWN,
> +
> +	/** @DRM_PANTHOR_PERF_COMMAND_START: Start a sampling session on the indicated context. */
> +	DRM_PANTHOR_PERF_COMMAND_START,
> +
> +	/** @DRM_PANTHOR_PERF_COMMAND_STOP: Stop the sampling session on the indicated context. */
> +	DRM_PANTHOR_PERF_COMMAND_STOP,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_COMMAND_SAMPLE: Request a manual sample on the indicated context.
> +	 *
> +	 * When the sampling session is configured with a non-zero sampling frequency, any
> +	 * DRM_PANTHOR_PERF_CONTROL calls with this command will be ignored and return an
> +	 * -EINVAL.
> +	 */
> +	DRM_PANTHOR_PERF_COMMAND_SAMPLE,
> +};
> +
> +/**
> + * struct drm_panthor_perf_control - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL.
> + */
> +struct drm_panthor_perf_control {
> +	/** @cmd: Command from enum drm_panthor_perf_command. */
> +	__u32 cmd;
> +
> +	/**
> +	 * @handle: session handle.
> +	 *
> +	 * Returned by the DRM_PANTHOR_PERF_COMMAND_SETUP call.
> +	 * It must be used in subsequent commands for the same context.
> +	 */
> +	__u32 handle;
> +
> +	/**
> +	 * @size: size of the command structure.
> +	 *
> +	 * If the pointer is NULL, the size is updated by the driver to provide the size of the
> +	 * output structure. If the pointer is not NULL, the driver will only copy min(size,
> +	 * struct_size) to the pointer and update the size accordingly.
> +	 */
> +	__u64 size;
> +
> +	/** @pointer: user pointer to a command type struct. */
> +	__u64 pointer;
> +};
> +
> +/**
> + * enum drm_panthor_perf_counter_set - The counter set to be requested from the hardware.
> + *
> + * The hardware supports a single performance counter set at a time, so requesting any set other
> + * than the primary may fail if another process is sampling at the same time.
> + *
> + * If in doubt, the primary counter set has the most commonly used counters and requires no
> + * additional permissions to open.
> + */
> +enum drm_panthor_perf_counter_set {
> +	/**
> +	 * @DRM_PANTHOR_PERF_SET_PRIMARY: The default set configured on the hardware.
> +	 *
> +	 * This is the only set for which all counters in all blocks are defined.
> +	 */
> +	DRM_PANTHOR_PERF_SET_PRIMARY,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_SET_SECONDARY: The secondary performance counter set.
> +	 *
> +	 * Some blocks may not have any defined counters for this set, and the block will
> +	 * have the UNAVAILABLE block state permanently set in the block header.
> +	 *
> +	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
> +	 */
> +	DRM_PANTHOR_PERF_SET_SECONDARY,
> +
> +	/**
> +	 * @DRM_PANTHOR_PERF_SET_TERTIARY: The tertiary performance counter set.
> +	 *
> +	 * Some blocks may not have any defined counters for this set, and the block will have
> +	 * the UNAVAILABLE block state permanently set in the block header. Note that the
> +	 * tertiary set has the fewest defined counter blocks.
> +	 *
> +	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
> +	 */
> +	DRM_PANTHOR_PERF_SET_TERTIARY,
> +};
> +
> +/**
> + * struct drm_panthor_perf_ringbuf_control - Struct used to map in the ring buffer control indices
> + *                                           into memory shared between user and kernel.
> + *
> + */
> +struct drm_panthor_perf_ringbuf_control {
> +	/**
> +	 * @extract_idx: The index of the latest sample that was processed by userspace. Only
> +	 *               modifiable by userspace.
> +	 */
> +	__u64 extract_idx;
> +
> +	/**
> +	 * @insert_idx: The index of the latest sample emitted by the kernel. Only modiable by
> +	 *               modifiable by the kernel.
> +	 */
> +	__u64 insert_idx;
> +};
> +
> +/**
> + * struct drm_panthor_perf_cmd_setup - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
> + * when the DRM_PANTHOR_PERF_COMMAND_SETUP command is specified.
> + */
> +struct drm_panthor_perf_cmd_setup {
> +	/**
> +	 * @block_set: Set of performance counter blocks, member of
> +	 *             enum drm_panthor_perf_block_set.
> +	 *
> +	 * This is a global configuration and only one set can be active at a time. If
> +	 * another client has already requested a counter set, any further requests
> +	 * for a different counter set will fail and return an -EBUSY.
> +	 *
> +	 * If the requested set does not exist, the request will fail and return an -EINVAL.
> +	 *
> +	 * Some sets have additional requirements to be enabled, and the setup request will
> +	 * fail with an -EACCES if these requirements are not satisfied.
> +	 */
> +	__u8 block_set;
> +
> +	/** @pad: MBZ. */
> +	__u8 pad[7];
> +
> +	/** @fd: eventfd for signalling the availability of a new sample. */
> +	__u32 fd;
> +
> +	/** @ringbuf_handle: Handle to the BO to write perf counter sample to. */
> +	__u32 ringbuf_handle;
> +
> +	/**
> +	 * @control_handle: Handle to the BO containing a contiguous 16 byte range, used for the
> +	 * insert and extract indices for the ringbuffer.
> +	 */
> +	__u32 control_handle;
> +
> +	/**
> +	 * @sample_slots: The number of slots available in the userspace-provided BO. Must be
> +	 * a power of 2.
> +	 *
> +	 * If sample_slots * sample_size does not match the BO size, the setup request will fail.
> +	 */
> +	__u32 sample_slots;
> +
> +	/**
> +	 * @control_offset: Offset into the control BO where the insert and extract indices are
> +	 * located.
> +	 */
> +	__u64 control_offset;
> +
> +	/**
> +	 * @sample_freq_ns: Period between automatic counter sample collection in nanoseconds. Zero
> +	 * disables automatic collection and all collection must be done through explicit calls
> +	 * to DRM_PANTHOR_PERF_CONTROL.SAMPLE. Non-zero values will disable manual counter sampling
> +	 * via the DRM_PANTHOR_PERF_COMMAND_SAMPLE command.
> +	 *
> +	 * This disables software-triggered periodic sampling, but hardware will still trigger
> +	 * automatic samples on certain events, including shader core power transitions, and
> +	 * entries to and exits from non-counting periods. The final stop command will also
> +	 * trigger a sample to ensure no data is lost.
> +	 */
> +	__u64 sample_freq_ns;
> +
> +	/**
> +	 * @fw_enable_mask: Bitmask of counters to request from the FW counter block. Any bits
> +	 * past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
> +	 */
> +	__u64 fw_enable_mask[2];
> +
> +	/**
> +	 * @cshw_enable_mask: Bitmask of counters to request from the CSHW counter block. Any bits
> +	 * past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
> +	 */
> +	__u64 cshw_enable_mask[2];
> +
> +	/**
> +	 * @tiler_enable_mask: Bitmask of counters to request from the tiler counter block. Any
> +	 * bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
> +	 */
> +	__u64 tiler_enable_mask[2];
> +
> +	/**
> +	 * @memsys_enable_mask: Bitmask of counters to request from the memsys counter blocks. Any
> +	 * bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
> +	 */
> +	__u64 memsys_enable_mask[2];
> +
> +	/**
> +	 * @shader_enable_mask: Bitmask of counters to request from the shader core counter blocks.
> +	 * Any bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
> +	 */
> +	__u64 shader_enable_mask[2];
> +};
> +
> +/**
> + * struct drm_panthor_perf_cmd_start - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
> + * when the DRM_PANTHOR_PERF_COMMAND_START command is specified.
> + */
> +struct drm_panthor_perf_cmd_start {
> +	/**
> +	 * @user_data: User provided data that will be attached to automatic samples collected
> +	 * until the next DRM_PANTHOR_PERF_COMMAND_STOP.
> +	 */
> +	__u64 user_data;
> +};
> +
> +/**
> + * struct drm_panthor_perf_cmd_stop - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
> + * when the DRM_PANTHOR_PERF_COMMAND_STOP command is specified.
> + */
> +struct drm_panthor_perf_cmd_stop {
> +	/**
> +	 * @user_data: User provided data that will be attached to the automatic sample collected
> +	 * at the end of this sampling session.
> +	 */
> +	__u64 user_data;
> +};
> +
> +/**
> + * struct drm_panthor_perf_cmd_sample - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
> + * when the DRM_PANTHOR_PERF_COMMAND_SAMPLE command is specified.
> + */
> +struct drm_panthor_perf_cmd_sample {
> +	/** @user_data: User provided data that will be attached to the sample.*/
> +	__u64 user_data;
> +};
> +
>   /**
>    * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
>    * @__access: Access type. Must be R, W or RW.
> @@ -1019,6 +1562,8 @@ enum {
>   		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
>   	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =
>   		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
> +	DRM_IOCTL_PANTHOR_PERF_CONTROL =
> +		DRM_IOCTL_PANTHOR(WR, PERF_CONTROL, perf_control)
>   };
>   
>   #if defined(__cplusplus)

