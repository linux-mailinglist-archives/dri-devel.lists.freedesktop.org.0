Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E2A3C6B32
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 09:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6576E054;
	Tue, 13 Jul 2021 07:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F716E03F;
 Tue, 13 Jul 2021 07:25:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEUengGlbwHxdmYZtY6IJXNIpcv/LiO20kA5qYv/HzDZAAzdIZF08bXJh8jCwQYgPJbVMI/V+gqLQtcs0VMRtY3iyENsNdLEuEvy2uiZZR+SoNutODn63kkNg+xjYkVuZ5IrjGwwHZ8wS/ln0tbhobrGGNPe7z1QQR2L+pd+ofCN0I1hdpoSfQ4QHvvE7w5vae9484Md/mRUba6levxk0VzwopEgldJJrkzAUIA+Q+So3Wg6NIOzsqyKrL78HUNJ2A79DZySlZJ6lC7OGdseM0KD2XGLp1fufEk7nHjDzl5pJ0S6Mh5MIbgJypUZzPOMyiAal7k7dKEoNvrIJqOcqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6i3P+uGvsXCnrej8kdxCtr5CVIr4IRmLAE8qv58NAE8=;
 b=as4VB4YV+ko/otUjy6OkvoRZc2jovzaPO7Arxeptwrnx90r97gS9N1Y4pICEQjM88U6PkAA/c8XTUePXWM83M7rKg3oRCOGayyijaxFRCwe5E6Eitj2PAmt/O6xpxSAtDvKgeTbXfqQOY8IzPJuyPCF3YYVMakqfgScAjwhiM+g+ksRh+pCdMUfpJIfSnWeDiMHGmjTVq8KFRX3YEAlBGBC7XqUJ//LWC5IfmrdycOZe0VypqCzCmB2ZNDAGuScOuYd/sFxMVfQ/5ubVEg5kNJQp2/ww7jaXQDuTgNbnh3Fykhpw5KdlyPGEYlW8GE59Es9PIxtLVzk7hSTyjr/vyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6i3P+uGvsXCnrej8kdxCtr5CVIr4IRmLAE8qv58NAE8=;
 b=d4q29FHfpsV6yaZI3FwphN/hRzd784FgqDrO1WGiaZOmjv9aPG6lqWbOxKq2nJ61YXHXnDimTsybFYYbDngfN1dw1Z2mdjx5mArqj/wFUKzNUovuXPDD3wg7J7b8LXcsuCrH1AkihZLcuN+U2rfo419gMiVjpseRtGyi5XRulE0=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3840.namprd12.prod.outlook.com (2603:10b6:208:16f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Tue, 13 Jul
 2021 07:25:31 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 07:25:30 +0000
Subject: Re: [PATCH v4 02/18] drm/sched: Barriers are needed for
 entity->last_scheduled
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-3-daniel.vetter@ffwll.ch>
 <2cd9df9e-08e5-d0bd-d4d3-aed00f699e4a@amd.com>
 <CAKMK7uE3dppw2=sVHRKx1b-ehVfiBphoJNJvpoPjt-=KsPp=Yw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5c5ef6ba-49d0-36cc-b537-e6f9c354f6ac@amd.com>
Date: Tue, 13 Jul 2021 09:25:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAKMK7uE3dppw2=sVHRKx1b-ehVfiBphoJNJvpoPjt-=KsPp=Yw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR1P264CA0020.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::7) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7f5a:cff:4644:b698]
 (2a02:908:1252:fb60:7f5a:cff:4644:b698) by
 PR1P264CA0020.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Tue, 13 Jul 2021 07:25:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8db705a-767a-4531-c0ff-08d945cf651c
X-MS-TrafficTypeDiagnostic: MN2PR12MB3840:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3840B77EC1A35301EC0938E583149@MN2PR12MB3840.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:109;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wzLpNimfVLe0VfoaDeKcgbPtnd1s+bpCahogQNIxbHaGfKMN0uJXEvf5IE4iuEgzeVXnFSmkGOLtLEGUZaW/GH8a1rBZJSeHOszJbRqrH6BRznnlLIGO/SK9Jyw2vwmbim7L19VftQpZsS03UKaYJBRawl5dqP3FFLLhw2L2Q+K0/fwYRNA4Rj4/rjcQ3MReMDmOmiDBjPC3lGKP1yEIMe6cWUd8phXY6Fe62NFXxhYWz0JWAKMOmSIREAUGfqxyvXYSm+uGYvCbWvaHq3GOjGsA5RlLv7+jpelfadF2JuerWVQBUBIgzlSU3cfvh9HyOV+Um8im47CHLwY3nTgFq8MsnizH+//id7IXyJ8G+G/uEUMnJzVd30EuUzg3ZAY1uB6lShw55Erf/3Pua7x2K6ybsY/N2wJpt9xbAzngp7luTjjoq5XBYupEAOzCTYXfykTqRcRNjgDNx0GkMfgoHxSoSHL6XzT9FIoe44I+HOke0hD69kU4Vh7R1TRO54sZoEhz5o56Qx3q4y4UH5i5r7/Xf8/ItzvisDDbcZORVHXOUJ4lAPvC5e04eJBsMfUAO/NnzXf5pOs7bMIk15RQbSxTloJunai62iW1uO2vytwbNfy9xCkNLETVa/IdxofURNw6K3bjtE6zlN4BuqU87lHd/CYG+gl+vYx3irb2E9diRM9GtYhbBA8Omt9AlE2q3gFd1Z9UwJNvcSgzHcfIa4V3OoRk3L0XIX1I3FpgSpfovQZ6iVabsy4SPOotKD2efAe/vSVj4+mk/XCv0YQ2Mj7K5nKJs6Jqn28orl7ByKY5iENlyAfKFSZP1hazZFnsI5QaGmh/JgysUyVvCkqW+tTWKmP5GBHtUB6+5avKZTQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(5660300002)(966005)(31696002)(36756003)(8936002)(86362001)(2906002)(2616005)(66556008)(8676002)(478600001)(66946007)(45080400002)(31686004)(186003)(53546011)(66574015)(66476007)(83380400001)(316002)(54906003)(6666004)(6916009)(4326008)(38100700002)(6486002)(60764002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjZDQjlmYTVhZmpqcklqczJZNEQzbUorZkIzd2psdEo3ZFFQQW9DSm9FajRX?=
 =?utf-8?B?dmVSMDRpUmhpNTVWeFVjYTB2dFVjRjRUYnp1Zk1DTnVoc1pxdHJXY0xQRENF?=
 =?utf-8?B?OVVaU3U4QzJMNERRWlBNa3EyWTgxVlFiZTlhSnErNkwzMFVCQkViOGtFQlJP?=
 =?utf-8?B?RDZDOUV4MTJEbkNYOG1iQlV3TGpUUXkySjBzNHFXaVN6d0RDR011ZXVIRlpj?=
 =?utf-8?B?bWlyUXdkWHpSMFo5S3o5NlYreWdkcGo0QzI0U0M5Zy93NS9vblNyR3VUa3lP?=
 =?utf-8?B?T0drYW9keksvOE1TbEJQZVFtQW5RVHJEZWQ4MkQxd2g3SlBBS1RqU0IycWpC?=
 =?utf-8?B?WU1rR2kxUFQ2SnE4UFh6S1NpMDhlWjVjWjQvQkMySWF2NU5Hd0NNdTBwZWFV?=
 =?utf-8?B?TDdGckZueXdvdjQ5aFRrZVB5ZE04aDVrM2FQR1VhRW1nZWNKZW5OQmdzMkJQ?=
 =?utf-8?B?aWJ2d3hlMmNSaHF1ci9PbVNVZXQzdnE0SDF0emdUZGhZMmxiQVNIUHhROW9n?=
 =?utf-8?B?VTZqR2pmNE5SeElweTBhMktSRGxiM21zMlloY2NOaURZQk5URkR5Kzgzc3hV?=
 =?utf-8?B?WEEwV1p5UUhEaVZzV2tYbU9zTmtGTGNUaThvNkVkOWUvYU5QdHdSVitJSkRW?=
 =?utf-8?B?Q1R5L0R3Y3MxQ1RjVG5QQ1RWdnB0a1BpLzJPZ0NNWVJ5ODZzcm5QbFNWY1Aw?=
 =?utf-8?B?RUdNOXRJSjhVcWkxcy9LVzJRVFhSUEZiTzdQNmFCclJXby9IZlp4UE5YblJ0?=
 =?utf-8?B?M0VxdFExY2k4VlRyTmh2M0xvcmF0VWNjM2hiejNGUitvOWxSeW9RTGxkV0ta?=
 =?utf-8?B?YWdpcmRUVUZoUUtYQTBnT3Rvc1VVdHIvcWR2Wjd5a2VhSTNpNWdVVlRPWGNJ?=
 =?utf-8?B?K09Nazk2QzU5YXlMU3BDeXdJTXpSTUZ6TC9MZFZuWVd6OGI2TFhHOVNGcVlB?=
 =?utf-8?B?MEZmNUtIa2ZXSEVuWlhKcDdHaGdTV1ZOWUt0TUtqQWVlcHJySklnaFBKNHUz?=
 =?utf-8?B?SUFWYnN5ZFFpS3gxR24zVFdHN1VwQ0czVm9YeWVLT1BlOWxCMGRCai9kUkZM?=
 =?utf-8?B?bENpa3lZemZiYlJuNWNvMTNCbzQzMVkwZjQ4aDhJcU9BRkE2MTJOdThOMkNP?=
 =?utf-8?B?MVVaR1BBbXNSRzQ4Q0RuMWpyZVF3Wjc2dmtGaXNNT1Vnd3drNDZlSkJON2xw?=
 =?utf-8?B?V09JU3FZTFlMK2dqK0pkc1dYN3ZJb2RVa1k3Q1ZqYk4yUkdvNUNobjhsRmF5?=
 =?utf-8?B?ZTYwQnlLSk9iQjJMN3pVT1ZwRnlCNnNIeHhQc0l1MHVmTGFDcytjQU9FV2Zk?=
 =?utf-8?B?cVpSRkhmL2RZYk9pK2J0c2FybnNWNGRRRmZvdHVsNFo1NmJWdUd1M2orUVJK?=
 =?utf-8?B?N3I5OWNvVEdXeCtNL0xzQzFTYjdTdmN0R1lUT1RRcnFvQnZCYWdUNi9SMytY?=
 =?utf-8?B?SnZkMHQvMWgvV2J2NjhjL2J6RUFVOHVraFJvbld2bDFrZVpKS2c5dG9GYXQ3?=
 =?utf-8?B?UVhjcnRuV1YvaW10WmhPZGMzbTBNdHRNYm5IUlp3SHZWSGxiUnZ1UllhaHRH?=
 =?utf-8?B?ZlRyL1pra3FlNm9ONmh1TlJBdG5JNDBnallNZHorRjBxSEdFTjRFMWRWcCsr?=
 =?utf-8?B?RjJXOGhURk9pUE1uUVRpa0w1YTljYXg3bzJISnRJVGc5SHhERlc4OTV2UGVt?=
 =?utf-8?B?eFF2N0lKZnEzUW1BSUxqTHJyekpsYnhZYVNEY0FMcUVCdWhQeSt1Q0JiV0ZR?=
 =?utf-8?B?UTAyUnRPVExFZjh2U1ZSbGlxQXlDVTd1QUVkN3pNTk1FeVV6UHRVSFJZSE04?=
 =?utf-8?B?TzhLcllFME1RMjRCWG55ZGZraERDbkpUcnFYRExhTW1IWFc0b0d3dllIekE4?=
 =?utf-8?Q?MZKiUs2txVDt1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8db705a-767a-4531-c0ff-08d945cf651c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 07:25:30.8614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+jx+9noCNBrLVeqcqsA7r+h8FvUZBagcP70J9cwA+fmkaRZu9YpbiHK0nG8zX1R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3840
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

Am 13.07.21 um 08:50 schrieb Daniel Vetter:
> On Tue, Jul 13, 2021 at 8:35 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 12.07.21 um 19:53 schrieb Daniel Vetter:
>>> It might be good enough on x86 with just READ_ONCE, but the write side
>>> should then at least be WRITE_ONCE because x86 has total store order.
>>>
>>> It's definitely not enough on arm.
>>>
>>> Fix this proplery, which means
>>> - explain the need for the barrier in both places
>>> - point at the other side in each comment
>>>
>>> Also pull out the !sched_list case as the first check, so that the
>>> code flow is clearer.
>>>
>>> While at it sprinkle some comments around because it was very
>>> non-obvious to me what's actually going on here and why.
>>>
>>> Note that we really need full barriers here, at first I thought
>>> store-release and load-acquire on ->last_scheduled would be enough,
>>> but we actually requiring ordering between that and the queue state.
>>>
>>> v2: Put smp_rmp() in the right place and fix up comment (Andrey)
>>>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: Steven Price <steven.price@arm.com>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> Cc: Lee Jones <lee.jones@linaro.org>
>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_entity.c | 27 ++++++++++++++++++++++--
>>>    1 file changed, 25 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index f7347c284886..89e3f6eaf519 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -439,8 +439,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>>                dma_fence_set_error(&sched_job->s_fence->finished, -ECANCELED);
>>>
>>>        dma_fence_put(entity->last_scheduled);
>>> +
>>>        entity->last_scheduled = dma_fence_get(&sched_job->s_fence->finished);
>>>
>>> +     /*
>>> +      * If the queue is empty we allow drm_sched_entity_select_rq() to
>>> +      * locklessly access ->last_scheduled. This only works if we set the
>>> +      * pointer before we dequeue and if we a write barrier here.
>>> +      */
>>> +     smp_wmb();
>>> +
>> Again, conceptual those barriers should be part of the spsc_queue
>> container and not externally.
> That would be extremely unusual api. Let's assume that your queue is
> very dumb, and protected by a simple lock. That's about the maximum
> any user could expect.
>
> But then you still need barriers here, because linux locks (spinlock,
> mutex) are defined to be one-way barriers: Stuff that's inside is
> guaranteed to be done insinde, but stuff outside of the locked region
> can leak in. They're load-acquire/store-release barriers. So not good
> enough.
>
> You really need to have barriers here, and they really all need to be
> documented properly. And yes that's a shit-ton of work in drm/sched,
> because it's full of yolo lockless stuff.
>
> The other case you could make is that this works like a wakeup queue,
> or similar. The rules there are:
> - wake_up (i.e. pushing something into the queue) is a store-release barrier
> - the waked up (i.e. popping an entry) is a load acquire barrier
> Which is obviuosly needed because otherwise you don't have coherency
> for the data queued up. And again not the barriers you're locking for
> here.

Exactly that was the idea, yes.

> Either way, we'd still need the comments, because it's still lockless
> trickery, and every single one of that needs to have a comment on both
> sides to explain what's going on.
>
> Essentially replace spsc_queue with an llist underneath, and that's
> the amount of barriers a data structure should provide. Anything else
> is asking your datastructure to paper over bugs in your users.
>
> This is similar to how atomic_t is by default completely unordered,
> and users need to add barriers as needed, with comments.

My main problem is as always that kernel atomics work different than 
userspace atomics.

> I think this is all to make sure people don't just write lockless algorithms
> because it's a cool idea, but are forced to think this all through.
> Which seems to not have happened very consistently for drm/sched, so I
> guess needs to be fixed.

Well at least initially that was all perfectly thought through. The 
problem is nobody is really maintaining that stuff.

> I'm definitely not going to hide all that by making the spsc_queue
> stuff provide random unjustified barriers just because that would
> paper over drm/sched bugs. We need to fix the actual bugs, and
> preferrable all of them. I've found a few, but I wasn't involved in
> drm/sched thus far, so best I can do is discover them as we go.

I don't think that those are random unjustified barriers at all and it 
sounds like you didn't grip what I said here.

See the spsc queue must have the following semantics:

1. When you pop a job all changes made before you push the job must be 
visible.

2. When the queue becomes empty all the changes made before you pop the 
last job must be visible.

Otherwise I completely agree with you that the whole scheduler doesn't 
work at all and we need to add tons of external barriers.

Regards,
Christian.

> -Daniel
>
>
>> Regards,
>> Christian.
>>
>>>        spsc_queue_pop(&entity->job_queue);
>>>        return sched_job;
>>>    }
>>> @@ -459,10 +467,25 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>        struct drm_gpu_scheduler *sched;
>>>        struct drm_sched_rq *rq;
>>>
>>> -     if (spsc_queue_count(&entity->job_queue) || !entity->sched_list)
>>> +     /* single possible engine and already selected */
>>> +     if (!entity->sched_list)
>>> +             return;
>>> +
>>> +     /* queue non-empty, stay on the same engine */
>>> +     if (spsc_queue_count(&entity->job_queue))
>>>                return;
>>>
>>> -     fence = READ_ONCE(entity->last_scheduled);
>>> +     /*
>>> +      * Only when the queue is empty are we guaranteed that the scheduler
>>> +      * thread cannot change ->last_scheduled. To enforce ordering we need
>>> +      * a read barrier here. See drm_sched_entity_pop_job() for the other
>>> +      * side.
>>> +      */
>>> +     smp_rmb();
>>> +
>>> +     fence = entity->last_scheduled;
>>> +
>>> +     /* stay on the same engine if the previous job hasn't finished */
>>>        if (fence && !dma_fence_is_signaled(fence))
>>>                return;
>>>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Ce06013b14cfc49e3e10f08d945ca8f73%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637617558577952913%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=yKAIrzyRRh1AoGM%2BQXyrwd4psTvyO%2Bcn8961PbcJmpQ%3D&amp;reserved=0

