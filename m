Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627A785DF80
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 15:28:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDC410E769;
	Wed, 21 Feb 2024 14:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WwHci1QO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF0F10E75E;
 Wed, 21 Feb 2024 14:28:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWpeb9QjdQCbuPndQOphUULDtO9q24nt/MDoHfg9QHJfXnN3SiDsdXi6SQkmzbjNlbG5yjN4sfPAf0HMd5nBxOCOl0IwKEbhqoBt4JLdKv0kDNBDXOsO7S+B/Q6h6yusC6Wp96zzi0RNDL0tq1n7FUZnuX3QIbQe/0CzoW3qCFki4M8jk4x3x+r5Rcw2Ab2b20pdKahTZugfnKFvqYIxyYN8hQhjTnNbbM+HUXGMkw5x58073IoDaymXrbc3qNGDzyM9WewCEtRbCDNhehZS6RytYohdN8WPDyKcITZkkxJzlFFh1YKawkwb3S78NLwvtCrU3YyvqLCf0RMibDDzew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSFnfXgBnTdurKi+gH8jgC346jsyw+EZyDSne4B8tI4=;
 b=cd8mpukQBY9Gxt6Yc9HHiJt/3fdKrNNfmPjQmoelh8N4VTZ1Hr9DFca0V7RiLfBF/AwYANkHgUq2bB0J3OK6H5CTOHnS1r4SpNFoJYHBTBYyD7lQAW9w/psOrcYkgbUdReYMmB6DIWjKQ1jjS+bwF5hogsMBvKC0IkRP6NhAfjjyMCvhO8WwzTE+hT+XcujohS37NLzY0b3tC6LNecW83TsXi86KbuZu5AsjQk1rF1leq4fwe6KZN1+44Wtn15am4eBrea6A9oXZpe8KIpgnZ4Ilhnj5nhhQl/nb+uwywHcKnVaISDp2tYSp8ijV7vkDVVMk77CKL120/FXlsWqa6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSFnfXgBnTdurKi+gH8jgC346jsyw+EZyDSne4B8tI4=;
 b=WwHci1QO9hbcJoLD/Xhk62oT4XzViFPQx3ULc6Y5UG3T3prhDyjmc4TlpUpH9QhmFapNLMk+0vaB8At9oF1qWffm4ZNB8qHZf+7RB9xeBjh05omlYwNPUiSZSnPL9zBfpo/dAveDKL9yNmALmwaSu5Pg5VJEenR9lkxzpMx6tiY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB8746.namprd12.prod.outlook.com (2603:10b6:208:490::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Wed, 21 Feb
 2024 14:28:43 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 14:28:43 +0000
Message-ID: <e10103e0-d93a-4af8-b30c-ef8d868ebc25@amd.com>
Date: Wed, 21 Feb 2024 15:28:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] drm/buddy: Add defragmentation support
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, matthew.auld@intel.com, felix.kuehling@amd.com
References: <20240221121801.3252-1-Arunpravin.PaneerSelvam@amd.com>
 <20240221121801.3252-3-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240221121801.3252-3-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: a9ab1521-bb21-47a3-3679-08dc32e967be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MyOUtwELRtcALdpw0LFpYa5+7RZ1Hg3J/s/DmIL3cCi6zikB3gFMIQqOpkfmonyhUF0pNrHFTo5FFFia4A/QhQi3A3QrJ+1RiKuZ2iVjqIPEDjPKG3W+fBXwHgZ2+giZpXqDRqIkW+SUUdLIc3dsDj8rlpG6geQA/cVlZ/OPIRoePxEQkai7anvN9mFdEwjGbXY99HXH78FcNJIRU7OmU7n5TmOPOXnOOHGMZTI9cnYuy6GSjVfeQZSwq+LOnEsGdWfUDAsOGlD8i8Wox9eUGZtIgMzC/RtDUU8u/lyV1DvD6ClQYdfAczYNgAEkGSUB+2FkYetMALrGTViqrTi2N6d168sU4aEhYb2iMBHq8hz97HHfchlUmF0c84Zu40OKnYJqhbzxr8ierJOGfpLgUuyliSDTLh4WhJJu9eDqtHO8ihf/KXa0guNsjqvxkucVSMMJcJuiqnA0P7VZKTj3YUc+qpMJyOgftXHsi3XUf+1Tfyy6yRVd60s9zghYCqfC95m8bBQZ5+Im5uzfY4YoFslMXz8IUAX/J1cNu+NrF8IHEy+RhnD+m/czMag1eX4N
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1RGc05IWWtwK2dFOFhacVRJdGdpNjhjQnIvRUYzaGlZcWpJM0hyZ1hzRjVK?=
 =?utf-8?B?U2lvcFNmcVhFQUxuZ2lJNUFMYjUzaDVvZ2U1elpWaWxNb1lKby9HR3pwTTZN?=
 =?utf-8?B?NWlUS2FpNldiWmpqSXN6TmdybHpZeHVpbXRaMHIxRWJlU1lPUFJlaWRDOFB5?=
 =?utf-8?B?RVBpSE1VYmp6M3IwQXcvb2dMa1JOVzBPYm9CUFRkV043NjVjKzVMMmM0aWtX?=
 =?utf-8?B?WGdxT2J1ZFRmSVgvdGxuTTFxTGVJVXl1V01neDJYTTBaVW8rajJHUXJDVlhV?=
 =?utf-8?B?TmRZMncvcVRYeG9yTEl2Mll6bjVEcEJVN2dIU29MQSs0WktnM2lkTWdMQXV3?=
 =?utf-8?B?Q0dpK2phWDU1bTMzRGRyWFVRelBMVUkxRzQ5blF5OXR1enFqQVcrd3l1QklE?=
 =?utf-8?B?aHFPbGR2ZFJNekFHVkwwUm9ibTNwcnE0OG0wendJdFV6UU1TY2VKNlpUZUlD?=
 =?utf-8?B?UUZyTzcxTiswNHduZnh0Q2lvZjh4WU91SW1mM1h6VTlPNFBQbXEzQklnZkM0?=
 =?utf-8?B?RUZuQWcrbzdLcFlhaWdMV3duY1JsZ2EvQ2JxTEh6MU5KQkdaQXlWWGY1a2Yw?=
 =?utf-8?B?NUNwMHhXUWZXVERpd0twS0l0dlJVNG5nSm9OT2l3NHdiYXc4TytaM1N4bU9k?=
 =?utf-8?B?Vy84YmpHWmowdXd2VGFXbVZRb3FZNGNVaFFneVVDOW9MaUJkZU1uSmc0dkho?=
 =?utf-8?B?bWxCbzM2d0pLZHhmSG9XOWx6Ym9oSnIxZGF3THViem9JK1A5Vlhvd0pLOUJD?=
 =?utf-8?B?VldmN2Y0dEkxNVhPY3JJd2tlNXNCaW1mQUdQMCs5V3FybTJZOUEwRXp3THd4?=
 =?utf-8?B?SXdiY1BaSGVkaDhmUUJsMURzT1p6Y2puV2NldE0xWVd2ZVVyajlOd3BhQUEr?=
 =?utf-8?B?NVJCL1YwZ0ZOZEdFZ0NVb1dMMmkwWTVmZWtoSit4bmpqUU9zWUN4aDQzbUNL?=
 =?utf-8?B?Q0JpSy92UEFxYkhlWU13M2VXeHR3cTZhc3htdWlCekRVNjdxT2F6N2RhSG1G?=
 =?utf-8?B?RmwyOFFNMjdLUGlDby83aXJTL290bjA3ckpVdEZqYU9UQ1pxMCtNVk1FRmg5?=
 =?utf-8?B?L004ck1mc21iNnp0UWppRUF6cXVLSFZhai9VSDkvM1cxMzV3a2xPejhoWlRR?=
 =?utf-8?B?b0JyWXJ1MDJkU0l2UFhBV3kybVJlNWtEVG91NHZZcXNFU3g1a0xVK0JMZjJD?=
 =?utf-8?B?dVFkbjYxdEg4ZmtVbXRwaGZzVnRNK0l6dUkzWWJ4OUdRM1RyQ051RXFvUXhF?=
 =?utf-8?B?SXlCVFFwUVQvejhYY1hOT21nNDV3V3dZTk1nUEJPaHBtMjQvN2lhcFo0VXRU?=
 =?utf-8?B?dDYxMDJQL2ptbnhEaXYwNWZlSEJDRFltazdDQ2J1WXdzNUVFQXE0QW52STZC?=
 =?utf-8?B?a1l2VDhJMW90V1o2S1VCYkc5blVZVTF0THpZb0JTYUZZWmN0U3ViQk9oT3lJ?=
 =?utf-8?B?VVlEZHFBcE5TS2M0a1NuZDdmeSsvM3lBN3VoVytxU01aNzE1ZXBjdDVrNzRs?=
 =?utf-8?B?TEZ4VTNYd0xmM29iTEtJN3NKR3ZiOHRMZFFvc3NncEdORVVDTUdjSWk3SUpY?=
 =?utf-8?B?bHRkU0dMYnhSakZNSHkxeEtGRzhqWnlvOHJMMlFSNEFsQi9jWWpNUGZ5clJk?=
 =?utf-8?B?QVQ0T1NiRHd5a0pwSWNjRThEcGdpWEROSTlKSnFhd3pxb2FOUzQxVjI3Tyty?=
 =?utf-8?B?RzNnbWN3dUYzRFA4Y3B3eU1RakNDU0lyU3FEaDU5a2ZLUFc2cmxtd2VPSmZF?=
 =?utf-8?B?eC9hT1o5bGlxOTcwWklZQVJ3dlQyS3RkU2lzUCtabmp0cUgwUGZzTmdZK2Mv?=
 =?utf-8?B?Y2JLaWFrdmdFUDB5blM1WWtma05NZVdxc2pLVkZpSFdYZFRkeXhBMEtubUpS?=
 =?utf-8?B?QWFJVEZ5N0x3bWJ6VmN1SXN2cDc3UU9JQzBnNlBDVzNXRXV1cllyQWE0b2FX?=
 =?utf-8?B?Z0hxSVVqZTczSm83b3hiUGxBTDUrRVRkM1hXZzVyRXZRYkxreVV2Mlc4RCtM?=
 =?utf-8?B?dkp6M2FNaE1pWi9iY3hOTnhTbGFDL0FXRllObnpyek9JTlk2Q0YyVTlsaHha?=
 =?utf-8?B?Z0YxL05iVzlqQlBlSXN4amQzZWQxVENEVG1XTGtwcU1abENjOUtsb3k2eGJz?=
 =?utf-8?Q?wRM4MAddc14QzTu2KkMxYYPdr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ab1521-bb21-47a3-3679-08dc32e967be
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 14:28:43.0422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yw9NanZPCmzWT7GwaKtFyVjKgBh3eK72xw5VsGZSQFh/mVPO0GsDLEthjTc84+FW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8746
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

Am 21.02.24 um 13:18 schrieb Arunpravin Paneer Selvam:
> Add a function to support defragmentation.

Thinking more about it maybe you want to call this function differently.

Essentially we are force merging pages even if their cleared flag 
doesn't match, that is something different than defragmentation I think.

Maybe rename it for force_merge or something similar. Not mandatory, 
just an idea how to improve the readability of the code.

Apart from that just let me know when I can push it to drm-misc-next.

Christian.

>
> v1:
>    - Defragment the memory beginning from min_order
>      till the required memory space is available.
>
> v2(Matthew):
>    - add amdgpu user for defragmentation
>    - add a warning if the two blocks are incompatible on
>      defragmentation
>    - call full defragmentation in the fini() function
>    - place a condition to test if min_order is equal to 0
>    - replace the list with safe_reverse() variant as we might
>      remove the block from the list.
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 +++-
>   drivers/gpu/drm/drm_buddy.c                  | 93 +++++++++++++++++---
>   include/drm/drm_buddy.h                      |  3 +
>   3 files changed, 97 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index e494f5bf136a..cff8a526c622 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -533,8 +533,21 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   					   min_block_size,
>   					   &vres->blocks,
>   					   vres->flags);
> -		if (unlikely(r))
> -			goto error_free_blocks;
> +		if (unlikely(r)) {
> +			if (r == -ENOSPC) {
> +				drm_buddy_defrag(mm, min_block_size);
> +				r = drm_buddy_alloc_blocks(mm, fpfn,
> +							   lpfn,
> +							   size,
> +							   min_block_size,
> +							   &vres->blocks,
> +							   vres->flags);
> +				if (unlikely(r))
> +					goto error_free_blocks;
> +			} else {
> +				goto error_free_blocks;
> +			}
> +		}
>   
>   		if (size > remaining_size)
>   			remaining_size = 0;
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 18e004fa39d3..56bd1560fbcd 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -203,6 +203,8 @@ void drm_buddy_fini(struct drm_buddy *mm)
>   		drm_block_free(mm, mm->roots[i]);
>   	}
>   
> +	drm_buddy_defrag(mm, mm->chunk_size << mm->max_order);
> +
>   	WARN_ON(mm->avail != mm->size);
>   
>   	kfree(mm->roots);
> @@ -276,25 +278,39 @@ drm_get_buddy(struct drm_buddy_block *block)
>   }
>   EXPORT_SYMBOL(drm_get_buddy);
>   
> -static void __drm_buddy_free(struct drm_buddy *mm,
> -			     struct drm_buddy_block *block)
> +static unsigned int __drm_buddy_free(struct drm_buddy *mm,
> +				     struct drm_buddy_block *block,
> +				     bool defrag)
>   {
> +	unsigned int order, block_order;
>   	struct drm_buddy_block *parent;
>   
> +	block_order = drm_buddy_block_order(block);
> +
>   	while ((parent = block->parent)) {
> -		struct drm_buddy_block *buddy;
> +		struct drm_buddy_block *buddy = NULL;
>   
>   		buddy = __get_buddy(block);
>   
>   		if (!drm_buddy_block_is_free(buddy))
>   			break;
>   
> -		if (drm_buddy_block_is_clear(block) !=
> -		    drm_buddy_block_is_clear(buddy))
> -			break;
> +		if (!defrag) {
> +			/*
> +			 * Check the block and its buddy clear state and exit
> +			 * the loop if they both have the dissimilar state.
> +			 */
> +			if (drm_buddy_block_is_clear(block) !=
> +			    drm_buddy_block_is_clear(buddy))
> +				break;
>   
> -		if (drm_buddy_block_is_clear(block))
> -			mark_cleared(parent);
> +			if (drm_buddy_block_is_clear(block))
> +				mark_cleared(parent);
> +		}
> +
> +		WARN_ON(defrag &&
> +			(drm_buddy_block_is_clear(block) ==
> +			 drm_buddy_block_is_clear(buddy)));
>   
>   		list_del(&buddy->link);
>   
> @@ -304,8 +320,57 @@ static void __drm_buddy_free(struct drm_buddy *mm,
>   		block = parent;
>   	}
>   
> -	mark_free(mm, block);
> +	order = drm_buddy_block_order(block);
> +	if (block_order != order)
> +		mark_free(mm, block);
> +
> +	return order;
> +}
> +
> +/**
> + * drm_buddy_defrag - Defragmentation routine
> + *
> + * @mm: DRM buddy manager
> + * @min_block_size: minimum size in bytes to begin
> + * the defragmentation process
> + *
> + * Driver calls the defragmentation function when the
> + * requested memory allocation returns -ENOSPC.
> + */
> +void drm_buddy_defrag(struct drm_buddy *mm,
> +		      unsigned int min_block_size)
> +{
> +	struct drm_buddy_block *block, *tmp;
> +	unsigned int order, min_order;
> +	struct list_head *list;
> +	unsigned long pages;
> +	int i;
> +
> +	pages = min_block_size >> ilog2(mm->chunk_size);
> +	min_order = fls(pages) - 1;
> +
> +	if (!min_order)
> +		return;
> +
> +	if (min_order > mm->max_order)
> +		return;
> +
> +	for (i = min_order - 1; i >= 0; i--) {
> +		list = &mm->free_list[i];
> +		if (list_empty(list))
> +			continue;
> +
> +		list_for_each_entry_safe_reverse(block, tmp, list, link) {
> +			if (!block->parent)
> +				continue;
> +
> +			order = __drm_buddy_free(mm, block, 1);
> +			if (order >= min_order)
> +				return;
> +		}
> +	}
>   }
> +EXPORT_SYMBOL(drm_buddy_defrag);
>   
>   /**
>    * drm_buddy_free_block - free a block
> @@ -321,7 +386,7 @@ void drm_buddy_free_block(struct drm_buddy *mm,
>   	if (drm_buddy_block_is_clear(block))
>   		mm->clear_avail += drm_buddy_block_size(mm, block);
>   
> -	__drm_buddy_free(mm, block);
> +	__drm_buddy_free(mm, block, 0);
>   }
>   EXPORT_SYMBOL(drm_buddy_free_block);
>   
> @@ -468,7 +533,7 @@ __alloc_range_bias(struct drm_buddy *mm,
>   	if (buddy &&
>   	    (drm_buddy_block_is_free(block) &&
>   	     drm_buddy_block_is_free(buddy)))
> -		__drm_buddy_free(mm, block);
> +		__drm_buddy_free(mm, block, 0);
>   	return ERR_PTR(err);
>   }
>   
> @@ -586,7 +651,7 @@ alloc_from_freelist(struct drm_buddy *mm,
>   
>   err_undo:
>   	if (tmp != order)
> -		__drm_buddy_free(mm, block);
> +		__drm_buddy_free(mm, block, 0);
>   	return ERR_PTR(err);
>   }
>   
> @@ -666,7 +731,7 @@ static int __alloc_range(struct drm_buddy *mm,
>   	if (buddy &&
>   	    (drm_buddy_block_is_free(block) &&
>   	     drm_buddy_block_is_free(buddy)))
> -		__drm_buddy_free(mm, block);
> +		__drm_buddy_free(mm, block, 0);
>   
>   err_free:
>   	if (err == -ENOSPC && total_allocated_on_err) {
> @@ -828,7 +893,7 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
>    * @mm: DRM buddy manager to allocate from
>    * @start: start of the allowed range for this block
>    * @end: end of the allowed range for this block
> - * @size: size of the allocation
> + * @size: size of the allocation in bytes
>    * @min_block_size: alignment of the allocation
>    * @blocks: output list head to add allocated blocks
>    * @flags: DRM_BUDDY_*_ALLOCATION flags
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 352a6364e26a..68a874846e78 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -167,6 +167,9 @@ void drm_buddy_free_list(struct drm_buddy *mm,
>   			 struct list_head *objects,
>   			 unsigned int flags);
>   
> +void drm_buddy_defrag(struct drm_buddy *mm,
> +		      unsigned int min_order);
> +
>   void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
>   void drm_buddy_block_print(struct drm_buddy *mm,
>   			   struct drm_buddy_block *block,

