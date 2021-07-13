Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE5F3C6F9B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 13:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639BF6E081;
	Tue, 13 Jul 2021 11:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AFC6E07F;
 Tue, 13 Jul 2021 11:20:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOAISOD1BMDI6wNtSihcIm7PorCdVuMJC0PFVkBrYMWy+BQM36CX7DQQ525G0qmP4YwlpjTg1etc1j0PJcTC8Z9cj/pGHxgfB2eA0/gk4sfO5OQHiNI1zOrP8sCPHLy2ygj3rMzYDuVidiQv/ofC4Cq2r+zrXfd022a8n+YFawveQCjMjT25HGks/a/iuWo4AwioYUMn+PT1AIRlN8HFQLfGcP0f/fJTYg5htVZ2h4gck2+dLOKGDA+nbEEFsPieUCpLWspQsMkMDjMRVyqoc8Z3rkb4CTkVNOMKCZr03+i+iwFge+NwkfZXiSCHt6TdvpfGaur9az0iR7jJ24jLnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvkUuB468EJ2fWJUUVHy0HuKZVTwjBcJbWOEwfwNWts=;
 b=QUc7gLJSKcGNGZBzYu4e1eLFT6MeB8HML48gdS0OQ8Fs3GGdCHSP3/RflPAwpgJ0W2pJA8lqWYVCLXcaWZEPHypNhqpNXvooUuwpSGtPVCZzEkVcR90TKnQlleC0rYo7WmnU1fokGmIeqxrfMafjm8lIWoaxwveWdjT+Rq7m/yiZFrm89bsKpvhGvgiEg0JBbXsq4gfZcMJpHRH0tuBrSsRdkBqXXSpTFR572tJWvslIMoI9fNb428r/QZCzYn+rwnyPylbKfUqR/MhNw1/G9d41jGWAOyHdIZfNNj7IC0TRhc8RyUV3mqb7Y/RvVO/WKHFXMi4m2F3rrwfMyWBAvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvkUuB468EJ2fWJUUVHy0HuKZVTwjBcJbWOEwfwNWts=;
 b=F/VFIYUZ7ZfNKvXTMri+epVaSvto6Ke2QAwCFZj9qQKWSVLrJbMgXMc2/GcyYJAuTYaqC/LQ5YSztPa+7NUPCHjILJx0hvJS3vrcKuBdBFccAJfa1NlmRnINA+JAgCDVkUJ6RV11xLGkAeRNTMmw+7u2xZrbszNXkNqrX+UBkT8=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4690.namprd12.prod.outlook.com (2603:10b6:208:8e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 13 Jul
 2021 11:20:08 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 11:20:08 +0000
Subject: Re: [PATCH v4 02/18] drm/sched: Barriers are needed for
 entity->last_scheduled
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-3-daniel.vetter@ffwll.ch>
 <2cd9df9e-08e5-d0bd-d4d3-aed00f699e4a@amd.com>
 <CAKMK7uE3dppw2=sVHRKx1b-ehVfiBphoJNJvpoPjt-=KsPp=Yw@mail.gmail.com>
 <5c5ef6ba-49d0-36cc-b537-e6f9c354f6ac@amd.com>
 <CAKMK7uGXVzaH25_spK5Pp8epx8a+9As6tVMcaj3p6Dedg0FH-w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <18e74b38-9949-209b-c19b-fc9dbcfd3418@amd.com>
Date: Tue, 13 Jul 2021 13:20:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAKMK7uGXVzaH25_spK5Pp8epx8a+9As6tVMcaj3p6Dedg0FH-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7f5a:cff:4644:b698]
 (2a02:908:1252:fb60:7f5a:cff:4644:b698) by
 FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.11 via Frontend Transport; Tue, 13 Jul 2021 11:20:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6126c782-4080-44c5-d705-08d945f02c1d
X-MS-TrafficTypeDiagnostic: BL0PR12MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB46907DD7750AB51C4AF83BBF83149@BL0PR12MB4690.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:81;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2G/DCB/x/8g/Rdk96+uU3EEf/P1ycajm4DvyEXysTc0FqrlxANLq1PHcy9Ppfz61daasY/NlwKyPvznlE2blbrsyzKkSaBoXjceLlpcnqcuFqCYADRWBs2rWofOL1dmOXNLu8yR2ShkL8iWtw3ZeMxMYA4sOM+rIdoYKETmZNO1FAQKW3DoFywKfn/sfTle7TwEkZPq4/xbP264PWzhSI3oFJHqRIgSA/28L1xhXis6WEqSHJSjUwh3QOckxFfkCvAemHb3cC//dq4EkBhDmdnanE7J6SdBB9wE6D0a3VQ1QVvKVyCceVcA7AXoUuUVswEAHw30eAaNWFTwzV36aMmvuHvn24A25rAC0mzPTHcXXSt1U34tB5Hdu2cCoVjmRWS8rk+x1eeUWBTleoPQH34wHxWgCFFame70DbhJDR4POCBwUpr2DJU3/Z9SwOZh2SY+5QxJrpSy/8miP+n/y9XAqHZpNm5VY9KJ7D+ziDOtS1pJ4WUlM7QmIYrUuuF26nn2T3VQG+bNWJ3v2zeA+rNeFP9W5lS2F9UyanRRJRclThw+EC3sPZFA7xBxXFJ5+jl+/nUDl3jhsh8TwSDmuhVL3onDfWKr5/2LXaLew+VIUH6zCdpLBBGpXPJEJjxVUtnWQxzAq95kG//IEcBfOJVksLfn0cQIiV/qOOPoU9ROQifK8jcmsI6a1jIYZ9IRiU0jyxISEdVofR8MqZyjkq/acDHjkCAVonW+NxHLtOfFjKq1IaNBAUoAHGNiVSki5NfNV8NpIPx87eQfHZooeDepCcx/tMuLV39dBO0Bs3/mpKDKQryLaI6snlog6q/76btnh6LnYag7pgkaiPsaapYg2M4fVlWRhOhspr7167Jo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(2906002)(4326008)(6486002)(8936002)(8676002)(54906003)(36756003)(316002)(2616005)(66556008)(6916009)(66574015)(5660300002)(83380400001)(86362001)(31686004)(45080400002)(6666004)(38100700002)(966005)(31696002)(186003)(478600001)(66946007)(66476007)(53546011)(60764002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2cwWXh3ZCt0VUduTUNNLzlTQk0wa281Y2dFWHpKRW9yU25IaFNxWlY2N2lP?=
 =?utf-8?B?KzJRczdxU2pPSGREQ1dNZ01pNnowZkxFRFpTRm41TVQwYXJzUHVmZDlqM0tv?=
 =?utf-8?B?MjZJMHA3WFdzMDlRQXB6aFlHWUNpU3U3ZEtSRUVFek02cG9YcWpBTmRrTnBI?=
 =?utf-8?B?YTVVTUcyMWlNVndMUFVPWEtTYzc0eHJXdTNxby9TcFgzdzRwQmZhRlprN2kz?=
 =?utf-8?B?RE9aR0JBWDZZeDNzUWFwWjNxVTcrNEYvdW1vWWVmZGZZdGtUaWxYTUNZaE1L?=
 =?utf-8?B?ZS85WnRTL3ExTXBhc2dtOFVNSEV3S3ZqNXBkM0pET2w5RG0yS2loUjFhVUJO?=
 =?utf-8?B?MmRuakRXUFNyTTZaL1FWODgrRFo1ZzVZNEZ1SlZZbkF4Z3Jrd3AzT2VORi9L?=
 =?utf-8?B?WlE0WWhIYkw4eFBEODUvOEZpb1JHZTBmR1Z4K3BzSURPZkxOdGRFOEtMelg3?=
 =?utf-8?B?Y1JEOC9NQjhORW9GZlBlcmNMRWFTdGhGZk9Td3loS3h0VjQ5UUwyYlB6bTlL?=
 =?utf-8?B?NU0yNmVoWXhIRTUzVXI0T29iRFd2UWl6WUE0V2JQZjY3a3Rrbnh1c0w5R3Fz?=
 =?utf-8?B?bDE2U1gvR0Q4eXFPYWM5MVVWRlZ2eVd6Q0cyQ2dNaWtVUUdXdzIyMDZTT1dz?=
 =?utf-8?B?OEtXdERaUkpuRjhqc3Bkcit1b1JlMElLeUJRUDRJay8raG12Mjk4YmkweERO?=
 =?utf-8?B?dDdVRDVMUm5CZ3BPd0JiUEg4bkZYV0JBRkNWSXNlMmNrcUV4Tm5PWTlLSkUy?=
 =?utf-8?B?ZlJxQXVSYjZRa25PMWdaMm5oKzNTZXFlN0FCZ2YrNVI2d0F5ejAzVWN2T0pR?=
 =?utf-8?B?YTZNRllYK3NEUnh2dndPc0J2d0RRMjlmbkdDTHBNdm4wOS82OXBpbXFIa2xR?=
 =?utf-8?B?V3dvWjVqL0JPN2RwNXdsNnVHWHNtRWpmSzVXbGdUMmhQM2YySHdqaWFRb3pU?=
 =?utf-8?B?MTc3QzBKUzl2WDJqN09oN1dpSUtwbVhBQjUrSXk5OTlKc01iV0E1MDFlQXYx?=
 =?utf-8?B?d3VzMDdMbmo0L1NZamFrUzdXSnJEV21JZDQ4cUdpbHZSM0RzZmNQeldCUk5M?=
 =?utf-8?B?cy9HR3lYK1ZVRkRTOW5kc3pGNjZyd1k2eFdhNmJMMHBtSEk4b2lPMlFianZY?=
 =?utf-8?B?T1gvN1Fldm5VaUh2TllySnJXbVFlUkFUbTZSSmNPSUhTdGxyZUgwbFBnR2FB?=
 =?utf-8?B?NmVCbU1TdXNRd0diZi9Bclp2SDV5RHlEdlhOUVV5c0dlYkZFOFNmU1R1UTVq?=
 =?utf-8?B?bENsMXdXbkpSNVFzZWVGUzFGUjZEWjdyY3NWZFQ4TEpqR3lINWtGRGpvUzBM?=
 =?utf-8?B?NXEzcUpQWC9IUmphdHczODhDdUNpd0tJbmNDWHVLV3U1bDI4MkRYMFp4V0hG?=
 =?utf-8?B?NzVXSEVLazhFNFM2amhCeFJBUkczWFVsdEhFRzVMOHMyK1BSS2pOZ3NKZWZl?=
 =?utf-8?B?SVFkODdFQkxCcXdyMGNWQ1B3ajFGUUk5KzhtYVp6akVVNURSUkFabjBNNGtZ?=
 =?utf-8?B?VlZmcFAvSnBpdFNWbk5oT2UycWRkZlpneTM2YU1PbHE4TmQxejJDWVo4cndB?=
 =?utf-8?B?TUY1MmtqTE9Nb0YxN0YrRTBlYXdocVdZS0V2bXN3MGg0dTZmdlVaS2xFQU9k?=
 =?utf-8?B?RDJ2MGlnMmZuNEtYc0xFMTJ3bXhETE1xSys4R3JYNVB0aldFR0c5OHEyWDZ4?=
 =?utf-8?B?LzFuaU5KVVhnckY4cmp0c2JaYmkzaFBVYjhCVnZVSGRlS2NyN2pwZjJPZFhO?=
 =?utf-8?B?QzlBZWJlREFaeGxGKzJGQkF2dnB2ZHNYYjZTUEFFdWJJSG1mbUgzc0c2bndL?=
 =?utf-8?B?YmRlRkt4eTZCZ2YyL0Q3U1pVOEovUjFHcHVqYysvZHljT1lQOUR2Z3NtM1JI?=
 =?utf-8?Q?nl0TFmQfucEYA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6126c782-4080-44c5-d705-08d945f02c1d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 11:20:08.6505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PwRZSgeFdescXaACijSz+HP39jVNhVwFRTIjGlnSaqYctvU2ZF53cbos5AD7AbYz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4690
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.07.21 um 11:10 schrieb Daniel Vetter:
> On Tue, Jul 13, 2021 at 9:25 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 13.07.21 um 08:50 schrieb Daniel Vetter:
>>> On Tue, Jul 13, 2021 at 8:35 AM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Am 12.07.21 um 19:53 schrieb Daniel Vetter:
>>>>> It might be good enough on x86 with just READ_ONCE, but the write side
>>>>> should then at least be WRITE_ONCE because x86 has total store order.
>>>>>
>>>>> It's definitely not enough on arm.
>>>>>
>>>>> Fix this proplery, which means
>>>>> - explain the need for the barrier in both places
>>>>> - point at the other side in each comment
>>>>>
>>>>> Also pull out the !sched_list case as the first check, so that the
>>>>> code flow is clearer.
>>>>>
>>>>> While at it sprinkle some comments around because it was very
>>>>> non-obvious to me what's actually going on here and why.
>>>>>
>>>>> Note that we really need full barriers here, at first I thought
>>>>> store-release and load-acquire on ->last_scheduled would be enough,
>>>>> but we actually requiring ordering between that and the queue state.
>>>>>
>>>>> v2: Put smp_rmp() in the right place and fix up comment (Andrey)
>>>>>
>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>> Cc: Steven Price <steven.price@arm.com>
>>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>> Cc: Lee Jones <lee.jones@linaro.org>
>>>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>>>> ---
>>>>>     drivers/gpu/drm/scheduler/sched_entity.c | 27 ++++++++++++++++++++++--
>>>>>     1 file changed, 25 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> index f7347c284886..89e3f6eaf519 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> @@ -439,8 +439,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>>>>                 dma_fence_set_error(&sched_job->s_fence->finished, -ECANCELED);
>>>>>
>>>>>         dma_fence_put(entity->last_scheduled);
>>>>> +
>>>>>         entity->last_scheduled = dma_fence_get(&sched_job->s_fence->finished);
>>>>>
>>>>> +     /*
>>>>> +      * If the queue is empty we allow drm_sched_entity_select_rq() to
>>>>> +      * locklessly access ->last_scheduled. This only works if we set the
>>>>> +      * pointer before we dequeue and if we a write barrier here.
>>>>> +      */
>>>>> +     smp_wmb();
>>>>> +
>>>> Again, conceptual those barriers should be part of the spsc_queue
>>>> container and not externally.
>>> That would be extremely unusual api. Let's assume that your queue is
>>> very dumb, and protected by a simple lock. That's about the maximum
>>> any user could expect.
>>>
>>> But then you still need barriers here, because linux locks (spinlock,
>>> mutex) are defined to be one-way barriers: Stuff that's inside is
>>> guaranteed to be done insinde, but stuff outside of the locked region
>>> can leak in. They're load-acquire/store-release barriers. So not good
>>> enough.
>>>
>>> You really need to have barriers here, and they really all need to be
>>> documented properly. And yes that's a shit-ton of work in drm/sched,
>>> because it's full of yolo lockless stuff.
>>>
>>> The other case you could make is that this works like a wakeup queue,
>>> or similar. The rules there are:
>>> - wake_up (i.e. pushing something into the queue) is a store-release barrier
>>> - the waked up (i.e. popping an entry) is a load acquire barrier
>>> Which is obviuosly needed because otherwise you don't have coherency
>>> for the data queued up. And again not the barriers you're locking for
>>> here.
>> Exactly that was the idea, yes.
>>
>>> Either way, we'd still need the comments, because it's still lockless
>>> trickery, and every single one of that needs to have a comment on both
>>> sides to explain what's going on.
>>>
>>> Essentially replace spsc_queue with an llist underneath, and that's
>>> the amount of barriers a data structure should provide. Anything else
>>> is asking your datastructure to paper over bugs in your users.
>>>
>>> This is similar to how atomic_t is by default completely unordered,
>>> and users need to add barriers as needed, with comments.
>> My main problem is as always that kernel atomics work different than
>> userspace atomics.
>>
>>> I think this is all to make sure people don't just write lockless algorithms
>>> because it's a cool idea, but are forced to think this all through.
>>> Which seems to not have happened very consistently for drm/sched, so I
>>> guess needs to be fixed.
>> Well at least initially that was all perfectly thought through. The
>> problem is nobody is really maintaining that stuff.
>>
>>> I'm definitely not going to hide all that by making the spsc_queue
>>> stuff provide random unjustified barriers just because that would
>>> paper over drm/sched bugs. We need to fix the actual bugs, and
>>> preferrable all of them. I've found a few, but I wasn't involved in
>>> drm/sched thus far, so best I can do is discover them as we go.
>> I don't think that those are random unjustified barriers at all and it
>> sounds like you didn't grip what I said here.
>>
>> See the spsc queue must have the following semantics:
>>
>> 1. When you pop a job all changes made before you push the job must be
>> visible.
> This is the standard barriers that also wake-up queues have, it's just
> store-release+load-acquire.
>
>> 2. When the queue becomes empty all the changes made before you pop the
>> last job must be visible.
> This is very much non-standard for a queue. I guess you could make
> that part of the spsc_queue api between pop and is_empty (really we
> shouldn't expose the _count() function for this), but that's all very
> clever.

Yeah, even having count is superfluous. You can much easier do this by 
checking if the pointer is NULL or not.

>
> I think having explicit barriers in the code, with comments, is much
> more robust. Because it forces you to think about all this, and
> document it properly. Because there's also lockless stuff like
> drm_sched.ready, which doesn't look at all like it's ordered somehow.

But then you have to fix drm_sched_entity_fini() as well which also 
relies on the same behavior.

Regards,
Christian.

>
> E.g. there's also an rmb(); in drm_sched_entity_is_idle(), which
> - probably should be an smp_rmb()
> - really should document what it actually synchronizes against, and
> the lack of an smp_wmb() somewhere else indicates it's probably
> busted. You always need two barriers.
>
>> Otherwise I completely agree with you that the whole scheduler doesn't
>> work at all and we need to add tons of external barriers.
> Imo that's what we need to do. And the most important part for
> maintainability is to properly document thing with comments, and the
> most important part in that comment is pointing at the other side of a
> barrier (since a barrier on one side only orders nothing).
>
> Also, on x86 almost nothing here matters, because both rmb() and wmb()
> are no-op. Aside from the compiler barrier, which tends to not be the
> biggest issue. Only mb() does anything, because x86 is only allowed to
> reorder reads ahead of writes.
>
> So in practice it's not quite as big a disaster, imo the big thing
> here is maintainability of all these tricks just not being documented.
> -Daniel
>
>> Regards,
>> Christian.
>>
>>> -Daniel
>>>
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>         spsc_queue_pop(&entity->job_queue);
>>>>>         return sched_job;
>>>>>     }
>>>>> @@ -459,10 +467,25 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>>>         struct drm_gpu_scheduler *sched;
>>>>>         struct drm_sched_rq *rq;
>>>>>
>>>>> -     if (spsc_queue_count(&entity->job_queue) || !entity->sched_list)
>>>>> +     /* single possible engine and already selected */
>>>>> +     if (!entity->sched_list)
>>>>> +             return;
>>>>> +
>>>>> +     /* queue non-empty, stay on the same engine */
>>>>> +     if (spsc_queue_count(&entity->job_queue))
>>>>>                 return;
>>>>>
>>>>> -     fence = READ_ONCE(entity->last_scheduled);
>>>>> +     /*
>>>>> +      * Only when the queue is empty are we guaranteed that the scheduler
>>>>> +      * thread cannot change ->last_scheduled. To enforce ordering we need
>>>>> +      * a read barrier here. See drm_sched_entity_pop_job() for the other
>>>>> +      * side.
>>>>> +      */
>>>>> +     smp_rmb();
>>>>> +
>>>>> +     fence = entity->last_scheduled;
>>>>> +
>>>>> +     /* stay on the same engine if the previous job hasn't finished */
>>>>>         if (fence && !dma_fence_is_signaled(fence))
>>>>>                 return;
>>>>>
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Ca29a8f0b7dea46d9be7608d945de0570%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637617642150542001%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Rv%2FY8LKVKz09FuqC2neEM3Ps0NMJq1SeZ4Y08wkUKBI%3D&amp;reserved=0
>

