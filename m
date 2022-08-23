Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742F459E5CE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 17:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04E211BCEA;
	Tue, 23 Aug 2022 15:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2050.outbound.protection.outlook.com [40.107.101.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1840911BCEA;
 Tue, 23 Aug 2022 15:15:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWRPhXMYaRJn4O0QoL3SSqnGX5LeC37tfWx/iyqRQ8iz0W4a8YUSOKhbtSJYy3Jd/mjlTTB/mphGrJEqTBmjlKEHnD0Kja4X2qCPFmDS6SnfZDpshkKxy6uOtEAyfu+jrhva3HNNJH4I3ir4uPJgBCSKWPxGPY44lTBX0gbTwFg5RATknk5JZKxk36YAQ2oFgcnKQkY74/eBJQAVAZPX8TB/ZYTAKYMS6PBz8V5BNbt7Yf/D0bYSr3u5LWywF5wdge1OQ178+dNo582crc+6ehFrYEncgC+61Fw9E9rB3GFMiEsll58nm8OI22hS361XZxoI7DKtTRroxcX384TGVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBPlh4J0gSCIXweIpO285JdDK39OjauGXrneAPu50kM=;
 b=GwLlhW9Uf60jOZM8mll/T+hBoe31LrnyEzKBq/VsBm95yN9YDmhp2tKT4PjzDp20zP8qP0ABJLZD2BVrTAmxLYYcR11g4ZKYj3Rm1GLBuE3LO/4ZhwO5yW8ADHyytifWZu7kAbP2G+ssUtA3WwLAvVRm1b0zOKIvORuJgNm+JNm7+Na/EsWzVhwdmR65lv+4mXRlJvAlapUdRp8acc2lXjHVjp4WjDo/8MMfqTfYcVpGgxOfyuk3uEySgYLpRe05eXJ4DgPaZkfps7HLuPR4a3dLyr+jPowRproN6v33wY9kguvh1mSf+5GCVrTeWcLvSqZeBFkx/AZfcGLbarFD5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBPlh4J0gSCIXweIpO285JdDK39OjauGXrneAPu50kM=;
 b=v5ThdzWDh20qLDncgD+0zU3np67beswbChLgTfH3f68qbDuGQhlvAfDUrYF5hfwZquTcDE2SwyDBGwC95r6oX9QpZ9p96yt4RJ4TCldxvNy4i/V410XO3GcZU0VZPmwcHJ6XmMFMmuYYbSufEfkUrGwekEj1awwlp85ZOSaVbSU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BL1PR12MB5730.namprd12.prod.outlook.com (2603:10b6:208:385::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Tue, 23 Aug
 2022 15:15:24 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5566.015; Tue, 23 Aug 2022
 15:15:21 +0000
Message-ID: <7cd2da48-683a-e5a7-7cbb-3a3d7dd70608@amd.com>
Date: Tue, 23 Aug 2022 11:15:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/sced: Add FIFO policy for scheduler rq
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20220822200917.440681-1-andrey.grodzovsky@amd.com>
 <ae6aa412-326c-46e3-4cde-8870ded748b8@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <ae6aa412-326c-46e3-4cde-8870ded748b8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::31) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da2282cc-93c6-413b-f7d9-08da851a4baf
X-MS-TrafficTypeDiagnostic: BL1PR12MB5730:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fKbIRFeW1AnjM0/HLtjrSlLdlGS1Eq+aTchOTAmQnIvEIhQVl5l9DF4/1JEODh0sn6xHR7L4G5Q92kJz9fGJUrwyDo8FzvBpPxuZLJNMR1UG9hJnfCQWh4a9I5WnDnimF+7NR/vCjwcz5/t86x8VuHHZOdFzC97YFs5JNYJ9YZee+IEUNK42KggxdizQSp17nc7BFihpSiwmMuv9P89QgrLLT+0fop4/6sgJ5hkViruRCVHxkS6GRLff8++Pm7XSXdX0q5HvAmvtMBQRFBklYk17BinwVgb+xrr5p/eFmNUH4j3Ssua87By8x2CM220nCBe2ssZQ0CnAYIcRdSi042CWxIArt/KCKps5qyXDL2p6GdsFTwYA/CLQNnnWDrhZQM901RwsXMFPk1W+qwQyBZACXQ0ZmVdv9tCNdrG6yEfKF1RG8X7av4Y/9cXj2B7NJZ+exgT/lLBFhN6qEbT0x4ugYjXruMD7reSIV2LOrhJ3u/+e0PEj51W/+IEGQ2eG10zOcD3NormKtOnQZ+I4Qn7y/UBENBMmBZrB2kYNDq++sdASe3f4DqSFOZbFOgxAcjintU0f/t8WycnGAPqU9iYd3smSewkfSYikeAeSMmpoAMAm/+NdncNWnEKdGf3j6dBqVnWS66uF81vl1/cFrO9USp/+6+Tj34j5AnAca06Gm2gHI6EtuVkvfUbqIEJU0p5g4NACNPIPy9/6wxmi6zY3J6aXLPFEeX/HTzW3nurhMjvfHOOqqNXQYNdmQ8dm1sOdzLsjLWAZPRu5dhK9e09D4IYzR2Io6J1zSi5j3IM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(2616005)(31696002)(186003)(66574015)(83380400001)(38100700002)(86362001)(66556008)(66946007)(31686004)(66476007)(8676002)(316002)(36756003)(2906002)(4326008)(8936002)(44832011)(5660300002)(6666004)(478600001)(41300700001)(53546011)(6506007)(6512007)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzF5Qlh1RUtBMlVKK1dIQ3lMWWJidG9VMTNYaUp3Wm9ZZkxJTzgzQWZoQzBs?=
 =?utf-8?B?QlA5NklodTE3T3dYaFkxUUlSbkpTVTR3K3d4Vy9ORHc5UHFoQzNLdmVaZUdT?=
 =?utf-8?B?b21Qc1oyMmVoL3lIWXJyVUNBN25Zc2ZZdkNEOThNdERGakE5WU04NjVyVXFm?=
 =?utf-8?B?UTkvWnJ5M2lWbmhuOTFObUxIOVNMZmJqNFFTVitNZG5kd25Nc2lqcmNqb3Vp?=
 =?utf-8?B?K3RDZS8yZWhTNk5BMmk2TFJyYTFhY0xLK1NaaDdWYURGcmhhWVA0dkQ5MG5X?=
 =?utf-8?B?N2J1dWEzM3NmcmFWamNDeVlDT20xU3pEQ2VvZVIyanQ5RFowZGxMUjJMVDJ2?=
 =?utf-8?B?eExWVVpTaDlla2ROcDJyOVdjanlYemtTUkhtSjlWTUZuU3pYVDVSMS9JbEox?=
 =?utf-8?B?djJaeXEyd2RSSlNLNC9ZMlJDclV0ZnVUbjNmZG9uUFk4eFlSZW52bmNNRmIv?=
 =?utf-8?B?RkhLQTl2ZmVjbElvdmUwR3dIOVc0Sk1zcW5YcHdGNUtoS0I4WTVrUHJvQVZQ?=
 =?utf-8?B?WWtySm5SU1VYVFFmRG5QR0dOYW1PQldLc3k1aWdZQ0sxb3dTbnFGV1E3Q1A0?=
 =?utf-8?B?ODB0eEphUndDN3AvNllWdGJYbENpeVBmVU5rWlNoOElYcXo4NitpaWZ5RkhB?=
 =?utf-8?B?ZkkyTEtFbUdWbnF5dVRMbEN3SzVxZVNrY0ZVclQzOHB2akJtVEIzK3lTT2lr?=
 =?utf-8?B?TjlhcC9jYXhxVlZjMEV2UFlFQXd0c2xXQTBIU2d3T1B3QTJLdExPMlJucmwx?=
 =?utf-8?B?N1pNZTkzTVM5TjhZQzAwdCtDVDdGb005M2krK21uUVIvQXltMmk1OFhKWkNi?=
 =?utf-8?B?ZUlyS1lkTExxTnpWSm10TUVvWjFqTUh5ZGdZSlNrRFFXSlloMXBxZzYvVDEr?=
 =?utf-8?B?MlRUZERQYTg5OVA3UTczUVpocjY0dW5SVy9CY05hY0c2eE9DaFBpQ2lNZ0pY?=
 =?utf-8?B?UlI5TzR5UUw5UFFhdi9oNUV3YUgvU3R3OUI0M2hpaVAxZHZqQ25lUzd0NEl5?=
 =?utf-8?B?ZDhOdmFZVWtWYWRKVHJLR2o4L1h6a0ZWSVVsVEZPUExKbzd6TWRSZ2w0SE9s?=
 =?utf-8?B?bEU1UjhObWdvOTE2ckM5V1k3MkRxYlhkUlFTeDY4alJLNTF6cmE0ZkNMYXJU?=
 =?utf-8?B?dm1xV2poVEpRVENWbDNySnZsdXAzUEpJMWdCa1VYVUEzbnZGdlJMbFRXWTli?=
 =?utf-8?B?OFM1TGZ6VzYyZU5CQ25SM3hUM3Bzb0NBQkhhclg2R0lzejhHNzBLY0JQOHFw?=
 =?utf-8?B?RnY3NFRna3VQUlVhaDc3eEFEYnVvampBeHR0aWloTjFqd1BVZnRwempOVzRK?=
 =?utf-8?B?dkRCVlgrc0dHWUlUMTZoZEhlVE56VlowWmtOeEVtN3JiTjdsZ0FTV0xTYmNK?=
 =?utf-8?B?NFpDUktpSlVDMDdkY0FpZFVaMEtnaEtPRHpQWU16U1ZpeVFNY0RZeWVwenVy?=
 =?utf-8?B?RzhnZzh2ZXcxdGhvNjkrcklHeHdwR3ZTcU11RXhFQ1JNUXliVkJEWnBldUQ5?=
 =?utf-8?B?TzNpbUNiOHpaK1A2MVBBcFg0R2I5bE51a24rUjM1MlRYWHRqMTNsRG5KVFQ2?=
 =?utf-8?B?SEFZU2ZrUmpKSEVtTHhOY3RiLy9iQzRxMDd4dXN0R1ozcDloQTVjOHlkM3l6?=
 =?utf-8?B?K1hSSFdINjR2VXJxQ0hyWnIzb3l6YldNdWJWclI4eHZiRGNvMzRjQmNHT3lN?=
 =?utf-8?B?Q1hYZHdKS05HWS90b20xaUppdk94dWdGWVBSVlUwd1ZJMGNSL0hQdlV6WUVx?=
 =?utf-8?B?Q2VKVGt0YWJoZnRsV1ZFTzhXWU0yRWkxaEk4aG0vNU5HbFRmaDc3UVBEUXU0?=
 =?utf-8?B?cGVnQUluMVpVRHlPWkZvOFFhemtUTGM0dmlnTHNxTU5pczE2aW9BS2dPYzA1?=
 =?utf-8?B?MmpDTDA2NkhBRkF0M1FZK2wrTUlNWTNkanhGODRST3FoYlc1Rkd4SHQvTlN3?=
 =?utf-8?B?WmZhUUR0VjMwOHk4RnVIU2lmR2JPVE9WSXJXaGRHMTNZUDBZK0Rnc0cxY0cw?=
 =?utf-8?B?akVFa1FCQnFGTWxUVVVJaEZvVmxPRW5QQlBvaWVTeERVYnl2YnFRQjlKQ0RS?=
 =?utf-8?B?Ti84OW12TjJtR0RaVWNiUTVkekdsY1JEcHAyc05xUm5ZbUR0QTBpT0M2azhl?=
 =?utf-8?B?Rm1Xc0tuRW5qNUdTZExyMy95a2s4S3o0dDNpOWxBMGpvbnRULzY1bldqMmJj?=
 =?utf-8?Q?QAcOU3fradonW1CWALx/vu8LUMvbLPKPvx4snWntmGed?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da2282cc-93c6-413b-f7d9-08da851a4baf
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 15:15:21.3688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: evAs5tWO80Yoej81AyLKcyjQLlLcgsgxhJL2eKKEt4VadqgHio2jnswireeX2bAWH9SE4hOzxSWesMWorZcgkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5730
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
Cc: Li Yunxiang <Yunxiang.Li@amd.com>, luben.tuikov@amd.com,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-08-23 08:15, Christian König wrote:

>
>
> Am 22.08.22 um 22:09 schrieb Andrey Grodzovsky:
>> Poblem: Given many entities competing for same rq on
>> same scheduler an uncceptabliy long wait time for some
>> jobs waiting stuck in rq before being picked up are
>> observed (seen using  GPUVis).
>> The issue is due to Round Robin policy used by scheduler
>> to pick up the next entity for execution. Under stress
>> of many entities and long job queus within entity some
>> jobs could be stack for very long time in it's entity's
>> queue before being popped from the queue and executed
>> while for other entites with samller job queues a job
>> might execute ealier even though that job arrived later
>> then the job in the long queue.
>>
>> Fix:
>> Add FIFO selection policy to entites in RQ, chose next enitity
>> on rq in such order that if job on one entity arrived
>> ealrier then job on another entity the first job will start
>> executing ealier regardless of the length of the entity's job
>> queue.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c |  2 +
>>   drivers/gpu/drm/scheduler/sched_main.c   | 65 ++++++++++++++++++++++--
>>   include/drm/gpu_scheduler.h              |  8 +++
>>   3 files changed, 71 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 6b25b2f4f5a3..3bb7f69306ef 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -507,6 +507,8 @@ void drm_sched_entity_push_job(struct 
>> drm_sched_job *sched_job)
>>       atomic_inc(entity->rq->sched->score);
>>       WRITE_ONCE(entity->last_user, current->group_leader);
>>       first = spsc_queue_push(&entity->job_queue, 
>> &sched_job->queue_node);
>> +    sched_job->submit_ts = ktime_get();
>> +
>>         /* first job wakes up scheduler */
>>       if (first) {
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 68317d3a7a27..c123aa120d06 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -59,6 +59,19 @@
>>   #define CREATE_TRACE_POINTS
>>   #include "gpu_scheduler_trace.h"
>>   +
>> +
>> +int drm_sched_policy = -1;
>> +
>> +/**
>> + * DOC: sched_policy (int)
>> + * Used to override default entites scheduling policy in a run queue.
>> + */
>> +MODULE_PARM_DESC(sched_policy,
>> +        "specify schedule policy for entites on a runqueue (-1 = 
>> auto(default) value, 0 = Round Robin,1  = use FIFO");
>
> Well we don't really have an autodetect at the moment, so I would drop 
> that.
>
>> +module_param_named(sched_policy, drm_sched_policy, int, 0444);
>> +
>> +
>>   #define to_drm_sched_job(sched_job)        \
>>           container_of((sched_job), struct drm_sched_job, queue_node)
>>   @@ -120,14 +133,16 @@ void drm_sched_rq_remove_entity(struct 
>> drm_sched_rq *rq,
>>   }
>>     /**
>> - * drm_sched_rq_select_entity - Select an entity which could provide 
>> a job to run
>> + * drm_sched_rq_select_entity_rr - Select an entity which could 
>> provide a job to run
>>    *
>>    * @rq: scheduler run queue to check.
>>    *
>> - * Try to find a ready entity, returns NULL if none found.
>> + * Try to find a ready entity, in round robin manner.
>> + *
>> + * Returns NULL if none found.
>>    */
>>   static struct drm_sched_entity *
>> -drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>   {
>>       struct drm_sched_entity *entity;
>>   @@ -163,6 +178,45 @@ drm_sched_rq_select_entity(struct drm_sched_rq 
>> *rq)
>>       return NULL;
>>   }
>>   +/**
>> + * drm_sched_rq_select_entity_fifo - Select an entity which could 
>> provide a job to run
>> + *
>> + * @rq: scheduler run queue to check.
>> + *
>> + * Try to find a ready entity, based on FIFO order of jobs arrivals.
>> + *
>> + * Returns NULL if none found.
>> + */
>> +static struct drm_sched_entity *
>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>> +{
>> +    struct drm_sched_entity *tmp, *entity = NULL;
>> +    ktime_t oldest_ts = KTIME_MAX;
>> +    struct drm_sched_job *sched_job;
>> +
>> +    spin_lock(&rq->lock);
>> +
>> +    list_for_each_entry(tmp, &rq->entities, list) {
>> +
>> +        if (drm_sched_entity_is_ready(tmp)) {
>> +            sched_job = 
>> to_drm_sched_job(spsc_queue_peek(&tmp->job_queue));
>> +
>> +            if (ktime_before(sched_job->submit_ts, oldest_ts)) {
>> +                oldest_ts = sched_job->submit_ts;
>> +                entity = tmp;
>> +            }
>> +        }
>> +    }
>> +
>> +    if (entity) {
>> +        rq->current_entity = entity;
>> +        reinit_completion(&entity->entity_idle);
>> +    }
>
> That should probably be a separate function or at least outside of 
> this here.
>
> Apart from that totally straight forward implementation. Any idea how 
> much extra overhead that is?
>
> Regards,
> Christian.


Well, memory wise you have the extra long for each job struct for the 
time stamp, and then for each next job extraction you have to iterate 
the entire rq to find the next entity with oldest job so always linear 
in number of entitles. Today the worst case is also O(# entities) in 
case none of them are ready but usually it's not the case.

BTW, we could also add some adaptive logic where if you identify that 
for particular entity jobs are spending too much time (need to define a 
threshold) in the SW queue waiting you dynamically switch to FIFO policy 
and when the delays go down (or number of entities drops) you go back to RR.

Andrey


>
>> +
>> +    spin_unlock(&rq->lock);
>> +    return entity;
>> +}
>> +
>>   /**
>>    * drm_sched_job_done - complete a job
>>    * @s_job: pointer to the job which is done
>> @@ -804,7 +858,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler 
>> *sched)
>>         /* Kernel run queue has higher priority than normal run queue*/
>>       for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= 
>> DRM_SCHED_PRIORITY_MIN; i--) {
>> -        entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
>> +        entity = drm_sched_policy != 1 ?
>> + drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
>> + drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);
>> +
>>           if (entity)
>>               break;
>>       }
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index addb135eeea6..95865881bfcf 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -314,6 +314,14 @@ struct drm_sched_job {
>>         /** @last_dependency: tracks @dependencies as they signal */
>>       unsigned long            last_dependency;
>> +
>> +       /**
>> +    * @submit_ts:
>> +    *
>> +    * Marks job submit time
>> +    */
>> +       ktime_t                submit_ts;
>> +
>>   };
>>     static inline bool drm_sched_invalidate_job(struct drm_sched_job 
>> *s_job,
>
