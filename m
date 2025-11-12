Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733B0C5022C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 01:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9A010E66B;
	Wed, 12 Nov 2025 00:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="h3AZDxGe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013046.outbound.protection.outlook.com
 [40.107.201.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8439C10E043;
 Wed, 12 Nov 2025 00:42:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HakcGihsdZ4cDBuQ+nTm+rH4ExmXc/N/ghJ2nxVXK3TglxFhpSemV5VElEksb1HQ/mdpnZ1rcZDtVmp64vLJJNnwV9o/5NG3MCfPex39Bql4Dp9XCF9BTTb3cbr2yXSKDiwbKC4xCyNecvL19wkDpNo6bB4FmH2OREIUe+uycuc3QpQpq9revYmsisDIfk6+WGLuUz31ucAQB66gH7nDzEKF6mCucAJTcA7gzTlAqH2+ya08bXdte5sGC3QV6Tuj5H89XuXVPSARp6ie//Ysdqv/3zYwrqxxkSgrV/nav9FjAor7RQaZBF0kfhVaaNBtlUpgHPzCzvZJidatvyxWnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9K4z/YxK/0bF/+Hh9j1ZlGkKbIHdcreFQMKV71nNvaI=;
 b=g+D6ChzebF2g89pVfyGYU0RZAOdMAjOZ38bQwCSCljB1U3afNwS14/mXGqR3J4c/UoiUI/L+stvovkY1Ju6fCMIg6BzuqA9J59uLo2d2TWAHDESpFcIBbCurR0lMvPfxX06Es76XNh17PlQ8w0330/yg6HLJJdoIyV2BxyNTZsKO2DLdroSsipXz25trEHuVL9HpZZ7wXKvY7tU21HtR5869vmPQCyR5zzz8Gx2ztEHTAqvktImGsCZCez/hSVkyzFGl+e7WbSw/v2Z6Zrhwvo5e3AqHmNjz/3/WK04GciELh6E+agfdZf4SeWrEqjeA23N032WEJ4bvm/3BDo4nDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9K4z/YxK/0bF/+Hh9j1ZlGkKbIHdcreFQMKV71nNvaI=;
 b=h3AZDxGexfECyGCBowGfAOVnP3cHMxjrno96Zwfabsbmyrd272c+nh63GzHpIQoqMXdsW3P46EVVSKLChvJOW3dAw/+cgP21fZiuYA0Kd8LdfPqbD5J2kautTjhIBM7X3cNZOCPTlL9MDp/BbmFFd3lXjxYKvx6W6aBGK9ssmBmJ32gwa5sm10aA/yUc7mHZ/SXrU58EKdxPCxlCxRSlZi5m/KhlP3CjxB5epdviK+MYVInIcN4Xn7V6czMNHrqnCvDr3eFRMEHq0WE++BRSj/rDpnRz2P0l/A3fx8Pu3oj8jmuwqjOHxxZfQXHBnaxiTkQJ9cmxKsvyvFm436WQ7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB6069.namprd12.prod.outlook.com (2603:10b6:8:9f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 00:42:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Wed, 12 Nov 2025
 00:42:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Nov 2025 09:42:07 +0900
Message-Id: <DE6ARX705WO3.1MLSW7OWUCX7S@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 07/12] nova-core: Implement the GSP sequencer
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-8-joelagnelf@nvidia.com>
 <DE5256UCJHXU.27RS8A445Z1XN@nvidia.com>
 <0181a17f-5773-4cf0-9473-7d4ee9122105@nvidia.com>
In-Reply-To: <0181a17f-5773-4cf0-9473-7d4ee9122105@nvidia.com>
X-ClientProxiedBy: TYWP286CA0019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: 999d3f66-5b9a-45c5-b703-08de21845112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmMwY3AycXFON2FVaFRCYlZNYjlSZnBDL0ZqMWQvUFg1ZWV2QkxKM1poNjg1?=
 =?utf-8?B?UGkxODc1Ylg3eDBnMDk5NlY0ZExMRTcwbUY2RDVDMmlCMVBlU0JsMldaNWhq?=
 =?utf-8?B?VVh4enFiM2ZOdDltelJSY3AwSVJsRXJnekpBNlVnbHBPRTdaSjNWaFFOZ3dk?=
 =?utf-8?B?Vmo5Ykt2RkRkSGduYUlhV0dUZDllVUdmWnhzL3JZMFhHeFFxN2FndHUxMTBv?=
 =?utf-8?B?WVkvYzdCQlhkUXdEblVVVHVXWUhpWlpxdDRibkwvSGQ1Y0FwNWRBcDdGemUy?=
 =?utf-8?B?L1FReisvUkw1RUx2TDRMcVgyZVZaTElHeGpOZVY5UW1SVmlsazY0NFRlcDVX?=
 =?utf-8?B?U3JsWHpBaWxmcTdyRjBMM25wWEYxaVN2c0tRRnhCUDkxUy8weXBzbGZJKzRL?=
 =?utf-8?B?cFh6ckRiMlMvaG9FQmM0Zm1sVTljejBZaVQvVDdhQks4Z2JURnU4L2FzYkQx?=
 =?utf-8?B?RVNPT1lCcVZJT2dINVVhYzVnaUNXV1MyNzVGNnQwRDZJOUVwUzRBQjhEWGFJ?=
 =?utf-8?B?dENlaUpHNURDYWhhTENCZmZWWm44eS9ON1l3NWlqMGFHS21JTS9HUjc4TXR3?=
 =?utf-8?B?dHVKRW04K3ZUbmlmbmV5UGxQbExGeFg1Vk9WMHFpcEl1NUJTM0J6Q2Ewc2o4?=
 =?utf-8?B?SzBEbVhvMGhDWnBUZ0JaeHordkdMR2dpbW0zRk1vNVNQWStLYmxVOG94VXZv?=
 =?utf-8?B?NFFhTHUrc2MzWS9BM0t6YytTbk5raXNaZTU2UW1tV3drU0lvVElydklwN0lB?=
 =?utf-8?B?NmtaM1RvMGxLek9WanZrUjF2MmZKYjN0eUpQQVdIdllWWEN4QTdneXl1eDJw?=
 =?utf-8?B?Ym9wR3V3RHd0bFF3Q2ltM0gzck44a0xNbDRZS29TbE9YMDdHU3JFaVYyNHBC?=
 =?utf-8?B?QkRKemd3bWdRZ1VycU9rRkFJa0UwT0UyOFQrdEtLTzB1MWNkbjR2YTR0b3Ey?=
 =?utf-8?B?QVNlWFhsK0MrVzRGenF4b2tpWHhoRDVDY2VlNkI0WEVvMjR6Y09tRTVaM0Vu?=
 =?utf-8?B?dHo5cHc0V2czNjM0anJWUjVCeWVvYVIyaGY1blFkb3VEMEtaN3I4YThaS2E0?=
 =?utf-8?B?U3Z0MmMydUFVSkcrekdjaGVqNG1kVXBpUWd2N0pVYy81cmFjdEtBNUoySVA3?=
 =?utf-8?B?cXJxSS9TaWM1MUpZbGRBeUxHbEptTEVENmUyMytBR2pwTzNaRGg5STJSYmRr?=
 =?utf-8?B?UEdhQS9obzJBOHVLQU1ySVhnaGd4Ynl4RWNGdkVuSE1ZOVpuM3VldzlmbXNo?=
 =?utf-8?B?a2YvcHVpTlhuQlBOMXppZGJxWUJETGhPbDMwdXdJbmR2TytWOGFhMWdnamdG?=
 =?utf-8?B?K21UMTRKdU5uOHF0ZCtscDhkNk8rRjBiYmZlUTZGNzA2bWdHOHNCeDhtaHpP?=
 =?utf-8?B?ejRKelFzZ2ZiQzkwYVZqbXdETm9HR25ZUW51NnFlQVh5SzVrZG9mTzQ4L21D?=
 =?utf-8?B?R1Z4U056MjdUNVRPVEVuY1JwWDFjeTdCVVBqdVJ4QXZURGlYZkg2ZlBjY0Jl?=
 =?utf-8?B?MnJnek5RSy9pQ0NYNjFoWEtlRXE4a3VmV2JTSUJ6bGI1b0cxYyt4U1hIeTVR?=
 =?utf-8?B?NWpFYms0elNhcTFuc01Cc2gwOHJaMm16NnJ6NUtCWEVyWXJIdCtQWGVvcUNF?=
 =?utf-8?B?SWRLUmFLSnJmZ3h1MjJqK2l3d3pOUlV3ZWlGS2VwZ3IzTnkwUGRDampnY1BE?=
 =?utf-8?B?Z1NYMjhVcVZtdzNiYmdKalc3NXg3TkF0aHVXbnR2ZytNNXhLeWhmN2xuZE16?=
 =?utf-8?B?NmlQc2N0bHdYbGNWL080dXYreGZSMXVTWUZWd0IwT1ZGTzFuZWkrZVhIVVdR?=
 =?utf-8?B?L3J3YTU0RFpNbDdUVDEyVk5WTVhiVWljSStvZUI2b1NqdnlsOGc5YnQvTTRx?=
 =?utf-8?B?c09xdzJyM3NETDZicnZaR3pWcGw4SEpNSTRvVDYxRGlZRFk4OExtck1LYVNT?=
 =?utf-8?Q?MzUuwYNh2vScoItTPcS5AG39gOXVRx9O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFlqUTZ4dTU5NnNScndJbUV4WHpWZGN3Wmp2T2tHeUpMMHRKODFYWW5nMzBs?=
 =?utf-8?B?OHpEZWJ4VHhVSFgrUEpIemlpQkdwWENwbFdWNWZEZDRhWGtXSFl0NkpSOXlI?=
 =?utf-8?B?VFAzak9YWldXS3NqK1I3d1M1UzN3K01lWTh1R3kvbmhEYSt1MTZ6NDJKRDg3?=
 =?utf-8?B?OG5IWm9rQ2lEZVJyTE5MeDlrSHZHU3V1UWxsRFphZ2Yxck5RblhhaUFMV1Bn?=
 =?utf-8?B?RmNVeW9uSFNjVVNiaEY4VjdRazZhQ2k0N2tqQUgxUVlTK203WWRtajREYndN?=
 =?utf-8?B?bWRORUdvcXk1b3JLTDlESWJrUE8rOTFlTE9yNklwWTAwVUVzUTB3bkUzd0NF?=
 =?utf-8?B?Rjl3TytVVEE1MHBXN1F5R3plY3UrNDBGS2RtWnRiM2ZVZWh5THZIbmZQb2tV?=
 =?utf-8?B?Y0lQMWlxN1ZIVE9yZXRSUTRUQVh1MGFOSnFpWnNsc2dXNnJSKzFyVzFKYllS?=
 =?utf-8?B?QXNXQkV0SW9WVk80VmtBQUczME5mNjVqSVNZWktPdnhOUWlCSjNzZ2RTRXBU?=
 =?utf-8?B?RVh2VFAxRmhib0g1UTNEN0M0VkJDdWJIWFhjcXo0ekI0NmYwaGVzdUNWalg5?=
 =?utf-8?B?cTNsaHJZL0Q0aW9pZVFPK2tuSWZnTE95dzJzRmtjamU2c0V4dmhUVkFYL2JC?=
 =?utf-8?B?MHpsS3B1NndYSmQ1V3ZBWGFFY0ZXZEpNTFowRC9uM1BtaTdFSERZY3RBK1A5?=
 =?utf-8?B?YUFzRlVwdGxFUTBUK2VWVXcrbnlJd3BqQ3dmREh1aTdnU2cvakpzeGRMc3pW?=
 =?utf-8?B?RllqUElxZWxFVnpIYldXS3o2OGIvdExHbmxNNklXWGlRTkdiN0t0eDZ0UWdh?=
 =?utf-8?B?MEdTaWxDSHZGRERaWXlhKzlGa01Tb005N1h6YnhxaUR1eFd1Wlg5TVZFZHlO?=
 =?utf-8?B?VTJVQkRidnh4ZjVaUlRaanE5b2lqOWgrOVI4a2NkdlN4cHQ5OU9wU2JkTDZ1?=
 =?utf-8?B?MitlOWk1V2RyM3gxaE9YWXdpaHNHdkpDbWhHWkZ2YXpMYWZib0IyUzludG1z?=
 =?utf-8?B?V1F3ZVlQbUtuckNTUzM1cnRvYkEvWjFNbnZDcG1iOGRhcS9QTnd2MlZHU3Z0?=
 =?utf-8?B?K3JvZ2ZRbnNhWXRKRk9IU25ha21DSVg0MGs3ekNoemhwanJIQm16Zmh0T0Q3?=
 =?utf-8?B?K0RoN0t1Nk1MR0oydzY4ZnJTTkd3UDFQL0RoeWc0NWJZYXpLeHdyTklySmxG?=
 =?utf-8?B?KyttclVPaVkwL1pvdy8zNUV4alRoSmU1UDRsb05QeW9NTjJ5R0dyVThPbU5l?=
 =?utf-8?B?aGNPa1NETXQ4RUEzSVBtTG8zYVkwQ2hDT2pGb21hZGJacmRwOHJDN1hDcW5N?=
 =?utf-8?B?RGZYN3NxY05aaVBraXlmclZNcXZHdkMya2FkMml5YTJrenljYVFVNld3Wk00?=
 =?utf-8?B?NVphRkdQa3o0cUdFa3ZsTFJ1OGdpN1pXVUw5Zld1enVpb0xiWlZmamxUMUtr?=
 =?utf-8?B?R010WnZjZFZNcldxYjcyRWZEOWhqWFRwRDJaUnpYZjZkOStKempNS0g5bG5r?=
 =?utf-8?B?MkNjV2lYbDlpRVRXOGR1c0VVWWxzdzdlOFhFRGpkSGlyRjRSVmxNVFFOQmFY?=
 =?utf-8?B?UG00R1dMWEk4QTNCUEZkaEMram1Ocmk0MXZ2VnNFMnYvcnhJZDJsalZsVU0x?=
 =?utf-8?B?a2NIb3lIS0VaYk44SkZKOS9zOXlLQkR3WnF3N3JaNGxIbENpVS9UOUtwZFNP?=
 =?utf-8?B?UDRFMDM0T1MrY1owbktWTVhkSG5GbG9KeDJjQjhoeThhQjdqVkZOVTltTW5X?=
 =?utf-8?B?RlV4Y2hrRVhqUjdHQTFsN2k5TUJkNzlDdUVVWFRTYTJYd3pjeEJiQ0VVTjU1?=
 =?utf-8?B?SGtXN0FPUkdUMm56cERFcmd6djlVNEp2U3lSeU5DMGlFQ0xTamkzbTdBY3F3?=
 =?utf-8?B?Y0xGQkJQWGYwS2N6ZVJCV1ZZUHBUVGYzck5lUTM3K2hlejdEd2p2L3RwRlZx?=
 =?utf-8?B?MjYwUUhzK3J1ckl5Y1BvaDV4WVlDSjN1TEtGVHJFcnF0ck14UjRnVVo3aGN4?=
 =?utf-8?B?cllvSXdHRDRPT21HS2RqcHVGVytxaE1zeUtaUkxET2RwclNpRDYzaXRXbXNG?=
 =?utf-8?B?L3pISzBFOW9USHJ0TXZiQ3RXRmtKdXRWYmZZREJIVVRkZG9TS3JUSEpmM0p4?=
 =?utf-8?B?UDBXUWo0UENKOXdCZHpDenJVNHF1SWlGSnJWbTJpQzVKbjdvckVkemRsMGVH?=
 =?utf-8?Q?ce2j4/wm2M86RPHufNNqcnV3HywB8/y/zLrZk89ZHh4o?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 999d3f66-5b9a-45c5-b703-08de21845112
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 00:42:11.9628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTZqln+5NWDsc7tDGns5mxqABlpb8p3Bud+PFoFbAJcTPs+HSoJjto2rgj3wubUagj9tBw6XonAm1a+49R/6OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6069
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

On Wed Nov 12, 2025 at 8:02 AM JST, Joel Fernandes wrote:
> On 11/10/2025 8:43 AM, Alexandre Courbot wrote:
> [..]
>>=20
>>> +            |cmd| {
>>> +                self.current_offset +=3D cmd.size_bytes();
>>> +                self.cmds_processed +=3D 1;
>>> +                Some(Ok(cmd))
>>> +            },
>>> +        )
>>> +    }
>>> +}
>>> +
>>> +impl<'a, 'b> IntoIterator for &'b GspSequencer<'a> {
>>> +    type Item =3D Result<GspSeqCmd>;
>>> +    type IntoIter =3D GspSeqIter<'b>;
>>> +
>>> +    fn into_iter(self) -> Self::IntoIter {
>>> +        let cmd_data =3D &self.seq_info.cmd_data[..];
>>> +
>>> +        GspSeqIter {
>>> +            cmd_data,
>>> +            current_offset: 0,
>>> +            total_cmds: self.seq_info.info.cmdIndex,
>>> +            cmds_processed: 0,
>>> +            dev: self.dev,
>>> +        }
>>> +    }
>>> +}
>>=20
>> You can do without this implementation by just having an `iter` method
>> returning the iterator where appropriate (in the current version this
>> would be `GspSequencer`, but I suggest moving that to the
>> `GspSequencerInfo/GspSequence`).
>>=20
>
> If I do that, it becomes ugly on the caller side.
>
> Caller side becomes:
> for cmd_result in sequencer.seq_info.iter(&sequencer.dev) {
>  ..
> }
>
> instead of the current:
> for cmd_result in sequencer {
>  ..
> }

That's if you need `dev` for iteration. Since it is only used for
logging error messages, I'd suggest doing without it and returning a
distinct error code (or a dedicated error type that implements Display
or Debug and converts to the kernel's Error) that the caller can then
print, removing the need to pass `dev`.

>
> Does it work for you if I remove IntoIterator and just have GspSequencer:=
:iter()
> return the iterator?
>
> Then the caller becomes:
>
> for cmd_result in sequencer.iter() {
>  ..
> }
>
> Although I think IntoIterator makes a lot of sense here too, and there ar=
e other
> usages of it in rust kernel code. But the sequencer.iter() would work for=
 me.

I guess it's a matter of personal taste, but I tend to prefer `iter`
methods because they are more visible than an implementation on a
reference type, and also because they allow us to have different kinds of
iterators for the same type (not that this is useful here :)).
