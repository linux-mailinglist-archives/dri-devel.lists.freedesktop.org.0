Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B02355ACD42
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 10:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B4910E1FD;
	Mon,  5 Sep 2022 07:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD7710E1FB;
 Mon,  5 Sep 2022 07:59:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKaycJcekX768Zzq8Sg8IGOxm+bIHyM4zsaKYSin+gL91qCsHbUR4bMLh5eX7wKk++oM7AK7Hif6d74YIq/vr0y+NC5dfGtcVzRSNcYl0JtVcLXGRhVbGwclzyPrutWkuGJAiWjAOuLyA3suEaRcb5kQz+aRM+2WvrT8Z6ZyMNqmU6vrDltAf8PGcT2N7go7HsIOIYZvqylHIarZa/I5NhiUKFr7ptW8vVILoV3hWKcoUcQsaX+z1OM9+g4gzc6iQu44wpSnXbBng+xGZAwEvpe1qRuc9ZRTjr0Lc22DJPUmq+Aj7riVPIu2ZXcN+utvHllsaLadn08aqB90x/6new==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ti9fP99nQ9i8xkBZTPs+O9Lj1b1Ep6CORBW9IvGMBZ8=;
 b=eZ51FQ1Ijujyv5z23wM7y9MXct7DhBO4bYBVHMdmOWG3iee9Ynk2OeYD9gp22Bfe9fovz7SndLLPYqC8JSbPXleuzQUDWY9ItXg2GKXxr/kdXeBl42j2QX/B5V+cQLKO66ZW2mW1wLet83TBkT5QkLCfPYut8zM+vrm6nxCMgjnajdUP/Njq1J/4SQmYPGxhQADJA1QpBiXD7wIQcGhgj2tJ8f6uTzxBtz7ZF2VRDpgvAO0U7Smbw9pVwHWKKAJujkyVTGHERbCEqXZGQuRmF4G4QPECXx2j0FYBd4ltpGyRt77zldKnXG7Gxp8jzwijs0HgDc5p8S1gf53fmJTS5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ti9fP99nQ9i8xkBZTPs+O9Lj1b1Ep6CORBW9IvGMBZ8=;
 b=XYG9StXxlaZWnJg3rAetmW9Kar+9sA9d2MU7hf3X+6/HialdIm7gUmFCczjexDOsx7vg5LwebxSe3q8FEg1u9h3zvzXrYDO91pomxYYZmMU5aH4S05fDvct9ZSW07fxPY/hfDeBx9OCvE5AZDwlhdfuvtt2NK3Hh7JkdJJysh9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3663.namprd12.prod.outlook.com (2603:10b6:208:16e::22)
 by IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Mon, 5 Sep
 2022 07:59:40 +0000
Received: from MN2PR12MB3663.namprd12.prod.outlook.com
 ([fe80::a83d:1c28:ed21:2ab6]) by MN2PR12MB3663.namprd12.prod.outlook.com
 ([fe80::a83d:1c28:ed21:2ab6%3]) with mapi id 15.20.5588.017; Mon, 5 Sep 2022
 07:59:40 +0000
Message-ID: <d769ba2c-c796-6544-91c3-936037b3d82b@amd.com>
Date: Mon, 5 Sep 2022 15:59:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/ttm: update bulk move object of ghost BO
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 ZhenGuo Yin <zhenguo.yin@amd.com>, amd-gfx@lists.freedesktop.org
References: <20220901092946.2030744-1-zhenguo.yin@amd.com>
 <df602f9a-d55e-e034-febd-ac15d76cfa28@gmail.com>
 <e42b6dac-de91-249c-4ccd-a379e209d6b0@gmail.com>
From: "Yin, ZhenGuo (Chris)" <zhengyin@amd.com>
In-Reply-To: <e42b6dac-de91-249c-4ccd-a379e209d6b0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To MN2PR12MB3663.namprd12.prod.outlook.com
 (2603:10b6:208:16e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a445c30-4f0f-43df-a0ec-08da8f1495bf
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LqAseVA93e0Aidt0hcTony85st6c7RxtVysZTSskLzJ07VlyxSSsnwgGkuv8UxOys1v9Kp7vI9vkkf2toPy6gl/eS0SpgnVIwx7nG0wi2qNY9Wwed6v86Gs55vuwNE8uUefKZbFkADlX6Mg4XH14gghUm5Wp3JtOGrYu4FtL73Bjvew+YV6jeRFSIYOtcswpSXQULYZxxLUjO4a3388B2MFrdk0hjZjN5ycRaA9PL+bYzcIzTIOHZeeAgQ5A213/1Ziy4ods9p1UvYNXqpWU05vFNLTJcBpi/D5HY30D8VJqd0lCQ3pmx0e9kuhULgS1uaT6A+ZljKT9W6qvzDM1GXTZiQ71QkD2IcBi77TFOmoaEpkXGOMur+rItFpNNfig1nZtZHOQmrgyim+/94195ffMBo31Zuxlw+y6anXspIP1LIrQTHXdF40QPbi56ynUJ8l3aouSyzF53rS6hbbmrJ6Z+VtN3odG7EA7jq/3TBs84IZLyQfrQ4agKz9Nt/GG5Gta9XNzEIKBWcK1V75mR8vQ71w/N9FX8zppqZ+X9M8DGoyKlUsiqgVIuPZ8m7IYz3r/Tc5CKJ6wxplE8vxd1d+wyjxfVrAt8e7opTEZ+6XBeuKXOkG9fMA31epQhdMoDGBY3Gl0D4Hv9z0ZmuyBu17AsarZZksIWnd4Z5P74NyXtsitw61qCRZEQCLU2HOCmJBLyfT9n05HUjP1vHLmredobVRuKXfl4K4JwRuC8eZGhpGHrBQo61REF8eYR5isUJVz+HHJGOP5sssm9qX63hdf4V3V4lNsosmPduiNYD8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(6506007)(26005)(53546011)(31696002)(2906002)(478600001)(8936002)(41300700001)(6666004)(5660300002)(66574015)(6512007)(83380400001)(31686004)(186003)(66556008)(38100700002)(2616005)(66476007)(110136005)(36756003)(316002)(6486002)(66946007)(8676002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGRncEg5aXpYZkNESFdCWjlHUXNycmVFL3dPRHpvZEpXVWNYKzdxRnhTenpO?=
 =?utf-8?B?aW0vVU8vdVF4MGNva3BtTUxyT0pDb3FlWHNjUGZJMjhhNTdxc1NDdzVlVmhs?=
 =?utf-8?B?Y1hLVlRxalltR1p0YjMrMTVJQzFxbWhid0dwOUdhUTBublpjeFBHRlhMdk1j?=
 =?utf-8?B?SE01NDdYVndUNFpTZk53VERsVWdQSDJhbXNjblQyU1FpQm5CZjZDbTRiTXJz?=
 =?utf-8?B?R2pNdi9TcUZSWUUyYWpiUHpnazRCR0FCVHZ0aENMbWFJM1dYNkl3Ulozakp5?=
 =?utf-8?B?TnZEUnRYa2ZoQW9GQ1U0d1Qxc1VWWnU0MXdnRFd2NTZXcHdLZnZ2TU4zaDhn?=
 =?utf-8?B?UzR6Wk9EWVJrbHV1bStjZ0Rjem5zQ25SQlVoOTlEaUpqN3hBWmxSbEFVRW9K?=
 =?utf-8?B?TUdaaDUwbUN6RmtIY2pkMTJpcDBLWmZXazIyd1huNjFXeFlhQ0NmcGZoRHdh?=
 =?utf-8?B?c3NJc3hOVU55ZW42ekltL3V5TjJiU3VQdUdya09od2ErdkQvMFc1ZHNXc3kx?=
 =?utf-8?B?c1RvR09IeWg3eDF0M0ZXNFBSTVZuZ2prbS9vUkl2WjRNbVJIbGsrVXFRc1I1?=
 =?utf-8?B?Zk1HL0wvOFlnWHNvY3BLU1JmTEZ2WjdvclQwY3VkWWlzMFVMOE5xK2FWTXNI?=
 =?utf-8?B?YWhteW9EN3lHTy9md1oxbzlNL3RzUTNpbzBlaFRHK2NYdjJhdHMxR2E5YzRZ?=
 =?utf-8?B?UVYvb0VnYzAwS0c3dmFLV1lYN2oxazNTR3d2NHBFdkJBcUZhN2Q1cVoxVWc2?=
 =?utf-8?B?U0hZUnptWXZOdHkwVkhzWEYwdTFhcll3OUZoRWJxL05NbjFpYjV6VVhuNXVy?=
 =?utf-8?B?b1VtTFJnbFN1TmkxWGpzTFdyTWpuUmFORUdUSEFvT1RNQ3o0MHE3Vy9DejBP?=
 =?utf-8?B?eWJQQTFpMHdBZVBUUHlOSVgzZVNjY1hweTZ0WDJmZXp0YS9oNWpROVRMUWRj?=
 =?utf-8?B?b2N4QkpudGd2TGpkaUh5ai8zWWExTENoeHNCbC9GZXVpZDhkbmpIQzE1U2xB?=
 =?utf-8?B?QndsV0o4TzFrRGNtckZUS21WcnpRUDdxUTJIT2RHYWRhbmxnOEYzSUFXVFBu?=
 =?utf-8?B?azBBcWNUbm9YQmxRZ01SbjR6UnppanRwZHFCWC82bXBLRkpVNjlzTE9MaGRl?=
 =?utf-8?B?V2ZKSWt2K2dZWi9lQVZ6TkZpaG9CSE1MZlV4dTNIRFlidi9tUFIxbVExMjBS?=
 =?utf-8?B?bUZqMGFHYURyMmtSZ0hRRDFkUmFqK1RnUFM2RlZzRlBQVFVXVXVUN0p0aTVR?=
 =?utf-8?B?cUwvVGNSbDVVaXBKTUpValNYN2xZalV0VHJOV3I0M2FZLzM4QjBUazRXYVBS?=
 =?utf-8?B?MWVBZjh3SWV1RjFxN3FTMXArcDZpckFDb3VXSkJUcG9RSGF5dEJTSEZNOUx3?=
 =?utf-8?B?akZjWFNRdzNRMTRQZnpSTTh0dTZNZ20vdllZOU1oUUV4MmhRRVY0dENzK1NT?=
 =?utf-8?B?d2YyRXVGcHAwS1ZDUUR2R3lkdWx4THp1enA2WUY4bk5QSEdaaGVRdEk5ZHlE?=
 =?utf-8?B?MXlWN3hzQ1d3YlFHYWxoNGRGQmp5NUNybWd6Uk9iZW05ei9yTk1hWVEzeEJX?=
 =?utf-8?B?bGViMEFHSjlUMG1lUWU1R3paWU9VWkxmK3l1UHhLamVrTkJRTkJvL1VpMFBB?=
 =?utf-8?B?dGM0VUhVZmx5NDFra3ZwTW80L2JXSmVTUWVxQXVZVDVpM0k0VzFEMUJGRElq?=
 =?utf-8?B?RzRuK1ZrUmZrOVk3aHRIa0FyWXE1V3dSUitoYTNTQTg3RGxLVHVwZkgvRHU2?=
 =?utf-8?B?K2Q4RERleVFyTGd3cDRzWGozV1JvUFFNRXhIdGF5Q0t3RUt4SElQU0JoaEdN?=
 =?utf-8?B?amNqU0FiODFoWXFLN2VrWFBjUDBaLytjbjdiQTFIcDlDYXZtNEV0NnNpbkZR?=
 =?utf-8?B?Mk1QcTlSeWtxdXc5dlhYVlQ3WjE4SXUzanI0TnhjVFVTRUNmb0kvQWN4R1RY?=
 =?utf-8?B?UnpqUklaN1AyQUNGcExScHdXTDR4QXlRWDV5L01yWTRQSnFmdGxnRkhXUWFI?=
 =?utf-8?B?UHM4YWhqbTRMZWhZcnh5UStNS2xRbWNDcmV6Z0trMVNkQmgwZGlhTW1WSDZG?=
 =?utf-8?B?a054aUliUVg0NXpPSm9KSUZxbEdmNVNhOXpBNnBCbTZRaDFpMGlmcmFTRUx3?=
 =?utf-8?Q?1LopSa9ZgIrjN/913JjFrtA7Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a445c30-4f0f-43df-a0ec-08da8f1495bf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 07:59:40.5046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cyvIE3v/pRe1p/jQA5nhi+IpNOJsY87Op6MXej/YzI2cD0+Og5I6TVWxs3DQEcvSEhKRfuaUoJIp3XP4KaH4Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6435
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
Cc: jingwen.chen2@amd.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Inside the function ttm_bo_set_bulk_move, it calls 
ttm_resource_del_bulk_move to remove the old resource from the bulk_move 
list.

If we set the bulk_move to NULL manually as suggested, the old resource 
attached in the ghost BO seems won't be removed from the bulk_move.

On 9/1/2022 7:13 PM, Christian König wrote:
> Am 01.09.22 um 13:11 schrieb Christian König:
>> Am 01.09.22 um 11:29 schrieb ZhenGuo Yin:
>>> [Why]
>>> Ghost BO is released with non-empty bulk move object. There is a
>>> warning trace:
>>> WARNING: CPU: 19 PID: 1582 at ttm/ttm_bo.c:366 
>>> ttm_bo_release+0x2e1/0x2f0 [amdttm]
>>> Call Trace:
>>>    amddma_resv_reserve_fences+0x10d/0x1f0 [amdkcl]
>>>    amdttm_bo_put+0x28/0x30 [amdttm]
>>>    amdttm_bo_move_accel_cleanup+0x126/0x200 [amdttm]
>>>    amdgpu_bo_move+0x1a8/0x770 [amdgpu]
>>>    ttm_bo_handle_move_mem+0xb0/0x140 [amdttm]
>>>    amdttm_bo_validate+0xbf/0x100 [amdttm]
>>>
>>> [How]
>>> The resource of ghost BO should be moved to LRU directly, instead of
>>> using bulk move. The bulk move object of ghost BO should set to NULL
>>> before function ttm_bo_move_to_lru_tail_unlocked.
>>>
>>> Fixed:·5b951e487fd6bf5f·("drm/ttm:·fix·bulk·move·handling·v2")
>>> Signed-off-by: ZhenGuo Yin <zhenguo.yin@amd.com>
>>
>> Good catch, but the fix is not 100% correct. Please rather just NULL 
>> the member while initializing the BO structure.
>>
>> E.g. something like this:
>>
>>  ....
>>  fbo->base.pin_count = 0;
>> +fbo->base.bulk_move= NULL;
>>  if (bo->type != ttm_bo_type_sg)
>>  ....
>
> On the other hand thinking about it that won't work either.
>
> You need to set bulk_move to NULL manually in an else clauses or 
> something like this.
>
> Regards,
> Christian.
>
>>
>> Thanks,
>> Christian.
>>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_bo_util.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c 
>>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> index 1cbfb00c1d65..a90bbbd91910 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> @@ -238,6 +238,7 @@ static int ttm_buffer_object_transfer(struct 
>>> ttm_buffer_object *bo,
>>>         if (fbo->base.resource) {
>>>           ttm_resource_set_bo(fbo->base.resource, &fbo->base);
>>> +        ttm_bo_set_bulk_move(&fbo->base, NULL);
>>>           bo->resource = NULL;
>>>       }
>>
>
