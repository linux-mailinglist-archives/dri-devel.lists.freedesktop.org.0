Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8558780E8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 14:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886FC112A93;
	Mon, 11 Mar 2024 13:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PbNiqkQ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FB6112A92;
 Mon, 11 Mar 2024 13:51:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0RLjg0qCU9Qr7Q/A56dvYqS0Q1a+IPulQe29bYb906gO3r6DcpaHmuCTQmywmuU0EtzFkv+J7L0fPl2rQU2vd2WRERTb2iXJZ7yBjPnPmZa3yf3sCoPszgpvu5GcboaYPeHkVoB2UDD9Fpz42eSOE/PZi2vFertkWwSdnFMDBHSggNFHRsWhzS+/mITs+9OIdGyR0ipFDSpa4p/ED4nISBrCa8I9rEzaUahZuxfIEzZnGGsoOEwr9+edT5nWRvivnV9WxSHFio8olXfgcH+d12pJy7nK8Z/TjFZig4P5q9DoteD7S/ckoKawIUC0PXZdQfPI/hT9cvGiLKl4WAQBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0PS9pOWg8V/TrGYz8JK8KZmRqpDKyaDIxjYxqVwZrE=;
 b=j8UuKopJSjO/hnpfYZtjK49BV4fa2kkUSWq9XLsltGY5Gp7Qc3FlYR+OH41ca7Qp+FRmfr76lJ9cx9CXGkpgiHp4BOWJ6XOtBz0RtzK+0c/3WhdX3GI3/E84EEKS3EsPxnqSe3Yr/sfBc7Etqv5sOZRwnVbSFR0c2EvACICDMh8inkWYi82/LVtqf5yy+oaXMQ06xcM94sZYMuu3NLxSptfv4AnD0RaRAug6bZ9RS+nRCJZj1iOjva9XweNfA8zlQHaXn32gT+Iq87nDEMyJGZv63a/h3xW/z+Dbq5EnKBqDFqDKGzhQb498LIafhb7TrNKbFy0ATOh7WtIBFOfM/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0PS9pOWg8V/TrGYz8JK8KZmRqpDKyaDIxjYxqVwZrE=;
 b=PbNiqkQ5Itdgbfm8ld3BOl95c2ihuAV5l3YK0h7HsbKbrVU7KMd9d+O3sKGI64LI+6Plzo8tI2uxOCm0iJTaMxeY02pUl5my/K4R6xlEsMP8+QVfcxZVKhCVtnSu0aToRw+muuZLWZd0rnjNRqM7pUu0kQ/c78joyyy5w4qdAKw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM3PR12MB9392.namprd12.prod.outlook.com (2603:10b6:0:44::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.36; Mon, 11 Mar 2024 13:51:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7362.031; Mon, 11 Mar 2024
 13:51:45 +0000
Message-ID: <00ebc200-747b-4b61-a81f-0db13593ebdf@amd.com>
Date: Mon, 11 Mar 2024 14:51:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau: reset the bo resource bus info after an eviction
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
References: <20240311072037.287905-1-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240311072037.287905-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM3PR12MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: e4a8597f-df3f-4598-ee5e-08dc41d263ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xjHq4Yxc0YSL/yaIk7t7/iv0GKej65Ki350JyMV09MU3rJMwi7+7wE45zcw6NEB4fuAgtFEnahVFMH9FQ5NWSZen3xpH/C/WPbvOOYcLPr/Ex8BDcIEM0gI3u3E/UlIenLr7tUP5y40hFwoA0W2tA12j6mL+3u4drAfJ+9kM3bWtMMmo9Qsedlnx6Y5ewJuVdcAkMOOz9gHiNnC7qDuWuS5gKzYAPRB5R4Qj8t2KFsXqSuu4LbFrJyA1ijBePUcbGHI7dj646CgP/rdiZgl8YOJEjC7j7RNwmKYqHizgwuW+IykfRGZphLM/WKcBbrFLPauIN1p8Tr7+j3R0EQ6LPaXiumZ5VU8Gr5uFx2l/UXoztsjvWfhwAUOCCE7yz3WVBzGg0+9cGQ0YLVkXmHwXWjr3HrxzNbPkio7zFZItqYLeWYFbvdjqlj2QHji5OPUbAmUN1Oz4VKGQIkdeB5SW+OI9Cl9AB6gSKjF+VJOgCHRcgkmyRGhPpXKr9m2hMzHerRvovmVZxMENhgwwyzWgxAXy6JARZoT0sOO7Q5RT2xaJvwvmDRB0RaczEEg0yP8Rpger1az4rsO9RxPWemEVibJ/UdwevrNzgy9ljsI3EAIgiegA6qZ7HrzpHznAgPUTAbq+PuYPivzRIDRg5UfoGFGTWY6ZfsP4YyRMBDXKIJ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHlQV3I3MzRRbm9IZFBlVTRNR3ZmcGY2L3RpaktvUkR5Wk5hQ1pJN293SWIx?=
 =?utf-8?B?R1lWeUJ3ekMydUdrd2c2SVFOU29ZZlp1ek5aUFl1RGdUUUxwdW1OOGpWS0J6?=
 =?utf-8?B?LzB2TnRGSFNraW9sUmtyWHUvRzRIYVhLYmt0M3kvRkV0c2xlNjZZNWVLam9N?=
 =?utf-8?B?WGxCVVBpQ0lVYVJHdjJFblROOENzcjhTTmNqS2t6UXdmOHpqcFpta1V3LzVN?=
 =?utf-8?B?NC9Nb2pvZ3FwL0djK0Q1MWJuR0ZGTzBDaXBSYzNud014UkhlK3ZIYU5GVjR1?=
 =?utf-8?B?WnlBVUJUYVBzVWRnUmIxUGIzbEZyT0gzLzRoNmYyRVR6alpFV1dZajNxb3A3?=
 =?utf-8?B?bDF2b3o0bUR3c21FWFRFR0tCcGtqMVlLTmNnbFBNamcvS2hhc0EyUUcxNi84?=
 =?utf-8?B?UEtnS1pPK01oeUZUY0FTUnYwWGRKR0NxdVNGQlo1UDg2NmtBRU16cGw3RGY3?=
 =?utf-8?B?SDMybFlIV2ZoakM1QTV0WXNEc0RDQnhrUlY3WDJVMHZIUlZhTm1TaDE5Wi9l?=
 =?utf-8?B?Nmw0WlZUd1cwdkhBWDBOUHROUUx5Z2Z0Ny9nL1dENnBtaWc2T2hmNU9CajRy?=
 =?utf-8?B?MzdPUW9qb2lkYW5XSzMwdFlDVm5CRFpmM1JxdGJKMmhjOVBxS2xNaG5vZVQz?=
 =?utf-8?B?Wm02RllJdlZ5RUJTZkhobE5PZGJ1K2N0UDVXL0F6aUhaZnZpbVA5L0txU0dU?=
 =?utf-8?B?b04zUkw3bituV2M3enVDbk4vNW9UYmV0Ymtsci9SaTBDb0t4aFV6eHpmTUM2?=
 =?utf-8?B?OVRiL2t4Q1VGNlRvUkZlVW1LaElJeXNSWGJRN0UrNS9OdmRWR3lLcWJmQlpE?=
 =?utf-8?B?MnFuVEVQek1HOXpRWG16MW1KSjdBZXRHQWhzeXlEYmQ0eFRJMmYwUlhEZkpt?=
 =?utf-8?B?ZlRkWmpGN0ZEZGplUjNBaXpXYVMvU0pYcWtaS082LytvSEZQVWZUTjZZWElY?=
 =?utf-8?B?RDFqU0ljMm9wRWhaWmRXSXBzUTJiclNvRUpDVmRneEpZNzRRRVphOGw0aVdP?=
 =?utf-8?B?NWtUTlk4d0h6S2YweFJVMnduVHM4cFYzWmdiRVZXYkllczZEVVBRSnZFbFBl?=
 =?utf-8?B?NC95dWRmcWkvRjA4eDNmbjBNZ2dBdHRYdkJ1KzVhbHovOEVmOFdDVmUvKy9D?=
 =?utf-8?B?NUhlSXJ2dGU4V2JYUnZ2ZEt1WGxRUGZ5d2xKZTJDQWloblNybVNCOXNHZWNo?=
 =?utf-8?B?cjlBRm96S0xJZUMvUDF0OUdrekxQY0RiMDBtNzlYcUVPd2dIZmxDUVIyUytJ?=
 =?utf-8?B?QXBVb3FsRWcraUdIU29VbXZrRzMyeVZsUCsySE5XbGpETXNEVjhPNG0yZmc3?=
 =?utf-8?B?azUyUXZBUjVGbVdMUTM1U1F3SWlSZVpBTHZ6S3RSaHdBVThydnVqK1RvdEFx?=
 =?utf-8?B?VmhrK2crMTNiWVVMR3c1V0JQNHd0RVQ0dG1YUFI0Z1NubzRCUnNSMG5MU3Bq?=
 =?utf-8?B?QldDUHV6WW5JNzE0VzNNQ3g2bmwyQWFxdE5tL2dWYlo2WER6bUlVVFl2bVdK?=
 =?utf-8?B?cVowdXVZdHBCcFBtSEsvcUNoUFNxYytld1FDd2x5bkgvUXRrb29pSGdyemtw?=
 =?utf-8?B?L29nczlQc2hzRTFLQXIvMGlUS0hJVEh4ckhhSUZhR1FZNE5BcGRIdW9lcmZH?=
 =?utf-8?B?WFRuZEJLb0MvdzZ0ZndHdW13WWJWUkFCZGtVSENUcm9nUTUxbGZIVzNoZFBt?=
 =?utf-8?B?V3dHZExJTTNKaXdxOWVNUC92NHlOcDJpNEE3aGRwS0Y1bTdFU1BoZHVyL1ZD?=
 =?utf-8?B?b05jVU83dy9pYzFDMFFtbGsyY0wzSEd3Y2pmZFBQa0RMQVlUNnR3dWVjWnlC?=
 =?utf-8?B?R3NlQmJDZ3pac1lheWNpM2UxVFBYRlliZFZ3c1ZCMUZCaUdGQWY4NGFVZTV4?=
 =?utf-8?B?L1cxd2pFZDdpdDhvMjNmTjljaHlkc0J5WXJKZ1FUMXRycjliSVlkRExHWGo0?=
 =?utf-8?B?Z0VSRWcyYXFGeXBOelhwVEVhVnNHTVJMbVROczJ1aGNEZmNJWVRoZWEvNVhX?=
 =?utf-8?B?SWxWeHBvdm56akt5SHFtMHBXMFdqSW5QYnovcm5pYmJqNzYydmxTd2tpMGtV?=
 =?utf-8?B?THZVcGUzQWRVc0h6b2lVZ2FZVGJwRUNKMUMrOHNUWEZOMEY3anowVU1wRnp3?=
 =?utf-8?Q?/VBXWiUpuxniN4rCfAog2/pDd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a8597f-df3f-4598-ee5e-08dc41d263ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 13:51:45.5467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DduZcSSmU61/dtKHATZUDm1pO+8Xu1O1Q1qj7hKb/Z3by4bl1WFMOX1BiGhjNAHc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9392
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

Am 11.03.24 um 08:20 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> Later attempts to refault the bo won't happen and the whole
> GPU does to lunch. I think Christian's refactoring of this
> code out to the driver broke this not very well tested path.

Yeah that is certainly possible.

>
> Fixes: 141b15e59175 ("drm/nouveau: move io_reserve_lru handling into the driver v5")
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/nouveau/nouveau_bo.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index c6c544d7c911..a4e8f625fce6 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1271,6 +1271,8 @@ nouveau_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *reg)
>   			drm_vma_node_unmap(&nvbo->bo.base.vma_node,
>   					   bdev->dev_mapping);
>   			nouveau_ttm_io_mem_free_locked(drm, nvbo->bo.resource);
> +			nvbo->bo.resource->bus.offset = 0;
> +			nvbo->bo.resource->bus.addr = NULL;
>   			goto retry;
>   		}
>   

