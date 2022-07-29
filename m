Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFD9584C0C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 08:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728E910EA91;
	Fri, 29 Jul 2022 06:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2067.outbound.protection.outlook.com [40.107.100.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF7810E151;
 Fri, 29 Jul 2022 06:33:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEUmwsdR9EUm+m7o4Fd8oGnUlUgWeig6uJElOMjsUc08C7Gtd0nTJQuW6myrlT7vUNZmYWN30YXXVtjo4kWLvtbSk5CaLtI4IFpMpDw/XX9UQp77lioFaipB7Y6TuzHguhlOp5erzmTydT6p7gd5ddWcpcxIXhhvXtp0u/5n+NJ1Y9xNjAhjJhldF8ub2YCou2AaIlvZ0/1HoB3af/LbxGtkrj2wtz8UtPCdoj0bOvDDaGktyRNHcecKDeagjVtVtc0tTyUeJoL+Lfyo6hTKLIC07MmUxITKil6mXVOOtE0oEdIFeOl+PXS7XCYRkY+gejRnliTly2ixTnZhI+CZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kR33NTSAd1ojaQKUaR7Isi0pPeGqQZNJo8MjwRYCYwE=;
 b=JxiEqiafuWPY0u1bJfXnCrUD6Dk4Go0AewhcmgV1BlVQb+pZUfsHchlZYgl3hi/W0Zzi8EqyihpA/6IYOVU3Ely6lGp91Nw2Cx1Z73W51OpSImtagBhIi+KrSy+8LBY/f80ZIchsf1bX4oPf62dkcTZfIEUkS2czyTceXieU9u4bSElDINnrYlQkRUz354CCJHdqlqk8zO8DHD0utF7DZx+b685NrFdeCG2mnLkcKbdDeG7jC5wp/6xfiS/zeAFwdhGKDmDGIMj6O20+JcqCfWLla+azsfA0EZCwt6r/6jBJWqY3WnRWa9InP42zx9EVO/Kl5YYIE1MpgAQAteJnpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kR33NTSAd1ojaQKUaR7Isi0pPeGqQZNJo8MjwRYCYwE=;
 b=MoarX1umx6ZoaCujaUjeO3vJFI1w6zti2BY/uNW9laDViFFjk1aQM0GgBtwbo4AC2U7Qh3EyLJ+8Mik2uLYuM1OJaLY9yvg40J2krO4yh+HQvud/5s8sPjs/IP5mr4WsJZAwh0zdf2mOTWTU7ximrPy0FEq48AESL1+fOBtGxzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN0PR12MB6198.namprd12.prod.outlook.com (2603:10b6:208:3c5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Fri, 29 Jul
 2022 06:33:38 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::a1d8:6a71:213b:6e14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::a1d8:6a71:213b:6e14%9]) with mapi id 15.20.5458.025; Fri, 29 Jul 2022
 06:33:38 +0000
Message-ID: <50a773c8-e69f-19eb-719d-36eead82d084@amd.com>
Date: Fri, 29 Jul 2022 12:03:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 6/6] drm/ttm: Switch to using the new res callback
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20220728143315.968590-1-Arunpravin.PaneerSelvam@amd.com>
 <20220728143315.968590-6-Arunpravin.PaneerSelvam@amd.com>
 <d8933a0b-8891-a075-cafe-85edfa3aab57@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <d8933a0b-8891-a075-cafe-85edfa3aab57@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::7) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad6ecf5f-c297-43a3-7c50-08da712c456c
X-MS-TrafficTypeDiagnostic: MN0PR12MB6198:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3nNhUDtBB8rhvZ806Wg2MnGuQNk8VrzAg2LPyrxgGqVIaIp3lne1VAulhKkTeAC2ED3uQtgJ/dGkbdD7YZV5OXlePYKoKq2NVRqF67czjNK0TLY0RjgSCuaOHjavawQujj4rXUXYwWgI68fEmoKepiCbXXKYUIVeltK3rs9XfH18tu1w2msWNu+o03e5OA/Fk0WERj9y9gHxYoNpBMzDjOMAD7ZyoPzHHseItrHExIRSzKEs+y1EbmoWdNrmdC5O8Jk3ERZoAI/MCs2GQbLgGZVc9qlG3iccV+YO2mk42OEBgHWtnUN2mTM+k1Mm0ChO0Lofd+7pPobe4MSZ69aluraQKbBYnQvXmwzKpdBLNATQ8jAD/jqMrzkfYYYVjNHWuCCmssuoXQ2ANJC7Bpz0e3VcrwQFEhejUFqcTx/iGCoIBVrlIBY+iPhJE4wm2MdAs0spHAjs9sm90uM8eS0vyfjvqXxuyaAh8oMWwSP9/eRoKwAZkmix8jgiR8Amx6NnLQ2sMhtNDw12AwRnnBIp5ZXcBF9po7vbHFCOespWW/zZ++i8WT93S+3ArgxKUme8lcczv8nSzGVmN6QLeaicksJCb/N/JKF2iKjPRHN8QOVWFDjfdIjrhtK+EuY7QWWekGwh4GfFh3gt3qJeEwrjJ8kjRZS4wLoldcQkVmw2Eo4p6+BZ1GmAugeX6qUIUfS4EflxSVB9sb3coOVsDqyghDdvepImFAky1fABq6C5eij+aXH+MomhPlXfC+9zTqXEI1tufw/DYbzVo9q48Ch1Ez/m4oWzfAvoVDwS7RnlOUFAa2M7pEpyTIvdHvp3WVCH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(8676002)(186003)(6666004)(83380400001)(6506007)(8936002)(41300700001)(6512007)(6486002)(86362001)(66574015)(31696002)(53546011)(2906002)(478600001)(26005)(66476007)(66556008)(5660300002)(316002)(36756003)(66946007)(4326008)(31686004)(38100700002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2dyVXZKY21IMlUza3NjYmI5YStibmxRQ2NLVzVtTHN6UHV0bC9GRE9qUEEv?=
 =?utf-8?B?bC9CTmlxbkJwRjhUNHlWREN6YkRRdjNSRTNTdzhLc0dkM0NOOE12Rk5Ic3gz?=
 =?utf-8?B?UzF0U0FUaS9yNGNiaDAzZm1TWE1xbjJLZkJTeXdXSk5ZQ2xZREVNMnUyUDBP?=
 =?utf-8?B?Tk5GNjEvWFZ0eXM2emdYSHJOMjZINTRxa2xvaHY4YWU1MkhLNmhNYlRtSzlx?=
 =?utf-8?B?QlFQS0JYV1ZpQWl6RUhxUkM0QUpsUzZoVGJGY0piMkFoc1d3R1NDMC9YenIr?=
 =?utf-8?B?d0g0Y2NkSnpYTXhnNHhEczM2QjZtNDUxbDZQL0xZWnlwTThvL1RZcUdiUnV0?=
 =?utf-8?B?L0dNajVPSC9lSktUNmY5bllGWlArMU56WFVFNjVKS0RIV3k1dVB6NW1JWjBH?=
 =?utf-8?B?Z1Y1RlNUWlo2a3UyOHZUYkxrVHpMeDVtT3psUDAxdlV5TU1zeGs4aThzOExS?=
 =?utf-8?B?V2o2Mm5hWGFvS1ZlUXZCSjdML21CQW5xTjZVNzByRWdrVHhQOUhYY0hqRldH?=
 =?utf-8?B?aTYwSkFPSkJQR0ljdmFmOENrV014UE0wOUxaWVRRZWtxRkJuc25FK3NhTk4z?=
 =?utf-8?B?cEE3UTNlcHRrdEhHZTZoNTBCN1dXTmhOVE12MWlNRlpMUm1XK3JSRWlLbDB5?=
 =?utf-8?B?THFNbTRpamlDQXpZSDZ0b0JzbC9zVlVuS1dlZ0RxM1MvTnFIZW1NYk80cXlo?=
 =?utf-8?B?V3lOUG9tQkxVblZRWjZnWWdOR0s4R1VBSUwvQVdIQitwekxWa0piNmhsL3hl?=
 =?utf-8?B?SEFJVTVnRTlXK0g2WnFOblFxeTJUdmxIaDBaSW5TTU1uT3d3a0Rpb3liWmll?=
 =?utf-8?B?K3krb2M4OUZ6Y2hKcklibVY0djJ1cVdCVkUxalRxQ01ZSHVOendPNWZCaXRT?=
 =?utf-8?B?Y2tqWXFYUkJ4RzRxQXV6azI0em0xSnM1WmJRcmZHU3Z1bjhMT0NEc2hrRFhL?=
 =?utf-8?B?MEJZVGoxd09ScWZzbDFDNmpOMzJsY1k5SUNWUDhPMzdwZ2ZUV0l4Q2ZYYTdO?=
 =?utf-8?B?TVNrNkRxN2d3T3F0MkJjK3dvMFRweCszb3FDUHg1Tk1wZkZWRS9GajNPaEpS?=
 =?utf-8?B?MTNnVTJZdmtxN0RPSlI5YXB6c2lGTU9LTkpQMVlyMkFaNU9jbmxVQ3VudmxH?=
 =?utf-8?B?VGZGaDBCSjNrUkZxYXJHUmpPWFg3STN3bWIwbTJPbFdGTHhETjFXa2lGaU1j?=
 =?utf-8?B?cmpYcTczWHJuR1JjWXRYeGUvd1FuSFZOSVptSVRXOEszWU9ibjUwUUFMejhw?=
 =?utf-8?B?Rk5FcUhhck9LOWIzT2NTL2IrMHl3Ykk2UjhCanNEMnYxSHhuM056ZzFlSXlV?=
 =?utf-8?B?am9RSVVFNEk5c1p1YUNsMHNoZ1N3akRtcFdvUU83S1pzUGxqdU5JN1NoWmZn?=
 =?utf-8?B?b3gvaUJtOTVGeC9GeUJlazJwZXgxaXNSRjd5NlNybXp5OUx4emd1YUZqR01s?=
 =?utf-8?B?bjd4bjRJQVcyTlpSeDVSMnFXZDBMMmNBS3YzTUp2VEREZXZ4TUxvUG16ZmxF?=
 =?utf-8?B?VUZORWlCbzRsWWNZSkxWOU5waU9EZGwwV0NRK1RuK0p5OXh1bVhzQWMxZWwr?=
 =?utf-8?B?VGxIYm82bVp4Zmtwdm1kN1ZEN1BLbnAwRHVMS1FqSDZGWldGbGVHZjVwL0Vp?=
 =?utf-8?B?dStHdjhFSjByRUljcXNxR0NZRzNkeUc4cW8vR3JyL3dxd3FJblBIRjlxSHpM?=
 =?utf-8?B?WWJHRnV5NXQzd2xCUlFEY1I4UTEyTVlWTmN3MHVybnpBYW5FSEROdnFYZEFH?=
 =?utf-8?B?cnI0Zlp2SG81M0dlcVVlVVlaTmdGeU9BaWUyUi9pVzR3eUVNT3RMWGNxRHph?=
 =?utf-8?B?clVQNVJRaGxxMytobUc1Y1NPZzJnV3FYVmxMcjBhWXJ3QWJLL1BvaVIvNkoy?=
 =?utf-8?B?OSs4VFdaVjlGUUhCVm5MY2w0QkF0c3NXUlZuVXlSbmhUbUxoRzRIazFUdGJO?=
 =?utf-8?B?WGMwOXkwTGNyeFBFVzZVTmJrREpNbTlJZ1pMejhXOFprUEdqb240OFlSV2lK?=
 =?utf-8?B?dHN6Q3ZMcDZKTjgwdFZkNzhLd3RNMndqd3Q3d01uZUl4MXZyaGVVL1FNZ05u?=
 =?utf-8?B?WEI5ODlibG5hMHZKQTZ1L0g5bHZ1Rm1CWEl3ZndIWGZvNFZLL3RmcGJGZzhQ?=
 =?utf-8?Q?nInyM42xIgQLqpIZJVE0SLCFX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6ecf5f-c297-43a3-7c50-08da712c456c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 06:33:38.6239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdPnVWQRRZgmcP7JWFnXkOaBgr9sabXNmrZMPXdcBsCo9YisduMBf892+NWkBvuR4uYaHv6aL8UHascsuKD9JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6198
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
Cc: alexander.deucher@amd.com, luben.tuikov@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/28/2022 9:07 PM, Matthew Auld wrote:
> On 28/07/2022 15:33, Arunpravin Paneer Selvam wrote:
>> Apply new intersect and compatible callback instead
>> of having a generic placement range verfications.
>>
>> v2: Added a separate callback for compatiblilty
>>      checks (Christian)
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>
> There is also some code at the bottom of i915_ttm_buddy_man_alloc() 
> playing games with res->start, which I think can be safely deleted 
> with this series (now that we have proper ->compatible() hook).
>
> Also, is the plan to remove res->start completely, or does that still 
> have a use?
yes we should remove res->start completely, I am working on it, planning 
to send in a separate series as amdgpu uses it in many places, and in 
some places we set res->start to AMDGPU_BO_INVALID_OFFSET,
I should find an alternative to indicate the invalid offset BO. Also, 
res->start used in drm/drm_gem_vram_helper.c at drm_gem_vram_pg_offset() 
function. I am removing all the dependencies, I will send the
patches in a separate series. I think i915 doesn't use res->start in its 
own driver code.
>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 45 +++++++------------------
>>   drivers/gpu/drm/ttm/ttm_bo.c            |  9 +++--
>>   drivers/gpu/drm/ttm/ttm_resource.c      |  5 +--
>>   3 files changed, 20 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 170935c294f5..7d25a10395c0 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -1328,11 +1328,12 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct 
>> amdgpu_device *adev, struct ttm_tt *ttm,
>>   static bool amdgpu_ttm_bo_eviction_valuable(struct 
>> ttm_buffer_object *bo,
>>                           const struct ttm_place *place)
>>   {
>> -    unsigned long num_pages = bo->resource->num_pages;
>>       struct dma_resv_iter resv_cursor;
>> -    struct amdgpu_res_cursor cursor;
>>       struct dma_fence *f;
>>   +    if (!amdgpu_bo_is_amdgpu_bo(bo))
>> +        return ttm_bo_eviction_valuable(bo, place);
>> +
>>       /* Swapout? */
>>       if (bo->resource->mem_type == TTM_PL_SYSTEM)
>>           return true;
>> @@ -1351,40 +1352,20 @@ static bool 
>> amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>               return false;
>>       }
>>   -    switch (bo->resource->mem_type) {
>> -    case AMDGPU_PL_PREEMPT:
>> -        /* Preemptible BOs don't own system resources managed by the
>> -         * driver (pages, VRAM, GART space). They point to resources
>> -         * owned by someone else (e.g. pageable memory in user mode
>> -         * or a DMABuf). They are used in a preemptible context so we
>> -         * can guarantee no deadlocks and good QoS in case of MMU
>> -         * notifiers or DMABuf move notifiers from the resource owner.
>> -         */
>> +    /* Preemptible BOs don't own system resources managed by the
>> +     * driver (pages, VRAM, GART space). They point to resources
>> +     * owned by someone else (e.g. pageable memory in user mode
>> +     * or a DMABuf). They are used in a preemptible context so we
>> +     * can guarantee no deadlocks and good QoS in case of MMU
>> +     * notifiers or DMABuf move notifiers from the resource owner.
>> +     */
>> +    if (bo->resource->mem_type == AMDGPU_PL_PREEMPT)
>>           return false;
>> -    case TTM_PL_TT:
>> -        if (amdgpu_bo_is_amdgpu_bo(bo) &&
>> -            amdgpu_bo_encrypted(ttm_to_amdgpu_bo(bo)))
>> -            return false;
>> -        return true;
>>   -    case TTM_PL_VRAM:
>> -        /* Check each drm MM node individually */
>> -        amdgpu_res_first(bo->resource, 0, (u64)num_pages << PAGE_SHIFT,
>> -                 &cursor);
>> -        while (cursor.remaining) {
>> -            if (place->fpfn < PFN_DOWN(cursor.start + cursor.size)
>> -                && !(place->lpfn &&
>> -                 place->lpfn <= PFN_DOWN(cursor.start)))
>> -                return true;
>> -
>> -            amdgpu_res_next(&cursor, cursor.size);
>> -        }
>> +    if (bo->resource->mem_type == TTM_PL_TT &&
>> +        amdgpu_bo_encrypted(ttm_to_amdgpu_bo(bo)))
>>           return false;
>>   -    default:
>> -        break;
>> -    }
>> -
>>       return ttm_bo_eviction_valuable(bo, place);
>>   }
>>   diff --git a/drivers/gpu/drm/ttm/ttm_bo.c 
>> b/drivers/gpu/drm/ttm/ttm_bo.c
>> index c1bd006a5525..03409409e43e 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -518,6 +518,9 @@ static int ttm_bo_evict(struct ttm_buffer_object 
>> *bo,
>>   bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>                     const struct ttm_place *place)
>>   {
>> +    struct ttm_resource *res = bo->resource;
>> +    struct ttm_device *bdev = bo->bdev;
>> +
>>       dma_resv_assert_held(bo->base.resv);
>>       if (bo->resource->mem_type == TTM_PL_SYSTEM)
>>           return true;
>> @@ -525,11 +528,7 @@ bool ttm_bo_eviction_valuable(struct 
>> ttm_buffer_object *bo,
>>       /* Don't evict this BO if it's outside of the
>>        * requested placement range
>>        */
>> -    if (place->fpfn >= (bo->resource->start + 
>> bo->resource->num_pages) ||
>> -        (place->lpfn && place->lpfn <= bo->resource->start))
>> -        return false;
>> -
>> -    return true;
>> +    return ttm_resource_intersect(bdev, res, place, bo->base.size);
>>   }
>>   EXPORT_SYMBOL(ttm_bo_eviction_valuable);
>>   diff --git a/drivers/gpu/drm/ttm/ttm_resource.c 
>> b/drivers/gpu/drm/ttm/ttm_resource.c
>> index 84a6fe9e976e..c745faf72b1a 100644
>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>> @@ -316,6 +316,8 @@ static bool ttm_resource_places_compat(struct 
>> ttm_resource *res,
>>                          const struct ttm_place *places,
>>                          unsigned num_placement)
>>   {
>> +    struct ttm_buffer_object *bo = res->bo;
>> +    struct ttm_device *bdev = bo->bdev;
>>       unsigned i;
>>         if (res->placement & TTM_PL_FLAG_TEMPORARY)
>> @@ -324,8 +326,7 @@ static bool ttm_resource_places_compat(struct 
>> ttm_resource *res,
>>       for (i = 0; i < num_placement; i++) {
>>           const struct ttm_place *heap = &places[i];
>>   -        if (res->start < heap->fpfn || (heap->lpfn &&
>> -            (res->start + res->num_pages) > heap->lpfn))
>> +        if (!ttm_resource_compatible(bdev, res, heap, bo->base.size))
>>               continue;
>>             if ((res->mem_type == heap->mem_type) &&

