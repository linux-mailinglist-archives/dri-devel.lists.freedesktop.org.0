Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A10B75F0CB0
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 15:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BD610ECFE;
	Fri, 30 Sep 2022 13:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2EC10ECFE
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 13:46:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FfgbYB76Cj21sGprruLaMOK66xuOMbGGaAFIZf9PkJBFzlaUX8QV7YHHDjZvtkzIfAu9OPuNRxj3oMS92qjVysxjrxsoHhTlyCK+/nmZA7w6JEaKe5PqEjYFiBp8d8t40MIU7myGHHolmBge/nkGXaF+Hg1a/gYwysOnkpLyOUUV6Ei/iofZ0uydSv8WkdbWej+IENan48+nO0zcDmlAfi96OoZ/XafcP2yfoc2Jkd0yjIp0BtowuyY+J5RfjypNlswSk6ZY0A3ce42noKn0iB8eI87bYNl8jKyEG+Hv7BMKCbehYDb4+PqS0UtmlXXt7BV35rXaQ2wh6ndGvz18hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBF7h3IqG94AXDgHs325nrp9oGWPUabLq2NoAvl2u7U=;
 b=SBnxArWwWrbR8PvRRTXucFsdIVsY35YVPNtsOLpw/ZgXRtcWnRFJm1f5DUoIH4kLEZKoeHSSLzSSrFgsKnCEDS/8rxygOUUgfoXfMunWrSXpl68QPVv8bUKCM6I6XatWuj/3ONirhKkq3S1SrSHuqkpDlZv5RPETpDPpAR+6PRVbXI6KEl5IJSOS3GX1uZHfh/LnT1iabscBnCPztravc64zoAlq5ZNZcukCy3YyCeY3Y6E4Hbks6rQnzQNYCZ3PtWQ7LmBxkhB+nbZfZ6Bi03jvm1NxnuzHPnx+Z35dGtyRTmBrCfbP8l+brDk6u1yEo4fdyemlI5anx8yVe4yoeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBF7h3IqG94AXDgHs325nrp9oGWPUabLq2NoAvl2u7U=;
 b=gcVKqtYLGSGGb82jn4bFK23lGbWkN92Oh6dPiGYo3gw2xghM4iPBPDha9DfcZHfPDz/xQtWZr/1tbCz7vE+rvdl0seHMF0vU9JgPqpM7bvVw/4LHq38dzkKxZeMUdL5H2fi/UFenPOwAJo55EKY0npMT5jFB6JZe/aLxX9IBBdE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM4PR12MB7573.namprd12.prod.outlook.com (2603:10b6:8:10f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Fri, 30 Sep
 2022 13:46:04 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5c7:e934:c098:f2ac]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5c7:e934:c098:f2ac%8]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 13:46:04 +0000
Message-ID: <a18b8c77-008c-2846-1819-4148aa192ec0@amd.com>
Date: Fri, 30 Sep 2022 09:46:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 12/13] drm/scheduler: rework entity flush, kill and fini
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20220929132136.1715-1-christian.koenig@amd.com>
 <20220929132136.1715-12-christian.koenig@amd.com>
 <85442771-b3f0-3079-4356-f92d91dfb4df@amd.com>
 <446168fa-5bbd-160d-3ffb-ad6593637d39@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <446168fa-5bbd-160d-3ffb-ad6593637d39@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0079.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::13) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1947:EE_|DM4PR12MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: bfdf356d-d801-49e5-7b2c-08daa2ea1e9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nwNQIaj0X7EF8pIU6XXfjTXVMtZnsiyyu3n3yxiowNrmVVhCCuCwsuKf0sOpHkJSRCPrQEXlyAEi/a9bbTOVHUSfg+jiFqLAXc4CxqvAgnr2Kjxveexx1OA12j1mqhqTuccdHSCs0vycht+ucrRdlFiVByC11R8nA29jaWthnVF3Ylb4wM8CLVIe/6wOtgomGf9qJDgNh/qEKkHIA+RlRLhxQ7lmmHc3Wh8UCDDasT5OnFejOIbq2ZfebE60h26I4xX05jI3prd2O6g58vZOTJ7P1PB1DePbNZXZc3Ivxva5lkO5Dyh9szW2pHISaAXF+glYcJ7r2gSs2k4N36LG3yWR41QBMu3DhauS7Dq2922mMZzghL5fQ8G52AXgbCstXOQmZX6moNtWGqE5cY8053P3AitxdiyAg5yVHYQ6plzjPHEbHDcgSMw611l0XWKFlAHLgpZc7//OSLIJ3d086sJbL8Lhoxd9TWiA62HhW3wBJM4AzrqlPg8vIr/pZK7b3V4aJk1vCyPqe5oht3TjO3bBlrkog13GJ99uxjgDT5Bu1BSOH237syDwB7/dr9a+bgIwkPNLERWbMbBYAHTQ/v1ueZo9Jcj3++IejRwpVH9rD8xB/tIrwRgnvNGsXmqKMA7bQbuh0o8qrwoeJ7XXQZlN1qYQtppv5CSbWOryzngE6upgFCbACkOBfNp1Wuy6XrVMBG784dUf6buORAPx8HSt03daRDNFR4KafivRrVDGL+LT5jzWxs5bsEfACe/zzQ4cQT7RFVD3IfWj0/Cirx1OiinERaZMrEuIHlppc7Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(451199015)(41300700001)(86362001)(31696002)(6512007)(110136005)(6486002)(478600001)(66476007)(38100700002)(66946007)(316002)(66574015)(4326008)(36756003)(8936002)(44832011)(83380400001)(53546011)(6506007)(66556008)(2906002)(186003)(2616005)(31686004)(8676002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjhSSFNzUzJVV2VzbDlSWEtlM092bUd4bDNGZlM2bC9OZ0pmR0RUTGxLUmNu?=
 =?utf-8?B?WTlVRTk4M3hPL0hQQ28xaUgweTRxU1RNclozWGkzbWNtQTVMSXRWNVg2YmE1?=
 =?utf-8?B?K29zVngrN3BiNGRsT29pNklWQWhkbHhPczZLa1VrVnpCNnFKWEdCNTVTb2Ez?=
 =?utf-8?B?VGlZcFBwR3VNR3JaWlFFQVpnUHFOZytrUEp0N0NSaWRtK2IzQlNSY2YxRWxM?=
 =?utf-8?B?dndzS3VMN3VZZ29INzB3N2FpLzBDb0VzLzRaanZVL1o5YXRIa2t5NEF1LzRi?=
 =?utf-8?B?SWtnTzdpRzNIeGwvWU9SSGdMUmZrWlZvS3BvYlpWeWFzaExjdGVscW1mc0Rh?=
 =?utf-8?B?K2lFeTkrcUM5aWNqRWREeERvMzZ6WFlaaWtRblVldVdsRlNLNWtuNWhGeU1w?=
 =?utf-8?B?TnZoQ3lsNys1MWVBOUdEVExTN2hpMENPdVZYRTlWbGlZSUw1dTZnMk5jTHIx?=
 =?utf-8?B?cThYSGoxR3Q5THVSVlpYNU1iVFloN09UVkFkajBML0QwNEZjWjBaWkRES05z?=
 =?utf-8?B?Zm9aVWNlUWRocjByL2ZKUVdVbVE3L1pvOExaOEdMd0F2aitibnNWOVdGYmFq?=
 =?utf-8?B?QThYRVV6Vml3VS9tSGRJQ05HR1ZDajUwNG51MmNOY0t2RVNBdmh1WWF3bkZn?=
 =?utf-8?B?NlJRM3lTczdkQW8rbkNLSzBXSWdZWVVWL2VkbWFZdWNtYTF3YmN2WGxDd2FU?=
 =?utf-8?B?dW5mS09TcitwN1pBUmhBSDhBTTE4Y0E5QTQwU3RqYXFacnZBWGYwcFpNRFEw?=
 =?utf-8?B?eHI5NzJyOFN6VlFvSFUzZ0xvRmozVzN6R1YxTFJ6UGZwd2NkNHJaMkkwTWFD?=
 =?utf-8?B?WUJNaXJsUy9mb0h6U01rNFByd00zT1V4SVNLZUx3Zlo3MmNoeHEyWlI5Uzg4?=
 =?utf-8?B?S1pudVR2ZWpTK1VUcFV3cDkzUFl5WnFGeFVZUzhTc1diMFRwMS9KUDdJVWRo?=
 =?utf-8?B?N0xhSmN4SFlOS3JjMzZWdG9oeDBqclBMckd3SXBXRzdKMVFPTE9WdGhiVy9Y?=
 =?utf-8?B?VGVLbENDUXNkTzg1bFpuTGoxSEJlZGIvWU9sNzN1T0hjS3grckJVSnExZGd4?=
 =?utf-8?B?VWNId0l3STlyVG5iNjlIU3JGQ0UzQ1M5TWxVOHFLWkduRktHR1lZS0ZzaFhz?=
 =?utf-8?B?TXFuUWQ0eWdpYVp0TjRlRnpJbjBCUHVaejhqQWJKZjhJVkw4V0MzQVVBQTRJ?=
 =?utf-8?B?WkQvSXBRaDk1bXBMQUNJT2ZnYU00d1ZqbGtpNndocitoNk1oU0F6VEN3THBx?=
 =?utf-8?B?V1BTbElOaUhJYjFQSFJ3clNTVkRTSVd4RXZmQjRLOFdlM2hiSit4OGhxaHVE?=
 =?utf-8?B?d283TjFzRC9wWndQU2pwR29WL2tvMFF6eGsvUEw5SEtQU3Awcmcycmx1MXVJ?=
 =?utf-8?B?VmNPQUU5YWdQbzNMb2YwRzEwekVUM0h0aW1oekc0UFdRWHhEVUI4ZURqRU1z?=
 =?utf-8?B?UVc5ZGxOcW9tWXJhT2RDakJDcDRjN0NaNGluN3Fjc2UxK2k1aEI1Q0owVFJH?=
 =?utf-8?B?ais5eUFOMS9tenhXYnRLdUVLVTVJNnlQbEg5RDdnN2doSDBSZHhGTGxidG9l?=
 =?utf-8?B?Qkc1Y3FlMFF4OTJydXpDYXpacHhRNHNtczRadFJidFhCMUhVS3RkY0FjWFBo?=
 =?utf-8?B?NVQyQnlOeDNqMkUydk5OQWZVWDA1VDF1MUdqc0cwbjRnU0RtdHl1MXdRMy92?=
 =?utf-8?B?R0dpQ0tRV3pRcTd2VFJSWU9mbWtudGxPS1Z1cVlDdHVnS1dRbS9lSFV5Szha?=
 =?utf-8?B?ODMveGx3ZVBpNTExRzdmUzdFcW4vZ2FGTis4VjRHYnE3dXJOY1BVUmhRYXdr?=
 =?utf-8?B?Q1ZFNTNKV3VPYmQvbmVaOFNqSGRwZXE3WmtTM2dCK3NHaHJFdzlTWkxpVUVH?=
 =?utf-8?B?Q3dRTEF4d0RWV0k2dC8yTjF6NmRsTWtTcXJnaE5FakdNOW8rUzI0dThGQThp?=
 =?utf-8?B?UFF3Vm51VVFEcTFTa3RDSlA3MVZiM09FVTVBeERrdHdnOEVNNU5xZm9tNzcz?=
 =?utf-8?B?VWtCc2xCbFNFOGdyWVBtZXJhbFZuRGtPUmE2ejQ5a05xbzBMbFBGK1YvMUlr?=
 =?utf-8?B?TURaZS9Jc2VDT0JVL3QrNlZnckFCbEZoN3orMHZjSzlrSlZrQ1hRNEkxOHFh?=
 =?utf-8?B?VWxUL2Y1OU9hcnFJUm1jMU1sck9lRGZROVBLbkZIT2pmbnNNQW00cGFtbzhj?=
 =?utf-8?Q?0FWuB8g73U7G/5OG+xN4bqNZHcrTm0m0XuymcOJ6o4CE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfdf356d-d801-49e5-7b2c-08daa2ea1e9a
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 13:46:04.7083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SA/MaJ6Oc2I+SjTChYiaoE77pJNXGVmA6kLcf25w4QkOyaPI4VIsj44zfestINT/cdR/nWV2Qrhu1SJntaX3PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7573
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
Cc: luben.tuikov@amd.com, shansheng.wang@amd.com, WenChieh.Chien@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-09-30 07:51, Christian König wrote:
> Am 29.09.22 um 21:20 schrieb Andrey Grodzovsky:
>>
>> On 2022-09-29 09:21, Christian König wrote:
>>> This was buggy because when we had to wait for entities which were
>>> killed as well we would just deadlock.
>>>
>>> Instead move all the dependency handling into the callbacks so that
>>> will all happen asynchronously.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_entity.c | 197 
>>> +++++++++++------------
>>>   1 file changed, 92 insertions(+), 105 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index 1bb1437a8fed..1d448e376811 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -139,6 +139,74 @@ bool drm_sched_entity_is_ready(struct 
>>> drm_sched_entity *entity)
>>>       return true;
>>>   }
>>>   +static void drm_sched_entity_kill_jobs_irq_work(struct irq_work 
>>> *wrk)
>>> +{
>>> +    struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
>>> +
>>> +    drm_sched_fence_scheduled(job->s_fence);
>>> +    drm_sched_fence_finished(job->s_fence);
>>> +    WARN_ON(job->s_fence->parent);
>>> +    job->sched->ops->free_job(job);
>>> +}
>>> +
>>> +/* Signal the scheduler finished fence when the entity in question 
>>> is killed. */
>>> +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>>> +                      struct dma_fence_cb *cb)
>>> +{
>>> +    struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
>>> +                         finish_cb);
>>> +    int r;
>>> +
>>> +    dma_fence_put(f);
>>> +
>>> +    /* Wait for all dependencies to avoid data corruptions */
>>> +    while (!xa_empty(&job->dependencies)) {
>>> +        f = xa_erase(&job->dependencies, job->last_dependency++);
>>> +        r = dma_fence_add_callback(f, &job->finish_cb,
>>> +                       drm_sched_entity_kill_jobs_cb);
>>> +        if (!r)
>>> +            return;
>>> +
>>> +        dma_fence_put(f);
>>> +    }
>>> +
>>> +    init_irq_work(&job->work, drm_sched_entity_kill_jobs_irq_work);
>>> +    irq_work_queue(&job->work);
>>> +}
>>> +
>>> +/* Remove the entity from the scheduler and kill all pending jobs */
>>> +static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>>> +{
>>> +    struct drm_sched_job *job;
>>> +    struct dma_fence *prev;
>>> +
>>> +    if (!entity->rq)
>>> +        return;
>>> +
>>> +    spin_lock(&entity->rq_lock);
>>> +    entity->stopped = true;
>>> +    drm_sched_rq_remove_entity(entity->rq, entity);
>>> +    spin_unlock(&entity->rq_lock);
>>> +
>>> +    /* Make sure this entity is not used by the scheduler at the 
>>> moment */
>>> +    wait_for_completion(&entity->entity_idle);
>>
>>
>> Does it really stop processing in case more jobs are pending in 
>> entity queue already ?
>> It probably makes sense to integrate drm_sched_entity_is_idle into 
>> drm_sched_entity_is_ready
>> to prevent rq selecting this  entity  in such case
>
> We make sure that the entity is not used for scheduling any more by 
> calling drm_sched_rq_remove_entity() right above this check here.
>
> The wait is only to prevent us from racing with the scheduler thread 
> submitting one more job from the entity.


Ok, missed the entity remove in the code


>
>>
>>> +
>>> +    prev = dma_fence_get(entity->last_scheduled);
>>> +    while ((job = 
>>> to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
>>> +        struct drm_sched_fence *s_fence = job->s_fence;
>>> +
>>> +        dma_fence_set_error(&s_fence->finished, -ESRCH);
>>> +
>>> +        dma_fence_get(&s_fence->finished);
>>> +        if (!prev || dma_fence_add_callback(prev, &job->finish_cb,
>>> +                       drm_sched_entity_kill_jobs_cb))
>>> +            drm_sched_entity_kill_jobs_cb(NULL, &job->finish_cb);
>>> +
>>> +        prev = &s_fence->finished;
>>> +    }
>>> +    dma_fence_put(prev);
>>> +}
>>> +
>>>   /**
>>>    * drm_sched_entity_flush - Flush a context entity
>>>    *
>>> @@ -179,91 +247,13 @@ long drm_sched_entity_flush(struct 
>>> drm_sched_entity *entity, long timeout)
>>>       /* For killed process disable any more IBs enqueue right now */
>>>       last_user = cmpxchg(&entity->last_user, current->group_leader, 
>>> NULL);
>>>       if ((!last_user || last_user == current->group_leader) &&
>>> -        (current->flags & PF_EXITING) && (current->exit_code == 
>>> SIGKILL)) {
>>> -        spin_lock(&entity->rq_lock);
>>> -        entity->stopped = true;
>>> -        drm_sched_rq_remove_entity(entity->rq, entity);
>>> -        spin_unlock(&entity->rq_lock);
>>> -    }
>>> +        (current->flags & PF_EXITING) && (current->exit_code == 
>>> SIGKILL))
>>> +        drm_sched_entity_kill(entity);
>>
>>
>> This reverts 'drm/scheduler: only kill entity if last user is killed 
>> v2' and so might break this use case - when entity
>> gets through FD into child process. Why this needs to be removed ?
>
> This patch isn't reverted. I keep the "last_user == 
> current->group_leader" check in the line above.
>
> Christian.


OK, second time i didn't look carefully... My bad

Another question - you call drm_sched_entity_kill now both in 
drm_sched_entity_flush and in drm_sched_entity_kill_jobs - so
for drm_sched_entity_destroy it will be called twice, no ? because it 
will be called from drm_sched_entity_flush and from
drm_sched_entity_fini. Why we need to call drm_sched_entity_kill from 
flush ? With your new async scheme of jobs killing
we can even leave the flush code unchanged and just call 
drm_sched_entity_kill from drm_sched_entity_fini  and no deadlock
will happen, what I am missing here ?

Andrey


>
>>
>> Andrey
>>
>>
>>>         return ret;
>>>   }
>>>   EXPORT_SYMBOL(drm_sched_entity_flush);
>>>   -static void drm_sched_entity_kill_jobs_irq_work(struct irq_work 
>>> *wrk)
>>> -{
>>> -    struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
>>> -
>>> -    drm_sched_fence_finished(job->s_fence);
>>> -    WARN_ON(job->s_fence->parent);
>>> -    job->sched->ops->free_job(job);
>>> -}
>>> -
>>> -
>>> -/* Signal the scheduler finished fence when the entity in question 
>>> is killed. */
>>> -static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>>> -                      struct dma_fence_cb *cb)
>>> -{
>>> -    struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
>>> -                         finish_cb);
>>> -
>>> -    dma_fence_put(f);
>>> -    init_irq_work(&job->work, drm_sched_entity_kill_jobs_irq_work);
>>> -    irq_work_queue(&job->work);
>>> -}
>>> -
>>> -static struct dma_fence *
>>> -drm_sched_job_dependency(struct drm_sched_job *job,
>>> -             struct drm_sched_entity *entity)
>>> -{
>>> -    if (!xa_empty(&job->dependencies))
>>> -        return xa_erase(&job->dependencies, job->last_dependency++);
>>> -
>>> -    if (job->sched->ops->dependency)
>>> -        return job->sched->ops->dependency(job, entity);
>>> -
>>> -    return NULL;
>>> -}
>>> -
>>> -static void drm_sched_entity_kill_jobs(struct drm_sched_entity 
>>> *entity)
>>> -{
>>> -    struct drm_sched_job *job;
>>> -    struct dma_fence *f;
>>> -    int r;
>>> -
>>> -    while ((job = 
>>> to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
>>> -        struct drm_sched_fence *s_fence = job->s_fence;
>>> -
>>> -        /* Wait for all dependencies to avoid data corruptions */
>>> -        while ((f = drm_sched_job_dependency(job, entity))) {
>>> -            dma_fence_wait(f, false);
>>> -            dma_fence_put(f);
>>> -        }
>>> -
>>> -        drm_sched_fence_scheduled(s_fence);
>>> -        dma_fence_set_error(&s_fence->finished, -ESRCH);
>>> -
>>> -        /*
>>> -         * When pipe is hanged by older entity, new entity might
>>> -         * not even have chance to submit it's first job to HW
>>> -         * and so entity->last_scheduled will remain NULL
>>> -         */
>>> -        if (!entity->last_scheduled) {
>>> -            drm_sched_entity_kill_jobs_cb(NULL, &job->finish_cb);
>>> -            continue;
>>> -        }
>>> -
>>> -        dma_fence_get(entity->last_scheduled);
>>> -        r = dma_fence_add_callback(entity->last_scheduled,
>>> -                       &job->finish_cb,
>>> -                       drm_sched_entity_kill_jobs_cb);
>>> -        if (r == -ENOENT)
>>> -            drm_sched_entity_kill_jobs_cb(NULL, &job->finish_cb);
>>> -        else if (r)
>>> -            DRM_ERROR("fence add callback failed (%d)\n", r);
>>> -    }
>>> -}
>>> -
>>>   /**
>>>    * drm_sched_entity_fini - Destroy a context entity
>>>    *
>>> @@ -277,33 +267,17 @@ static void drm_sched_entity_kill_jobs(struct 
>>> drm_sched_entity *entity)
>>>    */
>>>   void drm_sched_entity_fini(struct drm_sched_entity *entity)
>>>   {
>>> -    struct drm_gpu_scheduler *sched = NULL;
>>> -
>>> -    if (entity->rq) {
>>> -        sched = entity->rq->sched;
>>> -        drm_sched_rq_remove_entity(entity->rq, entity);
>>> -    }
>>> -
>>> -    /* Consumption of existing IBs wasn't completed. Forcefully
>>> -     * remove them here.
>>> +    /*
>>> +     * If consumption of existing IBs wasn't completed. Forcefully 
>>> remove
>>> +     * them here. Also makes sure that the scheduler won't touch 
>>> this entity
>>> +     * any more.
>>>        */
>>> -    if (spsc_queue_count(&entity->job_queue)) {
>>> -        if (sched) {
>>> -            /*
>>> -             * Wait for thread to idle to make sure it isn't 
>>> processing
>>> -             * this entity.
>>> -             */
>>> -            wait_for_completion(&entity->entity_idle);
>>> -
>>> -        }
>>> -        if (entity->dependency) {
>>> -            dma_fence_remove_callback(entity->dependency,
>>> -                          &entity->cb);
>>> -            dma_fence_put(entity->dependency);
>>> -            entity->dependency = NULL;
>>> -        }
>>> +    drm_sched_entity_kill(entity);
>>>   -        drm_sched_entity_kill_jobs(entity);
>>> +    if (entity->dependency) {
>>> +        dma_fence_remove_callback(entity->dependency, &entity->cb);
>>> +        dma_fence_put(entity->dependency);
>>> +        entity->dependency = NULL;
>>>       }
>>>         dma_fence_put(entity->last_scheduled);
>>> @@ -415,6 +389,19 @@ static bool 
>>> drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>>       return false;
>>>   }
>>>   +static struct dma_fence *
>>> +drm_sched_job_dependency(struct drm_sched_job *job,
>>> +             struct drm_sched_entity *entity)
>>> +{
>>> +    if (!xa_empty(&job->dependencies))
>>> +        return xa_erase(&job->dependencies, job->last_dependency++);
>>> +
>>> +    if (job->sched->ops->dependency)
>>> +        return job->sched->ops->dependency(job, entity);
>>> +
>>> +    return NULL;
>>> +}
>>> +
>>>   struct drm_sched_job *drm_sched_entity_pop_job(struct 
>>> drm_sched_entity *entity)
>>>   {
>>>       struct drm_sched_job *sched_job;
>
