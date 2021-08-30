Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 640433FBAF9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 19:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4241C89E19;
	Mon, 30 Aug 2021 17:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1680 seconds by postgrey-1.36 at gabe;
 Mon, 30 Aug 2021 17:30:48 UTC
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (unknown
 [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7412389E14;
 Mon, 30 Aug 2021 17:30:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EiaBjoO/stZKW8FgQ61H7KBDySInfQYOAWHHGp9rHM4RZqGO/hU9d564Kfr6m+wzeAESPU4DFhBuAMYAIu4C/UuWmcOebxecx6W02QnPUDFj/76Fm3pHcGenwYSy6NW5CJ1QgM4MHz7eBVJCb4vUJJR21TNOv8+oJk9Tm45O6hJ+O+13KTAez8tYEMkI76ayFPrbsqAd/Ovxdo/QtFvR4eKWJymtjFHL5ZrvVmmohIW5JBjamY5SKSo7eB+6XhpjUSpuHo4uW5rQ3gak4sEZoKJMEB3koIyslU8uUc/HHRN/7EyMaexzfWb037304c6vz5ygIDbVHkj0UHKyYBEk8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dy/8WQ52OO64CMFatY/j9n6NwwM12y2r8CIvJijdIes=;
 b=iydLJfxDhD5O1o2UDYnO/Y44Ob9gpMMiyQe1fstwd//dPhejT3o0GhhjtONO5blZ2XYC/Zky8yRpAcjqXqrG1QcFOwYBA/2aog9ds8otCZyA3x3r5CpaK2SHRItwajDm9INLJxIMeJdHc+6joTqnIxUNB/32TLu0nRoHsWeorEr8/y3Gsg8j0tWwVghZZMEmIltF6cFG4N0hXD7UDKmTIRdUWVlS/CO9rX7i8QiPtYGQfErFnsl6zJeUAXIwDojk+pb7ITXuk3C7KIeYNpVMqn/hh/3kfRlJ3zeDhD/M/zPYMV0ngYgico+JZIAzXL7Aeoq6MLiXKJ+qFX4v8E2umw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dy/8WQ52OO64CMFatY/j9n6NwwM12y2r8CIvJijdIes=;
 b=VrVF/d+dAd1OxPU9b95StWPSKGmjNbQmQ4TYtsjnbeopCwheC11WKeodrtjkSBri1/1Xc4iifZ0B5S1ChEMCf9C1nh2ckKkD4ZEjR91bhlgK3KRmkWTubCproj5e+cfu10OBTwyCeb0uiiASeBS6JzCKzJ7L4V2eu7IEWbyNi90=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2653.namprd12.prod.outlook.com (2603:10b6:805:6f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Mon, 30 Aug
 2021 17:15:06 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 17:15:06 +0000
Subject: Re: [PATCH v3 1/4] drm/ttm: Create pinned list
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20210827203910.5565-1-andrey.grodzovsky@amd.com>
 <20210827203910.5565-2-andrey.grodzovsky@amd.com>
 <a13d095d-1b0f-a31c-1479-1275c2e93877@amd.com>
 <e716dd6d-a338-86ae-9100-0e869f12732c@amd.com>
 <e70b7078-eea6-c798-0c67-0e59ec68d75f@gmail.com>
 <b985fb23-b74a-9401-154d-5f240a97799f@amd.com>
 <dc3fb1c9-dbf5-cd1f-8913-328faae9b820@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <566dbdf4-e149-505c-c9c1-8ee924760499@amd.com>
Date: Mon, 30 Aug 2021 13:15:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <dc3fb1c9-dbf5-cd1f-8913-328faae9b820@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0116.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::6) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:fe36:59a5:493:2924]
 (2607:fea8:3edf:49b0:fe36:59a5:493:2924) by
 YT3PR01CA0116.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:85::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 30 Aug 2021 17:15:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4de146d1-180f-463a-d626-08d96bd9b6bf
X-MS-TrafficTypeDiagnostic: SN6PR12MB2653:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2653999935283336E9C4B602EACB9@SN6PR12MB2653.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4VtCpYQk911/idRrko3C2RfpZGPqkBmeC4BAwCdhY1Ca4QjyeQIh7XXVN+MslNhL1Lm8rKyDKzriaSL6dfLXNNTF2HAvIAfsk8cj91q0BDekn9g6f/bJR+Xur822RB9aznRglQHpdG2YD311+azVXL8p8CTLUsQ1Oi4a20F1jCeE9/wx3xpMgLiorrlQQ08xU1riwq/28RQtu734HDyHm3qhiB/JlDaImNlf+mcCjGF0h8ejCSCufL3jGRpx5oCtTkTkwtA7X7/PYfzUvtoMdOINYGPGdQquVc+/OWhyzLkDy4uavHPNdaO8r9KcI4kEN0xxkYG8WTTNTXHUoe+OIY/48sCsY4HGLIvqjp8gZVQT1mXy+//3Ma+EWGj1V/FBsKCEmr8jDD9Q0KfQ6cdir8tl6ZB/Y/w7omfcji1/ad5wVz+aHhiuVvgyS3sIuwO9am2QuLjzyzjHNs7jwwpHXg3xsGeQddEjsxLXuC5KtSlcZ0e47HejVsMloAq0dDJ4vwfJeBC4xfdVvTZxMqmUooYUO5dVjDHr7ZJN8ZsjOBvrA+5XtGnRiscaHHKMQD7KgD9l5Xy7PPFL0it97jumx/EFGeHzPXglUeWDoVVVeyn6aH+X0LKdu4hL2eNhK/7e7k8waYPPi/bSe6QFztaV0V25YxffUb/8Nv8eJV9PE/PJyGNOfzwqWbXZTAXF72CKhVZcgy2ype7f3riU5yEa2uq3NmcCOB/7GgCD0REfVvE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(83380400001)(478600001)(44832011)(66946007)(2906002)(31696002)(66476007)(66556008)(53546011)(8676002)(86362001)(38100700002)(316002)(6486002)(66574015)(36756003)(186003)(5660300002)(2616005)(110136005)(8936002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm5uYlE2T0FpOG1tRVVmemVVWDU0aVlsN2YyS0dwaFZ2V2FEZkxlejhaY2JT?=
 =?utf-8?B?WTY5L2tZZjJISlFZRHJMS0J6Lzh4R1o2UG1rSmIyK1NnQlJybGtkRzcxY2Zr?=
 =?utf-8?B?dFdTeFF1UUtqSjdJbnNUT0RCdDA0K1dENDdIaFBkenlSaWRQKzhOSkZDWlNu?=
 =?utf-8?B?Wml0Q0s4ellGR0ZJZE83MEtrSnJMbmJadXNlbURJbDJWZzYzSTkxNVFIR0Rv?=
 =?utf-8?B?SjYzOTJxcG9KcDlWRnpGZXNncDJsTW9CaWtOZE9oRzFNYURnMXhiMmFudWpS?=
 =?utf-8?B?TTUyM01TYjVFVEFvVHE1Rmpnc3A5UUhzRGRKaHVKb1NEaW90eTV0bEcyRXBq?=
 =?utf-8?B?SlhTMzhqZkdieDdoRTRSa1diSFFnREE1MmdldVA2czZaSEM1bk84eTdnc0Js?=
 =?utf-8?B?aUZVR24zMkd1SzZlYVZiS3RENzdKZnhFbEdKWTExNE9Zc2ZnSVBTSG1rY0ht?=
 =?utf-8?B?cEgrRlRrYUE5WHlsSUtoaGNDSGErWVd4UzRSU2I0OVJSVEVyTmFHUFB4alll?=
 =?utf-8?B?Wm8vNVkrcUNzYndHTWxpbGJyRFdFVHdUMzllV1hTS2g3ZnZOWTduL091aG5O?=
 =?utf-8?B?TVpGUVN2eGd5U2JydmdZcUpPTFl6V040QkhyMzlMeStlS003T04rMjNUR3lk?=
 =?utf-8?B?U05Ncm81OElCV3ErUWp1OHNrUUlqZ0xyTi9FS1lOT1Z1c0RNMkU5ZDF3dlM1?=
 =?utf-8?B?QXVjUXJwYzl6TlR1KzNaVFV4T0Q2NFcrSWRObEprVXBENDhwWjB6d2xlZDhE?=
 =?utf-8?B?NklpRXR1TC9SZ29JZjJGS0NCeVQ5NDMwWnlqc0tIS3Rua05uUTBabW1tYmE1?=
 =?utf-8?B?cTJLdnZHcnAvQk41LzFBbXFRN3JQOW5ob09KTUdLeDRCNHBYMDU5c0kyYlRN?=
 =?utf-8?B?TElDandUeStXWGxONFFoRGRUT2lLOHI4Q1ZRaUcrbWc5TERuZEpuUnI4Vjh1?=
 =?utf-8?B?UlllOWtnSElsR0RCMUp2bXE3TFA5amxVeUZFSG9FQ3lGVXpzRFhoODRJYy82?=
 =?utf-8?B?cEhUb0RHV0RVczdhdlpKTEgwTTRMUlRHa1RRNjc2ZndNblpJeXpwVXBWZlpq?=
 =?utf-8?B?UnpoY3M0Y3gvK1VQK25PVTN6blpROHlPNFFXTm5jSGFBemFyeHBjd1JjcGVO?=
 =?utf-8?B?RWYzaFMyT1RUV25QRS9qOCtDdHV4MlZmb2RQVWFDYmRQQXVjaDIrckllUjh4?=
 =?utf-8?B?VTdLMURETTFOSmJuQzdIMGlRTGJkZE9ZS2lIN2xQeWprMzFML2xuL2E2dUw2?=
 =?utf-8?B?NVcwQXNBdHNZdkdaV1RUTzBNbFBsSWdxQkNvRDVpWTY4L25YTW1DVDNXZVJS?=
 =?utf-8?B?YXRDcG84VlBYRmplSUVRNCsrSndKcmJBVExJeGlFMG84QUYvZE56WlZuTFBS?=
 =?utf-8?B?ckl6Rmp6Z0orMUtqaWxzalU0YTRKUFREakFaWWNsMHg4aVlzcUtSZlVqckc0?=
 =?utf-8?B?VmJXdVloaFBvYkdwcWVlcVIzc1ZZL3drY2tEcDY0STN4b3dBRHFFZWxtT3I0?=
 =?utf-8?B?R1c3dHFVbjVuNUZFOHZVbXVtY01uMXlwL0xoamZ6eVhsbmM3QlRvQVJpbGJ4?=
 =?utf-8?B?bnVtSnVaRnBnYTZuRGVZZThXcWMzT25YMW05d2pIYUNmdUtEMnBDanlHV1ha?=
 =?utf-8?B?clBxNWw0Zy9FQ1ppMDN6Q2hEck8xTmlDY1EzTE1YQUhXWUtIbThrYXBjVWtZ?=
 =?utf-8?B?VkxYNjlBYUJTWVRzd0hnbXhlSTdZRjFSdURxd2E5a1VWY3hGWFB6NkZZYXd3?=
 =?utf-8?B?d3lEUzgzRUdiSEZ1ckl0WERaVkY2ak01alZsZ3RZanVENXlLWUVtL2FCMjB0?=
 =?utf-8?B?NUZNUWxDaDE5ZVlnd0VMQzJQS0t3elgyUHRKajI0SWNBc2JQU0dON0JRWVVK?=
 =?utf-8?Q?hzylBZGsZRtps?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de146d1-180f-463a-d626-08d96bd9b6bf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 17:15:06.9125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6Y1AZA3vGZElp2fyvxIb5EAe1aFIbMJqptQsKGpOcR/D6bYIMEoqBYyDntF6THId5pCGBLekWa8C5w02ndHAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2653
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


On 2021-08-30 1:05 p.m., Christian König wrote:
>
>
> Am 30.08.21 um 19:02 schrieb Andrey Grodzovsky:
>>
>> On 2021-08-30 12:51 p.m., Christian König wrote:
>>> Am 30.08.21 um 16:16 schrieb Andrey Grodzovsky:
>>>>
>>>> On 2021-08-30 4:58 a.m., Christian König wrote:
>>>>> Am 27.08.21 um 22:39 schrieb Andrey Grodzovsky:
>>>>>> This list will be used to capture all non VRAM BOs not
>>>>>> on LRU so when device is hot unplugged we can iterate
>>>>>> the list and unmap DMA mappings before device is removed.
>>>>>>
>>>>>> v2: Reanme function to ttm_bo_move_to_pinned
>>>>>> v3: Move the pinned list to ttm device
>>>>>
>>>>> As far as I can see there is not list_del() remaining. So this 
>>>>> won't work correctly.
>>>>
>>>>
>>>> It's in ttm_bo_release, there was no code change there hence it's 
>>>> not captured in the patch.
>>>
>>> Ah! So you keep the logic as is there. Sorry totally missed that.
>>>
>>> In this case the patch is Reviewed-by: Christian König 
>>> <christian.koenig@amd.com>
>>>
>>> Can you push this to drm-misc-next?
>>>
>>> Thanks,
>>> Christian.
>>
>>
>> I think It's supposed to go on top of your changes you mention here 
>> which are not pushed yet.
>> I will need to apply all the patches on top of yours and retest (I 
>> was doing everything in amd-staging-drm-next)
>> until now.
>
> Works for me as well. Alternatively you can just push this patch here 
> to drm-misc-next so that I can rebase on top and merge the rest 
> through amd-staging-drm-next.
>
> The patch pushed to drm-misc-next should automatically fall out when 
> Alex rebases his stuff on upstream the next time.
>
> Christian.


So i can both push this specific patch to drm-misc-next and also push 
the entire 4 patch series to amd-stagin-drm-next (after rest of the 
patches RBed)?

Andrey


>
>>
>> Andrey
>>
>>
>>>
>>>>
>>>> Andrey
>>>>
>>>>
>>>>>
>>>>> I suggest to rather rebase on top of the stuff I'm working on for 
>>>>> a while to move the LRU into the resource instead.
>>>>>
>>>>> Just send out the latest patch set of this with you in CC.
>>>>>
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/ttm/ttm_bo.c     | 18 ++++++++++++++----
>>>>>>   drivers/gpu/drm/ttm/ttm_device.c |  1 +
>>>>>>   include/drm/ttm/ttm_device.h     |  1 +
>>>>>>   3 files changed, 16 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c 
>>>>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>> index 1b950b45cf4b..1fedd0eb67ba 100644
>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>> @@ -69,7 +69,17 @@ static void ttm_bo_mem_space_debug(struct 
>>>>>> ttm_buffer_object *bo,
>>>>>>       }
>>>>>>   }
>>>>>>   -static void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
>>>>>> +static inline void ttm_bo_move_to_pinned(struct 
>>>>>> ttm_buffer_object *bo)
>>>>>> +{
>>>>>> +    struct ttm_device *bdev = bo->bdev;
>>>>>> +
>>>>>> +    list_move_tail(&bo->lru, &bdev->pinned);
>>>>>> +
>>>>>> +    if (bdev->funcs->del_from_lru_notify)
>>>>>> +        bdev->funcs->del_from_lru_notify(bo);
>>>>>> +}
>>>>>> +
>>>>>> +static inline void ttm_bo_del_from_lru(struct ttm_buffer_object 
>>>>>> *bo)
>>>>>>   {
>>>>>>       struct ttm_device *bdev = bo->bdev;
>>>>>>   @@ -98,7 +108,7 @@ void ttm_bo_move_to_lru_tail(struct 
>>>>>> ttm_buffer_object *bo,
>>>>>>           dma_resv_assert_held(bo->base.resv);
>>>>>>         if (bo->pin_count) {
>>>>>> -        ttm_bo_del_from_lru(bo);
>>>>>> +        ttm_bo_move_to_pinned(bo);
>>>>>>           return;
>>>>>>       }
>>>>>>   @@ -339,7 +349,7 @@ static int ttm_bo_cleanup_refs(struct 
>>>>>> ttm_buffer_object *bo,
>>>>>>           return ret;
>>>>>>       }
>>>>>>   -    ttm_bo_del_from_lru(bo);
>>>>>> +    ttm_bo_move_to_pinned(bo);
>>>>>>       list_del_init(&bo->ddestroy);
>>>>>>       spin_unlock(&bo->bdev->lru_lock);
>>>>>>       ttm_bo_cleanup_memtype_use(bo);
>>>>>> @@ -1154,7 +1164,7 @@ int ttm_bo_swapout(struct ttm_buffer_object 
>>>>>> *bo, struct ttm_operation_ctx *ctx,
>>>>>>           return 0;
>>>>>>       }
>>>>>>   -    ttm_bo_del_from_lru(bo);
>>>>>> +    ttm_bo_move_to_pinned(bo);
>>>>>>       /* TODO: Cleanup the locking */
>>>>>>       spin_unlock(&bo->bdev->lru_lock);
>>>>>>   diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
>>>>>> b/drivers/gpu/drm/ttm/ttm_device.c
>>>>>> index 5f31acec3ad7..530a9c36be37 100644
>>>>>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>>>>>> @@ -208,6 +208,7 @@ int ttm_device_init(struct ttm_device *bdev, 
>>>>>> struct ttm_device_funcs *funcs,
>>>>>>       INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
>>>>>>       spin_lock_init(&bdev->lru_lock);
>>>>>>       INIT_LIST_HEAD(&bdev->ddestroy);
>>>>>> +    INIT_LIST_HEAD(&bdev->pinned);
>>>>>>       bdev->dev_mapping = mapping;
>>>>>>       mutex_lock(&ttm_global_mutex);
>>>>>>       list_add_tail(&bdev->device_list, &glob->device_list);
>>>>>> diff --git a/include/drm/ttm/ttm_device.h 
>>>>>> b/include/drm/ttm/ttm_device.h
>>>>>> index cd592f8e941b..03fb44d061e0 100644
>>>>>> --- a/include/drm/ttm/ttm_device.h
>>>>>> +++ b/include/drm/ttm/ttm_device.h
>>>>>> @@ -265,6 +265,7 @@ struct ttm_device {
>>>>>>        */
>>>>>>       spinlock_t lru_lock;
>>>>>>       struct list_head ddestroy;
>>>>>> +    struct list_head pinned;
>>>>>>         /*
>>>>>>        * Protected by load / firstopen / lastclose /unload sync.
>>>>>
>>>
>
