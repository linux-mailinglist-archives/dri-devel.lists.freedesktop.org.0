Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DBD3D887A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 09:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34A56E1F4;
	Wed, 28 Jul 2021 07:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2048.outbound.protection.outlook.com [40.107.100.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A8A6E1F4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 07:03:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBRzaFHyGPALPlsaboj5IOiw3J9m8hzkvvrwnYgtm4i9i45Q0r2Wgs8GNmOFwY0HJvPgQJdSCLZmedIJX+t4eLsaXWTZXr7U7bepm9YDuv8yQkIwiEHHiMRRk27H134kTPN1PqjSRomJ1k5VcJaKzMvXMszEg0Qukaezrd0dWTMVAGu8j7rpvKDppsngFWfFtF1IIdQzSnVRPkqqFL/c4/nWw7AQo9vREd7id59cpOudM5vOdjqIbP8Jt6qzIuZzisN/m+LUjZ6bM0Lh5e/LWZhbBDIEKejBVR6ssUc1uzPOAKFc48NTASUyYF7VojOl6sxIUhm76f/PWQuFSWiK4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApZxqGkfiOsV0PmpN0LKkConFj2WGLKHwb3FKfKgfpc=;
 b=S18GCDkq4juT4nxPTxNKdxDstii20+KO5axd/cgOVBtAeXvs5rXFDYZJgTWG51mmAwtwMfLYpB/wzL/qWVTDDwAGzfZ5rCRJMOzqkWl8TiWrGsqGgYZM3rWgO8nLG3E6byl5tacYfdmB8xmh22OdD/p6HlHaPibAATV4W+unnh3GPwHbYm02iwqN3PA0Jksv/IRXmErS+pOTbjq99gsFbzYDuQ8OF5zkWH6xoiYB3yVvVkyEOad3p9mJnpySanTnPsoaffXOrYcZnsSNYwgaeqaTHvs0NJHrNJEu0oMiL0NFPfBHIpQAz5vipH/EuSwYt0WPvTDO7JmOlKKtXnQOHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApZxqGkfiOsV0PmpN0LKkConFj2WGLKHwb3FKfKgfpc=;
 b=Af9Jg0I/XEqsiy6FC6VwlC9ZHH62jqEaN0HT1rr9CmbS9Xhd2kAe880ijilMUSAU07M200g6pRn/2y21JgVF8zTHAcV79rLNF505j0cSZm4/Hy0ubj/Bsjm3qvaVllGIoTT9I4gdGUbjVOPwZUa6HvtzIgq5VJ09ZBcmVpeRpsM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4303.namprd12.prod.outlook.com (2603:10b6:208:198::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 07:03:36 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 07:03:36 +0000
Subject: Re: [RFC 1/4] dma-fence: Add deadline awareness
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <20210726233854.2453899-2-robdclark@gmail.com>
 <50b181fe-6605-b7ac-36a6-8bcda2930e6f@gmail.com>
 <CAF6AEGuNxi_aeYE37FT3a-atCUWgepxs-9EwxMfpiMaU7wgqdQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9edd7083-e6b3-b230-c273-8f2fbe76ca17@amd.com>
Date: Wed, 28 Jul 2021 09:03:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAF6AEGuNxi_aeYE37FT3a-atCUWgepxs-9EwxMfpiMaU7wgqdQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR3P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:502c:190e:1ca:e49a]
 (2a02:908:1252:fb60:502c:190e:1ca:e49a) by
 FR3P281CA0037.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.11 via Frontend Transport; Wed, 28 Jul 2021 07:03:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e7b0b10-c926-443b-1cab-08d95195d1aa
X-MS-TrafficTypeDiagnostic: MN2PR12MB4303:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43031EF1CA2DB0E76C0339D483EA9@MN2PR12MB4303.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hBNq720/Z8L1SDFEuQLCYSfgTnvpHnxb0jaqLkYR9aipl4nilJoWNd4daIJImqVNNOSHCb18EVuAFfKccRhTEyHW5ImaAVOgxNHJdyJJu4GG8lnDE/wmJQ9GQ283RfBsnAr1AGwKKmj+gFDqYVrXO8fzMZCwyCYPCahdYf+uGHCV6DUydhdFByZMgdKXQphIesKC9vGMl4kT0cnN29Kn1JzT5qhGj+hFHIVegHXx2rP198EIIXATvQW+rKZswdFTlPIv1MMaJUjTNr+7WCLjK1DI+YadRxzhfdKWAznK1RmCe0uQXY47/jJfi0bti8fUvufP1aNYVoo3NnroeiRQkdLkaYBOEFMpTLGIvjsX6fwTMrSPSxqJI5HHfbupPsAtGihdmINbNnTLKepnqaK0ENUA0nShllNiSldB3X+gnyNZJ69mT7BO8vd1Qb1gQ0fG9KwIhoS0HBnJvmZ72y99SXPvYCFADxAi65wNJ2bH1rrt7ANXSIZIFKyNf0wnGX/LSYza1PL7O6bwT/80QoHMD8nU6zUA8SOjf8f360HnMR1c3gjiLDhBsaeNsPhosufqnbETMV7xRisthesNzh6WCmwBHbVgOazeo6JgafcC4rbcAwfAtkMOVsXW8OjpEKMuvFD4YDuspx4Gsu/kSqB+1RtQ86vzQ/TTT3/H5kRldknQ0YeB3/PKUklZQasQz4o49R9uANR35huzLarR4y7t+VSb/5xVPHD3CGcbWrruPPw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(6666004)(2616005)(38100700002)(53546011)(66574015)(5660300002)(86362001)(31696002)(36756003)(4326008)(66556008)(66946007)(6486002)(186003)(54906003)(110136005)(83380400001)(8936002)(2906002)(478600001)(66476007)(31686004)(8676002)(7416002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWVQS1YwcWlNNDdTdWxTOWYxUVZodHh3ZDBKRXBCR295NlJ3TDdySnQwNWNQ?=
 =?utf-8?B?bVVuRnZLK2hSeGhzY3FXSHNOQkxLZW84TEFiQTVGbUd4TlhIWlFJeXFDRVF6?=
 =?utf-8?B?bGxZUXFpNHlsRWMzaDZ3MDZTeTF1QUdhUnovTFp3aGU2dnNqaVphdGx0NC90?=
 =?utf-8?B?S0VzcmdQaXJvdVBXUWFzcmtjeno0NWt3RjZnQnZwaDdVUUpHQjZRem1QZjdD?=
 =?utf-8?B?cm1GZEdWdkJuOTB2blE0eXMxWE5jQlJpdUd3aFQvalQxOWVVdGdYeGtCTnEy?=
 =?utf-8?B?cTZZN3Q5TlRVYXdEejFqSDJRakZEL1RvcE1uZEZuemFmWkJPV3UxZzUvVElL?=
 =?utf-8?B?Wk1Obm1wbFZMNDMvN1B4cUNqTlRHQXVlbU85eUI1Tys5VmtkaUlINGRoTEJn?=
 =?utf-8?B?TnpKWGtVbWMwQW9ReEFMUVczdXc5MGVROGZiZ3UxVHEyTXk1ZmdzcVEvUUtv?=
 =?utf-8?B?QjFhN1RzMjRZUXdFd2gwRU9DK2ZGcXRTbVVqN3NIZEVLU2oxS0tYQTJVRnBL?=
 =?utf-8?B?a0ZqOXpoSU9RZkNSY1BYYVZpbVBXTFNUZFRsamFGVlFYVXVjdU5Qb2dPeW1s?=
 =?utf-8?B?ZVJVazNHaXdwdGNSMEE3aVVJMnJaMGVKcWdoM3BwenkxM0pIcXpMNTFiWDZN?=
 =?utf-8?B?VjhPY3pObFN3bVg5YVdlQlUyU2RlaWt1akxEd205QXBTMU5ORE0zVFRtK0F6?=
 =?utf-8?B?Q0V1RDJMNENNWnFEOENLcjdkb3Q2Ty9BRGJXQzhBYnVOMHZGV1Z0S3pCcno5?=
 =?utf-8?B?Mk1HRmRWbGNWTkFNdENSNzVFb2Y0SUE1Y1NPQ3RnR0RTeThwQndNanRQK2pR?=
 =?utf-8?B?NHY2N0YxNXpGandFVEF3YzZMWUlwVXdwbmp4QVhEc1ZpTXNsYm4xcWRtc3Jq?=
 =?utf-8?B?N0toZ2NDMC9ZMTIrNlhhNk5QOUJtYW9jS0M3Qng2aHNTQzdpYVhCNTJjU0RD?=
 =?utf-8?B?ejVxMENob3R4eUp3eGErZjROWXBoRnhKOFFJTEFhck1TTHBBMUM1Y21uODEz?=
 =?utf-8?B?MjB5Q0FCZXg1c3Y4RDNmWjAyS3paRGN4a2ZZM01OdklaR2VYcGJHN0tURlZ4?=
 =?utf-8?B?dmh4TnNNcm50OFRMb3lvSWcwUm9pdmRRb2ZMS1pSaDk4eWx1Z1czLzNJbzhM?=
 =?utf-8?B?eUFjZHRTNHJOY0xhdlBNWEJzVjlBOTlVaEFwcGZISDBzY2VzZnk2OE91b09p?=
 =?utf-8?B?SFBMK2FVVkxoR1lrdmEyZGFTd0JlWTYwS05JYVVFMjdqdVphSkRwenVuTkQ2?=
 =?utf-8?B?NlhPNUk5U3poNVhZbkE5UXIwRUZud2t3enp6RTRMWktTY2ZpWnU2ejB6V3d4?=
 =?utf-8?B?c1QzQVB2Z2xxWWREbzdyTlBxTlprVzJ0cGdNdHVISlBVdkFaaUljQ3hoNFEx?=
 =?utf-8?B?aTE5Ym5XeW16R01DT1Z6RXhGb01sMXliOENpU1dHZ3I1ZXlhS3hQNEE0bjhZ?=
 =?utf-8?B?T1lGWDZ2TUY4TGNWRmdoN1hHL2VBb2dicHNzY0RhemNmeVl2WGcyMVA0WEU2?=
 =?utf-8?B?aXBJMzBxVkVNM3ovSlRpeGRqVDVWL1ozTGc4dFFDZmdaREJ5NUhFZkNNNExO?=
 =?utf-8?B?TWNyLzdxcFZmb0EyajhpOEtFRm9jck5MdWNNTk5abVJSK2Y0MTdPL2ZlSkV5?=
 =?utf-8?B?bGFrT0VBZStsclR3Nk5JK1EveURDNXUvbzd6SDArTFAyYnZURXd1RGQ3TWJu?=
 =?utf-8?B?bkkwVnVaeEF2amplWmY2RXhYQU5CS2hudTNoeWd1WGtxWW4rUXVQL0wwQnlX?=
 =?utf-8?B?Ukp2MGJGeHd5TXlUM002NUJDajAyNS9IQ25TQ3ZST3oyTlJoRGYzSjJyTXZX?=
 =?utf-8?B?OXgxdExUUmxnUEpqNWNCK3crN2RUUmN2S2d6OVpvY0JibThWVFllWHVTUUR5?=
 =?utf-8?Q?95Yfoa5lTDsa5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7b0b10-c926-443b-1cab-08d95195d1aa
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 07:03:36.1478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JU0xxeZ+5OImXd1ZSMb9XausE16zdAtSRquTtPsvylTho1aPNZ+EwKxJszeVJxi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4303
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
Cc: Matthew Brost <matthew.brost@intel.com>, Rob Clark <robdclark@chromium.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.07.21 um 16:25 schrieb Rob Clark:
> On Tue, Jul 27, 2021 at 12:11 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 27.07.21 um 01:38 schrieb Rob Clark:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Add a way to hint to the fence signaler of an upcoming deadline, such as
>>> vblank, which the fence waiter would prefer not to miss.  This is to aid
>>> the fence signaler in making power management decisions, like boosting
>>> frequency as the deadline approaches and awareness of missing deadlines
>>> so that can be factored in to the frequency scaling.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>    drivers/dma-buf/dma-fence.c | 39 +++++++++++++++++++++++++++++++++++++
>>>    include/linux/dma-fence.h   | 17 ++++++++++++++++
>>>    2 files changed, 56 insertions(+)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>> index ce0f5eff575d..2e0d25ab457e 100644
>>> --- a/drivers/dma-buf/dma-fence.c
>>> +++ b/drivers/dma-buf/dma-fence.c
>>> @@ -910,6 +910,45 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
>>>    }
>>>    EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>>>
>>> +
>>> +/**
>>> + * dma_fence_set_deadline - set desired fence-wait deadline
>>> + * @fence:    the fence that is to be waited on
>>> + * @deadline: the time by which the waiter hopes for the fence to be
>>> + *            signaled
>>> + *
>>> + * Inform the fence signaler of an upcoming deadline, such as vblank, by
>>> + * which point the waiter would prefer the fence to be signaled by.  This
>>> + * is intended to give feedback to the fence signaler to aid in power
>>> + * management decisions, such as boosting GPU frequency if a periodic
>>> + * vblank deadline is approaching.
>>> + */
>>> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>>> +{
>>> +     unsigned long flags;
>>> +
>>> +     if (dma_fence_is_signaled(fence))
>>> +             return;
>>> +
>>> +     spin_lock_irqsave(fence->lock, flags);
>>> +
>>> +     /* If we already have an earlier deadline, keep it: */
>>> +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags) &&
>>> +         ktime_before(fence->deadline, deadline)) {
>>> +             spin_unlock_irqrestore(fence->lock, flags);
>>> +             return;
>>> +     }
>>> +
>>> +     fence->deadline = deadline;
>>> +     set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags);
>>> +
>>> +     spin_unlock_irqrestore(fence->lock, flags);
>>> +
>>> +     if (fence->ops->set_deadline)
>>> +             fence->ops->set_deadline(fence, deadline);
>>> +}
>>> +EXPORT_SYMBOL(dma_fence_set_deadline);
>>> +
>>>    /**
>>>     * dma_fence_init - Initialize a custom fence.
>>>     * @fence: the fence to initialize
>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>> index 6ffb4b2c6371..4e6cfe4e6fbc 100644
>>> --- a/include/linux/dma-fence.h
>>> +++ b/include/linux/dma-fence.h
>>> @@ -88,6 +88,7 @@ struct dma_fence {
>>>                /* @timestamp replaced by @rcu on dma_fence_release() */
>>>                struct rcu_head rcu;
>>>        };
>>> +     ktime_t deadline;
>> Mhm, adding the flag sounds ok to me but I'm a bit hesitating adding the
>> deadline as extra field here.
>>
>> We tuned the dma_fence structure intentionally so that it is only 64 bytes.
> Hmm, then I guess you wouldn't be a fan of also adding an hrtimer?
>
> We could push the ktime_t (and timer) down into the derived fence
> class, but I think there is going to need to be some extra storage
> *somewhere*.. maybe the fence signaler could get away with just
> storing the nearest upcoming deadline per fence-context instead?

I would just push that into the driver instead.

You most likely don't want the deadline per fence anyway in complex 
scenarios, but rather per frame. And a frame is usually composed from 
multiple fences.

Regards,
Christian.

>
> BR,
> -R
>
>> Regards,
>> Christian.
>>
>>>        u64 context;
>>>        u64 seqno;
>>>        unsigned long flags;
>>> @@ -99,6 +100,7 @@ enum dma_fence_flag_bits {
>>>        DMA_FENCE_FLAG_SIGNALED_BIT,
>>>        DMA_FENCE_FLAG_TIMESTAMP_BIT,
>>>        DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>>> +     DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
>>>        DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
>>>    };
>>>
>>> @@ -261,6 +263,19 @@ struct dma_fence_ops {
>>>         */
>>>        void (*timeline_value_str)(struct dma_fence *fence,
>>>                                   char *str, int size);
>>> +
>>> +     /**
>>> +      * @set_deadline:
>>> +      *
>>> +      * Callback to allow a fence waiter to inform the fence signaler of an
>>> +      * upcoming deadline, such as vblank, by which point the waiter would
>>> +      * prefer the fence to be signaled by.  This is intended to give feedback
>>> +      * to the fence signaler to aid in power management decisions, such as
>>> +      * boosting GPU frequency.
>>> +      *
>>> +      * This callback is optional.
>>> +      */
>>> +     void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
>>>    };
>>>
>>>    void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>> @@ -586,6 +601,8 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
>>>        return ret < 0 ? ret : 0;
>>>    }
>>>
>>> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline);
>>> +
>>>    struct dma_fence *dma_fence_get_stub(void);
>>>    struct dma_fence *dma_fence_allocate_private_stub(void);
>>>    u64 dma_fence_context_alloc(unsigned num);

