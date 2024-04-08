Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 136C989C80B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 17:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B291126ED;
	Mon,  8 Apr 2024 15:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qlM9kBBI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2113.outbound.protection.outlook.com [40.107.94.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035661126EC;
 Mon,  8 Apr 2024 15:19:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MoTHnfO2vs0oSOui35vD8oxxXVf8yVa6MG2VmDkZgbclHVERDP6vSMQwqnftKL/6Q7dbyOIBG42/e/TA+NkLKkN0ykGqAZjGDc0VUE6oprqMFZ1RFjBFvTs5j8WkMhe94o561bEE3LNNUPmnz0hidGLRGbh7sHq0hEwYO6qRiqzOtMPOgC5CPDL9Z625mvG5cvKsogGKYevqadx5dRM4etoThiha1YC26pms4DBzHO1mmUycHsKijZaB6hwTHB9ojBg13iN2TLt0CoUjirhWKjua7yOcddr2RNxjlG00NoQFV4M/t0ShrAn0jPVEyzSKfZg2fXgu7iAR7s10TETlsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77mCXCoY+dll3kmIBMb/ujb0Sn9DYmx/rgi0jsKjM6U=;
 b=FYhjMaFI9fhzibke4Sx+iMV113JrpBb8+yRY26bneflByTTOSkCNLY+3e0j+XDm6o6+37NMTeSJPeitrheAmBj2+JKsD2W6O0tcJbHDcsCjzUbqCGpYBEg7/tZbu3xricb/dQVVePcvPUFWkdVSk66FPo7ErgKUmrfyIJDQA7PxQWFtu5ljp3Z1k+hTBYsrBUjAXSvi2oI+nZtusYUtzH+gNoNwK3nmJSx8X5dCwyDit30MGTI1t1RbRXEwpR58X7d+IsgqXDK+xzHYQeNaLHiDCnWkMGqVj6duPEOKgyRuVo+ucNL/hum0dYlMZ7juBZ6+j1SYLe7ZZFiryCltmqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77mCXCoY+dll3kmIBMb/ujb0Sn9DYmx/rgi0jsKjM6U=;
 b=qlM9kBBICwhcco37WQivF08MtkJoUDUWG1MeF+6IHVGpTrjbkvDaq1hO/gdSxb26cvOByRrAtGCKL9daAaWidQ759G0GPPiodl5m3+bTyw3Ubi0eDoK/FKtcHlrDfsbkSJkwtZDOBY62NbhOTXLXi3uIUSKhaVmM/bAEjsWs2Wg=
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB4191.namprd12.prod.outlook.com (2603:10b6:208:1d3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Mon, 8 Apr
 2024 15:19:25 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6710:26ed:ab04:558f]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6710:26ed:ab04:558f%5]) with mapi id 15.20.7409.049; Mon, 8 Apr 2024
 15:19:25 +0000
Message-ID: <07e71ae3-6ff1-40cc-bd08-680a51820c38@amd.com>
Date: Mon, 8 Apr 2024 20:49:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/3] drm/buddy: Implement tracking clear page feature
Content-Language: en-US
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 matthew.auld@intel.com, mario.limonciello@amd.com, felix.kuehling@amd.com
References: <20240408151620.528163-1-Arunpravin.PaneerSelvam@amd.com>
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20240408151620.528163-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXP287CA0018.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::34) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|MN2PR12MB4191:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pFGXKOHWP5QdBvJDHgOw8DPRQ7ZqVR/dqEHP1ZumLIWnTSrq8ikOyyQrwS02Y1d1yoKS3457JkrijzgSTY5I3MhQ98YT+C7JbPlSIqu0T6sSPM3+jQeXaNlx5QtItwPlGf/Uhz3s7PqHOzB1SFADFbWUsdCWpKpjQl1uWFVoXxd2XsdlVlIkwOcBoL43L7BYO9W8rzNja2m0B7n1Ke3aZzJwhZ67O1ntVGAekN8XDx0XMIWwKix0l7tAC50hefOn02FKNZOByPQ2acbQo1uwp9IazA3Z7E2asWimzaCYFesabrf4rY4p6qisPlvh5gKxBPZMA+RAwGnVO7p/NgLBkyr3HsdAfmxvoNzK3pQ5OWTaBfmbJVkA6R73Yw8Mv/5P9op3BMTXX8A61NFld6qVEnLKCw6Xi/08MmZ4jxix7msEW8MxiYgwxUhgyc0U57VnyDZVl672PaEPtqmSSmrzYWKpq7mDsyeMY7BJNLZeEMeFkjyTnoxe7y9USbCeTtxFkUjS1wK97UfI/YX6VLhXuBZreA5nBSQm5qmme2TqsftJTE0Pkk7LIbIg4OOt6s3/9MaOWyaO3Q4t4eyhtLeOuR3Wq0RWYpWq447pGxq1xqWRGbzo443iSxsvGYQsCnx4xZSuLrFNA9HZYhTeERtAD4qy/p6aypbNIeSWc5zSz0g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGEwMkpwM2M1eHJKSnpJeUUxOUhORmloM3hZQjRSUEJld0xtZXV0UGRDOVd4?=
 =?utf-8?B?dUtmWjhDdFNyM3hDcFVGc3dYbVdtZkNsdDZYc2ozUGRmdUYyclAxQUhIM05G?=
 =?utf-8?B?TGFTZWVZUEt4SGl3eHN3SldFd0I2OTBiS3Vwc0NrQjFmaVlYQ0lWTk5NaGhn?=
 =?utf-8?B?NlBGQjN5ZTRPdW1MUzI0VFZoODh1bWpJZEQzY1Jmcm9OU1VtNlpKTzUrZ0Ny?=
 =?utf-8?B?QlUrMkZmc1VYa2l0V2NabEkydU9SeTlKMUJaZHlzMGNTQVZKb1FNZVB2Q2FE?=
 =?utf-8?B?YjIrSmcrZC9aMFhrdy8vanI0M2E0S3MxZElSYmxKZmNaLzVTcHVFYjZBQjJ3?=
 =?utf-8?B?eksvOEM1UUcveUMraFMwRmdvWk1GVlpNNTUxanZHd3NFSUliSTB2aS9ZY0Mx?=
 =?utf-8?B?VENZRktOWmYyaytPcFkyUndyWHY4Q1JoeDlRYjZHSXRYUFFhYnJjbTNPZE5w?=
 =?utf-8?B?MU1oZEVaSWRINEJic0NqeWsyODV4STVtdVMzckwxbjlheGJFOUpsTnYzSGJL?=
 =?utf-8?B?SVNpcmlHSkxGZ3l5U3MrTW43RXBJR09Bd3M0YkxSelB2bFlTcExJbkVGb01F?=
 =?utf-8?B?Qm1pcmd2OUNRN0FwK2xQaVpzMURXRGhIcEI5S1N2bVA3dVEzY3BWa3MxRWMw?=
 =?utf-8?B?V1ZvV21MaDE0S2plcjR6MGNZTXBMRk93NmZQUXBhSlNRSUVOUnNJRDhhUXpa?=
 =?utf-8?B?U2huVEJYUVk0bEV0aWtNcjhvblFWbkxQa01JbHY1N1FMTi9Ra2Q5Y0dyeElG?=
 =?utf-8?B?NmM4a0dTZ3gyT1FMek4xNVhiYmVvOC9RVE4yN1dXdjRGa2xkejdQQzdVaWlh?=
 =?utf-8?B?dENrSW5wZGJoUG1raG1TcWswMXNxNmxHVXMyMnZqbWR5Ykd3Y0lLTElhbjFJ?=
 =?utf-8?B?bkhTRzhzZlYrYXRNT2N4ZTBSZG1YMG9hT3RJeEE4ZGFEZnZ0UzlMbGl0M2NJ?=
 =?utf-8?B?aFFHZlJYQXdjeFRJY0JjcEQ1UWd4RHUzRHBvUWh4WlZPRHhSQnZXbUN4OVR0?=
 =?utf-8?B?VitqbjJFVjVZYm5pYkxTVUtqTjVGZm4yTjV5RXpxRnE1SVIyNkFxcXl3WHh0?=
 =?utf-8?B?Rml2UEhjZmt6RHo2UkJlUk42T3c3NjdzaXhXY2VhcGFia21UMWdzT0RPeTNO?=
 =?utf-8?B?NmFJOThHU1RIeHNDUDBtb0JKUUtlbzZid0VMRlZDVlc1RmVDaEV3ZXpQbUJj?=
 =?utf-8?B?UVR0TVA5eUphcjM4ZU1OMERxT2J4NUh0dEtwOWRVN0t0T2h0TTE2SnFmVjVT?=
 =?utf-8?B?YWRXTkZPek1wR1RJZ3BzRTV4K0lzU000QlV5dDV2RVJveE93aCtuVE5VWkF6?=
 =?utf-8?B?c01EeGEzcU1oWWpCUWRwd3dVbGVkZU8wdk5xa21Fc2FPaVpOZUE2bndPNmo4?=
 =?utf-8?B?emtBMkhXNHprL1QraHBBcFpSTzhjc3dUZ29zenJOU25KRENwczdIYU9yb1Bj?=
 =?utf-8?B?bnRLQ0tnMUh3eGorNFhJZWFNZkh5U1VLVlhvOWVkeFM2MnZwQVE3d2tyM0Ix?=
 =?utf-8?B?eDZGZ3V5L0h4WXE3aWJtd3VKdGpCQndNdzFxemxEVk0yUm5jbmZoUmQ2alJI?=
 =?utf-8?B?VmJXUGlFTmpnb2FwWXJSUTJhaTJwZ2JNUmVVRGF1eWRwcldtMTJPVHZ0ZEQ1?=
 =?utf-8?B?QlJpVlVKWjQ1MW5WdVhUMy8rKzNOakx3TGYvWFRBV0NPd3l4RkU1ejRBRkkr?=
 =?utf-8?B?Y0F3UTVXWjk1a0U4V3g1SEFPeWN5VElCcnN6TzBMdjhVb3owcHlENEVOaXds?=
 =?utf-8?B?dGVySW12Wjh0ZWdHcERqVDNrVDQ3MmswU253TTE4eTlzMWZvNStmeVZybTRa?=
 =?utf-8?B?YW0vZEFicHpzNm4xR0NZcDdrenAza3duSXpXM2h6WWVQeWRJY2x3a0xvUFp4?=
 =?utf-8?B?dzR2MlVmQVA1VFA0ZVB5NG5OLzA2YXFXNEh5LzZQdnk2Q3JPMnhNYkhrUnJM?=
 =?utf-8?B?MU1NRExFZ0cwcGNtTi9jT25uOGdDMHRRQWtiMGtSMElrRE44ZVJqa0VTQlV3?=
 =?utf-8?B?bjl3K1BDb3RZY2ZCQS9UZ3dFckJCS0R5ZnpNU3RvRWNmbWZPSEc5Tjk2VEh0?=
 =?utf-8?B?K2xrWC8wTkt5SGxtMVhCMUxkV1ZGWjhpSUlEL25BdTJrRkY4QUpyc21ocGFG?=
 =?utf-8?Q?rPyG/0nWycbnoM9m8Eq6GU2MD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e81859-5df7-49eb-b7de-08dc57df4633
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 15:19:25.0400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fttTksP+lrdZDv+N3Ax+mPQ0A8NmC4iP9AY9pNhIcwGITLC3R+pFrqrG8FROWmQcYJV3LLwa5HfDkVURaQt60g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4191
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

Hi Matthew,
Could you please review these changes as few clients are waiting for 
these patches.

Thanks,
Arun.
On 4/8/2024 8:46 PM, Arunpravin Paneer Selvam wrote:
> - Add tracking clear page feature.
>
> - Driver should enable the DRM_BUDDY_CLEARED flag if it
>    successfully clears the blocks in the free path. On the otherhand,
>    DRM buddy marks each block as cleared.
>
> - Track the available cleared pages size
>
> - If driver requests cleared memory we prefer cleared memory
>    but fallback to uncleared if we can't find the cleared blocks.
>    when driver requests uncleared memory we try to use uncleared but
>    fallback to cleared memory if necessary.
>
> - When a block gets freed we clear it and mark the freed block as cleared,
>    when there are buddies which are cleared as well we can merge them.
>    Otherwise, we prefer to keep the blocks as separated.
>
> - Add a function to support defragmentation.
>
> v1:
>    - Depends on the flag check DRM_BUDDY_CLEARED, enable the block as
>      cleared. Else, reset the clear flag for each block in the list(Christian)
>    - For merging the 2 cleared blocks compare as below,
>      drm_buddy_is_clear(block) != drm_buddy_is_clear(buddy)(Christian)
>    - Defragment the memory beginning from min_order
>      till the required memory space is available.
>
> v2: (Matthew)
>    - Add a wrapper drm_buddy_free_list_internal for the freeing of blocks
>      operation within drm buddy.
>    - Write a macro block_incompatible() to allocate the required blocks.
>    - Update the xe driver for the drm_buddy_free_list change in arguments.
>    - add a warning if the two blocks are incompatible on
>      defragmentation
>    - call full defragmentation in the fini() function
>    - place a condition to test if min_order is equal to 0
>    - replace the list with safe_reverse() variant as we might
>      remove the block from the list.
>
> v3:
>    - fix Gitlab user reported lockup issue.
>    - Keep DRM_BUDDY_HEADER_CLEAR define sorted(Matthew)
>    - modify to pass the root order instead max_order in fini()
>      function(Matthew)
>    - change bool 1 to true(Matthew)
>    - add check if min_block_size is power of 2(Matthew)
>    - modify the min_block_size datatype to u64(Matthew)
>
> v4:
>    - rename the function drm_buddy_defrag with __force_merge.
>    - Include __force_merge directly in drm buddy file and remove
>      the defrag use in amdgpu driver.
>    - Remove list_empty() check(Matthew)
>    - Remove unnecessary space, headers and placement of new variables(Matthew)
>    - Add a unit test case(Matthew)
>
> v5:
>    - remove force merge support to actual range allocation and not to bail
>      out when contains && split(Matthew)
>    - add range support to force merge function.
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |   6 +-
>   drivers/gpu/drm/drm_buddy.c                   | 430 ++++++++++++++----
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |   6 +-
>   drivers/gpu/drm/tests/drm_buddy_test.c        |  28 +-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   4 +-
>   include/drm/drm_buddy.h                       |  16 +-
>   6 files changed, 368 insertions(+), 122 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 8db880244324..c0c851409241 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -571,7 +571,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   	return 0;
>   
>   error_free_blocks:
> -	drm_buddy_free_list(mm, &vres->blocks);
> +	drm_buddy_free_list(mm, &vres->blocks, 0);
>   	mutex_unlock(&mgr->lock);
>   error_fini:
>   	ttm_resource_fini(man, &vres->base);
> @@ -604,7 +604,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>   
>   	amdgpu_vram_mgr_do_reserve(man);
>   
> -	drm_buddy_free_list(mm, &vres->blocks);
> +	drm_buddy_free_list(mm, &vres->blocks, 0);
>   	mutex_unlock(&mgr->lock);
>   
>   	atomic64_sub(vis_usage, &mgr->vis_usage);
> @@ -912,7 +912,7 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
>   		kfree(rsv);
>   
>   	list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, blocks) {
> -		drm_buddy_free_list(&mgr->mm, &rsv->allocated);
> +		drm_buddy_free_list(&mgr->mm, &rsv->allocated, 0);
>   		kfree(rsv);
>   	}
>   	if (!adev->gmc.is_app_apu)
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 5ebdd6f8f36e..83dbe252f727 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -38,8 +38,8 @@ static void drm_block_free(struct drm_buddy *mm,
>   	kmem_cache_free(slab_blocks, block);
>   }
>   
> -static void list_insert_sorted(struct drm_buddy *mm,
> -			       struct drm_buddy_block *block)
> +static void list_insert(struct drm_buddy *mm,
> +			struct drm_buddy_block *block)
>   {
>   	struct drm_buddy_block *node;
>   	struct list_head *head;
> @@ -57,6 +57,16 @@ static void list_insert_sorted(struct drm_buddy *mm,
>   	__list_add(&block->link, node->link.prev, &node->link);
>   }
>   
> +static void clear_reset(struct drm_buddy_block *block)
> +{
> +	block->header &= ~DRM_BUDDY_HEADER_CLEAR;
> +}
> +
> +static void mark_cleared(struct drm_buddy_block *block)
> +{
> +	block->header |= DRM_BUDDY_HEADER_CLEAR;
> +}
> +
>   static void mark_allocated(struct drm_buddy_block *block)
>   {
>   	block->header &= ~DRM_BUDDY_HEADER_STATE;
> @@ -71,7 +81,7 @@ static void mark_free(struct drm_buddy *mm,
>   	block->header &= ~DRM_BUDDY_HEADER_STATE;
>   	block->header |= DRM_BUDDY_FREE;
>   
> -	list_insert_sorted(mm, block);
> +	list_insert(mm, block);
>   }
>   
>   static void mark_split(struct drm_buddy_block *block)
> @@ -82,6 +92,133 @@ static void mark_split(struct drm_buddy_block *block)
>   	list_del(&block->link);
>   }
>   
> +static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
> +{
> +	return s1 <= e2 && e1 >= s2;
> +}
> +
> +static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
> +{
> +	return s1 <= s2 && e1 >= e2;
> +}
> +
> +static struct drm_buddy_block *
> +__get_buddy(struct drm_buddy_block *block)
> +{
> +	struct drm_buddy_block *parent;
> +
> +	parent = block->parent;
> +	if (!parent)
> +		return NULL;
> +
> +	if (parent->left == block)
> +		return parent->right;
> +
> +	return parent->left;
> +}
> +
> +static unsigned int __drm_buddy_free(struct drm_buddy *mm,
> +				     struct drm_buddy_block *block,
> +				     bool force_merge)
> +{
> +	struct drm_buddy_block *parent;
> +	unsigned int order;
> +
> +	while ((parent = block->parent)) {
> +		struct drm_buddy_block *buddy;
> +
> +		buddy = __get_buddy(block);
> +
> +		if (!drm_buddy_block_is_free(buddy))
> +			break;
> +
> +		if (!force_merge) {
> +			/*
> +			 * Check the block and its buddy clear state and exit
> +			 * the loop if they both have the dissimilar state.
> +			 */
> +			if (drm_buddy_block_is_clear(block) !=
> +			    drm_buddy_block_is_clear(buddy))
> +				break;
> +
> +			if (drm_buddy_block_is_clear(block))
> +				mark_cleared(parent);
> +		}
> +
> +		list_del(&buddy->link);
> +		if (force_merge && drm_buddy_block_is_clear(buddy))
> +			mm->clear_avail -= drm_buddy_block_size(mm, buddy);
> +
> +		drm_block_free(mm, block);
> +		drm_block_free(mm, buddy);
> +
> +		block = parent;
> +	}
> +
> +	order = drm_buddy_block_order(block);
> +	mark_free(mm, block);
> +
> +	return order;
> +}
> +
> +static int __force_merge(struct drm_buddy *mm,
> +			 u64 start,
> +			 u64 end,
> +			 unsigned int min_order)
> +{
> +	unsigned int order;
> +	int i;
> +
> +	if (!min_order)
> +		return -ENOMEM;
> +
> +	if (min_order > mm->max_order)
> +		return -EINVAL;
> +
> +	for (i = min_order - 1; i >= 0; i--) {
> +		struct drm_buddy_block *block, *prev;
> +
> +		list_for_each_entry_safe_reverse(block, prev, &mm->free_list[i], link) {
> +			struct drm_buddy_block *buddy;
> +			u64 block_start, block_end;
> +
> +			if (!block->parent)
> +				continue;
> +
> +			block_start = drm_buddy_block_offset(block);
> +			block_end = block_start + drm_buddy_block_size(mm, block) - 1;
> +
> +			if (!contains(start, end, block_start, block_end))
> +				continue;
> +
> +			buddy = __get_buddy(block);
> +			if (!drm_buddy_block_is_free(buddy))
> +				continue;
> +
> +			WARN_ON(drm_buddy_block_is_clear(block) ==
> +				drm_buddy_block_is_clear(buddy));
> +
> +			/*
> +			 * If the prev block is same as buddy, don't access the
> +			 * block in the next iteration as we would free the
> +			 * buddy block as part of the free function.
> +			 */
> +			if (prev == buddy)
> +				prev = list_prev_entry(prev, link);
> +
> +			list_del(&block->link);
> +			if (drm_buddy_block_is_clear(block))
> +				mm->clear_avail -= drm_buddy_block_size(mm, block);
> +
> +			order = __drm_buddy_free(mm, block, true);
> +			if (order >= min_order)
> +				return 0;
> +		}
> +	}
> +
> +	return -ENOMEM;
> +}
> +
>   /**
>    * drm_buddy_init - init memory manager
>    *
> @@ -186,11 +323,21 @@ EXPORT_SYMBOL(drm_buddy_init);
>    */
>   void drm_buddy_fini(struct drm_buddy *mm)
>   {
> +	u64 root_size, size;
> +	unsigned int order;
>   	int i;
>   
> +	size = mm->size;
> +
>   	for (i = 0; i < mm->n_roots; ++i) {
> +		order = ilog2(size) - ilog2(mm->chunk_size);
> +		__force_merge(mm, 0, size, order);
> +
>   		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
>   		drm_block_free(mm, mm->roots[i]);
> +
> +		root_size = mm->chunk_size << order;
> +		size -= root_size;
>   	}
>   
>   	WARN_ON(mm->avail != mm->size);
> @@ -223,26 +370,17 @@ static int split_block(struct drm_buddy *mm,
>   	mark_free(mm, block->left);
>   	mark_free(mm, block->right);
>   
> +	if (drm_buddy_block_is_clear(block)) {
> +		mark_cleared(block->left);
> +		mark_cleared(block->right);
> +		clear_reset(block);
> +	}
> +
>   	mark_split(block);
>   
>   	return 0;
>   }
>   
> -static struct drm_buddy_block *
> -__get_buddy(struct drm_buddy_block *block)
> -{
> -	struct drm_buddy_block *parent;
> -
> -	parent = block->parent;
> -	if (!parent)
> -		return NULL;
> -
> -	if (parent->left == block)
> -		return parent->right;
> -
> -	return parent->left;
> -}
> -
>   /**
>    * drm_get_buddy - get buddy address
>    *
> @@ -260,30 +398,6 @@ drm_get_buddy(struct drm_buddy_block *block)
>   }
>   EXPORT_SYMBOL(drm_get_buddy);
>   
> -static void __drm_buddy_free(struct drm_buddy *mm,
> -			     struct drm_buddy_block *block)
> -{
> -	struct drm_buddy_block *parent;
> -
> -	while ((parent = block->parent)) {
> -		struct drm_buddy_block *buddy;
> -
> -		buddy = __get_buddy(block);
> -
> -		if (!drm_buddy_block_is_free(buddy))
> -			break;
> -
> -		list_del(&buddy->link);
> -
> -		drm_block_free(mm, block);
> -		drm_block_free(mm, buddy);
> -
> -		block = parent;
> -	}
> -
> -	mark_free(mm, block);
> -}
> -
>   /**
>    * drm_buddy_free_block - free a block
>    *
> @@ -295,42 +409,74 @@ void drm_buddy_free_block(struct drm_buddy *mm,
>   {
>   	BUG_ON(!drm_buddy_block_is_allocated(block));
>   	mm->avail += drm_buddy_block_size(mm, block);
> -	__drm_buddy_free(mm, block);
> +	if (drm_buddy_block_is_clear(block))
> +		mm->clear_avail += drm_buddy_block_size(mm, block);
> +
> +	__drm_buddy_free(mm, block, false);
>   }
>   EXPORT_SYMBOL(drm_buddy_free_block);
>   
> -/**
> - * drm_buddy_free_list - free blocks
> - *
> - * @mm: DRM buddy manager
> - * @objects: input list head to free blocks
> - */
> -void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects)
> +static void __drm_buddy_free_list(struct drm_buddy *mm,
> +				  struct list_head *objects,
> +				  bool mark_clear,
> +				  bool mark_dirty)
>   {
>   	struct drm_buddy_block *block, *on;
>   
> +	WARN_ON(mark_dirty && mark_clear);
> +
>   	list_for_each_entry_safe(block, on, objects, link) {
> +		if (mark_clear)
> +			mark_cleared(block);
> +		else if (mark_dirty)
> +			clear_reset(block);
>   		drm_buddy_free_block(mm, block);
>   		cond_resched();
>   	}
>   	INIT_LIST_HEAD(objects);
>   }
> -EXPORT_SYMBOL(drm_buddy_free_list);
>   
> -static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
> +static void drm_buddy_free_list_internal(struct drm_buddy *mm,
> +					 struct list_head *objects)
>   {
> -	return s1 <= e2 && e1 >= s2;
> +	/*
> +	 * Don't touch the clear/dirty bit, since allocation is still internal
> +	 * at this point. For example we might have just failed part of the
> +	 * allocation.
> +	 */
> +	__drm_buddy_free_list(mm, objects, false, false);
>   }
>   
> -static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
> +/**
> + * drm_buddy_free_list - free blocks
> + *
> + * @mm: DRM buddy manager
> + * @objects: input list head to free blocks
> + * @flags: optional flags like DRM_BUDDY_CLEARED
> + */
> +void drm_buddy_free_list(struct drm_buddy *mm,
> +			 struct list_head *objects,
> +			 unsigned int flags)
>   {
> -	return s1 <= s2 && e1 >= e2;
> +	bool mark_clear = flags & DRM_BUDDY_CLEARED;
> +
> +	__drm_buddy_free_list(mm, objects, mark_clear, !mark_clear);
> +}
> +EXPORT_SYMBOL(drm_buddy_free_list);
> +
> +static bool block_incompatible(struct drm_buddy_block *block, unsigned int flags)
> +{
> +	bool needs_clear = flags & DRM_BUDDY_CLEAR_ALLOCATION;
> +
> +	return needs_clear != drm_buddy_block_is_clear(block);
>   }
>   
>   static struct drm_buddy_block *
> -alloc_range_bias(struct drm_buddy *mm,
> -		 u64 start, u64 end,
> -		 unsigned int order)
> +__alloc_range_bias(struct drm_buddy *mm,
> +		   u64 start, u64 end,
> +		   unsigned int order,
> +		   unsigned long flags,
> +		   bool fallback)
>   {
>   	u64 req_size = mm->chunk_size << order;
>   	struct drm_buddy_block *block;
> @@ -379,6 +525,9 @@ alloc_range_bias(struct drm_buddy *mm,
>   
>   		if (contains(start, end, block_start, block_end) &&
>   		    order == drm_buddy_block_order(block)) {
> +			if (!fallback && block_incompatible(block, flags))
> +				continue;
> +
>   			/*
>   			 * Find the free block within the range.
>   			 */
> @@ -410,30 +559,57 @@ alloc_range_bias(struct drm_buddy *mm,
>   	if (buddy &&
>   	    (drm_buddy_block_is_free(block) &&
>   	     drm_buddy_block_is_free(buddy)))
> -		__drm_buddy_free(mm, block);
> +		__drm_buddy_free(mm, block, false);
>   	return ERR_PTR(err);
>   }
>   
>   static struct drm_buddy_block *
> -get_maxblock(struct drm_buddy *mm, unsigned int order)
> +__drm_buddy_alloc_range_bias(struct drm_buddy *mm,
> +			     u64 start, u64 end,
> +			     unsigned int order,
> +			     unsigned long flags)
>   {
> -	struct drm_buddy_block *max_block = NULL, *node;
> +	struct drm_buddy_block *block;
> +	bool fallback = false;
> +
> +	block = __alloc_range_bias(mm, start, end, order,
> +				   flags, fallback);
> +	if (IS_ERR(block) && mm->clear_avail)
> +		return __alloc_range_bias(mm, start, end, order,
> +					  flags, !fallback);
> +
> +	return block;
> +}
> +
> +static struct drm_buddy_block *
> +get_maxblock(struct drm_buddy *mm, unsigned int order,
> +	     unsigned long flags)
> +{
> +	struct drm_buddy_block *max_block = NULL, *block = NULL;
>   	unsigned int i;
>   
>   	for (i = order; i <= mm->max_order; ++i) {
> -		if (!list_empty(&mm->free_list[i])) {
> -			node = list_last_entry(&mm->free_list[i],
> -					       struct drm_buddy_block,
> -					       link);
> -			if (!max_block) {
> -				max_block = node;
> +		struct drm_buddy_block *tmp_block;
> +
> +		list_for_each_entry_reverse(tmp_block, &mm->free_list[i], link) {
> +			if (block_incompatible(tmp_block, flags))
>   				continue;
> -			}
>   
> -			if (drm_buddy_block_offset(node) >
> -			    drm_buddy_block_offset(max_block)) {
> -				max_block = node;
> -			}
> +			block = tmp_block;
> +			break;
> +		}
> +
> +		if (!block)
> +			continue;
> +
> +		if (!max_block) {
> +			max_block = block;
> +			continue;
> +		}
> +
> +		if (drm_buddy_block_offset(block) >
> +		    drm_buddy_block_offset(max_block)) {
> +			max_block = block;
>   		}
>   	}
>   
> @@ -450,11 +626,29 @@ alloc_from_freelist(struct drm_buddy *mm,
>   	int err;
>   
>   	if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
> -		block = get_maxblock(mm, order);
> +		block = get_maxblock(mm, order, flags);
>   		if (block)
>   			/* Store the obtained block order */
>   			tmp = drm_buddy_block_order(block);
>   	} else {
> +		for (tmp = order; tmp <= mm->max_order; ++tmp) {
> +			struct drm_buddy_block *tmp_block;
> +
> +			list_for_each_entry_reverse(tmp_block, &mm->free_list[tmp], link) {
> +				if (block_incompatible(tmp_block, flags))
> +					continue;
> +
> +				block = tmp_block;
> +				break;
> +			}
> +
> +			if (block)
> +				break;
> +		}
> +	}
> +
> +	if (!block) {
> +		/* Fallback method */
>   		for (tmp = order; tmp <= mm->max_order; ++tmp) {
>   			if (!list_empty(&mm->free_list[tmp])) {
>   				block = list_last_entry(&mm->free_list[tmp],
> @@ -464,10 +658,10 @@ alloc_from_freelist(struct drm_buddy *mm,
>   					break;
>   			}
>   		}
> -	}
>   
> -	if (!block)
> -		return ERR_PTR(-ENOSPC);
> +		if (!block)
> +			return ERR_PTR(-ENOSPC);
> +	}
>   
>   	BUG_ON(!drm_buddy_block_is_free(block));
>   
> @@ -483,7 +677,7 @@ alloc_from_freelist(struct drm_buddy *mm,
>   
>   err_undo:
>   	if (tmp != order)
> -		__drm_buddy_free(mm, block);
> +		__drm_buddy_free(mm, block, false);
>   	return ERR_PTR(err);
>   }
>   
> @@ -527,13 +721,22 @@ static int __alloc_range(struct drm_buddy *mm,
>   
>   		if (contains(start, end, block_start, block_end)) {
>   			if (!drm_buddy_block_is_free(block)) {
> -				err = -ENOSPC;
> -				goto err_free;
> +				if (drm_buddy_block_is_split(block)) {
> +					list_add(&block->right->tmp_link, dfs);
> +					list_add(&block->left->tmp_link, dfs);
> +
> +					continue;
> +				} else {
> +					err = -ENOSPC;
> +					goto err_free;
> +				}
>   			}
>   
>   			mark_allocated(block);
>   			total_allocated += drm_buddy_block_size(mm, block);
>   			mm->avail -= drm_buddy_block_size(mm, block);
> +			if (drm_buddy_block_is_clear(block))
> +				mm->clear_avail -= drm_buddy_block_size(mm, block);
>   			list_add_tail(&block->link, &allocated);
>   			continue;
>   		}
> @@ -567,14 +770,14 @@ static int __alloc_range(struct drm_buddy *mm,
>   	if (buddy &&
>   	    (drm_buddy_block_is_free(block) &&
>   	     drm_buddy_block_is_free(buddy)))
> -		__drm_buddy_free(mm, block);
> +		__drm_buddy_free(mm, block, false);
>   
>   err_free:
>   	if (err == -ENOSPC && total_allocated_on_err) {
>   		list_splice_tail(&allocated, blocks);
>   		*total_allocated_on_err = total_allocated;
>   	} else {
> -		drm_buddy_free_list(mm, &allocated);
> +		drm_buddy_free_list_internal(mm, &allocated);
>   	}
>   
>   	return err;
> @@ -640,11 +843,11 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>   			list_splice(&blocks_lhs, blocks);
>   			return 0;
>   		} else if (err != -ENOSPC) {
> -			drm_buddy_free_list(mm, blocks);
> +			drm_buddy_free_list_internal(mm, blocks);
>   			return err;
>   		}
>   		/* Free blocks for the next iteration */
> -		drm_buddy_free_list(mm, blocks);
> +		drm_buddy_free_list_internal(mm, blocks);
>   	}
>   
>   	return -ENOSPC;
> @@ -700,6 +903,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   	list_del(&block->link);
>   	mark_free(mm, block);
>   	mm->avail += drm_buddy_block_size(mm, block);
> +	if (drm_buddy_block_is_clear(block))
> +		mm->clear_avail += drm_buddy_block_size(mm, block);
>   
>   	/* Prevent recursively freeing this node */
>   	parent = block->parent;
> @@ -711,6 +916,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   	if (err) {
>   		mark_allocated(block);
>   		mm->avail -= drm_buddy_block_size(mm, block);
> +		if (drm_buddy_block_is_clear(block))
> +			mm->clear_avail -= drm_buddy_block_size(mm, block);
>   		list_add(&block->link, blocks);
>   	}
>   
> @@ -719,13 +926,28 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   }
>   EXPORT_SYMBOL(drm_buddy_block_trim);
>   
> +static struct drm_buddy_block *
> +__drm_buddy_alloc_blocks(struct drm_buddy *mm,
> +			 u64 start, u64 end,
> +			 unsigned int order,
> +			 unsigned long flags)
> +{
> +	if (flags & DRM_BUDDY_RANGE_ALLOCATION)
> +		/* Allocate traversing within the range */
> +		return  __drm_buddy_alloc_range_bias(mm, start, end,
> +						     order, flags);
> +	else
> +		/* Allocate from freelist */
> +		return alloc_from_freelist(mm, order, flags);
> +}
> +
>   /**
>    * drm_buddy_alloc_blocks - allocate power-of-two blocks
>    *
>    * @mm: DRM buddy manager to allocate from
>    * @start: start of the allowed range for this block
>    * @end: end of the allowed range for this block
> - * @size: size of the allocation
> + * @size: size of the allocation in bytes
>    * @min_block_size: alignment of the allocation
>    * @blocks: output list head to add allocated blocks
>    * @flags: DRM_BUDDY_*_ALLOCATION flags
> @@ -800,23 +1022,33 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   		BUG_ON(order < min_order);
>   
>   		do {
> -			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
> -				/* Allocate traversing within the range */
> -				block = alloc_range_bias(mm, start, end, order);
> -			else
> -				/* Allocate from freelist */
> -				block = alloc_from_freelist(mm, order, flags);
> -
> +			block = __drm_buddy_alloc_blocks(mm, start,
> +							 end,
> +							 order,
> +							 flags);
>   			if (!IS_ERR(block))
>   				break;
>   
>   			if (order-- == min_order) {
> +				/* Try allocation through force merge method */
> +				if (mm->clear_avail &&
> +				    !__force_merge(mm, start, end, min_order)) {
> +					block = __drm_buddy_alloc_blocks(mm, start,
> +									 end,
> +									 min_order,
> +									 flags);
> +					if (!IS_ERR(block)) {
> +						order = min_order;
> +						break;
> +					}
> +				}
> +
> +				/*
> +				 * Try contiguous block allocation through
> +				 * try harder method.
> +				 */
>   				if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION &&
>   				    !(flags & DRM_BUDDY_RANGE_ALLOCATION))
> -					/*
> -					 * Try contiguous block allocation through
> -					 * try harder method
> -					 */
>   					return __alloc_contig_try_harder(mm,
>   									 original_size,
>   									 original_min_size,
> @@ -828,6 +1060,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   
>   		mark_allocated(block);
>   		mm->avail -= drm_buddy_block_size(mm, block);
> +		if (drm_buddy_block_is_clear(block))
> +			mm->clear_avail -= drm_buddy_block_size(mm, block);
>   		kmemleak_update_trace(block);
>   		list_add_tail(&block->link, &allocated);
>   
> @@ -866,7 +1100,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   	return 0;
>   
>   err_free:
> -	drm_buddy_free_list(mm, &allocated);
> +	drm_buddy_free_list_internal(mm, &allocated);
>   	return err;
>   }
>   EXPORT_SYMBOL(drm_buddy_alloc_blocks);
> @@ -899,8 +1133,8 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
>   {
>   	int order;
>   
> -	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB\n",
> -		   mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20);
> +	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB, clear_free: %lluMiB\n",
> +		   mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20, mm->clear_avail >> 20);
>   
>   	for (order = mm->max_order; order >= 0; order--) {
>   		struct drm_buddy_block *block;
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index 0d735d5c2b35..942345548bc3 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -126,7 +126,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   	return 0;
>   
>   err_free_blocks:
> -	drm_buddy_free_list(mm, &bman_res->blocks);
> +	drm_buddy_free_list(mm, &bman_res->blocks, 0);
>   	mutex_unlock(&bman->lock);
>   err_free_res:
>   	ttm_resource_fini(man, &bman_res->base);
> @@ -141,7 +141,7 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>   
>   	mutex_lock(&bman->lock);
> -	drm_buddy_free_list(&bman->mm, &bman_res->blocks);
> +	drm_buddy_free_list(&bman->mm, &bman_res->blocks, 0);
>   	bman->visible_avail += bman_res->used_visible_size;
>   	mutex_unlock(&bman->lock);
>   
> @@ -345,7 +345,7 @@ int i915_ttm_buddy_man_fini(struct ttm_device *bdev, unsigned int type)
>   	ttm_set_driver_manager(bdev, type, NULL);
>   
>   	mutex_lock(&bman->lock);
> -	drm_buddy_free_list(mm, &bman->reserved);
> +	drm_buddy_free_list(mm, &bman->reserved, 0);
>   	drm_buddy_fini(mm);
>   	bman->visible_avail += bman->visible_reserved;
>   	WARN_ON_ONCE(bman->visible_avail != bman->visible_size);
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index e48863a44556..4621a860cb05 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -103,7 +103,7 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
>   							      DRM_BUDDY_RANGE_ALLOCATION),
>   				       "buddy_alloc i failed with bias(%x-%x), size=%u, ps=%u\n",
>   				       bias_start, bias_end, bias_size, bias_size);
> -		drm_buddy_free_list(&mm, &tmp);
> +		drm_buddy_free_list(&mm, &tmp, 0);
>   
>   		/* single page with internal round_up */
>   		KUNIT_ASSERT_FALSE_MSG(test,
> @@ -113,7 +113,7 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
>   							      DRM_BUDDY_RANGE_ALLOCATION),
>   				       "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
>   				       bias_start, bias_end, ps, bias_size);
> -		drm_buddy_free_list(&mm, &tmp);
> +		drm_buddy_free_list(&mm, &tmp, 0);
>   
>   		/* random size within */
>   		size = max(round_up(prandom_u32_state(&prng) % bias_rem, ps), ps);
> @@ -153,14 +153,14 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
>   			 * unallocated, and ideally not always on the bias
>   			 * boundaries.
>   			 */
> -			drm_buddy_free_list(&mm, &tmp);
> +			drm_buddy_free_list(&mm, &tmp, 0);
>   		} else {
>   			list_splice_tail(&tmp, &allocated);
>   		}
>   	}
>   
>   	kfree(order);
> -	drm_buddy_free_list(&mm, &allocated);
> +	drm_buddy_free_list(&mm, &allocated, 0);
>   	drm_buddy_fini(&mm);
>   
>   	/*
> @@ -220,7 +220,7 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
>   			      "buddy_alloc passed with bias(%x-%x), size=%u\n",
>   			      bias_start, bias_end, ps);
>   
> -	drm_buddy_free_list(&mm, &allocated);
> +	drm_buddy_free_list(&mm, &allocated, 0);
>   	drm_buddy_fini(&mm);
>   }
>   
> @@ -269,7 +269,7 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>   							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>   			       "buddy_alloc didn't error size=%lu\n", 3 * ps);
>   
> -	drm_buddy_free_list(&mm, &middle);
> +	drm_buddy_free_list(&mm, &middle, 0);
>   	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>   							   3 * ps, ps, &allocated,
>   							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> @@ -279,7 +279,7 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>   							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>   			       "buddy_alloc didn't error size=%lu\n", 2 * ps);
>   
> -	drm_buddy_free_list(&mm, &right);
> +	drm_buddy_free_list(&mm, &right, 0);
>   	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>   							   3 * ps, ps, &allocated,
>   							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> @@ -294,7 +294,7 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>   							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>   			       "buddy_alloc hit an error size=%lu\n", 2 * ps);
>   
> -	drm_buddy_free_list(&mm, &left);
> +	drm_buddy_free_list(&mm, &left, 0);
>   	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>   							    3 * ps, ps, &allocated,
>   							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> @@ -306,7 +306,7 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>   
>   	KUNIT_ASSERT_EQ(test, total, ps * 2 + ps * 3);
>   
> -	drm_buddy_free_list(&mm, &allocated);
> +	drm_buddy_free_list(&mm, &allocated, 0);
>   	drm_buddy_fini(&mm);
>   }
>   
> @@ -375,7 +375,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
>   							  top, max_order);
>   	}
>   
> -	drm_buddy_free_list(&mm, &holes);
> +	drm_buddy_free_list(&mm, &holes, 0);
>   
>   	/* Nothing larger than blocks of chunk_size now available */
>   	for (order = 1; order <= max_order; order++) {
> @@ -387,7 +387,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
>   	}
>   
>   	list_splice_tail(&holes, &blocks);
> -	drm_buddy_free_list(&mm, &blocks);
> +	drm_buddy_free_list(&mm, &blocks, 0);
>   	drm_buddy_fini(&mm);
>   }
>   
> @@ -482,7 +482,7 @@ static void drm_test_buddy_alloc_pessimistic(struct kunit *test)
>   
>   	list_del(&block->link);
>   	drm_buddy_free_block(&mm, block);
> -	drm_buddy_free_list(&mm, &blocks);
> +	drm_buddy_free_list(&mm, &blocks, 0);
>   	drm_buddy_fini(&mm);
>   }
>   
> @@ -528,7 +528,7 @@ static void drm_test_buddy_alloc_optimistic(struct kunit *test)
>   							   size, size, &tmp, flags),
>   						  "buddy_alloc unexpectedly succeeded, it should be full!");
>   
> -	drm_buddy_free_list(&mm, &blocks);
> +	drm_buddy_free_list(&mm, &blocks, 0);
>   	drm_buddy_fini(&mm);
>   }
>   
> @@ -563,7 +563,7 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
>   						drm_buddy_block_size(&mm, block),
>   						BIT_ULL(mm.max_order) * PAGE_SIZE);
>   
> -	drm_buddy_free_list(&mm, &allocated);
> +	drm_buddy_free_list(&mm, &allocated, 0);
>   	drm_buddy_fini(&mm);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 115ec745e502..1ad678b62c4a 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -196,7 +196,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   	return 0;
>   
>   error_free_blocks:
> -	drm_buddy_free_list(mm, &vres->blocks);
> +	drm_buddy_free_list(mm, &vres->blocks, 0);
>   	mutex_unlock(&mgr->lock);
>   error_fini:
>   	ttm_resource_fini(man, &vres->base);
> @@ -214,7 +214,7 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
>   	struct drm_buddy *mm = &mgr->mm;
>   
>   	mutex_lock(&mgr->lock);
> -	drm_buddy_free_list(mm, &vres->blocks);
> +	drm_buddy_free_list(mm, &vres->blocks, 0);
>   	mgr->visible_avail += vres->used_visible_size;
>   	mutex_unlock(&mgr->lock);
>   
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index a5b39fc01003..82570f77e817 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -25,6 +25,8 @@
>   #define DRM_BUDDY_RANGE_ALLOCATION		BIT(0)
>   #define DRM_BUDDY_TOPDOWN_ALLOCATION		BIT(1)
>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
> +#define DRM_BUDDY_CLEAR_ALLOCATION		BIT(3)
> +#define DRM_BUDDY_CLEARED			BIT(4)
>   
>   struct drm_buddy_block {
>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
> @@ -32,8 +34,9 @@ struct drm_buddy_block {
>   #define   DRM_BUDDY_ALLOCATED	   (1 << 10)
>   #define   DRM_BUDDY_FREE	   (2 << 10)
>   #define   DRM_BUDDY_SPLIT	   (3 << 10)
> +#define DRM_BUDDY_HEADER_CLEAR  GENMASK_ULL(9, 9)
>   /* Free to be used, if needed in the future */
> -#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(9, 6)
> +#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(8, 6)
>   #define DRM_BUDDY_HEADER_ORDER  GENMASK_ULL(5, 0)
>   	u64 header;
>   
> @@ -86,6 +89,7 @@ struct drm_buddy {
>   	u64 chunk_size;
>   	u64 size;
>   	u64 avail;
> +	u64 clear_avail;
>   };
>   
>   static inline u64
> @@ -112,6 +116,12 @@ drm_buddy_block_is_allocated(struct drm_buddy_block *block)
>   	return drm_buddy_block_state(block) == DRM_BUDDY_ALLOCATED;
>   }
>   
> +static inline bool
> +drm_buddy_block_is_clear(struct drm_buddy_block *block)
> +{
> +	return block->header & DRM_BUDDY_HEADER_CLEAR;
> +}
> +
>   static inline bool
>   drm_buddy_block_is_free(struct drm_buddy_block *block)
>   {
> @@ -150,7 +160,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   
>   void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
>   
> -void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects);
> +void drm_buddy_free_list(struct drm_buddy *mm,
> +			 struct list_head *objects,
> +			 unsigned int flags);
>   
>   void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
>   void drm_buddy_block_print(struct drm_buddy *mm,

