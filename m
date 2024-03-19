Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7BF87FF27
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 14:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC7D10F672;
	Tue, 19 Mar 2024 13:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aqybE5a1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2129.outbound.protection.outlook.com [40.107.220.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE3110F672;
 Tue, 19 Mar 2024 13:57:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDs/W+keZwmrcv+ZoWE1hw5M2SoDQJSP3GV8RCUMHJt/IHExGO+e7vCCU4lCaJPaGw7S6DeeXjp7iQsCWkRn349eQrliO09cHlvSUGwIs9EqGBDFwyiL3dtli+rwzhbXeuC/Ck4ucmjdn78sXc66VRlORzQnyo4/earPWfWWOUF1T57p4dhasTGIKqPp+txHfOCet3lWGh7bzIwia8L1mQPx0oMckYPMqsQMgb3GziFt+Bm+88JoCDoZlfECmEE2FCC43TVtcsPBfyELLCPcmUHPDe/FxUWpY6dzcKGFtIRmSAFjNlX4yYli+pipKHY65Vx8ouuF5I08mEUCybZNsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2cNOiP+IEOA7Xk43n2QHu1GgEpPJQdoBWOqwgUolt8=;
 b=UnLxiU4ZlKFtBTZiwzavdXTbntGavxkmb6Owd5K8+l7q83cJPHNwi4hEJf4KZFfmioCOjpGGzcdE0jPmQtCVV68UVlN3g/djqo7XbkyQbS8oQZBjS85pML+pD8hPECrsWjAPxMjJwdRUrIx4kJbFk4zHjWeIGdzNTk5eRMd/JnNabB8h/BHGDJ0+MhT285V6EMSRRFhmLM3Ta3LITZevrFPRjuBFlACbHYrO0wuH1rB+W5RnachcuJaaDJtNrhuqClT4qYp1YHLaDGMtGDbN2pkfB+50zd+PQ+/DEcm7wu+u2tMHIUM5kjf73aeFgG0mhGD3g9O+9D3RqGlhqAwwzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2cNOiP+IEOA7Xk43n2QHu1GgEpPJQdoBWOqwgUolt8=;
 b=aqybE5a1+O/wSOUXqBFCLLJtf6ZtHDBA8JXD3s1AtkEN/YkoskSMz5DAK1srBZncek3vprd0Lqla3+JF6FEC8bhiIyWDcIX39oRpU1NQUsLDZNG7b2PNSsC71DTnROgHe5Kj3GCyt/ICAKsSQKlbwy0fxpgQGbC0RJkjL38UWx8=
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MW5PR12MB5622.namprd12.prod.outlook.com (2603:10b6:303:198::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Tue, 19 Mar
 2024 13:57:19 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6610:4b4b:1f3a:151b]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6610:4b4b:1f3a:151b%6]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 13:57:19 +0000
Message-ID: <8cf30903-6993-410d-9dab-d6f68cefdd94@amd.com>
Date: Tue, 19 Mar 2024 19:27:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] drm/amdgpu: Enable clear page functionality
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, matthew.auld@intel.com,
 mario.limonciello@amd.com, felix.kuehling@amd.com
References: <20240318214058.2014-1-Arunpravin.PaneerSelvam@amd.com>
 <20240318214058.2014-2-Arunpravin.PaneerSelvam@amd.com>
 <b1fc43cf-699f-496d-a239-11a5b288292b@gmail.com>
 <3ecac135-62ae-460d-b268-dde9f1860d14@amd.com>
 <9c362ae3-b9e3-40ac-b8e4-382aeb287b45@amd.com>
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <9c362ae3-b9e3-40ac-b8e4-382aeb287b45@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::7) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|MW5PR12MB5622:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mRXR7AYSMSoj07ol9ctx1WH7Tr2mSseQXFh5q1UcVFmU1/1jpH8h+8uan2sWo8hG9XVo1gNGqCpuNYs+AaDTpvUYInfjafogg1zS2DEAF91pPl5xvmSy5Bbz0tFkVRWkIl6x/8XafKZGxsJqp+6sKRpMARb4p1f/VSD5qy+t7rn30Q841fqvt7mvhIgh3G3/DBxDsLRFlLKJVoWu1FYMb1Mp3nXMDzj1baB+5Q4XLeUI47gUCyAfx99LDtcyMZPF6Pal3I8BrDyujMkD7kUwAwZP2Q6AVE+xYCfs1evRDjr/q/OwReEVgqfkoS29wprHTNi/Ev/PNfpYYWDh9Pql8k/8rJ2ym4oFV+tmw6yBZNfNPG9cKv4uCFRHdjqSNhVNdKYoFRhUPOKpyelPUlbE/+1e891nuevhbR20rU6bLdodD3NUVXHUuIZY7t0QXY82y4f1gIQ0mi08yaRaMEIPZbbFIwXfKKTpf8MMMBn/h6490/tDR1cAfgfGo+IeqZiXFCgXO1GmA8nrgmWLKXz8MSMVTVaYyep5GxEebiHrLj9gqnZoICRVl2A5SCKbsA5cEtkX4EOqME3fc1wEPlc5Pa703wlg4nA6fd9T6xT/zZz7bWbzAfvaQMq787BSOG5k4J4MDfuJ4xpIsCidRQx6GviKq2WbHDtkUTc8UA0nSfM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekFNaGVONWIwenhmOVU3TWVabmM0eHJOYjZndlduS21aME90c3RqRkY4Z3g0?=
 =?utf-8?B?aDJyQlM1UHpoY0hPRWZPRTIza3ZVVFhLS01qSmVxL1J3Sy8wSG50eEVMTGFz?=
 =?utf-8?B?ZHR4YmpVWEU2S3JiRlRRcnNRbEcrRDV5NytFRXdNWDJsZ2VnWVY2N1IrZnBS?=
 =?utf-8?B?blBuRlpsTkphLzJHOEZUN012RHVrV2pWWlQ3Q21TakJQNXlrOUtrUDFBQnlM?=
 =?utf-8?B?SGVQQXg0UDlIdG9mWWJSdmtVMUUyRDRPZXdEc1lIVFFnY1FRNXlZYjRVVHlF?=
 =?utf-8?B?Z1dkL3FkUWZVdnhRVkVCY1RzL2R3TGFMZ1ZqRlV3cGQrRWRueXNITWp5dC8x?=
 =?utf-8?B?eVJhenJRQWFvdFZXZEJBOGowR1JPM3ZlSXMvZ3U1VmRxd25BclZ2QjhTaEIx?=
 =?utf-8?B?Um9pYzZyMi8yM1ZhbVVrb0hieWlaZ3FkUjNiZkJyUmoxYmcybHBxbFlQTDFF?=
 =?utf-8?B?RG5PZHNIMTFQS1pPZjVDNEVBbUUzNGd4YXUyc0swcFBpQ015a29jVC9TWFVm?=
 =?utf-8?B?aThSUlBYWld5dktENUtLWnNvYm5ZSzNaaVMvUTRHMFhJWTRKbzJJa0taNHEw?=
 =?utf-8?B?K2JHOGZzdGFMT2QyYnoyREc4cm8zU1BVRlQweFRoSzhwYjQ4VDEvVFNwRE5B?=
 =?utf-8?B?bmRHN2lUV0c5MmRKWi9ISEIvditQaDBkbitNYTE0UDdTR2hXWjNrL09qRGNr?=
 =?utf-8?B?ci8rK0p0SHZFVjhlS2lwK1ljQVRvTlhMS29QY2Nrc0pyZU1lenNieE1teU8z?=
 =?utf-8?B?MVVsVUg0QkJKa21iaGp2Qlc1aG0ranZUajRVdEVkamFuU0xvSW9KK0VPOUV1?=
 =?utf-8?B?V0FqcFJTQ3pOeVVQYzlBNHlLRXFFamtqckZIdWZiSkRVNW8yQTBjaFdoUnlu?=
 =?utf-8?B?dmRuVUJRQXFybTFpQkZaQjNqWGI1VmNMKzFrVC9rb2JBNkcrYzVnYTFhTmFB?=
 =?utf-8?B?cUVraFUyMk9tTmRYYnEzUldYbkdXZXV4UFhlMDFqUS9HV3cwamd2OVJZcm55?=
 =?utf-8?B?TUJ5MC9MNk9nK1gxbDU5eFdwa09oTnd2SFl6TzB5UUNWVjdaV1hoVk5uRy8v?=
 =?utf-8?B?bFVuUzd0TTRQUlZhWlB0NDhWZThEeTNaR0FDMlVJM0FIdS9USktsWC9hNkJZ?=
 =?utf-8?B?Rjg1R3NmNThyN2M1Ty84L2M1Y3oyWWpDTStXc0hTSTBwQTZHeHhhNE9QRjN0?=
 =?utf-8?B?YThZYUZmblVldGZRWFQvTTVUR1ZWZjNIeEdlRWdmQ3NRTGRabG90V0pERlM4?=
 =?utf-8?B?cUUrTGQzblA1V21GZXFUUWxoUnJiSEZmMFJQM3pWTEJJZCsyVFdPS2YveTdI?=
 =?utf-8?B?SGYxc1owZHkvYTNpZlMrc2pVYk8vZVZlQTk3bWRYdTk2RWVMcURzTi9zUU4w?=
 =?utf-8?B?U1dtS3FIaHlFTEtyL25HTGtiU2JSUUJOQW9CY1hYTjRTNXY0eDZ5QmN4SjA1?=
 =?utf-8?B?NzA2bDBsd1JDVTNRTEJnWFRuaTMxKzZJSEJaUEpZbG9RNW04Ung2Q05zT1lL?=
 =?utf-8?B?aU10M2tXcWdsS2Jka0t0bmphY2FhYUk4bFU0bHkrcVJNQllUclpNNzRjRWlN?=
 =?utf-8?B?cGMzZ0M1VE1EZzduajlWaGJpZXFNNUxhbzgvc0x4RGRNV1NPblozTEhoOW9K?=
 =?utf-8?B?NkpWSlM2MkZVdzR2bHEzcThUM04zcXNTbmQ0YzZtWk5qZ1FHMFRXcEpYOE42?=
 =?utf-8?B?NDV6SzBsRFpyTFVSRjZCa05JOUVDZXE0V0owTk9DbzA5K29ZazZ3WVJiUDdx?=
 =?utf-8?B?VTIvZnZzSHlmd09kNmtGc1dtNFNjeVdpS0twNVh2UUNOUTJCVys4WEF0clg0?=
 =?utf-8?B?aGpISmpjYS9rY2ZROWtaWDRadzFMcE93Wlo4VGpqMjIrZTEvQUlVSjFENTYr?=
 =?utf-8?B?SFR1cE5IMWVhelprc3M5S3E0eDFyYWhHRkFTYW1Ic3grbk1yTUhKWkdMMkJ1?=
 =?utf-8?B?bmw1am9KNThGZzIraFU5S2w4akRYM1h5OGkwSWJHRVVaTlZvZGtPWTEzZUFR?=
 =?utf-8?B?S2sxbmJiUW1CV0x4OEpUNlFqZWdvQlgwODRpVENQTDZLWWdrZjNlcDVGaHBV?=
 =?utf-8?B?R0xzSjltZVdKU1FkQUVwNmFGS3B4MngxSlRkdWRjR2RybDNRVU1aT1dTazZo?=
 =?utf-8?Q?6YG2A3edfts/r4rPLgaBAvSEj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe83e8e-6ba6-4f22-9282-08dc481c7dcb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 13:57:18.9813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5yVYA8Jz+U79saCQdZhKDBnbaW/wYRuPfLCBnWiHSuJONCZg9C3HT/NeeWgVcgXfoWViGWnHYuPkb+iRwuIGXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622
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

On 3/19/2024 7:17 PM, Christian König wrote:
> Am 19.03.24 um 12:41 schrieb Paneer Selvam, Arunpravin:
>> Hi Christian,
>>
>> On 3/19/2024 3:58 PM, Christian König wrote:
>>>
>>>
>>> Am 18.03.24 um 22:40 schrieb Arunpravin Paneer Selvam:
>>>> Add clear page support in vram memory region.
>>>>
>>>> v1(Christian):
>>>>    - Dont handle clear page as TTM flag since when moving the BO back
>>>>      in from GTT again we don't need that.
>>>>    - Make a specialized version of amdgpu_fill_buffer() which only
>>>>      clears the VRAM areas which are not already cleared
>>>>    - Drop the TTM_PL_FLAG_WIPE_ON_RELEASE check in
>>>>      amdgpu_object.c
>>>>
>>>> v2:
>>>>    - Modify the function name amdgpu_ttm_* (Alex)
>>>>    - Drop the delayed parameter (Christian)
>>>>    - handle amdgpu_res_cleared(&cursor) just above the size
>>>>      calculation (Christian)
>>>>    - Use AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE for clearing the 
>>>> buffers
>>>>      in the free path to properly wait for fences etc.. (Christian)
>>>>
>>>> v3(Christian):
>>>>    - Remove buffer clear code in VRAM manager instead change the
>>>>      AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE handling to set
>>>>      the DRM_BUDDY_CLEARED flag.
>>>>    - Remove ! from amdgpu_res_cleared(&cursor) check.
>>>>
>>>> Signed-off-by: Arunpravin Paneer Selvam 
>>>> <Arunpravin.PaneerSelvam@amd.com>
>>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>>> Acked-by: Felix Kuehling <felix.kuehling@amd.com>
>>>
>>> Just a few nit picks below, but in general already looks good to me.
>>>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 22 ++++---
>>>>   .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    | 25 ++++++++
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 61 
>>>> ++++++++++++++++++-
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  5 +-
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  6 +-
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  5 ++
>>>>   6 files changed, 111 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>> index 8bc79924d171..c92d92b28a57 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>> @@ -39,6 +39,7 @@
>>>>   #include "amdgpu.h"
>>>>   #include "amdgpu_trace.h"
>>>>   #include "amdgpu_amdkfd.h"
>>>> +#include "amdgpu_vram_mgr.h"
>>>>     /**
>>>>    * DOC: amdgpu_object
>>>> @@ -601,8 +602,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>>>>       if (!amdgpu_bo_support_uswc(bo->flags))
>>>>           bo->flags &= ~AMDGPU_GEM_CREATE_CPU_GTT_USWC;
>>>>   -    if (adev->ras_enabled)
>>>> -        bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
>>>> +    bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
>>>>         bo->tbo.bdev = &adev->mman.bdev;
>>>>       if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA |
>>>> @@ -632,15 +632,17 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>>>>         if (bp->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED &&
>>>>           bo->tbo.resource->mem_type == TTM_PL_VRAM) {
>>>> -        struct dma_fence *fence;
>>>> +        struct dma_fence *fence = NULL;
>>>>   -        r = amdgpu_fill_buffer(bo, 0, bo->tbo.base.resv, &fence, 
>>>> true);
>>>> +        r = amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &fence);
>>>>           if (unlikely(r))
>>>>               goto fail_unreserve;
>>>>   -        dma_resv_add_fence(bo->tbo.base.resv, fence,
>>>> -                   DMA_RESV_USAGE_KERNEL);
>>>> -        dma_fence_put(fence);
>>>> +        if (fence) {
>>>> +            dma_resv_add_fence(bo->tbo.base.resv, fence,
>>>> +                       DMA_RESV_USAGE_KERNEL);
>>>> +            dma_fence_put(fence);
>>>> +        }
>>>>       }
>>>>       if (!bp->resv)
>>>>           amdgpu_bo_unreserve(bo);
>>>> @@ -1365,8 +1367,12 @@ void amdgpu_bo_release_notify(struct 
>>>> ttm_buffer_object *bo)
>>>>       if (WARN_ON_ONCE(!dma_resv_trylock(bo->base.resv)))
>>>>           return;
>>>>   -    r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, 
>>>> &fence, true);
>>>> +    r = amdgpu_fill_buffer(abo, 0, bo->base.resv, &fence, true);
>>>>       if (!WARN_ON(r)) {
>>>> +        struct amdgpu_vram_mgr_resource *vres;
>>>> +
>>>> +        vres = to_amdgpu_vram_mgr_resource(bo->resource);
>>>> +        vres->flags |= DRM_BUDDY_CLEARED;
>>>
>>> Those lines should probably be in the VRAM manager.
>> This flag is set based on the amdgpu_fill_buffer() function return 
>> value, can we move the amdgpu_fill_buffer() function call and
>> DRM_BUDDY_CLEARED flag set lines to amdgpu_vram_mgr_del() in VRAM 
>> manager and does it require to wipe the VRAM buffers here as well
>> without setting the DRM_BUDDY_CLEARED.
>
> No that won't work. The call to amdgpu_fill_buffer() *must* be here 
> because that here is called before the resource is actually freed.
>
> Only setting the vres->flags should probably be moved into 
> amdgpu_vram_mgr.c.
>
> So instead of calling that manually here just make a function for it 
> to keep the code related to the buddy allocator in one place.
I got it, Thanks.

Regards,
Arun.
>
> Regards,
> Christian.
>
>>>
>>>>           amdgpu_bo_fence(abo, fence, false);
>>>>           dma_fence_put(fence);
>>>>       }
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>>>> index 381101d2bf05..50fcd86e1033 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>>>> @@ -164,4 +164,29 @@ static inline void amdgpu_res_next(struct 
>>>> amdgpu_res_cursor *cur, uint64_t size)
>>>>       }
>>>>   }
>>>>   +/**
>>>> + * amdgpu_res_cleared - check if blocks are cleared
>>>> + *
>>>> + * @cur: the cursor to extract the block
>>>> + *
>>>> + * Check if the @cur block is cleared
>>>> + */
>>>> +static inline bool amdgpu_res_cleared(struct amdgpu_res_cursor *cur)
>>>> +{
>>>> +    struct drm_buddy_block *block;
>>>> +
>>>> +    switch (cur->mem_type) {
>>>> +    case TTM_PL_VRAM:
>>>> +        block = cur->node;
>>>> +
>>>> +        if (!amdgpu_vram_mgr_is_cleared(block))
>>>> +            return false;
>>>> +        break;
>>>> +    default:
>>>> +        return false;
>>>> +    }
>>>> +
>>>> +    return true;
>>>> +}
>>>> +
>>>>   #endif
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> index 8722beba494e..bcbffe909b47 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> @@ -378,11 +378,15 @@ static int amdgpu_move_blit(struct 
>>>> ttm_buffer_object *bo,
>>>>           (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
>>>>           struct dma_fence *wipe_fence = NULL;
>>>>   -        r = amdgpu_fill_buffer(abo, AMDGPU_POISON, NULL, 
>>>> &wipe_fence,
>>>> -                    false);
>>>> +        r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
>>>> +                       false);
>>>>           if (r) {
>>>>               goto error;
>>>>           } else if (wipe_fence) {
>>>> +            struct amdgpu_vram_mgr_resource *vres;
>>>> +
>>>> +            vres = to_amdgpu_vram_mgr_resource(bo->resource);
>>>> +            vres->flags |= DRM_BUDDY_CLEARED;
>> Does it require to set the DRM_BUDDY_CLEARED flag as we are not 
>> freeing the VRAM buffers?
>>>>               dma_fence_put(fence);
>>>>               fence = wipe_fence;
>>>>           }
>>>> @@ -2214,6 +2218,59 @@ static int amdgpu_ttm_fill_mem(struct 
>>>> amdgpu_ring *ring, uint32_t src_data,
>>>>       return 0;
>>>>   }
>>>
>>> Some kerneldoc here what the function does would ne nice to have.
>>>
>>>> +int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>>> +                struct dma_resv *resv,
>>>> +                struct dma_fence **fence)
>>>> +{
>>>> +    struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>>> +    struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>>>> +    struct amdgpu_res_cursor cursor;
>>>> +    struct dma_fence *f = NULL;
>>>
>>> It might be cleaner to just use the stub fence here (see 
>>> dma_fence_get_stub()).
>>>
>>> This would avoid to local variable init in the caller and the if 
>>> which checks if the function returned a fence or not.
>>>
>>>> +    u64 addr;
>>>> +    int r;
>>>> +
>>>> +    if (!adev->mman.buffer_funcs_enabled)
>>>> +        return -EINVAL;
>>>> +
>>>> +    amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), 
>>>> &cursor);
>>>> +
>>>> +    mutex_lock(&adev->mman.gtt_window_lock);
>>>> +    while (cursor.remaining) {
>>>> +        struct dma_fence *next = NULL;
>>>> +        u64 size;
>>>> +
>>>> +        if (amdgpu_res_cleared(&cursor)) {
>>>> +            amdgpu_res_next(&cursor, cursor.size);
>>>> +            continue;
>>>> +        }
>>>> +
>>>> +        /* Never clear more than 256MiB at once to avoid timeouts */
>>>> +        size = min(cursor.size, 256ULL << 20);
>>>> +
>>>> +        r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, 
>>>> &cursor,
>>>> +                      1, ring, false, &size, &addr);
>>>> +        if (r)
>>>> +            goto err;
>>>> +
>>>> +        r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
>>>> +                    &next, true, true);
>>>> +        if (r)
>>>> +            goto err;
>>>> +
>>>> +        dma_fence_put(f);
>>>> +        f = next;
>>>> +
>>>> +        amdgpu_res_next(&cursor, size);
>>>> +    }
>>>> +err:
>>>> +    mutex_unlock(&adev->mman.gtt_window_lock);
>>>> +    if (fence)
>>>
>>> Just make fence a mandatory parameter and drop the if and the 
>>> get/put dance.
>>>
>>>> +        *fence = dma_fence_get(f);
>>>> +    dma_fence_put(f);
>>>> +
>>>> +    return r;
>>>> +}
>>>> +
>>>>   int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>>>               uint32_t src_data,
>>>>               struct dma_resv *resv,
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>> index 65ec82141a8e..b404d89d52e5 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>> @@ -38,8 +38,6 @@
>>>>   #define AMDGPU_GTT_MAX_TRANSFER_SIZE    512
>>>>   #define AMDGPU_GTT_NUM_TRANSFER_WINDOWS    2
>>>>   -#define AMDGPU_POISON    0xd0bed0be
>>>> -
>>>>   extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>>>>   extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
>>>>   @@ -155,6 +153,9 @@ int amdgpu_ttm_copy_mem_to_mem(struct 
>>>> amdgpu_device *adev,
>>>>                      uint64_t size, bool tmz,
>>>>                      struct dma_resv *resv,
>>>>                      struct dma_fence **f);
>>>> +int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>>> +                struct dma_resv *resv,
>>>> +                struct dma_fence **fence);
>>>>   int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>>>               uint32_t src_data,
>>>>               struct dma_resv *resv,
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>> index c0c851409241..e494f5bf136a 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>> @@ -450,6 +450,7 @@ static int amdgpu_vram_mgr_new(struct 
>>>> ttm_resource_manager *man,
>>>>   {
>>>>       struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>>>>       struct amdgpu_device *adev = to_amdgpu_device(mgr);
>>>> +    struct amdgpu_bo *bo = ttm_to_amdgpu_bo(tbo);
>>>>       u64 vis_usage = 0, max_bytes, min_block_size;
>>>>       struct amdgpu_vram_mgr_resource *vres;
>>>>       u64 size, remaining_size, lpfn, fpfn;
>>>> @@ -501,6 +502,9 @@ static int amdgpu_vram_mgr_new(struct 
>>>> ttm_resource_manager *man,
>>>>       if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
>>>>           vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
>>>>   +    if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED)
>>>> +        vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
>>>> +
>>>
>>> Mhm, you should probably *not* store this flags in the vres structure.
>>>
>>> As soon as the BO is used the VRAM wouldn't be cleared any more.
>>>
>>> Regards,
>>> Christian.
>>>
>>>>       if (fpfn || lpfn != mgr->mm.size)
>>>>           /* Allocate blocks in desired range */
>>>>           vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>>>> @@ -604,7 +608,7 @@ static void amdgpu_vram_mgr_del(struct 
>>>> ttm_resource_manager *man,
>>>>         amdgpu_vram_mgr_do_reserve(man);
>>>>   -    drm_buddy_free_list(mm, &vres->blocks, 0);
>>>> +    drm_buddy_free_list(mm, &vres->blocks, vres->flags);
>>>>       mutex_unlock(&mgr->lock);
>>>>         atomic64_sub(vis_usage, &mgr->vis_usage);
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>>> index 0e04e42cf809..8478522d7366 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>>> @@ -53,6 +53,11 @@ static inline u64 
>>>> amdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
>>>>       return (u64)PAGE_SIZE << drm_buddy_block_order(block);
>>>>   }
>>>>   +static inline bool amdgpu_vram_mgr_is_cleared(struct 
>>>> drm_buddy_block *block)
>>>> +{
>>>> +    return drm_buddy_block_is_clear(block);
>>>> +}
>>>> +
>>>>   static inline struct amdgpu_vram_mgr_resource *
>>>>   to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
>>>>   {
>>>
>>
>

