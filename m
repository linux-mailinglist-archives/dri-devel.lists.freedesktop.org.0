Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6B8387D36
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 18:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E01B6EC2B;
	Tue, 18 May 2021 16:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A386EC26;
 Tue, 18 May 2021 16:17:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqmoapXBy5yZWLq1gMBgQVOZWiEXwqssDEeMsAhy6COxyz09JTVs0Ov2oum/ZR119sgcLe0TrOdJ/eMfNbtkwQ6nQF9OJeDok0okyUGcP2lCOFR2TkpRV/oruloO1mg+9aIOw4TPOthpMj622tNoaQn7ewIVvQbgCWuHgqSWFAeAOU/Ek2UNHa3PtpGWCYILbsT30jUe81IhXNjOQEF75xRwxOi8jUzaZjf6Q6VSWzyqMeaoekH4zWN2/rvln3yBDmb/bGBpMzcjaVuyLT9yvdP4yGPWab6HuYQfuPK1cU0Sgl2PShnhiqqnQNzhABSUqpYgcOAYqIcNxbCCzwKlBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZrtBWzw3cC0Q/E2EdQLqYcCt/kbyTNStxCP5zLj2to=;
 b=Gv6Xvj+LZg9G15ANJg10mRAYy43Hksxuo639Thjn/sXJf4rMznNobhdXD6SVr/1OT/YALp2CpVP0UmmvZnTniTAQ0lwUA7FEYXEZKLaBsz1tA22RGLWfI/yfAMWj3VK1nyNTh2spDDopKMUkT/TvXslB9nlhQ++btvxcnNlWIBuwSUj+UddAkFJldoPQFR7rrR3QbN2RHI6eqEPGoQwiolJCkhQzd7erfrgp74w602wjk4kHBnjU2t+5hmDeSix694xiJniSbwGaup7YzRxEosxuFo0vW+qIp+BX5AOcvV/ZK2jDiQfUjy8P7mmWZr4IP+JoolEa9LWaF9ejbHiYtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZrtBWzw3cC0Q/E2EdQLqYcCt/kbyTNStxCP5zLj2to=;
 b=lWeYuLycjiW6JCZkjvgnbhtYmHWMUEd80gTriut/3HRrRcMoU3OsJ/3YuE3DENsLkHohEuC214T09JFjh0mnOO31y9ZgrNpRw5pBG0YD0oen+7+EYr5MjRB2kEk48UoZfIHBF/TAS1BRSi8tLq68bEweQ69289rDYY1jE3x1/gQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4493.namprd12.prod.outlook.com (2603:10b6:806:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 16:17:54 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 16:17:54 +0000
Subject: Re: [PATCH v7 13/16] drm/scheduler: Fix hang when sched_entity
 released
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-14-andrey.grodzovsky@amd.com>
 <9e1270bf-ab62-5d76-b1de-e6cd49dc4841@amd.com>
 <f0c5dea7-af35-9ea5-028e-6286e57a469a@amd.com>
 <34d4e4a8-c577-dfe6-3190-28a5c63a2d23@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <da1f9706-d918-cff8-2807-25da0c01fcde@amd.com>
Date: Tue, 18 May 2021 12:17:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <34d4e4a8-c577-dfe6-3190-28a5c63a2d23@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:19e2:b915:59c1:4860]
X-ClientProxiedBy: YT1PR01CA0107.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::16) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:19e2:b915:59c1:4860]
 (2607:fea8:3edf:49b0:19e2:b915:59c1:4860) by
 YT1PR01CA0107.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Tue, 18 May 2021 16:17:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a0613f1-6129-4011-2620-08d91a187dc6
X-MS-TrafficTypeDiagnostic: SA0PR12MB4493:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4493C3BDABF806CBC57A9727EA2C9@SA0PR12MB4493.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GpVLGVYqcmjNcMoG89A+C2RbkkFk4DAW5D8ZFgWPGfvGgcMj7YLDnfzTSj9gfVIrKH89GvrXdSoZz6yiNYf4FNwZ4qQyiVwrX2pyIgZ+hYqnB98HQM+5mpw5yHPaTNrPtpxM2cOIfAfU0dI4gFdq67BsAvC/40KveiI24pn+pdl1AZraCoqu587MbFv7t9M1H7GVcH1e9kn/KmY2Jt7YMy3gyaHFoVmh9y7YKWH40KXO2XNbB31nwuheuYSY2nvAsB1HjR0ykesmgjCL2jIN2lJYs/TWjdMcZOzF4Ek9lHkPQ+Oh4GE0LXYWlJZrPoicQRU0b24sLN18ZtR+0I/xuA2odpvI4ht4wt/cjRk4jCmcj52SctudRqCSpn2MmEpgdIsCBrOHJfoz5IvAsSXFoJVP18jQZG6hR5yitasBDnwp8TsooEQQPPwKRItJ1LAGwZJ7+UNhjL/DK+r8gFB9AUR8a1zdITO8RRyoQI+WmsIEBRrTdH+mzKCiR275h0dg5XRnRCGWc4N4NFk9emFfYDtSDmcWLOODqtoOSpJVptN6IMUy8T+tYrAEoTV9Y8djSJaJNqHyV6p3CeCyxKlbnuPcR7zmABmD0nXoDYsRxh1tSeXH9jwveQdkhJf4xJYbrFp8J2H7tZXSEg8qxqyyfk3Q7ieiYtdKWBH+IOlq6wzBB1cjvEWf4pYUqUyx9mb3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(6486002)(53546011)(52116002)(2616005)(498600001)(66946007)(66476007)(8676002)(66556008)(31686004)(31696002)(6636002)(16526019)(83380400001)(86362001)(8936002)(44832011)(38100700002)(186003)(36756003)(2906002)(4326008)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UzI4NWNTMmhSL0dzVjlsRHZ2RnVyMzRSMUV1Wm81Z0luZm9hTlVadElFWHdm?=
 =?utf-8?B?ZmVvUnZNUFordm1EQlZ4MzQ3c294T2ErYUdSQTRiWXVqcms2Yi91cWlWN09Y?=
 =?utf-8?B?cjJSNEV6d2lnR2g2aG81RWR5SDJaTlRlQnFhdlA3MFBOcmpNZjVnQ1crdmZv?=
 =?utf-8?B?YXc0NkVmMmEyc2dmSWZ6YlZkK0F6SEF0aDBkS3FwcnM4UVhKRkk0cVpmbE9p?=
 =?utf-8?B?SDFMZkFBRXZqZ0cvS2hOR1R1ZlROS24zY0k2MDJRSGNGSTFxdUJneVdNeUtS?=
 =?utf-8?B?WjJPN3MrenBJRURkM3l3Q3libkx1c1Z4M2huSStwbmswZElQYmJMMkhuSnMy?=
 =?utf-8?B?dktGMGlBWFNrN3dnZU1IQzZFcm5uVitVRGJTM3FtSzdabkhvdTB0WXAraWFX?=
 =?utf-8?B?bC80Z2d6WlorZXFpcUNsOERaV0cxWEVoRnhOdE9uMjB1ZTh6YWdwVmVUaHpm?=
 =?utf-8?B?bXkrUDNodmluZmNWKy85Uy9MbFhpRVdwYkRHSC9WaEV5cEowaE1mN3BtQlR0?=
 =?utf-8?B?SnhNbENkU0Y1aGJTTlBCM3pjSTJBcmI5TmZiS0o5NGorbUJQYW90RkczaW5V?=
 =?utf-8?B?RkR1UHJCbHRVWWpGQ3ltei9QRi9TNllxU2dxVnI0NHpISy9pL050cldaOGVz?=
 =?utf-8?B?SUgydEtsNldqSGVOVW1DcTROb1I4MG9yUTd1Um40bmh6L3pyY2NGNmRQMXBY?=
 =?utf-8?B?cmhuZFdHSWlyWUl4R2V0K2dnbmpxdE5GMVVoaVp2UjdMdHdxSnNocEhxY1d1?=
 =?utf-8?B?TkN3Ky9uTzdGQ09GYWdvaE92L3E4c0Z5TzlaUE9oU0dmNUJGNW16NHFSZ3Vk?=
 =?utf-8?B?bXkvcHVwNnhxc3ZxZS80VS9ZeXdKdUF5cUhDWnp3N082YlBORnc3RFZaWjVQ?=
 =?utf-8?B?RXN5RmFaRnprNGV4c2pTWUp1UkJCNGxUaVVxa1I2UnRTdXoxS0k1R25WYWsw?=
 =?utf-8?B?YjNGWUZzcTVKN1p1YmZNb2VOTDNqd0IyZDFHZWlRWkNoeENKUUtuT2hGZUow?=
 =?utf-8?B?REp4T3dMSUNGeE9SRGlyME1HTTc1WUczV0lVVmxLQzJJLzYxRmFOdjdyMGRW?=
 =?utf-8?B?SlFVQ3FMem5XbkFuaUIzdFZUamVzdWY5ejAvSTJMNGxISjN5eTdOYm5oYlpz?=
 =?utf-8?B?RjV1eGtkZnNNVXBLV3JpVStVS1Q0Vm1PdElhL0hmaUxsVCs4M2kxaU9VNFlu?=
 =?utf-8?B?YTV3Mm9sUFNsYVVWL3V2RFBZaTRUOTZNQ1JRWVRJcXdHM05vRURnZ1RrNk1a?=
 =?utf-8?B?VzV4UGJYNktRM0F4KzFIVzAyb3pYYjZNMnFxWHdhQVVaaUdhajN3Q1FzZXh3?=
 =?utf-8?B?Wmt2VlRXVlg2c2ZvOGJoeDdTQ2lHTnZkQk84Y3hoSGJ3bVcrY0YzamxhYVVV?=
 =?utf-8?B?ZmdXb2Z3czM5amtGZU9WcERrQ2lXeW5lZlFOSUNJU3FKWnhTak5JU0ZzczZu?=
 =?utf-8?B?c21wS1VYSkdvQndFa3Y0ejdtQ1lwYkNTRHE4ek5VdXlvQnFWb3Z3d3oyeExl?=
 =?utf-8?B?M0RlRVBVdUFuK2htVStUM3Y2bWlkUHZKbXZ6NC90NUg3S05aOWFWY1AzWE1l?=
 =?utf-8?B?ZlYvWmlITm9zVEowMVJoN0N3bjliVFZNZVhEMktoSTI0b2RVUkdlT2NjdVRE?=
 =?utf-8?B?NktWRVdLdWk1bEI5RngzL0RHbDRiY3YrUmFDRyt5YytDNWxCckVzbjFLd3hL?=
 =?utf-8?B?a0cwVkRNY09ZcnFkc00wK1hTOFFiYjNLRjFJTXBWUHJuMWwzZWNCWU1palYz?=
 =?utf-8?B?RUlkV1NqbDhsbU5yUDE0cnl2bnVGMVZRRklTQXpnd1hFbk1YTUNPU1ZXSUJv?=
 =?utf-8?B?cUpFZEhPLzNSM1E2MEh3UHhqVWZCMHIxUEo4SkUvZVNMR0U2U3pvQWxZMFJi?=
 =?utf-8?B?S2pPbXZreFhKOWhRcFZzR0h1NnpodlhTT0NxOHJrcG5aQkE9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0613f1-6129-4011-2620-08d91a187dc6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 16:17:54.4139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bjlEye6PTX0m2PRTLM0psnQwzGkxTdvYBAvYig9sWXG//SEb2BSA4xwoSxTszgOuVsdGdDarooqTpQC6D5lLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4493
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



On 2021-05-18 11:15 a.m., Christian König wrote:
> Am 18.05.21 um 17:03 schrieb Andrey Grodzovsky:
>>
>> On 2021-05-18 10:07 a.m., Christian König wrote:
>>> In a separate discussion with Daniel we once more iterated over the 
>>> dma_resv requirements and I came to the conclusion that this approach 
>>> here won't work reliable.
>>>
>>> The problem is as following:
>>> 1. device A schedules some rendering with into a buffer and exports 
>>> it as DMA-buf.
>>> 2. device B imports the DMA-buf and wants to consume the rendering, 
>>> for the the fence of device A is replaced with a new operation.
>>> 3. device B is hot plugged and the new operation canceled/newer 
>>> scheduled.
>>>
>>> The problem is now that we can't do this since the operation of 
>>> device A is still running and by signaling our fences we run into the 
>>> problem of potential memory corruption.

By signaling s_fence->finished of the canceled operation from the
removed device B we in fact cause memory corruption for the uncompleted
job still running on device A ? Because there is someone waiting to
read write from the imported buffer on device B and he only waits for
the s_fence->finished of device B we signaled
in drm_sched_entity_kill_jobs ?

Andrey

>>
>>
>> I am not sure this problem you describe above is related to this patch.
> 
> Well it is kind of related.
> 
>> Here we purely expand the criteria for when sched_entity is
>> considered idle in order to prevent a hang on device remove.
> 
> And exactly that is problematic. See the jobs on the entity need to 
> cleanly wait for their dependencies before they can be completed.
> 
> drm_sched_entity_kill_jobs() is also not handling that correctly at the 
> moment, we only wait for the last scheduled fence but not for the 
> dependencies of the job.
> 
>> Were you addressing the patch from yesterday in which you commented
>> that you found a problem with how we finish fences ? It was
>> '[PATCH v7 12/16] drm/amdgpu: Fix hang on device removal.'
>>
>> Also, in the patch series as it is now we only signal HW fences for the
>> extracted device B, we are not touching any other fences. In fact as you
>> may remember, I dropped all new logic to forcing fence completion in
>> this patch series and only call amdgpu_fence_driver_force_completion
>> for the HW fences of the extracted device as it's done today anyway.
> 
> Signaling hardware fences is unproblematic since they are emitted when 
> the software scheduling is already completed.
> 
> Christian.
> 
>>
>> Andrey
>>
>>>
>>> Not sure how to handle that case. One possibility would be to wait 
>>> for all dependencies of unscheduled jobs before signaling their 
>>> fences as canceled.
>>>
>>> Christian.
>>>
>>> Am 12.05.21 um 16:26 schrieb Andrey Grodzovsky:
>>>> Problem: If scheduler is already stopped by the time sched_entity
>>>> is released and entity's job_queue not empty I encountred
>>>> a hang in drm_sched_entity_flush. This is because 
>>>> drm_sched_entity_is_idle
>>>> never becomes false.
>>>>
>>>> Fix: In drm_sched_fini detach all sched_entities from the
>>>> scheduler's run queues. This will satisfy drm_sched_entity_is_idle.
>>>> Also wakeup all those processes stuck in sched_entity flushing
>>>> as the scheduler main thread which wakes them up is stopped by now.
>>>>
>>>> v2:
>>>> Reverse order of drm_sched_rq_remove_entity and marking
>>>> s_entity as stopped to prevent reinserion back to rq due
>>>> to race.
>>>>
>>>> v3:
>>>> Drop drm_sched_rq_remove_entity, only modify entity->stopped
>>>> and check for it in drm_sched_entity_is_idle
>>>>
>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/scheduler/sched_entity.c |  3 ++-
>>>>   drivers/gpu/drm/scheduler/sched_main.c   | 24 
>>>> ++++++++++++++++++++++++
>>>>   2 files changed, 26 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index 0249c7450188..2e93e881b65f 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -116,7 +116,8 @@ static bool drm_sched_entity_is_idle(struct 
>>>> drm_sched_entity *entity)
>>>>       rmb(); /* for list_empty to work without lock */
>>>>       if (list_empty(&entity->list) ||
>>>> -        spsc_queue_count(&entity->job_queue) == 0)
>>>> +        spsc_queue_count(&entity->job_queue) == 0 ||
>>>> +        entity->stopped)
>>>>           return true;
>>>>       return false;
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 8d1211e87101..a2a953693b45 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -898,9 +898,33 @@ EXPORT_SYMBOL(drm_sched_init);
>>>>    */
>>>>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>>   {
>>>> +    struct drm_sched_entity *s_entity;
>>>> +    int i;
>>>> +
>>>>       if (sched->thread)
>>>>           kthread_stop(sched->thread);
>>>> +    for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= 
>>>> DRM_SCHED_PRIORITY_MIN; i--) {
>>>> +        struct drm_sched_rq *rq = &sched->sched_rq[i];
>>>> +
>>>> +        if (!rq)
>>>> +            continue;
>>>> +
>>>> +        spin_lock(&rq->lock);
>>>> +        list_for_each_entry(s_entity, &rq->entities, list)
>>>> +            /*
>>>> +             * Prevents reinsertion and marks job_queue as idle,
>>>> +             * it will removed from rq in drm_sched_entity_fini
>>>> +             * eventually
>>>> +             */
>>>> +            s_entity->stopped = true;
>>>> +        spin_unlock(&rq->lock);
>>>> +
>>>> +    }
>>>> +
>>>> +    /* Wakeup everyone stuck in drm_sched_entity_flush for this 
>>>> scheduler */
>>>> +    wake_up_all(&sched->job_scheduled);
>>>> +
>>>>       /* Confirm no work left behind accessing device structures */
>>>>       cancel_delayed_work_sync(&sched->work_tdr);
>>>
> 
