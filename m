Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF29D413F53
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 04:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1716B6EA0F;
	Wed, 22 Sep 2021 02:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37646EA0F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 02:18:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwXwiOdeM9JI8f/jnWyQRo4R1PZsPyw8GBw7xlpJFLvrtmEsmlbpZhKeOhn0zd2fRbucUTALElyq7BEjCBOCm4SuAHqPRLr2mu3fnGWdvi+R0/3uPyYZRHqucOP3nhgQ9M96XTPCU2p0EDX5C6B5Td7u7pEBgOZaag3ymDtTtFWUZKW+FAr6rvR0N40bC52P8AEV2PYgzsP9Lk8902hML550MLf1gzd2vwm/jpmOL+ZYqyi5co7a/qvUeuqDEFxgnsoXlUN4+OZG/NP0OFrJMPjf+1LmfBXGXGNYvQ0TCjx+Iiq9SXoB72pD6cv2KtZDUhGZVspiSaEEgTkvTpGiZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=+Tg64OnQEuYlDiGXri9RFPqr9taNWeFKX6YPS9O1IrU=;
 b=PaaUqkb1XUgIt6jBhMxgJPEOzUDvwG9PAllnjW7ZCHdyzNi+jgs1EP7OXLJmjm8Ba1rkmoXQzhUDvEB7B44kgDzxXNpvulshb2S6EXc1UtI46c4NewYc3kk7kzZc2qBFBqm6ce/XhjmLxrkOtyec9QVnZKJ1CX4Lb5grJneqtus6BfrbGEFEypzHtD6ZkG7msuAumEIX2H5onY/J+RCeb0iZ8RnzC/TU2FF5nLJPnU7xz+/mEYLQCzWvpm74laRMcP2q3pGbqi0jVzQBqbJYk7Cxg9StuSlkrI7SPwULkHiqYfHs+6SDW7wVi3aGwRcgphUky+gloGtulQ1qppPiZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Tg64OnQEuYlDiGXri9RFPqr9taNWeFKX6YPS9O1IrU=;
 b=laRPFjBEIBirAbC63XKXJRQsveEiukU7jIsZhj85S87tkid3j2x+4Iz+kVN2BpviSnh9JXuP3Uzw40JSamFdT2j0o6XVtRCDrQ0HkMju33smLNwtoVHOU+5l5WjdEzcThlY7XVRzu9TZItfs9Orpzzq75uPQc6HZENxCstXm7NU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM5PR12MB1932.namprd12.prod.outlook.com (2603:10b6:3:10e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 22 Sep
 2021 02:18:05 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::3153:3d7b:e216:74c0]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::3153:3d7b:e216:74c0%11]) with mapi id 15.20.4523.018; Wed, 22 Sep
 2021 02:18:04 +0000
Subject: Re: [PATCH v3 4/9] drm/scheduler: Add fence deadline support
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rob Clark <robdclark@chromium.org>,
 David Airlie <airlied@linux.ie>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tian Tao <tiantao6@hisilicon.com>, Steven Price <steven.price@arm.com>,
 Melissa Wen <mwen@igalia.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jack Zhang <Jack.Zhang1@amd.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-5-robdclark@gmail.com>
 <101628ea-23c9-4bc0-5abc-a5b71b0fccc1@amd.com>
 <CAF6AEGt+jiJLaTDVnnVrZm-766OhPfj9wESJxP-FrX3S_c67gQ@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <d8f43401-c673-b9ce-d5ca-090fec2cb4c3@amd.com>
Date: Tue, 21 Sep 2021 22:18:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAF6AEGt+jiJLaTDVnnVrZm-766OhPfj9wESJxP-FrX3S_c67gQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::14) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3edf:49b0:591f:ecc8:119a:23e7]
 (2607:fea8:3edf:49b0:591f:ecc8:119a:23e7) by
 YTOPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Wed, 22 Sep 2021 02:18:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb56e280-f74a-487c-7da4-08d97d6f359b
X-MS-TrafficTypeDiagnostic: DM5PR12MB1932:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB193215135376FB144AF3967EEAA29@DM5PR12MB1932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mdn7e8PVLlaiTllXfVqijkP0AxyQf6nYbDaOPsg3vexaE0hPSqLAvsF04XQ5Mu9BZduS79ixjSjkYPBytIDQE+lWCQwfiAL9exS4Yz9DM7gID1fN3BnWVb9/xV1WtWN6+SqKSp3o8arhm6WPxMfhwO4fnJ5zNLAhKw/E6JylxCb9YMFbbzp1X3+qd0F1pzyHrkIU9mnnIYxYYvAAyXwkehYxgxYpDZ+qHhVI0Tkl06GyLhz3mxV06Q8ijOVwLuQknUhgXChiIlshvd83vUkEMwaRIHIMO56UGJGVlXM9tIgX4yRc26vkmvriR/qvc2pINlu+pcO61mIQb6C3HaZfbPCo4vUHFQ35ogLD+nOzxUQAtabcWrT3RTQxFPdK9OiYPSd13l+jTZwGqnGzgLtP8p7Y4KUm+9FzabI5yjxUlNMon6s2gkW4nfXocft1sSej9w8Z4yqajwnGK4mjmkrbGuAq3fIiLmUeSGUF3VQ2BEsxhA/9P4xXcjyyrI2Ne2fJnpPv/MedI7Go12KyQ9Brfz1+DdLN/QiZQpncM4VGlVo8Or3eu9JxwgI0agwopamSv7TrVQKC72db0PcU+c7LPZUm4UEg5CAJzztEOsKLah/oUr2mAB/XJ2mHCjdxa05oN/thtej0AWFoxBSB0rFNv0WC25x6UC6fkLQ6It7CodxT2AmB5rDpXN6C1S0U/drNQlqDNAkb3v+aaCCMBIvNxasGctANijU4IwBuO1g42wQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(4326008)(38100700002)(53546011)(86362001)(44832011)(2616005)(7416002)(8676002)(66946007)(31686004)(83380400001)(31696002)(2906002)(36756003)(508600001)(66476007)(66556008)(316002)(54906003)(8936002)(186003)(5660300002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0o2bTNMRWtmU1M1RDY3MkNwTEpaU3dUSHhvTkJEUmlMYUsvV1RNd01lQ3lL?=
 =?utf-8?B?d3YvZWdscHZVdTJML0RvdkRQZHZSc05jWlYzTHY1Tk0zVWQyQ0xqZkxVcGI4?=
 =?utf-8?B?SlBQTkkraCtoTGNoeSs2VytZN0RQa1hVa0Z2eWViVjl0VjlUc1lJWGRaU0VZ?=
 =?utf-8?B?eHBKazRlNGhtMG54UHcvYVA1cDhxUlFBR2xiVmRvSlZ6WDZCeldJOWxIWDJs?=
 =?utf-8?B?aVMyWlpKeVhLVmQrdld2S21vRCtNTEFZMnZsQmFzc0Q5RkI5YVg2ZVMwYTVZ?=
 =?utf-8?B?Q0NDeEJGcERTRDR4SHFrd3RxOEVZQmVEWGJkUnBwVkcxZlBVYUMzYW1qOXpJ?=
 =?utf-8?B?L2djaGZpUmZwdEVXeTJ3R2UvYXFTck8wSVYzejhKVHQ1SURVMG1Ma25BL0x6?=
 =?utf-8?B?RXh2bW5FZkRoZjdLSEl1L1lhcVdDSXF1WG1pK2pMeXdYcFd4YmNUNXhnWjNZ?=
 =?utf-8?B?aXh6UmUveXhZRGFIdTg2eVNLYzl5aVVIaVJLRVRrcTRHcVh5cXkwTUlkNFpz?=
 =?utf-8?B?MmN2SEVvZlltbVcrbEFQS2VWUzR5WWszemtuUndHbkgzUWttSytnV1QreVBK?=
 =?utf-8?B?Nk9jbEpTempJTzBMemYrMHRzN2xWL0JER2lMS1gwWjV0bDF0MHRqN2xBTHpp?=
 =?utf-8?B?T2taOGoxRUJIUWp0Nzc5czFmc2NjUURXVDNmMEVPZzJrVmFrSGI2MXlFN2tt?=
 =?utf-8?B?RUxkWTd6bW5VcXBzUVU5aDJnMkYwUWd5N2ppUGNMUndmc3AvU1FzSXBTU09J?=
 =?utf-8?B?eUZoeTVXd0x3OVNXeUgrT082dXUxVVorWkNDSklLUHB6V0VLaE1ZZlJOTnhk?=
 =?utf-8?B?TDR4dXZMYnVyRGdtQjJYZ1E1VFhMMFdKUVVWcDJkcmhlc2hEQWZ2a1o5Y2Vh?=
 =?utf-8?B?ZWtML0ViWFFEZVdFK0F0WVdXenEvM3RwRFN5WGxpdS93TUVIZHBJNkFpTnJL?=
 =?utf-8?B?Ry9sYi9YZnhtdU1FcXZjOWwwcEZjMVdDSUhIUDFtNHZsYTNJNWYzWHFFL0xT?=
 =?utf-8?B?MGxtL2hCd25aWGZsMXcvT2tkNmZOK0RGUExaRU1uKzdndUNqa2VEK1JCSzRh?=
 =?utf-8?B?aHpaNXFUdzhGejJGSVF2c2lKRndmVGZVTWkzMlBrdjJqTE5YaFZXM2d3ODRk?=
 =?utf-8?B?bERpYjZ0QVo3Vi9XSG1yR2llc0J1T3lsTjlrNnovUUtPMjliQlNBVEszMHVq?=
 =?utf-8?B?NW9McGFFVDIvcUN2SUl2MTNVQmJoYXg4R21yYmVEanQxQ3pQbExrQ3FUQ1pL?=
 =?utf-8?B?Rzh2QkI4MHI2WjdZalJuanhDK1JjU1orMzIrT3RTanpOZnNlOWEvUDRvQlhk?=
 =?utf-8?B?SHhlZTNOV0ZqZEJVVytPMmdyRktaRFE0ZWZoNVJtZVY4K0lmekUzQ1BzWUts?=
 =?utf-8?B?SUpJa0xRZ3Zka2lneWxNWjRrVmIrQTZlN20vb1ZFc002M1RKbGVYU1ZjVFBD?=
 =?utf-8?B?cjhtQ2QrQWthdmpFR2pHc2NYVjBEaTBaang1Sy8zaWNlMjM2R2pWbDFUamxa?=
 =?utf-8?B?VXdBbWRGZUNRYzVlWSswWEp4WGxuSU1KdTBwUUhONXBCdFNpa1EzL1BWZ3M0?=
 =?utf-8?B?U2RNTnNZOUtHNFVaNGZ2UkdPQkcyWUVlM2U5Q2pOV3lIQnYyK3FNNXZLRGpR?=
 =?utf-8?B?MmNzZ2o0eG1hNkRzdktkcjdTcnkyWXpJUzFFQjhzTVRmM0d4aTFNNjFiRDV5?=
 =?utf-8?B?RGI2dDR4bmVFWTNBWk82ek9aNDhuUk5jQUFRK0hnMzdMcjVmTVIvV05Bc01N?=
 =?utf-8?B?a0JDZzljM2xEYkVmMjdoN1Q4MXRZckJVWGtuMXJWZ2FOSUJLbjF4UWhaaXE4?=
 =?utf-8?B?dnl0TEhXdGRVUWFvMktpYVZLL3hPWEtKRDdqNWpCbkNHK25EUzh6RG1EZzYz?=
 =?utf-8?Q?+S+ipLoCHuCBh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb56e280-f74a-487c-7da4-08d97d6f359b
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 02:18:04.6769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WweeSDzyCPUtKXzPwcOlyIpq9mi8yUfk9Fl8/gVHWAid5f04po9+TwpKFBrBchUEXMKtqLxrcXOeKlt4sbHWJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1932
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


On 2021-09-21 4:47 p.m., Rob Clark wrote:
> On Tue, Sep 21, 2021 at 1:09 PM Andrey Grodzovsky
> <andrey.grodzovsky@amd.com> wrote:
>> On 2021-09-03 2:47 p.m., Rob Clark wrote:
>>
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> As the finished fence is the one that is exposed to userspace, and
>>> therefore the one that other operations, like atomic update, would
>>> block on, we need to propagate the deadline from from the finished
>>> fence to the actual hw fence.
>>>
>>> v2: Split into drm_sched_fence_set_parent() (ckoenig)
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_fence.c | 34 +++++++++++++++++++++++++
>>>    drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
>>>    include/drm/gpu_scheduler.h             |  8 ++++++
>>>    3 files changed, 43 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>> index bcea035cf4c6..4fc41a71d1c7 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>> @@ -128,6 +128,30 @@ static void drm_sched_fence_release_finished(struct dma_fence *f)
>>>        dma_fence_put(&fence->scheduled);
>>>    }
>>>
>>> +static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>>> +                                               ktime_t deadline)
>>> +{
>>> +     struct drm_sched_fence *fence = to_drm_sched_fence(f);
>>> +     unsigned long flags;
>>> +
>>> +     spin_lock_irqsave(&fence->lock, flags);
>>> +
>>> +     /* If we already have an earlier deadline, keep it: */
>>> +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
>>> +         ktime_before(fence->deadline, deadline)) {
>>> +             spin_unlock_irqrestore(&fence->lock, flags);
>>> +             return;
>>> +     }
>>> +
>>> +     fence->deadline = deadline;
>>> +     set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
>>> +
>>> +     spin_unlock_irqrestore(&fence->lock, flags);
>>> +
>>> +     if (fence->parent)
>>> +             dma_fence_set_deadline(fence->parent, deadline);
>>> +}
>>> +
>>>    static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
>>>        .get_driver_name = drm_sched_fence_get_driver_name,
>>>        .get_timeline_name = drm_sched_fence_get_timeline_name,
>>> @@ -138,6 +162,7 @@ static const struct dma_fence_ops drm_sched_fence_ops_finished = {
>>>        .get_driver_name = drm_sched_fence_get_driver_name,
>>>        .get_timeline_name = drm_sched_fence_get_timeline_name,
>>>        .release = drm_sched_fence_release_finished,
>>> +     .set_deadline = drm_sched_fence_set_deadline_finished,
>>>    };
>>>
>>>    struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
>>> @@ -152,6 +177,15 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
>>>    }
>>>    EXPORT_SYMBOL(to_drm_sched_fence);
>>>
>>> +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
>>> +                             struct dma_fence *fence)
>>> +{
>>> +     s_fence->parent = dma_fence_get(fence);
>>> +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
>>> +                  &s_fence->finished.flags))
>>> +             dma_fence_set_deadline(fence, s_fence->deadline);
>>
>> I believe above you should pass be s_fence->finished to
>> dma_fence_set_deadline
>> instead it fence which is the HW fence itself.
> Hmm, unless this has changed recently with some patches I don't have,
> s_fence->parent is the one signalled by hw, so it is the one we want
> to set the deadline on
>
> BR,
> -R


No it didn't change. But then when exactly will 
drm_sched_fence_set_deadline_finished
execute such that fence->parent != NULL ? In other words, I am not clear 
how propagation
happens otherwise - if dma_fence_set_deadline is called with the HW 
fence then the assumption
here is that driver provided driver specific 
dma_fence_ops.dma_fence_set_deadline callback executes
but I was under impression that drm_sched_fence_set_deadline_finished is 
the one that propagates
the deadline to the HW fence's callback and for it to execute 
dma_fence_set_deadline needs to be called
with s_fence->finished.

Andrey



>
>> Andrey
>>
>>
>>> +}
>>> +
>>>    struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>>                                              void *owner)
>>>    {
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 595e47ff7d06..27bf0ac0625f 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -978,7 +978,7 @@ static int drm_sched_main(void *param)
>>>                drm_sched_fence_scheduled(s_fence);
>>>
>>>                if (!IS_ERR_OR_NULL(fence)) {
>>> -                     s_fence->parent = dma_fence_get(fence);
>>> +                     drm_sched_fence_set_parent(s_fence, fence);
>>>                        r = dma_fence_add_callback(fence, &sched_job->cb,
>>>                                                   drm_sched_job_done_cb);
>>>                        if (r == -ENOENT)
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index 7f77a455722c..158ddd662469 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -238,6 +238,12 @@ struct drm_sched_fence {
>>>             */
>>>        struct dma_fence                finished;
>>>
>>> +     /**
>>> +      * @deadline: deadline set on &drm_sched_fence.finished which
>>> +      * potentially needs to be propagated to &drm_sched_fence.parent
>>> +      */
>>> +     ktime_t                         deadline;
>>> +
>>>            /**
>>>             * @parent: the fence returned by &drm_sched_backend_ops.run_job
>>>             * when scheduling the job on hardware. We signal the
>>> @@ -505,6 +511,8 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>>>                                   enum drm_sched_priority priority);
>>>    bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>>>
>>> +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
>>> +                             struct dma_fence *fence);
>>>    struct drm_sched_fence *drm_sched_fence_alloc(
>>>        struct drm_sched_entity *s_entity, void *owner);
>>>    void drm_sched_fence_init(struct drm_sched_fence *fence,
