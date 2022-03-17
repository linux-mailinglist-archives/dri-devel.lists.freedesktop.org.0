Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1684DBFD2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 08:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D0110EC78;
	Thu, 17 Mar 2022 07:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE0310EC78;
 Thu, 17 Mar 2022 07:00:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adg8rNC69ChRoC9NMVSQyS1sJfIeBoRFtihUWyh4yCEl0NqgvQFbws5Coc8+s59oIgKIb/fV8y+W4o+SVfl3rnVGNc24F6jigVkEeDNM+xfb0ibXd3h0eQoTPmi7JwAcS68jLLOGzT/aMKdg6Rbbj8dfyth9or0enx9F0gHe1lcWuhmkGgDHfjJ6KVmYHWSZ0H6VF7JbhW2NpznAv/C640IjKfOm3E8kaeBssVsRKQxFfLmNit8PzMzCvIbBlhOTCLedeNNQEAWYThck8qbqBCLQQWrSgZ2JnkjlJXe1f6o6dCmKbalcPigCs7kQCyfOIOLacEyLa3Agtt20t3X8gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dy+B87j6RJ7PYX98Hy98lD7BtWRoKHmxprvdlbeJJlM=;
 b=Cu2RtiHFmX0Cc81vbK6t0xNzdotq17Cws+l4CHQMs5wOdFIyjg+loaHNBHuNdA323HCMHXFj68LNYH1r00o8BAdRcjjxezK07z9OTLbXOYdVnfe0M/5Ki3N+XUfP1EzUfEda6v66qea5ij56FFESv7n0S2zLlTA1/Wn/DMcU42+x3X4cEDoS4FjN98a+bad8+ZTOE/w+Wi9YnsGZ7GvS1H2Bdy/khtyxiF5zeQQaxuYe4i+PN7EVTl2O6frZFZq0Ww7x2FpLOANbQYLpg7FlJg62koa4m8KkcxHVyTaDdX/ephf6zN0f+VwT5rh8nrciIHpUFiM+9mjpu2/TpZFp0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dy+B87j6RJ7PYX98Hy98lD7BtWRoKHmxprvdlbeJJlM=;
 b=br8GAbXgtqgk51LC4ATLFr3BNIq9zrnFXhrNHUOumxmZ4cWn+Ll9vYEqrAhd/0SbCEW9ETu71lBO9Kmn0LLNeyy2tK1vlaOUhNV/JIntHv8aoiOYFR69yATKs+p/DPj1U48nma5QOpJGz0gwPaiQ3+oNFUz88RDMSW1leFlfUa0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB4413.namprd12.prod.outlook.com (2603:10b6:806:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 17 Mar
 2022 07:00:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.015; Thu, 17 Mar 2022
 07:00:17 +0000
Message-ID: <484729f6-1768-3a48-d58b-fa789db49869@amd.com>
Date: Thu, 17 Mar 2022 08:00:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 5/7] drm/ttm: add range busy check for range manager
Content-Language: en-US
To: Robert Beckett <bob.beckett@collabora.com>,
 intel-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220315180444.3327283-1-bob.beckett@collabora.com>
 <20220315180444.3327283-6-bob.beckett@collabora.com>
 <2918e4a2-3bb8-23e0-3b8c-90c620b82328@amd.com>
 <1eef3b71-ef7c-24d1-b0d7-695fc1d2d353@collabora.com>
 <2b5816aa-c082-b03a-c7a0-e4351e8e4e5a@amd.com>
 <2a364c03-d6d9-1ccd-2ecb-9ebf893f0860@collabora.com>
 <aedda268-8859-ab42-c276-d3b7cb0533fd@amd.com>
 <b5f97167-7a2c-6c47-e107-502a1b9c20e8@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <b5f97167-7a2c-6c47-e107-502a1b9c20e8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0093.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::34) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f29ed759-8091-4202-2827-08da07e3cad3
X-MS-TrafficTypeDiagnostic: SA0PR12MB4413:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB441309E594DD577E4CD9B55983129@SA0PR12MB4413.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N9hOc/aOo98Pj/QWyue6sN+OP+Saufd6F5+rU0v8K39ROkZX64TXEqmEvNH0u8kugB+cYuTO4RMIhDVlGN3YtpWPOcg3jbrAET6HJzy4qursTPrYnE+HPMCmiT4FG3IvvlIoes4VMgQoR/CzmgZ0FSOrtIyMCuTeIwxz8A9V7d2D/4j4uvBzkG2ccGsgmtNbXyFLm1kyTRI4CHAc0lypC6yA1LNbz4R2imbZ2Ah8/VJkmOF+mj5hNQAXgVq65QVCN0D8akaUJBArfEsDYAIzxVfp+LY4mEutg28AjBy2anz9OONhjsUed92UFmqEBAmOAzw4qB76pzcD58WYxmgrNoPkJ2KIcFWDMDIR6gj43ccDUmIyO/ia204ib3zwbgqRz6x/ekqKat87WCxdIxARwbOyBC53+xVce2j2Ohk04w2P+UVf5zeQ632Kg3Kz7LyTLJj4HoFA1ftH9ch6Wzo9ZjIEavU6Ng6AFXDRRMjHo9GR1/bue3J1ZdumZ3BqJjcw3fqT7BjRQtJanx7Rv8ZrDTBfN9rzfGTBrrfG0lMUqYc7B58b48v4GlTXICIl2+SkFOsIn52Pjy1u6MqWfJznrVaZkwGXubzbE7G1+Jpz7WqL0owyjXBrQF1oTzxeTJYMS+JpbTehv+duQ9Jcf+y3t6N8PjYrEcivMS69PeyrDNCEzkhP1AkAQ+6xhcXrdFzfLbYadoZkDgPOXy1JZAXaV2jcbeJP4ru6zavqHrlLxH0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(26005)(83380400001)(66574015)(36756003)(110136005)(66476007)(66556008)(66946007)(508600001)(31686004)(316002)(8676002)(6486002)(4326008)(2906002)(6512007)(5660300002)(8936002)(6666004)(31696002)(86362001)(38100700002)(6506007)(53546011)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHE1WGR5enlxUmswdDdBbzNlOVFpVERLOG9GYTFuRm15djlYSlpVWFhGanpB?=
 =?utf-8?B?Smk2MFBsTlNYenh4WTM4RUttQUxILzdvcWJ3VlFXTy9mbUlmbk1zNnhreFE3?=
 =?utf-8?B?MlpGcFpjc2N6MUZVQkVpY0RVVXhweW5NQjdwOVhUb29XWEt1emd3L084YlJL?=
 =?utf-8?B?bFdJbHpHbHdzblJOWmxKQlNUMXZnTzlJRjVPeW1vajU1QjhSRHJmdnNkRk9y?=
 =?utf-8?B?UStDT2UzcTZWUFZ0KzVKVkhUbG1aMmZ1RExsNVE2ODFtdUtUZVVKOU11a1hP?=
 =?utf-8?B?RkR6VEdQREdqb0ZJdHFycnJZVG9nQWxLb0dPRTFMb05mc09HVUh1dnFrMGM4?=
 =?utf-8?B?SXZIa0FqWTJRTGpBTVdrcXhhbXJKTDhCQkRUK0Z2YncvVTZjWUJPcHh2amlk?=
 =?utf-8?B?dUtmdkZIVmRZUE55di90a2srR01FYm5PMzBoS3hiN2xBcWVGZ0JHaHZDc2VY?=
 =?utf-8?B?U09aYmp4emNTekVEVnE2VmpjT3NZZ0pkZ1hxUEs5SlNpS2V6MTA2MjU3a0la?=
 =?utf-8?B?eDd0cXJPWnZZbWl2R1BYRGdoTW9ZbkIxOVdtRDY3aDAzUzVSNFArVldiVFpv?=
 =?utf-8?B?QzV5Z0hCa3hFdUZsWEhaVkVKQjNkdTRJbDMxbVJZRkpVVXZoQnFEYTZtQk9h?=
 =?utf-8?B?SGZNRDU3cXJ6Y3h6dmlwNWpNZEN4MTNLOWl6VGVRWmZLZFJNU0gxK1g4eTB1?=
 =?utf-8?B?RnRJeEtBdVR2djVJaElUWU0ybjJaemkxRVgvb2IrZUVXWXVwcFhhczRic1Vk?=
 =?utf-8?B?RUdza2hjblJRMGdsN1NseTFNTmRRZjZKNmFUOFR1MDJWNlJqbFpjdG1kTU1X?=
 =?utf-8?B?YjltazNMNVJEejU5Nk5xeTQxMnkyaGtGWjh5Zi85WXJpTVFJYzltS0hIY3Z0?=
 =?utf-8?B?eFNOMWNkWkJWNTVndi9WWi9ncnplR2htR0dhaUpIT1lzbi80R29lNmZNS2Z1?=
 =?utf-8?B?L3Nua0NtUlUyTkhsZFJHMDlwb1d3M2MxM0VOSytrUVZhaWoySWkrN3dpRUpB?=
 =?utf-8?B?b3d2a3RPVis5Qm5OLzQwUHd1MzVaR25qcHVmRlpCTUl4aWlSeTNXT2pVQWpu?=
 =?utf-8?B?c2JXRlZSNGpZMUNLd091NExZaENpQ25CK1VxNUZrVHFLRzNKQXBzcVQ3NFMv?=
 =?utf-8?B?Wmx2MkJDcGFqam5TNXBpUE9lTHVpcjdUcEdlM090M0lOYnVoMko3S2UyYVZG?=
 =?utf-8?B?UHBaWEo5YTdza3FKUTFlblY4NGY0Q1V2L3BQdG9haGpFQVZKR0lCY0prL2lI?=
 =?utf-8?B?emhlbXFXdUdOVVJhZDJMOWoxOTJVTFJMUDEzY1ZOc1ZocW90UVlSUGI5TjNC?=
 =?utf-8?B?c01oUTBadkRoSEdYVW1YUFRwS0EzdlJhYkcxTU9teHVWeFgrVjg3eWJjNS94?=
 =?utf-8?B?T3VDbzVMTmc2U0RxY1NvL21kcFhmM2wydXMraFV1amNmaXVUaXFQSTR3Wkxh?=
 =?utf-8?B?MzdFN2syYm9BWnpkdUhZR3cvZXpmZUp6dWlQcThSTE9wN2dONDNmZXIwYi9G?=
 =?utf-8?B?Ni9jaUJHcDVkVDh4dVRNZFY2RDhPcWFlVEw5TmtDQ1N1NEJqbDkvS2FOK2gy?=
 =?utf-8?B?R3Q0TkxKVE01NjNTNU01Vyswc0wzbXgrN2k3eE5nZlZjYWtDeHRmNE8yYS9V?=
 =?utf-8?B?T2lWRkdoWGFrV24zOUlOKzBNM3FZYjlObzRTSHlIMm15aFVHOGNHYytBb3FX?=
 =?utf-8?B?cE40M0ZXN3haeUUyaUZPWVg3emlOaFRnc0QwL3ZKZXY3K3Focms0SnltQUxK?=
 =?utf-8?B?cjBxYWNFYUJQNVdxOEtTRjVXVTR4WjRNZVM1RE4waExuMjhSMEtyWUpNclhY?=
 =?utf-8?B?dXk5YmtNNnROakFMaW1ZV2VPQ2syNTdmK3RDNVhMMzZSdFZVZDJOV3dEOHVs?=
 =?utf-8?B?NzR2NS9jS3l5a0Q5ZFdQa1IxWmhqK1hnWUxoRmFGdkdnTkhqdysyZzE5SXJO?=
 =?utf-8?Q?5V39+v9ScYnTCi0EWT/z+sGdQ0XZ3GKd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f29ed759-8091-4202-2827-08da07e3cad3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 07:00:17.0809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /c373IsmXLRU6mq/9odLd2dY2S5o69UoGJ2G+IhQYmu3mYEqlEKzYPXonrEZ6PwH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4413
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.03.22 um 16:28 schrieb Robert Beckett:
>
>
> On 16/03/2022 14:39, Christian König wrote:
>> Am 16.03.22 um 15:26 schrieb Robert Beckett:
>>>
>>> [SNIP]
>>> this is where I replace an existing range check via drm_mm with the 
>>> range check I added in this patch.
>>
>> Mhm, I still don't get the use case from the code, but I don't think 
>> it matters any more.
>>
>>>>> I suppose we could add another drm_mm range tracker just for 
>>>>> testing and shadow track each allocation in the range, but that 
>>>>> seemed like a lot of extra infrastructure for no general runtime use.
>>>>
>>>> I have no idea what you mean with that.
>>>
>>> I meant as a potential solution to tracking allocations without a 
>>> range check, we would need to add something external. e.g. adding a 
>>> shadow drm_mm range tracker, or a bitmask across the range, or stick 
>>> objects in a list etc.
>>
>> Ah! So you are trying to get access to the drm_mm inside the 
>> ttm_range_manager and not add some additional range check function! 
>> Now I got your use case.
>
> well, specifically I was trying to avoid having to get access to the 
> drm_mm.
> I wanted to maintain an abstract interface at the resource manager 
> level, hence the rfc to ask if we could add a range check to 
> ttm_resource_manager_func.
>
> I don't like the idea of code external to ttm having to poke in to the 
> implementation details of the manager to get it's underlying drm_mm.

The purpose of the ttm_range_manager is to implement a base class which 
is then extended by the drivers with more explicit functionality.

I have it on my TODO list to properly export the ttm_range_manager 
functions and use them to simplify the amdgpu_gtt_mgr.c implementation.

So accessing the drm_mm for a test case sounds perfectly fine to me as 
long as you document what is happening. E.g. maybe add a wrapper 
function to get a pointer to the drm_mm.

>
>>
>>>>> would you mind explaining the rationale for removing range checks? 
>>>>> It seems to me like a natural fit for a memory manager
>>>>
>>>> TTM manages buffer objects and resources, not address space. The 
>>>> lpfn/fpfn parameter for the resource allocators are actually used 
>>>> as just two independent parameters and not define any range. We 
>>>> just keep the names for historical reasons.
>>>>
>>>> The only places we still use and compare them as ranges are 
>>>> ttm_resource_compat() and ttm_bo_eviction_valuable() and I already 
>>>> have patches to clean up those and move them into the backend 
>>>> resource handling.
>>>
>>> except the ttm_range_manager seems to still use them as a range 
>>> specifier.
>>
>> Yeah, because the range manager is the backend which handles ranges 
>> using the drm_mm :)
>>
>>> If the general design going forward is to not consider ranges, how 
>>> would you recommend constructing buffers around pre-allocated 
>>> regions e.g. uefi frame buffers who's range is dictated externally?
>>
>> Call ttm_bo_mem_space() with the fpfn/lpfn filled in as required. See 
>> function amdgpu_bo_create_kernel_at() for an example.
>
> ah, I see, thanks.
>
> To allow similar code to before, which was conceptually just trying to 
> see if a range was currently free, would you be okay with a new 
> ttm_bo_mem_try_space, which does not do the force to evict, but 
> instead returns -EBUSY?

You can already do that by setting the num_busy_placement to zero. That 
should prevent any eviction.

Regards,
Christian.


>
> If so, the test can try to alloc, and immediately free if successful 
> which would imply it was free.
>
>>
>> Regards,
>> Christian.
>>
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/ttm/ttm_range_manager.c | 21 
>>>>>>> +++++++++++++++++++++
>>>>>>>   include/drm/ttm/ttm_range_manager.h     |  3 +++
>>>>>>>   2 files changed, 24 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c 
>>>>>>> b/drivers/gpu/drm/ttm/ttm_range_manager.c
>>>>>>> index 8cd4f3fb9f79..5662627bb933 100644
>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
>>>>>>> @@ -206,3 +206,24 @@ int ttm_range_man_fini_nocheck(struct 
>>>>>>> ttm_device *bdev,
>>>>>>>       return 0;
>>>>>>>   }
>>>>>>>   EXPORT_SYMBOL(ttm_range_man_fini_nocheck);
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * ttm_range_man_range_busy - Check whether anything is 
>>>>>>> allocated with a range
>>>>>>> + *
>>>>>>> + * @man: memory manager to check
>>>>>>> + * @fpfn: first page number to check
>>>>>>> + * @lpfn: last page number to check
>>>>>>> + *
>>>>>>> + * Return: true if anything allocated within the range, false 
>>>>>>> otherwise.
>>>>>>> + */
>>>>>>> +bool ttm_range_man_range_busy(struct ttm_resource_manager *man,
>>>>>>> +                  unsigned fpfn, unsigned lpfn)
>>>>>>> +{
>>>>>>> +    struct ttm_range_manager *rman = to_range_manager(man);
>>>>>>> +    struct drm_mm *mm = &rman->mm;
>>>>>>> +
>>>>>>> +    if (__drm_mm_interval_first(mm, PFN_PHYS(fpfn), 
>>>>>>> PFN_PHYS(lpfn + 1) - 1))
>>>>>>> +        return true;
>>>>>>> +    return false;
>>>>>>> +}
>>>>>>> +EXPORT_SYMBOL(ttm_range_man_range_busy);
>>>>>>> diff --git a/include/drm/ttm/ttm_range_manager.h 
>>>>>>> b/include/drm/ttm/ttm_range_manager.h
>>>>>>> index 7963b957e9ef..86794a3f9101 100644
>>>>>>> --- a/include/drm/ttm/ttm_range_manager.h
>>>>>>> +++ b/include/drm/ttm/ttm_range_manager.h
>>>>>>> @@ -53,4 +53,7 @@ static __always_inline int 
>>>>>>> ttm_range_man_fini(struct ttm_device *bdev,
>>>>>>>       BUILD_BUG_ON(__builtin_constant_p(type) && type >= 
>>>>>>> TTM_NUM_MEM_TYPES);
>>>>>>>       return ttm_range_man_fini_nocheck(bdev, type);
>>>>>>>   }
>>>>>>> +
>>>>>>> +bool ttm_range_man_range_busy(struct ttm_resource_manager *man,
>>>>>>> +                  unsigned fpfn, unsigned lpfn);
>>>>>>>   #endif
>>>>>>
>>>>
>>

