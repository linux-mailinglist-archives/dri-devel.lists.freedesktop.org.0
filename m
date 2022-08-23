Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4752C59EE4C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 23:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7691710FEA0;
	Tue, 23 Aug 2022 21:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543B610EE9D;
 Tue, 23 Aug 2022 21:37:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAOZPCH01bA8Oc0dE5/y1JuHXlCrqLGEtlV+rcY+X6Luda4p66ofopTbEDvefouiH1476TixTr5EmstPIAbkGCyYXfBXaPDknHZ8P4Ip32a6uD8YgR7v7CcLruTsJ0+13H8MrdssoifKUnnw7EiNDYF1wTtP+b5NlZO+/iiaNnlAWjcF8c6PU9MB0eq1Z/TU/fC0pF/Mhq0FcdTOLuGpolEAcH46h+aJRhkxGILdPozH5XZj5wbf8K1tbB4eusHO6qNKC7g3dKKukXHNzIvQ4n7LHgoE0xOwMRN/oZv3uvxwB+KKhOVfU58Xp93m5mRsDvvbE7S1l/sbvtsSmo+19A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ORYJY51ZgIeyiKYxn4stPRdgmk8HzPg/klWuTDFXwY=;
 b=M1ddEBspj1mLoR6Q7JPphF61rWofUMV1V2uoLLG+glCVkSe6oAQZymWs4WmVsu52/Y/5VF8KkiGGYTVaYexnBD0DtBHYyxyGd2HP7RT0XacRCKmA+LjixoYqK9c8n05sXhRHZ15CReMPYrdQuyXx5v8sWZ16dNbGyzj1JqM9FUEl3q1c7UIZW15F+Lbn5fjPteTiz56uAGQzidjgpZ/Hc2ULbfaUkYa7gNI3dZvArIJZu1TAAhbnQKrviLpgR+NrM7RmP2ckId9sKv/Sa7tOzrya677WPcuoigJFqhoRn3TVF4kWiKaJWBIN601pr+TSFdgJXYRW6RZ+3kYuTF6qfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ORYJY51ZgIeyiKYxn4stPRdgmk8HzPg/klWuTDFXwY=;
 b=3J8qUURlBFbs/yy2CGqs5ATaoy4sZL/GtJQUA4VXfo5tr9ZZGAoGFC+Nu84NkqJfxY7SOmeztO+JmOod3BMEG3OIO2IkMDGsqGCAV+e7n9MiR+70yCbzGmdol/MVLAR+i5tT7BfrGIdKaMvpmkSXsyu2777p+Yjv/eiCWOOHv2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CY5PR12MB6276.namprd12.prod.outlook.com (2603:10b6:930:f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.16; Tue, 23 Aug 2022 21:37:52 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::845b:3332:e2df:8286]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::845b:3332:e2df:8286%7]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 21:37:52 +0000
Message-ID: <65722ac9-e76b-8473-e1d5-3209c2d59a89@amd.com>
Date: Tue, 23 Aug 2022 17:37:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/sced: Add FIFO policy for scheduler rq
Content-Language: en-CA
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20220822200917.440681-1-andrey.grodzovsky@amd.com>
 <d5c45e7a-257b-7c60-33b5-7c103b0b1f93@amd.com>
 <bf0791b0-c917-6b6e-75bf-0c16869aa045@amd.com>
 <1eadb06c-7d2c-0317-a34a-c219c68b93c3@amd.com>
 <54bbcee9-68c7-5b4d-1050-7f098c96a805@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <54bbcee9-68c7-5b4d-1050-7f098c96a805@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::28) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42866cdf-5362-4ff1-ee31-08da854fbbae
X-MS-TrafficTypeDiagnostic: CY5PR12MB6276:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +TtrRgO4onMEoFwxFzyRjhG44ad+mtJneXHyhDhhCQ9aVqXvMRWVyXbTSfn0r5J2sDsNnO1M0YsFlbTtlxH8OID4H0m9DIYWhyC/tMqW488h3FzbUZOb9seHP0SbQ8cjJLauPTbn2KL47ZhKC7geTKawdM4eZlVAOlrkgeDcw2zXop8ZRdRQHB0Y00AfU0+hqZpl5V8CdsaXnDknKGouUAUZEW23ex2zPjF2cXgFkgDnkp/8MsYUgqt2Yr5a5lz5CudQMazzusvZED6a+hMO3tyKMmf3LsYTClRQt5uMcAEkXMI5QyfXX8R8KA5ciM154653CdKZB+w5hKeo72UiJQWnOdarCK7K83IaobxOlFQR2uB8LFLjs7l6eSHv+4b4H53FHRm8VEqxu2nVFxcl+13tqgBkwq4wQH3H6Pt01OiwcXzai6nq27Ryy7rufcHZO75NrNCzLN7jLtrtkJE4XUIR3uzDSnJFj6LvUBAyQCGwpB6zYgkT35ODEOhnoHdBejlBI9rqSQ1OHQPjWMrYYBuM/CvV/Pr/nYNQSACtUta3MwTuefX0uvPgeA07+OSM8/mhQ+7cXo85EOLiZxmBz5AQ9Vr2M8I41O57f1SYmpS0yso7GtbzF24RuOBHYBB1irACT1zVb4fcCP8kBUFnnUjJ7qVSFj64MyCupfVHsQDqywQEOI1yg4pcQ6r+ez6gN4OOmYLCskxa1NOMH+OobYtw31S3Id8UlnBDym9/mAQJA0x/jp3Ro6C8aqAkItXY+X5RgWVugCXIEsw4Gx/mAuJrTlZmbQvPtKeGSddHOJQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(6666004)(8936002)(38100700002)(83380400001)(86362001)(31686004)(36756003)(316002)(6506007)(6486002)(478600001)(66556008)(8676002)(53546011)(31696002)(41300700001)(66476007)(6512007)(4326008)(186003)(2616005)(30864003)(5660300002)(2906002)(44832011)(66946007)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1NyL01JRzVBNWpIRkZuYXdPeU9QcWVsTlpyVGpFdGNpbHJ1cUN4RzdGVFBS?=
 =?utf-8?B?MG1sWWNjRFhlWGM0cUFEVFR2OFZTQ1JnWjRvT2FIQTE5WDdkTG9aVU1EaHV6?=
 =?utf-8?B?Tkc1STIzcGFHdDlON05aV3pHZmwwb0xmSkFjQTVoWlRMY1Z2VlhzaElFcHJx?=
 =?utf-8?B?UnAxMHdBdkpWRmFWcjg5WW94cy9RSFVVbHBtYTZxdXVBUnllRVZJRkI3Ymgv?=
 =?utf-8?B?UnFEUzAxSEtlMk9Xc3dtVkRYZXdkWlRETFp0OWEvemVOclpZQzlXZjJKQ1NI?=
 =?utf-8?B?ejNLUzk1VDVYTFlHbjNjUXJkNVQ3WG8xN3UvcXo3blFNZFp4Sk9qZGxEeGVY?=
 =?utf-8?B?MFA5TVFYQm9vWnlPWmRqQTVhYUV1aDB4b3pqL1h4MGI1b09IUWFsb09nTWJw?=
 =?utf-8?B?NGZvdi8vYW54aHFvdE1pdEZZRnVOa1NLT2tBdkRuTWNuYlFPSGJqN3ZaZjhw?=
 =?utf-8?B?cVIvK0ltN0pzVitKb1VhMVFwaGR4ZTNPell1cXMxSGFZZklvYVNCNTEzVTVJ?=
 =?utf-8?B?RkFxUERnQ1dEMHQvK3Z6bVBpRmNGeGVwcEdPd0hBcXBmU1l4K2JsWTRUTGV3?=
 =?utf-8?B?NEdkREs1NUVwNFBKclBib3lySlJXMExtbVQvc283Yy9EbUdGZUtHM2xOYys1?=
 =?utf-8?B?UXhFRmE2WkNKK2ZHaVNHd3RnOThPU1VvOXBqU1lobWw5Q1FXUkFOcmlWZUNN?=
 =?utf-8?B?bThCTFNGcDJDTzJVUG1kUmRiTkJaUUcrWkVBUlFsRU5UOWpXeEZqZGE3bDg1?=
 =?utf-8?B?OExpQnpndlV3Si82OUhSbklkc0J0Qk5GcjlralVMVWZXaVY4Q0RqL1FuKzBE?=
 =?utf-8?B?cmtERis1RGoySW1IK2Y4NlJMSENWVk5pZmxYVjI3djE0c3RNQkhVQnhRSjFK?=
 =?utf-8?B?b2FpakVDWU9ZMk5xSUgwRXFxVFRXMHpEUU14YmxydU5HVWpQMzBvM3hBZFU1?=
 =?utf-8?B?NXgzOWpOMzU5bXo0TWoxTENyR0hUeFdLbWdtYTc4dnEza0xWN1ZCVFF2K0p3?=
 =?utf-8?B?WDgydFFQeDNUSDhMZ2NERWRhUGNlWlFxMFdMbS9INXhSZ1BnbHNIVlVuQ0Fh?=
 =?utf-8?B?K1NMT3ppUldLQkRiNWZtYjh1RTdEK3hEU21aOGpzTWVCVjVWcnA0VnFTL1d0?=
 =?utf-8?B?VUsya2ZkRWtwa3c0eUNmcTJUbVNiUFhtQUZPOTZMeENBNzVSTVVRcDRLWGs2?=
 =?utf-8?B?THRmampERHh1RjZzbEFUdC9Sd2hqa0F2TzdqZXNMNktqR0swbmNpcEVpblAw?=
 =?utf-8?B?QkIxTGNySWh0N0pGMWJIcVczSjdjRFVremYwU3JDeE9oWW1OS1lRTElKN0RW?=
 =?utf-8?B?NFNXaWVnc0lhMFZRME5ySTV2SzVpTXZWajJ6cEF0ZkxQQ0VueWlNZzU2UXRT?=
 =?utf-8?B?NjZITVhwcUZxZWFJdHpiZkxEOTVsTmFZVVk3cFhwNm1DRFRFcVpVRGRKMlJ4?=
 =?utf-8?B?WnRBK1E5SzgvS0V1bHFtaXNDVnp2eXFPcXZpSXFpOXRQQXdxdS9kUFJIcnlT?=
 =?utf-8?B?RlR2L29Rc3BZWVZlN1RjazlvanJYb0kxdkVOYTIxbVVRa1RFeG8xdXVaQTNr?=
 =?utf-8?B?K1RnaEhyRXdEeFMzc2c5ejlmRjlVcnpnQlZvR09RY3dSa3V3NjRXdVBhdzhG?=
 =?utf-8?B?MFg0dkJCL1JQVmN4RFphdWVTMGNmMXdxcXcrTTZaQVE4S1pDUGk5cC83b2VQ?=
 =?utf-8?B?WXZOaFVDSzdYNEU5d1RFRTZackVwOERKUUNnWncvREIralM2WlhWbkYxSVVK?=
 =?utf-8?B?Nzk0YjVtRk45YWNSQWluZUFyZjlIUzNxUi9pVVRJMkp4TmdrYnJJa0hHUXZ4?=
 =?utf-8?B?UlV6VUIyNTh5OG1MV1gwTkNreFFFR0xQSFVtYXF0M2RMN2xCdlJGVmpoaUpk?=
 =?utf-8?B?TkEvWGwxZS9Qb3k4ZXg1RHdjZWg4dk9DczF5RHJhOVdCN0crUEV4dmlib0dB?=
 =?utf-8?B?Tjh0bWd1V3ZDV2wyU1I2WGFvZ3h0YXp2dFlOV2NETDlvM09aL2IrVHRIeWNp?=
 =?utf-8?B?TlNzdC9xN1FGdFFFNlhiVmg4TW03MHU5VWIrZ3p0YXgyUFlGWmpoMlNHK3NG?=
 =?utf-8?B?cFVSMVREVDRFOGF0V0FOUlluczBGc2pCSkxSeTdHaGZjQ2lEZk1vM0RXeHRh?=
 =?utf-8?Q?FQUyM6dz7ZBHnk3H+TgsrLz71?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42866cdf-5362-4ff1-ee31-08da854fbbae
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 21:37:52.5466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGL8hZYNZ8gU8iFL/SPiuB2UEw7eU6ApO14PxtFjiIqocAiGbNdqdhre3qRE++Ly
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6276
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



On 2022-08-23 14:57, Andrey Grodzovsky wrote:
> On 2022-08-23 14:30, Luben Tuikov wrote:
> 
>>
>> On 2022-08-23 14:13, Andrey Grodzovsky wrote:
>>> On 2022-08-23 12:58, Luben Tuikov wrote:
>>>> Inlined:
>>>>
>>>> On 2022-08-22 16:09, Andrey Grodzovsky wrote:
>>>>> Poblem: Given many entities competing for same rq on
>>>> ^Problem
>>>>
>>>>> same scheduler an uncceptabliy long wait time for some
>>>> ^unacceptably
>>>>
>>>>> jobs waiting stuck in rq before being picked up are
>>>>> observed (seen using  GPUVis).
>>>>> The issue is due to Round Robin policy used by scheduler
>>>>> to pick up the next entity for execution. Under stress
>>>>> of many entities and long job queus within entity some
>>>> ^queues
>>>>
>>>>> jobs could be stack for very long time in it's entity's
>>>>> queue before being popped from the queue and executed
>>>>> while for other entites with samller job queues a job
>>>> ^entities; smaller
>>>>
>>>>> might execute ealier even though that job arrived later
>>>> ^earlier
>>>>
>>>>> then the job in the long queue.
>>>>>
>>>>> Fix:
>>>>> Add FIFO selection policy to entites in RQ, chose next enitity
>>>>> on rq in such order that if job on one entity arrived
>>>>> ealrier then job on another entity the first job will start
>>>>> executing ealier regardless of the length of the entity's job
>>>>> queue.
>>>>>
>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
>>>>> ---
>>>>>    drivers/gpu/drm/scheduler/sched_entity.c |  2 +
>>>>>    drivers/gpu/drm/scheduler/sched_main.c   | 65 ++++++++++++++++++++++--
>>>>>    include/drm/gpu_scheduler.h              |  8 +++
>>>>>    3 files changed, 71 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> index 6b25b2f4f5a3..3bb7f69306ef 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> @@ -507,6 +507,8 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>>>    	atomic_inc(entity->rq->sched->score);
>>>>>    	WRITE_ONCE(entity->last_user, current->group_leader);
>>>>>    	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
>>>>> +	sched_job->submit_ts = ktime_get();
>>>>> +
>>>>>    
>>>>>    	/* first job wakes up scheduler */
>>>>>    	if (first) {
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index 68317d3a7a27..c123aa120d06 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -59,6 +59,19 @@
>>>>>    #define CREATE_TRACE_POINTS
>>>>>    #include "gpu_scheduler_trace.h"
>>>>>    
>>>>> +
>>>>> +
>>>>> +int drm_sched_policy = -1;
>>>>> +
>>>>> +/**
>>>>> + * DOC: sched_policy (int)
>>>>> + * Used to override default entites scheduling policy in a run queue.
>>>>> + */
>>>>> +MODULE_PARM_DESC(sched_policy,
>>>>> +		"specify schedule policy for entites on a runqueue (-1 = auto(default) value, 0 = Round Robin,1  = use FIFO");
>>>>> +module_param_named(sched_policy, drm_sched_policy, int, 0444);
>>>> As per Christian's comments, you can drop the "auto" and perhaps leave one as the default,
>>>> say the RR.
>>>>
>>>> I do think it is beneficial to have a module parameter control the scheduling policy, as shown above.
>>>
>>> Christian is not against it, just against adding 'auto' here - like the
>>> default.
>> Exactly what I said.
>>
>> Also, I still think an O(1) scheduling (picking next to run) should be
>> what we strive for in such a FIFO patch implementation.
>> A FIFO mechanism is by it's nature an O(1) mechanism for picking the next
>> element.
>>
>> Regards,
>> Luben
> 
> 
> The only solution i see for this now is keeping a global per rq jobs 
> list parallel to SPCP queue per entity - we use this list when we switch
> to FIFO scheduling, we can even start building  it ONLY when we switch 
> to FIFO building it gradually as more jobs come. Do you have other solution
> in mind ?

The idea is to "sort" on insertion, not on picking the next one to run.

cont'd below:

> 
> Andrey
> 
>>
>>>
>>>>> +
>>>>> +
>>>>>    #define to_drm_sched_job(sched_job)		\
>>>>>    		container_of((sched_job), struct drm_sched_job, queue_node)
>>>>>    
>>>>> @@ -120,14 +133,16 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>>    }
>>>>>    
>>>>>    /**
>>>>> - * drm_sched_rq_select_entity - Select an entity which could provide a job to run
>>>>> + * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>>>>     *
>>>>>     * @rq: scheduler run queue to check.
>>>>>     *
>>>>> - * Try to find a ready entity, returns NULL if none found.
>>>>> + * Try to find a ready entity, in round robin manner.
>>>>> + *
>>>>> + * Returns NULL if none found.
>>>>>     */
>>>>>    static struct drm_sched_entity *
>>>>> -drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>>>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>>    {
>>>>>    	struct drm_sched_entity *entity;
>>>>>    
>>>>> @@ -163,6 +178,45 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>>>>    	return NULL;
>>>>>    }
>>>>>    
>>>>> +/**
>>>>> + * drm_sched_rq_select_entity_fifo - Select an entity which could provide a job to run
>>>>> + *
>>>>> + * @rq: scheduler run queue to check.
>>>>> + *
>>>>> + * Try to find a ready entity, based on FIFO order of jobs arrivals.
>>>>> + *
>>>>> + * Returns NULL if none found.
>>>>> + */
>>>>> +static struct drm_sched_entity *
>>>>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>> +{
>>>>> +	struct drm_sched_entity *tmp, *entity = NULL;
>>>>> +	ktime_t oldest_ts = KTIME_MAX;
>>>>> +	struct drm_sched_job *sched_job;
>>>>> +
>>>>> +	spin_lock(&rq->lock);
>>>>> +
>>>>> +	list_for_each_entry(tmp, &rq->entities, list) {
>>>>> +
>>>>> +		if (drm_sched_entity_is_ready(tmp)) {
>>>>> +			sched_job = to_drm_sched_job(spsc_queue_peek(&tmp->job_queue));
>>>>> +
>>>>> +			if (ktime_before(sched_job->submit_ts, oldest_ts)) {
>>>>> +				oldest_ts = sched_job->submit_ts;
>>>>> +				entity = tmp;
>>>>> +			}
>>>>> +		}
>>>>> +	}
>>>> Here I think we need an O(1) lookup of the next job to pick out to run.
>>>> I see a number of optimizations, for instance keeping the current/oldest
>>>> timestamp in the rq struct itself,
>>>
>>> This was my original design with rb tree based min heap per rq based on
>>> time stamp of
>>> the oldest job waiting in each entity's job queue (head of entity's SPCP
>>> job queue). But how in this
>>> case you record the timestamps of all the jobs waiting in entity's the
>>> SPCP queue behind the head job ?
>>> If you record only the oldest job and more jobs come you have no place
>>> to store their timestamps and so
>>> on next job select after current HEAD how you will know who came before
>>> or after between 2 job queues of
>>> of 2 entities ?
>>>
>>>
>>>> or better yet keeping the next job
>>>> to pick out to run at a head of list (a la timer wheel implementation).
>>>> For suck an optimization to work, you'd prep things up on job insertion, rather
>>>> than on job removal/pick to run.
>>>
>>> I looked at timer wheel and I don't see how this applies here - it
>>> assumes you know before
>>> job submission your deadline time for job's execution to start - which
>>> we don't so I don't see
>>> how we can use it. This seems more suitable for real time scheduler
>>> implementation where you
>>> have a hard requirement to execute a job by some specific time T.

In a timer wheel you instantly know the "soonest" job to run--it's naturally
your "next" job, regardless of in what order the timers were added and what
their timeout time is.

>>>
>>> I also mentioned a list, obviously there is the brute force solution of
>>> just ordering all jobs in one giant list and get
>>> naturally a FIFO ordering this way with O(1) insertions and extractions
>>> but I assume we don't want one giant jobs queue
>>> for all the entities to avoid more dependeies between them (like locking
>>> the entire list when one specific entity is killed and
>>> needs to remove it's jobs from SW queue).

You can also have a list of list pointers. It'd be trivial to remove a whole
list from the main list, by simply removing an element--akin to locking out a rq,
or should you need to edit the rq's entity list.

>>>
>>>> I'm also surprised that there is no job transition from one queue to another,
>>>> as it is picked to run next--for the above optimizations to implemented, you'd
>>>> want a state transition from (state) queue to queue.
>>>
>>> Not sure what you have in mind here ? How this helps ?

I think I've explained this a few times now--each list represents a state and a job/entity
travels through lists as it travels through states, which states more or less represent
the state of execution in the hardware--it could be as simple as incoming --> pending --> done.

It allows a finer grain when resetting the hardware (should the hardware allow it).

Note that this isn't directly related to the O(1) mechanism I brought up here. As I said, I was surprised
to find out none such distinction existed--that's all. Don't fixate on this.

Regards,
Luben

>>>
>>> Andrey
>>>
>>>
>>>> Regards,
>>>> Luben
>>>>
>>> In my origianl design
>>>
>>>>> +
>>>>> +	if (entity) {
>>>>> +		rq->current_entity = entity;
>>>>> +		reinit_completion(&entity->entity_idle);
>>>>> +	}
>>>>> +
>>>>> +	spin_unlock(&rq->lock);
>>>>> +	return entity;
>>>>> +}
>>>>> +
>>>>>    /**
>>>>>     * drm_sched_job_done - complete a job
>>>>>     * @s_job: pointer to the job which is done
>>>>> @@ -804,7 +858,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>>>    
>>>>>    	/* Kernel run queue has higher priority than normal run queue*/
>>>>>    	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>>>> -		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
>>>>> +		entity = drm_sched_policy != 1 ?
>>>>> +				drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
>>>>> +				drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);
>>>>> +
>>>>>    		if (entity)
>>>>>    			break;
>>>>>    	}
>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>> index addb135eeea6..95865881bfcf 100644
>>>>> --- a/include/drm/gpu_scheduler.h
>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>> @@ -314,6 +314,14 @@ struct drm_sched_job {
>>>>>    
>>>>>    	/** @last_dependency: tracks @dependencies as they signal */
>>>>>    	unsigned long			last_dependency;
>>>>> +
>>>>> +       /**
>>>>> +	* @submit_ts:
>>>>> +	*
>>>>> +	* Marks job submit time
>>>>> +	*/
>>>>> +       ktime_t				submit_ts;
>>>>> +
>>>>>    };
>>>>>    
>>>>>    static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
>> Regards,

Regards,
-- 
Luben
