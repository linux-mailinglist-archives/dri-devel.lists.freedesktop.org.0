Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2E987FD0E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 12:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1ACF10FA09;
	Tue, 19 Mar 2024 11:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="n9Jj++xq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2101.outbound.protection.outlook.com [40.107.237.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4F510FA09;
 Tue, 19 Mar 2024 11:41:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+uRc+N+4t1fo74NOR53otyd/4LrwFBnl/SdxAsibMpA8kLV7dKxQsPznxelhbD+ADoR7iak2wohChHRBAGd2PnqoMw9Vnc2O0mmxmpkm3pxUz2Zob32TodXZxXB36MUu7UzM9Q66V0gxPRqvCDIwjBgcVMi+5KpxEgH2eZFYLHkBoJBRfoYjOotKXNHGLxGnc+3BR5y6iFdsciL31RipDJg7xjXnZKxI3WakBhItBjjJlSvuACCbbBQgR0T170hR7ez20GoVnrnW88h8JQd0VG8gQC/s48l3dczlHhxtSFn1MZH6fxh2B73KvAPSLnmMNF3ZPL67D6oUhv0rsBq7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rl5AKslQk3XNBDClqdUMP8pYM796t1wrtG9zWj0sY8k=;
 b=ia4hp/4KFe452NZP827kCVufp5Lb2pvVMowTkfAQqmlfM0Z13Fr8xD9htWpMxVGAFsu5WbuJOBdjFGbhsRBBKfIjgYL3z0WDFDKhBKmYgP6upyJ2WsuRRxBGbxlyviU50iyqmJoGxMzpJBfe7+pEAe5UxFslhKfzt+NK8XPDD/05MH3lxxMsgwhMGVxZQ/BLVMRPLvBKbosTehpkvMIqjuT8qKcCHbwsh2P1GeVmnFclJxX7yQuIYBHtAKXNt1Xtx1yCUhLu4p3OAA53G+xsc1cwL5MRS2TRNWPgTfTdFwTv4FT2mf0eqCqPqqi5tCxULK/UtvrORnTLMRtBHRiFkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rl5AKslQk3XNBDClqdUMP8pYM796t1wrtG9zWj0sY8k=;
 b=n9Jj++xq8yxrJhvl4gy/gefatAihpIJdSehc4uhfZVH/+fSxkYPgF1UWf6BA24ZzzydkqIQhvzdFCjUrjOr9kUI05thrXrzHvMm0RFnOjJCtP0DOgb7+cHj3qPLDizQloJ6CgLv+nA69ZhywEErPuSX9XFzl0BOfvf0xJUkIumM=
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MW4PR12MB7216.namprd12.prod.outlook.com (2603:10b6:303:226::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Tue, 19 Mar
 2024 11:41:09 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6610:4b4b:1f3a:151b]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6610:4b4b:1f3a:151b%6]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 11:41:09 +0000
Message-ID: <3ecac135-62ae-460d-b268-dde9f1860d14@amd.com>
Date: Tue, 19 Mar 2024 17:11:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] drm/amdgpu: Enable clear page functionality
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 matthew.auld@intel.com, mario.limonciello@amd.com, felix.kuehling@amd.com
References: <20240318214058.2014-1-Arunpravin.PaneerSelvam@amd.com>
 <20240318214058.2014-2-Arunpravin.PaneerSelvam@amd.com>
 <b1fc43cf-699f-496d-a239-11a5b288292b@gmail.com>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <b1fc43cf-699f-496d-a239-11a5b288292b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::8) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|MW4PR12MB7216:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zy6/cszG5ToqCTvW70VMXwV1Nc5+WoMM4JWv3SdchPEBU735nnpf70Y3inzow0LiKBD9y5oqZK9aSoG25rdpk1DK68DJkGCkl1h1C1k6qf6NpADsMEQPbMae+kdJqlMPLyZ56h3bCj7MLhGizNyERAQevNANqUxGOgN4rwAnowr9/2yRIq8EEj7umGYYYJy7KiGQWAWyYi1rR9F67RqB1Wa52HfWRnJwPG94DGdb/+jyqQ56cUfQ+akbdPjiDL+O89Nx93Z1kjDYqe7Az5U090aK+A1UxIjaHOUras1bnj9N8EgEREuiw2vMW7RmMd3SjFUJwpSWqoUPiucdoIjFXmmkjRq/QTMxu1zGjI/HIqZ/3Lulqm/7uHuvrpRB+RR892MwxBpN8AFLeqpq6RpH1acwY/pcXjIZI2OF6OAJjISGWulrF4r1yffjlObbcj7zt4tuiWi8LNYXZXNk02msxbOH4KrzIyFwx6r1ij6ZpujBBGBiffH75AvakhmCpyD17qr9D4ed8Z5KNcZIrik/7K82bXbnf6x900CY2s/e6T2GAn5tO8L+pzCGP7LDgqfEnzbR9Jc60fzPjDRbQNzNtRagGWTWMg8PWFRDdWdNsPKyMqGgFcLcf37dY/pqVlQiMDCG+G80ufhvHI3kc/LIAo1Mz1tW34WYCO/ap31cllA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1hHc3ZXRzF6L1VKcnViTXRMZndjZTZLMEltQWxBRWkrYlFDV3Y3Qk5iM2VS?=
 =?utf-8?B?SHRWektLTUh0N2ljeXhPRmU1RlVPcVkweTQ4QVNjNkNOMmM5YmNwSzl6c1FC?=
 =?utf-8?B?ekM4d0hMM2diSHpqQ1MvVXlncUo3aDliUEdTa1F1T3MwaWQzZU9IR0JBVlR5?=
 =?utf-8?B?NzNEWmpOOHdSdTZjZ08xWlBEQ25UclBud2hNL0VGTndzOTNvTVNEVTlta0Vv?=
 =?utf-8?B?dzNvam9OVzhNQjNNWkdnSithNm5NcWNlVFBTaCtnVklTZ3dCbmJhcTdiQU9O?=
 =?utf-8?B?NnFHVDZDb1VQR2J3clpTamtCYjdPWWtyUE9WOU13dnk3c0ZGTFA1aXV5Q3hJ?=
 =?utf-8?B?ZUhNU1NqOEEvTmVEZXhqOFlEdkZWMmYwcE5HeHhFNEpaWXhpRURhckh3NnVl?=
 =?utf-8?B?dFFmd2RTRVc3WXFhdXZpNHlmb21TMGozeVVvK1VEdDRzUG1jMXhPTm1iZlJM?=
 =?utf-8?B?RGJPdUpMNWZoY2Fab3M3SHpva3JGeUw4aXd3bFNlSXJ4Wm95dzFDU1lxSDRZ?=
 =?utf-8?B?eGdVS0lzaUY5VEdUekVxU0FtSWRGejBLZEpMVlVrOEVmVzFWaXJKaUxKY2Rp?=
 =?utf-8?B?cjhxK1JCUVc4eVMrNC9VTDBZVnJUOUxOTDIrSHFFYmtITldvMTA3UWpuQlpK?=
 =?utf-8?B?ZnIrUjRKOHhheVB6Wm9Na2c3ZmVwZXVZWWs1STlOc3hObmlqcEpqU0xPc3p2?=
 =?utf-8?B?cFBDaHFLTCtMdkhXaTJldDZ6RzhveGJWTGVlQlMyMDFUakpSN016ektjRGNF?=
 =?utf-8?B?Q2tha2UvZHZBUXVqRmZNVVQzRUhrQ2toOUhRL1JoN2hvUmpTTmZHNnZheGt2?=
 =?utf-8?B?eDV3TlFza3hZNVBiNFZyb1RKVFFSUFJGV1drc2d2RVdjY1h0ZnJTQ2swS2Fz?=
 =?utf-8?B?ZWl3Z3krL1pyYzlUbUhoS0dVT2RjUFVnblZoaldPcUUxL3RjMlRvamlqRVNx?=
 =?utf-8?B?a2hkU0NpTVk3b0JvaDRRVTVpVkt5TWxDelh6SU53a2ZCOGRyUmhMMW14TFo0?=
 =?utf-8?B?YStDWnZSV3QzaXNZN0ZYdHU0dFdNNS9aWEE5Z0czaVFsY29idHJ1eHp4UmZM?=
 =?utf-8?B?OWtBUlNlcnl3Q2doTHJoR0RiOFRIVnZUWWhXaWpUMkZMbDhrNmo3eEsxNVlQ?=
 =?utf-8?B?UXBWUlVOd2FNejJBYmFvdWJDbG5YakhUR3BJNmdQQUJ2b2g0QnNEME9kd1M2?=
 =?utf-8?B?ZEZkdzUxc3o5TWhZbVF5emtXQkErdFhuRlFldHdRR0h0dXpGTEpQdDNyazRs?=
 =?utf-8?B?MHZ1R1Zhd1dYUC9KMGlWb0svVjZZK29adkYxM1hhby93eW50R1EyaXAzbGRH?=
 =?utf-8?B?Qkx4WEpGOXgzZllQRTE2bmVCb0tTV1M0ck1BTFI0eVhJUmZPd2hpMUc0cVpl?=
 =?utf-8?B?VVgwdjJOWHcxTWJTd1hva2pNdUVsY0QyQmU2T1c2N0JYQ0tFQ2tFSEY3UnVx?=
 =?utf-8?B?YkNMYU5ucEhSMkpicEVTWHI3c1hyNG9RMG11ZTYxalZFNytsaVdMTThscTBs?=
 =?utf-8?B?OWp3ZjRGbW4zUHlGaHRHWGxuYTdRZGc0NmtFS3cra1R2NS9yNFoxa2hhS1B1?=
 =?utf-8?B?RUFQam9kakVrZHpaZWh0NUtlRGdtczgyWUhFaVUwSGdRRmtZWUl3WnVodTJQ?=
 =?utf-8?B?c1VGTjZUK1lyU2FoQ0g2bUhQcmJyWWdNQ0ROY1lBKythQjhpekUvSExHUVdp?=
 =?utf-8?B?ZHpYak5QNklGTlNIRjQwcWJoaDQxT05qSXoxSmFCZVBweUpKWGNUeDhoaEU4?=
 =?utf-8?B?TEMzcGRhcXRmT25xdXl2WHJnL1BveUdFY09YTWM4UmNXVWdFcmUzUWRzaTlv?=
 =?utf-8?B?MjlWdWhBVVVZcEVWVUVNZmwzNnAwaE1BUmdGS3Z4V2sxRGlmUUtEbDdYU1Yz?=
 =?utf-8?B?dm1GZjFNNnVXZ3ljOWFoa1hJRStUcU5PeXVhcUhhL2tIcWRCcXdxcE5vSStH?=
 =?utf-8?B?UHViSDE4Nlc1Y0o0VmhBRU1tL3dwNUxkMHFnbEYweU5aTFUySmhpY05ITzhw?=
 =?utf-8?B?TWRrc2dRRUxOZ2tvMjhORHJyVlphV2kvWlBCNmUvVTdnbU9lbHM5Tm40NjNY?=
 =?utf-8?B?NDBSbEJ3SzlqUmtNeU1PQVZSUktDT0s5b3ZDT2c0MXBwdWlJTFkrQ2RuRDIz?=
 =?utf-8?Q?dl7D1dUM1bYYWJuaZqv1UmKti?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de23335b-951f-4d05-a084-08dc48097841
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 11:41:09.2426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZgDsWq5bExOHAjn+QBVZGyhge/RsT4KHeqeU5j5dZ1bfVRnK326fiGk8ltBZJ+ROWNW8DZfR3JY/S/uN/KvZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7216
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

Hi Christian,

On 3/19/2024 3:58 PM, Christian König wrote:
>
>
> Am 18.03.24 um 22:40 schrieb Arunpravin Paneer Selvam:
>> Add clear page support in vram memory region.
>>
>> v1(Christian):
>>    - Dont handle clear page as TTM flag since when moving the BO back
>>      in from GTT again we don't need that.
>>    - Make a specialized version of amdgpu_fill_buffer() which only
>>      clears the VRAM areas which are not already cleared
>>    - Drop the TTM_PL_FLAG_WIPE_ON_RELEASE check in
>>      amdgpu_object.c
>>
>> v2:
>>    - Modify the function name amdgpu_ttm_* (Alex)
>>    - Drop the delayed parameter (Christian)
>>    - handle amdgpu_res_cleared(&cursor) just above the size
>>      calculation (Christian)
>>    - Use AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE for clearing the buffers
>>      in the free path to properly wait for fences etc.. (Christian)
>>
>> v3(Christian):
>>    - Remove buffer clear code in VRAM manager instead change the
>>      AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE handling to set
>>      the DRM_BUDDY_CLEARED flag.
>>    - Remove ! from amdgpu_res_cleared(&cursor) check.
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Acked-by: Felix Kuehling <felix.kuehling@amd.com>
>
> Just a few nit picks below, but in general already looks good to me.
>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 22 ++++---
>>   .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    | 25 ++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 61 ++++++++++++++++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  5 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  6 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  5 ++
>>   6 files changed, 111 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index 8bc79924d171..c92d92b28a57 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -39,6 +39,7 @@
>>   #include "amdgpu.h"
>>   #include "amdgpu_trace.h"
>>   #include "amdgpu_amdkfd.h"
>> +#include "amdgpu_vram_mgr.h"
>>     /**
>>    * DOC: amdgpu_object
>> @@ -601,8 +602,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>>       if (!amdgpu_bo_support_uswc(bo->flags))
>>           bo->flags &= ~AMDGPU_GEM_CREATE_CPU_GTT_USWC;
>>   -    if (adev->ras_enabled)
>> -        bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
>> +    bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
>>         bo->tbo.bdev = &adev->mman.bdev;
>>       if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA |
>> @@ -632,15 +632,17 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>>         if (bp->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED &&
>>           bo->tbo.resource->mem_type == TTM_PL_VRAM) {
>> -        struct dma_fence *fence;
>> +        struct dma_fence *fence = NULL;
>>   -        r = amdgpu_fill_buffer(bo, 0, bo->tbo.base.resv, &fence, 
>> true);
>> +        r = amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &fence);
>>           if (unlikely(r))
>>               goto fail_unreserve;
>>   -        dma_resv_add_fence(bo->tbo.base.resv, fence,
>> -                   DMA_RESV_USAGE_KERNEL);
>> -        dma_fence_put(fence);
>> +        if (fence) {
>> +            dma_resv_add_fence(bo->tbo.base.resv, fence,
>> +                       DMA_RESV_USAGE_KERNEL);
>> +            dma_fence_put(fence);
>> +        }
>>       }
>>       if (!bp->resv)
>>           amdgpu_bo_unreserve(bo);
>> @@ -1365,8 +1367,12 @@ void amdgpu_bo_release_notify(struct 
>> ttm_buffer_object *bo)
>>       if (WARN_ON_ONCE(!dma_resv_trylock(bo->base.resv)))
>>           return;
>>   -    r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, 
>> &fence, true);
>> +    r = amdgpu_fill_buffer(abo, 0, bo->base.resv, &fence, true);
>>       if (!WARN_ON(r)) {
>> +        struct amdgpu_vram_mgr_resource *vres;
>> +
>> +        vres = to_amdgpu_vram_mgr_resource(bo->resource);
>> +        vres->flags |= DRM_BUDDY_CLEARED;
>
> Those lines should probably be in the VRAM manager.
This flag is set based on the amdgpu_fill_buffer() function return 
value, can we move the amdgpu_fill_buffer() function call and
DRM_BUDDY_CLEARED flag set lines to amdgpu_vram_mgr_del() in VRAM 
manager and does it require to wipe the VRAM buffers here as well
without setting the DRM_BUDDY_CLEARED.
>
>>           amdgpu_bo_fence(abo, fence, false);
>>           dma_fence_put(fence);
>>       }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>> index 381101d2bf05..50fcd86e1033 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>> @@ -164,4 +164,29 @@ static inline void amdgpu_res_next(struct 
>> amdgpu_res_cursor *cur, uint64_t size)
>>       }
>>   }
>>   +/**
>> + * amdgpu_res_cleared - check if blocks are cleared
>> + *
>> + * @cur: the cursor to extract the block
>> + *
>> + * Check if the @cur block is cleared
>> + */
>> +static inline bool amdgpu_res_cleared(struct amdgpu_res_cursor *cur)
>> +{
>> +    struct drm_buddy_block *block;
>> +
>> +    switch (cur->mem_type) {
>> +    case TTM_PL_VRAM:
>> +        block = cur->node;
>> +
>> +        if (!amdgpu_vram_mgr_is_cleared(block))
>> +            return false;
>> +        break;
>> +    default:
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 8722beba494e..bcbffe909b47 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -378,11 +378,15 @@ static int amdgpu_move_blit(struct 
>> ttm_buffer_object *bo,
>>           (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
>>           struct dma_fence *wipe_fence = NULL;
>>   -        r = amdgpu_fill_buffer(abo, AMDGPU_POISON, NULL, &wipe_fence,
>> -                    false);
>> +        r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
>> +                       false);
>>           if (r) {
>>               goto error;
>>           } else if (wipe_fence) {
>> +            struct amdgpu_vram_mgr_resource *vres;
>> +
>> +            vres = to_amdgpu_vram_mgr_resource(bo->resource);
>> +            vres->flags |= DRM_BUDDY_CLEARED;
Does it require to set the DRM_BUDDY_CLEARED flag as we are not freeing 
the VRAM buffers?
>>               dma_fence_put(fence);
>>               fence = wipe_fence;
>>           }
>> @@ -2214,6 +2218,59 @@ static int amdgpu_ttm_fill_mem(struct 
>> amdgpu_ring *ring, uint32_t src_data,
>>       return 0;
>>   }
>
> Some kerneldoc here what the function does would ne nice to have.
>
>> +int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>> +                struct dma_resv *resv,
>> +                struct dma_fence **fence)
>> +{
>> +    struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>> +    struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>> +    struct amdgpu_res_cursor cursor;
>> +    struct dma_fence *f = NULL;
>
> It might be cleaner to just use the stub fence here (see 
> dma_fence_get_stub()).
>
> This would avoid to local variable init in the caller and the if which 
> checks if the function returned a fence or not.
>
>> +    u64 addr;
>> +    int r;
>> +
>> +    if (!adev->mman.buffer_funcs_enabled)
>> +        return -EINVAL;
>> +
>> +    amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
>> +
>> +    mutex_lock(&adev->mman.gtt_window_lock);
>> +    while (cursor.remaining) {
>> +        struct dma_fence *next = NULL;
>> +        u64 size;
>> +
>> +        if (amdgpu_res_cleared(&cursor)) {
>> +            amdgpu_res_next(&cursor, cursor.size);
>> +            continue;
>> +        }
>> +
>> +        /* Never clear more than 256MiB at once to avoid timeouts */
>> +        size = min(cursor.size, 256ULL << 20);
>> +
>> +        r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &cursor,
>> +                      1, ring, false, &size, &addr);
>> +        if (r)
>> +            goto err;
>> +
>> +        r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
>> +                    &next, true, true);
>> +        if (r)
>> +            goto err;
>> +
>> +        dma_fence_put(f);
>> +        f = next;
>> +
>> +        amdgpu_res_next(&cursor, size);
>> +    }
>> +err:
>> +    mutex_unlock(&adev->mman.gtt_window_lock);
>> +    if (fence)
>
> Just make fence a mandatory parameter and drop the if and the get/put 
> dance.
>
>> +        *fence = dma_fence_get(f);
>> +    dma_fence_put(f);
>> +
>> +    return r;
>> +}
>> +
>>   int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>               uint32_t src_data,
>>               struct dma_resv *resv,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> index 65ec82141a8e..b404d89d52e5 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> @@ -38,8 +38,6 @@
>>   #define AMDGPU_GTT_MAX_TRANSFER_SIZE    512
>>   #define AMDGPU_GTT_NUM_TRANSFER_WINDOWS    2
>>   -#define AMDGPU_POISON    0xd0bed0be
>> -
>>   extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>>   extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
>>   @@ -155,6 +153,9 @@ int amdgpu_ttm_copy_mem_to_mem(struct 
>> amdgpu_device *adev,
>>                      uint64_t size, bool tmz,
>>                      struct dma_resv *resv,
>>                      struct dma_fence **f);
>> +int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>> +                struct dma_resv *resv,
>> +                struct dma_fence **fence);
>>   int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>               uint32_t src_data,
>>               struct dma_resv *resv,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> index c0c851409241..e494f5bf136a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> @@ -450,6 +450,7 @@ static int amdgpu_vram_mgr_new(struct 
>> ttm_resource_manager *man,
>>   {
>>       struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>>       struct amdgpu_device *adev = to_amdgpu_device(mgr);
>> +    struct amdgpu_bo *bo = ttm_to_amdgpu_bo(tbo);
>>       u64 vis_usage = 0, max_bytes, min_block_size;
>>       struct amdgpu_vram_mgr_resource *vres;
>>       u64 size, remaining_size, lpfn, fpfn;
>> @@ -501,6 +502,9 @@ static int amdgpu_vram_mgr_new(struct 
>> ttm_resource_manager *man,
>>       if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
>>           vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
>>   +    if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED)
>> +        vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
>> +
>
> Mhm, you should probably *not* store this flags in the vres structure.
>
> As soon as the BO is used the VRAM wouldn't be cleared any more.
>
> Regards,
> Christian.
>
>>       if (fpfn || lpfn != mgr->mm.size)
>>           /* Allocate blocks in desired range */
>>           vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>> @@ -604,7 +608,7 @@ static void amdgpu_vram_mgr_del(struct 
>> ttm_resource_manager *man,
>>         amdgpu_vram_mgr_do_reserve(man);
>>   -    drm_buddy_free_list(mm, &vres->blocks, 0);
>> +    drm_buddy_free_list(mm, &vres->blocks, vres->flags);
>>       mutex_unlock(&mgr->lock);
>>         atomic64_sub(vis_usage, &mgr->vis_usage);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>> index 0e04e42cf809..8478522d7366 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>> @@ -53,6 +53,11 @@ static inline u64 
>> amdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
>>       return (u64)PAGE_SIZE << drm_buddy_block_order(block);
>>   }
>>   +static inline bool amdgpu_vram_mgr_is_cleared(struct 
>> drm_buddy_block *block)
>> +{
>> +    return drm_buddy_block_is_clear(block);
>> +}
>> +
>>   static inline struct amdgpu_vram_mgr_resource *
>>   to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
>>   {
>

