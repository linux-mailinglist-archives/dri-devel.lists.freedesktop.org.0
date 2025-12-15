Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FC8CBC448
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 03:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423D110E00D;
	Mon, 15 Dec 2025 02:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xy3pPCBS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011055.outbound.protection.outlook.com [52.101.62.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFC610E00D;
 Mon, 15 Dec 2025 02:46:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hU/jJUgcLAaD38UjvvOttW1GfWem9Ii57eKWFNyR0kEGHeIGw+17UpK1m1bJQyzKIsIXxcenPu/2vDo2xS41Q1SfXPLQjJqI+2Mgeh6A8PO3IWPg6by9BN4UcltzXhuslP7KP3bK+NMaKbi8meOGaXCtamyjHRhSkdk3FC2azebWEF13xPvRbw1y3Gzo0j2HAO6AnZniOQYcl4DEp9Ac/mOKksZz7gtKFkVPDm9kd5RaoZId+iyD45XNR8N7ijAtX02Xgde6KPAhGlCqScTi/MAao70k4iTT/NtvBCUfh4e7qeljWjbpBJUuBH7DkdOWO/2es4cPSMzrBMDhyr9zzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+824Ga1eKOaqH7ocX1q+MMWFuqtxNy+V53wm6+ZZYI=;
 b=Nj4KIXmJAVrfJmNNuYE/xmKx0WEwi1gm0amKkrMueZF4Om79MJsdnuuW3JYo4OQhZ0/zcRPmwJI/AUmiNefqw1q/hYCp6H6CHN3JUFSSi+HI94KhM6yq0RELtIqkkywd4ZFPJnoPATqCW0OY8OYvZzvSN50nCNi/3jFFLC6glQvK0rkDiEJ+rntkjhmwzQOuOLenlH8eNEz/8FVKSehihXZVPgR1Lsb+W+ELScqTSw5ryO93XinCATtzaF7uNvyIknx1NY3czRu/BqchCi1zBGNTs+h/42Bh5sarr8aRULepU5Dk4HRpqXyIVakkXNK6CrGnJcXb8SDUkhKyfzu5ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+824Ga1eKOaqH7ocX1q+MMWFuqtxNy+V53wm6+ZZYI=;
 b=Xy3pPCBSlLPjrSpSDX1m/S5DPF6tP36dmFghlWxfOoMns6mlfAWQypjAMKPLbMq/n04gmLHwGEzU0kRV9p+qectuaVVRR5RI98jqyaeedHzXgkeijom/c27RpjlNMuQc7TFWoZ+gvI4zhLmdvIRxE71LD//YYjYVERL1PYxJkloGOppm8rrRdZsT9gcFxNBACRXJjB1ItG3WkHKC9MlDjBeTV7RmHo2MrST4AVa1E7cqObXjDOcP4J80Fo75pfOuDFVXNTLylXk0oILVHSN3bZWpalkJ5kegc/PlyxKaubLzUoNEZV7dBocVPTGYqKXAXLgjA6HU25pMKQurh150aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB9061.namprd12.prod.outlook.com (2603:10b6:208:3ab::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.11; Mon, 15 Dec 2025 02:46:16 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 02:46:16 +0000
Message-ID: <37cc2302-6a3d-4046-b28c-605221a67329@nvidia.com>
Date: Mon, 15 Dec 2025 11:46:10 +0900
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] gpu: nova-core: gsp: Fix length of received messages
To: Joel Fernandes <joelagnelf@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>
Cc: Dirk Behme <dirk.behme@gmail.com>, Alexandre Courbot
 <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
 <20251122-nova-fixes-v1-2-a91eafeed7b5@nvidia.com>
 <504C636B-FB96-4B54-B9CD-C506026CCDB1@nvidia.com>
 <25aa90a7-e9f4-471e-9d93-c61b9a7a429c@gmail.com>
 <lgncc2k5klyqxzlz52dzia5v5ly3nfnjbv5if6esniulruahnz@b5fc5bfyltny>
 <B5724DA0-6031-4576-9B3D-DB67569711A2@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <B5724DA0-6031-4576-9B3D-DB67569711A2@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0109.namprd03.prod.outlook.com
 (2603:10b6:a03:333::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: 28b4db8e-a5a6-47e1-9311-08de3b841e41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZG1GT2szY2N1ZVpYM0NFeXkxdDBoV3ZKdFd0b2JUcGo4TTBVZGFiTWlOTm5M?=
 =?utf-8?B?U0JOVFBqV2NwSWhQUmVBeFE2OEpsQkVlWnBhQTBkRTBSSjJ6bXNzR05VUHhm?=
 =?utf-8?B?UHZnTjdnNTlPOWRmSlgzYjJGa3F4N0hzR2dhZ1UvclBaQ0xHR1pDUC9mSHlP?=
 =?utf-8?B?RVF6VFF2c2Z5M1Q1aENDQmFvZ1oyMGdGR0lMUG15UWkyT283cmo3UWxGczlI?=
 =?utf-8?B?aFQrRGo5MXZqZW15UXRFelJNRmQwekNWVHh5RmpzWHhibE85c0RkLytsSkVZ?=
 =?utf-8?B?SlJJTSsyMXpaUktNTUp2OGx6OXQvbFhPaS9rUUVGTXJqd0pNRWFTZEZmNmhH?=
 =?utf-8?B?Z2ZPRE1CbzJHdFBiajNoK0t4djJzRXRCRENHRkM5WS9jK1prMXVreDh3aTFZ?=
 =?utf-8?B?aDlLdDY4UE56UjdXbFh2WUR3VkdCdFBGQVhETG1XSUZJS1Z0Vnh5OWpRamJy?=
 =?utf-8?B?WnU4bWFHMlZpRXNhRkdnWk56U21XY21hUkFlbFM0S0ZzSXJ4cFUwbDhNbTVy?=
 =?utf-8?B?cHYwR0JubXdhSlMzY1JoYklmVFlocTNZNFlXSkQwUnFhQWtCUzB6WVZpSmZB?=
 =?utf-8?B?cFM0TTJkK0IxY0FBaE9DZWJjdG9vNzFlRDJSS0ZCOEQxZkQrdXRhZ3hxb1Zo?=
 =?utf-8?B?b1BKS3NsZ2h4WXZSRVhUU05peTd5SGlQcCszUmI5WnN2NmUxT3ZpbHRCQ280?=
 =?utf-8?B?VExiTGNMQWtkVFBhYStKZlpzSFFTTTFLTFpoWU5zK1ZtU1gzaG9VNGtXUzht?=
 =?utf-8?B?d3ZuM0cxYzhaNkFVYmdtMjdmQWRhNHRuYmVmS3ZBVzBteDhUQlpualNNNlpi?=
 =?utf-8?B?TlcwM2tDeVF3dERHWXNadlZDc091b05RUTcyMEV2LzRBblprZGVGcnB4R3Ur?=
 =?utf-8?B?R3UrdzlZTlhQaW9pOWZWOW9xbVRHbGJGUEZCRW4vM2ovSGlheXVjdjhUM05E?=
 =?utf-8?B?ekpmN1loZU1vL25HY05VN21iU0pONmZFdlFGNXB3OUdGMmxpWHUyWVVEaldQ?=
 =?utf-8?B?YUxjaUZLT3luaTRaZmczeThuOENLTFdFemlxbWhKZk9qL1MvZFc0dVpzbElX?=
 =?utf-8?B?ay9rRWZhNUlobElvaWJ2cDV5QUdKOWJvQVphZ2RVaDdhWldXUWVoNDBjSGNl?=
 =?utf-8?B?Mi9EWUJZd3U2V1YxTWsrWHBsbHNURGJvSkxLY05zcjZPWmVrdWZuZVl3U3RT?=
 =?utf-8?B?UXdrc3RhTlRVVnBMUitPQkhRTzJnWGl2c1ZBOWVPdzN2SEw3YWFGUUtOUVZB?=
 =?utf-8?B?R0VZaTQzMGtUQjFnYWR4bnhtNFM0WnNESHFJeUxuUE11bDlNbS9pT25qWDM1?=
 =?utf-8?B?V0dEM0lqRUlhRzR6U2QyeHN4QzRzL1NsY2ZROFdZOU5nSy9UUkFGOEdhWVp5?=
 =?utf-8?B?Qm9jZDdjNzl4aTNhWGZpMXpPQXhWZk5QVkV5RmQ0SGRDc2Q2MSt4ZVFiUG9J?=
 =?utf-8?B?ZVYwZEJrMldBRXlWaWwxNDFtTXRsS2NDc2hvbFc3d09ScFRpdmhZOEF1amgz?=
 =?utf-8?B?V0YyMTNoWnQ1R1ExR1o5MFBLcmRxSTVxalZXbXAzZ2crM1JJUEt4QlZWNFJT?=
 =?utf-8?B?YjB4RkllVHIxQzlKVVlCMEk5Q2tFSEhHenExbzhnZitQdXJOdnpnRE8zZWw0?=
 =?utf-8?B?cnFBKyt3NDcrdjZySThhWDhNT09kK0QzZTg2TzcwblNlT2lBUjJYU0lDSEpI?=
 =?utf-8?B?eDNaNzQ3VWNROU95VW5oQ3BIS0hPYlhDcmxTQjR1b3U1QnlreUcrTjVzSzlO?=
 =?utf-8?B?NjB2NWJYam1NR2hQR3ZoNE1qaVRySjVLOG9VVnFaU09ZYkEzZlhyYUpQQk4r?=
 =?utf-8?B?a0VFNTBkMVE5UVFNazdOS2gyOHl2NFcxYTUwYWRFdlBhUWlMYXQ4MUxMVlBN?=
 =?utf-8?B?V0grd1lZVlBqQ1BjNkU4L2lvajJZbUZKcldXMTVZMGh1WURRRnM4VkZSTGZv?=
 =?utf-8?Q?pgUkCYfoSeV5QCTwlVlFyJv9yHLGO9Qf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFFUMjhaNlozOHZHYmxUWVY5cC9tam1OZEs3RVRJVXU4SEFLQjBLRi9GRnJz?=
 =?utf-8?B?ajI0YlhibWkyeUxWaVZUSnc3dmhnRnhIK3d3bWpJQkk1Zzgxa3NjZmJVeFFY?=
 =?utf-8?B?R21vOEJNMzZpSkZianh5bFNaVktGeTZhZ29sZlhkd3F0dHkzZHk2cVdEU0Rz?=
 =?utf-8?B?dGU2Zk5XUkZ0ejNBcDBoTHdkYm15aEUwOHJiZUp6dmhaMXQzY0wrZjB6UEph?=
 =?utf-8?B?WmljQUIwbThBZlRGNDdTWlRFeld0SHFCbWN1UXhmSkhHRjZXSzdnOUF2YXAr?=
 =?utf-8?B?OEwvRXhiZ0ZnZmRIODRoenY3ODkrOUxKWllLSVBGVC9aZFBmZjJ6aExrVHBD?=
 =?utf-8?B?UFU1OFBtM3RyY2RRL1ZCbHZHNlROd0YweUU3VFVreERtV2pqK01jc0lpNk50?=
 =?utf-8?B?ZmVaYlpDUXRCVUNPelEwWnNsY25hUmMybmhhSDJ1RDVGSmk1ZUZMUkU3cmZS?=
 =?utf-8?B?VEdvS2V0ZEZyQzZrNUI4c2RnWHBOTmtVSTc1TG9Xd0p2YlVONFo0aE4yZFhq?=
 =?utf-8?B?aUhkaWlwTVlnSVBtVFpFRXVGRmVScDVGbzNvY21yY1pTMGRRa1NFSVJ2NXF3?=
 =?utf-8?B?ZlJwREc2ZE9ZbnlsWjRoQkQzV0tQS0IxOXhoNXpjdVRWZUFCS1U3eUZMaFQ4?=
 =?utf-8?B?UE5zU1BpeWdKS2NoNGMxcm5YYUZDKzMwY1hvbkFmVU5SWmdmRWZqemVCYUZa?=
 =?utf-8?B?ZUxVdU9xTTBubTZYaGJtNE52NHh0OUl1WnRhdXgzMEQ4dy9uNmk2elp3UXg5?=
 =?utf-8?B?N25hWDhsYUYxU3M4L0dCak5EY1BIVHRiUEZqZHZnQmhoMmRpTFVpekFmalpM?=
 =?utf-8?B?UkF1RGtDTXZDVjBGalFSTHUvK3Y2SFlpelkyazJEbHNOUi8wZGFkRDA2dUQ0?=
 =?utf-8?B?MEhoampBTHBQOHBqbUtHZ2k4QTRvTnRvVVY0QkZCSFMwWkRkUGU0WHVZVm4z?=
 =?utf-8?B?RGFpTWxBMk9tNk51M0dLZWpCaURCTXU5WWxHbFRaTzlXTGpjdzRPYmo3clRl?=
 =?utf-8?B?ZXR1aldCRFNTWko5MFdvcXJPNFZxeGxLdDB4YnNPemZ4VkRKVzNrbHJlTU1B?=
 =?utf-8?B?RklCSEI2ZmlMMWVHNXg2RVB4eEZDRStGMzU1N3UyWXlrYkxRSEhtUlQzZGow?=
 =?utf-8?B?MUwxS0xQeWt2d0lieTBvQWN5UDFBeVFVS2wyMnRsMzBnYThoTjVpREhyVUNN?=
 =?utf-8?B?Z3dVYXhYa3pGZERaUU1CYnN5K2dqcjlUaHFtc0FKK2FWRENVY3c4ZEFFOGpk?=
 =?utf-8?B?ckxxc2YrbXRLb3UvbTU5dldycEwyb3E1TXlHNTNESVlTOENUWVRiVVIwTzVs?=
 =?utf-8?B?UDJ0aVpYVDNobExLb09NeXV0RjBIRjVoaEtHTlplTGtRd0tldVcxanpmVmxh?=
 =?utf-8?B?dStPYjRTMVZpZ2lXb0FZd21ZR1hJUVZ0NThqZHVyRFhQSlA0bWY0RUV4Q28x?=
 =?utf-8?B?YWpoK21xOFBaeW5xM2NrYVFYeXhjY2x4ZEZOVVUyOHVFQnVLTGVkWTNuRThj?=
 =?utf-8?B?QXpBUnNWM25ETVpGMUwvTHdQYnV4UlphUjV3Y2piYnZWYjdja1NKS2N6M0RK?=
 =?utf-8?B?aFJOQVhJdkl5RFFKVDV0MjFIMDl0bm1hTTFTMHlKMEFLemZpYytDUXVlWlBa?=
 =?utf-8?B?R3loWTE0QjdXQ2dDNDFieWdzdm9ZZklrc2svYkh1ZVNGNHVsZVpuNjMrbFhE?=
 =?utf-8?B?dkVUSytwOEd6aUcyNzV3enVHYjdwUGFqYjF0NzkwY1FuWmNkc1N1M2RMVzBU?=
 =?utf-8?B?RmpKNHh1NDU1SDZwWDM4OWRMSXZtTnF4TFNHMmhybnpQSzRzcGZMZjd1S2Rr?=
 =?utf-8?B?NGJMcWdCZXdiNzYvdGRuVExQenYwNHVkRWs0bTJjRmdieGFIUGI1N0hzbEVT?=
 =?utf-8?B?eU5KNlZOdGJqbGFCQWtOUGczbXgrN1Faek9MeE9WWEdrSW9NNGNiQUVNYmNa?=
 =?utf-8?B?THY2dGcvMVVidHF4TW1rSDZ4WFhzRmJtcjRTN0RMWDhaUTFyendLMThTR1FO?=
 =?utf-8?B?YU9PRitZK2Y3QWRUOVdPY1NFMTRodmc2SUhWd0xiTGJJcDVEcXl6eFNjeTBB?=
 =?utf-8?B?VzhJanRZaTF6NENEbEZ2K2lKcVlWVFdRWDNaM3lqSGRjZm1sZEpXTk5hckFH?=
 =?utf-8?Q?yWke1vg9ryMx78ESxqE37dPAM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b4db8e-a5a6-47e1-9311-08de3b841e41
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 02:46:16.3968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXMEvswF3A+3zGN/Y3gKW0YH4BsbiKMm+RWzst1qEHGpQX4/24L6aKhtZCPct47Yb/oDImvHPl//FtpHkCRQrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9061
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

On 12/15/25 10:22 AM, Joel Fernandes wrote:
>> On Dec 15, 2025, at 8:43 AM, Alistair Popple <apopple@nvidia.com> wrote:...
>> So the above calculation expands to:
>>
>> msg_length = size_of::<Self>() - size_of::<bindings::rpc_message_header_v>()
>>             + num::u32_as_usize(self.inner.rpc.length) - size_of::<GspMsgElement>();
>>
>> Where self.inner.rpc.length is guaranteed to be >= size_of::<rpc_message_header_v>() by the construction of the type.
> 
> But this length field is coming from the firmware, correct? The guarantee is provided by firmware, not by Rust code calculating the length.
> 
> Maybe Rust validating that the length matches, or is greater than or equal to, the message header would be one way to avoid doing the checked subtraction. I would still be comfortable doing the checked subtraction in case the firmware payload in the message buffer is corrupted and the length field is corrupted.
> 
> I think Rust cannot trust fields coming from the firmware and needs to check them to prevent undefined behavior.

Right. The firmware is a separate code base, running on a separate
processor, and it is not part of the Rust driver. So it cannot
participate in any of the various Rust guarantees.

We should treat data that comes from the firmware as not yet
validated, external data.

  Or maybe the policy is to include safety comments, like we do when 
expecting C code to behave in a certain way. I
do not know. But we should identify the policy for this and stick to it 
for future such issues.es

Yes. I've written above what I believe we should use for a policy.


thanks,
-- 
John Hubbard

