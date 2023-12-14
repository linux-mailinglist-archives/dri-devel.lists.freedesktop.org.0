Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F369813B4E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 21:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4DA10E99F;
	Thu, 14 Dec 2023 20:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BADF10E994;
 Thu, 14 Dec 2023 20:12:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J871For6ZtviDVzN2j3SmvKGzfURiNR1PT66HJpIPd9K9AWvZInmXhsnSok4BIHjOEYg77Pvg9DPb+GFgNp0YTME99FzPvFJp7oZCIHb4DvqvLwSBu9GMNtg8FRbKNkOFontvelqUbmXItYZ7wFwg7fR3mJfz9WJidXh3ZfC/yaLfLc3jYzeiO+Jjr6VeiDjpBi6FeOK+Zyf2+URdqgP/vQlJM7sIgesbCp0AVkfQZFpXtkLqBazvFaCLP50WiluO0JeAC+1eAsTldCkuRdXloSWmpYAykGb12vjGN5V2LRrc0sX3INZHKImg6smvANjnjNr8cMYCBC4QIxlCsm9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pETb8mqIq6oPr7xfxnaldu2DtORGsRku0doIX+LQN8k=;
 b=iBvHhBt2KNv4NFxA+K+jfIVNMpiK4L7ziS/DESr6mYlZvuTV9szkERUc9KbgT95DdoNiYHqUwhMaHkKaAr9KATviE8Xx2BOpjtj7buU9vnvTE4xxO2y/jpUikQg7heMEnxp5RwdFQqXmaN1f3dxwDFfU5nWtM3JsdhX7z/bLS9Hp9G7UNDrHWWsJh/MaApQaqJlvwR6GAnyLD3tucjH261uP48TffBGUT5TISrqQXV1D07Zzqg1GNhdqQBGCYqkL3WUOnohphLBPR6a4T8Fy86L78x2NubaoYX7XkSbngCvpJDow6xgwp9psSCSO4vRWDC8+f5jE/MxTrHuXwp2ExQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pETb8mqIq6oPr7xfxnaldu2DtORGsRku0doIX+LQN8k=;
 b=G5uXyguMQum9miDlhzBdPieBaUU3X0G2DATcTm6vr8idC4PjoGcTmx/JYPNyZpLgYjrrkOTaaWeKkyNZ2VIBCP0m2ID8hNQB02ca2l22vkOvghLGgXT7nSkkU/XmWAW29tBppl6BZ00omJKhAwGe2MFFjY+b25hpTMr2W8o8lXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN0PR12MB6365.namprd12.prod.outlook.com (2603:10b6:208:3c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 20:12:04 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3%5]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 20:12:04 +0000
Message-ID: <3fce4634-9cb5-43e7-a8f8-91ac722e8cf4@amd.com>
Date: Thu, 14 Dec 2023 15:11:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/amdgpu: Enable clear page functionality
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20231214134240.3183-1-Arunpravin.PaneerSelvam@amd.com>
 <20231214134240.3183-2-Arunpravin.PaneerSelvam@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20231214134240.3183-2-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0257.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::6) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MN0PR12MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eb31fc7-291f-4009-b3ce-08dbfce0f08a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BLJKOAYJ9KMYaTXC4SOAeyx8nWReIVtfbNmrvJHmcl0jMufbfyJzgBJjxStL02nusI3TimK2qw83+7WnHMGI9oEaJTf+auBbtuoga1QC+BOWl5coegIYYE9kTunnOPnEynlpGWo1waPbxxcdhAueONkBcmXH0X7mG+TA87DxnZVFyn0s8NUaLRSoua3U1TNxC3aKGap0vWiWtEeJgQMxGnYHrUTZL8wyi2bxVHLaMV0v87nEZ2jNOHBPS/9WtjRAgN4idhnEQLkc5s6kiuA0EoFq5aVTzLjHWqTYbK6taClLqtt7dybjlO0SghlBVviTBxFsm29dEOCg0g9t9Ey6EYec/8hfgn69y4Or0IJrCxjB+WDEXd5JeHtOwVI75Ekt3eQ0JJiOBE0AigcaVkLzmqA8ObTvptRiVp/EEdqxujN06fdMhjl02G80BILMeaG4fLiVu/3dT1bO3E9OtTTsvnLeQgiDws1I4Kw816CbSb64o89xMvHZlhtLsYdimUwFAkf7yq7CjRbSPko9VfuS2u/wL3FLLg8HuME18+HkgUGLvow5Y4ZQc7JYaZ0GS2XgDH5sDlkWZfs4Vfqm3bGPrmhwirhMhOIXjAlOvdh5hfFnLfIhg9mp3HnBxXqllsrGqyaXYGqafYj3idejr0P6Kg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(396003)(376002)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(31686004)(26005)(36916002)(66574015)(6506007)(2616005)(36756003)(31696002)(86362001)(38100700002)(5660300002)(83380400001)(4326008)(44832011)(6512007)(53546011)(6666004)(316002)(66946007)(8676002)(6486002)(8936002)(66556008)(66476007)(4001150100001)(41300700001)(2906002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlAyU0QwK0JnNFpBMlU3UVVMSFE5VXluWS9zV3h0RDdVWDBaTzJWUnZTVVhh?=
 =?utf-8?B?Qkxzb0c5eU14MHdlS1d2MC9wbVh3ekFWY0lteVJOOEl6M2Q4aVFDMGxGeW1l?=
 =?utf-8?B?cHhOWllZYkZBNHZnSWE1Rm1ON2NJYm5XeU91bkdHSU55V0VwZ2xJTURLSzNX?=
 =?utf-8?B?TVc0dHlMaUxFbmYwMmFoQkExTzNiZ0RHV0tVUk5LNGpVNnBEZ3E4VW8rdmNX?=
 =?utf-8?B?VHdSdytPQk0rY04vRjBYNXZabnkwYURGREs4Z2kvQnpTdjhYMEk2YWlYZ1Jr?=
 =?utf-8?B?RGNYVldZT096MWY3cE5uZENqRm53ak5ZTFA2cldMWWlIcjNJRThFVXJqN1Br?=
 =?utf-8?B?YjA2d214VEZTWEZJdkk5Yk1Gc2hPc01uMTdUM3Z4Ymh2VFU0Vk5KRzJaYjNI?=
 =?utf-8?B?U2trcEw2bWtEaSt0ZjdNZjZMeUdkaGlJMlg0Nm5xRjZ4RjUyTEEreVVPNjZj?=
 =?utf-8?B?SmRBeVJQLzFpRDlnMjViSVB5bWRrVzFpSlJXYlpLUzVQMkdsUTBMQndHN2l5?=
 =?utf-8?B?ZzNOS2lVdzV4Qi9lUnBrQ0lVTDlkd281eW9xYWdmQ2hUUUg0TXV4MjlDRnRR?=
 =?utf-8?B?TG5ZRHVoVnVUMGcvSUpwdytYZG5ZeEFZb0JHQWx4cWhGVHRRNG9URWZVKzg4?=
 =?utf-8?B?Q2pVWGNZL2Q5V21MQlY2WkJaelM5aUNxWWg2d2RpUEhyNFgyaGpKNnF0cVQv?=
 =?utf-8?B?WWNIOTVockx2cVk4aWNRbm5rVTRwQkkzSGQ5RHBRWVFHdTFGVlczR25TT3hs?=
 =?utf-8?B?WUFGL0lrMDI2QkFOSmczY0lpdk5LU1d5NDMrZ2ZteEo2Y2NDOTVKd1J3YWN4?=
 =?utf-8?B?THVmYmoxbmp1eFVTOE4xbUJhb0R5T0RzTVNJNmxPN0p0M25Na3l3ejFyV0pJ?=
 =?utf-8?B?WFE0c3lMeGdPcnkrMEtwNHFhVWx3cDRBRkhTV3pXbmY0OXltdU9ONHAwNXI3?=
 =?utf-8?B?RnhRUXFZczBCSXltV2lSUFZpbFVlMDhNZjRHa3k4Y3MvRlNUeWdJQk1rZWM4?=
 =?utf-8?B?NkNqVk1BbTNTc0lsU3JvZmNHRE0xZmJoSUxRcUNYenRHK0c1dlExYzVSZG9Y?=
 =?utf-8?B?eHFDci9NUmtEVkhyTGQweVdDMFJsY3FXcHpyNERZZk10ZTBmMDlRbnVoRkdJ?=
 =?utf-8?B?eTZVMTdRZlZmazNpUGFldDlWdVI5QjRvODE3QisrWFVMbnI3SnQvU29FZENT?=
 =?utf-8?B?VG5PRlQvR0xMNlpHUk9YdmpBbUhOTUVIVXpjOFFYYnVIQklIZUlQbUJUNy9i?=
 =?utf-8?B?bWdGWmxoWXg4VG9ZOURDTXh4ZlJYcTZGUHVCTGxHU1ZzYUxGRUNxb04xVmI5?=
 =?utf-8?B?cHFtYlZpbkIyeUp2Sk9mMlI5aU44NEV1SVF6eDJjdks1blFBQW5rVnNSQ0lL?=
 =?utf-8?B?MUZzS2EybEJGS3VYUnE0ODNLNUwxeDZidWxkeE1mdFRjU0JheHhRUGdCYTRx?=
 =?utf-8?B?bDlBL056VjEyL0d3OTdXaXdmeU9uT1VFNTZpbkNDWlZtRTFSalpNejhIZE5t?=
 =?utf-8?B?c3M0bU9MVWdQTVgxNGpQaElkYXovNmNxa2JIdVZJeitUaU90eGp4OEtWc08w?=
 =?utf-8?B?a2k4Tmpxa1ZMQTRJL1ZTb3RSaDM2d0NWSFBZaGRoaFJ5Z0NlODZ6cG9IZSs0?=
 =?utf-8?B?bGdoTG85YUFvMGJEWG9SUzl4YnZzcDFuVmRDREc4RUZySVVCQUoycnhwcU0y?=
 =?utf-8?B?S1BYM1NsaTVHb0FSS09sQU9uRzdZVmFIODBWTU9aWjRTZytUTXRmc3ViKytz?=
 =?utf-8?B?VkRRU0pQNllqeElqdHZKcXZrWUtZL1RHU0xjTU94T05CczZYaGhhYWRGSFNR?=
 =?utf-8?B?NWEwMm4rL21MWWt2REZsbitlUWhKaGgxQjNRR2dodllNdTJZT2NpTDhyZ3lV?=
 =?utf-8?B?YUE5MVNyeGJYQjh3blhURWlvU0JPTUdYV04zaEtGSSt5ck5waHJIOG9LaUc2?=
 =?utf-8?B?UDh0QVkyQ25oVTZqd0RXRXI3RlhGYzR4OFZGak95N2hMMkc5MzNoNkR4VTJa?=
 =?utf-8?B?VDQ5OFlaRXBZMGFKNmdOZzBBK21iRUdhM0g2bWhTVU5aaU1oYW1FT0orNFNI?=
 =?utf-8?B?UjhTeGdFY21rMjlDaklMd1NJUDlUbXh1TU9BdEhhejhOckdieDUvSUlqNnp4?=
 =?utf-8?Q?1FqFBrqS0Rg80iVGEdD+HaWCu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb31fc7-291f-4009-b3ce-08dbfce0f08a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 20:12:04.3256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 50XBrXL4EuhgzWHr/As5so7SAImHXgFtP2lAX9AyTYboGSzfuF74/0wS30PkJE28cSlHmZVzqP53P1++CDs5tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6365
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-12-14 08:42, Arunpravin Paneer Selvam wrote:
> Add clear page support in vram memory region.
>
> v1:(Christian)
>    - Dont handle clear page as TTM flag since when moving the BO back
>      in from GTT again we don't need that.
>    - Make a specialized version of amdgpu_fill_buffer() which only
>      clears the VRAM areas which are not already cleared
>    - Drop the TTM_PL_FLAG_WIPE_ON_RELEASE check in
>      amdgpu_object.c
>
> v2:
>    - Modify the function name amdgpu_ttm_* (Alex)
>    - Drop the delayed parameter (Christian)
>    - handle amdgpu_res_cleared(&cursor) just above the size
>      calculation (Christian)
>    - Use AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE for clearing the buffers
>      in the free path to properly wait for fences etc.. (Christian)
>
> v3:(Christian)
>    - Remove buffer clear code in VRAM manager instead change the
>      AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE handling to set
>      the DRM_BUDDY_CLEARED flag.
>    - Remove ! from amdgpu_res_cleared(&cursor) check.
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Christian König <christian.koenig@amd.com>

Acked-by: Felix Kuehling <felix.kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 22 ++++---
>   .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    | 25 ++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 61 ++++++++++++++++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  5 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  6 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  5 ++
>   6 files changed, 111 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index cef920a93924..be8bf375d823 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -39,6 +39,7 @@
>   #include "amdgpu.h"
>   #include "amdgpu_trace.h"
>   #include "amdgpu_amdkfd.h"
> +#include "amdgpu_vram_mgr.h"
>   
>   /**
>    * DOC: amdgpu_object
> @@ -598,8 +599,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>   	if (!amdgpu_bo_support_uswc(bo->flags))
>   		bo->flags &= ~AMDGPU_GEM_CREATE_CPU_GTT_USWC;
>   
> -	if (adev->ras_enabled)
> -		bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
> +	bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
>   
>   	bo->tbo.bdev = &adev->mman.bdev;
>   	if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA |
> @@ -629,15 +629,17 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>   
>   	if (bp->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED &&
>   	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
> -		struct dma_fence *fence;
> +		struct dma_fence *fence = NULL;
>   
> -		r = amdgpu_fill_buffer(bo, 0, bo->tbo.base.resv, &fence, true);
> +		r = amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &fence);
>   		if (unlikely(r))
>   			goto fail_unreserve;
>   
> -		dma_resv_add_fence(bo->tbo.base.resv, fence,
> -				   DMA_RESV_USAGE_KERNEL);
> -		dma_fence_put(fence);
> +		if (fence) {
> +			dma_resv_add_fence(bo->tbo.base.resv, fence,
> +					   DMA_RESV_USAGE_KERNEL);
> +			dma_fence_put(fence);
> +		}
>   	}
>   	if (!bp->resv)
>   		amdgpu_bo_unreserve(bo);
> @@ -1360,8 +1362,12 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>   	if (WARN_ON_ONCE(!dma_resv_trylock(bo->base.resv)))
>   		return;
>   
> -	r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, &fence, true);
> +	r = amdgpu_fill_buffer(abo, 0, bo->base.resv, &fence, true);
>   	if (!WARN_ON(r)) {
> +		struct amdgpu_vram_mgr_resource *vres;
> +
> +		vres = to_amdgpu_vram_mgr_resource(bo->resource);
> +		vres->flags |= DRM_BUDDY_CLEARED;
>   		amdgpu_bo_fence(abo, fence, false);
>   		dma_fence_put(fence);
>   	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> index 381101d2bf05..50fcd86e1033 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> @@ -164,4 +164,29 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
>   	}
>   }
>   
> +/**
> + * amdgpu_res_cleared - check if blocks are cleared
> + *
> + * @cur: the cursor to extract the block
> + *
> + * Check if the @cur block is cleared
> + */
> +static inline bool amdgpu_res_cleared(struct amdgpu_res_cursor *cur)
> +{
> +	struct drm_buddy_block *block;
> +
> +	switch (cur->mem_type) {
> +	case TTM_PL_VRAM:
> +		block = cur->node;
> +
> +		if (!amdgpu_vram_mgr_is_cleared(block))
> +			return false;
> +		break;
> +	default:
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 05991c5c8ddb..c63510f5cb0f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -383,11 +383,15 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>   	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
>   		struct dma_fence *wipe_fence = NULL;
>   
> -		r = amdgpu_fill_buffer(abo, AMDGPU_POISON, NULL, &wipe_fence,
> -					false);
> +		r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
> +				       false);
>   		if (r) {
>   			goto error;
>   		} else if (wipe_fence) {
> +			struct amdgpu_vram_mgr_resource *vres;
> +
> +			vres = to_amdgpu_vram_mgr_resource(bo->resource);
> +			vres->flags |= DRM_BUDDY_CLEARED;
>   			dma_fence_put(fence);
>   			fence = wipe_fence;
>   		}
> @@ -2222,6 +2226,59 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>   	return 0;
>   }
>   
> +int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
> +			    struct dma_resv *resv,
> +			    struct dma_fence **fence)
> +{
> +	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> +	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> +	struct amdgpu_res_cursor cursor;
> +	struct dma_fence *f = NULL;
> +	u64 addr;
> +	int r;
> +
> +	if (!adev->mman.buffer_funcs_enabled)
> +		return -EINVAL;
> +
> +	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
> +
> +	mutex_lock(&adev->mman.gtt_window_lock);
> +	while (cursor.remaining) {
> +		struct dma_fence *next = NULL;
> +		u64 size;
> +
> +		if (amdgpu_res_cleared(&cursor)) {
> +			amdgpu_res_next(&cursor, cursor.size);
> +			continue;
> +		}
> +
> +		/* Never clear more than 256MiB at once to avoid timeouts */
> +		size = min(cursor.size, 256ULL << 20);
> +
> +		r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &cursor,
> +					  1, ring, false, &size, &addr);
> +		if (r)
> +			goto err;
> +
> +		r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
> +					&next, true, true);
> +		if (r)
> +			goto err;
> +
> +		dma_fence_put(f);
> +		f = next;
> +
> +		amdgpu_res_next(&cursor, size);
> +	}
> +err:
> +	mutex_unlock(&adev->mman.gtt_window_lock);
> +	if (fence)
> +		*fence = dma_fence_get(f);
> +	dma_fence_put(f);
> +
> +	return r;
> +}
> +
>   int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>   			uint32_t src_data,
>   			struct dma_resv *resv,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 65ec82141a8e..b404d89d52e5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -38,8 +38,6 @@
>   #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
>   #define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	2
>   
> -#define AMDGPU_POISON	0xd0bed0be
> -
>   extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>   extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
>   
> @@ -155,6 +153,9 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>   			       uint64_t size, bool tmz,
>   			       struct dma_resv *resv,
>   			       struct dma_fence **f);
> +int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
> +			    struct dma_resv *resv,
> +			    struct dma_fence **fence);
>   int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>   			uint32_t src_data,
>   			struct dma_resv *resv,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index d0e199cc8f17..a25d2d511877 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -435,6 +435,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   {
>   	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>   	struct amdgpu_device *adev = to_amdgpu_device(mgr);
> +	struct amdgpu_bo *bo = ttm_to_amdgpu_bo(tbo);
>   	u64 vis_usage = 0, max_bytes, min_block_size;
>   	struct amdgpu_vram_mgr_resource *vres;
>   	u64 size, remaining_size, lpfn, fpfn;
> @@ -486,6 +487,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
>   		vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
>   
> +	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED)
> +		vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
> +
>   	if (fpfn || lpfn != mgr->mm.size)
>   		/* Allocate blocks in desired range */
>   		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
> @@ -589,7 +593,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>   
>   	amdgpu_vram_mgr_do_reserve(man);
>   
> -	drm_buddy_free_list(mm, &vres->blocks, 0);
> +	drm_buddy_free_list(mm, &vres->blocks, vres->flags);
>   	mutex_unlock(&mgr->lock);
>   
>   	atomic64_sub(vis_usage, &mgr->vis_usage);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> index 0e04e42cf809..8478522d7366 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> @@ -53,6 +53,11 @@ static inline u64 amdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
>   	return (u64)PAGE_SIZE << drm_buddy_block_order(block);
>   }
>   
> +static inline bool amdgpu_vram_mgr_is_cleared(struct drm_buddy_block *block)
> +{
> +	return drm_buddy_block_is_clear(block);
> +}
> +
>   static inline struct amdgpu_vram_mgr_resource *
>   to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
>   {
