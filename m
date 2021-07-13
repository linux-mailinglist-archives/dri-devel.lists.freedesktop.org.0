Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0183C73EB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 18:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422206E0ED;
	Tue, 13 Jul 2021 16:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97056E0E8;
 Tue, 13 Jul 2021 16:11:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxndQJrV90XpvNrYJXF0ZKbAN4vhYJVNdXDtOsR4q2EeWruNIphhZEobOtMMTPR3aNafjdh/9aseIZT803MxzEqKUmCDBuKY3rhjbBAHV86K63YghDQ/nvFjmOzCvyOIQTYmWllfUKuGIl0P+X0Yejl66GsF6cRZk4Tfola4DnnLw0jJ4tBcCblF9irbuP6wgJl8dtGLESNGyQqKwxTPuJRp1auEhfy4MnCtYSWXTmZ16k+hBNVN/uzSgoIgeCMWAu46ZHPGLP5LOiFKSoHZId06gVvcCYkAQvIb6DKVr8+9sf5Uc4J7ZVEF8FXMvSf9rwxqjTVL/hfSLY+Cd6b/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+E/vsikwiYIAb+H7x8MOP74Cke83UJzln+FobEG73G0=;
 b=aZyo47YpDkLJdYYhkrWq3YXHadS7955AdIAVT/4sY/mh7EROXlxnN/99LU8Hx0hp43Mb2A7OXxoI8ebUfOV2WAfgGR0nUpLGckoFg7Ga8RMYwev3EgA3ylXI8hWKegW9i4NoPEVfO/CotJMZO23DMeAlemJsG2GvBjc7eUyraB9xaeJIZm6YqUykBB7ITERgZ2aK8ZnL6FFl2P+vTHOF2PO2AtVAoQ0Hj0zvEfun5A/zEC5kvv9Qy6trbxMHvSHzZvEETwAisVgDWrK2+YXsXFmZOkFsM/kXhsqcfPAB//WZoLDl0HdCmknRgnGhNIN2xR/UZSahdbvcVx4Glz1I2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+E/vsikwiYIAb+H7x8MOP74Cke83UJzln+FobEG73G0=;
 b=xXQoZVDwiG47PyijpgUzeAKY+X/bPYvgFRgmwJXsTJBUJ7EmRWk2ihCf3c3XNaGe0ujL3TYB5w+SSqej+OwN2heGVCxK3BefaC1CY0x9om4VkcSoDkTauqx7zGTdi4jCuF/GZOhLnhW2mBd0u1thHBfjeqctUyLX4h+TMHfXYU0=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2351.namprd12.prod.outlook.com (2603:10b6:802:2b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.27; Tue, 13 Jul
 2021 16:11:35 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::9f8:ec71:6535:cd36]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::9f8:ec71:6535:cd36%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 16:11:35 +0000
Subject: Re: [PATCH v4 02/18] drm/sched: Barriers are needed for
 entity->last_scheduled
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-3-daniel.vetter@ffwll.ch>
 <2cd9df9e-08e5-d0bd-d4d3-aed00f699e4a@amd.com>
 <CAKMK7uE3dppw2=sVHRKx1b-ehVfiBphoJNJvpoPjt-=KsPp=Yw@mail.gmail.com>
 <5c5ef6ba-49d0-36cc-b537-e6f9c354f6ac@amd.com>
 <CAKMK7uGXVzaH25_spK5Pp8epx8a+9As6tVMcaj3p6Dedg0FH-w@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <ecd94ad4-9788-3cf1-87e4-52c37e813439@amd.com>
Date: Tue, 13 Jul 2021 12:11:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAKMK7uGXVzaH25_spK5Pp8epx8a+9As6tVMcaj3p6Dedg0FH-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::22)
 To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:9499:3cc3:dfd4:e07f]
 (2607:fea8:3edf:49b0:9499:3cc3:dfd4:e07f) by
 YT1PR01CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 13 Jul 2021 16:11:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd30a4c4-0e39-46e6-c9ff-08d94618e31c
X-MS-TrafficTypeDiagnostic: SN1PR12MB2351:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB23512E0A90C65870A3E174A2EA149@SN1PR12MB2351.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:110;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G3l7Td826tCwqcYDXUwTSkmfnZOGrMrRXvF0WD+nTmSIcDH6kaD5CStb2f3VwiVw/b5b1yhkulLa5gh4G1osM6sgkxoz+5SzCwi3HZ+p3J15ZRkSqaPwP63zUna6gGrDqxCjh9fFmu0fnay6+upql6uuJreixIGK/Ve4MhY5h+Gc3OfMa9frEV4SLaTD4W6wQTzoRklcdVpc8KGjVql5F7GfS6ZQ2Etvz5+zCFduIKtw25JOaCwk3Xtf21p8jweXXr7BTKR2mDOwyyfQj/afJ9ktgf2YuZlehqRjcxkFjdVCMIwIxNg0bJgO9WXnvJMY5fAJzyCXf1L4PlBNhimVl+BfQL0AGBj2pzGk+XWLEXyhTUfFjqMAJlfWb8EpF8y4t2xp/hayZ5aYBWTRUgmTkk+QMQ8CPMqIC4JPs6yw3McCk23x+IRGmzZrRAAvChbDYuXkJfMT+GtnQXvzgsZ53UKfPkCVyIemAQvGVCfb0awq1/GbR3fuS9EqiFdm5xN3+4CAloX4a1NJfMCiWZD0F0ZpX7iyNyqzj0pMEfD8m1xfw4oasVRGG7dqkqeGTdG8rsWHAm3U6mbmWJTezCQivCxbeSiM379z24hFrQUYtDMRfpVb+nTkCnUrBgli2f58XUPZ8HJYnzClqxIgQF1/0AKM/nU3K56rZ7kbbjUrhKdRxAPDhcMfO1OqEW5eUP0yax6fmsgN80wcgpQGEVLlw7AmTyS23D9TL4QxmAP4MKAiNvCHMLCyWhsnw0eH/XqOFiRuQj9MADvQcolCfYJhzu4oR0py6IXdcuicDWq6KIW+eEE7uQfMb5OmHdlpf9Uf4C8zu+LsZT3e7pZfrVVchc/tX6x8Gfbw7AS1DKnYH0I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(66556008)(86362001)(38100700002)(66574015)(83380400001)(31696002)(8676002)(8936002)(31686004)(66946007)(54906003)(6636002)(45080400002)(66476007)(316002)(2906002)(36756003)(44832011)(110136005)(2616005)(4326008)(186003)(6486002)(966005)(5660300002)(53546011)(478600001)(60764002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDE2SUticzNPd2ZVRjczemU3eUJ2Mkl0YmN2b0tWTjFGVWlDWFpJVGIxYnhH?=
 =?utf-8?B?ZEUxNDZWbWsxTHRYVHVuVC9FWHpVRXZOcVVJNnJhTVBJTWJxV2NRVkdOMFpj?=
 =?utf-8?B?YkpUT3FDY3h2R3dvZ3ByK0FXWGRwZEgxUEtoREFNeStvNFNaSlFZbHBkVW90?=
 =?utf-8?B?dkY0MHIvNWxOV2FQWkthc0lMVy9oVkowZmwycGF5WnZsRmY3WmJWLzhHYlVB?=
 =?utf-8?B?bUt3WjFUeUNLVWQ2ZGdURTJOWFFUYzVaZVg1RnhxaU90dDQzUU5xL3RISkpv?=
 =?utf-8?B?b005VmduK3VqYlNqbXdkc3Bla2pxRTl4Sm9YTFppTmVSemExa2U0VHBDYTZm?=
 =?utf-8?B?M252eVZpM3lUR0JqZGNYL1Q0RHduWkxPcjMvZW1yNTlDQlQyc1hpUlRUR1ZG?=
 =?utf-8?B?VHc5UFIyc2VUSnc0enB0NFdyOVJkM0ZiL1h6VThNSzUxNEcwTjRRK21LZWVY?=
 =?utf-8?B?K2JXRUh4Y2lnemdqUU9CcnkzcFRvNDYxdnhxZzE5clpjZVNpTmFSQXRnSStM?=
 =?utf-8?B?OGtESlU2UWEvZXF2SC9uemx4L1ZRWUIydFM1cWJQOVBTOCtGcTFVdWNSSDJX?=
 =?utf-8?B?a1dSejB1ekZZVjQ1M01KSmUrbjhWN2toWldac1BlRnJUNXNQZ3h2NXkwc3Z4?=
 =?utf-8?B?RXZ1L2VYb0NTbGFTYXByb1M4dCttNnU2QlltYkUwRmN1OHhmU2h4bzliWno3?=
 =?utf-8?B?c1E5Y3VINy9QMzRjL3NIKzlvRmpTUDRudXdQVUU1Wk0rYncwRm8yTXo2MktL?=
 =?utf-8?B?WmFIQlFlZC9zaUlZaEx1SEZUTGFRMW1WUk02Q1RkejRzYjNmWTNoMGVmOHVC?=
 =?utf-8?B?SXp4NDRkRnNMeUJyRGk5RXhXaFZUSDFJb0ZHWlIvdXBSWlFzbnFtMjAvdytq?=
 =?utf-8?B?Wi9RQXl1TmVIOXVQczVhT09GT3RTckM5WUJVVTFvL3lPTDJOS0pQSFkvM0tZ?=
 =?utf-8?B?dU9wdmd0UFBHcWN3anJKVUpKblJpb0d1SUVGUmlsbGVucDhBa1lVanhyTXVu?=
 =?utf-8?B?cG9XWllXNUZSdmhiSUdObUF1OExmdndEMDkzcHJsaGc5S1JISTQ4SytpTEdR?=
 =?utf-8?B?UWNqSkFLMkY4cWxnNXdURUo3SmNHNkdyM0hxWG96aytFejhzVXdtLzBsWmJB?=
 =?utf-8?B?UmNQNWk5MU5TSWt3MHV0Mi9yRjlLcFIvU0pDZExDQUErbTFrUGdEZGRKM1Iw?=
 =?utf-8?B?UERxOVBoOXJOK1IrQ216L2VKN1NGMVlxall0RXg3SHlOMjBhcThxZEVCMlJK?=
 =?utf-8?B?WjZaZER3S0hVT3oyVTllZjgwTGN5VWhxWDJFd2pZMWZza3VFcCtVREErNjNh?=
 =?utf-8?B?TGJjdFdHTUtDNzJaVE1Qd3FqZTlFQnI2MGl4WlVrYW11d2pJMjNGVGZFekta?=
 =?utf-8?B?MnVQUi94OGNhenJXU3kwMzRocTRkY3REMTVOVnZVdWp4Q2xBTkg0OUJSbUg3?=
 =?utf-8?B?TjEvbWNJSWk5ZSt0QXdjNjlTOVRtNXdpV3M1MHZpRkowcEVLdzY0WXAySUJh?=
 =?utf-8?B?MENvYkttOGxqeDRjTVRPbDBILzMxYk00NmNkUXlhcjM4cFNIeHFpWTNVWEZF?=
 =?utf-8?B?T2ZRMXJjWXhjbHpBRHlvSzRkdnZGZ1BzZ0JHOVUxSkRKdG5YUHFaTzZ6Nkhy?=
 =?utf-8?B?MEV0S1JVbXpvZ0hGelRxOHpPWUJzUlk3aEJQS0FSNUtVK3NzL3lVWHlIUzkx?=
 =?utf-8?B?dTVxeHNNS3NXTmdwMkVISDc0M2ZqTVppaW1JNy9uektWNThLRkVpWGovWUlS?=
 =?utf-8?B?OFhTbVJiTVRqaXJSWVovVUgzZTgxNDZIZ1NJelQ1U1FTcmhmZjhYRU9rQUFk?=
 =?utf-8?B?dDNTYVowNytGWjJacWNnZFBxVHovZ2dHVUxlQmJuVnNIamJnVzdVNFNhTUMz?=
 =?utf-8?Q?m4d/zEZ1a1CBP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd30a4c4-0e39-46e6-c9ff-08d94618e31c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 16:11:35.4302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MAtcNEB+8ZdiPsgoahX5HnGtDQFzsT5E2YOLyz67omkSZsQ3weuGBLZmUFUIaSVpTWfEzTAoyXS1ppwFGzZM5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2351
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


On 2021-07-13 5:10 a.m., Daniel Vetter wrote:
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
>
> I think having explicit barriers in the code, with comments, is much
> more robust. Because it forces you to think about all this, and
> document it properly. Because there's also lockless stuff like
> drm_sched.ready, which doesn't look at all like it's ordered somehow.


At least for amdgpu, after drm_sched_fini is called (setting sched.ready 
= false)
we call amdgpu_fence_wait_empty to ensure all in progress jobs are done.
Seems to me at least, this should guarantee that all in flight consumers
of sched.ready (those who still see sched.ready == true) are finished while
all later consumers will see sched.ready == fakle and will bail out.

On second thought there is a gap between checking for sched.ready and 
inserting
the HW fence for the new job so this might still be a bug... Looks like 
we need to check for
sched.ready after inserting the HW fence  and for this we will need 
barrier or locking.

Andrey

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
>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C24488ad1956a4a54b0ab08d945de0552%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637617642160395692%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=u%2Fpm%2BsmTT%2Bdb8NvEah%2BJHj22l8sRfhgo1gvO%2FnYLvhg%3D&amp;reserved=0
>
