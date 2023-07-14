Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EA275371C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 11:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF7610E84E;
	Fri, 14 Jul 2023 09:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B47610E84E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 09:51:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHXACuldUw85iZ/Baxm38CsXH7gGLl3/WBp9FceeuDLAXIvSGgx0sQk04QJLK9X4faazDwe5G05I3TpkRTl7TBHx2zcRqaxl2nG6Iuo4ZIxw39yMNgXIv75+SsskYIogM024kPxOYvivQ1lgnrxmsQFCR1eiAw8QA8QyYVpQzI86JqZ3Wmsid1KUAk/kGlCzNPrILExnZp5zAVdh3lZu4i6TA4wIQZUHrkGXquzSqp35J0WEHCTeW8DOqCNvu7BfenQ10xBNWJ+c4SSKXgJGKrzRWy1zW0kvivaYeGHCtnsu16igckK/eJUG1+WPqdm0bm0ObHOGYtR6HqUiy5JnSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9rgxscsPrYZ28a+FBtaYQZNwOXHAU/qSVl+eW1msuw=;
 b=VHQRaNdZQXl2f+bt4pcdzpkJPBXlq0x1SKjM42e5yvXKNRLB4ffBqM1Yp+dN8Hgxhwvt+NFxMCCV1RQE1D+ej0vKjvpN6iiwZwH47q0Z3+S6qcpuoZoqvOc6qglKzmzWPIrSlNPZosJ5BROeez+7PQCPD97DqJujvZos9X6rOToiWsIBiV6C78JkWXoTFzSDy+JYheRfkiX6bc5i8JvNwHYX1nv9tybUEDZQq0UvIAa5ttSuVZn9HL/YTtasi72Y6nmjilTd99CX9r6wflyL/ner+LJzTFJNxyXOsPOJuFxlQcq8avLuu3OyQosQSBMj4+hdjRZY03NQ/JqrVLxUWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9rgxscsPrYZ28a+FBtaYQZNwOXHAU/qSVl+eW1msuw=;
 b=zlx/WjfVlgYuGm2jO9ZRKEfezWNX12t93qNP73WISsLjaLBx0eo1i8FjEnbZhcATROJYWiABrbhbg2MvHNH9yJu1S36tMYl9C8nNP1+qGEIFtLwUpNPQfD3ZoknMp0Vem9GTzu2Zp2O13o2WEvtLG5yQrXOaf+GaTOlhm3sauRo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB6029.namprd12.prod.outlook.com (2603:10b6:208:3cf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 09:51:46 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 09:51:46 +0000
Message-ID: <65d5237c-ef85-845f-6a8e-818e78d74bf4@amd.com>
Date: Fri, 14 Jul 2023 11:51:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>, Luben Tuikov <luben.tuikov@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-2-c567249709f7@asahilina.net>
 <bef7ef62-3cd9-6ceb-5eb4-5ae0c0236778@amd.com>
 <5c7278b9-e63e-4ddf-1988-1e02087fb988@asahilina.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <5c7278b9-e63e-4ddf-1988-1e02087fb988@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dab142b-8ef2-4599-08da-08db844fefa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QLv2HHHLP39+labWN+yGE+C5GaohidQtCUT3QECG4tuoj5moa3t3kFnxsXf++/X3LV8yN9n1AkyHRu5qG0njXUJFgHaJSAYFr6LQqZGnQDi+0M/7veUfUi6/agIiMpevMuLdlKPpdQTvi8OCxQv5NjhZoK/h0r1EUjv7ARTEaoLIxwQtPgbaZGZN2tgMD8tJ1OwnoBPnITDnoVjundmKeE5ORid4nuFg9CIWGoo9XOORNKVoMD7UnSpX9mwxDJnrrwqjfH6/jevcwDq9H8VyW0EDqPFA9AhNhxaYgU0SE5q0gkEdCOIJTNtBgpFzDKrYLzDaGAQyv9F30tMUt6YuZrBha7AcNZgJZuCz+/x+x3s25fylBVMR7lqj8mMX3Zg1GeVmsPwxflUDh4cCYYJdPImMXEm1pbZAxwm8RIpVPnXVMv6uhMSIa8c48XnUyZtEgZ4U4RPqUBjYhOlDoT/3+7RG+GZwCabkWl2xmANWof0LsROohruiZiXgZ/i/IVNO//fWLOfoVVI67ejTnPuZlCqHEQOfrnAynXqV5Tp1SxMih0m8z3LoKy1uhvDXXTrxJmin5/xUJy5DfNma7tevwDsWhPKs8KPl1lXSzkWOak0WqBxvc3W4zxTXxdqFHgrz4JUsoOr2jiJ4CoMh7gYn8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(2906002)(54906003)(478600001)(38100700002)(6512007)(83380400001)(66574015)(186003)(2616005)(31696002)(6506007)(86362001)(5660300002)(8936002)(7416002)(36756003)(110136005)(6666004)(41300700001)(66556008)(66946007)(4326008)(66476007)(8676002)(6486002)(316002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ei93V1BCZFJpNjNqWUlTWEtPZjJEMGQ5N09YOW1vRk9WUWtIdTBRd3k2Q1Va?=
 =?utf-8?B?QzRnaW1zdDZmUS84bDE3RzN5SEdveERreFVuQldPU1FaRWNJYXpNZVRWY20w?=
 =?utf-8?B?ejRDV2Uza1NuejljcE1qSS8wQTB1UGxpMG1FQ1NKayt1UWhkTm1aTmZGeUcx?=
 =?utf-8?B?Z0dRaFlPN0ZPUkpza2ZCVlZNSmV2RG9yR0czc3Y4VExIRnZ2V1RHZXREWHl4?=
 =?utf-8?B?RCswOWhmODVGeUFURFFoUG94NmZQWE1vd3VsS0lzZXNNdWxpWHBhaHdMTC9U?=
 =?utf-8?B?dmduU3FSOTlkaWJVTFdEd2JJL3oxbzJkU0Z2YjRzV1ZKcHZ4cExiZWY1TTNF?=
 =?utf-8?B?UkpleUZyKzlxNFpuVFNBQkowdE4xTzA1VW5xN1J1V0RvOGI2bVArWG85NE5R?=
 =?utf-8?B?UklkYlk4NUQranpUNEZ3dndseC9RdzJ5SklFVjQ0endqcHdFNmIrNFBMSU5a?=
 =?utf-8?B?RXlBSHdLc3k5VjFpMGR5ODFCMklKa0ZJTXlUS3ArMmEzWGR3ZU5abTN1M0ky?=
 =?utf-8?B?YjUyUkloc1VkV21DVFhlQ1BBTGtWdGhZcmJrMk9lMzJiRlYvUFRpQ25ld0Rl?=
 =?utf-8?B?QzU3KzZ4VzZyZEJqcXlpV3lmNWdVWmxMbmR0ckRVSzRtVDQrWWptWVJIWHJ5?=
 =?utf-8?B?K1BHVjU4RTJUT056NU9YVFpTTWRLT2RFSWgzM1ZRYlYwdVVZV2xJK2pOd2FZ?=
 =?utf-8?B?T2wvQ3gvMkg5YTdYTUtXbVdObk9GL3Z2QjZhK2d4am5uaDhmNFpPT2liM2g0?=
 =?utf-8?B?bDZnRVFFdWdRTlh0bU9HbGxLQzBCSVROQW4rK3F2V0hMMGk0ZUgxaTZPSWZP?=
 =?utf-8?B?b1RMWng4MnZiclVrWWNweTgyRTlnOU9OUzJYOG1GdkdlcXNtRnBKRDFlcDd4?=
 =?utf-8?B?NTJhMTlQL2R4Tjh1VGVaYVBIdHVhbzYya1NrNUJMZXdNU0l2ZzFsZEV3b3dS?=
 =?utf-8?B?TVNNMDA3MHVGWXF1K2x0WmN4YjRlTnlSMmhFVjBEWnU3QS9FR3NXTjYzZC9s?=
 =?utf-8?B?YkFTRWFVc1lYclhQM3pXNHN3UFRqaFVLaG5WK3Y1VDFFNG5WWnFKQi82T1dF?=
 =?utf-8?B?cXZwbjNWMHRtdGFiUHFhK1FVUW9TQ0RuM0djSXluSHAxQ2djQWhnZStKdFJO?=
 =?utf-8?B?bDRpNGJKU2Z6TUx2OGlUN28vckpoaktCZ0dyY2hwVTdKK0pFUGY3NnlhWmlm?=
 =?utf-8?B?UGttYWMxQXNsRVRvSDR0UHg1ZXVwajAzRWFHaVFRSmxSMFd0NDcrTUsyZGNI?=
 =?utf-8?B?dFdCMmh4UDV0WkU2b2lWYVBFeitvaCtpb1pZMU1CRGFrd1RxWHZkeGJWdmRo?=
 =?utf-8?B?dmtHc0dMbEJ3WlkrZUVrb0RJVmkvVVRXTWR4OUZkYmY5QVRoUFFaeDcyUGpx?=
 =?utf-8?B?dGdlVU9pZ2hLcjN3S1EyQUVaS1J6MUlqMU1oUWtzZnpJMTZ0QkliYkgzakpu?=
 =?utf-8?B?WDNNMVVBS2o4eFlEYkVZRHAwRTYrS2FtaEhER3VJRGU0bTFiZkhvYUFha1Ny?=
 =?utf-8?B?aEZpMzJObk5kVUFuOUFZV21BaDZ0bEtnRnpmR25TUHRHRUJTdE1EU293U1ZO?=
 =?utf-8?B?UXlTSUc5MFNGR3dLTkNRNkVneVN6ZmdHVkJJaFNyY2hPTUwvaVdQUVNTQ0kr?=
 =?utf-8?B?Vjd0V3BOQUxqTllmUXEvMk5MOTg4OS9EUmcxckVVRys5MVplbEJLUDFaWlhC?=
 =?utf-8?B?eE9FMit6UWdRUGtNWWYwRS9kS3ZONjJLTmpldFRWL0pqa3B3U09CZS8yc0pq?=
 =?utf-8?B?RElNUFd1YmhDdHgrUUhHWkRwSDJhWTFZSlNTWSs1MnE0am02cFdGWDZzRTBq?=
 =?utf-8?B?aFBuTWxmdFhndWNKUHhzTFlTZU44cHdDU3p6Vy9Rc1p4ZWtEVENTSmt2YjhP?=
 =?utf-8?B?NmhIaHBVeWlYeGFSNFdhRTJoaWgxeTRuS0NQK252N3FvbjdJOXg2cFM0blJC?=
 =?utf-8?B?TEpINGVVREF6TFRhREZtbG9yQVJYQ1M2MitwVlJUV0NlcFdhRzMzdUExa1hO?=
 =?utf-8?B?Q0JHWVFLQTVCVER0cUxRSStFWWVMRWF4c3BReW1OY3hYc1k3dVlsNTVVeFdt?=
 =?utf-8?B?VG9zcmdhcTZRM2VlRlhSa2x2dFh3d3lvak50dGJZbVluM3RWb3JUbEZneFdy?=
 =?utf-8?B?R1ZlM29XZ1Y5N1VmM2dYSXZIRDMrL0djSHpjeTF0UWJTeVZwQUVKS1Z3Q3VR?=
 =?utf-8?Q?I6Uva5TdREckANSaIRkz2GZQ6HI75E9eqnEdsN7o/KPL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dab142b-8ef2-4599-08da-08db844fefa2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 09:51:46.3131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++h5yTs6+ZQGuUmA6uilJbPZTYC/nbmdyYCpnvTRUtXCL/b4Gwunuk7ViL6Hpbgo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6029
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
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.07.23 um 11:44 schrieb Asahi Lina:
> On 14/07/2023 17.43, Christian König wrote:
>> Am 14.07.23 um 10:21 schrieb Asahi Lina:
>>> A signaled scheduler fence can outlive its scheduler, since fences are
>>> independencly reference counted. Therefore, we can't reference the
>>> scheduler in the get_timeline_name() implementation.
>>>
>>> Fixes oopses on `cat /sys/kernel/debug/dma_buf/bufinfo` when shared
>>> dma-bufs reference fences from GPU schedulers that no longer exist.
>>>
>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_entity.c | 7 ++++++-
>>>    drivers/gpu/drm/scheduler/sched_fence.c  | 4 +++-
>>>    include/drm/gpu_scheduler.h              | 5 +++++
>>>    3 files changed, 14 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index b2bbc8a68b30..17f35b0b005a 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -389,7 +389,12 @@ static bool 
>>> drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>>               /*
>>>             * Fence is from the same scheduler, only need to wait for
>>> -         * it to be scheduled
>>> +         * it to be scheduled.
>>> +         *
>>> +         * Note: s_fence->sched could have been freed and reallocated
>>> +         * as another scheduler. This false positive case is okay, 
>>> as if
>>> +         * the old scheduler was freed all of its jobs must have
>>> +         * signaled their completion fences.
>>
>> This is outright nonsense. As long as an entity for a scheduler exists
>> it is not allowed to free up this scheduler.
>>
>> So this function can't be called like this.
>>
>>>             */
>>>            fence = dma_fence_get(&s_fence->scheduled);
>>>            dma_fence_put(entity->dependency);
>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c 
>>> b/drivers/gpu/drm/scheduler/sched_fence.c
>>> index ef120475e7c6..06a0eebcca10 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>> @@ -68,7 +68,7 @@ static const char 
>>> *drm_sched_fence_get_driver_name(struct dma_fence *fence)
>>>    static const char *drm_sched_fence_get_timeline_name(struct 
>>> dma_fence *f)
>>>    {
>>>        struct drm_sched_fence *fence = to_drm_sched_fence(f);
>>> -    return (const char *)fence->sched->name;
>>> +    return (const char *)fence->sched_name;
>>>    }
>>>       static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
>>> @@ -216,6 +216,8 @@ void drm_sched_fence_init(struct drm_sched_fence 
>>> *fence,
>>>        unsigned seq;
>>>           fence->sched = entity->rq->sched;
>>> +    strlcpy(fence->sched_name, entity->rq->sched->name,
>>> +        sizeof(fence->sched_name));
>>>        seq = atomic_inc_return(&entity->fence_seq);
>>>        dma_fence_init(&fence->scheduled, 
>>> &drm_sched_fence_ops_scheduled,
>>>                   &fence->lock, entity->fence_context, seq);
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index e95b4837e5a3..4fa9523bd47d 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -305,6 +305,11 @@ struct drm_sched_fence {
>>>             * @lock: the lock used by the scheduled and the finished 
>>> fences.
>>>             */
>>>        spinlock_t            lock;
>>> +        /**
>>> +         * @sched_name: the name of the scheduler that owns this 
>>> fence. We
>>> +     * keep a copy here since fences can outlive their scheduler.
>>> +         */
>>> +    char sched_name[16];
>>
>> This just mitigates the problem, but doesn't fix it.
>
> Could you point out any remaining issues so we can fix them? Right now 
> this absolutely *is* broken and this fixes the breakage I observed. If 
> there are other bugs remaining, I'd like to know what they are so I 
> can fix them.
>
>> The real issue is that the hw fence is kept around much longer than 
>> that.
>
> As far as I know, the whole point of scheduler fences is to decouple 
> the hw fences from the consumers.

Well yes and no. The decoupling is for the signaling, it's not 
decoupling the lifetime.

> I already talked with Daniel about this. The current behavior is 
> broken. These fences can live forever. It is broken to require that 
> they outlive the driver that produced them.
>
>> Additional to that I'm not willing to increase the scheduler fence size
>> like that just to decouple them from the scheduler.
>
> Did you read my explanation on the cover letter as to how this is just 
> broken right now? We need to fix this. If you have a better suggestion 
> I'll take it. Doing nothing is not an option.

Well this isn't broken at all. This works exactly like intended, you 
just want to use it for something it wasn't made for.

That scheduler fences could be changed to outlive the scheduler which 
issued them is possible, but this is certainly a new requirement.

Especially since we need to grab additional references to make sure that 
the module isn't unloaded in such a case.

Christian.

>
> ~~ Lina
>

