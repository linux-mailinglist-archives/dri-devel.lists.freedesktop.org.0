Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A278159EB08
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 20:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E80810E633;
	Tue, 23 Aug 2022 18:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860DE10E633;
 Tue, 23 Aug 2022 18:30:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iImW6PqTJkILNJn92qdE10Lwq2/jxMP8S/dU74uAiNLD9iP4RK8qkIP0rSBBsLrZeucE0+1d1OU4W8nHUxxAxwvvOjkguaQalFzrltcL7QGLDBufjGphlzGykaKemHJ7D84nwmmtm7otl5vgoFzCgJXzZfE4njjXALVKh4+n3hl6Z9xuG3itlubLg2SK8dfKkyA2BUsZy03vY22Q8S0loxe9bGGZOzG6RRza/2RlztbdUGXWdxbgNlj5plFkG5Abwj5IaknR5PkPVq3F6u/uXW1FmmZ5mquQfua99ufZN1flRG9FHlERYOeC4J2QWlHcx48DVaLZwBgCO78h/aLQFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYUsINkBXH/wA0RskoOw+sy3LRI6hIvpX+xlm3/0HIE=;
 b=bgNc5r0rVesyNc/PlIW2mIyfSjHRS5G+wY4nhIHCTrcYl/Fn6mjX2Hbnq45DNyvDB7rRvx0m3IwyeNb02NVIRI4FS59RRdyK/r9qiJ34lI4xGXoU0ajndvu2AoIb4d+jiRbE9OsRr+mzBsXpUuRRxjZ1teSj8L43LP/55r8Nbtt3lLsJWX2RxLMbyxAy/3qf+aogd52r/pQi4hHLvw/DffJJLryxxV/KYEHzf3DH6B5QCCPTCdffsvOCsom4vouwT1GMzZluNi95fO4PwVf3MAXoZ6/xbfTQfo6exuKmk7htOixOX+K+IpXrLS3i2x++Pmoyoglrzmh9d9NUwCIMbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYUsINkBXH/wA0RskoOw+sy3LRI6hIvpX+xlm3/0HIE=;
 b=fpEJcRP6F9x0QwoqNJKGwMwQkko73exPOcA17GkX7hZH0pOMPR4D+u1Tc6FeDUI9XfXZ1FG8aUzV4DkWoTugk2eeyM4IE8m9EW3K+ddCC2bO6rVolrmL5ay4HCkj6VRKurXD5/jaIR5MHUOnrZFr/5PMYSvfwJPbvqwlozNbWNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 BN6PR12MB1602.namprd12.prod.outlook.com (2603:10b6:405:9::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.19; Tue, 23 Aug 2022 18:30:30 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::845b:3332:e2df:8286]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::845b:3332:e2df:8286%7]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 18:30:30 +0000
Message-ID: <1eadb06c-7d2c-0317-a34a-c219c68b93c3@amd.com>
Date: Tue, 23 Aug 2022 14:30:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/sced: Add FIFO policy for scheduler rq
Content-Language: en-CA
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20220822200917.440681-1-andrey.grodzovsky@amd.com>
 <d5c45e7a-257b-7c60-33b5-7c103b0b1f93@amd.com>
 <bf0791b0-c917-6b6e-75bf-0c16869aa045@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <bf0791b0-c917-6b6e-75bf-0c16869aa045@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::18) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87fe7845-bd18-4fa5-4fec-08da85358f0d
X-MS-TrafficTypeDiagnostic: BN6PR12MB1602:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I9lnLrSpLjDFQ5atTo3qyzeNoNwpcO5n3Ss6JmJodkGLPpACl7yi+7Y43HOs2yN/MFOSrCXiqIEkyd8POXYW/a3AuuO7duKfNmmCBRbMeo16thB7IaOZhoVl531qlMPYCFrLywa8WbxCmgmzJRW2oygp2ShdCzC741uYq/HP9rNbw0bveXXIEiPuKrQSrb5DyBo8eAA/Ae24tfjXfjHmB84Ydy6+S+VgDKxlo27R/VWDR1Q/AFNmRbmdX+s4OFZTkeAZHGzi02VUOSQ1jJfz46vGf/1eDyOeF7PSBO8OZ6Dqqk5zkahCPTNQ5hcjdCimkSzqFdsm6uO5HLRv6yhswa194k3yuVhg5stVsi4ISg/Bxn2UTLyELWr1P73IX/N1J6eWI7KaMn1bjskhB1DgFNG0yE9rzcaOV4X+l5SXXeKcl3/jRLLaZOYG14mpMNPvi8w2pVaeP1Gs0QALpUUBSugjupZHA2dIEEwRXPvu2kwkcgtjocO97u4reKnLEqCpdZg/T3GBWgZe7ytTBLys8Bp0YhMBQB2WhY5zhYy83iZ7KMiMuCAw8asDeIBooTelrLnA0zCLwSzh+L4c6eHL8+wK/OcnvSqcrv3Dz0I2l6x0SLaLxPPRc45SKZiqwvxwY6FWFSq/5CE0NJvrnIGMlXjQ6HswgKJF+UWDqmfEwAyW8Rzfxr4TS7FBTK/8a00lWQHtBVvGDyWD4vYNyLG0dwWD7oRuFlMUHbS7ehmq1gUf231N3Mlhsj8LVJUoQ1u9WGcIqXmx9na53Lhu/Sazae/5hrsCTV4Q2mCVT37hEiQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(6486002)(316002)(66476007)(8676002)(8936002)(44832011)(31686004)(5660300002)(66946007)(6666004)(2906002)(4326008)(66556008)(53546011)(6506007)(6512007)(83380400001)(26005)(41300700001)(186003)(36756003)(478600001)(2616005)(31696002)(86362001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVdYT1ViQ2FKbkhESUx2dmo5SkRGMlBnUFhjbFVEaHU3V1lSZklXVmZiNmJX?=
 =?utf-8?B?bldTcUt5aW53blBUWW55T0xtVGZscG5YTXlUbEZJb0pjWGJDMWo4QzIremdk?=
 =?utf-8?B?czRGeHk4OTlKaTFSNmFmZmt1bi82SkJlOWFoaHZTNGpGSC8xUGU0NSt2MlQ2?=
 =?utf-8?B?ZjR2SlJ1dHFYL3k4cFNKa0VTd1FESXlOaHY4RVVMd2s1RDZlNkxhMDhQNWho?=
 =?utf-8?B?elFwVmtIN1FpR3Y1WWlFU2lLemlFay83Q2wydittaXVsVHBZSGh3WnpOa1o3?=
 =?utf-8?B?VXdCL3plN3pjbmpMMEJvNWhCY0F3WjlkRkI3VzdldUpzRVhuTnZFK1c2SFM1?=
 =?utf-8?B?dkh1SzVzL1NOVU1HeStmYTlpbU9rdVNid1lkOXNqc1I5R0l0c2d3RHJGZGh3?=
 =?utf-8?B?MG5xVWhOblpoLzRiZklZaWlaV0hvbm82OGlxRldxNERRemZjaDAyajhPcjVY?=
 =?utf-8?B?WTlIckRqOGYwRHc2K2pGOXVId2ZGVExCQWhBQ0xEV2dEWExJeERtWDZObkNi?=
 =?utf-8?B?K0lDTEdLM2ZoZCtla1dQK1QrbGIra3RVU1RqY3ZSWFJ3TFBoUEsvTTBwUjNk?=
 =?utf-8?B?aFZZL0JKL2hNRUxRWDZNeWtvNTRGand0VjIwZktzM1NackhxbW5HaENQOFlX?=
 =?utf-8?B?L1RjN0g3WE1EajZ0MURoTFZYRldiRFJHMk9yOFRsSW5Jd1FHclN0U2N6Ty81?=
 =?utf-8?B?V0NTcUhDajQzMURGemtEYVQ5cExwUnB2RFB3VjZ5a2lORW1NamVKRGc5YWF5?=
 =?utf-8?B?NC9jSjJkVzdoUnZWRjVXRkFMaFl1U3liOXlMOUM2VTlVQnJZaUM4c0NYbHlG?=
 =?utf-8?B?OFlxbUNxYTNqYlBYT2dmNG5QS2IzOEtOMGtmVkxPcUVyTVlnYUpJc3kzMlBT?=
 =?utf-8?B?cjgyRHJlUTdlMnpmUGkvcFBsVUppOHQzVC9EUTlVc3F6amdVRkFqRUlnUENm?=
 =?utf-8?B?OW5mU2RsdmZleU9wcU1ETlJwWFdMTU0xQm4wTUhqSVhHa3JDajdKVjlsVGJn?=
 =?utf-8?B?eW8rdmFMMlhOUjIyNXdwa2grb0ZqWUZtbE1nOUZzcFRiMnRIY3RQUzV5eWQw?=
 =?utf-8?B?UnVDWFBZYnNiWXFFeVBVRlRhdEE1QkJGSUNuL1pZQ1JteVJpaWNmeHllVnBT?=
 =?utf-8?B?R0FyZHlRdVZjODBYVk56VjJ3NkNwa2p1aU1kQnVLZ2dxeHJVNWQrU0NUSkQ1?=
 =?utf-8?B?aTlWeW9oTzF6WkVMNUY0c0g5UXBGUHAxOUQ0T1R2VTNKVnp4bHZRUStNREJO?=
 =?utf-8?B?d3JoOG96dzhPSnA3aEV0ejF2dnJMaTUrSEg2RXNTRHVxYjFlYldtY2RBcEZh?=
 =?utf-8?B?WTY0YldQbmZ4QjhsL1NJQk4vTTUwZy85U0tWd0l6a1d6WWVvbGRybXJQZWl1?=
 =?utf-8?B?S2VLRE5LbERQNWVnY1h1d0hHdWdVdUsrSGpjZk9LWld3WmRrak9qZU9nelh4?=
 =?utf-8?B?QlhrWDRoeDdjVG5jUUphNVppOU1DUkpQekZmYjAvbmZUSjh4UWtOeU1lbG1Q?=
 =?utf-8?B?dG84bEtBdDRBbEloY0RoTXZVQkcxMTNXNm1Ob2ZXUXdVQnVQRG1qQ25DY21D?=
 =?utf-8?B?dURmbXkzeGpBMHVWYVNPNmRmbXhRYVdvb01LY2tPdXZSWFYwVUtNRjVkSlNB?=
 =?utf-8?B?WFhWU3BnNlZGK0pWTFRSb0xlaVBuaGppV0pvUFNkSGhsbndmWHV6WjhCanVr?=
 =?utf-8?B?MHdYT3pLRjQ4L3JWM1ZmQm95UHoxamhxU01NVnZOR2NMVUhDOUswWm5iM2Ry?=
 =?utf-8?B?eG1XNW1UMkdEY2JiN0VoKzV6YjZXZmEvcVJFRk9wOU1HeTVKSmxnZ1B1S012?=
 =?utf-8?B?aVpkS0dpVjBNbUpnVW8rdUZsN1JBenpuRmdKQVQ5QmpzSGIzNE15MGgwTCtj?=
 =?utf-8?B?NHBDMWhpZkFncnlxNitpbEJPeGtLT09Lb3EwYitnWEtIbkJPZ280djF5NGZP?=
 =?utf-8?B?dnVPQkJDRkpsc3dzalc5UHZuTWQwVGVpNklaMTRjcm1xMUFsaFZnd0gwZDd0?=
 =?utf-8?B?aGVzNUdnYzVENXVOYW04eWRUcEMrMUdubXZKRWcwMnJlUDRuSlNjemRUOHFX?=
 =?utf-8?B?U0VCdEJmc2V3Wk1oeCtSRGk2Y1E1Rmc1MXJCbFQ4R3dHTUg5MmVUdVcyZXFs?=
 =?utf-8?Q?YlJnnwN/2vpjzR26JpgDl4eb2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87fe7845-bd18-4fa5-4fec-08da85358f0d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 18:30:30.7371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMlVO2WnHAPQGFJ4Bx3x2IwKXmzQSjrzeoPU2J9IphFdzRd29f7UseUyrHsSq2v/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1602
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
Cc: ckoenig.leichtzumerken@gmail.com, Li Yunxiang <Yunxiang.Li@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-08-23 14:13, Andrey Grodzovsky wrote:
> 
> On 2022-08-23 12:58, Luben Tuikov wrote:
>> Inlined:
>>
>> On 2022-08-22 16:09, Andrey Grodzovsky wrote:
>>> Poblem: Given many entities competing for same rq on
>> ^Problem
>>
>>> same scheduler an uncceptabliy long wait time for some
>> ^unacceptably
>>
>>> jobs waiting stuck in rq before being picked up are
>>> observed (seen using  GPUVis).
>>> The issue is due to Round Robin policy used by scheduler
>>> to pick up the next entity for execution. Under stress
>>> of many entities and long job queus within entity some
>> ^queues
>>
>>> jobs could be stack for very long time in it's entity's
>>> queue before being popped from the queue and executed
>>> while for other entites with samller job queues a job
>> ^entities; smaller
>>
>>> might execute ealier even though that job arrived later
>> ^earlier
>>
>>> then the job in the long queue.
>>>
>>> Fix:
>>> Add FIFO selection policy to entites in RQ, chose next enitity
>>> on rq in such order that if job on one entity arrived
>>> ealrier then job on another entity the first job will start
>>> executing ealier regardless of the length of the entity's job
>>> queue.
>>>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_entity.c |  2 +
>>>   drivers/gpu/drm/scheduler/sched_main.c   | 65 ++++++++++++++++++++++--
>>>   include/drm/gpu_scheduler.h              |  8 +++
>>>   3 files changed, 71 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index 6b25b2f4f5a3..3bb7f69306ef 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -507,6 +507,8 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>   	atomic_inc(entity->rq->sched->score);
>>>   	WRITE_ONCE(entity->last_user, current->group_leader);
>>>   	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
>>> +	sched_job->submit_ts = ktime_get();
>>> +
>>>   
>>>   	/* first job wakes up scheduler */
>>>   	if (first) {
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 68317d3a7a27..c123aa120d06 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -59,6 +59,19 @@
>>>   #define CREATE_TRACE_POINTS
>>>   #include "gpu_scheduler_trace.h"
>>>   
>>> +
>>> +
>>> +int drm_sched_policy = -1;
>>> +
>>> +/**
>>> + * DOC: sched_policy (int)
>>> + * Used to override default entites scheduling policy in a run queue.
>>> + */
>>> +MODULE_PARM_DESC(sched_policy,
>>> +		"specify schedule policy for entites on a runqueue (-1 = auto(default) value, 0 = Round Robin,1  = use FIFO");
>>> +module_param_named(sched_policy, drm_sched_policy, int, 0444);
>> As per Christian's comments, you can drop the "auto" and perhaps leave one as the default,
>> say the RR.
>>
>> I do think it is beneficial to have a module parameter control the scheduling policy, as shown above.
> 
> 
> Christian is not against it, just against adding 'auto' here - like the 
> default.

Exactly what I said.

Also, I still think an O(1) scheduling (picking next to run) should be
what we strive for in such a FIFO patch implementation.
A FIFO mechanism is by it's nature an O(1) mechanism for picking the next
element.

Regards,
Luben

> 
> 
>>
>>> +
>>> +
>>>   #define to_drm_sched_job(sched_job)		\
>>>   		container_of((sched_job), struct drm_sched_job, queue_node)
>>>   
>>> @@ -120,14 +133,16 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>   }
>>>   
>>>   /**
>>> - * drm_sched_rq_select_entity - Select an entity which could provide a job to run
>>> + * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>>    *
>>>    * @rq: scheduler run queue to check.
>>>    *
>>> - * Try to find a ready entity, returns NULL if none found.
>>> + * Try to find a ready entity, in round robin manner.
>>> + *
>>> + * Returns NULL if none found.
>>>    */
>>>   static struct drm_sched_entity *
>>> -drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>   {
>>>   	struct drm_sched_entity *entity;
>>>   
>>> @@ -163,6 +178,45 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>>   	return NULL;
>>>   }
>>>   
>>> +/**
>>> + * drm_sched_rq_select_entity_fifo - Select an entity which could provide a job to run
>>> + *
>>> + * @rq: scheduler run queue to check.
>>> + *
>>> + * Try to find a ready entity, based on FIFO order of jobs arrivals.
>>> + *
>>> + * Returns NULL if none found.
>>> + */
>>> +static struct drm_sched_entity *
>>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>> +{
>>> +	struct drm_sched_entity *tmp, *entity = NULL;
>>> +	ktime_t oldest_ts = KTIME_MAX;
>>> +	struct drm_sched_job *sched_job;
>>> +
>>> +	spin_lock(&rq->lock);
>>> +
>>> +	list_for_each_entry(tmp, &rq->entities, list) {
>>> +
>>> +		if (drm_sched_entity_is_ready(tmp)) {
>>> +			sched_job = to_drm_sched_job(spsc_queue_peek(&tmp->job_queue));
>>> +
>>> +			if (ktime_before(sched_job->submit_ts, oldest_ts)) {
>>> +				oldest_ts = sched_job->submit_ts;
>>> +				entity = tmp;
>>> +			}
>>> +		}
>>> +	}
>> Here I think we need an O(1) lookup of the next job to pick out to run.
>> I see a number of optimizations, for instance keeping the current/oldest
>> timestamp in the rq struct itself,
> 
> 
> This was my original design with rb tree based min heap per rq based on 
> time stamp of
> the oldest job waiting in each entity's job queue (head of entity's SPCP 
> job queue). But how in this
> case you record the timestamps of all the jobs waiting in entity's the 
> SPCP queue behind the head job ?
> If you record only the oldest job and more jobs come you have no place 
> to store their timestamps and so
> on next job select after current HEAD how you will know who came before 
> or after between 2 job queues of
> of 2 entities ?
> 
> 
>> or better yet keeping the next job
>> to pick out to run at a head of list (a la timer wheel implementation).
>> For suck an optimization to work, you'd prep things up on job insertion, rather
>> than on job removal/pick to run.
> 
> 
> I looked at timer wheel and I don't see how this applies here - it 
> assumes you know before
> job submission your deadline time for job's execution to start - which 
> we don't so I don't see
> how we can use it. This seems more suitable for real time scheduler 
> implementation where you
> have a hard requirement to execute a job by some specific time T.
> 
> I also mentioned a list, obviously there is the brute force solution of 
> just ordering all jobs in one giant list and get
> naturally a FIFO ordering this way with O(1) insertions and extractions 
> but I assume we don't want one giant jobs queue
> for all the entities to avoid more dependeies between them (like locking 
> the entire list when one specific entity is killed and
> needs to remove it's jobs from SW queue).
> 
>>
>> I'm also surprised that there is no job transition from one queue to another,
>> as it is picked to run next--for the above optimizations to implemented, you'd
>> want a state transition from (state) queue to queue.
> 
> 
> Not sure what you have in mind here ? How this helps ?
> 
> Andrey
> 
> 
>>
>> Regards,
>> Luben
>>
> 
> In my origianl design
> 
>>> +
>>> +	if (entity) {
>>> +		rq->current_entity = entity;
>>> +		reinit_completion(&entity->entity_idle);
>>> +	}
>>> +
>>> +	spin_unlock(&rq->lock);
>>> +	return entity;
>>> +}
>>> +
>>>   /**
>>>    * drm_sched_job_done - complete a job
>>>    * @s_job: pointer to the job which is done
>>> @@ -804,7 +858,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>   
>>>   	/* Kernel run queue has higher priority than normal run queue*/
>>>   	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>> -		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
>>> +		entity = drm_sched_policy != 1 ?
>>> +				drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
>>> +				drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);
>>> +
>>>   		if (entity)
>>>   			break;
>>>   	}
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index addb135eeea6..95865881bfcf 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -314,6 +314,14 @@ struct drm_sched_job {
>>>   
>>>   	/** @last_dependency: tracks @dependencies as they signal */
>>>   	unsigned long			last_dependency;
>>> +
>>> +       /**
>>> +	* @submit_ts:
>>> +	*
>>> +	* Marks job submit time
>>> +	*/
>>> +       ktime_t				submit_ts;
>>> +
>>>   };
>>>   
>>>   static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,

Regards,
-- 
Luben
