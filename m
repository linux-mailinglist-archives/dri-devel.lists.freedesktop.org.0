Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3899BF717A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 16:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DB110E06B;
	Tue, 21 Oct 2025 14:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Q0+Tucry";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Q0+Tucry";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010056.outbound.protection.outlook.com [52.101.69.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DE810E06B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 14:33:31 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PrSrxro+KI62qgEk9f6G1wubDctFgRz+N5d0MT0vIqc2FpHYRMtX5E/5TRQU+gl6QwjXtraIfLZ4T7vh8VD6rDUrud3sz+oe9iJDtjWS21QIXNEGgbAk4XJR46Zp/1mR8u0nrhGDU11ayuIeWpZ4dXulHobD/IlyMutBikQisae9vZXF/HAL/al67vMHRhGmvELT7LaDCiATCcjPb5X5b63g//ZYwrVvxDUUDLsHjq0XBg1fjttQuOfEB0dyD1RuYWTF9tao3mJYxbvtZ2cmZDp+QgWXdujCDGGVLK7KGflhckxvZ9Q4TBg4d0pfWKFhPJU/8xKBxJVEGAGDM2ut+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rA7Uk2ofXfvtNE3cC6eRhSkzROBxCpuUflUxcEoeuhw=;
 b=v54TBPFjdE1Ke19ObHG90SuM0UgIUruhMP1kz8UMu7WaZ8qDSx53AKPnay22XpzWtuJKZv3rsZSaOf4b0Xl1l0sdW2fP8mRVhLqmW93Edm8jvshHbwRUE9yrrW15PwJohnY1muT2NMMBWyhmsXJFnioBZ/bJyRABPzSVXJ6VvF16Z4d/C3++PdT9fhWn2oKvtYRl3N2jyVpwNqkUhNpFEE6hIhhPrm7AIGtSqd+dL5yBrv0R8zPkmlPWmv3q/fI1E9DeB81BVH5I4V015WIEmMxX2dn0nClWZ/ukng/C3+FcVnDBJm15dg/YnNomcJ4dqusDCe2TjrnvH+TGxiOdzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rA7Uk2ofXfvtNE3cC6eRhSkzROBxCpuUflUxcEoeuhw=;
 b=Q0+TucryrHy+8PN5uBH0qJWyHh6DrxqfHjIukfB0TMfy3oQ2QyNjrkzUEGFOdULq6ZZ+8qZLLU00p1R2RTGszspoJVPTUby4Zpcw7m10zF9eefwWJcugAamJi4W9ULeBMtP2oLphxag/QYGa7aqprvXp+x65LtJCFwCiXOk/1Fk=
Received: from DB9PR06CA0016.eurprd06.prod.outlook.com (2603:10a6:10:1db::21)
 by PAVPR08MB9676.eurprd08.prod.outlook.com (2603:10a6:102:31f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 14:33:21 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::1d) by DB9PR06CA0016.outlook.office365.com
 (2603:10a6:10:1db::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.16 via Frontend Transport; Tue,
 21 Oct 2025 14:33:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7
 via Frontend Transport; Tue, 21 Oct 2025 14:33:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdJA6EVESpXxKCtuL/89jbWwlZJ8uviqRFSCtHsUGG+gieGJBTI47I6Dkdv+TmLpRGGBYQ/qDJ44td/oi6plk5C8hpmPDTI/Gom89ma+ex0MxZ6613gHqBZRZbocY5P+o9mvkwEj4tYOmxq21qbEyiio1eq0jhK4plMVCVw5Oz9yRvieiPP66elaJ/wEacI1xC/vg8V9N/UyBIl0qMRq9RDijUmFxQKblSMDyNh1IOUq9JGfZTWGqOhVWxVfT8Jw0pIGyOOiR/V4DZnAoSr6u7AofAYtvby4XfE6IKVbFkXdzgZrnEDswULPrpybf66mwzntVTEQhy6ifk3ehqnTQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rA7Uk2ofXfvtNE3cC6eRhSkzROBxCpuUflUxcEoeuhw=;
 b=psmN6XFXaUj2RmcDGrbwgueqsavJ1BkDtmaw87Tr214Mx4Ybo9jJvbRG10Wb6y7eqv71vkPo36448edGkD58ihn/jdMEh3D8frO21PibSa7Cq2SKIdW/oC3Nx3SLai1iVHmddZvy3D2ZTGDBNsLyoGTy1WJ3CrrmzTHGPf/hUnsz03jYDpk85aDJGWR4wVv1QMELOgPxPao8Oq3CLWhAKWUNmh7jxFg4U5aMVKKkwJsB4al6BJmFaTlitBxFjhxX9Dhs1rCgKJoccl5v/wgdKhuUHCDxyQltyzy2AzhbT9EKHYM6Tv46Q7w8W2THM84GfLgANnwu+T8MmO3lcvzxyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rA7Uk2ofXfvtNE3cC6eRhSkzROBxCpuUflUxcEoeuhw=;
 b=Q0+TucryrHy+8PN5uBH0qJWyHh6DrxqfHjIukfB0TMfy3oQ2QyNjrkzUEGFOdULq6ZZ+8qZLLU00p1R2RTGszspoJVPTUby4Zpcw7m10zF9eefwWJcugAamJi4W9ULeBMtP2oLphxag/QYGa7aqprvXp+x65LtJCFwCiXOk/1Fk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by PAVPR08MB9188.eurprd08.prod.outlook.com (2603:10a6:102:30a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 14:32:46 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%4]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 14:32:46 +0000
Message-ID: <bef0484d-8e17-477a-b4a2-f90d3204ff88@arm.com>
Date: Tue, 21 Oct 2025 15:32:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Support partial unmaps of huge pages
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251019032108.3498086-1-adrian.larumbe@collabora.com>
Content-Language: en-US
From: Akash Goel <akash.goel@arm.com>
In-Reply-To: <20251019032108.3498086-1-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::19) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|PAVPR08MB9188:EE_|DU2PEPF00028D0B:EE_|PAVPR08MB9676:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ebc1e8f-9000-46a4-d55f-08de10aec8ea
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?ajczUmg5bFFaNGFHdGNaQ0RaV1Q1YThDT1I0MytoMmtERTRCcy9jbDRjcHRE?=
 =?utf-8?B?WUtFMXg1TmIzbXVxSTVHdDN3YVl5MDJEYjErOElVZnA0RUJWWU84elUyL2hI?=
 =?utf-8?B?YlZidlM3Tm9UamQrUTI4em02cGljQ0xHWVhCNGI1cG14dHFKZHhtaXBtT3RY?=
 =?utf-8?B?VWZnZ1ZTUHc0NjQxZ1libER6djk0WjFoVFZzdFQ5TkFDZS8wa3Zmdjkvdkdk?=
 =?utf-8?B?YjViWnFndmNwZGxFWE50cU9uczFsYzlwcHFid2p2bzJDSGNBQStsQmJCOVZu?=
 =?utf-8?B?ZnNSQlUrdVdJdk80Z2UvN2dpcDI3bm5zLzdzT0o0QlRDVWxtcXU5NFpkMjlY?=
 =?utf-8?B?NEtDaEFURDdxL0NxVDM0b00wckR4dkNwTDZWRXdmSzVNa29HUFRHOE0wbEFQ?=
 =?utf-8?B?bnlJZ1dOeXlRSjA4WUw5N2dvaXR1eENNSXJpbEtmRk9YWitnVzJwb1EvUlNk?=
 =?utf-8?B?YXdSa2dKUnBYc296ZzZWVEg5QW54elV3QmhQYm85cEdFbXd5bHUvamN5VS8x?=
 =?utf-8?B?aWl0enF2NkZRd0RMaTV3Ukp2SUF4U01OSGE5R2dHVGhFT0RaeGltd0kzV1N6?=
 =?utf-8?B?eTlSYk1SMDBidDNKV1Vzc0ZrTW43WUltbHZDQmxMbVZGU3ZKUE5SZVkzSmhQ?=
 =?utf-8?B?TjA3SWxyUStFWHJ4b2ZtWEY5Ty9oa0hjYWVWU1ErUVZSSjBqZTFMckdhaDVs?=
 =?utf-8?B?bkhrNXBoS05vdC9mKzBtNmlTekczaXB3RDVPSjk0TVM5czZKZExTNkpSaHJ3?=
 =?utf-8?B?dVBydm8zbHZGN0NQRUVLWEN1TmlNSXc1bUwvNXNjOEZoSjJnRldScjRmakJN?=
 =?utf-8?B?ZnVjNkFrK3R2UzlyTFdQMld4OGFDQ2lNUXpyVVNJNWw0ZHU0RWN3R1hmS2VR?=
 =?utf-8?B?MHhleTdQNGlHVCtjMGg4TmV2cUt5b0hyUTNwYVhZekJCRHgzMmtLS3RpRVBh?=
 =?utf-8?B?KzJPSlFsbGFCdUVUM0diTTQydDdEK3Y1eTY0VEFNcE5pRCtYaUw2aTQyNitO?=
 =?utf-8?B?VGlOSHVKSmhiNDZPUEw0OUZ4M3JjK2RQMDlFWUZ5ZkVBYUVldDFrOW03Zmdx?=
 =?utf-8?B?YUJEa2t2MU4wZ2J4NTZ6NEpsaXpoOFlnY2p0bTMyb0JTZ1FvSHArT0VXUFlu?=
 =?utf-8?B?dUtpYmZYZnRPbnhoYzlZSmhPY3FjaXdqSjVtdWkzWC9YTUZGVXVubnJjQXpp?=
 =?utf-8?B?RWlWVklFU1Z4U01acGxOcEc4NW1JQ0RWOGtTWUxLalZTS1JuOHU1L3JYWU4r?=
 =?utf-8?B?ei9nQkZ2UXZ0ZGpBZU1rUmNvaUl4RmpMWXNqUUFpZTN4MnNVS2JLb0NTMzhz?=
 =?utf-8?B?MWdkWlhFNVZiYlI3VDVaZytkUEIrRUpPQVZ0ZmFFVFBRVFpaZDVtS0tHVmVt?=
 =?utf-8?B?dFNpeDBrOVVGeFI0ZzUvMDY1TzBxUmtjaHg0NjhUK0YwODgvOHZxa1NWaEtI?=
 =?utf-8?B?RUw4L3VsWjVnZXJPUmlxMGh6N3JOZ0dNNUR0QVNJdjkwci9ZblF4ZllOYWVW?=
 =?utf-8?B?UGswb0M0MnBweFBOWGRlZnNHeEJYQTdYcmE2YzRuczQzbmkwQmlwbW1LM0RP?=
 =?utf-8?B?UHhrTEI2Vjd4cHpaQU82cXkwTElORCt6dDFnblNGZFpJWndYZGtjT3U0ZmZL?=
 =?utf-8?B?ZkZIRXRBN1RObElrRlJGWFFOTjRPQ3FKd3VXckxZVUFpNnFnWHdBbTNpb3Yr?=
 =?utf-8?B?aUg5Vnc0d2pNbHp0bWx3Q0lrQnhQRDRUbWxsVjRtOThaUWNxbkc4U2EvemFy?=
 =?utf-8?B?dXlIVlJEbkJOQTAzVHNMSmdpUTN2NHpiMGFoN3pxTnJGOThHSFZDVWl0VEFE?=
 =?utf-8?B?NmI1dWNnbkdVQ3hreEhJaGJyVC9KQlJkWE12bzg4Y0dYVHVOY1JkZSttQjJ4?=
 =?utf-8?B?bVRjZ0VTS3RSayt5QXJkbTc3M1FidCt0MnlTMUQweTI3SSs3WmxaYWJDVFVK?=
 =?utf-8?Q?FKmwV4DQCxI9kDqSESKiCwZ74+tHqpXa?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9188
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9ff4e059-863c-46e7-333f-08de10aeb41e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|14060799003|35042699022|1800799024|376014|36860700013|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVRRYjNpMFZRd0dVMEtNQ2dRZ0JLR01nSXF6R1RvZ2dLRzhwcXV4ZDY2R2g2?=
 =?utf-8?B?NUdieG9NcVRJRVRXU2ZvTGhwRWk4TE1Od0tTenlobGtVbkorWjFpNHJXNzhM?=
 =?utf-8?B?d1NEZEhJWEE4VnhOcnpFRCsvclhvVkZ1Y2tBMHVHM3A3OTBpSWZrSjNyYWhU?=
 =?utf-8?B?VmNBNXRQanFkSUQ3cmZNamhObTZsN1JqVU5HcThTWTNWVW9HWWRZendCT1NP?=
 =?utf-8?B?dnduaG5qUjFPUW9MMXphaTBya2FRTzd1akFHZHRsVmJhTG5qYURHcjNGYjdO?=
 =?utf-8?B?RVJzcFp3U0VxWWZON1IxbTdRSUptbitYWDBPbFA3RUFrbUUweHUyeWUwUUFr?=
 =?utf-8?B?bkhzTEpscFExeXZQY1lQNWhWVXJNbTJXRFN4bFdWaXBPY3RlN1pkOW9SQzdD?=
 =?utf-8?B?eGZvS0daZGFoUTZJV1pPd1BkWjFKK1hkUUx3WTEvQ01nTCtpS050Ry9TVGdD?=
 =?utf-8?B?K3E5ckhxOTFhQ2o2bmMyMzIvYjFIem1YNXUybWhFNmF4T0FESHdXZ25NMXVJ?=
 =?utf-8?B?eXp2bTA1blpFOHlncG5pZlIwMnZXeGpuUWw5ZnluMUs3VVpnRE4wT05tdE1q?=
 =?utf-8?B?SDRlbVY2Z0hCOXRkbkxKMXpTZE4xU2p5RFhrd3NQTGQwWnhBZ0lEVkd1WHdI?=
 =?utf-8?B?QmtGUGRoa2M1UEcvZlVLT3Z6UUUvbzJTN0FRRFFlam5wdG5JRFJTNzVJVWFS?=
 =?utf-8?B?dUEvOWNzc0NWeVRYN2QrY2w4dEJlWFBZU0xueHNybFhYQzdiZjBiMGUwdUk0?=
 =?utf-8?B?UmFWYW0rNTIxRVdLZ3pGSnBhR1Z3K21YMG1nSGhUWnVNbDM0eEV0SmVZdXFK?=
 =?utf-8?B?STBxZHpmSDNINmxWUUkzY2hSbzlDQXJuOWsyaXV4QmdzWUlkMzJPQlo1eFJ6?=
 =?utf-8?B?dXRuTjZ3Zi9jUG9XNEhQc1ZkMVFUb05kNnVNRWduMkpuaUFIOHRXOU0rL0hl?=
 =?utf-8?B?Rkt5aDBhOVpjZ093aHg1WUhDczRET2M1ak1kbUlXbDVQbE14N25kTHJVbUdG?=
 =?utf-8?B?YUVVNGd2NTloUE04QzBiMWRlRlU3ZjRlWkpobmc1eFhqNjJ2WWhNbUcwdXdK?=
 =?utf-8?B?ck92UzdBL200ejdyano5VG1ucG9BM0JpVGo3VUp6TnJJQ21QTDVxK0hBak9l?=
 =?utf-8?B?dks5UXJOMnBkY1dTUk4rQzhFL0dEbmczQ2YyU0d2WUEydHVsNVhuN1ZzNHh1?=
 =?utf-8?B?VWZFejdrV3VFWGhCZ29qZ3FVMytSRStsRFRUTGxVelcrSXdITFhMNU5rWm05?=
 =?utf-8?B?T3M5SkVPU2gwQmZqTXFzVjlmY01RaStnRkNwRDYwUEpITXczMHk3NTRQRG4r?=
 =?utf-8?B?WGdrWDFZRHl5WktnOEVhR0djMHRrZVZ5dzVJUTVnWHczZjFNQ2tWZ3dnbWFY?=
 =?utf-8?B?Zk92cEl2cWorVXdqWkFLN2JVY0NVSWw4MU9ta1cvKzlpaFFzMmNEU044MzMw?=
 =?utf-8?B?N3VGN2NISk9icVlMMmxEQWgvL2tYTmM0Z01GT3RBNDZsMy96ZDBaRnlBTStY?=
 =?utf-8?B?K0c4VW01TmZ0NVFrbmJNVC9BWi9UbC9TdWJDRVZlbDNaMHFPZnd0WW5zeHZl?=
 =?utf-8?B?VlF0eGFidElKVXZicjM5QjRPUHg3VDNNUlU4WmNPRWpSU1JkUnhkaEJHaUgz?=
 =?utf-8?B?OHNLMjhoZUs1V3kyN3pYZ3Z2dkZ5aXNVRFVTMHRZckwxSlFkZjlVd3FkY01Y?=
 =?utf-8?B?Vm9ZNjRZZk16S3dGck1qem5HekhlenUzdmlCT3BBZ0o3NkxCWTFtcnpLR1BJ?=
 =?utf-8?B?dVdic0JoZFYwWFk3ZW8zTHFucDh0V2xnVXh5VnlRc295UXlnQXNXSGxBUzVX?=
 =?utf-8?B?U0FmSU95cllXbDk5MFV5L21hRWdzKyt0TVNaN1FFWTE0OEo1WmYrSDRMSzdF?=
 =?utf-8?B?T2NhVzYrVUYvbHgwaHJ2aWRhNFNjaTJEZ0FjOGpKeVpEeW1Wa29ldVNvMFFL?=
 =?utf-8?B?WWdJYk1za3U3OWtjT28vYVc3MnE2Yzkrc05ZdVRZeHdCazkrdlBvSFJhNDg1?=
 =?utf-8?B?TXdmOS9PVmYxeHl4TkJqNXhhY0pCd3huYWxUdFJSLzBBaTBINmZNWi9vWEdL?=
 =?utf-8?B?T2RwMUZINzFKUHJxd1Y3NG0vc093UXBDOUZpeVVHVFlaamJKNndvcVdvM1B1?=
 =?utf-8?Q?qGBs=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(14060799003)(35042699022)(1800799024)(376014)(36860700013)(7416014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 14:33:21.3260 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebc1e8f-9000-46a4-d55f-08de10aec8ea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9676
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



On 10/19/25 04:19, Adrián Larumbe wrote:
> Commit 33729a5fc0ca ("iommu/io-pgtable-arm: Remove split on unmap
> behavior") did away with the treatment of partial unmaps of huge IOPTEs.
> 

Sorry have a doubt.

Corresponding to the commit 33729a5fc0ca, can we now remove the code to 
pre-allocate L3 page table pages i.e. 'op_ctx->rsvd_page_tables.pages' 
inside panthor_vm_prepare_unmap_op_ctx() ?.

> In the case of Panthor, that means an attempt to run a VM_BIND unmap
> operation on a memory region whose start address and size aren't 2MiB
> aligned, in the event it intersects with a huge page, would lead to ARM
> IOMMU management code to fail and a warning being raised.
> 
> Presently, and for lack of a better alternative, it's best to have
> Panthor handle partial unmaps at the driver level, by unmapping entire
> huge pages and remapping the difference between them and the requested
> unmap region.
> 
> This could change in the future when the VM_BIND uAPI is expanded to
> enforce huge page alignment and map/unmap operational constraints that
> render this code unnecessary.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>   drivers/gpu/drm/panthor/panthor_mmu.c | 129 +++++++++++++++++++++++++-
>   1 file changed, 126 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 2d041a2e75e9..f9d200e57c04 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2093,6 +2093,98 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
>   	return 0;
>   }
>   
> +static bool
> +is_huge_page_partial_unmap(const struct panthor_vma *unmap_vma,
> +			   const struct drm_gpuva_op_map *op,
> +			   u64 unmap_start, u64 unmap_range,
> +			   u64 sz2m_prev, u64 sz2m_next)
> +{
> +	size_t pgcount, pgsize;
> +	const struct page *pg;
> +	pgoff_t bo_offset;
> +
> +	if (op->va.addr < unmap_vma->base.va.addr) {


Sorry, another doubt.

Will this condition ever be true ?

For 'op->remap.prev', 'op->va.addr' will always be equal to 
'unmap_vma->base.va.addr'.
And for 'op->remap.next', 'op->va.addr' will always be greater than 
'unmap_vma->base.va.addr'.

Please can you clarify.

Best regards
Akash


> +		bo_offset = unmap_start - unmap_vma->base.va.addr + unmap_vma->base.gem.offset;
> +		sz2m_prev = ALIGN_DOWN(unmap_start, SZ_2M);
> +		sz2m_next = ALIGN(unmap_start + 1, SZ_2M);
> +		pgsize = get_pgsize(unmap_start, unmap_range, &pgcount);
> +
> +	} else {
> +		bo_offset = ((unmap_start + unmap_range - 1) - unmap_vma->base.va.addr)
> +			+ unmap_vma->base.gem.offset;
> +		sz2m_prev = ALIGN_DOWN(unmap_start + unmap_range - 1, SZ_2M);
> +		sz2m_next = ALIGN(unmap_start + unmap_range, SZ_2M);
> +		pgsize = get_pgsize(sz2m_prev, unmap_start + unmap_range - sz2m_prev, &pgcount);
> +	}
> +
> +	pg = to_panthor_bo(unmap_vma->base.gem.obj)->base.pages[bo_offset >> PAGE_SHIFT];
> +
> +	if (pgsize == SZ_4K && folio_order(page_folio(pg)) == PMD_ORDER &&
> +	    unmap_vma->base.va.addr <= sz2m_prev && unmap_vma->base.va.addr +
> +	    unmap_vma->base.va.range >= sz2m_next)
> +		return true;
> +
> +	return false;
> +}
> +
> +struct remap_params {
> +	u64 prev_unmap_start, prev_unmap_range;
> +	u64 prev_remap_start, prev_remap_range;
> +	u64 next_unmap_start, next_unmap_range;
> +	u64 next_remap_start, next_remap_range;
> +	u64 unmap_start, unmap_range;
> +};
> +
> +static struct remap_params
> +get_map_unmap_intervals(const struct drm_gpuva_op_remap *op,
> +			const struct panthor_vma *unmap_vma)
> +{
> +	u64 unmap_start, unmap_range, sz2m_prev, sz2m_next;
> +	struct remap_params params = {0};
> +
> +	drm_gpuva_op_remap_to_unmap_range(op, &unmap_start, &unmap_range);
> +
> +	if (op->prev) {
> +		sz2m_prev = ALIGN_DOWN(unmap_start, SZ_2M);
> +		sz2m_next = ALIGN(unmap_start + 1, SZ_2M);
> +
> +		if (is_huge_page_partial_unmap(unmap_vma, op->prev, unmap_start,
> +					       unmap_range, sz2m_prev, sz2m_next)) {
> +			params.prev_unmap_start = sz2m_prev;
> +			params.prev_unmap_range = SZ_2M;
> +			params.prev_remap_start = sz2m_prev;
> +			params.prev_remap_range = unmap_start & (SZ_2M - 1);
> +
> +			u64 diff = min(sz2m_next - unmap_start, unmap_range);
> +
> +			unmap_range -= diff;
> +			unmap_start += diff;
> +		}
> +	}
> +
> +	if (op->next) {
> +		sz2m_prev = ALIGN_DOWN(unmap_start + unmap_range - 1, SZ_2M);
> +		sz2m_next = ALIGN(unmap_start + unmap_range, SZ_2M);
> +
> +		if (is_huge_page_partial_unmap(unmap_vma, op->next, unmap_start,
> +					       unmap_range, sz2m_prev, sz2m_next)) {
> +			if (unmap_range) {
> +				params.next_unmap_start = sz2m_prev;
> +				params.next_unmap_range = SZ_2M;
> +				unmap_range -= op->next->va.addr & (SZ_2M - 1);
> +			}
> +
> +			params.next_remap_start = op->next->va.addr;
> +			params.next_remap_range = SZ_2M - (op->next->va.addr & (SZ_2M - 1));
> +		}
> +	}
> +
> +	params.unmap_start = unmap_start;
> +	params.unmap_range = unmap_range;
> +
> +	return params;
> +}
> +
>   static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
>   				       void *priv)
>   {
> @@ -2100,20 +2192,51 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
>   	struct panthor_vm *vm = priv;
>   	struct panthor_vm_op_ctx *op_ctx = vm->op_ctx;
>   	struct panthor_vma *prev_vma = NULL, *next_vma = NULL;
> -	u64 unmap_start, unmap_range;
> +	struct remap_params params;
>   	int ret;
>   
> -	drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
> -	ret = panthor_vm_unmap_pages(vm, unmap_start, unmap_range);
> +	/*
> +	 * ARM IOMMU page table management code disallows partial unmaps of huge pages,
> +	 * so when a partial unmap is requested, we must first unmap the entire huge
> +	 * page and then remap the difference between the huge page minus the requested
> +	 * unmap region. Calculating the right offsets and ranges for the different unmap
> +	 * and map operations is the responsibility of the following function.
> +	 */
> +	params = get_map_unmap_intervals(&op->remap, unmap_vma);
> +
> +	ret = panthor_vm_unmap_pages(vm, params.unmap_start, params.unmap_range);
>   	if (ret)
>   		return ret;
>   
>   	if (op->remap.prev) {
> +		ret = panthor_vm_unmap_pages(vm, params.prev_unmap_start,
> +					     params.prev_unmap_range);
> +		if (ret)
> +			return ret;
> +		ret = panthor_vm_map_pages(vm, params.prev_remap_start,
> +					   flags_to_prot(unmap_vma->flags),
> +					   to_drm_gem_shmem_obj(op->remap.prev->gem.obj)->sgt,
> +					   op->remap.prev->gem.offset, params.prev_remap_range);
> +		if (ret)
> +			return ret;
> +
>   		prev_vma = panthor_vm_op_ctx_get_vma(op_ctx);
>   		panthor_vma_init(prev_vma, unmap_vma->flags);
>   	}
>   
>   	if (op->remap.next) {
> +		ret = panthor_vm_unmap_pages(vm, params.next_unmap_start,
> +					     params.next_unmap_range);
> +		if (ret)
> +			return ret;
> +
> +		ret = panthor_vm_map_pages(vm, params.next_remap_start,
> +					   flags_to_prot(unmap_vma->flags),
> +					   to_drm_gem_shmem_obj(op->remap.next->gem.obj)->sgt,
> +					   op->remap.next->gem.offset, params.next_remap_range);
> +		if (ret)
> +			return ret;
> +
>   		next_vma = panthor_vm_op_ctx_get_vma(op_ctx);
>   		panthor_vma_init(next_vma, unmap_vma->flags);
>   	}
> 
> base-commit: 7fb19ea1ec6aa85c75905b1fd732d50801e7fb28
> prerequisite-patch-id: 3b0f61bfc22a616a205ff7c15d546d2049fd53de
