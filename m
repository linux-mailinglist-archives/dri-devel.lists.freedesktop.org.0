Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 884C74F91B5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 11:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E0510F167;
	Fri,  8 Apr 2022 09:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2045.outbound.protection.outlook.com [40.107.100.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14F710F165;
 Fri,  8 Apr 2022 09:12:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRl3uc3SMLwBJdNfWGKMG0fY55fQT4dCz69SwDbUA2M3VA9OYCd1hQRfY/rGvLz9NYB16MqHrrzFCnqzI8gDD/Wdla3t3em4wjTtCYj+f63uCdKmhwGfIyvIIebL8/ejtRhgY4sY+gXhNKD8UdqjZEMQNHU84KW+TPj7G2RBf3wBvQYa1sOxlUKB7PS5LiQgG0lgMJLjjzgcDC7kS/0ja9jxhaL4lcliS+0DhUQescYutj9Gz6jUBHztsNYENOb0TCQp/Y+EVpQu6hav8q96X9zhUx/FizxTZvxGsJiCux2obCXuinL5ihX5uJQVAdA1idcuauCvhX+Dl069Ogm43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyBX+cU+I59SkUuqTnSMj8xY+kXuGb6xqdm7FR51BFE=;
 b=VVXz4Il8twJPGtb278NCdQHWUCCuhXDgs5gQ1lyXny5BeK93WYN+OIIOpYZ7PyaijYH2BjlAITnrb1okQ8/p8NtukzmlR+7hZzm99bxRqHBu2491lJtNGvZnPhsGqI1GkzNvWllyjuOVTuB/GMsNu36vjfuSSVWsNCnSGRdoNxA15QHFK8psprZmS2jhXgk9ZFgymO0TrAXN508+BBSBmeTa78oJ5LY26ZP7wbqpZcZVzbO801jIU7xmSg5fkPui5wu773PGPYoeO8BxnCFnqIqqI5IWObfs7g15H5ZTCb83luFzFxrZktX44isLbj0LLaaM6mnkD+Dw8lV7ELpBtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyBX+cU+I59SkUuqTnSMj8xY+kXuGb6xqdm7FR51BFE=;
 b=pqBkTDH/Ebvhf/wDDfv++8biNl/QjSi6qdjxDbcU30ALiiCM6cPEg5mSWHguFCKj+8qrPhgcoG5JFanLmn2o317VESu4hpl4jKHiSD3DeWryxO23d+VQnpy8tDUUNuLG4IRdXuaN+t6qavko8aFHPf7GILbrnVi6lgo88CjNNNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (20.178.210.205) by
 CH0PR12MB5331.namprd12.prod.outlook.com (13.101.44.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.22; Fri, 8 Apr 2022 09:12:45 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 09:12:45 +0000
Message-ID: <362df6d6-8ed7-17ae-077d-034425fb4e0d@amd.com>
Date: Fri, 8 Apr 2022 11:12:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: fix
 i915_gem_object_wait_moving_fence
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220407164532.1242578-1-matthew.auld@intel.com>
 <20220407164532.1242578-2-matthew.auld@intel.com>
 <2b3b28b9-6746-9fb3-3651-16f7a029d2e7@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <2b3b28b9-6746-9fb3-3651-16f7a029d2e7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0302.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 155b9465-f7da-4990-a80d-08da193ff13e
X-MS-TrafficTypeDiagnostic: CH0PR12MB5331:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB5331683E3D0C78D8D21BA65383E99@CH0PR12MB5331.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QJBu0XlXpfRty4kEAGCsUckjfGcz12puLaQJyoJiFHUKnpb5P0qt2tDe+JI8j4Vfo6uyZtC6/N3z8Ndam4G8iA/y5lRvtY2KRv+UdfjS8MrlrZB5J2RHQgEns7oC1x+HbqsF3325NnAkB7qRUjFKaajoIl50cq0pTqqCobCYVz7Mbna/r1/ukQ+gQS9bWyTVH0hYjgwGzo7puUaJLA6Q3Wudore9RFW0w+Wh6c8e3DKjuilhANxcLnVnu4LFM3rH/jyC4/yE/u+UPG3q+wOYpZ/18iWZ0h0PXiX7e7D9igAUiUTsPI9EDLhltbpjHK3/z/YXuH2go5m6rB6xb9gzzv0yFM0KmG9YxXG2ye9HDv2AAFxIn/YnjB9w25uKJePW+dTx6Z4Ri1F4JfquRN4DwBItgNIaQLvfW00Eu6FEe1MEALWeYQvNC54U4ARIaXC1vwIpXEHjCQjIThRP2tTFwHrGuvR3luT5wliaDeIWt/Qa2s3Mx+/06hOr03V+bx4ZFu6ZiONhIikDlGb6JUoM4qTmuVpDWkfrf3wxB8UK7ztKzsOfko8At64/k1yiZ8AFLkPcn81OM5jX/pZ59Iq2/AK+6Z0AQ2xSDyJdRq+2MpCGake9SbOcq4dGNIhw2adsgVTRjPrfUS98syX7SzS837fpfEGhtZFrSMqXIWI/YgzdghquqXLfSNNuih0A093m5hqcvnUUpUsm/QlhrbpO2W7WXdRzCFkNfNSTOUkkEFgT0bwIoh0O41crlVxfhIyN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(316002)(186003)(86362001)(2906002)(83380400001)(53546011)(36756003)(508600001)(2616005)(110136005)(66574015)(8936002)(6486002)(4326008)(31696002)(31686004)(38100700002)(66556008)(66476007)(8676002)(66946007)(6506007)(6512007)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0s0KzJBWktsOWRndU5vQmMxbm1FTlM1SHdidEJOY3JYVXIxVDhua2I2N3hI?=
 =?utf-8?B?Q0Z3YUhnN2QxRzNiL3NiTjladW5BYnJQNHFIaHBoSktUQjVEVmNzRHBtUHpZ?=
 =?utf-8?B?ZEFNalYyTE50NXNaMFhNRHpkUDBvVFRiaHBzc09GcEhPc3dhS2syUE1WNGNG?=
 =?utf-8?B?dml2eVB4dU80RU01QnVldEIyYnVKQ3ZBSm5oeGZ6U2xSZEwvblhDcSt4NU1U?=
 =?utf-8?B?NDc0TndXUXFMSmRWZ0Ewc3Fpc2M4eE1JSjVHYTYxcVBON2xMVGkxNWp0NDk3?=
 =?utf-8?B?MlRIS0pLanR1QjR5elRVTm42SlB0eDZGd0x0eVd3MmhCUERlU0hBbDRSMUw2?=
 =?utf-8?B?cDh5cjh2UC80cVJpelR1SCtCcW1UOURSeEhrZ1NKSVpQY3pXRXFzS2VyQmxK?=
 =?utf-8?B?anFlc0o0TmlGVFNERkNXYUkvN3VTdiswS0ZZVHFkRWVZWGhOeG81My9IN2w1?=
 =?utf-8?B?eTVuRHpzampnSG5HMm1hZDJQT0N1RWNPTmk1MDNaQU5sLzFpTUt5NWtaMDJo?=
 =?utf-8?B?UHZ0YjJUM21ZaHo2OWtQQ3B5WnVjWWpIU2xVcm5uNTlIWHZySGJKUW43OG9k?=
 =?utf-8?B?WVc3TnM0a1pvOWpPT1dlTVF1SmpkRysyZEhQTlkwaWRUN0E0MlhUaU9CVlJK?=
 =?utf-8?B?ZWFNS1FLZm0rN1UxU2p4dXZmUFZvVFUweDYxdnJjVytqSWZhYjBJdGpDbVpr?=
 =?utf-8?B?TENyRFpQVGxDQ250elpidHIwdTFoenBTcXdrMDM1VEdRWUduRmtZUTVqVkJo?=
 =?utf-8?B?azdsYitxcnM0SHdqZnZvVHlLS1IvdlFYSWtTU3pxYkhINHZTWnY1SFNNZHBJ?=
 =?utf-8?B?dWcrYys2dmp2R0k5Um9PMi9WaXc0cmRoMnk4eHFyY2tLVFIzeFhEWjJ6TGZr?=
 =?utf-8?B?WHlhNENNZ0hhLzJiS1lMRXU3bS9OTVFRWU5rK0Y3U3pwSS80eDNncFAxT1Bl?=
 =?utf-8?B?b2pIcllQaHNpdFJHT2hXVlV4a3ZhbithMkFpV0ZlRCsyN3A1bUI5aE13MGJv?=
 =?utf-8?B?N1gzRjZqZmxpcEQxT280ekRkMUYzL3JUU3BnOUpTU3l5TFRhNklQdThWTURP?=
 =?utf-8?B?SHcvZDNUY0lPOVlRWkpQbWgyeVpMMTFUYjR0dUNodnJwemdPZTNtQm85ZmtZ?=
 =?utf-8?B?bWR1YUZjNUlwSHo5ME5qYmtabjd4bXhqWHZqM2IwM2o4aStzSURnNFdSQ2ph?=
 =?utf-8?B?d014ZmUrcnlPOUowcFlmZ1dtdlVYTmJQUVRlRmU3a3paVFNCaGJHaU15Rzlq?=
 =?utf-8?B?WFltdlQrOTFmRnBDb01BeGdTMVV0UjZPWTBtNUhxWjcvWEY1OVpyMlF2dzZM?=
 =?utf-8?B?bC9nM0IxVEI0RG0zYThLNW1GRHY1bzlyeExyQktJeU5HR285ZVRyQ2RjWTRx?=
 =?utf-8?B?OGx4QkFNc0xuNkJ6L1M1RG9xU1ZJTTlKSzZVczhOeG43RkcwemZ2amRWNWRG?=
 =?utf-8?B?Rk5tcnUyMXYxU1RVcHdXWVBQcTNmY3k2MVBWblhZUS9nQWI4allEMHpaeGg5?=
 =?utf-8?B?Rm82T3NNdXdWY3FQeGFSUVZDdDhjZGF1OE1hZUZsZWcxaUJ0U0lNbkFkMlVI?=
 =?utf-8?B?UHRUSkh4dnpNWkY0QnVjT0t6S090dktkZ21sYnZwK2VrUWZpYjJWSjdCem1y?=
 =?utf-8?B?QlNQT3RodkE3bUNKcmtRY3V1aWZTdmt3OVR6UDVzMmJ5MzVScUxQcFQ2UE1J?=
 =?utf-8?B?dlMvbHhMOTJzN1A2cHJSR3JZa3ZFOHh4L2lpWlVjc1hQNTA4KzRoYTZCUkhv?=
 =?utf-8?B?WW81WHpoMzV3NisvMVJkamtUNzdOR3BlRUpBQjhIMW5mYUQyRW9GaDB6UXg4?=
 =?utf-8?B?UWVjc0llbUFzTklVSnJEUzhGU1FhZE5JZ215MTVEdVBDaUZXN1BrcSs5dU1F?=
 =?utf-8?B?M25BTGliUytNdXcvOFk4QzZ3RTQwNjV6OHQrRGdCMnQ4WUg5T1o0aUxvYmdS?=
 =?utf-8?B?Q3hoN1NEWHhYKzJURlAzem4rZzIwNDhpU1JMWkJQR2xZUy8rZUJPUkRwQitw?=
 =?utf-8?B?SHFleGIzOGJYU1Q0QUFrWm90aTlGZXZVeFhzSklVZGFwTjFEZWxNcGxNMWx2?=
 =?utf-8?B?elhpRUNBUFpYMWUrUXNReDFXMkF2d1BndFlOUUtNVExWTVpaUDczdVBjWGtJ?=
 =?utf-8?B?K01PTEVRRG5tYWg2ZFJEWi8vQkpxN0lmNnZxRlhPRkZBa3krV2o3VFhBY0Fj?=
 =?utf-8?B?Mi84T3lEcWlKdHcrUkQ3NVJPd0FwMnBpMU8rd0VXTWg0MEZjNWo5Y2tSMW43?=
 =?utf-8?B?V3QvSWtMM1ZucmdwclRERlRYQmdYVFc3QTZhNTBLdDFCZDN1aTcrdlpjMGhQ?=
 =?utf-8?B?UlJvdkkwb2VNSC9nbE1QZTFmOFRGOC9hdkF4ZzI0cG01NkhBU1p2NmoyR2M0?=
 =?utf-8?Q?2B8CzF40zSFlTUtkT+ckpEvUR7bOs1w0Qrocq2ReDxhN/?=
X-MS-Exchange-AntiSpam-MessageData-1: YWS2Vf/wI7IlkQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 155b9465-f7da-4990-a80d-08da193ff13e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 09:12:44.9426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avH0msJhjHagPtws6+IY5uu9XZJ0zQKIKOhbpRM49UvOXbWXC2q7X1s5UCKOupJ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5331
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.04.22 um 11:08 schrieb Tvrtko Ursulin:
>
> On 07/04/2022 17:45, Matthew Auld wrote:
>> All of CI is just failing with the following, which prevents loading of
>> the module:
>>
>>      i915 0000:03:00.0: [drm] *ERROR* Scratch setup failed
>>
>> Best guess is that this comes from the pin_map() for the scratch page,
>> which does an i915_gem_object_wait_moving_fence() somewhere. It looks
>> like this now calls into dma_resv_wait_timeout() which can return the
>> remaining timeout, leading to the caller thinking this is an error.
>>
>> Fixes: 1d7f5e6c5240 ("drm/i915: drop bo->moving dependency")
>
> Has this one went in bypassing i915 CI and merged via drm-misc-next? 
> If so I think it's the 2nd large disruption to i915 CI flows recently 
> so the lesson here is try not to bypass i915 CI when merging i915 
> patches.
>
> In this particular example, unless there were merge conflicts causing 
> the series not to apply against drm-tip, it should have been doable to 
> copy intel-gfx on all patches and so get the CI results. (Even if just 
> with --subject-prefix=CI && --suppress-cc=all before merging.)

Exactly that was the problem. I didn't got any usable CI results for 
this set because it always caused merge conflicts between i915 and 
drm-misc-next in drm-tip.

Regards,
Christian.

>
> The second question is which branch to merge through, on which I think 
> i915 maintainers would have liked to be consulted.
>
> Regards,
>
> Tvrtko
>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> index 2998d895a6b3..1c88d4121658 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> @@ -772,9 +772,14 @@ int i915_gem_object_get_moving_fence(struct 
>> drm_i915_gem_object *obj,
>>   int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
>>                         bool intr)
>>   {
>> +    long ret;
>> +
>>       assert_object_held(obj);
>> -    return dma_resv_wait_timeout(obj->base. resv, 
>> DMA_RESV_USAGE_KERNEL,
>> -                     intr, MAX_SCHEDULE_TIMEOUT);
>> +
>> +    ret = dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
>> +                    intr, MAX_SCHEDULE_TIMEOUT);
>> +
>> +    return ret < 0 ? ret : 0;
>>   }
>>     #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)

