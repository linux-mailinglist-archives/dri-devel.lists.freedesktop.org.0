Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 736365A7A5A
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 11:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C058910E2B5;
	Wed, 31 Aug 2022 09:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2074.outbound.protection.outlook.com [40.107.96.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C7810E2B3;
 Wed, 31 Aug 2022 09:38:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JN8YbBpmarOZvqjz8V5iDp5oc7dRG/aPe+CKEkIeO0Pmreqgn699/8Urlz2QiHsGBqVKDFTumFWLY1dF/b1M6Og7NfgnDu6c+WfdFEaTcwhPnhudK0RygeoO2GY4IsW7sWJq4CX+Z3dh5VF7dqiENWTlfBbmd2I3OoAvj5aG5Jq84zTjMCwht9sFHtXkIq/RL9ze4MkSTT7XdF9FnopnkmPLjBNgSNJwnvijCS9Hw+1hBHZCi2vhJZ3gfSisi805PbKR2dL3tgHi8KxSVh4wYK1yqtw2iTxUKCtOuqgF2lf1koKCqqIENO7wxUvHiulyzjdldxdostvF9JfPdzSc2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/hmheNNnZKA9auhZPSge+w9HOcxTVFQ3GKGvaYBqdE=;
 b=NbB4FkP2TnJLClmLAvqrkNnGqvFeZB6SNslsBCF14CyitXoGf7f1VbQPKPX2UANGV1KQMt+oVUXP1A6W8XMcqZUyQegJ9GgY7PHtOxkZkBW1zT3bvpxaqENt6W2IPmrWh0NdLE/Ifb/UYDMaw39tY32vU5pzhxmxn1R4IXTzLWLrY3dSx9kMFqY9lWwCO2FwGItaFhiHYTmxzfGheIWykJu/P8DrN6wnEZLy1r7qmVU3DbqX/Ru8ndfP5ezJFBG+OWiJ4KjyI6OszwZ8mQwQZ03VTJ0GURPbKBNQr/ltl1MNlQIZGGBj/Bx8T1Xfv3lHW2Sa4gIq4Ekly4sMvxS7qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/hmheNNnZKA9auhZPSge+w9HOcxTVFQ3GKGvaYBqdE=;
 b=OvqRIitmISUtrPXURaX5yIBnqp5ztQkZTd5HpjQZdICVCGnFcMec9+zaT7UJrB6010keEYTmx9DTt6j8PugzMYQ2mq+0F0CnFMH2Itez3InPS88UFYOx0k5Gl38etX9xcGsaBXrMplQHBOpNNE0Jy2PQT7oxSjalhwubIn0ZkKo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5339.namprd12.prod.outlook.com (2603:10b6:408:104::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 09:38:43 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 09:38:43 +0000
Message-ID: <9c7cc7ea-dd30-6df5-3f06-97a6c6d254e0@amd.com>
Date: Wed, 31 Aug 2022 11:38:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] drm/i915: audit bo->resource usage
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20220824142353.10293-1-luben.tuikov@amd.com>
 <1de21f6e-4b11-ee9b-1b54-fd67728766ad@amd.com>
 <cc4c59ad-5d69-b174-5464-bd9896459169@intel.com>
 <ce090a95-a822-5079-7b86-0c949e98cd64@amd.com>
 <3f3715fb-1f2b-83a5-bff7-6e06164e5546@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <3f3715fb-1f2b-83a5-bff7-6e06164e5546@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0701CA0070.eurprd07.prod.outlook.com
 (2603:10a6:203:2::32) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed092329-4e92-43bc-cc6f-08da8b3497d5
X-MS-TrafficTypeDiagnostic: BN9PR12MB5339:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fLgFzhvGA7Uv+MFxHB1RO53TKMMHGdMGCH63yxYwG8NSgUC0fAjXJxactzCFEVjLNQLvpPACmHNcS8jqMOeXKAUOfHZvOm7LCbcJsCmzRnlm9s6LBQXVfrFmj4KBPXIBD6v9blfiqpdRcz2s4i++nLIY+MbuCyUmhAz38HObFMMEiX1dSZJ/B1bGFPLzf1kiIm88CZAuiHXyjRsJwp1WcdmVHAw9pr3Kzi/UR4Z0VX/QoNpjr+Lq+dsFfJX5dCLnuRdi5aRqHGmmestNnnLDzoJUKulyYAn0OIiRUbiKOGjZBmjzytVyRLIPj3fkiS7tBeD8YqZegaW6TlDCTuEvmtnvu4rE/6dc8f68JSp8va5DFwPSKFd0Ec37gUhTLiUvS4VHlNZfsEN0PM4HM+iZXKCjS1Hnr2CnNkhqVvTqbbo2jMW3E9EIPDmrzWEgCyt5Gs9a6vCfSFvIiNA8Yt3fKTsS4thIj9jS90Leo8GuWymjm7pFW3htzI5P4elMj5NdB2Lg3vW3mJE0tArHLE6m6sLYAvDaarAuaAWEp41+//2AirhXajymLrpeXG4ZD04RyxCIpIkoQrlPeyv28TtnAa5rmxaKuUosJxkGEiApd0gYFXUic94HpUWAREYIJ+7KEUmjFbaNqBoWXjVhMmzIU1uFNEUO72ifyQ85HIUkb5h0JWuhRQc4Q+JEPq58mbDKsHAn/wE2mNPY0MfjsRbMGcQKCu/GjoaH0kefq768xVZTOLM+1oyV6eYAuu6VfUFhhDr2LIOhFXjrUcZnk9eLckVJ8+Jr/MEj/59C9OsS8pjgt7CrwZxUk+vl28eBHkwM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(86362001)(31696002)(53546011)(36756003)(38100700002)(31686004)(83380400001)(41300700001)(6506007)(6512007)(66574015)(6666004)(186003)(2616005)(110136005)(4326008)(66556008)(478600001)(966005)(6486002)(45080400002)(66946007)(316002)(66476007)(5660300002)(2906002)(8676002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDBtcW5lNjloUTRqeWxNdVNSN3FvOHVLcXlvRXJBNmJqbytVaWtlaGlpTkZx?=
 =?utf-8?B?VENxYU9pbkJObGZEK1d5SGtuN3ZsSlJnU2JGUlh4Vk9wUjVUek0xajBjN0Rr?=
 =?utf-8?B?dU9LZEFua0p1OHMyd2dYZGNSbVRRUFViWTdaYThmTFErdXpGank2eGJPdnc3?=
 =?utf-8?B?TVltZkFJUHNvS1JTcTNRWEZsYXVCaEt1Ukh1YUdla2ZWUXlabld3Q3kyNGJn?=
 =?utf-8?B?QUtPNlREalA1RHY2alJ0ZzFnL3c0b1FsTFdQaCs4WVdMUDlyQ1hmeXBDZXMw?=
 =?utf-8?B?NUtjTmVWWXp3ZVV3b3A4L0xldk1iVmRxc2RFUkVLOVpyTHFjZmk4dXFZMUlC?=
 =?utf-8?B?eVYybnNhM3pXajh3UFZuQy82NW9GTFUzcHRJVk4zMkFMTC8zZDZRYVlScWpw?=
 =?utf-8?B?aWh1Q2pURzYrQ3ZwMnlMbzY0UHA2RUJGQUlvbndpZlBiTXBVajdOWXJkdUZG?=
 =?utf-8?B?c21xWlE2aEQ0eG5BYTRZTEtES0cyZDkxRkhkM1FzbUczUHJPMEUxVU4zaFpw?=
 =?utf-8?B?VzhHdXQyV1g5N2NReWRHOEtxVlUwcXRHSUM1TXUzbXpGVk1QNENFZDMxeDVH?=
 =?utf-8?B?ejd2cDRseUFVZzBjekVJOXppUjlvOXRZS0hNVkNIL0FCTjBkMG9SVlpUVTRo?=
 =?utf-8?B?a2g2ck1GUzJXYmNnbTNyZkY5OFNKYkgrNlJ3TDcyWkJYZGxIZXY5SFVBRGhY?=
 =?utf-8?B?RUNCMi8rVUl1WXNaeFVPSGxvZDlMU2xnMTI1WndvQUE3SFZLL1dQRDVvMUhy?=
 =?utf-8?B?RGhZbDRLWWpTTGV6MG5aU3YramlHaWgxSm5hQ3NmLzBFekRzN0Rldk9SK1pu?=
 =?utf-8?B?bVB2Mk8zcVhsZ3NIUTZmZnhoSlYrTGdjSFJhVzZJZUwxK3hlOFVNMHN2ZTI3?=
 =?utf-8?B?YWFLR1hsS3NmTVJET3dqcWJnRWZnQitlcGZiMzY1bkV2bWNnTlZQSnNBM2V6?=
 =?utf-8?B?aHIrU0NTV2VlemFuVDRwUFJRUjd1UGVySjk4QkdyV25wemJ3anJmd3JiNnY3?=
 =?utf-8?B?UUdXR3dDQ2Q2NDlWMStsNWxXREVza2RiS1h5WlB5YzU1Vyt0bHgveEJyV3Ax?=
 =?utf-8?B?Ym1XN2JEL0JTT2pSbS9QQ3JUcUhUeEs0U2xkRXBnTkNtRUtEL1lrbFg5ZU9T?=
 =?utf-8?B?dklWVzcwekdjSUppSlhZQ2JrUEtFTlZ6U21xclc5REsyTllwOXhmNjhvL21F?=
 =?utf-8?B?SHc4ZUo0a3pPbWhMeWNyZGJEY2pUeXNsOWtYTGxZVTRBbU5WMmJmcC9KTDA4?=
 =?utf-8?B?WHl0QVJDdFdrUytVL0pEejF1NjdsWjd4bkNWKzVBV0g5ZFZDYlJiMWVDK0dF?=
 =?utf-8?B?RDZqcnJ4NUZ3SGFWbHhPVGdRT1RYVFp1OFJ6YlgxR3ZlNnJjY2FOdVpsTzVv?=
 =?utf-8?B?aktxTytNMzArWC9ROHNrM0tya3FoSTgzY0J1bDlhNWZRZnBJZnY4MStTZkJ5?=
 =?utf-8?B?OFlWMGsxTXNHRytEd0RVVHlTdmYwTmRDbzhObHN4aTNVaFFuRVVLL2dkMkdp?=
 =?utf-8?B?Q2ZETzMvRjBsdE1IOS9Pbk91Skl3WmlaNnFuRVZFNThuVUZPM0tEbzFaU0xz?=
 =?utf-8?B?OXloWlAxSHQzOUhCeGF2L0k2ekgvZ09hNVA0RkhXblFBWHcrVkJLMXBXUysz?=
 =?utf-8?B?SVM5MjJBLzBWRWlJQ005WGg0ZHZTQTFUajdJdXN2ZFFWUEovMEE3M1JzRHI3?=
 =?utf-8?B?cGJoUnJFZlBSTGZSTExhdXpBOHN5MHpPYUUvM2xqd1ZJS0lFVkE5MTZQV2Zr?=
 =?utf-8?B?R0VGdThUd2ZMVThEMHUrU3EySjBHWGJYNmgvMGR5bk4vWVB2cXJuK3pVWlBE?=
 =?utf-8?B?aWYweWQ0d2QybFhnWjhIcjRSU2dZZDQxNE5rTUJyK2FQQVF4VER5am1zMlFJ?=
 =?utf-8?B?V1RVa1BqYng2bkVRZEpUMGdXaVh5Mi9ndVVSeGhreDl4RzNKK1BCZTZnRVRv?=
 =?utf-8?B?UWJNY29BanBNSzJaRURVdlM5L2ZEeXVCR3AvS0RQalBvUmFYc1p0bUtLSjZi?=
 =?utf-8?B?bG5NMTBwd3JMZHFCdTNIY3puOTRJOEZFeFhVRUZSaXFVcXR4WEIva05Kb1J2?=
 =?utf-8?B?a1Y3L0NZeTB3REExRTFwajJmQTJsSXJNOVdjTndJUDhlcmRHNkdCUFZjZ0hQ?=
 =?utf-8?B?NFE4R25sM3pYNldlMmRVYkZTcExCNm5kNVQ1ajlFTEtOclpidmNRT3JlOWdw?=
 =?utf-8?Q?91JWrJknJVUEGM5B0U9OpduFggCm7zF3YL9hlOyIGEvq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed092329-4e92-43bc-cc6f-08da8b3497d5
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 09:38:42.9840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CI4EwrN6ijI8+ZrKsK1qtbDM+2AoWV/7OH5p3SMf3aBBONul/KqgNT2eTZJ6djGQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5339
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
Cc: Luben Tuikov <luben.tuikov@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.08.22 um 11:26 schrieb Matthew Auld:
> On 31/08/2022 09:16, Christian König wrote:
>> Hi Matthew,
>>
>> Am 30.08.22 um 12:45 schrieb Matthew Auld:
>>> Hi,
>>>
>>> On 30/08/2022 08:33, Christian König wrote:
>>>> Hi guys,
>>>>
>>>> can we get an rb/acked-by for this i915 change?
>>>>
>>>> Basically we are just making sure that the driver doesn't crash 
>>>> when bo->resource is NULL and a bo doesn't have any backing store 
>>>> assigned to it.
>>>>
>>>> The Intel CI seems to be happy with this change, so I'm pretty sure 
>>>> it is correct.
>>>
>>> It looks like DG2/DG1 (which happen to use TTM here) are no longer 
>>> loading the module:
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fintel-gfx-ci.01.org%2Ftree%2Fdrm-tip%2FPatchwork_107680v1%2Findex.html&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7Ccaca567b3279492450fd08da8b32e598%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637975347967354305%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=apanfOjzSWD2vduINzr2j6F2DiIBC93hLRnnGJcGQ5o%3D&amp;reserved=0? 
>>>
>>>
>>> According to the logs the firmware is failing to load, so perhaps 
>>> related to I915_BO_ALLOC_CPU_CLEAR, since that is one of the rare 
>>> users. See below.
>>>
>>>>
>>>> Thanks,
>>>> Christian.
>>>>
>>>> Am 24.08.22 um 16:23 schrieb Luben Tuikov:
>>>>> From: Christian König <christian.koenig@amd.com>
>>>>>
>>>>> Make sure we can at least move and alloc TT objects without 
>>>>> backing store.
>>>>>
>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>> ---
>>>>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 6 ++----
>>>>>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 2 +-
>>>>>   2 files changed, 3 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>> index bc9c432edffe03..45ce2d1f754cc4 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>> @@ -271,8 +271,6 @@ static struct ttm_tt 
>>>>> *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>>>>>   {
>>>>>       struct drm_i915_private *i915 = container_of(bo->bdev, 
>>>>> typeof(*i915),
>>>>>                                bdev);
>>>>> -    struct ttm_resource_manager *man =
>>>>> -        ttm_manager_type(bo->bdev, bo->resource->mem_type);
>>>>>       struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>>>>>       unsigned long ccs_pages = 0;
>>>>>       enum ttm_caching caching;
>>>>> @@ -286,8 +284,8 @@ static struct ttm_tt 
>>>>> *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>>>>>       if (!i915_tt)
>>>>>           return NULL;
>>>>> -    if (obj->flags & I915_BO_ALLOC_CPU_CLEAR &&
>>>>> -        man->use_tt)
>>>>> +    if (obj->flags & I915_BO_ALLOC_CPU_CLEAR && bo->resource &&
>>>>> +        ttm_manager_type(bo->bdev, bo->resource->mem_type)->use_tt)
>>>>>           page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
>>>
>>> AFAICT i915 was massively relying on everything starting out in a 
>>> "dummy" system memory resource (ttm_tt), where it then later 
>>> "transitions" to the real resource. And if we need to clear the 
>>> memory we rely on ZERO_ALLOC being set before calling into the 
>>> i915_ttm_move() callback (even when allocating local-memory).
>>>
>>> For ttm_bo_type_device objects (userspace stuff) it looks like this 
>>> was previously handled by ttm_bo_validate() always doing:
>>>
>>>   ret = ttm_tt_create(bo, true); /* clear = true */
>>>
>>> Which we would always hit since the resource was always "compatible" 
>>> for the dummy case. But it looks like this is no longer even called, 
>>> since we can now call into ttm_move with bo->resource == NULL, which 
>>> still calls tt_create eventually, which not always with clear = true.
>>>
>>> All other objects are then ttm_bo_type_kernel so we don't care about 
>>> clearing, except in the rare case of ALLOC_CPU_CLEAR, which was 
>>> handled as per above in i915_ttm_tt_create(). But I think here 
>>> bo->resource is NULL at the start when first creating the object, 
>>> which will skip setting ZERO_ALLOC, which might explain the CI failure.
>>>
>>> The other possible concern (not sure since CI didn't get that far) 
>>> is around ttm_bo_pipeline_gutting(), which now leaves bo->resource = 
>>> NULL. It looks like i915_ttm_shrink() was relying on that to 
>>> unpopulate the ttm_tt. When later calling ttm_bo_validate(), 
>>> i915_ttm_move() would see the SWAPPED flag set on the ttm_tt , 
>>> re-populate it and then potentially move it back to local-memory.
>>>
>>> What are your thoughts here? Also sorry if i915 is making a bit of 
>>> mess here.
>>
>> First of all thanks a lot for taking a look. We previously got 
>> reports about strange crashes with this patch, but couldn't really 
>> reproduce them (even not by sending them out again). This explains 
>> that a bit.
>>
>> The simplest solution would be to just change the && into a ||, e.g. 
>> when previously either no resource is allocated or the resource 
>> requires to use a tt we clear it.
>>
>> That should give you the same behavior as before, but I agree that 
>> this is a bit messy.
>
> Yeah, that should do the trick.
>
> That hopefully just leaves i915_ttm_shrink(), which is swapping out 
> shmem ttm_tt and is calling ttm_bo_validate() with empty placements to 
> force the pipeline-gutting path, which importantly unpopulates the 
> ttm_tt for us (since ttm_tt_unpopulate is not exported it seems). But 
> AFAICT it looks like that will now also nuke the bo->resource, instead 
> of just leaving it in system memory. My assumption is that when later 
> calling ttm_bo_validate(), it will just do the bo_move_null() in 
> i915_ttm_move(), instead of re-populating the ttm_tt and then 
> potentially copying it back to local-memory?

Well you do ttm_bo_validate() with something like GTT domain, don't you? 
This should result in re-populating the tt object, but I'm not 100% sure 
if that really works as expected.

Thanks,
Christian.

>
>>
>> I've been considering to replacing the ttm_bo_type with a bunch of 
>> behavior flags for a bo. I'm hoping that this will clean things up a 
>> bit.
>>
>> Regards,
>> Christian.
>>
>>>
>>>>>       caching = i915_ttm_select_tt_caching(obj);
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c 
>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>>> index 9a7e50534b84bb..c420d1ab605b6f 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>>> @@ -560,7 +560,7 @@ int i915_ttm_move(struct ttm_buffer_object 
>>>>> *bo, bool evict,
>>>>>       bool clear;
>>>>>       int ret;
>>>>> -    if (GEM_WARN_ON(!obj)) {
>>>>> +    if (GEM_WARN_ON(!obj) || !bo->resource) {
>>>>>           ttm_bo_move_null(bo, dst_mem);
>>>>>           return 0;
>>>>>       }
>>>>
>>

