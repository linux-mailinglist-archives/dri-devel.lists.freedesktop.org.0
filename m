Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092B088D8BA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 09:24:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4C310F001;
	Wed, 27 Mar 2024 08:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="w6gF+Zb6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5762D10F001;
 Wed, 27 Mar 2024 08:23:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gb3IK9sWMujX2BK9IDgJEmQYYrT00cxvq7OdcFKdR++8RlLqINfVQoWHJSl0c+YZJZKqvWgmHv+KYmg1rhJB9iKk7KilAOSgKbSV/gjNXouov+AAbukgUuReRaq4MbU/pgSjbtbbGNxBSKS3JR2vf3I36OKBaLPaEoboXodxofTZoOgQJFzx+mKudprCk/amr1v8RmRm3+cplDwjB5bOoG67IFYPK/eRNpDRSdTB57YigEUdKTAkr0apbJR+ZdH5QQerVP5OyvG2BfE8rFtWx+FwH6PKfi6IZ0m90FJD7wDJ11RqFUT8iovcqUikVXHWdCmW5ScPflb8aQfKj9bceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xb3qzJWUhcjAvoycZs4i8inzLtJwMO+JlkhnKb5szYU=;
 b=JgbfPLBMXlhMo7XbfwpWg0N2WfyWacNSb6dS5y4r5CMCW66Vn+7dOpIsjIpLKoQZDMgW8nF23G57pziY8NshqRM0qN1GxZVAkSKqBQOfUwpK26V6w1/RbJcIvQSj/X8dxA60gkyNdsbfk0gnjp874WM+bLp5n1JrKOTx3A2TxdAm7GRK4nW4tSR2LcDidYg0SOh/l4yzc8GpxYC4sRfp2sfvfGN/NOYC8CBkBxU/ntg4LL4GF3TQo4uM9dqgQRZFnJaR7tSY34I7HQWhn7x5q2fkZoJukfXtbp0aUb9Swni1/MNL/donUuvhfeEpU3yDOvAr5fHrBFheFO+AJdkUEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xb3qzJWUhcjAvoycZs4i8inzLtJwMO+JlkhnKb5szYU=;
 b=w6gF+Zb6FsVsuQ/Mv+wyGbkZnEh+Q3ZAvt3Xk7TW3S2k9r1sfhylKdaKSiwDE9wWFk0X6eN+Y0mmjOFFqQqulClSiGohTOkaZwgZ4Ig/lqQBg0k/t9L1t5JnCg+poYJhKLEZnV7OQE1Vu/iqFwctoFU9O0pt7IyORUdvcvHrvK8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BL1PR12MB5779.namprd12.prod.outlook.com (2603:10b6:208:392::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 08:23:50 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6710:26ed:ab04:558f]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6710:26ed:ab04:558f%5]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 08:23:50 +0000
Message-ID: <e166a3de-b25e-471b-bdde-2118b17c9123@amd.com>
Date: Wed, 27 Mar 2024 13:53:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] drm/amdgpu: Enable clear page functionality
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, alexander.deucher@amd.com, matthew.auld@intel.com,
 mario.limonciello@amd.com, felix.kuehling@amd.com
References: <20240318214058.2014-1-Arunpravin.PaneerSelvam@amd.com>
 <20240318214058.2014-2-Arunpravin.PaneerSelvam@amd.com>
 <CADnq5_OOV49X-ctq-V6B9rGun43_BnWJixkbzAGRO1g0fzACxA@mail.gmail.com>
 <59ec1d92-19d6-4b88-97eb-16e9c3436d6c@amd.com>
 <CADnq5_Op9YaYPvWXmk2x1g1PcZ6qrs4NsDt2zrrvhnL9kgU7Gg@mail.gmail.com>
 <CADnq5_PnJ_y6r7_-vMxJETmO9jZVrsx+YMe-xOimCVYW_68F3g@mail.gmail.com>
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <CADnq5_PnJ_y6r7_-vMxJETmO9jZVrsx+YMe-xOimCVYW_68F3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::8) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|BL1PR12MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: 189815c8-d266-4544-7a57-08dc4e373af1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fFGJ1y5we03wiVAAQOd74e45hFNdlIPZo6/wOeGIyJzPlC5RNYbamFI3muZQNB6nYNkl9b3NdAW/tg0lHKyoK2oz5gGFryXWrxQ5wvSpSR2Po29HV2vvxRCO8VRoWz/FhkFKpNZ/vclRyTanXpvoOqoDjEaOcxlVjWI/5gSMuB98IrkjTihlPoYrS9h2gE3u9ea2C/q32N+4Mv1mW95KbJs1tkYg8T85pfZfmM/BHi47jScbzeQT8pzDXU4lBqB9nc31eYGjt1EbzUPCjyzZUfJGCiLEp1o1GejW358h+4P9h7yu05BLpCb6VUkN+l/LwAUs31LHrd9xtN3+wdfd7CiEXpkN2hJWBr5ygrB73wO89pBfxgMcx1juBeEC3+nAOv2zDTbCBnbJHu/mdebekY1CiZkLjxZnkuaI5+NDucuYVsxoHLwIpyjMGR6hnVEinlZfDhKwWsOCtjvpOs87+rIsb6/qCSwappNCTg168IEq1xJhhXU/Dku0/FJVq6ULYlySrxBOWkF5ylFqU0N4/if5Ga7P592r16ZGzZBBVAOAo2rSfqjFOdZ8o0m6fum1MqDjAiaoNDuBOVWa8k30M4Ga5SvzSGm3TRhuaEt09+fvLkjquv2YeMSJwBjj/JzsDiGflmVFooOiU0N7Cx4RaIKOioWOmCQcCD+9xkk9lRo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWJxVlp1Q2RvNzJLa2J3V05HREF2RXFmZ2pkWU1QWkJ0bTl1ZlRJYk1vVVFC?=
 =?utf-8?B?ZEVzRjZGcDhaMmZXRnpUY1ZOWjZWUFhnNTFmdFN4dFFSTGhtRHBiWDBwaGNY?=
 =?utf-8?B?dU1lV2lwUDZLZEp4alEvY0ljTkZ4TW03bWVsTDYxUWx4OGVZbDY0ZklCa2hD?=
 =?utf-8?B?S2dFSVR6Y2dvRXcwVlUyenFHOStUWlF6WDhYNnBhbHBOcHl3YzZQeVhFYmJ4?=
 =?utf-8?B?a2V5VDExQmUzZE5nandQZ1lxemt6OTdTenZ3b1RPc0xFL0JCU3V3MHczaWVj?=
 =?utf-8?B?REkxcnNtOXFHdTRkMlRpM3owaHVBcWJqRmN3THdNcU1Ebmx3UDNQR2Zxaks3?=
 =?utf-8?B?dUU2OVY0S2xnV2kvTlJHMm9PNUQrVlVNQVRGOXFUUlI4RnJ0alJPQWlFeUJX?=
 =?utf-8?B?QWhCNUhKUkxwczA3bFBKQmIwSXdGalRIVE1pMnRTMUdZYkduTG80NFU3WXRh?=
 =?utf-8?B?b294dkVTTkYyYWV3cFVyUmprdFZ6N3g1LzZMdE5oQmtIMFhYQlhrakxDbDR5?=
 =?utf-8?B?cmUzY0ZsTzNYdVpGTnRPeDB1T3NTRnMwY2FFQ3loL3oxN2k0L3Vkd1BZRWxP?=
 =?utf-8?B?YnorV1FycnlGL0Y3RDcwdTJSTzU1SUUybG5oQUhjbDZSUWlVbGhJWGNxNW5M?=
 =?utf-8?B?KzBXOXJ4czIxWldnc2xSa0hhdVlSSXhyWGFrcm02L3VlZmFTR3pJSkhEWGdu?=
 =?utf-8?B?RzZDckw2TlFRRlgvclBNY1Y5UUtIUjE4ZnE1VW0xQ21SU2EzY1RySTUxeWtp?=
 =?utf-8?B?dHJZWVJiL3Vybjd4UDVTa2ZjUzQwOGhiM2hpNEdvS2dnNW4zYzVGeSt4ZTNw?=
 =?utf-8?B?OThOQzAwY2dpRjVTZ3NiNGpIanZpcFNGeG5pa1VudC9ZYlBjbDhhck9TY0Fw?=
 =?utf-8?B?TEtTTnJEMEFjcjhZK1liRDZkdlh0NUFQM0Y3d0M1NGhNK2tkRzdBWDdxejht?=
 =?utf-8?B?b2cxayttZkpTL2J2RjF1b2FIYk14NHB0ZTYrYUNFZDJpR3V0TmRLZVNsVVN0?=
 =?utf-8?B?Yy9NRDFUZDUyNnNONzk1bTE4Tmc2M3VwWGczalkra0VpbHMxd3RsNTNZTTkr?=
 =?utf-8?B?N0toTDB5NmV5TVE0NU16MFRWVmx3WjZrSUhsOEFPcXpYNTNYdUlEVUVJeEhP?=
 =?utf-8?B?a2dnNXF4VkxqdlFkci8yZ0pJSFhBVmFsajhPaysrUEl4bDZWWTZxT3ZzMWVi?=
 =?utf-8?B?NU5xRnlHUHEwK3BGRWlkZXdyV0txVlZrdFJzakdpQnJLMS90SlJyMWVqVHhH?=
 =?utf-8?B?ZGdDOTFPNVNpTDVrODc2UkNGVDBNUG10NXNZSm5PaEJndTlLVmxyeDJlQ016?=
 =?utf-8?B?OFJzQU53b1NQNEplRzcwVER6eWk1eTNYZDNYdmV3M1RaMEs0RHJscGRsK3Zt?=
 =?utf-8?B?eWhnQkRFd1dodXg3R1BZWXVCWXVseXR3TjdJOXpBVVhMcXllbXUrR3RWNjNH?=
 =?utf-8?B?NURtY1hTb0tMdkN0di90UHMxU0Y0UnhJaFc5WjdXclJRNXhheDJTOEN5SVZL?=
 =?utf-8?B?bHhqU24zYlFKMURGKzVGYitOYzVHKzh1cnhYbi9Xeld2KzJjQnp3d2RmWitC?=
 =?utf-8?B?QjZVbXZ3UE03RFBwYzh3a1F3OVJkV2ZOdHFIUnozT1NmeWVVRXZvSkZGL3k4?=
 =?utf-8?B?bmhKeGxZZnVNWmZtNGlCNFR3aEhtMVlGSFVaaEpRV25CeXJLLzI2U1pvWnIv?=
 =?utf-8?B?TlFYVG5ucXM5L3orUnlVcTdjYU1EZ24rOU4vYjY1R3dvOGR6TU4vaXJQWmhP?=
 =?utf-8?B?dXJiYU94UkNka2VvYm5RYVlrdVRvM2NZZUVkZjhaM1NBaGtLRXR2aHlNU0Yx?=
 =?utf-8?B?MUw1QjkzWWNEdStoVGt1dWRGdUdrMXVnRmdsUm5SaWxOU1phSmNoWVo5Vzh5?=
 =?utf-8?B?VGRSR2RubzdtYXhSdDA5ODlWdytqQzVvSjBvb0hSbFhYQ3N3YWIrQXdoUWNY?=
 =?utf-8?B?VW1aRkFwak9oNmdFSk5TNHhqN2VtTE95ZDRrVGpNZklIczU1M3VZbzlhbWtk?=
 =?utf-8?B?WEtiNDdmcXVHdS85T3pnODJwL1JNajA3b0tDZm1zOTNnQnJZeWxwdHl3YjdD?=
 =?utf-8?B?NHY0R283LzdKanM3dVIvRkw3WW5WS3dtUWcwbDMxK3I3aDBUVHI4YkJGZ0dW?=
 =?utf-8?Q?ex5n89/EybVlz5gjXD2SAIqrh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 189815c8-d266-4544-7a57-08dc4e373af1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 08:23:50.2576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1M8LRlw8oa7goFB6HmkmorwR5Wpiz3Hz/q3j/K/H8Ic/qdi1ZoHePtlJtmn66oY5jOPRKjvQVZfh/DO/xdj+MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5779
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

Hi Alex,

On 3/26/2024 8:23 PM, Alex Deucher wrote:
> On Tue, Mar 26, 2024 at 10:01 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>> On Tue, Mar 26, 2024 at 9:59 AM Paneer Selvam, Arunpravin
>> <arunpravin.paneerselvam@amd.com> wrote:
>>> Hi Alex,
>>>
>>> On 3/26/2024 7:08 PM, Alex Deucher wrote:
>>>> On Mon, Mar 18, 2024 at 5:47 PM Arunpravin Paneer Selvam
>>>> <Arunpravin.PaneerSelvam@amd.com> wrote:
>>>>> Add clear page support in vram memory region.
>>>>>
>>>>> v1(Christian):
>>>>>     - Dont handle clear page as TTM flag since when moving the BO back
>>>>>       in from GTT again we don't need that.
>>>>>     - Make a specialized version of amdgpu_fill_buffer() which only
>>>>>       clears the VRAM areas which are not already cleared
>>>>>     - Drop the TTM_PL_FLAG_WIPE_ON_RELEASE check in
>>>>>       amdgpu_object.c
>>>>>
>>>>> v2:
>>>>>     - Modify the function name amdgpu_ttm_* (Alex)
>>>>>     - Drop the delayed parameter (Christian)
>>>>>     - handle amdgpu_res_cleared(&cursor) just above the size
>>>>>       calculation (Christian)
>>>>>     - Use AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE for clearing the buffers
>>>>>       in the free path to properly wait for fences etc.. (Christian)
>>>>>
>>>>> v3(Christian):
>>>>>     - Remove buffer clear code in VRAM manager instead change the
>>>>>       AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE handling to set
>>>>>       the DRM_BUDDY_CLEARED flag.
>>>>>     - Remove ! from amdgpu_res_cleared(&cursor) check.
>>>>>
>>>>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>>>> Acked-by: Felix Kuehling <felix.kuehling@amd.com>
>>>>> ---
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 22 ++++---
>>>>>    .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    | 25 ++++++++
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 61 ++++++++++++++++++-
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  5 +-
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  6 +-
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  5 ++
>>>>>    6 files changed, 111 insertions(+), 13 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>> index 8bc79924d171..c92d92b28a57 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>> @@ -39,6 +39,7 @@
>>>>>    #include "amdgpu.h"
>>>>>    #include "amdgpu_trace.h"
>>>>>    #include "amdgpu_amdkfd.h"
>>>>> +#include "amdgpu_vram_mgr.h"
>>>>>
>>>>>    /**
>>>>>     * DOC: amdgpu_object
>>>>> @@ -601,8 +602,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>>>>>           if (!amdgpu_bo_support_uswc(bo->flags))
>>>>>                   bo->flags &= ~AMDGPU_GEM_CREATE_CPU_GTT_USWC;
>>>>>
>>>>> -       if (adev->ras_enabled)
>>>>> -               bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
>>>>> +       bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
>>>>>
>>>>>           bo->tbo.bdev = &adev->mman.bdev;
>>>>>           if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA |
>>>>> @@ -632,15 +632,17 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>>>>>
>>>>>           if (bp->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED &&
>>>>>               bo->tbo.resource->mem_type == TTM_PL_VRAM) {
>>>>> -               struct dma_fence *fence;
>>>>> +               struct dma_fence *fence = NULL;
>>>>>
>>>>> -               r = amdgpu_fill_buffer(bo, 0, bo->tbo.base.resv, &fence, true);
>>>>> +               r = amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &fence);
>>>>>                   if (unlikely(r))
>>>>>                           goto fail_unreserve;
>>>>>
>>>>> -               dma_resv_add_fence(bo->tbo.base.resv, fence,
>>>>> -                                  DMA_RESV_USAGE_KERNEL);
>>>>> -               dma_fence_put(fence);
>>>>> +               if (fence) {
>>>>> +                       dma_resv_add_fence(bo->tbo.base.resv, fence,
>>>>> +                                          DMA_RESV_USAGE_KERNEL);
>>>>> +                       dma_fence_put(fence);
>>>>> +               }
>>>>>           }
>>>>>           if (!bp->resv)
>>>>>                   amdgpu_bo_unreserve(bo);
>>>>> @@ -1365,8 +1367,12 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>>>>>           if (WARN_ON_ONCE(!dma_resv_trylock(bo->base.resv)))
>>>>>                   return;
>>>>>
>>>>> -       r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, &fence, true);
>>>>> +       r = amdgpu_fill_buffer(abo, 0, bo->base.resv, &fence, true);
>>>>>           if (!WARN_ON(r)) {
>>>>> +               struct amdgpu_vram_mgr_resource *vres;
>>>>> +
>>>>> +               vres = to_amdgpu_vram_mgr_resource(bo->resource);
>>>>> +               vres->flags |= DRM_BUDDY_CLEARED;
>>>>>                   amdgpu_bo_fence(abo, fence, false);
>>>>>                   dma_fence_put(fence);
>>>>>           }
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>>>>> index 381101d2bf05..50fcd86e1033 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
>>>>> @@ -164,4 +164,29 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
>>>>>           }
>>>>>    }
>>>>>
>>>>> +/**
>>>>> + * amdgpu_res_cleared - check if blocks are cleared
>>>>> + *
>>>>> + * @cur: the cursor to extract the block
>>>>> + *
>>>>> + * Check if the @cur block is cleared
>>>>> + */
>>>>> +static inline bool amdgpu_res_cleared(struct amdgpu_res_cursor *cur)
>>>>> +{
>>>>> +       struct drm_buddy_block *block;
>>>>> +
>>>>> +       switch (cur->mem_type) {
>>>>> +       case TTM_PL_VRAM:
>>>>> +               block = cur->node;
>>>>> +
>>>>> +               if (!amdgpu_vram_mgr_is_cleared(block))
>>>>> +                       return false;
>>>>> +               break;
>>>>> +       default:
>>>>> +               return false;
>>>>> +       }
>>>>> +
>>>>> +       return true;
>>>>> +}
>>>>> +
>>>>>    #endif
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>> index 8722beba494e..bcbffe909b47 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>> @@ -378,11 +378,15 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>>>>>               (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
>>>>>                   struct dma_fence *wipe_fence = NULL;
>>>>>
>>>>> -               r = amdgpu_fill_buffer(abo, AMDGPU_POISON, NULL, &wipe_fence,
>>>>> -                                       false);
>>>>> +               r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
>>>>> +                                      false);
>>>>>                   if (r) {
>>>>>                           goto error;
>>>>>                   } else if (wipe_fence) {
>>>>> +                       struct amdgpu_vram_mgr_resource *vres;
>>>>> +
>>>>> +                       vres = to_amdgpu_vram_mgr_resource(bo->resource);
>>>>> +                       vres->flags |= DRM_BUDDY_CLEARED;
>>>>>                           dma_fence_put(fence);
>>>>>                           fence = wipe_fence;
>>>>>                   }
>>>>> @@ -2214,6 +2218,59 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>>>>>           return 0;
>>>>>    }
>>>>>
>>>>> +int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>>>> +                           struct dma_resv *resv,
>>>>> +                           struct dma_fence **fence)
>>>>> +{
>>>>> +       struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>>>> +       struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>>>>> +       struct amdgpu_res_cursor cursor;
>>>>> +       struct dma_fence *f = NULL;
>>>>> +       u64 addr;
>>>>> +       int r;
>>>>> +
>>>>> +       if (!adev->mman.buffer_funcs_enabled)
>>>>> +               return -EINVAL;
>>>>> +
>>>>> +       amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
>>>>> +
>>>>> +       mutex_lock(&adev->mman.gtt_window_lock);
>>>>> +       while (cursor.remaining) {
>>>>> +               struct dma_fence *next = NULL;
>>>>> +               u64 size;
>>>>> +
>>>>> +               if (amdgpu_res_cleared(&cursor)) {
>>>>> +                       amdgpu_res_next(&cursor, cursor.size);
>>>>> +                       continue;
>>>>> +               }
>>>>> +
>>>>> +               /* Never clear more than 256MiB at once to avoid timeouts */
>>>>> +               size = min(cursor.size, 256ULL << 20);
>>>>> +
>>>>> +               r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &cursor,
>>>>> +                                         1, ring, false, &size, &addr);
>>>>> +               if (r)
>>>>> +                       goto err;
>>>>> +
>>>>> +               r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
>>>>> +                                       &next, true, true);
>>>>> +               if (r)
>>>>> +                       goto err;
>>>>> +
>>>>> +               dma_fence_put(f);
>>>>> +               f = next;
>>>>> +
>>>>> +               amdgpu_res_next(&cursor, size);
>>>>> +       }
>>>>> +err:
>>>>> +       mutex_unlock(&adev->mman.gtt_window_lock);
>>>>> +       if (fence)
>>>>> +               *fence = dma_fence_get(f);
>>>>> +       dma_fence_put(f);
>>>>> +
>>>>> +       return r;
>>>>> +}
>>>>> +
>>>>>    int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>>>>                           uint32_t src_data,
>>>>>                           struct dma_resv *resv,
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>>> index 65ec82141a8e..b404d89d52e5 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>>> @@ -38,8 +38,6 @@
>>>>>    #define AMDGPU_GTT_MAX_TRANSFER_SIZE   512
>>>>>    #define AMDGPU_GTT_NUM_TRANSFER_WINDOWS        2
>>>>>
>>>>> -#define AMDGPU_POISON  0xd0bed0be
>>>>> -
>>>>>    extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>>>>>    extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
>>>>>
>>>>> @@ -155,6 +153,9 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>>>>                                  uint64_t size, bool tmz,
>>>>>                                  struct dma_resv *resv,
>>>>>                                  struct dma_fence **f);
>>>>> +int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>>>> +                           struct dma_resv *resv,
>>>>> +                           struct dma_fence **fence);
>>>>>    int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>>>>                           uint32_t src_data,
>>>>>                           struct dma_resv *resv,
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>>> index c0c851409241..e494f5bf136a 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>>> @@ -450,6 +450,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>>>>    {
>>>>>           struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>>>>>           struct amdgpu_device *adev = to_amdgpu_device(mgr);
>>>>> +       struct amdgpu_bo *bo = ttm_to_amdgpu_bo(tbo);
>>>>>           u64 vis_usage = 0, max_bytes, min_block_size;
>>>>>           struct amdgpu_vram_mgr_resource *vres;
>>>>>           u64 size, remaining_size, lpfn, fpfn;
>>>>> @@ -501,6 +502,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>>>>           if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
>>>>>                   vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
>>>>>
>>>>> +       if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED)
>>>>> +               vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
>>>> Is there any reason to not always do this?
>>> Here we are trying to keep a pool of cleared memory which are cleared on
>>> free path and that can given
>>> to the application which requires a zeroed memory. I think here if we
>>> set always clear the memory,
>>> we would go over the limit of cleared memory in that particular instance
>>> and the application should wait until
>>> the hardware clears the memory and this might impact the overall
>>> performance.
>> I'd like to have the driver always deliver cleared memory.
> Actually, I think we can just always set the flag in the allocation IOCTLs.
Sure, we can set the flag in the allocation IOCTLs.
Thanks,
Arun.
>
> Alex
>
>> Alex
>>
>>> Thanks,
>>> Arun.
>>>> Alex
>>>>
>>>>
>>>>> +
>>>>>           if (fpfn || lpfn != mgr->mm.size)
>>>>>                   /* Allocate blocks in desired range */
>>>>>                   vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>>>>> @@ -604,7 +608,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>>>>>
>>>>>           amdgpu_vram_mgr_do_reserve(man);
>>>>>
>>>>> -       drm_buddy_free_list(mm, &vres->blocks, 0);
>>>>> +       drm_buddy_free_list(mm, &vres->blocks, vres->flags);
>>>>>           mutex_unlock(&mgr->lock);
>>>>>
>>>>>           atomic64_sub(vis_usage, &mgr->vis_usage);
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>>>> index 0e04e42cf809..8478522d7366 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>>>> @@ -53,6 +53,11 @@ static inline u64 amdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
>>>>>           return (u64)PAGE_SIZE << drm_buddy_block_order(block);
>>>>>    }
>>>>>
>>>>> +static inline bool amdgpu_vram_mgr_is_cleared(struct drm_buddy_block *block)
>>>>> +{
>>>>> +       return drm_buddy_block_is_clear(block);
>>>>> +}
>>>>> +
>>>>>    static inline struct amdgpu_vram_mgr_resource *
>>>>>    to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
>>>>>    {
>>>>> --
>>>>> 2.25.1
>>>>>

