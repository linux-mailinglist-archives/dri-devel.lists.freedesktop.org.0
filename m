Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A014E5BFA40
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 11:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B3210E352;
	Wed, 21 Sep 2022 09:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDC310E577;
 Wed, 21 Sep 2022 09:08:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0rKsdRh+Ju9yBO6WLHYnUewQ3sWBFF5lM20x0/QUy31js4baRPyNki3bBS44r2s7rsFoYNUfOyzcdTjhavhxcgfa8VL7/rj+pm/IA2eygS7n8QFY0IydmR/YiOm+29bFVnLkaXiHYGpUuM6sw0NcsvLgRNSxEIN7spz62Xxmo5MUrr9DRfBf064XftJiw/s0WCNKzwfHBaBhJ6tEJpFSXPJO+cJ58PC/SnBQ4gh/Mt0ZjjoYf6kiXy9/rdKtZmEUqMFYUm5nJv56pPi3X9hwvoQB7wsdEbD8IqdTI3ygEsKdCM+AfRKWCOFiVE8f72x2Az/Dhu68N5l+54CPAgS+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+lnh6Z6IJEPrPtXdiuVoxkVG0QN922fmogWUTbvmKE=;
 b=Yz7+ZTx8fa5aArauUsWGHrjcCKU0U6zkp90LvVYI11dcC0uAZa7Ot2NBM9hXAsQ5D4rBBVruT9cf5uOGoaq9vTrkz2Izro0OA91DWQAQenhfBpogpE/GzDfeu9RgrXK6ekJGgS6nal0rKmlL6DMoSXmss/Aw0HS0GSOcgDoChi0CQD8/4i4LML84dlY0HXdsU+LqHSjDLPH85Hv8y/UWqdrja3TFnJg5mpOGxMNPBR1SFXKAOArx7Zh57AO2LGNcCLX8JJ0XYq+stH/K3/yJlF9voIAexfmNHg/LNmagYDIxvw9X+vmPYPlW1aZzVA6nP4zfCicUQOLAtUyLZS1jUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+lnh6Z6IJEPrPtXdiuVoxkVG0QN922fmogWUTbvmKE=;
 b=n/TI6Kl/s/Ox9pVxLpWbarmqHHTBW7IIvjFaHrE3gj74SymKjFC8G7CXf2zLscj6lHq1WlU1ZVtYKwPkRWQLddvJWx4vDYOUzUnQ0KPGX/3xvOz7c8BhB+yOW6wx3POVoqRtxHPeTe1Vey5KCz4CDp2DVz0v3TGupmYf0iJbiNY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DM6PR12MB4909.namprd12.prod.outlook.com (2603:10b6:5:1ba::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.16; Wed, 21 Sep 2022 09:08:46 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::c549:82d4:60d9:2a8a]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::c549:82d4:60d9:2a8a%3]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 09:08:46 +0000
Message-ID: <05815bfc-3c2a-5cb7-c591-c91574de6309@amd.com>
Date: Wed, 21 Sep 2022 05:08:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3] drm/sched: Add FIFO sched policy to run queue v3
Content-Language: en-CA
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20220913204025.1473086-1-andrey.grodzovsky@amd.com>
 <d227810a-e39a-dd86-2954-a9df0904cbdc@amd.com>
 <00958205-ec9a-b6ad-274d-becb0e6961ba@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <00958205-ec9a-b6ad-274d-becb0e6961ba@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0112.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::21) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DM6PR12MB4909:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f4751b-7219-421d-11da-08da9bb0e3b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xQ69TVmt8OsPWFQqRpRgOkUSUIL+0Z84vYozJI4zf/PsQunh+L8cNaOkzeaRwJa0I+0/CxRQABHCO6CnlpkqbvOj1eYfw1h/WVXmjSkwS2uJk9vLMRU/+kYuoVvOQukkcF6nO1TMaIEhbZ+5UTv+srEhqFS0sqhRealB5teBKMvA4hTp4frCtd0peSrYTz5ZAc3+AuvDoYm17/O41kBcuxrv/aoDr2TKNTFrgj4g9FvtX2+TCrIv5yOHVzfJmW1P8AOV7llESPVM3w7XfeLA8rnLwxHk86eLZRTPo5mjLABY8pMNrDOSBo1YnPuq4pRm/MJvjiNA5Yv2DBjoVlCFf9Yda5y34WgvjLgbez4QG54j4gLEaPKRODbo7ZuFn0ltKUHoGKcjEPKqmxaKdxZnVBDUQV09Eb7d5sBEH8qPRZNq3ciH8Rrv9Y+G3NEPJIRNXx+E+q0C7Kq0ycxtm/VN1D33XT4/hTSRiSGd5/soX2iFgUigtBHuvLDtgfLz8IsTBloivvRW9MgnuqQVEjeO4kRjwDmHykt7OcL/iGIF4e9B7Jq/+2CNyOhCwfAi0t8N1lI2h5wEdeQi3zkohFJmVQ9ILVqbV7Wc2uXtx9IA2tYeHD4KVkapIJ9M8Bv8J72vm+zLnqU4J1VU0sB3dZRp2Ag7TqEnQAStV046HMuPRlLxqXz1UMWM89K4vlHUrg8xT10RNYGmNwed4g4pfiRCJ8goUsd1mjEe2BudyIV9m7uzbIc7sC8TTGyfGhDyO7HglIYNpqxmtXP+D7wsi9/tXcgzOQ2Mk1ttLGV64ETWWrE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(451199015)(31686004)(478600001)(6666004)(31696002)(86362001)(66946007)(66556008)(66476007)(4326008)(8676002)(30864003)(83380400001)(38100700002)(44832011)(36756003)(2906002)(6506007)(26005)(53546011)(5660300002)(41300700001)(6512007)(8936002)(6486002)(2616005)(316002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVIrMkNTbVliczNwa1dtS3RoSy9yMUxCZUd6MGRGTlVJaU42T29pTXIzd0Jr?=
 =?utf-8?B?UXA5RnNiSWFrUDZ0SUk5bnRMSFB2dEtLVktHTG1uVWJXSGM0eVJ3U0xYYzBU?=
 =?utf-8?B?dXNTSnUzY1l3MEF0UXUvdTgyT042K2hXdG9pSUFsb2J2Z3hoaXBBSmN6dmli?=
 =?utf-8?B?aHF2a0hEcEVVcGZaNmY0T3F5M2xTdkpqL1ZDRURtZGkwb2xTeXUyZTZRSGZ5?=
 =?utf-8?B?eEZ1dW1kS0pjaDlFSzd3eC9BRkpBN2EyWm9PRkVIM09nVGpoOWNHdlNsUWFz?=
 =?utf-8?B?YnFGWDJrSll6VGhmMkM5MmJwU01zQW1GZlk5NUtYb1JvekVKOWY0bk1EL200?=
 =?utf-8?B?Vi9hMVhtS0lWMHVRQVNRSUIyMUg5R204amxuK3A2YWxyeHliR3RaYVdyb284?=
 =?utf-8?B?WEM2MytOM0didDZTOUhlazRuai9aYmYrTDJmcHFoRHgvYmo4N1ZnMTVkNGpH?=
 =?utf-8?B?STFVMHh3VlhuNjlKRyt4TzBMVHAyNEk3R1drek5KSnpiMCtNTXk1MS9YZzh6?=
 =?utf-8?B?K0JYRFdSdlVyWWlCL3kwNWVFYk1JL216NVRkbWJzclVzSmVzQnBPTExTa1NH?=
 =?utf-8?B?R0RvaTc1ZnVvd1pCZW5mVFZORmpORXdaclBUOXd6ZUY5RVcrVkpneDJPemxo?=
 =?utf-8?B?UnRPQTdpQmxsVkd5NjVQdHBVUU5mVEJXYUJMZ3FVRHlOejlTVVd3NzNqSEoy?=
 =?utf-8?B?MWFVL01WajZ5aENmQTFPV3UrN1hPWk81b3FtRFN2ZXdyTGFpSlE4OHRIbjRI?=
 =?utf-8?B?VE1NdDBYeHZhdEdta2dTZHVjL1lzQk9NVVBhNUl2VXIvS08xdHRUYjlJdkJK?=
 =?utf-8?B?cklmdGdFVG5hcStSb2piVkxqakFrQkRKZEI1bENjdy9tUEpQdElkM1RHbUJ3?=
 =?utf-8?B?N1NoaGg3N1d3ZStQSEJZdVFWb29EMjdUSWNWeGZMUFdlMmNNTU9Hb0VXZWNE?=
 =?utf-8?B?OFRING50Wm13S3NhSERLMTFPc0tITWIrdFRVWlhkbFNxNGl4OHlPdWlEZDlK?=
 =?utf-8?B?WXhCNEFOdE1yb1pNMVd2VmNNbXVwcG4xSVJXdVluV2E0R3NPanVGS3ZLbkxQ?=
 =?utf-8?B?VDE2UW9lSXJ1WGdqeUhERXJpdkdZQXBDbGwxekRGcFZMcmRtWHVBZzJyZkx6?=
 =?utf-8?B?YmY4SThkV1VNVlJDenY3dmVqSDRMaFhlSWVJcXhJNDFabFFNb0FYQmdxd0tM?=
 =?utf-8?B?TWllTmtad0RYK3Rtemp4Vk5xUC9lM0ZtS08yc0xvajRNUURtVjltYmtEbjBC?=
 =?utf-8?B?TnUrYUtYZHFvUkpCTlhnM3ZUdHlsUWpxdWxBR3JzQU52bUNVT0I1Z1p4dTdS?=
 =?utf-8?B?cmhLSFVQdS9WWjRHUkR3NTN4Q093VXpyN3dLQnlVSHhKYTRiWlAxYjN6NGQ4?=
 =?utf-8?B?aksvR1NyMHZwRnpvRHFRMWdTSlhoQUI3NzRzRndPd2h1bnZUSkp2Wmd1bExS?=
 =?utf-8?B?NUdDRlRnVlZ0YW0zNWxBd2hyc3ZRUUtTOEZIcE52M3V6aU15RHFkZEZIL1oy?=
 =?utf-8?B?RFdMYkR2bzZiWWhlSkszc2dKYkVpTEZxS1Y0MlRwMDBwd0Uxby96dW1RUjdL?=
 =?utf-8?B?MmZEcytOdmNRUkZZV0FQM2I0LzVNcUM5bVFsaE1BU0ZtUGJOcEQyeWxPdUdF?=
 =?utf-8?B?WnpibTVMc2IyWnNEcFBpT0l3bXFHU2xqYTBLZnNaQTdhT3RWdWxPRERSTzhv?=
 =?utf-8?B?SWhwRWM5Ty9MS2t5c1p1dW1xSGx2akU4SldCV2VBSU1UR0QzS0V4d3VhTWZs?=
 =?utf-8?B?VGozcXBBWGlKd0ZGbUgyUWtpSXB3RVZiVXgxbWEvcjVmRXk5ZDFuci9zSTIy?=
 =?utf-8?B?a0JLdW14S1pOZTJwUzRYcUU1Y0FrYWxYYUtpRm9FUXhxeW9jejFlV3dicGZS?=
 =?utf-8?B?QkNYZitxblAxbGEwVUdRL2NJMGpvdGlxTnI3RjZjOVFMbndhUXZaWUxlWmpM?=
 =?utf-8?B?T1dtY3ZCZUtseFVydTB6djVuVytnM0d2OTE3d3VmMmZLK1d1b1pQdVFURjh0?=
 =?utf-8?B?WGhmanVCeVhEYS9YK3BYd3RtLzZSVzEwbVhIRnk2dTZ6MmN2dGc2RXhsNU1s?=
 =?utf-8?B?a2NnNjhDWXBUQzFCOTgzNFNDL0twaGdLOGlYak9HUkZibUR0NENNUncwN1Ns?=
 =?utf-8?Q?5SsbZgSdG1SSOYZXHtnc7w5aV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f4751b-7219-421d-11da-08da9bb0e3b0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 09:08:46.3956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FAdu8AqMT7WWERSDyBYPr+TUasveww46Td94ZDauc5/e1QB6rThj5dgh2UYMhgJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4909
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

Inlined:

On 2022-09-20 15:16, Andrey Grodzovsky wrote:
> 
> On 2022-09-19 23:11, Luben Tuikov wrote:
>> Please run this patch through checkpatch.pl, as it shows
>> 12 warnings with it. Use these command line options:
>> "--strict --show-types".
>>
>> Inlined:
>>
>> On 2022-09-13 16:40, Andrey Grodzovsky wrote:
>>> Given many entities competing for same run queue on
>>> the same scheduler and unacceptably long wait time for some
>>> jobs waiting stuck in the run queue before being picked up are
>>> observed (seen using  GPUVis).
>> Since the second part of this sentence is the result of the first,
>> I'd say something like "When many entities ... we see unacceptably long ...".
>>
>>> The issue is due to the Round Robin policy used by schedulers
>>> to pick up the next entity's job queue for execution. Under stress
>>> of many entities and long job queus within entity some
>> Spelling: "queues".
>>
>>> jobs could be stack for very long time in it's entity's
>> "stuck", not "stack".
>>
>>> queue before being popped from the queue and executed
>>> while for other entities with smaller job queues a job
>>> might execute earlier even though that job arrived later
>>> then the job in the long queue.
>> "than".
>>
>>>     
>>> Fix:
>>> Add FIFO selection policy to entities in run queue, chose next entity
>>> on run queue in such order that if job on one entity arrived
>>> earlier then job on another entity the first job will start
>>> executing earlier regardless of the length of the entity's job
>>> queue.
>>>     
>>> v2:
>>> Switch to rb tree structure for entities based on TS of
>>> oldest job waiting in the job queue of an entity. Improves next
>>> entity extraction to O(1). Entity TS update
>>> O(log N) where N is the number of entities in the run-queue
>>>     
>>> Drop default option in module control parameter.
>>>
>>> v3:
>>> Various cosmetical fixes and minor refactoring of fifo update function.
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_entity.c |  26 ++++-
>>>   drivers/gpu/drm/scheduler/sched_main.c   | 132 ++++++++++++++++++++++-
>>>   include/drm/gpu_scheduler.h              |  35 ++++++
>>>   3 files changed, 187 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index 6b25b2f4f5a3..f3ffce3c9304 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -73,6 +73,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>   	entity->priority = priority;
>>>   	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>>>   	entity->last_scheduled = NULL;
>>> +	RB_CLEAR_NODE(&entity->rb_tree_node);
>>>   
>>>   	if(num_sched_list)
>>>   		entity->rq = &sched_list[0]->sched_rq[entity->priority];
>>> @@ -417,14 +418,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>>   
>>>   	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>>>   	if (!sched_job)
>>> -		return NULL;
>>> +		goto skip;
>>>   
>>>   	while ((entity->dependency =
>>>   			drm_sched_job_dependency(sched_job, entity))) {
>>>   		trace_drm_sched_job_wait_dep(sched_job, entity->dependency);
>>>   
>>> -		if (drm_sched_entity_add_dependency_cb(entity))
>>> -			return NULL;
>>> +		if (drm_sched_entity_add_dependency_cb(entity)) {
>>> +			sched_job = NULL;
>>> +			goto skip;
>>> +		}
>>>   	}
>>>   
>>>   	/* skip jobs from entity that marked guilty */
>>> @@ -443,6 +446,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>>   	smp_wmb();
>>>   
>>>   	spsc_queue_pop(&entity->job_queue);
>>> +
>>> +	/*
>>> +	 * It's when head job is extracted we can access the next job (or empty)
>>> +	 * queue and update the entity location in the min heap accordingly.
>>> +	 */
>>> +skip:
>>> +	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>> +		drm_sched_rq_update_fifo(entity,
>>> +					 (sched_job ? sched_job->submit_ts : ktime_get()));
>>> +
>>>   	return sched_job;
>>>   }
>>>   
>>> @@ -502,11 +515,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>   {
>>>   	struct drm_sched_entity *entity = sched_job->entity;
>>>   	bool first;
>>> +	ktime_t ts =  ktime_get();
>>>   
>>>   	trace_drm_sched_job(sched_job, entity);
>>>   	atomic_inc(entity->rq->sched->score);
>>>   	WRITE_ONCE(entity->last_user, current->group_leader);
>>>   	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
>>> +	sched_job->submit_ts = ts;
>>>   
>>>   	/* first job wakes up scheduler */
>>>   	if (first) {
>>> @@ -518,8 +533,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>   			DRM_ERROR("Trying to push to a killed entity\n");
>>>   			return;
>>>   		}
>>> +
>>>   		drm_sched_rq_add_entity(entity->rq, entity);
>>>   		spin_unlock(&entity->rq_lock);
>>> +
>>> +		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>> +			drm_sched_rq_update_fifo(entity, ts);
>>> +
>>>   		drm_sched_wakeup(entity->rq->sched);
>>>   	}
>>>   }
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index e5a4ecde0063..72f7105e0b16 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -62,6 +62,65 @@
>>>   #define to_drm_sched_job(sched_job)		\
>>>   		container_of((sched_job), struct drm_sched_job, queue_node)
>>>   
>>> +int drm_sched_policy = DRM_SCHED_POLICY_RR;
>>> +
>>> +/**
>>> + * DOC: sched_policy (int)
>>> + * Used to override default entities scheduling policy in a run queue.
>>> + */
>>> +MODULE_PARM_DESC(sched_policy,
>>> +	"specify schedule policy for entities on a runqueue (DRM_SCHED_POLICY_RR = Round Robin (default) ,DRM_SCHED_POLICY_FIFO  = use FIFO");
>> " ... Robin (default) ,DRM_SCHED_POLICY_FIFO ..."
>>
>> Swap the position of the space and comma. Check with modinfo that those are correctly
>> substituted and look nice in the output.
>>
>>> +module_param_named(sched_policy, drm_sched_policy, int, 0444);
>>> +
>>> +static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>>> +							     const struct rb_node *b)
>>> +{
>>> +	struct drm_sched_entity *ent_a =  rb_entry((a), struct drm_sched_entity, rb_tree_node);
>>> +	struct drm_sched_entity *ent_b =  rb_entry((b), struct drm_sched_entity, rb_tree_node);
>>> +
>>> +	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
>>> +}
>>> +
>>> +static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity)
>>> +{
>>> +	struct drm_sched_rq *rq = entity->rq;
>>> +
>>> +	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
>>> +		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
>>> +		RB_CLEAR_NODE(&entity->rb_tree_node);
>>> +	}
>>> +}
>>> +
>>> +static inline void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>>> +						   ktime_t ts)
>>> +{
>>> +	struct drm_sched_rq *rq = entity->rq;
>>> +
>>> +	drm_sched_rq_remove_fifo_locked(entity);
>>> +
>>> +	entity->oldest_job_waiting = ts;
>>> +
>>> +	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>>> +			drm_sched_entity_compare_before);
>>> +}
>>> +
>>> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
>>> +{
>>> +
>>> +	/*
>>> +	 * Both locks need to be grabbed, one to protect from entity->rq change
>>> +	 * for entity from within concurrent drm_sched_entity_select_rq and the
>>> +	 * other to update the rb tree structure.
>>> +	 */
>>> +	spin_lock(&entity->rq_lock);
>>> +	spin_lock(&entity->rq->lock);
>>> +
>>> +	drm_sched_rq_update_fifo_locked(entity, ts);
>>> +
>>> +	spin_unlock(&entity->rq->lock);
>>> +	spin_unlock(&entity->rq_lock);
>>> +}
>> Here you grab both locks, but you call drm_sched_rq_update_fifo_locked()
>> from drm_sched_rq_select_entity_fifo() with only the rq->lock.
> 
> 
> It's somewhat problematic I agree but, as you can see from 
> drm_sched_rq_update_fifo
> comment we need both locks to protect from racing 
> drm_sched_entity_select_rq against us
> which can change entity->rq while we update the time stamp. For the 
> particular case of
> drm_sched_rq_select_entity_fifo it's ok IMHO to rely on rq->lock only 
> because we only access those entities
> which are still in the rq rb_tree meaning if drm_sched_entity_select_rq 
> runs concurrently now, we grabbed the
> rq->lock before drm_sched_entity_select_rq->drm_sched_rq_remove_entity 
> executed which means
> entity->rq = rq in drm_sched_entity_select_rq didn't happen yet so we 
> should be ok

Well either make locking consistent, or explain why locking is inconsistent
by adding the explanation you wrote above into the comment of the function.
People need to know why locking is inconsistent--add that explanation above
as a comment.

If someone wants to add to the scheduler, say a new function or new functionality,
they'd not know whether to grab both locks or just the rq->lock. The comments
left therein should explain which way to proceed with locking in the future.

> 
> 
>>
>>> +
>>>   /**
>>>    * drm_sched_rq_init - initialize a given run queue struct
>>>    *
>>> @@ -75,6 +134,7 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>>>   {
>>>   	spin_lock_init(&rq->lock);
>>>   	INIT_LIST_HEAD(&rq->entities);
>>> +	rq->rb_tree_root = RB_ROOT_CACHED;
>>>   	rq->current_entity = NULL;
>>>   	rq->sched = sched;
>>>   }
>>> @@ -92,9 +152,12 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>>   {
>>>   	if (!list_empty(&entity->list))
>>>   		return;
>>> +
>>>   	spin_lock(&rq->lock);
>>> +
>>>   	atomic_inc(rq->sched->score);
>>>   	list_add_tail(&entity->list, &rq->entities);
>>> +
>>>   	spin_unlock(&rq->lock);
>>>   }
>>>   
>>> @@ -111,23 +174,32 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>   {
>>>   	if (list_empty(&entity->list))
>>>   		return;
>>> +
>>>   	spin_lock(&rq->lock);
>>> +
>>> +
>>>   	atomic_dec(rq->sched->score);
>>>   	list_del_init(&entity->list);
>>> +
>>>   	if (rq->current_entity == entity)
>>>   		rq->current_entity = NULL;
>>> +
>>> +	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>> +		drm_sched_rq_remove_fifo_locked(entity);
>>> +
>>>   	spin_unlock(&rq->lock);
>>>   }
>>>   
>>> +
>>>   /**
>>> - * drm_sched_rq_select_entity - Select an entity which could provide a job to run
>>> + * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>>    *
>>>    * @rq: scheduler run queue to check.
>>>    *
>>>    * Try to find a ready entity, returns NULL if none found.
>>>    */
>>>   static struct drm_sched_entity *
>>> -drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>   {
>>>   	struct drm_sched_entity *entity;
>>>   
>>> @@ -163,6 +235,58 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>>   	return NULL;
>>>   }
>>>   
>>> +
>>> +/**
>>> + * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>>> + *
>>> + * @rq: scheduler run queue to check.
>>> + *
>>> + * Try to find a ready entity, returns NULL if none found.
>>> + */
>>> +static struct drm_sched_entity *
>>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>> +{
>>> +		struct drm_sched_entity *first, *entity = NULL;
>>> +		struct rb_node *rb;
>>> +
>>> +		spin_lock(&rq->lock);
>>> +
>>> +		rb = rb_first_cached(&rq->rb_tree_root);
>>> +		if (!rb)
>>> +			goto out;
>>> +
>>> +		first = rb_entry((rb), struct drm_sched_entity, rb_tree_node);
>>> +		entity = first;
>>> +
>>> +		while (true) {
>>> +
>>> +			if (drm_sched_entity_is_ready(entity)) {
>>> +				rq->current_entity = entity;
>>> +				reinit_completion(&entity->entity_idle);
>>> +				break;
>>> +			}
>>> +
>>> +			/*
>>> +			 * Push not ready entity to the end of the line so others
>>> +			 * have chance
>>> +			 */
>>> +			drm_sched_rq_update_fifo_locked(entity, ktime_get());
>>> +
>>> +
>>> +			rb = rb_first_cached(&rq->rb_tree_root);
>> You've an extra blank line above--checkpatch.pl with the options mentioned above
>> will reveal them all.
>>
>> You call drm_sched_rq_update_fifo_locked() with, what it seems, only the rq->lock
>> held, but in drm_sched_rq_update_fifo() you stipulate that both locks need to be held.
>> Should resolve this.
>>
>> Note that if no entity is ready, this code modifies all the timestamps of all entities
>> in the tree, and reinserts all the entities back again, for a total of O(N * log N),
>> O(N) to pick each one and O(log N) to reinsert, again, if no entity is ready and you
>> go over all of them. (Using rb_first_cached(), modify timestamp, rb_add_cached(),
>> rb_first_cached(), modify timestamp, rb_add_cached(), ..., and so on for all elements
>> in the tree).
>>
>> I feel that you shouldn't have to modify the time stamp of any entity, and that
>> you shouldn't have to modify the tree. You want to preserve the order in which
>> entities were added. Instead you should do an ordered walk, i.e. oldest entity to
>> youngest entity and pick the oldest one ready, using something like the following:
>>
>> static struct drm_sched_entity *
>> drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>> {
>> 	struct rb_node *rb;
>>
>> 	spin_lock(&rq->lock);
>> 	for (rb = rb_first_cached(&rq->rb_tree); rb; rb = rb_next(rb)) {
>> 		struct drm_sched_entity *entity;
>>
>> 		entity = rb_entry(rb, struct drm_sched_entity, rb_node);
>> 		if (drm_sched_entity_is_ready(entity)) {
>> 			rq->current_entity = entity;
>> 			reinit_completion(&entity->entity_idle);
>> 			break;
>> 		}
>> 	}
>> 	spin_unlock(&rq->lock);
>>
>> 	return rb ? rb_entry(rb, struct drm_sched_entity, rb_node) : NULL;
>> }
>>
>> The idea is that this preserves the insertion order, the timestamp, and
>> you search for the oldest entity, which is also ready, to schedule--not getting
>> the time, and no tree insert/modify operations, other than an in-order walk.
> 
> 
> This one much more elegant and efficient agree but - imagine now you 
> have 100 idle
> entities and 1 active  (100 idle game instances and one running) - in my 
> approach you would (with one minor tweak of updating idle entity time 
> stamp to TIME64_MAX instead of current time ktime_get)
> spend 1 time nlogn effort to put the running game in the head of the 
> priority queue but since then and on
> all the idle entities would stay in the back of the queue until a real 
> job comes to them. For your approach
> we would always keep iterating over all of them first before reaching 
> active entity because they have oldest TS which we never updated.

I see what you want to achieve with this tweak, but it is still undesirable
to modify EVERY entity, and reinsert every entity, for a O(N*lnN) time complexity.
(If you used TIME64_MIN, you can modify just the ready entity and reinsert only it,
but this is still no good, as explained below.)

You can search the priority queue as I've shown above, and you can still
reorder by last-ready, but I contend that you shouldn't have to modify timestamps,
or reorder/reinsert at all, and do any of this.

First, in-order walk is O(N) which is much faster than O(N*lnN) for N > 2,
which means that you'll find the first ready entity much quicker using what I've shown
above.

Second, suppose that on a first iteration you did find a younger entity which is ready
skipping some old ones which are not yet ready for whatever reason. Then you did mess with
the timestamp of this younger entity making it oldest, the order, and you reinserted it to
the front of the queue. (This can be achieved by modifying only that element's timestamp,
not all.) Now suppose that an older entity, which had been waiting a long time became
ready--you'd miss that because in the FIFO, the younger entity has had its timestamp modified
and it was reinserted before that older entity, and if that younger entity is ready consistently,
then the older entity would be starved. In other words, you shouldn't reorder by ready-first,
timestamp-second, order. This defeats the purpose of the FIFO effort to avoid starvation of
older entities which became ready in the interim.

The correct way to address this is to use in-order walk, as I've shown above, in O(N)
time, and pick the first entity which is ready--which would be the oldest ready entity.

This way you really give priority to oldest entities which are also ready.

Meaning that you really want to preserve the real-time order in which they were submitted,
not the order in which they had been/became ready.

All you want to find is the oldest entity which is also ready, in the fastest way possible.

Regards,
Luben


> 
> Andrey
> 
> 
>>
>>> +			entity =  rb_entry((rb), struct drm_sched_entity, rb_tree_node);
>> Extra space after = and before rb_entry().
>>
>>> +
>>> +			/* We completed full cycle */
>>> +			if (!drm_sched_entity_is_ready(entity) && entity == first) {
>>> +				entity = NULL;
>>> +				break;
>>> +			}
>>> +		}
>>> +out:
>>> +		spin_unlock(&rq->lock);
>>> +		return entity;
>>> +}
>>> +
>>>   /**
>>>    * drm_sched_job_done - complete a job
>>>    * @s_job: pointer to the job which is done
>>> @@ -803,7 +927,9 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>   
>>>   	/* Kernel run queue has higher priority than normal run queue*/
>>>   	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>> -		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
>>> +		entity = drm_sched_policy != DRM_SCHED_POLICY_FIFO ?
>>> +				drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
>>> +				drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);
>>>   		if (entity)
>>>   			break;
>>>   	}
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index 599855c6a672..e3fdfb757d61 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -50,6 +50,13 @@ enum drm_sched_priority {
>>>   	DRM_SCHED_PRIORITY_UNSET = -2
>>>   };
>>>   
>>> +/* Used to chose between FIFO and RR jobs scheduling */
>>> +extern int drm_sched_policy;
>>> +
>>> +
>>> +#define DRM_SCHED_POLICY_RR    0
>>> +#define DRM_SCHED_POLICY_FIFO  1
>>> +
>>>   /**
>>>    * struct drm_sched_entity - A wrapper around a job queue (typically
>>>    * attached to the DRM file_priv).
>>> @@ -196,6 +203,21 @@ struct drm_sched_entity {
>>>   	 * drm_sched_entity_fini().
>>>   	 */
>>>   	struct completion		entity_idle;
>>> +
>>> +	/**
>>> +	 * @oldest_job_waiting:
>>> +	 *
>>> +	 * Marks earliest job waiting in SW queue
>>> +	 */
>>> +	ktime_t				oldest_job_waiting;
>>> +
>>> +	/**
>>> +	 * @rb_tree_node:
>>> +	 *
>>> +	 * The node used to insert this entity into time based priority queue
>>> +	 */
>>> +	struct rb_node			rb_tree_node;
>> I'd probably call it "rb_node", shorter--it's up to you.
>>
>>> +
>>>   };
>>>   
>>>   /**
>>> @@ -205,6 +227,7 @@ struct drm_sched_entity {
>>>    * @sched: the scheduler to which this rq belongs to.
>>>    * @entities: list of the entities to be scheduled.
>>>    * @current_entity: the entity which is to be scheduled.
>>> + * @rb_tree_root: root of time based priory queue of entities for FIFO scheduling
>>>    *
>>>    * Run queue is a set of entities scheduling command submissions for
>>>    * one specific ring. It implements the scheduling policy that selects
>>> @@ -215,6 +238,7 @@ struct drm_sched_rq {
>>>   	struct drm_gpu_scheduler	*sched;
>>>   	struct list_head		entities;
>>>   	struct drm_sched_entity		*current_entity;
>>> +	struct rb_root_cached		rb_tree_root;
>> I'd probably just call it "rb_tree", shorter--it's up to you.
>>
>> Regards,
>> Luben
>>
>>>   };
>>>   
>>>   /**
>>> @@ -314,6 +338,14 @@ struct drm_sched_job {
>>>   
>>>   	/** @last_dependency: tracks @dependencies as they signal */
>>>   	unsigned long			last_dependency;
>>> +
>>> +
>>> +	/**
>>> +	 * @submit_ts:
>>> +	 *
>>> +	 * When the job was pushed into the entity queue.
>>> +	 */
>>> +	ktime_t                         submit_ts;
>>>   };
>>>   
>>>   static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
>>> @@ -503,6 +535,9 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>   				struct drm_sched_entity *entity);
>>>   
>>> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts);
>>> +
>>> +
>>>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>   			  enum drm_sched_priority priority,
>>>   			  struct drm_gpu_scheduler **sched_list,
