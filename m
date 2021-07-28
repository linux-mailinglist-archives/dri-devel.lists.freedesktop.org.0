Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C293D9433
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 19:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C2A6E15E;
	Wed, 28 Jul 2021 17:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2064.outbound.protection.outlook.com [40.107.102.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFDB6E15E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 17:23:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9XHi84v4L6jYC968/sxA+FjdfH0T3zCEqZcjFbAvc+rn5gMkaASE094mNHs/TQHTW2eSyQdOz3XMCX4B/7o6hqQ0PmRAm+YFsPCr7q20tNypwKAZZ09+T6DfbRyu/FhLFfB61FkhgxB/0b574jc5BNj5FyEq2lnUOlOwI18KWYQEZdSnllhYuPDhKlFa6iZB3rPh6Cg+Sx0qB6LTiT4zfhOtDLTlcmwTajo+51ZGO+RsBwTZ0TIcD9+zq89EJJm30XOtBGJGeZFFcOg2q8w3PEwkcDjietc0w9tdZD0J5DpM9IBKUyFPsop6GkuJZPKl0kIi6cAL8rh9lwPqlg1+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHvCFqusIjDUbm4DizGlfLBzSTzguf1WF6hdf5DPIsY=;
 b=NQ68Yen026jlTUVqc4/JY23zJLpQP8Lert/Yl7PEWQAdQsT4Vfu6LP5e9mY7r3E6n38ZsmQCxHROvf7jLGJ4OS62AHN18eOv7lMZwqCfVMrqKfsFjb42ti3tV9viOUMzBVmJuleHMr9Ao2pnoEa/PRakbI20LCwneVfAYFxRbSRISdB4e8pz7YihtacIt7F0opAkbq+vl04dn7GlhmlZGm/p0og00X8StTix13b5X3il0eoxiR7Xd4CfbTenvqOOTGe+nU1CkiSD/ZOaTSJpxPZZN0jl34a0AZlZagVBnTJLxHePieAzCSLHamYLhwUWzzoPDKx7YFu5zy4CIi/rDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHvCFqusIjDUbm4DizGlfLBzSTzguf1WF6hdf5DPIsY=;
 b=xsFIKMFOtYFebI31F1AsgKgYzonRqQes5l20JQHRY4HIvM8zrKa2B/ktJz0XCyno13QDkxCa/JuHtTnuedqbbdYTOOE+c5/DCKPVPYiT+XEEeD9pbJFc7LxciZmYcGB7A3bwENbvtksspRc0rBRiB1I88R1Io8vN+r3X7jwnAik=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Wed, 28 Jul
 2021 17:23:31 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 17:23:31 +0000
Subject: Re: [RFC 1/4] dma-fence: Add deadline awareness
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <20210726233854.2453899-2-robdclark@gmail.com>
 <50b181fe-6605-b7ac-36a6-8bcda2930e6f@gmail.com>
 <CAF6AEGuNxi_aeYE37FT3a-atCUWgepxs-9EwxMfpiMaU7wgqdQ@mail.gmail.com>
 <9edd7083-e6b3-b230-c273-8f2fbe76ca17@amd.com>
 <703dc9c3-5657-432e-ca0b-25bdd67a2abd@gmail.com>
 <CAF6AEGvSpvc2po93b2eKB2cSzx_a+BtPWhQgRs-1NFFZfUbJNw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e5e71356-1c58-04ac-2609-70d268941b8d@amd.com>
Date: Wed, 28 Jul 2021 19:23:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAF6AEGvSpvc2po93b2eKB2cSzx_a+BtPWhQgRs-1NFFZfUbJNw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:f1e3:17b4:fe37:19a9]
 (2a02:908:1252:fb60:f1e3:17b4:fe37:19a9) by
 FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.7 via Frontend Transport; Wed, 28 Jul 2021 17:23:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f79703f8-4193-49b3-aa32-08d951ec6bc3
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4142081B090722518468AF8383EA9@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HUCMD9z2QGAsvz09t6sTflAjGO92E7LkSEUqgE5K5GI6FlA+FTkaoKcwvoIVpxW99mrL1pXPewsiguv+Wq42qTgfKs6ZtTARwkMm8YC8Z1Fnx49f6MWodfnmWj1veoVOMGS+JnM28H45SDti/DqfQ15Q2OPP//PL+7f0VO51uQBjVW1zUqAce2npMBrBrSro48935wTpeQq85QK1hA7qC8pjttiw5LCjWrv97eYTv1lrrpuq8GqJq5ipvQW6awTC1JiXatIeZT4KNrbXCPXhKiYxEZdPzUQ9wwdkWGk9/84obErHTDqnbO9trAPLn12dLLuh8MylJfacsUpFn/vk8aMNKmRhchWSuOiF2bSuhJ64/5TAoE/DsH84XVWU5xGwi4ko2rinn4cOG9P17KUEC/DguLffNwKgEngW2MXVlcKgLsDDA8SVc6Cj2I0Tzu69tl5iJBGlHOKWX9vwcEX7rdRzG10Ruj/hZ5CZdmHdOvcVXmX9sjAH9Nvzi356aohyKfb3pwCKLqPSsa9XKVNNBC7xjmYxS/zYvkSJ69pCGmAWUJxmJCFR5tZnX/Ocf16FcWhfth7w6EZeggwPIyXwW7eZ2gBvw5NzwB6YB8dfuyir9oGAQUrZn2M8SXYW9BQhddFzmJJx9zlKX14c23eMtHWkF2pQ47/tXyllYluSlyBcdxgKwh+ohsPAVGNO0Hmh7fxtIGSsoOTVD8q9FKOlFKVkLWv9e2At3i1mGVURp7CnETYWNYCIsiGswaLfZuhD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(38100700002)(31686004)(53546011)(66574015)(83380400001)(2906002)(186003)(4326008)(6666004)(86362001)(31696002)(6486002)(45080400002)(36756003)(8676002)(7416002)(2616005)(478600001)(5660300002)(966005)(8936002)(66556008)(110136005)(54906003)(316002)(66476007)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0hGUzB4QWJuL3Bkdzh1dDRCWVVwb3pZRHdXWldhVW5FWkk4RDZ5YmQ2ZmFH?=
 =?utf-8?B?MDRyaFJxQ2E0cHZRK0w4N21DeFNxcWgrWnBidEVYNzJYbVBUOEhMZEdiMHZD?=
 =?utf-8?B?UXArek5WTzVEY2h4dkFOeTNjckpjazYrQlp1Nk5iZ3B0L0NNZzBlRm10V0VX?=
 =?utf-8?B?Z0ZJM1pXRlR2UTFDbjZnb0R6NHlpRnd5UzRKeU93NWVQbHMyNWlBbWhaaVVo?=
 =?utf-8?B?cTNVRzFVQVFzT005N05iTUFkYnZDZ29ONURTVG11U1EvOUZkMzhad04wTkJy?=
 =?utf-8?B?ekVSclpFbm43QWtqK200b010YWl2ZjBkN00yemMrQ0VCMjBrYzdHTTZHcHND?=
 =?utf-8?B?aHFicUxBR2lURmNxUFRoVWo0WDc3UEU1S21WWk5Gek5LRmFXSHhGYUZndVJI?=
 =?utf-8?B?Uk1NWHdkWTJNRzhneEdFbUJ2SGFnNVF0amdmcmd1MnFlOS9tZmRyM0VaYk13?=
 =?utf-8?B?Y2d4RFZXSG1leTB5TVJ5WUtRT3hwSStXL1A0RG5FMnRXdnJEWGdIbm05aFZK?=
 =?utf-8?B?VGQ5bXB4VURCUFJHeThwb1UvSGRkSStyaXVvaGVVVmMrWFVEOGM0ZFB3ZExo?=
 =?utf-8?B?eG4vNnlWRVBsMElWOGpUci9JcXRtekJtb3ZkMmtNOHNpUUc0Sy9JSzEwT3d5?=
 =?utf-8?B?UUpudjNLMDlwaFgyMmNWbEdUZEo4Q3lWM2YvTjdoTnlvaXdxeFdUSTFoWTFn?=
 =?utf-8?B?R0wvTzlqaUNTRXF0aFZZT3ZQZGlYZEI4TU4vOHRRMDJyVlhyVTZaUXRkR2dB?=
 =?utf-8?B?VGdHZkdyQkpPdEVVN2xzU0ZuY3QvMTNXVklTelpxUWtTNDZVRmRXWGdvVHpY?=
 =?utf-8?B?UmpKWkkyTDU1TFp5amZoY1R4YnYweW00Wjdoak9PTG5HMUpRc3R1MTVpdmhn?=
 =?utf-8?B?ZEsrRDZubUZmcWMvRHlPOCsrV1pXUUlVeTE4Tmw2dFUybHo5ZUJRZmRHbC9I?=
 =?utf-8?B?MjAvaFpyRUtBNTdLaGFRMzJsVTZReC9HT3dTMU91Qk0rWGhTckZqOEdjYWFx?=
 =?utf-8?B?bUtMMkJGbUpBK29rTXlHbVR4MG1xSVRCdDZSWmdiMDlmdVRTVzFGbVRBOXl6?=
 =?utf-8?B?alR2RDYrVGUreTBhTTRSb1AvVG96a2hiUlcwb0VBL0pLdVNkSW5Tczd4andk?=
 =?utf-8?B?eGgrR1cxUFlkeVhVQ0RhRDRPK3p4RFpFcjduVE02c0hRcFUyd1U0RDJKRW8v?=
 =?utf-8?B?aTlYS0paTmQrZGQweWJKR0h4aE1uUnhVMFZYdU5UQXFmY0tMT0FtZFNvdUMw?=
 =?utf-8?B?eEUza0ZSRlVlTktKdDE2dmNGRVcvdERQc3VHUHZwbXlVY0dVL1I3Y1YvOTdV?=
 =?utf-8?B?THgvUDhRMmZtWGFxTDQwNUthVElxN0w2RGIwb0ZxeUE5QlN4TnhiaEtpN2xz?=
 =?utf-8?B?YTlsUkNMOG5uZE03NTJaZ2xZNm1qVUJPUVpPa0N1Y3d0QndqQ2RqbzlrVUUw?=
 =?utf-8?B?eTNEUUhqTG16UjhvZm1RamdYQlFZUktFWGRxNUlJZ2NYSmxFSzM5S2xCMk5N?=
 =?utf-8?B?aXdXOXdFUG1CK3JKNzFZc3lGU211WlU0RHA0RmhxMnh5V2RMME1zaG5VWVNQ?=
 =?utf-8?B?MUR0VFF0bU8yQTNrczhzMk9EcjRVdThGcWl1Y3F1bXBvK3FxQjJwT2l0RDVv?=
 =?utf-8?B?aE9weWo0aDYxQms5a3J3Wks4NWhrdlBxMXE3aXd4TlZRNlJQWlZlcFloMTdC?=
 =?utf-8?B?V0pscjAwblVKWTcyT2lTZEthK2xhQm1sKzIrUXJrcnNYc08rMzV0RjZOekFp?=
 =?utf-8?B?MDN5RW9HN3hkOENqYStqa1hZOTFKYklkVjNqLy9PbUVuSzdZVVVmd3dhZUlG?=
 =?utf-8?B?ZjNhSUtYaGkrcWtER2hTOWxvNkRnL0pabkRzVXZudzdrU0Ixd29ONGczNzIr?=
 =?utf-8?Q?nD9QwsWLhaF1N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f79703f8-4193-49b3-aa32-08d951ec6bc3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 17:23:31.3251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJJjo4RSLh27jC5/wTxkRl9mqUv8ueLI5dBFNMRJF3aww6hjYTd2ud84Y8uAMrOe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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



Am 28.07.21 um 17:15 schrieb Rob Clark:
> On Wed, Jul 28, 2021 at 4:37 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 28.07.21 um 09:03 schrieb Christian König:
>>> Am 27.07.21 um 16:25 schrieb Rob Clark:
>>>> On Tue, Jul 27, 2021 at 12:11 AM Christian König
>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>> Am 27.07.21 um 01:38 schrieb Rob Clark:
>>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>>
>>>>>> Add a way to hint to the fence signaler of an upcoming deadline,
>>>>>> such as
>>>>>> vblank, which the fence waiter would prefer not to miss. This is to
>>>>>> aid
>>>>>> the fence signaler in making power management decisions, like boosting
>>>>>> frequency as the deadline approaches and awareness of missing
>>>>>> deadlines
>>>>>> so that can be factored in to the frequency scaling.
>>>>>>
>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>>> ---
>>>>>>     drivers/dma-buf/dma-fence.c | 39
>>>>>> +++++++++++++++++++++++++++++++++++++
>>>>>>     include/linux/dma-fence.h   | 17 ++++++++++++++++
>>>>>>     2 files changed, 56 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>>>>> index ce0f5eff575d..2e0d25ab457e 100644
>>>>>> --- a/drivers/dma-buf/dma-fence.c
>>>>>> +++ b/drivers/dma-buf/dma-fence.c
>>>>>> @@ -910,6 +910,45 @@ dma_fence_wait_any_timeout(struct dma_fence
>>>>>> **fences, uint32_t count,
>>>>>>     }
>>>>>>     EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>>>>>>
>>>>>> +
>>>>>> +/**
>>>>>> + * dma_fence_set_deadline - set desired fence-wait deadline
>>>>>> + * @fence:    the fence that is to be waited on
>>>>>> + * @deadline: the time by which the waiter hopes for the fence to be
>>>>>> + *            signaled
>>>>>> + *
>>>>>> + * Inform the fence signaler of an upcoming deadline, such as
>>>>>> vblank, by
>>>>>> + * which point the waiter would prefer the fence to be signaled
>>>>>> by.  This
>>>>>> + * is intended to give feedback to the fence signaler to aid in power
>>>>>> + * management decisions, such as boosting GPU frequency if a periodic
>>>>>> + * vblank deadline is approaching.
>>>>>> + */
>>>>>> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t
>>>>>> deadline)
>>>>>> +{
>>>>>> +     unsigned long flags;
>>>>>> +
>>>>>> +     if (dma_fence_is_signaled(fence))
>>>>>> +             return;
>>>>>> +
>>>>>> +     spin_lock_irqsave(fence->lock, flags);
>>>>>> +
>>>>>> +     /* If we already have an earlier deadline, keep it: */
>>>>>> +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags) &&
>>>>>> +         ktime_before(fence->deadline, deadline)) {
>>>>>> +             spin_unlock_irqrestore(fence->lock, flags);
>>>>>> +             return;
>>>>>> +     }
>>>>>> +
>>>>>> +     fence->deadline = deadline;
>>>>>> +     set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags);
>>>>>> +
>>>>>> +     spin_unlock_irqrestore(fence->lock, flags);
>>>>>> +
>>>>>> +     if (fence->ops->set_deadline)
>>>>>> +             fence->ops->set_deadline(fence, deadline);
>>>>>> +}
>>>>>> +EXPORT_SYMBOL(dma_fence_set_deadline);
>>>>>> +
>>>>>>     /**
>>>>>>      * dma_fence_init - Initialize a custom fence.
>>>>>>      * @fence: the fence to initialize
>>>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>>>>> index 6ffb4b2c6371..4e6cfe4e6fbc 100644
>>>>>> --- a/include/linux/dma-fence.h
>>>>>> +++ b/include/linux/dma-fence.h
>>>>>> @@ -88,6 +88,7 @@ struct dma_fence {
>>>>>>                 /* @timestamp replaced by @rcu on
>>>>>> dma_fence_release() */
>>>>>>                 struct rcu_head rcu;
>>>>>>         };
>>>>>> +     ktime_t deadline;
>>>>> Mhm, adding the flag sounds ok to me but I'm a bit hesitating adding
>>>>> the
>>>>> deadline as extra field here.
>>>>>
>>>>> We tuned the dma_fence structure intentionally so that it is only 64
>>>>> bytes.
>>>> Hmm, then I guess you wouldn't be a fan of also adding an hrtimer?
>>>>
>>>> We could push the ktime_t (and timer) down into the derived fence
>>>> class, but I think there is going to need to be some extra storage
>>>> *somewhere*.. maybe the fence signaler could get away with just
>>>> storing the nearest upcoming deadline per fence-context instead?
>>> I would just push that into the driver instead.
>>>
>>> You most likely don't want the deadline per fence anyway in complex
>>> scenarios, but rather per frame. And a frame is usually composed from
>>> multiple fences.
> Right, I ended up keeping track of the nearest deadline in patch 5/4
> which added drm/msm support:
>
>    https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F447138%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cce6ace85263d448bbc9f08d951d9f06c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637630819606427306%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=ameszAOlClaZNeUDlYr37ZdIytVXNgiEUKuctjXLqZ0%3D&amp;reserved=0
>
> But if we do have the ktime_t in dma_fence in dma_fence, we can add
> some checks and avoid calling back to the driver if a later deadline
> is set on a fence that already has an earlier deadline.  OTOH I
> suppose I can push all that back to the driver to start, and we can
> revisit once we have more drivers implementing deadline support.

I still think that all of this is rather specific to your use case and 
have strong doubt that anybody else will implement that.

>> Thinking more about it we could probably kill the spinlock pointer and
>> make the flags 32bit if we absolutely need that here.
> If we had a 'struct dma_fence_context' we could push the spinlock, ops
> pointer, and u64 context into that and replace with a single
> dma_fence_context ptr, fwiw

That won't work. We have a lot of use cases where you can't allocate 
memory, but must allocate a context.

Christian.

>
> BR,
> -R
>
>> But I still don't see the need for that, especially since most drivers
>> probably won't implement it.
>>
>> Regards,
>> Christian.
>>
>>> Regards,
>>> Christian.
>>>
>>>> BR,
>>>> -R
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>         u64 context;
>>>>>>         u64 seqno;
>>>>>>         unsigned long flags;
>>>>>> @@ -99,6 +100,7 @@ enum dma_fence_flag_bits {
>>>>>>         DMA_FENCE_FLAG_SIGNALED_BIT,
>>>>>>         DMA_FENCE_FLAG_TIMESTAMP_BIT,
>>>>>>         DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>>>>>> +     DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
>>>>>>         DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
>>>>>>     };
>>>>>>
>>>>>> @@ -261,6 +263,19 @@ struct dma_fence_ops {
>>>>>>          */
>>>>>>         void (*timeline_value_str)(struct dma_fence *fence,
>>>>>>                                    char *str, int size);
>>>>>> +
>>>>>> +     /**
>>>>>> +      * @set_deadline:
>>>>>> +      *
>>>>>> +      * Callback to allow a fence waiter to inform the fence
>>>>>> signaler of an
>>>>>> +      * upcoming deadline, such as vblank, by which point the
>>>>>> waiter would
>>>>>> +      * prefer the fence to be signaled by.  This is intended to
>>>>>> give feedback
>>>>>> +      * to the fence signaler to aid in power management
>>>>>> decisions, such as
>>>>>> +      * boosting GPU frequency.
>>>>>> +      *
>>>>>> +      * This callback is optional.
>>>>>> +      */
>>>>>> +     void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
>>>>>>     };
>>>>>>
>>>>>>     void dma_fence_init(struct dma_fence *fence, const struct
>>>>>> dma_fence_ops *ops,
>>>>>> @@ -586,6 +601,8 @@ static inline signed long dma_fence_wait(struct
>>>>>> dma_fence *fence, bool intr)
>>>>>>         return ret < 0 ? ret : 0;
>>>>>>     }
>>>>>>
>>>>>> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t
>>>>>> deadline);
>>>>>> +
>>>>>>     struct dma_fence *dma_fence_get_stub(void);
>>>>>>     struct dma_fence *dma_fence_allocate_private_stub(void);
>>>>>>     u64 dma_fence_context_alloc(unsigned num);

