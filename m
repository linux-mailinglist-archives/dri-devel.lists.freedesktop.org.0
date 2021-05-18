Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C1A387DA7
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 18:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B2A6EC33;
	Tue, 18 May 2021 16:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DED6EC33;
 Tue, 18 May 2021 16:33:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nnuwb0BllsvZzJxsAeK6QdVRtnJk3FMOLLDHZ+YFEE6wxh9/TH98arv9xGUER+P/NGOIdcs13ugKAWY3uUTTGuRGcqAkfPUSp8x6cHt3NJbUqOfzY0IuNNkNf0qR9SNJrCObVfSTsE8JdrdTbBV0UTGIICzpOjChOE+/Ft7o0hByeVh4OyAh9JyvyqpxIDYoSa+OKovjQiYXO6wcKFLy/1zJE5iD60LCod2/r8hjyJqLsQpRDvMmaxbsGbcDFC3nhXHXGs5mBQGuc5D8UZO57ZprSlLv8+LXw3b27ygTaRsLdD2QM8X2G15s5SwYtkXG72BrE+GjuCUHB6kdJNERTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcxouU7wHgBqvHm1nzxBfqyKnh8fCU8FG5L6WbDVhro=;
 b=R0oKPjExwTbXeHX13b4QMDf/H5uytGM/MYrLd1p9AlEXQdjrZvld4ZbmILMVCs2lue6zbcNbNxCDx/rfdkcIvX5aNmzV4K/AXnHe/6UpMkBAsccKyTUeEo8ePjxBZba5WA6x9+cxyoUQFpDBzTDZ2AXjRl0dGVtL7XgmpcL0JUdeC2L21GOEztci3Ede4gF2nc9bUWxI0IugSYWDEv26RrbAk+akckcTDNikJqllo0v4dCOLzfRnP8iMSRkHVlYgpLb0epQWae2OyYfr8bSIlgviCrxP8oJ62JvyKdlQyb6fcXee+KlIcABxUBuqfaDsCtgfjMWx52JsKmLn36PzhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcxouU7wHgBqvHm1nzxBfqyKnh8fCU8FG5L6WbDVhro=;
 b=RGhDwPix5sjNqmJOlYM7Blsdl/CT5ECNUs4EUl1nAmXB/kDtN6ByWii6cD2zXksRR1JO+7z8H1Xa5ZgUI+zH3RGsrjmkJzqW/uWBjQuqdfVKZljHSmPgfmVXpCEKHoU9dH1bjAP0R8Uy8+t+PsspVPJyxAa6HjC6ym0awrlhr+0=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4784.namprd12.prod.outlook.com (2603:10b6:208:39::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.27; Tue, 18 May
 2021 16:33:44 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 16:33:44 +0000
Subject: Re: [PATCH v7 13/16] drm/scheduler: Fix hang when sched_entity
 released
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-14-andrey.grodzovsky@amd.com>
 <9e1270bf-ab62-5d76-b1de-e6cd49dc4841@amd.com>
 <f0c5dea7-af35-9ea5-028e-6286e57a469a@amd.com>
 <34d4e4a8-c577-dfe6-3190-28a5c63a2d23@amd.com>
 <da1f9706-d918-cff8-2807-25da0c01fcde@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8228ea6b-4faf-bb7e-aaf4-8949932e869a@amd.com>
Date: Tue, 18 May 2021 18:33:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <da1f9706-d918-cff8-2807-25da0c01fcde@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:88c7:d7d9:22ef:f850]
X-ClientProxiedBy: AM0PR02CA0127.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:88c7:d7d9:22ef:f850]
 (2a02:908:1252:fb60:88c7:d7d9:22ef:f850) by
 AM0PR02CA0127.eurprd02.prod.outlook.com (2603:10a6:20b:28c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 16:33:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e27cb356-511e-4684-99ac-08d91a1ab3c9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4784:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB47844BBBF67AE55EE509E527832C9@MN2PR12MB4784.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yoczC9DRlHjOHSw+T4zRNmAT4aR2dM2dS8wLLnkRqdIOSm6h+PyHLJ1DmPL+6lVjZZ7CBEcXX1X0AkE3j4fCSg4RB45KsVphzaiOhc4qBqVua+698ieY7R7F1POV991rclmft244qu02HosxLb5pVfDlqz64wJ5s5iGxGs/GgCgOBofEVapUQb+dYEf5CWnoS63WeU+Uz9OBJH4jzUk3FU42eZWdleg1Cz1GLy9Rcr7SjlTaONPZkdFyZ3K6E3++gF6COlyV27mE0acNL9wQSwiNeMCkGTzXZAkARxUjjVcaKI4noKVM6jVTjT7wdva0dywjUyHMEcSxztKyM/vcUXCF/02zhbhHYPjkRjGVqpcszvPU09s6F4hwTR6iTi7/Lb73fCWbMQ2Jk++7pSdxRm3vLdzIRxUHoQsXOk+b9fzxhfUgTtUBYrej3C1QM8gN4nSGYQ+rskiyzTmLozq81PGkUJ+CnLclfJarzsB8SjxpDfL29R0ErtpPjd4pKnT5YZQrWH10khxeulSbIeKrBKaDnDvPmeAS7LrDieYkQXpC0O2AnHNQrRbWJUc0++vthDJjZkyPRF5rJ8ZAnhLHivMQjnU8qnNNnx44hpJaIeQ170vO1vb+pWA+P4HMUMTRYZ/QMq7ad6vSELsmwhGxAi/AtCIgFhmzfGMlcmZWhLh6499PKikCIdXmiBr3nzS6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(66574015)(83380400001)(52116002)(6636002)(16526019)(186003)(6666004)(6486002)(31696002)(31686004)(8676002)(66476007)(478600001)(36756003)(66556008)(2906002)(66946007)(316002)(86362001)(38100700002)(5660300002)(4326008)(2616005)(8936002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WElFN0VNUXdEcEJWeFZ0Q2lsT0ZvRWgwYjc1R1IrZlR6aHFwMlhnaFBxZk5F?=
 =?utf-8?B?bVF1eFJrbkxOWUVBdDZtVW9zQis1NU80S01hOFJoOXkwZnBLS3dpdm9vQlRt?=
 =?utf-8?B?RmNqMEZkWXNNS1MrVkFyanBkUUlQRnhXcEl6RFd3bW9HYUZDbGViMlZTTURn?=
 =?utf-8?B?emR1VmtPWWFad3ZUMHVXa2orMWdQelp0Smk4cGJvd0FsMldycVVjZmt4Z3JT?=
 =?utf-8?B?NHdNb2Y3S1RpajdXNmxQQTUyZUh0N0lBenNNNldGNW1yWlZrcjVnRUFxUnI0?=
 =?utf-8?B?c1YwZm04Z3JBN3ZhVDV3OGpNbkhrT2dDVVNJWHZPdytuUDYvWmR2K1Q3T2xu?=
 =?utf-8?B?MVRsTDJJRnJhMk5zQWt6a0pRdE5Ua0phUGtML3dnS3E2NGJNUG0wQjIyQ2tN?=
 =?utf-8?B?SllUWG9hYVpoN0lCNUFaMHAvWFYyNTNOZWwvdy81Ym96c1N4RDN5dWZpMCtR?=
 =?utf-8?B?eUUwU0thRHN1Rm0xL0FZVDZ3VWVwampOTGs3bjJsZDdHMTREemdBSUl3RXg0?=
 =?utf-8?B?czA5Ni84MW1TblI5OVFTSk1EVHRmTzIvOGhFM2NJQStaTHI0TWJYbElxV29J?=
 =?utf-8?B?RkVVK1lEa0NXNFV3NmdNeXZsc29oTENLTEJKMGF5OUROYitXTnBHam9HdXBh?=
 =?utf-8?B?UnRnUlM2MGpiZEJLbWUxdmlEclVEUFNDL2htMllpUStxNDNGRjNudDVFNUR4?=
 =?utf-8?B?TnFkcEhWQXRHZjI4dS82SVpQSjAwMzlFQUR6MEpyN1FuZHBQajQzcXRHRktu?=
 =?utf-8?B?Qmt6VUdJNkd2Y2FDc0dhbStEdGhiVjB0b3d2bWJFRFlRQW8vQkdzRVVaRFdL?=
 =?utf-8?B?QTRINWdHbkN0bVo0cWVFZnZEcDQ4MlAxYlNGUFdmM2kzM3Z6ZEdFbzdiR3Yx?=
 =?utf-8?B?ZzN1SUtsd2NqUTFUcktVdzFXaURqbzJ2UHVHaU96MW9WR3dMdzR6S3BHU3NM?=
 =?utf-8?B?VUJJR1dXdzN5WGx2NVd3MUVKeStrTThxRjZjanBuTUNPQUdheDk3NEgvZEdK?=
 =?utf-8?B?NHYveDQ5K3BITGcxcWgzeEc4WXAxTlVuWUgxbVphOWVKUUZKSHNzN2xiV1RR?=
 =?utf-8?B?NGR0S3lTUjFqSGhrOXo3Z0ZHem1sYXBVd0VHR0ZpVWdCY3NLbm5UMzVURGxp?=
 =?utf-8?B?THFraGx4SWNHSkVUb2VEaUlZMlhNcVhVN3NZTVQ3dDVLS1ltRTdaellESkFq?=
 =?utf-8?B?ZDEwbndEdEZ2bllTbWhkSW05eWtBbENPbTVkYVIvUjVIc2dMT2hYUUgrM0wx?=
 =?utf-8?B?bnZoRnFXVlBvOHRibFRsaXphZDVQS0orUlhYY3dOeWVobkNxZ2tzRTVNZkVP?=
 =?utf-8?B?aGVRS1J5b0FFNVBPK1pTZlp0K3hUZmNIRHlnVUVFTU9qdnZ0S0xVUHR4dzdV?=
 =?utf-8?B?ODRmMWxhNmM2anBkaWNLRHVNUlkzbm9LVHpzSklDamFoeWNaejZORHllYkY1?=
 =?utf-8?B?a2RpRzY1dG10MWxNZFVlVGp5eDZOTWlqc0JvRko3aDNPTzRFKy9XMFdWb2I3?=
 =?utf-8?B?RzBUUHBNN0ZPMW9ZbzFpRmNNejgyREN2anp3Q1VEeFJPcXYzVExPYmNHNUor?=
 =?utf-8?B?QlhseC9SRWFjTVVPTVcvK05tZ3phUlFXV1Axa2ltLzQ0SmJHN2hDRkZINDdL?=
 =?utf-8?B?My9QVm83eWRhd3lBcHhlWWs3TDVVektZdzFaamRyQ1ZubVNBamVTbzd6R2lh?=
 =?utf-8?B?T0VXa0xoT1VKVytnUVpOU3BBZDdpektieURkdGNlenl6cW5tdE5QY3JPeFc5?=
 =?utf-8?B?ampPMTIxWHdpOVRLSTRMVVZmVzBhMXR5UnF2a3NQNFdNaUF3ODJUQWo4M0kx?=
 =?utf-8?B?MFltVFZ2UndSUkVRUlhMdC95RWZBUWNLZXEvQWpVMUhQU211QlVrTCtOdllE?=
 =?utf-8?Q?kcMG98PtGIJdC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e27cb356-511e-4684-99ac-08d91a1ab3c9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 16:33:43.9420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mc0H5tMwWsf/DXeEh0Ubgo9sTovWSmtRj+g6D747vQPWlO9oLoepCe1RVP2YhwdZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4784
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.05.21 um 18:17 schrieb Andrey Grodzovsky:
>
>
> On 2021-05-18 11:15 a.m., Christian König wrote:
>> Am 18.05.21 um 17:03 schrieb Andrey Grodzovsky:
>>>
>>> On 2021-05-18 10:07 a.m., Christian König wrote:
>>>> In a separate discussion with Daniel we once more iterated over the 
>>>> dma_resv requirements and I came to the conclusion that this 
>>>> approach here won't work reliable.
>>>>
>>>> The problem is as following:
>>>> 1. device A schedules some rendering with into a buffer and exports 
>>>> it as DMA-buf.
>>>> 2. device B imports the DMA-buf and wants to consume the rendering, 
>>>> for the the fence of device A is replaced with a new operation.
>>>> 3. device B is hot plugged and the new operation canceled/newer 
>>>> scheduled.
>>>>
>>>> The problem is now that we can't do this since the operation of 
>>>> device A is still running and by signaling our fences we run into 
>>>> the problem of potential memory corruption.
>
> By signaling s_fence->finished of the canceled operation from the
> removed device B we in fact cause memory corruption for the uncompleted
> job still running on device A ? Because there is someone waiting to
> read write from the imported buffer on device B and he only waits for
> the s_fence->finished of device B we signaled
> in drm_sched_entity_kill_jobs ?

Exactly that, yes.

In other words when you have a dependency chain like A->B->C then memory 
management only waits for C before freeing up the memory for example.

When C now signaled because the device is hot-plugged before A or B are 
finished they are essentially accessing freed up memory.

Christian.

>
> Andrey
>
>>>
>>>
>>> I am not sure this problem you describe above is related to this patch.
>>
>> Well it is kind of related.
>>
>>> Here we purely expand the criteria for when sched_entity is
>>> considered idle in order to prevent a hang on device remove.
>>
>> And exactly that is problematic. See the jobs on the entity need to 
>> cleanly wait for their dependencies before they can be completed.
>>
>> drm_sched_entity_kill_jobs() is also not handling that correctly at 
>> the moment, we only wait for the last scheduled fence but not for the 
>> dependencies of the job.
>>
>>> Were you addressing the patch from yesterday in which you commented
>>> that you found a problem with how we finish fences ? It was
>>> '[PATCH v7 12/16] drm/amdgpu: Fix hang on device removal.'
>>>
>>> Also, in the patch series as it is now we only signal HW fences for the
>>> extracted device B, we are not touching any other fences. In fact as 
>>> you
>>> may remember, I dropped all new logic to forcing fence completion in
>>> this patch series and only call amdgpu_fence_driver_force_completion
>>> for the HW fences of the extracted device as it's done today anyway.
>>
>> Signaling hardware fences is unproblematic since they are emitted 
>> when the software scheduling is already completed.
>>
>> Christian.
>>
>>>
>>> Andrey
>>>
>>>>
>>>> Not sure how to handle that case. One possibility would be to wait 
>>>> for all dependencies of unscheduled jobs before signaling their 
>>>> fences as canceled.
>>>>
>>>> Christian.
>>>>
>>>> Am 12.05.21 um 16:26 schrieb Andrey Grodzovsky:
>>>>> Problem: If scheduler is already stopped by the time sched_entity
>>>>> is released and entity's job_queue not empty I encountred
>>>>> a hang in drm_sched_entity_flush. This is because 
>>>>> drm_sched_entity_is_idle
>>>>> never becomes false.
>>>>>
>>>>> Fix: In drm_sched_fini detach all sched_entities from the
>>>>> scheduler's run queues. This will satisfy drm_sched_entity_is_idle.
>>>>> Also wakeup all those processes stuck in sched_entity flushing
>>>>> as the scheduler main thread which wakes them up is stopped by now.
>>>>>
>>>>> v2:
>>>>> Reverse order of drm_sched_rq_remove_entity and marking
>>>>> s_entity as stopped to prevent reinserion back to rq due
>>>>> to race.
>>>>>
>>>>> v3:
>>>>> Drop drm_sched_rq_remove_entity, only modify entity->stopped
>>>>> and check for it in drm_sched_entity_is_idle
>>>>>
>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>> ---
>>>>>   drivers/gpu/drm/scheduler/sched_entity.c |  3 ++-
>>>>>   drivers/gpu/drm/scheduler/sched_main.c   | 24 
>>>>> ++++++++++++++++++++++++
>>>>>   2 files changed, 26 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> index 0249c7450188..2e93e881b65f 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> @@ -116,7 +116,8 @@ static bool drm_sched_entity_is_idle(struct 
>>>>> drm_sched_entity *entity)
>>>>>       rmb(); /* for list_empty to work without lock */
>>>>>       if (list_empty(&entity->list) ||
>>>>> -        spsc_queue_count(&entity->job_queue) == 0)
>>>>> +        spsc_queue_count(&entity->job_queue) == 0 ||
>>>>> +        entity->stopped)
>>>>>           return true;
>>>>>       return false;
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index 8d1211e87101..a2a953693b45 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -898,9 +898,33 @@ EXPORT_SYMBOL(drm_sched_init);
>>>>>    */
>>>>>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>>>   {
>>>>> +    struct drm_sched_entity *s_entity;
>>>>> +    int i;
>>>>> +
>>>>>       if (sched->thread)
>>>>>           kthread_stop(sched->thread);
>>>>> +    for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= 
>>>>> DRM_SCHED_PRIORITY_MIN; i--) {
>>>>> +        struct drm_sched_rq *rq = &sched->sched_rq[i];
>>>>> +
>>>>> +        if (!rq)
>>>>> +            continue;
>>>>> +
>>>>> +        spin_lock(&rq->lock);
>>>>> +        list_for_each_entry(s_entity, &rq->entities, list)
>>>>> +            /*
>>>>> +             * Prevents reinsertion and marks job_queue as idle,
>>>>> +             * it will removed from rq in drm_sched_entity_fini
>>>>> +             * eventually
>>>>> +             */
>>>>> +            s_entity->stopped = true;
>>>>> +        spin_unlock(&rq->lock);
>>>>> +
>>>>> +    }
>>>>> +
>>>>> +    /* Wakeup everyone stuck in drm_sched_entity_flush for this 
>>>>> scheduler */
>>>>> +    wake_up_all(&sched->job_scheduled);
>>>>> +
>>>>>       /* Confirm no work left behind accessing device structures */
>>>>>       cancel_delayed_work_sync(&sched->work_tdr);
>>>>
>>

