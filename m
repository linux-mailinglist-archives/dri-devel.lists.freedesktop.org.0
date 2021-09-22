Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0553F414C02
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 16:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA65F6EBFF;
	Wed, 22 Sep 2021 14:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C298925A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 14:31:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esEibygjYmt2ukmErtP1hj7XyOTNbEFKZPUaK9lebdncosSc6tSTHw4yspfxhiTq+o0NUu7MyQWpaSXf625Be/KCVu7eUWXFGMicxd14tDViGbvQIjqTe14O+CDZQsOQsY9bGCww/PAX9r/T6iKbp+ZO/Wpo3PkWJDLL4WuBWhAvC68rtvv6lEgWiecGZeNAHNxqeKbS2BgwgWbZPUXjQF+KOTWQ5XiEmoIilojR6frQpMao/64mj8XNarj3ZnzYPZRaHobjQX1jvu9YWW2tMUmxYH8mokhtKmki43LOuUmVDaTC/yIklL1OvDjItWH1FgAx+vauQBXwITnAe9RMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=7IdA8DkLRau1Rk4iuhvAPkdsba4DyzAquabAqUgsj3c=;
 b=EHupunmgcvIEyu9aqvqmwGSegLSDzk02K82kB7elF/xwEag/U3nTjED14+gX9HdUjzYGE0LJCLbY+elr+j/boQqwyAfAA2Lf3Ii+UszyHUBznrSx5oFT7ZaGMmQwHiKNj2X2Yd/Hz+r59skLA5Y7BS3GLMKfttkNK3+Zx0sgPTrBDVLzR5O3s0hL2VeuhRcvvl7tgT4tv2aukOUkRoCJENoe6LCS6NQxmP6U7Ku2VlJkF0uKiLsKgK9EkblsQm51dusnJ68qYz2waCrLht61YraJ4UfUCZy3zszetVnZVfdVDW2UP/GqXxq+W86FgRZvDz77JdRA6YW6IGHXaqsBiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7IdA8DkLRau1Rk4iuhvAPkdsba4DyzAquabAqUgsj3c=;
 b=SWqGdVUE+2dlMPt6mSt6CXOAI8udy4ujJmd37NuFgyoOmPVwIpx2iQLSyP5JSk8CXDStwTC6wX9iBkVSXhCb7GY7OgzG9QsdX3SIpGUBKapeBafj80beq1jZOKbWgGCGKZMk1I9IHUSQhx4sui/2KIFncRSCKToKpuHjblaf7gw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM5PR12MB1178.namprd12.prod.outlook.com (2603:10b6:3:6c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Wed, 22 Sep
 2021 14:31:26 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::3153:3d7b:e216:74c0]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::3153:3d7b:e216:74c0%11]) with mapi id 15.20.4523.018; Wed, 22 Sep
 2021 14:31:26 +0000
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
 <d8f43401-c673-b9ce-d5ca-090fec2cb4c3@amd.com>
 <CAF6AEGsnN8sEeXuefB--pDApXeWYR2RVss=jUnz0ORh68SBP1A@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <ff396c19-c6ed-5f25-32df-c404bc8ea661@amd.com>
Date: Wed, 22 Sep 2021 10:31:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAF6AEGsnN8sEeXuefB--pDApXeWYR2RVss=jUnz0ORh68SBP1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::28) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3edf:49b0:5656:36a3:91ba:bdfb]
 (2607:fea8:3edf:49b0:5656:36a3:91ba:bdfb) by
 YT3PR01CA0063.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:84::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 14:31:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9be1421-6bbe-467e-f3fc-08d97dd5a86d
X-MS-TrafficTypeDiagnostic: DM5PR12MB1178:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1178E7BBFA115E2E537D50A0EAA29@DM5PR12MB1178.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9CdfR8e0lXeJLCBbcS2atXhmIXQ0Pad1dM5hrMv1FjM9kWwfzBw2ApCaeatj94/pwNnZlePrToALQ9PSpLv0/PeGEsA5RZ6B7GwVChuncsdjD4/uUj5pAlH7j/8+Q6GcNvEzQ3fnBdvuRs8MeNPUeGGPsfucNGPfPvc8Qw7AzbVZz5SsXdi4Wr/xGm6JLMlnHrfXjBTqvu4k7zaIgBkCkt60/w8N+mPwwoGdFGsxyJkM+byeDZZDag+MXDPmzSznAoH53B3Dz6h+qn1Tf7qKA8q0pJD61Wpqz6rIuCJlpiSkUEASIQHDIi6NbXP5Nr+ckBW3ZIQjKgWPQqjy9A4QGTRsfRxHx5vEfpcs1aQ6Rr/giI6PAuLaalaFn3LieBmIMABmpcfBLOVWyc/So8ZS0RpTv0cJAthogzR3uzx3aYRO69oh/+3zNZV2U29y5idhtrBGX6kNOQvpAgVWLcAtDpasvx/BbxcXgDrRYZ9bwinK9bWjgdBEMqyhkiOu75gEGHjPuYFl5Ii7/XgSHVhImaOqT6bJqZ/3cqeZeADcNzkhvzB+RbKgmx6ptR4dJ/C2iipGYcKbjEOprHMiKz7O6o0k3EeNyvauxJtAHNVHdwqe5J2xI8LqHT8boDTnWbH9/6juu1aDC1qPbkXaxsyv2NClxcfHpsJVNj+CMaAEf14DACxpfUx17v2jivZcPebi5FRNOCYgDZgFvkfyK2Kp//FK5zR8Chn6XRnLABXx2rowOUCNqCFHXkcz0MO2Tcir
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(5660300002)(316002)(53546011)(508600001)(2906002)(83380400001)(38100700002)(186003)(44832011)(4326008)(6486002)(2616005)(36756003)(66476007)(31696002)(66556008)(8936002)(31686004)(66946007)(54906003)(8676002)(6916009)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUVVM0lJakUxSy8rUGhDYkFVRytwYlZ3KzJCbTYxbW5zMFltemJTd25nNS9l?=
 =?utf-8?B?MnpiM1FOREV6M2VvRStwdWhrZ09NR2hwL2YybmhFbElzVnRseG9IZGZaa3p0?=
 =?utf-8?B?ZSs1aE1aRWNFWXF0TjhIakU5bUFSMUlLamk0bmFDZ0lha25kQ0d6c0ZtOHpo?=
 =?utf-8?B?RTlrL1kzdjlrdW1DOWRRQVdsYzN4RktCWTlmeTVvZkROeVY5bWVjQTg4R2tu?=
 =?utf-8?B?YnI0RjZMMTc4N1BycGc5WWIyZDFVa21WYmlNWnhRMnphaGM1bzkvNDJkL0tn?=
 =?utf-8?B?VGZtc1VjNzQ2UDl6QS9ZZ1ZIMEJmdG9qcENMUmxiLzI3VDMzZnFQYUVDWXM0?=
 =?utf-8?B?ZUFoeERHQ2RZeWhhRlZ5bTM5aG1ibGZnTnMvV3R6S1ptUkNaMktndzlsM3Jt?=
 =?utf-8?B?c0VPY1RZMEZ3MjlFRm9oQWZDeUZXa2VMUWlQRWdoQU1CbDkyMHBDTTlWUUMz?=
 =?utf-8?B?VlhPSTBKWVZOaVhuck1xOCtvR3RDdnhXOEgwYzFmSlBRNGtKWGRxYjV6VTNO?=
 =?utf-8?B?QlFSSWp2RXNnOW1QVVB6VityUi9mQ0E5LzFXNmQ5WDVwYVg2enNXVmRWeS83?=
 =?utf-8?B?VVZWdkV2L3RHaDVqNWtNREpSU3NCWmRzS1lRd0duOVQrVlZ2dk9rYXBlUitW?=
 =?utf-8?B?NVFISUpaVmo2b2FVTDd3SXhBcm1EMEVpTDNhTzN3LzlsdXZNMjhwNlYvSnVV?=
 =?utf-8?B?Z0hERUlZVzhoUHkxTmptVjJkY0Y1YUNlTjRmT2VjOUlzVmxaU0hlcmhHY1B5?=
 =?utf-8?B?OE5rcVhlS09UREYzVTh1cnZtMG1pZ0pjNjNHNHFyaVRUN0d2S1owNURNWTQz?=
 =?utf-8?B?RjN3WlQ1Q0QxVHpBWTRvdlpBZ2R3UUJ5bzZTaFQ2WGtWL0NMRUFHTDNBeVRi?=
 =?utf-8?B?RElYQnA4Q0ZYTUpqdEJtZEF1ZWhGSlpHeTJpZEVJblFyb0pjZHc0T0plSllS?=
 =?utf-8?B?UUpFWHFGcndocU4zMndpOURHTWtZUFpzNHNla1RrU1c4WHhHbzhQVzR6eHRm?=
 =?utf-8?B?blZSVkZzd2UycGtZTTh2SWNJNGJnM1hFWWpNQ0s1QWdiTko5NE1NV3djZkpp?=
 =?utf-8?B?Q0JVK2ZjUjRFOTluRzRTNDQyQlpyVi9zdXM0MHZDQ0svSjBmbkx2SXpoM2ND?=
 =?utf-8?B?Q2lBa1FpdjZzNzN0VFhLSkNGOUxSV09iYzNxb0hiblc5bEVIZUM2TjJCN01Y?=
 =?utf-8?B?TTh0U3kycHJEUkdCbEVCQ05NTldYd0NJVkkvbS9yS3NyOGJ6TEhYVFFUYTVt?=
 =?utf-8?B?QXM0c2l3UGZHQzV4cU5iekxxZVZHWUdjL08xY1Fodjk4Tzl2R1dzUGxYdzR6?=
 =?utf-8?B?aTY5Yi9OWjdDRjdhNmpNbTdaeTdOUDUwSVNPcWFGeFZGUG9jUUh0ajhEY2xB?=
 =?utf-8?B?Q3N2dWk1TmZ2NmI5cVdIZDNJNzFWUzN1M0xUNlB1cDgvSldFREJDSU42QUR2?=
 =?utf-8?B?YzEwa1BwZU9VQVVxc1N1RDFSRjc4RHRnQlJ5eE0vMVYwMU1zYkFJVjNyK2xE?=
 =?utf-8?B?STg2Y0pHWmFWbUplS1lDVGxzMXl0QnY3RTh4V2lJVmlpdEJBRjhRY1B3RHNa?=
 =?utf-8?B?SThNU2lrblZlOGUrQVRKSmpDWW5xWkJneEFtZzlVd2xQbGppdmkwNmJOZnlS?=
 =?utf-8?B?RUhKWEV4WU9rQ3VjcWZYQk5ZUkUvTnVXRVYvWFIrd1pzcFJMUWl4OVZVb3FI?=
 =?utf-8?B?bkh1Tk1XRHlEYWRxQTZqbHpQcUY2K1VoTlAzbVlUMEFZTUVLSC9LcTN0M2p6?=
 =?utf-8?B?Q0pGSXhURlJOOERQNlFwRThhbmcwb3JYNE1IYXJXU0VlVDRGd0s1VFlseHVM?=
 =?utf-8?B?NVlKYzdFSDRLdUJkc2VzeHhxQTA2UG9LRmIvZ2RGZlc0cnZ2QzVwSzljRTJa?=
 =?utf-8?Q?jzngqJkOLwtXs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9be1421-6bbe-467e-f3fc-08d97dd5a86d
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 14:31:25.9858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pke/t6/lBVYSwvwB94KyROmji6oRBU7MMqdS9G+SnP2IfKUdrwNFwmxiVv8sALjfhnaD8kT+x95rNw/ERo2JjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1178
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


On 2021-09-21 11:32 p.m., Rob Clark wrote:
> On Tue, Sep 21, 2021 at 7:18 PM Andrey Grodzovsky
> <andrey.grodzovsky@amd.com> wrote:
>>
>> On 2021-09-21 4:47 p.m., Rob Clark wrote:
>>> On Tue, Sep 21, 2021 at 1:09 PM Andrey Grodzovsky
>>> <andrey.grodzovsky@amd.com> wrote:
>>>> On 2021-09-03 2:47 p.m., Rob Clark wrote:
>>>>
>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>
>>>>> As the finished fence is the one that is exposed to userspace, and
>>>>> therefore the one that other operations, like atomic update, would
>>>>> block on, we need to propagate the deadline from from the finished
>>>>> fence to the actual hw fence.
>>>>>
>>>>> v2: Split into drm_sched_fence_set_parent() (ckoenig)
>>>>>
>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>> ---
>>>>>     drivers/gpu/drm/scheduler/sched_fence.c | 34 +++++++++++++++++++++++++
>>>>>     drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
>>>>>     include/drm/gpu_scheduler.h             |  8 ++++++
>>>>>     3 files changed, 43 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>>>> index bcea035cf4c6..4fc41a71d1c7 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>>>> @@ -128,6 +128,30 @@ static void drm_sched_fence_release_finished(struct dma_fence *f)
>>>>>         dma_fence_put(&fence->scheduled);
>>>>>     }
>>>>>
>>>>> +static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>>>>> +                                               ktime_t deadline)
>>>>> +{
>>>>> +     struct drm_sched_fence *fence = to_drm_sched_fence(f);
>>>>> +     unsigned long flags;
>>>>> +
>>>>> +     spin_lock_irqsave(&fence->lock, flags);
>>>>> +
>>>>> +     /* If we already have an earlier deadline, keep it: */
>>>>> +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
>>>>> +         ktime_before(fence->deadline, deadline)) {
>>>>> +             spin_unlock_irqrestore(&fence->lock, flags);
>>>>> +             return;
>>>>> +     }
>>>>> +
>>>>> +     fence->deadline = deadline;
>>>>> +     set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
>>>>> +
>>>>> +     spin_unlock_irqrestore(&fence->lock, flags);
>>>>> +
>>>>> +     if (fence->parent)
>>>>> +             dma_fence_set_deadline(fence->parent, deadline);
>>>>> +}
>>>>> +
>>>>>     static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
>>>>>         .get_driver_name = drm_sched_fence_get_driver_name,
>>>>>         .get_timeline_name = drm_sched_fence_get_timeline_name,
>>>>> @@ -138,6 +162,7 @@ static const struct dma_fence_ops drm_sched_fence_ops_finished = {
>>>>>         .get_driver_name = drm_sched_fence_get_driver_name,
>>>>>         .get_timeline_name = drm_sched_fence_get_timeline_name,
>>>>>         .release = drm_sched_fence_release_finished,
>>>>> +     .set_deadline = drm_sched_fence_set_deadline_finished,
>>>>>     };
>>>>>
>>>>>     struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
>>>>> @@ -152,6 +177,15 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
>>>>>     }
>>>>>     EXPORT_SYMBOL(to_drm_sched_fence);
>>>>>
>>>>> +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
>>>>> +                             struct dma_fence *fence)
>>>>> +{
>>>>> +     s_fence->parent = dma_fence_get(fence);
>>>>> +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
>>>>> +                  &s_fence->finished.flags))
>>>>> +             dma_fence_set_deadline(fence, s_fence->deadline);
>>>> I believe above you should pass be s_fence->finished to
>>>> dma_fence_set_deadline
>>>> instead it fence which is the HW fence itself.
>>> Hmm, unless this has changed recently with some patches I don't have,
>>> s_fence->parent is the one signalled by hw, so it is the one we want
>>> to set the deadline on
>>>
>>> BR,
>>> -R
>>
>> No it didn't change. But then when exactly will
>> drm_sched_fence_set_deadline_finished
>> execute such that fence->parent != NULL ? In other words, I am not clear
>> how propagation
>> happens otherwise - if dma_fence_set_deadline is called with the HW
>> fence then the assumption
>> here is that driver provided driver specific
>> dma_fence_ops.dma_fence_set_deadline callback executes
>> but I was under impression that drm_sched_fence_set_deadline_finished is
>> the one that propagates
>> the deadline to the HW fence's callback and for it to execute
>> dma_fence_set_deadline needs to be called
>> with s_fence->finished.
> Assuming I didn't screw up drm/msm conversion to scheduler,
> &s_fence->finished is the one that will be returned to userspace.. and
> later passed back to kernel for atomic commit (or to the compositor).
> So it is the one that fence->set_deadline() will be called on.  But
> s_fence->parent is the actual hw fence that needs to know about the
> deadline.  Depending on whether or not the job has been written into
> hw ringbuffer or not, there are two cases:
>
> 1) not scheduled yet, s_fence will store the deadline and propagate it
> later once s_fence->parent is known


And by later you mean the call to drm_sched_fence_set_parent
after HW fence is returned  ? If yes I think i get it now.

Andrey


> 2) already scheduled, in which case s_fence->finished.set_deadline
> will propagate it directly to the real fence
>
> BR,
> -R
>
>> Andrey
>>
>>
>>
>>>> Andrey
>>>>
>>>>
>>>>> +}
>>>>> +
>>>>>     struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>>>>                                               void *owner)
>>>>>     {
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index 595e47ff7d06..27bf0ac0625f 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -978,7 +978,7 @@ static int drm_sched_main(void *param)
>>>>>                 drm_sched_fence_scheduled(s_fence);
>>>>>
>>>>>                 if (!IS_ERR_OR_NULL(fence)) {
>>>>> -                     s_fence->parent = dma_fence_get(fence);
>>>>> +                     drm_sched_fence_set_parent(s_fence, fence);
>>>>>                         r = dma_fence_add_callback(fence, &sched_job->cb,
>>>>>                                                    drm_sched_job_done_cb);
>>>>>                         if (r == -ENOENT)
>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>> index 7f77a455722c..158ddd662469 100644
>>>>> --- a/include/drm/gpu_scheduler.h
>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>> @@ -238,6 +238,12 @@ struct drm_sched_fence {
>>>>>              */
>>>>>         struct dma_fence                finished;
>>>>>
>>>>> +     /**
>>>>> +      * @deadline: deadline set on &drm_sched_fence.finished which
>>>>> +      * potentially needs to be propagated to &drm_sched_fence.parent
>>>>> +      */
>>>>> +     ktime_t                         deadline;
>>>>> +
>>>>>             /**
>>>>>              * @parent: the fence returned by &drm_sched_backend_ops.run_job
>>>>>              * when scheduling the job on hardware. We signal the
>>>>> @@ -505,6 +511,8 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>>>>>                                    enum drm_sched_priority priority);
>>>>>     bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>>>>>
>>>>> +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
>>>>> +                             struct dma_fence *fence);
>>>>>     struct drm_sched_fence *drm_sched_fence_alloc(
>>>>>         struct drm_sched_entity *s_entity, void *owner);
>>>>>     void drm_sched_fence_init(struct drm_sched_fence *fence,
