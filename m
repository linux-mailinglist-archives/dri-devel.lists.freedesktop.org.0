Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EACD1B8FC22
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 11:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BA410E18E;
	Mon, 22 Sep 2025 09:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UVj18FQl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012015.outbound.protection.outlook.com
 [40.107.200.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A4210E18D;
 Mon, 22 Sep 2025 09:31:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZU90DcjeYHNPtOXOIPAqWPqTrRg0kxP/DP+F5+ZfDqiQShF5o4zyrwpKnYjQIA+UkINqL4QRjQFNJbHk/nsXxbTP4cY1twDAO7VY51n0a+ATVNgXNiGEo7S8Emkt9UEjlpwnBANpehhzJuDAxFsluh+r9j5Ltta7Y4VFD8VwCDTOAsceGq+0c5cXt2ZpObZXmY9pVvunHj0y0PTKFVX9T2ZhECjezqtRANYDUZCE9oqjDuGSrp0I7J/mI3Zv6z9N8ZEt8IwF7eJnegvt+crOEDVrTV07mCRtq3w5x17+Fb8JFxhw95m9Vgkej/ebdPiFsF1BZYQr+qT7rUgge+U0/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXceOb/P8J3/8NgUqUOVDsLZyHdz54U0uol/6P22zCI=;
 b=b6yCOecaox5X1fCyreBbIMULs+9OOy79PlhNx0lFUahchsB0HLD6Ct0gKk658GHzKFZDkfarb0OkI2RpSrmMu6/8AmXBsfZCQvbwYEfva0aKSkECFQNS18CS/nnC6er8eQuxXAzfOGhb/ZDe4YpeVRobX80dwdibCRxaxJ64E1hgkHD/1Ujtb2+dRlYj3hZsM2pKlHL8T7Ux1YidVVCbvwLns8WeGjfQWxQY++CbSDxxDXWH+b/PaxYwRy9eSW8dD/HyERr7kGDFLWWib0iFuFVWZ1g5pzv+d9L4yrhqZ1KLKEnOPaHrzy9QwGsRQhAGX2OyeJWX/U8wgXwtmp77Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXceOb/P8J3/8NgUqUOVDsLZyHdz54U0uol/6P22zCI=;
 b=UVj18FQlowEhXi1ucldtS4wJY2pOZR2bA5ItjrfIokkCSMgnGodJZHaNy06LedeKYIbzr73mKNjg9J/9eh+tknZAclcVrG5fOUYxjQM+tNc7WmhFXv1pjkjB+/fL71LwwhJQXcppn6isaaXQGJraFgvcAJYfKTeyxd0nGt0AO3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB8715.namprd12.prod.outlook.com (2603:10b6:208:487::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 09:31:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 09:31:37 +0000
Message-ID: <febddc1a-afed-4c32-912a-38f465d11ce0@amd.com>
Date: Mon, 22 Sep 2025 11:31:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] drm/ttm: Allow drivers to specify maximum beneficial
 TTM pool size
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
References: <20250919131127.90932-1-tvrtko.ursulin@igalia.com>
 <20250919131127.90932-2-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250919131127.90932-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL6PEPF00016415.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:d) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB8715:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cabd29b-e842-40ea-d013-08ddf9bad3c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2lXc0dMRDR4S2RLOVB0aVZ2SXQ3U0dsNDVQdWdCYmdEdFRMZzV0UVZJRGdT?=
 =?utf-8?B?TGs3UFNORFdNREtaS01ZanNjekNud1ViQlcxY3VPTHhMRjllT0FCUkNuUHhi?=
 =?utf-8?B?V2ZMWUp6d2NxREFhMGhZU3lTZDVJS3czbFNVRGdTSmFwenNrSzNFTHRLWFBz?=
 =?utf-8?B?djQ4bkh0cW9LMENSY3Z3Z0lhM2dDR2puM3lDekllY2VLUE9GNG9jT0RRREZ2?=
 =?utf-8?B?Q3FRZS9LanRQWG9xQ3RDS09reFd5SW9KZXhNeGJ0SHNEN1EyUktpMGM2WHk5?=
 =?utf-8?B?a0M2YnNkNEdQVWZlOUhIQ0ljTTdkMkkyRTRSQUQwbXlDZW5yOTNJYzdWbWJ5?=
 =?utf-8?B?RmNLNUpIUUxmUlBoV3VwNnMyNkFsSDhVTnRva3RVMWhhMHFYRVlFV1YzcWdE?=
 =?utf-8?B?eWFaVHJpUW9pNzZuSzl0VnQ1WGpWZjZhYmNSV0kxK0o2NkVTVEoxZFdWblB0?=
 =?utf-8?B?c0pzVjJyNkl0V2lFUEZRTmQyOUJuMHVsbWhJRm5ldDF6Z3dFRjV0WVBleXZ6?=
 =?utf-8?B?SjVqVFNMU3o0V3FMOTE4dUQ3TDdXVGhRckNUTmw4TTRoaTRTTnE4SWNOdmg1?=
 =?utf-8?B?ZjNqaFV4SHh0K3hXUUtCOWVoaU5xMnVjcGwyS01nWGhUaXNZTlc0ZGFvLzFp?=
 =?utf-8?B?VElubkF1Yk5wMnluekc5ZjQyZnVUSUV3blBGNnExRmora09vdk5xMGw1UzNj?=
 =?utf-8?B?UXBrK0RKOWhVWFJKcjZGekRDWUF2K1cyaGxZNWI3VGxydzJYbFVERU93a0lX?=
 =?utf-8?B?eUg4TUZ5UkVaQzlQd0lGYjhBeGFsNWVsU1R3U0dhdWh4a0twdmJFWlNWeHph?=
 =?utf-8?B?RHVIUnhiSHJMTUpURlhZUE9KNVdXRU1zQUxVWFpaMUl5RGhLZlVnaUJNS3R1?=
 =?utf-8?B?bExWa2NnNHNCV1NMSE83TXdqNzNxaEZZS2FFMnEzRnF4c0tvcS9sdU40b0VE?=
 =?utf-8?B?ZS9wTTcreXEvL3RORVJGbjh0QXVXM1VNTUtSVW9NNy96OHNZYlpnSVNoWHlm?=
 =?utf-8?B?dTJFbDBuc3dVME5wSnRUTHIya05tMS9oVUMycTc0eHUydGxaOUF6SmF2TVhw?=
 =?utf-8?B?d3NhZThQejFIT2NZWWlnRTEzSzEyQm5GVWlGZ2M0bko4V3g1VGhuTVJlMDhD?=
 =?utf-8?B?ekRxckxHQ2dKeGE2UExSTmQ1WnJMUjhiajh1RnUydE1zN1Q4QjRRcXNvVmtX?=
 =?utf-8?B?UGVUVmR4czEyK2p0NHZGaDVVZHdmQ2NhSThnQ0tPVlZnSkNiWllJcjY0d25X?=
 =?utf-8?B?dkpidTFBQk12TEZYbCtaY21NNVZFa3k1UHhnNjdJL1c2UjMvUVkzRlRjL1BO?=
 =?utf-8?B?czJSdURzVjV6ZlorNkYrQ1VMMldHWUVjbFVtaEFTekxVSHM2OWV6RktsQVhD?=
 =?utf-8?B?bElKUjNmSisvbmFJaXJzZjRsMElzTGdoT2g1N3hDbHovME5kR0licGxCT2N6?=
 =?utf-8?B?T0UxQld1ZzhNU1BtVmxZSkN1OWVEWWpMOFQ2c2xvaVR6eVRpMU9PTGtxTmkx?=
 =?utf-8?B?eEJYU0tvSzNrKzdPeStGR3UwUDVsUGJ5SFdJbHBDOG9Bdmk0UTllOE0wSWY2?=
 =?utf-8?B?UU9PUlJ4VGFOeXdscS9Mb0hWTThTNERtVCs4MjJBUFlXM3N0NTk4THlEbU5J?=
 =?utf-8?B?NmtiTGdGQ2VDZHA3MmtJcGovZ1d0MFdlaWdWMFFqR0hZSkdCUkxvMlBQREtN?=
 =?utf-8?B?UjhKeTZVVlJSdWt3TzVZaW9vUCtnM2hRNFpyam5zcVBrK3hkMFE2eCthT25z?=
 =?utf-8?B?dEJ3bU0wZFJhdmk0MU5wMXdYN0didzNUM1p6NHJNcXltNm9DN0JQZDdGNEt1?=
 =?utf-8?B?T3VnQ1g5Z3JNUndQZzlUamZCQkM5UndEZUFBVnovRDBKZ0ExOUNhVzhMejl3?=
 =?utf-8?B?MWxqWjQwWmdBdmtYVXU1MFV2SkxJakxia2VoY3JDZlVza0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlVOdEc1b2UrVHFRdkE4Y0lKQTRSOTg5M0ZqYmF6NjBzZzhsWXo2WGE1c29t?=
 =?utf-8?B?U2FZa0hGZmlPdEd4MlRnbFNZMGFGWmd0cE0zbitldmFpK1BoamMvZ25DYW0v?=
 =?utf-8?B?ejJYQmNuRVp0d0t5VmNIaVl1TmNpWGFLbTYxVzZmUkx4WCtOWWVlMEFtem5x?=
 =?utf-8?B?cWlmTDBydnVkdytnQ3U3Z0pvc2JQbFczaHAxNk5hU2dDNTdEcGMrRFIvaGIv?=
 =?utf-8?B?ZWkwaDFlZUNFSXkvODNsVjBwMFJsenhLbkF0M0xtcFF0YVhWWlU0cG9HcG1E?=
 =?utf-8?B?V1FVMUcvYVhkSHVucEd6dXhrWkRBbnZWQmx2VjgrK0xiZHR5ekRoNmFrQTdE?=
 =?utf-8?B?VUxGMy9yM1pjUU5LYncraW9Wa0N4LzZPN0JDZHYzNlNtWkg0K2RMUTMxdUdq?=
 =?utf-8?B?cFd0c0RrV1h6WjNoWVBXTkVoQWUwWnhNK2kvNHhYQUd4cVpwVXFRQ056YzBU?=
 =?utf-8?B?ZlBaMTZFVXJLbTF5cGZRL213TUVmS3pJZTdIWnVtanVGTlZmRnZkWVJrcncz?=
 =?utf-8?B?RkpUTDJTVStTWERwakhCVXhrdU91RjhvTzNWczdFM0l2RFdndXExUVF2aFpn?=
 =?utf-8?B?L0dRS0FjU21PRlA5ZUJKVFRTcy83ME9uaXlVUis0U2tTbHVXNFpLaXlvWDNS?=
 =?utf-8?B?bWVHYUFYcjd0NDF5UXF5TFRZN1crM3lERTNhSzhGYXlTV1N1cjJvMFlWUVd4?=
 =?utf-8?B?TkMyOHhpYjdMT3cxUzY0K3g3bUp2MmJDa1FzcmdMaHhSRkpxUVhvZ1V3elBl?=
 =?utf-8?B?MzFpYWV1QUszNFRHTGxKOE1FSEswODRRakR2NHd6NFowQW5rODRiV0FuRWFI?=
 =?utf-8?B?TjNTaks4V09qaWttbUVobWVxRVdjSkdYc1dORnJ4Zzk2amh2Q3FMdXRKVElL?=
 =?utf-8?B?a1FKV295Qk40Z1orQ0h1ejJveU5NckdkQ0Zmbk9HRWcremlPdGxMRXkxM3JK?=
 =?utf-8?B?SjJvVFk2dVBLcVA0RUZOTmhDT0xDaFlPc1V6b0FKNVBsL2R6Y0lYVjVMUG9h?=
 =?utf-8?B?ckgrN0RSaklhZGZBTHBRVThhVWJNcFZqUkJteit3bmkxZ3Y5WGtWc24xbDN4?=
 =?utf-8?B?VDZhTWw3ZkdHcUE4SDIxUkRKM1lQOVZZQUdOQjlMT3VITEFuN0hMMm15Z3M4?=
 =?utf-8?B?Z2ZkU1BOYjJIS2dYKzZXdG0wWjlzOXJHV2M5V1R2V09vY1hhdzRqck9LQVJI?=
 =?utf-8?B?akgwRnc0S0NQSEIrOFc4eVpVQWVaWk43aTdMQ21qcHhxMkk5ZzJycVR4K1dC?=
 =?utf-8?B?Yk52dGd4bTV0QS9aUExLRTRoR2FUY2FOSkNGaldJZ1lVbVVVeEc4dGpFRDVr?=
 =?utf-8?B?VGFLeEd0RUMyOGJ0ZzdJT29Na2xwYVVZREZ0SXBZSHBPdUp4eVFnNTFjWTRy?=
 =?utf-8?B?YllHaG9TamROQ053VVhmVU1pMVJMUUlhQkx1cTRxak44dC9ydERsdXNQL3h0?=
 =?utf-8?B?RlRIYUFSOUxzWlNBZjlvMlU1cTRvVUxySHBPbzQ3VnhTdENKS3ZnNk1JSFJU?=
 =?utf-8?B?NnJrTjdpVGpOT1RCL0M5NWZoUW14ZldtN1U2bkNYTkN6azFBRGhLeWl6dEl1?=
 =?utf-8?B?ZTBFVGQ1eUdYZ0xrMFZTeXJzWTlRa3lFTVBmSDZXNngxY3VEc0cwbEQxdkRu?=
 =?utf-8?B?akx2alRjdWpRRmxQMFBTWC9qZ3hhczl1c1VRZSthUVdWWDU5enhqQ2NvczJH?=
 =?utf-8?B?WXBQYXI3ejZPakIydWFUNG84Q2h0WXdzcDVwVVErOGlhb0wzQzdWWjFlcndv?=
 =?utf-8?B?WEdDOHBtMDRNOXRZZFRTL2xjSm15MjRtbnQ0QW1LTG5CLzkvUS9tN0ZoUlNw?=
 =?utf-8?B?Wm56NUdpRFFIWmYzSndHQ003UG9qdUJWNkJ1Z1JRaVJrUTRydjhsbE0zdW5L?=
 =?utf-8?B?Qk91b1hGWS90SWx0UVFseFNLclNMc2NTUEladzllR1V5Z09jSU1MUGlmV2dM?=
 =?utf-8?B?VVBJRjdiTHhuQjd4K0c1NjdWTGUxNkFLUTY1L2ordWtsdUFYV3JBQ2xLSnVq?=
 =?utf-8?B?NjJHbEVjRTFQd3lTNXpPUmFsdmc0cGlYOTZOQUV4SFlxb25sdm52NDF6RGl5?=
 =?utf-8?B?alAxVHNiN0VCUGVpcHU0TGFkMEdSc1Vad3pkU3U2SFBOTWU4N0NqZ0c4ellY?=
 =?utf-8?Q?5AfE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cabd29b-e842-40ea-d013-08ddf9bad3c8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 09:31:37.0408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+iH67FH5R9AEhgebWcP04mEkY76B6trR5ZewEX9lJEXlqg+Gr1SnvOBVtgvfL64
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8715
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



On 19.09.25 15:11, Tvrtko Ursulin wrote:
> GPUs typically benefit from contiguous memory via reduced TLB pressure and
> improved caching performance, where the maximum size of contiguous block
> which adds a performance benefit is related to hardware design.
> 
> TTM pool allocator by default tries (hard) to allocate up to the system
> MAX_PAGE_ORDER blocks. This varies by the CPU platform and can also be
> configured via Kconfig.
> 
> If that limit was set to be higher than the GPU can make an extra use of,
> lets allow the individual drivers to let TTM know over which allocation
> order can the pool allocator afford to make a little bit less effort with.
> 
> We implement this by disabling direct reclaim for those allocations, which
> reduces the allocation latency and lowers the demands on the page
> allocator, in cases where expending this effort is not critical for the
> GPU in question.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 15 +++++++++++++--
>  include/drm/ttm/ttm_pool.h     | 10 ++++++++++
>  2 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index c5eb2e28ca9d..3bf7b6bd96a3 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -726,8 +726,16 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  
>  	page_caching = tt->caching;
>  	allow_pools = true;
> -	for (order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
> -	     alloc->remaining_pages;
> +
> +	order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
> +	/*
> +	 * Do not add latency to the allocation path for allocations orders
> +	 * device tolds us do not bring additional performance gains.
> +	 */
> +	if (order > pool->max_beneficial_order)
> +		gfp_flags &= ~__GFP_DIRECT_RECLAIM;
> +
> +	for (; alloc->remaining_pages;

Move that into ttm_pool_alloc_page(), the other code to adjust the gfp_flags based on the order is there as well.

>  	     order = ttm_pool_alloc_find_order(order, alloc)) {
>  		struct ttm_pool_type *pt;
>  
> @@ -745,6 +753,8 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  		if (!p) {
>  			page_caching = ttm_cached;
>  			allow_pools = false;
> +			if (order <= pool->max_beneficial_order)
> +				gfp_flags |= __GFP_DIRECT_RECLAIM;

That makes this superfluous as well.

>  			p = ttm_pool_alloc_page(pool, gfp_flags, order);
>  		}
>  		/* If that fails, lower the order if possible and retry. */
> @@ -1076,6 +1086,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>  	pool->nid = nid;
>  	pool->use_dma_alloc = use_dma_alloc;
>  	pool->use_dma32 = use_dma32;
> +	pool->max_beneficial_order = MAX_PAGE_ORDER;
>  
>  	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>  		for (j = 0; j < NR_PAGE_ORDERS; ++j) {
> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> index 54cd34a6e4c0..24d3285c9aad 100644
> --- a/include/drm/ttm/ttm_pool.h
> +++ b/include/drm/ttm/ttm_pool.h
> @@ -66,6 +66,7 @@ struct ttm_pool_type {
>   * @nid: which numa node to use
>   * @use_dma_alloc: if coherent DMA allocations should be used
>   * @use_dma32: if GFP_DMA32 should be used
> + * @max_beneficial_order: allocations above this order do not bring performance gains
>   * @caching: pools for each caching/order
>   */
>  struct ttm_pool {
> @@ -74,6 +75,7 @@ struct ttm_pool {
>  
>  	bool use_dma_alloc;
>  	bool use_dma32;
> +	unsigned int max_beneficial_order;
>  
>  	struct {
>  		struct ttm_pool_type orders[NR_PAGE_ORDERS];
> @@ -88,6 +90,14 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>  		   int nid, bool use_dma_alloc, bool use_dma32);
>  void ttm_pool_fini(struct ttm_pool *pool);
>  
> +static inline unsigned int
> +ttm_pool_set_max_beneficial_order(struct ttm_pool *pool, unsigned int order)
> +{
> +	pool->max_beneficial_order = min(MAX_PAGE_ORDER, order);
> +
> +	return pool->max_beneficial_order;
> +}
> +

Just make that a parameter to ttm_pool_init(), it should be static for all devices I know about anyway.

Apart from that looks good to me,
Christian.

>  int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
>  
>  void ttm_pool_drop_backed_up(struct ttm_tt *tt);

