Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FNQKAQ5eml+4gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 17:27:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A1CA5A78
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 17:27:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E38410E1F7;
	Wed, 28 Jan 2026 16:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="gH1rhDAU";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gH1rhDAU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BC310E1F7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 16:27:44 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LbT+06xSBR3jV1k7kTUMooXuWqpGJeit52qM5lGB+8NPFGZdxUXKNw5jOd1hOkRHRrHSstnch0eHp7LJ6Hbz9PoIX5eH3155biGDz5iSUanAaxLWaqQq75hLN/cqrL1nIMnmphfYt2bjuOMD9KyKuDbowDz+2tNQywIQgxIi17Ur3oGYYkzvLSPp3FveawD3dpAD1btumzXDkIzSUpexF4xujwH8fVXv1UpZHKDLVITDG0E0Svbml+bG1H6X0iiobrJZ2SNm8m0lZwokUqXh+79fGSVKqcy3pYZidMBQiwL0vzAYKOqGFQL3qmMX0kqhbKZLN7Av3rwJN6KIw8Un2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZjr17Tub7DB7Nj+8KtKDNR+rudAU+o48ANZMCTOlpg=;
 b=o0ycAw+5md1jJh3hQbEb3DJ503nihxaDDzeuYINMU0UBb1YuPlEXulvljp47AnHSS8YOYj9OhpmhnPCj82CJ0Mul5cmncj/9gEvOWmAmUC9XOEPqpglAmUmonYExXgqth4BMOgDF49BtTu/M71rpcRvKDAqjwVcze7T13ueAGy6U5Ghky18oY1szsY6ob7s8cOiNy5RIQt4vt+OZ2KVaHQEDruvIIebyy9W9Em53etyoj1G5iXNrbN91n17F+xDZ371agiPB4UQnmYxuQIwtWTXHChFR+fZ/pdUjKT0qRSYzxhyAT2Zt09llzbldSuIbQLm8uXHpg4QF2a6PmI8NcQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZjr17Tub7DB7Nj+8KtKDNR+rudAU+o48ANZMCTOlpg=;
 b=gH1rhDAUUFnUeDCFDWSIR4QLwTCqbkaSrJU4feMVEhoW4bmRMJWBcUVchh+3UKSbeFfEBZornGdXfZmwZbk5aLi6ABs4w4Aq+le7iDt63LkcOYVW2zVi8LwedRIOWCBQXh8oRnB1WE0Cs2JVQL3/MxrES5GltTid7Ijm2ixaNPM=
Received: from AS9PR0301CA0029.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::10) by DB9PR08MB8291.eurprd08.prod.outlook.com
 (2603:10a6:10:3dd::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 28 Jan
 2026 16:27:39 +0000
Received: from AM2PEPF0001C70A.eurprd05.prod.outlook.com
 (2603:10a6:20b:468:cafe::98) by AS9PR0301CA0029.outlook.office365.com
 (2603:10a6:20b:468::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 16:27:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C70A.mail.protection.outlook.com (10.167.16.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Wed, 28 Jan 2026 16:27:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFLX08gPLHwglj7NQVeSIscaB27CUEJ50EQaKB38uicgaft+n7W8vXfS2xuHggp24aToGLHHl1JnlH4TDBjoVXqCe/BK7kboWu6AR/faBSwv1y3VyONyByEJ8C7GhMM3Nyi97KPpvQMXmVTVVpOyFdqMDvo9SoIaTzg/XLHwZp5tcgjaMqOKpW6qB3ygRBbjEhhFvGTe6JagLiHjZ6jixNz2gQBaQR0LLj29QFcV/3VWF7XPVQmNjN4NjUsyhTJUBh3dmWuDJi6Edia/39xGgI5qtWrLt+Z4zJCuWTMZ8WB6QkjPX5L5dAK57Ud7xbqhLZD0g5aD0rCjNHnSjhAspA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZjr17Tub7DB7Nj+8KtKDNR+rudAU+o48ANZMCTOlpg=;
 b=xo3OL/3MPdMY1IURlIw28KyVGIkO9R+iGbzteQ4Qqv2OJmPPcU21OILcy7xQBkE5AY2HixOv0yPVD6lkfa2yG99FKHU7F3ErcI+vkXn8tLcY8J882RJDrIyveGF9dDa5AmHm5P1E4gYODGXOyxh/oha8/jhIPPYIX7MSsve8blpsRikc9y39Kq8UHx1mga96Hyst8xF/k4alYv/BRsJUpfFwAOamwtXuoL4Z06XEqPtH0m0ph7tXdkZwpkKt9nQf9rTIR+rsKDEFIcg8y9ipvtcffcOrhnKwTUJfXrgkAoeFTJ9ewiZO2BFOkUDoDsX3IsiKLNYM2jeyZy9JXou33Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZjr17Tub7DB7Nj+8KtKDNR+rudAU+o48ANZMCTOlpg=;
 b=gH1rhDAUUFnUeDCFDWSIR4QLwTCqbkaSrJU4feMVEhoW4bmRMJWBcUVchh+3UKSbeFfEBZornGdXfZmwZbk5aLi6ABs4w4Aq+le7iDt63LkcOYVW2zVi8LwedRIOWCBQXh8oRnB1WE0Cs2JVQL3/MxrES5GltTid7Ijm2ixaNPM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by GV2PR08MB11817.eurprd08.prod.outlook.com (2603:10a6:150:302::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 16:26:35 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 16:26:34 +0000
Message-ID: <015ec400-7234-4926-a679-6d2085bb17bf@arm.com>
Date: Wed, 28 Jan 2026 16:26:31 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 9/9] drm/panthor: Add a GEM shrinker
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com, nd@arm.com
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-10-boris.brezillon@collabora.com>
 <714d2b72-67df-4590-9943-6289886c0a89@arm.com>
 <20260121155238.2a6c0274@fedora>
 <77dec915-da6d-4ff5-b949-a883288f2672@arm.com>
 <20260128165214.248ef333@fedora>
Content-Language: en-US
From: Akash Goel <akash.goel@arm.com>
In-Reply-To: <20260128165214.248ef333@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0049.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::12) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|GV2PR08MB11817:EE_|AM2PEPF0001C70A:EE_|DB9PR08MB8291:EE_
X-MS-Office365-Filtering-Correlation-Id: d1d77294-6e6d-4f9b-1a3d-08de5e8a276a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?QWFBWTg3ejd4dkpHWlg3Mjh6Z3pXVXFHbE10SnlZRmhIN2xwT2NwbGFzNnk5?=
 =?utf-8?B?TlFZR1dESlk1VFQzOTFmQjV4WWJSSmluRzYvQWxzMHJ0dy9nVVd6bWZSOWtW?=
 =?utf-8?B?bVZQdjgvRWJ0dFdaOU1NcTkxRWpBb3owMkRudU1aWndWWVpDUTZoS2hXdGVn?=
 =?utf-8?B?ZGdiKzZZcWZmRWR6L21yNzNpR05GSDlYS3ZESm9tb05WLytEQTZEaUhHb2ZY?=
 =?utf-8?B?TjZJdmFETWNKUEIyaWJveE12QmpaMXZLcEkzNXhxWkVYdlk4L3NCTkIvbERY?=
 =?utf-8?B?czhLOVBIWU00ek9idnJ1aEp3Y2Z0MmZrZnYrSG1HRVhQbDRwOVFNcXJteDAy?=
 =?utf-8?B?UkNlcS9kRzFwRHFTYk5PSDBmdDJXNFgzRUgwKy9rcDZNV21NUGFUQjRZcFp0?=
 =?utf-8?B?QUE0eU1IZ3prZFhQTTErNnNGSXVkeFE2VFg1VCtVbkY1VUNPMHhpZHd3UGhM?=
 =?utf-8?B?YjNmWmhhdFFDaHBPKzRGcEJLMFQ5ZDVBT1Q3aXIrSHcxdzhZcjI5K29kQ2l1?=
 =?utf-8?B?QWxQeEl6eHBvT1J4V2NuOXZqWExLZ1ZSc1Z2ZElFT3llZFpDc2QyNWd6T3ZI?=
 =?utf-8?B?aE4yR3ZDbnVaWXJ4NWRkM0o0R2VxdmFnblp1TGkrVEIvcERhVTN3Ynd1bUh3?=
 =?utf-8?B?V3JJSjBYa1BxWDZQM2JYeEwySWFMdE52ZXJNakZIYlZtOXVCazUwcVBoOHg4?=
 =?utf-8?B?Kzg5aTNpWTZReVlwUGdxNHpTMy9JZTdCU1lDa1dSZmtyMDJZTWhVNjlSakdM?=
 =?utf-8?B?N2NPQkdnaDJxd0pvRnFxbHZYUjJZeS9TWGo1b2p0U3krNWcvY3lKMFZDSm1x?=
 =?utf-8?B?c2VUeGM1YXNldE5ycmJlQkZDdUl2K3hiRWdlbG9EaVI0anZmN3M5SnlodWRi?=
 =?utf-8?B?KytLZEtPZUc4Z0xEbnpFTDRvTk53aXYzc2NPeXJCM1BTTk0xM0NmZXdVekpB?=
 =?utf-8?B?S0RQWEU1dzNSQkhXZWlacVZXZzRUZCtJdDJtL29hNGdDWE14ZnpKNmRkWWRm?=
 =?utf-8?B?aFNyRjdScTAwL3RuVGR2dHNYS2hxM0VwMGRvOFpONGF0Z3poWHBuaVB0VXFI?=
 =?utf-8?B?N2IvYmNSZTNvY3FYTFpHbnU5QmljNDIxYXJoY1FFUW9Oc0pqTTg4eFFzeWFO?=
 =?utf-8?B?RjFhYkpYRVd1T3RPUzBGWmRUYVZER2ExZFE0MXkxc3J1aXF0QkYrZ25aOCtI?=
 =?utf-8?B?NjZkL1NUclFoZE5peGtPUTZqbXNRelJoTkVhYzM4eFRhT3JLeXp1SDNnYWli?=
 =?utf-8?B?N3luWmNZS1loL2F6UmdMWk1ZdS9vZ2FNZ2dHUU0vbzlUQ2ZQZk9SY0NZYVF6?=
 =?utf-8?B?cGhyMnkyT0o5MmhHdkZyclpqR3NPRUNzb0h3RWsyVG1iRktRY252QnNUY2xY?=
 =?utf-8?B?RDNrTVpXNlJhc2dlRkdmTHFNcXFmUVArZ2lmUzBiT003WGJFN3FsY1pUOUxY?=
 =?utf-8?B?VEl5WGc2QzRYQmpMcnRQUWN6VTZUWmRNUU84dm5HcXpjaTI2a2NuVWhXV2la?=
 =?utf-8?B?c09yL3BJSnIzNkh4bEZYYnNQb093ZDN6R3VrMysrTjNGbUgvRFM0UURDOE5U?=
 =?utf-8?B?Y3RodmpLMjBxMmFiYWNTQVc5RkI4T1JBQm41RGI4dWVyUisxTm9TaXFMa1Rs?=
 =?utf-8?B?VXdmUnk5RDAyZW9Gdll2eGtmZW5aKzVMM0NsdlpzWHRMb1hUUTVwQlI0dXh6?=
 =?utf-8?B?WG01RUw5OUNFYVp6aUJmWTQ4MXRxT01Md1V3RjdwQlVqd3VvemViZUNKOEcz?=
 =?utf-8?B?MUFpMlVIZGNjQTcwUEhyejVEcmZLbUhybG4rQXRCWU1FRGdsVWdOWWhnOXpC?=
 =?utf-8?B?Y3FMT1RVS1pRcXY0UHF4NXlLRnhETTMrUWhxRlEwSW01UWgvR2VDMWdDQXlO?=
 =?utf-8?B?OG8xR0wxZHNDSGxYc25pYU03MHcxU1VSc3Y3TzJyVDBMM092RHBqUGwwRDZB?=
 =?utf-8?B?bXNtaG1zZU5vRllGZUpUdWVyY29WRExkSnNqUStVVUhUNlA1WkVjaitHbzhl?=
 =?utf-8?B?R2wyRVNybVNmVFYvZm0wZ3lscDVpODRobFJZSE44T2UzNk1Pa2w5ZnFJZURO?=
 =?utf-8?B?VEJBMjhYc0pnTkxkNEE3NFprNkJrQVBPUldiWWdGMDZMV3lWa1pIbkdSYW5O?=
 =?utf-8?Q?fvh0=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11817
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 24c05686-bf4f-4bd9-f439-08de5e8a003f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|35042699022|376014|82310400026|14060799003|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUZERVFzYXFneFQ5eWp4ZEhGVFZMd0pqTFNrUWtXUUp5dytrbFlGNWpTemxQ?=
 =?utf-8?B?R2pkaHA3T2ZyaHlQa3RJTEF6aDRYMjg2Yjh3cjB3dmtTV0tuUlVCOTg3U0dn?=
 =?utf-8?B?cVU5Rk01ODlSZktCc2kvb04yQ3pBcTNCeGFkNGFQZXlTUjEzRWhZRnREQkRz?=
 =?utf-8?B?d3Y0NmkxRTFVTlhRNDdvcU4zTUZQV3pxL1RiUHV4QXZ1V1llYlhqaHlvUVkw?=
 =?utf-8?B?Q0c1QmV2cE5Rb3ptazZlMHllb3MvV2ZyQ3Fwd1B0WFpLNWxyeFJtNU10dEVG?=
 =?utf-8?B?YkJZV2pBUndWQXhBMi9rdlg2OVhpejV4WEJVWkRkWEhhL0RvckkwSSt1Y1Y1?=
 =?utf-8?B?Q09GZktSZHZmZk10d3lxcXQrRU9kd3krakhKN0lxVkZ6dS9tblJSVXNHRk4v?=
 =?utf-8?B?WUJSdllBWGRpZ2kyWWRPRVJpQVlwTGxMMENKbTE2QzBjb0xlUmNyUmNXdTlw?=
 =?utf-8?B?dm42NmkzYmR3YkcrdkZ1NDhpR2NWVk9pKzRNZFQwQ3N3WVBRUkFsZDV2S0dO?=
 =?utf-8?B?elhaMXF1Qm92bmlMODFuaXZxc0xTODJETmhyeFRNREw2S1RUdGViaTk2aGNZ?=
 =?utf-8?B?T2tJR2R2Y1R5TThTSVI4ZlA0RGlkOWtmV0c2eGt4Smh6QnJFQUg0a1dsdzRs?=
 =?utf-8?B?ZFJoaWxXYlk0TSsyRk9LOEplU1lDaUxsbTF6UUV0Wi9saC8rdThPQjc3bVli?=
 =?utf-8?B?RVlTeU51TTNwNWJLbXp0Z3RxSnQrcndQTmVVTWpqL2tYQmFsUXN5UEhXNG14?=
 =?utf-8?B?eGo3Z2RaZExhcHFqbGNoVGhycnFENDVHMUtIa0tNZHVpZjh5alBsTGV3dXlp?=
 =?utf-8?B?TmVGSjBwUmVuaXlMVnBEd0cxU3djZXRjNld1YjRjaHNKSHhSY0Q1OEx6S1dr?=
 =?utf-8?B?OUpOMzNmUjI2OEpwVjg1Wmo0MGhITk9NZ3E5UUMrSnlDbm9aK0Z0QlNoQlpu?=
 =?utf-8?B?VUlhUkJNcjhWMVdTVGl6dEVvRzJZbUdFMmZpT3pwQWFFRmhRNjVuZnZObjky?=
 =?utf-8?B?azRNSVIyU1FWbS9oTXA4K0NXNnBTRDgrL3l6c0hydStycW1qMHlFUlkzWVh6?=
 =?utf-8?B?MGVQNW9qbE5CaEdzM3RoME02STA1cENqSUd3bmkvYjdsQ2p5a255RVpFNDlK?=
 =?utf-8?B?WjV4STgwaGVKK2U1MFJ1ay92ckFpM2RJelM5QTdqTEZFV3NOUnAydzZqeHdt?=
 =?utf-8?B?ckdrUGVxVUZ5WjZtTHUrMXlCRHJIVzZVRE9jWXpOWFBDMHp4dnFNVFBxV0FC?=
 =?utf-8?B?cjdKendtM0NiSVFweGxyanV6WVpYOWNydzN6Nm9MdHc3YmJiVFhHb3R4VnVN?=
 =?utf-8?B?TjFST3d2dmJGdlllZDlRbTNqNHpjTU9sZXVPY0RJaDJHSXBybkJ0aG5pNm9m?=
 =?utf-8?B?alI3US9XZGJ5U3d4djI1QXY0MjZobkNVU2t3MzBLT2VsV2lyS0M2NVV2cFVD?=
 =?utf-8?B?Mmx6M0Y0ZVN2THdsSEY3Q0VhMjB3Y3hiOEV1anRGMWpTbjQrcTVkdzZBMGdz?=
 =?utf-8?B?c3JUaUpmM0FxeVQvS1RwVG9MbTV0UVQzZnJrem5xc29pUmo3TER6N0NobXFS?=
 =?utf-8?B?VXYwTkRUL3h0SUF2K0tWR3AzRnl5bmtLdEFpOHdMRkhTZTh2SXZBeEYyU2c2?=
 =?utf-8?B?R3U3KzVUZ2RMK0sxSjdCRlAxY3BLbE1Kbk1ZWEJBR0xtdkxKQUh5OC85TVpN?=
 =?utf-8?B?M0lBYUpzY21FR0VmcmU4LzZMMHUwaTlRaDBQZmdmTHJ3cis3cHFyQ1dtYktp?=
 =?utf-8?B?RWRHOUE1UkppZkNVZEtTSitUS2YyMTdvWjNmazgxY2x4d21vZlN3cWQ3V1V0?=
 =?utf-8?B?Tnc3RVdRc1dGdGZORW5hSzc5ek91VmFzckxhbm9NRXFhRmovQlVmUjF2djRI?=
 =?utf-8?B?cklCcTQvTUc3bDY1OGVCa2xvRVhOYjhTMEd4QmNqeEpkS3IybFMvSFh3U2JV?=
 =?utf-8?B?eXQ2OTR4Vjk1Q1NUQUF0Y0NZdElhckUwZ04vZ0xFL1R6VUpYSWNqWGh3TlRO?=
 =?utf-8?B?NVg0S1JkMWMyOWd1SzkyR1NEYm51RmlEWnEwQXUzL1FEbU9UY2JEdUErSWRu?=
 =?utf-8?B?d0FpR29RMHZIc0p4VmFJVFdzUVV0Rk00bkVGTWhSaWZKSmVHaHVKTlZFR2Jm?=
 =?utf-8?B?bHFpalk1SVRNMHdvWnBtV0pRdXc3TmNzTDRRcWFTcmFVOG1zdkxTazZtaGMx?=
 =?utf-8?B?elFad0NITnhXcmN4YVVrdmMzSFBraXdpUlExRUI1NE9LN2w0T0hlTE1iWU4y?=
 =?utf-8?B?OW9tbXlFaWt4Q1huczRra0cveThBPT0=?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(35042699022)(376014)(82310400026)(14060799003)(7416014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 16:27:39.2058 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d77294-6e6d-4f9b-1a3d-08de5e8a276a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8291
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:kernel@collabora.com,m:nd@arm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[akash.goel@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,lists.freedesktop.org,gmail.com,ffwll.ch,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,intel.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[akash.goel@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11A1CA5A78
X-Rspamd-Action: no action

Hi Boris,

On 1/28/26 15:52, Boris Brezillon wrote:
> Hi Akash,
> 
> On Wed, 28 Jan 2026 11:21:43 +0000
> Akash Goel <akash.goel@arm.com> wrote:
> 
>> Sorry I have a doubt.
>>
>> Should we update the panthor_gem_sync() function to ensure pages can't
>> get reclaimed whlilst they are being synced ?.
>>
>> panthor_ioctl_bo_sync() takes a reference on the BO before calling
>> panthor_gem_sync(). But I think due to this patch, the backking pages
>> can get released in the middle of sync loop.
>>
>> 	sgt = panthor_gem_get_dev_sgt(bo);
>> 	if (IS_ERR(sgt))
>> 		return PTR_ERR(sgt);
>> 	for_each_sgtable_dma_sg(sgt, sgl, count) {
>> 		dma_addr_t paddr = sg_dma_address(sgl);
>> 		size_t len = sg_dma_len(sgl);
>>
>> 		dma_sync_single_for_device();
>> 		dma_sync_single_for_cpu();
>> 	}
>>
>>
>> Please can you confirm.
> 
> I think you're right. We either need to pin/unpin around a sync
> operation, or we need to take the resv lock to make sure the GEM is not
> reclaimed while we do that. It probably makes sense to do the latter,

Fully agree with you. The latter option is better.


> since we don't want to prematurely pull back the data from the swap
> just to synchronize CPU accesses (the
> dma_unmap_sgtable() in panthor_gem_dev_map_cleanup_locked() should have
> synchronized things for us on a swapout).
> 

Right, the sync would happen inside dma_unmap_sgtable() on swapout.

I think we may hit the following warning, inside 
panthor_gem_dev_map_get_sgt_locked(), if BO_SYNC ioctl is invoked for an 
evicted BO.

	if (drm_WARN_ON_ONCE(bo->base.dev, !bo->backing.pages))
		return ERR_PTR(-EINVAL);

So we would need to take resv lock inside panthor_gem_sync() and also 
return early if bo->backing.pages is NULL.


> I'll fix that before posting a v2.
> 

Thank you.

Best regards
Akash


> Thanks,
> 
> Boris
