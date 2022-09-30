Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F63B5F0B05
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 13:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7B110EC9A;
	Fri, 30 Sep 2022 11:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3130810EC9A
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 11:51:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIO+FXImdvENFtxdc6zYce11fqZQQInAro+Q4Lb6vce8tyFr1BQhUrH39DriRu0aPHlPLsyf1y6VsmM6kFLiATGa/Tsk4FPj9+dXau90p33f1EnhEUZ9qSwIJ4vrcy7PzcENkoQpdn5jX+rkwUZeBAxIBEpzPWfdhh9cDQXXSM1iQ6ji1p9URYVoQOUDQOh6L9KESapoxJpRNF7EudBtnXnmiyCIsUvVyil7EJXcaN7U+wHr5lB09Fw2xaF5yJcbLea6r1pcuRop4XpUvNTteLZr+IQ3cnr5WwWZJtgBfP2fUiigP5EvcxVfqlka9OyOIelQKDhzZWOLX2YPuKrAgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqfrZdTBRECOT62vGdDqjBU1zyA67G9Pa4OoQZBwX9I=;
 b=SNJkV1i3fBuXYdFDACygO/b7PxKb8yP8f2bsd53bzFn1pW82a0TitcI5eAQoIWbZzig61kSRenlDaRpzRHBAi/Wy2Rahlqxo5/BKJ1z33yd/ZEppKfHU0Iqh6OBxFjVTRYZt82jSAptdrLS2pjfbR5vTOaaTI3LwMSe3OeIf/cq6eESoSP9MtU6ZZZ0Yy0FECNUmEg+J5ydxXU0xhqgtWLjA+ZMBgjH2yYMCySZndhlIXK/Fs7aJHuZB0LSatMVPrIJN0Or9UK+tNAgZUhVbHlcMPeXRlcj4xmch/dLMQyBlBV8X9vXNwyScC14Q2YDbcOH52iEA3QH+jhf1xH+PlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqfrZdTBRECOT62vGdDqjBU1zyA67G9Pa4OoQZBwX9I=;
 b=3bc8hlUukEiv9h7FeWyX0AWz61O2mIVqmWkyeB906xCtqnt6kZz+F9bn+uO6Xf5DNfyo70/p66jbcn8fRoNzm7gpWYrSKrekc56lB322hFNTfa/vi5c3ObLFyhP8AzdEUVTBA3Y+VYRgWmM0PrE40wvuw/HkrRiH1z+Q0Vt0dn0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM8PR12MB5463.namprd12.prod.outlook.com (2603:10b6:8:27::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 11:51:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 11:51:06 +0000
Message-ID: <446168fa-5bbd-160d-3ffb-ad6593637d39@amd.com>
Date: Fri, 30 Sep 2022 13:51:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 12/13] drm/scheduler: rework entity flush, kill and fini
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20220929132136.1715-1-christian.koenig@amd.com>
 <20220929132136.1715-12-christian.koenig@amd.com>
 <85442771-b3f0-3079-4356-f92d91dfb4df@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <85442771-b3f0-3079-4356-f92d91dfb4df@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM8PR12MB5463:EE_
X-MS-Office365-Filtering-Correlation-Id: 98e6bed5-cbd2-4ca9-115b-08daa2da0ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +n/zJpSMwhAOZnfLHtdfesHJPORRgXdRhV7u+xcqR/dPB6hpu0z40d8wTkrFDqwxxNe9ftd0b6u/iVbw61vXWvpjtX6estKe6Xa5xW2EucvFC7dcOed0ROeOrqwcOcVkPqJOlAzx4pRvfjmBCvRdwXW8WAcgyLvgQxTH+z73tZ7K4YHrgWSer27yA6rxx8umXrn0PB9pqbJ+tPAG/kVuyf6u7JSEgJFLIVGkNlebTDVBHGlbRhxqCkTVYsnhSVGn5CwNyjH+mJZlxAp2X0rOyJDEVPnW5Kwy+W/o0KnO3TIRqgZz82By0FKsWedK/7V/TX77hUdyDkyDyKtD9tzkJIjg+5+/Y1pKAf8P7FXCRobjop5fGXpWWZieH9R5sTRHTLeyNd6QZ9cfpxlT4CsXKpSVhRAhVe9pK291YA7ipRnRkUecNuMG4RyMeZANA6tULJbv49IoEeSoDn+N5EVN25vi395Ppx03UDp9rx9h1vLiLpfQ/ou/jsR+phTv+vx6YfkCp6ZLs0UXNzH0KETuhyt/tgxG7T2IWXqtTFyvXNke6zSGz3b/+24ojJCtYMej0SeKeU9l1QK5Dvvq5JJl1u0TRVLPPzm/ghXYUg8JZyXzzzMflRZ8VXLJNf8gDmLCcLufisW1Gj8iCJBTlNPaIExPfI1Ki83x+NOPq6HMHuVn6o+/PgbL3dnuWAh8PAIbtUWPWIHeFrOKr+NIGLf2CjwfPq+4N5ECPseZy7ouYYT9+BzfUg/zPfERsfw6EPwF8TmTOltJWZkCfmfVpbQnOF5Ork40K2t/ImGQHzkyj9U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199015)(31686004)(66574015)(36756003)(8676002)(6666004)(41300700001)(6506007)(4326008)(38100700002)(86362001)(31696002)(66476007)(110136005)(83380400001)(2616005)(2906002)(186003)(6486002)(478600001)(316002)(6512007)(5660300002)(53546011)(8936002)(66946007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlI0MHBLOVlOMk1rcHZIYmdnZndFcVdDOWQ1bTMrdkt6Z2pxa2RkSHI2RURI?=
 =?utf-8?B?S08xMEtUVGxTWStKdFhtYTlyQTl2a0hQMzFPbjJsM2Fpb0t4UHBaV2hYYkZQ?=
 =?utf-8?B?N0t3Mnk3cS9LN1lTMWY0azZXWHBmSUQ4OHVDalVPTitLUmFXaVB0YmlqRWRS?=
 =?utf-8?B?MytwRGpvZ0ZMVnRoR2VIQ2NsVlpiSUVUdjIxYnJ6bEZqeGs3S0padkpFVEVB?=
 =?utf-8?B?Tll5NkpCSkhLYiswbTNLVEJGOWhyYUFVcFMzdFppMzVMdk04MW9iMHVwS2VZ?=
 =?utf-8?B?LzRhL0xEWjljODl6RDl2WkcvQlBqaHlCTXI5eWpMUVZjb0ZVSDN0L3UvNjNV?=
 =?utf-8?B?V0tvWWl6dEtkdTFlRXkvdTVOZjZtb0I2UXB5TU1vamlDL05TWjhxR25qNTBH?=
 =?utf-8?B?OXhpQStlc2RkMFpPWmI4M2NaUTNpM1FIUmNpRko3V2FFWnVub1BWRG44OWI2?=
 =?utf-8?B?bG1ncFNjeE1XUFVJSG5ZRjVHY0t2NVlDdDZiZEt1ZmxmTG1DNk5jS3huc3My?=
 =?utf-8?B?WkhoSUE1V0FYd3FkVkVmUW1TNndUeGxyUkZBSThYVXdVMHJEcXJ3dG1hYU1G?=
 =?utf-8?B?a1NQeEdyZi9ENXRQekpYSGx3dHJLRGE3eThKa2VLSzhZK0c1dzBiUUJiWXZw?=
 =?utf-8?B?ajlaUSt2NkFHU3hxN2tiMk05UEk1LzdrK3FwaVV6WDRpbkYvOGVmeXhaVnlP?=
 =?utf-8?B?cXZHYjFndENTQlBYZHBISjVNaGRNMkRYaCtMKzlwN2U5dXI5MEZmb1h1TzhI?=
 =?utf-8?B?NkJhTzBNR08zNkZpM00rZisvSVlBeXk1TmdhWmdBMkV4bWFXK3BPa1JjLzVm?=
 =?utf-8?B?Zy9ISklud25JVjRyaWlGOHg1WEdVQ3c4cGRvVUw0SmkzK29vZklvc0NZZXg1?=
 =?utf-8?B?aTFxbjdoSDZ2MzJjMXl2c3Qxa0xMOXJ4alJFQ0dNYnJvbTRUSW05aURLSWNa?=
 =?utf-8?B?NS8raHlsdllTOExJOERFVHltTWlYZGVqUEhmbm0wSEl3MlRpN0ZWN1RkUmx5?=
 =?utf-8?B?NFlFUEJTaFk3YTAyeGt6T3pPMXR1eldpK25pNVNPZHRJSzFpajFkMnFBaEYz?=
 =?utf-8?B?NjJmWmdJZTRzVytQQWpTc0tUUmljU0pCN2JnWFFkaFhQM0d4d0QrRHZ1dFBy?=
 =?utf-8?B?d2lxamx5ZnpvZWVCcVEyUlF3WHF4bFJIa28wMXA2RHBBRU5YT0haV0h3L1pu?=
 =?utf-8?B?anRmYngvTUp6M0VFQ0NVZzkrd1NVK1VyMWpDOEcyWlFPclh3bTZDUXlNd2I5?=
 =?utf-8?B?UmV5SHBmUVVyc2sxMXM3WENxWmNNQndVcTh4ZkFKZkVaeW1mSy85dFVhVlZN?=
 =?utf-8?B?Y3dKMDBhY1l1cWUvV1M5enRiU1F5a1ozbkhYRlBBS2lRNE55ZTBxNllYN2xO?=
 =?utf-8?B?OTJpU2x6RHJNalBybGNiVStNK0xTdkhBcjFZcUpXeXc5dFhBbnNlaFJERVJ6?=
 =?utf-8?B?VVh1MEVzbXZhV1ozczNEOVVYSHpwZWdjZGZFMStiQitqNHRtbEZtdUZ5YjlH?=
 =?utf-8?B?MUtoK01MQXd4UzhEcXEvNmVGMWdPK0FVZlZpTVlhNnJNYkRLalZQL0ExNFVy?=
 =?utf-8?B?Y1ZUNGgzTzlreUt6V3BUcGk0QW8zK0szdzBCYXlWOUhGa3hmN3YyeVE1c3RF?=
 =?utf-8?B?SlhTMy9ROFJkWDYrVWJXRkNJajVGQlRmTExON3F6ZEk5cFdHMHpwZWE0eG9o?=
 =?utf-8?B?bThkSUhuZDBrRmx6NnBCQnRlVjRlSmpSQ2NZdjlpcm9DUUxDWENVeDZBd2w5?=
 =?utf-8?B?cER3QWtVVWh0ckN1OGlaRW5YaXJkVXhzaXVSc3c5aEF4RTgxYXZRWGlTSFpE?=
 =?utf-8?B?djVwZGEwNmRmVlZ6RVVDMERzaUc0SDlyVGhZcnNBUmwzanpmRlQ1aGkxb3lU?=
 =?utf-8?B?U3UwZXVvMHljNFFwMjQ0UFVhQS9BSWFNS25hZU9Xak1VWEdkbXY2WXl2Q2FY?=
 =?utf-8?B?WHl3WVRGVmFCTlRPazlBTXRBRE1TQVg5SXA5Y29FU2k5SE5neWVIcEtCUTNn?=
 =?utf-8?B?Ym1ud0Vhck9sbmtSVlVVaGZtUDhOaC9lejhqZFRyNmR0cERkRE90QS8xc2pP?=
 =?utf-8?B?VXNNRUErU05TMTJyODhOUDFtdXdpWllhcS9VNHo4U1V5czUwbG83bXB6Y1NP?=
 =?utf-8?B?enRtSkNYWFpSb0dkZWlTbHRWbDBCY1JNeFY3c1R3TC9TNERtVDdvS0oyVHV3?=
 =?utf-8?Q?h5wQIreQDXs/Z2du/mpS6dNW61Ui90ypdgTJdx5ZDRsE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e6bed5-cbd2-4ca9-115b-08daa2da0ed3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 11:51:06.4598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z9jCH5Bj2Wb+Z6cdOMNV+kuuhQXSII/CeGlHcxluwtDcs8G+9zsCoU6o97g7RxBW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5463
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

Am 29.09.22 um 21:20 schrieb Andrey Grodzovsky:
>
> On 2022-09-29 09:21, Christian König wrote:
>> This was buggy because when we had to wait for entities which were
>> killed as well we would just deadlock.
>>
>> Instead move all the dependency handling into the callbacks so that
>> will all happen asynchronously.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c | 197 +++++++++++------------
>>   1 file changed, 92 insertions(+), 105 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 1bb1437a8fed..1d448e376811 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -139,6 +139,74 @@ bool drm_sched_entity_is_ready(struct 
>> drm_sched_entity *entity)
>>       return true;
>>   }
>>   +static void drm_sched_entity_kill_jobs_irq_work(struct irq_work *wrk)
>> +{
>> +    struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
>> +
>> +    drm_sched_fence_scheduled(job->s_fence);
>> +    drm_sched_fence_finished(job->s_fence);
>> +    WARN_ON(job->s_fence->parent);
>> +    job->sched->ops->free_job(job);
>> +}
>> +
>> +/* Signal the scheduler finished fence when the entity in question 
>> is killed. */
>> +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>> +                      struct dma_fence_cb *cb)
>> +{
>> +    struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
>> +                         finish_cb);
>> +    int r;
>> +
>> +    dma_fence_put(f);
>> +
>> +    /* Wait for all dependencies to avoid data corruptions */
>> +    while (!xa_empty(&job->dependencies)) {
>> +        f = xa_erase(&job->dependencies, job->last_dependency++);
>> +        r = dma_fence_add_callback(f, &job->finish_cb,
>> +                       drm_sched_entity_kill_jobs_cb);
>> +        if (!r)
>> +            return;
>> +
>> +        dma_fence_put(f);
>> +    }
>> +
>> +    init_irq_work(&job->work, drm_sched_entity_kill_jobs_irq_work);
>> +    irq_work_queue(&job->work);
>> +}
>> +
>> +/* Remove the entity from the scheduler and kill all pending jobs */
>> +static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>> +{
>> +    struct drm_sched_job *job;
>> +    struct dma_fence *prev;
>> +
>> +    if (!entity->rq)
>> +        return;
>> +
>> +    spin_lock(&entity->rq_lock);
>> +    entity->stopped = true;
>> +    drm_sched_rq_remove_entity(entity->rq, entity);
>> +    spin_unlock(&entity->rq_lock);
>> +
>> +    /* Make sure this entity is not used by the scheduler at the 
>> moment */
>> +    wait_for_completion(&entity->entity_idle);
>
>
> Does it really stop processing in case more jobs are pending in entity 
> queue already ?
> It probably makes sense to integrate drm_sched_entity_is_idle into 
> drm_sched_entity_is_ready
> to prevent rq selecting this  entity  in such case

We make sure that the entity is not used for scheduling any more by 
calling drm_sched_rq_remove_entity() right above this check here.

The wait is only to prevent us from racing with the scheduler thread 
submitting one more job from the entity.

>
>> +
>> +    prev = dma_fence_get(entity->last_scheduled);
>> +    while ((job = 
>> to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
>> +        struct drm_sched_fence *s_fence = job->s_fence;
>> +
>> +        dma_fence_set_error(&s_fence->finished, -ESRCH);
>> +
>> +        dma_fence_get(&s_fence->finished);
>> +        if (!prev || dma_fence_add_callback(prev, &job->finish_cb,
>> +                       drm_sched_entity_kill_jobs_cb))
>> +            drm_sched_entity_kill_jobs_cb(NULL, &job->finish_cb);
>> +
>> +        prev = &s_fence->finished;
>> +    }
>> +    dma_fence_put(prev);
>> +}
>> +
>>   /**
>>    * drm_sched_entity_flush - Flush a context entity
>>    *
>> @@ -179,91 +247,13 @@ long drm_sched_entity_flush(struct 
>> drm_sched_entity *entity, long timeout)
>>       /* For killed process disable any more IBs enqueue right now */
>>       last_user = cmpxchg(&entity->last_user, current->group_leader, 
>> NULL);
>>       if ((!last_user || last_user == current->group_leader) &&
>> -        (current->flags & PF_EXITING) && (current->exit_code == 
>> SIGKILL)) {
>> -        spin_lock(&entity->rq_lock);
>> -        entity->stopped = true;
>> -        drm_sched_rq_remove_entity(entity->rq, entity);
>> -        spin_unlock(&entity->rq_lock);
>> -    }
>> +        (current->flags & PF_EXITING) && (current->exit_code == 
>> SIGKILL))
>> +        drm_sched_entity_kill(entity);
>
>
> This reverts 'drm/scheduler: only kill entity if last user is killed 
> v2' and so might break this use case - when entity
> gets through FD into child process. Why this needs to be removed ?

This patch isn't reverted. I keep the "last_user == 
current->group_leader" check in the line above.

Christian.

>
> Andrey
>
>
>>         return ret;
>>   }
>>   EXPORT_SYMBOL(drm_sched_entity_flush);
>>   -static void drm_sched_entity_kill_jobs_irq_work(struct irq_work *wrk)
>> -{
>> -    struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
>> -
>> -    drm_sched_fence_finished(job->s_fence);
>> -    WARN_ON(job->s_fence->parent);
>> -    job->sched->ops->free_job(job);
>> -}
>> -
>> -
>> -/* Signal the scheduler finished fence when the entity in question 
>> is killed. */
>> -static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>> -                      struct dma_fence_cb *cb)
>> -{
>> -    struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
>> -                         finish_cb);
>> -
>> -    dma_fence_put(f);
>> -    init_irq_work(&job->work, drm_sched_entity_kill_jobs_irq_work);
>> -    irq_work_queue(&job->work);
>> -}
>> -
>> -static struct dma_fence *
>> -drm_sched_job_dependency(struct drm_sched_job *job,
>> -             struct drm_sched_entity *entity)
>> -{
>> -    if (!xa_empty(&job->dependencies))
>> -        return xa_erase(&job->dependencies, job->last_dependency++);
>> -
>> -    if (job->sched->ops->dependency)
>> -        return job->sched->ops->dependency(job, entity);
>> -
>> -    return NULL;
>> -}
>> -
>> -static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
>> -{
>> -    struct drm_sched_job *job;
>> -    struct dma_fence *f;
>> -    int r;
>> -
>> -    while ((job = 
>> to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
>> -        struct drm_sched_fence *s_fence = job->s_fence;
>> -
>> -        /* Wait for all dependencies to avoid data corruptions */
>> -        while ((f = drm_sched_job_dependency(job, entity))) {
>> -            dma_fence_wait(f, false);
>> -            dma_fence_put(f);
>> -        }
>> -
>> -        drm_sched_fence_scheduled(s_fence);
>> -        dma_fence_set_error(&s_fence->finished, -ESRCH);
>> -
>> -        /*
>> -         * When pipe is hanged by older entity, new entity might
>> -         * not even have chance to submit it's first job to HW
>> -         * and so entity->last_scheduled will remain NULL
>> -         */
>> -        if (!entity->last_scheduled) {
>> -            drm_sched_entity_kill_jobs_cb(NULL, &job->finish_cb);
>> -            continue;
>> -        }
>> -
>> -        dma_fence_get(entity->last_scheduled);
>> -        r = dma_fence_add_callback(entity->last_scheduled,
>> -                       &job->finish_cb,
>> -                       drm_sched_entity_kill_jobs_cb);
>> -        if (r == -ENOENT)
>> -            drm_sched_entity_kill_jobs_cb(NULL, &job->finish_cb);
>> -        else if (r)
>> -            DRM_ERROR("fence add callback failed (%d)\n", r);
>> -    }
>> -}
>> -
>>   /**
>>    * drm_sched_entity_fini - Destroy a context entity
>>    *
>> @@ -277,33 +267,17 @@ static void drm_sched_entity_kill_jobs(struct 
>> drm_sched_entity *entity)
>>    */
>>   void drm_sched_entity_fini(struct drm_sched_entity *entity)
>>   {
>> -    struct drm_gpu_scheduler *sched = NULL;
>> -
>> -    if (entity->rq) {
>> -        sched = entity->rq->sched;
>> -        drm_sched_rq_remove_entity(entity->rq, entity);
>> -    }
>> -
>> -    /* Consumption of existing IBs wasn't completed. Forcefully
>> -     * remove them here.
>> +    /*
>> +     * If consumption of existing IBs wasn't completed. Forcefully 
>> remove
>> +     * them here. Also makes sure that the scheduler won't touch 
>> this entity
>> +     * any more.
>>        */
>> -    if (spsc_queue_count(&entity->job_queue)) {
>> -        if (sched) {
>> -            /*
>> -             * Wait for thread to idle to make sure it isn't processing
>> -             * this entity.
>> -             */
>> -            wait_for_completion(&entity->entity_idle);
>> -
>> -        }
>> -        if (entity->dependency) {
>> -            dma_fence_remove_callback(entity->dependency,
>> -                          &entity->cb);
>> -            dma_fence_put(entity->dependency);
>> -            entity->dependency = NULL;
>> -        }
>> +    drm_sched_entity_kill(entity);
>>   -        drm_sched_entity_kill_jobs(entity);
>> +    if (entity->dependency) {
>> +        dma_fence_remove_callback(entity->dependency, &entity->cb);
>> +        dma_fence_put(entity->dependency);
>> +        entity->dependency = NULL;
>>       }
>>         dma_fence_put(entity->last_scheduled);
>> @@ -415,6 +389,19 @@ static bool 
>> drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>       return false;
>>   }
>>   +static struct dma_fence *
>> +drm_sched_job_dependency(struct drm_sched_job *job,
>> +             struct drm_sched_entity *entity)
>> +{
>> +    if (!xa_empty(&job->dependencies))
>> +        return xa_erase(&job->dependencies, job->last_dependency++);
>> +
>> +    if (job->sched->ops->dependency)
>> +        return job->sched->ops->dependency(job, entity);
>> +
>> +    return NULL;
>> +}
>> +
>>   struct drm_sched_job *drm_sched_entity_pop_job(struct 
>> drm_sched_entity *entity)
>>   {
>>       struct drm_sched_job *sched_job;

