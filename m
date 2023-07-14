Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E91C0753821
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 12:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0503A10E861;
	Fri, 14 Jul 2023 10:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3AA10E861
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:29:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVO8DsN8wvFQWZ0A3pwjIkuP4dZXB8EQyOlSFfmRfIRjMmEb/JM9ToHtxk024VRx/mbF8hSRf7O5sCSCuTr6mij+gkQqHL7+abj1N6tUwRqwnKK9cK2CkvuLFEhIJCYbleAhv4WLbsIx+QoJFjdS2OVzQkFa6UVRTP6YLgflRQyQVqVw5GmI6HafWA+c7R49a9U/yXpsKM/iNCbym2Ny9SrmXJKY62Oj/TllmYCGkjLFxHVVoi8Oc9d6X3EknBR8cFOU/FDTQ7CsusRRJCg5gx1LHAxMhtuniPrLJ174oz5GWUIMe+GgH91sR5T07GwJqPj5DfjXF/U7UjIVHv8O+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uk7XgoR0H9rSzgeyp2txvURhnj56vw55MpRyAO8LqKY=;
 b=fW71j0KienKi2v2JKNdkHkLGI0Zov9rNXd3kIQUwq47r3YzswCkm4ZSM+t/bNrXQQ/uMaWlT7nPhBYBocC2dVyiMbOGWJUMFgz7rzAlK07XFW+1puGNTbuNGZUXynR+42tISr7NIGYgxl5q23VRSekeaA4jMDFvUmLZqhdpbHq7f3yOIjLL14hPA692ljlcN14F50x2Eq7MhFPMKuu5q4yj9b1WNr3pBOHIe4FfGZGsx9dsyxnCmestGK3rRospS5ZJdU8Qq1z0OtnzK6srJOm1j78JYP+hO0M7lT9k6Vt0H6ox7L12xpd039aRFeMCWtjZtRalgPrLFPe5HJ1nO4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uk7XgoR0H9rSzgeyp2txvURhnj56vw55MpRyAO8LqKY=;
 b=U+nxNvGVNHm8Kyr3RXkyOHYybrHN5bi9sY3dq0uOnJPmLKPk+S/yzF61niYAl0/+D6ZClG3ong+BUdG/iyC+8gE2M4lPSw0S2vh1XRdKDmI7mVrZwpH2SMmh3UbNNQOwh+BYlOZRYjeW437tWmf6ULD+txEqiy8QxhHRjEnhqfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH0PR12MB5090.namprd12.prod.outlook.com (2603:10b6:610:bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 10:29:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 10:29:26 +0000
Message-ID: <1f0ffb6b-eb85-311b-90d1-702d36cb3826@amd.com>
Date: Fri, 14 Jul 2023 12:29:21 +0200
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
 <65d5237c-ef85-845f-6a8e-818e78d74bf4@amd.com>
 <768fbf06-130d-6980-1915-9bbd53f73671@asahilina.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <768fbf06-130d-6980-1915-9bbd53f73671@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH0PR12MB5090:EE_
X-MS-Office365-Filtering-Correlation-Id: ba6c402b-a3b7-4fad-baa4-08db845532d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oX7MC4/nHVHNLDGd3kECenCzFBkb08/3rHjOzjKtpZjL+x1R0Evd/dr35B93vY9iAAFscML3TfUjxseRktD3g0uemEnixa98hUdV6Vc6YZFmB+cFtKoC2ZiECz3/A6IxzX3TEsNkSWxtpk6lmIr6iaQzq39jkplbWFe2pJStDNj+KZP8kXia9GLLd7bG2xg1ptqbAsy6k4cl5XjQhvO37nnTnZZXBcaZzNEWICzYWheK5+qp7vVuG8HRFkT0DvaAxh9vWHPeK4LKemwWJMo5gFjOog4/l2JTZcSLFASsdefZh2/SIQGW0qLDXwR0Bz2QlJF6ghAoqASYIUyiUvdKGbD2wSNiqHrPmtxWlOj+q5H1wrT6mZGQGP6E2Fxx6idbzuSej1CwFNSvu4D6ABV2B1pTk2eq70wBd53a3rpvojPZoFOHU1UoqfKa7PXDbiEYabDKUfeD3yyUQlkPYGeOYAtXL5IUd+5nOO1QcCZR14zVKYRsEXMW6LBgu6fu74ey2cV63GQ3HREwdLQn8AVgTUK+3NMOp5WF/tAFBOzjbkmsXu7NGGvqmmY/AgX9jUT5phDBIAP4Lp/hIu4Jfp3X63NJ6WUcVOvoN4cefXGtmlM4l7iaPGCYjN+F14FiAA5MUWcg9Llo9xqae8CmdEPavw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199021)(478600001)(6506007)(6512007)(6486002)(6666004)(8936002)(8676002)(66574015)(83380400001)(7416002)(5660300002)(2616005)(316002)(41300700001)(31696002)(86362001)(2906002)(31686004)(186003)(38100700002)(36756003)(66556008)(66476007)(4326008)(66946007)(110136005)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXdZOG5rdnlkcXNUQ3VWa0VTUFJBdVdqZVlvdi9EcDUyNWlTUWFEcXNDcmV3?=
 =?utf-8?B?WkE5UHg2ZmNYNkNpcWd5cXU0ZUlENVFHSVUxWnY3WGdpbHBCd2FWN3duNllP?=
 =?utf-8?B?MytGbmZ1bkgzU1UyRGJmU0piR081ak9id0tOOW1lQmRtQ3FBT0xrTFQ1b1pG?=
 =?utf-8?B?YTJUbC9JYmsvWkczK2o0SW9CdlNmUTdZeGovTFhnRWpzNmZycUFHNTFYU29F?=
 =?utf-8?B?YlBybk9seDlxYmZjUEMwakhmcE95YUlvbm9kVmRiKyt4UUNwL3IrN00xbGk3?=
 =?utf-8?B?WjhJcGZtcGxIOFFKbWwraXIwQWJpN1cxckxOV05VWW42YWRQb1p4OENsemI1?=
 =?utf-8?B?WHo3KzlRcVlydWtkUHdaVkRxMlFIRjNvZ2tyZ2FORk1tRndqMGlqc2kzSnVN?=
 =?utf-8?B?d3ZtRU1ZTm1XWUhoOTJ6S1BpK1lmVWloeHNuRXpyM01HMkE4Sk9LWlV1Z0Mw?=
 =?utf-8?B?SGwvU0syeWNqNmFRaDBWZmdhdUlRSUZUTEx0cE5uOExxeUlSeFJmSzFseUU3?=
 =?utf-8?B?U2dIS281bVFWRUIza1VHRFpkNytGeVZHQk1OSXFxSUluYlRoTWlhNElQazVX?=
 =?utf-8?B?b2pRRlZPSnZaMmJXdld3dklJaS81cGsveTVZQjFQeHNhOCswUUIvYzlwNGlv?=
 =?utf-8?B?RnE0Y0tpbTI5YkxucUg5bFRxRDRMcHdEVkNGUVRhR0VFSFhWMEFkaFl4Uk82?=
 =?utf-8?B?eE9id3NlNEgydTRndlh3WmZ6TFBiUWQwRzh1b3pYSFRJRkdmUVd6WlhoOEIy?=
 =?utf-8?B?aHJoRXJVN1VVOFlpWERSQzRueVZTaHVYY0VYYTNCaFFwN1pWRVF3dEI1d2NJ?=
 =?utf-8?B?dkVQNGk3SCs1MmZUQUEyYzlnb1Zka0dDaUN6UnFHZWtlRWVZRjJjMHBZMjFy?=
 =?utf-8?B?Zjc0RmpqYTZWOWxvdjFXRjFvc2hyNm0vQ2gvZk8vZ21heUhPdlhIbGZwWHlI?=
 =?utf-8?B?YVhpUVVLQXBwREhXQ3JheFA2b0JtZUZUSWF3RmJFbGFDUStDNnNudUwzNURa?=
 =?utf-8?B?QlQwZjZDZUxETGcrRlFKZWREQjhPWGVNK1R0WnR6SVlyRVp4NVZ5OEQ4UWxV?=
 =?utf-8?B?T3cvZWJRK1NUTTk1eFpZeHJLWTN0alZEcHh5cG1TWk9xWlVMRnYvU2dHcHkr?=
 =?utf-8?B?L3RIR1F2Vm9OMHRyRVd6YXhDem4reUZPMjZCMGg2MGtWMHhPWmlaNTluTFJj?=
 =?utf-8?B?U0JuZjZ5L1RtaHA5U2dOUnFhcEVWbXJUNVJZcmRYR1FrMUcvK2hlY1d3MU1x?=
 =?utf-8?B?Qy9qYlFCNTF2V0NEYlNMZ2FYejBSeTJQMXNSaGV3bFRxbU1tdGx4K1pVU0NX?=
 =?utf-8?B?djAxbTk3UW1ncEFjbDNqRU5nVXVYOTZORUY1UUVDZlVjOFl6aDdOUWR6UUNU?=
 =?utf-8?B?OXdEelhCSk9VOGpucmlLb2cxZlNkUHZDNDJKcVZYVXF2RDFxaVJOaHJ1V0Q2?=
 =?utf-8?B?ZldlUTdtYnJ2L3BhblpwalBPTE9JVFBYRC9EN2h4NWZTTk85dU9tMWZWalNl?=
 =?utf-8?B?eVVaVVowN3J6YXpkbHg5V0tkR2ErSEZFWEp2MTdyRys5endmV0NzVENOTFVv?=
 =?utf-8?B?dW9oV3U2OFNCenVnQWpRd29qc29TK3NmbkcwVEtTSW11Njl5a2toU3NjUjFO?=
 =?utf-8?B?U2xmaDUvV3VFa2JKdzRzR25lUGVpV0QvNWduYStGTGg2REt2akhsSTJzNCtv?=
 =?utf-8?B?aDdhakRlMFpLTkp4dWRwWmhCekJNaldNL3lPZUN5SVFodUcrMDVGUGhwai9B?=
 =?utf-8?B?RjZ5WjZyeUNlUGRHVVNHNkcyR2hyd0EyZVN2SEFhZDBCR0tDZVlwRlpPZ0Ey?=
 =?utf-8?B?blBXN3JVVXFiUDFmVDllUkFUUG52SFRFRDVzRFBWYUZ5ajl5cHB6RkJmcSt4?=
 =?utf-8?B?SFM0L05tYjA0dTFDeW91MXF4OExHTW9KQ3BNZUh6UldIdFNZRVpsTnZtcEN4?=
 =?utf-8?B?ajVhdzVjc244Q2NPY0xIQjJoUTk4alpLdWVKR3F0U0pRYnJOcmhsY1NVM3da?=
 =?utf-8?B?N25NLzRac0duZEwzd2ZPR2lMaWVUNWV0dHN4cGVKUDVBSTc0MHgrUUJhTXVQ?=
 =?utf-8?B?eDJBdVNHWDRpRGZRVjNjM2xNQkxYRUNVMjhEZkdSbWhyY0lZSFYvTTFPRkN5?=
 =?utf-8?B?czJVQ3hrRy94WG9tUDJYNXJXMGZVOFV4bS8wWW1GSlNIVy9tL1V1MnlCMFVP?=
 =?utf-8?Q?4GAjqUFXMvfkbRiyM08yl9eNr0e7vrjFvdSR91h7mJg9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6c402b-a3b7-4fad-baa4-08db845532d9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 10:29:26.4704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tr+7die20xwSJ+YSnhIQ0vq/qS8UjNzZkLu1p1D2Vhuntlgguxb27eu7ljMix6aU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5090
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

Am 14.07.23 um 12:07 schrieb Asahi Lina:
> On 14/07/2023 18.51, Christian König wrote:
>> Am 14.07.23 um 11:44 schrieb Asahi Lina:
>>> On 14/07/2023 17.43, Christian König wrote:
>>>> Am 14.07.23 um 10:21 schrieb Asahi Lina:
>>>>> A signaled scheduler fence can outlive its scheduler, since fences 
>>>>> are
>>>>> independencly reference counted. Therefore, we can't reference the
>>>>> scheduler in the get_timeline_name() implementation.
>>>>>
>>>>> Fixes oopses on `cat /sys/kernel/debug/dma_buf/bufinfo` when shared
>>>>> dma-bufs reference fences from GPU schedulers that no longer exist.
>>>>>
>>>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>>>> ---
>>>>>     drivers/gpu/drm/scheduler/sched_entity.c | 7 ++++++-
>>>>>     drivers/gpu/drm/scheduler/sched_fence.c  | 4 +++-
>>>>>     include/drm/gpu_scheduler.h              | 5 +++++
>>>>>     3 files changed, 14 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> index b2bbc8a68b30..17f35b0b005a 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> @@ -389,7 +389,12 @@ static bool
>>>>> drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>>>>                /*
>>>>>              * Fence is from the same scheduler, only need to wait 
>>>>> for
>>>>> -         * it to be scheduled
>>>>> +         * it to be scheduled.
>>>>> +         *
>>>>> +         * Note: s_fence->sched could have been freed and 
>>>>> reallocated
>>>>> +         * as another scheduler. This false positive case is okay,
>>>>> as if
>>>>> +         * the old scheduler was freed all of its jobs must have
>>>>> +         * signaled their completion fences.
>>>>
>>>> This is outright nonsense. As long as an entity for a scheduler exists
>>>> it is not allowed to free up this scheduler.
>>>>
>>>> So this function can't be called like this.
>>>>
>>>>>              */
>>>>>             fence = dma_fence_get(&s_fence->scheduled);
>>>>>             dma_fence_put(entity->dependency);
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c
>>>>> b/drivers/gpu/drm/scheduler/sched_fence.c
>>>>> index ef120475e7c6..06a0eebcca10 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>>>> @@ -68,7 +68,7 @@ static const char
>>>>> *drm_sched_fence_get_driver_name(struct dma_fence *fence)
>>>>>     static const char *drm_sched_fence_get_timeline_name(struct
>>>>> dma_fence *f)
>>>>>     {
>>>>>         struct drm_sched_fence *fence = to_drm_sched_fence(f);
>>>>> -    return (const char *)fence->sched->name;
>>>>> +    return (const char *)fence->sched_name;
>>>>>     }
>>>>>        static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
>>>>> @@ -216,6 +216,8 @@ void drm_sched_fence_init(struct drm_sched_fence
>>>>> *fence,
>>>>>         unsigned seq;
>>>>>            fence->sched = entity->rq->sched;
>>>>> +    strlcpy(fence->sched_name, entity->rq->sched->name,
>>>>> +        sizeof(fence->sched_name));
>>>>>         seq = atomic_inc_return(&entity->fence_seq);
>>>>>         dma_fence_init(&fence->scheduled,
>>>>> &drm_sched_fence_ops_scheduled,
>>>>>                    &fence->lock, entity->fence_context, seq);
>>>>> diff --git a/include/drm/gpu_scheduler.h 
>>>>> b/include/drm/gpu_scheduler.h
>>>>> index e95b4837e5a3..4fa9523bd47d 100644
>>>>> --- a/include/drm/gpu_scheduler.h
>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>> @@ -305,6 +305,11 @@ struct drm_sched_fence {
>>>>>              * @lock: the lock used by the scheduled and the finished
>>>>> fences.
>>>>>              */
>>>>>         spinlock_t            lock;
>>>>> +        /**
>>>>> +         * @sched_name: the name of the scheduler that owns this
>>>>> fence. We
>>>>> +     * keep a copy here since fences can outlive their scheduler.
>>>>> +         */
>>>>> +    char sched_name[16];
>>>>
>>>> This just mitigates the problem, but doesn't fix it.
>>>
>>> Could you point out any remaining issues so we can fix them? Right now
>>> this absolutely *is* broken and this fixes the breakage I observed. If
>>> there are other bugs remaining, I'd like to know what they are so I
>>> can fix them.
>>>
>>>> The real issue is that the hw fence is kept around much longer than
>>>> that.
>>>
>>> As far as I know, the whole point of scheduler fences is to decouple
>>> the hw fences from the consumers.
>>
>> Well yes and no. The decoupling is for the signaling, it's not
>> decoupling the lifetime.
>
> When I spoke with Daniel I understood the intent was also to decouple 
> the lifetime.

Yes, we discussed that a long long time ago as well.

We *wanted* to decouple the dma_fence lifetime, it's just not done that 
way because of problems with that approach.

>
>>> I already talked with Daniel about this. The current behavior is
>>> broken. These fences can live forever. It is broken to require that
>>> they outlive the driver that produced them.
>>>
>>>> Additional to that I'm not willing to increase the scheduler fence 
>>>> size
>>>> like that just to decouple them from the scheduler.
>>>
>>> Did you read my explanation on the cover letter as to how this is just
>>> broken right now? We need to fix this. If you have a better suggestion
>>> I'll take it. Doing nothing is not an option.
>>
>> Well this isn't broken at all. This works exactly like intended, you
>> just want to use it for something it wasn't made for.
>>
>> That scheduler fences could be changed to outlive the scheduler which
>> issued them is possible, but this is certainly a new requirement.
>>
>> Especially since we need to grab additional references to make sure that
>> the module isn't unloaded in such a case.
>
> Yes, that's a remaining issue. The fences need to grab a module 
> reference to make sure drm_sched doesn't get unloaded until they're 
> all really gone. I can add that in v2.

You also need to come up with an idea to prevent races with the deadline 
handling. See drm_sched_fence_set_deadline_finished().

>
> It would also be desirable to drop the hw fence as soon as it signals, 
> instead of keeping a reference to it forever.

Yeah, agree. Problem here again is that this is easier said than done in 
a non-racy way.

Christian.

>
> ~~ Lina
>

