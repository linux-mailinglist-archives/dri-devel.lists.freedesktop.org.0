Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6675BED6A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 21:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98FE110E754;
	Tue, 20 Sep 2022 19:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF9C10E126;
 Tue, 20 Sep 2022 19:16:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=baAiRs9Hxu4vwmjwwhBX3zlI/+4FsaOl99Ipw6vSQCUSpPfURmk7ELEBM+tmmyKUsICLV1Rh0QR2w7iAkTkiHg9vzZjRXDQl33DGZrTS7fjT0/X/1l72nCif3fR5p3FAgftKz+3jm6XS4wowqXkWPQZAkntWRBCcAPyg/805yGs0RcM0ta1j8aTehfcV+/l7sATPCPQkBhhNgyQ8vo9yzuTRqAbOUNu85xdTn5dR9n7b3iEseCQHEFI/96MKbDIWAaGP6+IVQRXK18L60qnxne8Pw5OFrpCHHyVHKEy0kMpi8lb7RsJS5Mt5+tYgICC+/XN0FOt1eNpbzGz0JGf2Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IskGfaZsA8Nn01bfRMtiGGuNJ8d94AbZjx0btfhRR4c=;
 b=NHIYoP5vkeS0zOTssVhyAVJT4AfBggb4vA5pmSAadnp9DGBI0fe68NsMhBNeSRID1TjD99YJLTokc/AM+5mtWjbOCrr2A4kR+3wQcqS8vxedkAUxzLEOy8HQoippa2SLHyCf+rTv1twoB9rOVjYIonRWQsbBvNJgtEqkjm2EH48kSHt2aOBzn9HgzgVcRz1Yo6jD/5l6d4jslV5xLCQ3tg3DWEgjj+CWhYAeL6IOE8WWCe7eVyRy9x7o+prl/cIyAaA8m3uevMQqm/XQVmt+LDObdpa89K/sZLEAP4gnQ9YsH2TeImU3Zvc+y5Qojg8IuEeowA0SCN3eGE0fdRT7rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IskGfaZsA8Nn01bfRMtiGGuNJ8d94AbZjx0btfhRR4c=;
 b=LvqZf5FyJkLWQYLUMrUTEJTXVLJXMxhOZryYKu2m04YFO1+A+rNUStJf16ziQA6B9aM9NZZ3F4VAli4DwEiRlWIX9AY8VSv3N7P0fh0D9uVzjCJLVtP9mys5KvEr1Pr1qtHYSnlcPFKRWHPdEudfJhVVRNxxZrKuL0ov6G9H2ZM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by CH2PR12MB4086.namprd12.prod.outlook.com (2603:10b6:610:7c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Tue, 20 Sep
 2022 19:16:14 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 19:16:14 +0000
Message-ID: <00958205-ec9a-b6ad-274d-becb0e6961ba@amd.com>
Date: Tue, 20 Sep 2022 15:16:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] drm/sched: Add FIFO sched policy to run queue v3
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>, dri-devel@lists.freedesktop.org
References: <20220913204025.1473086-1-andrey.grodzovsky@amd.com>
 <d227810a-e39a-dd86-2954-a9df0904cbdc@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <d227810a-e39a-dd86-2954-a9df0904cbdc@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::8) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1947:EE_|CH2PR12MB4086:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a9942e-1ef5-4084-aebe-08da9b3c960d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vXfzmXzZhph/lQLYW2Y3kK2INc6S8Uw5r+4ZNCFd2/IK3oD8Ed+7pejZ+Chy7Olk4pK4ZMEmVU1jrBHev4fMcAcgy3k1sDYz7hn6aidlTz6zk4reaPU41OEjszK/2FsPjh57MuNSiSoKtEobEc7XA1kJPyYiPRrPDIlY4Nle5C4X318IYKexjudlMq3RWdWD+5Q50NfJDqCJ9XQJKPDzF5Wt6oc4j1VmImJnlO8MNftp0GLYq2asHDzAdc8Kylxv5QD5kdhSO/msXDeVF7E8DHKLQaK90Fbf9bIEPGcM59jPd09H4etEyJfJvSD1KqsIHGsdwRJ2jn+q5372S1MqC3Hjapfihp5dJQI/ymU7uXFklK2DoteK6fUB9oWvMLOQHgLhoP3ZQcp5IN+GdVtX3h7k+tUr+wLe0lWRHZpJ1VHCwnbE6qrkr+wqdTdPMyE8kxtvA50ODNNcVxb9f2rwzUhHPeJXvG4C0nsV1tmQWpB966TjRRoj7BWsXHcKupBUakboiRlcl9Cp26ILhgM9awRTKwBvk2z3SmFOhjKlrN2kbo52wmcTuEqyrXuCtZBnEfNAkL1ZHvTq4lplmq9H/JNi0S1YlEijVkSS5tfHmXfsc52r51bIrZwiBfB2yr5eqd7miFnWbxpGjPAJYw1MZBoQiRO8rdUjRpb45VAMfPEoaUZ8MkNiefUu0zxbBpLbNNlKh03aDVvJNhNPg0NMa9u22aO035JL6ae9RrxUyixK8LUZvXgaqexdh5sKHxu4JSlVN8GpkWekph52ctebmVqzQU5hfXIEYiIsn7W1pVw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(451199015)(186003)(2616005)(83380400001)(31686004)(44832011)(6512007)(30864003)(53546011)(86362001)(4326008)(66556008)(66476007)(8676002)(66946007)(31696002)(316002)(6486002)(2906002)(5660300002)(478600001)(38100700002)(8936002)(36756003)(6506007)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alNjMzF0NGhocVphQWQ0YkVmV3ptWFJuZFBjVXRJSnJVUFZ2K1lNR3NLUEJF?=
 =?utf-8?B?V2dISys5KzRQQU4yUDc1ZW5HcllLNUJrcS9tMmdZcU1IZ1hBbnRjVHJieHVG?=
 =?utf-8?B?QlN6U2lNNmpsd1AvR3R0aDhhZCtxUHBwTGIxZFJQRVZDSTRkK0RaTHkrR1pv?=
 =?utf-8?B?KzA5Y0FtL2FwZGZQRWh5L0FwZjlsMWxqdXlTc2FDWU9nV2tTMzJmZ1lQTnMy?=
 =?utf-8?B?OGJWR3BHN0Mxa05wYTZYVFhOZGY1NzJvWDRrbFJYczVBSld4eTUwbjh4UXJp?=
 =?utf-8?B?MWRDejVMOHFBeS85TjRTTFYvemNQMlJwRUhmbUZEc0dpUHhvZzhuZmJUWm1X?=
 =?utf-8?B?Y3RFSkxOSElicWRJYktmOHZKczAwRWt5UUpEV2VSb1hnS2NSNnZuY3ZxQ1lv?=
 =?utf-8?B?SGw5dmlWeWRqWW1qSHpuaXY5ZyswZjJ4TDlzR3BWU1hyM2ZCUW4ydFBMcXA3?=
 =?utf-8?B?TzV2MTg1NkZITUpURm1sOTJIelpXZzZjbTlDNnR4VGNFTzRjQWFCYVZZbXpa?=
 =?utf-8?B?WTdUMk1tb2ZMODNMYVIvbFdjNTA3dXZubEhPdzJBU3grN2hDaFMxeGk1dlky?=
 =?utf-8?B?SVNwZEtTb2d4TFFmcG1kaUR3T3NqQ29EbkEvOWw0dlJLR0lJbkVFUVRvMFlE?=
 =?utf-8?B?dHdOM0pmS1VDL1VwYlhwb2d2Nk1TbmRLeUYwMTM0MHY4TURnK3ZIbWNEd08y?=
 =?utf-8?B?RjdHTDlCd2VYNTBnVW56TC9lYTNLbGJKeDZiNFl0b0lKY2RUMjBCaldVYTB5?=
 =?utf-8?B?TS9KbUx5WFNkNzRMZ1JRajVFUVBrQTc2dFhETnFxQXB2SlVSUDByS1VDRS9l?=
 =?utf-8?B?bk9oOEFJSmhnMmx0aGNLY3Mrd3BOSGlCUmp2Y21CLytlcWtrd05MeWpidHM5?=
 =?utf-8?B?K3QrSTEySzJRZUJJdDFjVXhmb2RYSlJ1VTRMb0FwQnFwU2phVlhaVjVFS3VI?=
 =?utf-8?B?akY4RHREWVpNUlZSeUx6YnNSekl3aVJiL20rQ0lYSkR3dTdsMk9nYWJiUkxi?=
 =?utf-8?B?bEFkNkNYK3RsUGRyT1ZJLzl1TCtLRDdWc1F6NXhEOG5VZm5pemxLRUx6cG1M?=
 =?utf-8?B?WEZOZ2tnM0FLcjVxVXVsR2VMRUI2LytpRWt5YTF3UlltbE1UY3gzQThwdGJY?=
 =?utf-8?B?VnBoQ0FibGI3eTBQR0c5Q1IyMS9YZ05nUWE2VTgxdVZ5VUV6bjAveGJsbkw4?=
 =?utf-8?B?ZDBQb3R4R25GTGNBME9KNE94dnNCNng2ajgrR3VSdkswSzlnTkRYd1FBcHJy?=
 =?utf-8?B?WTFwby96WENwQ3dFbzM1cXE5TjFmaTgwdkU5clFEM1NYU0ZJOFpvSXVBRlBj?=
 =?utf-8?B?bW1QZVo0bjNTcksvelJZdkhiU3pjRXFtVmZwcHRlbm9RdlJOWEp2ZnlhZXlh?=
 =?utf-8?B?WHJsSm1HMy9sN2hFVUd2ckVneS95c1haUFgweEdVNXlRTkJrZVhoQk5Nam11?=
 =?utf-8?B?cCt4ZEVjK1h0b2ZIZElDMm02YktCRk8vRWVETHpjSUJnMzNDQW0rbmtRWkJC?=
 =?utf-8?B?Z2hpNkpnT0tEUUY1Q0V4SndyTmM1K3FRWjE2WUhkaTZTSWpxcm9FaFhHdS9k?=
 =?utf-8?B?ZEpJTjZXK2NJcVNpZXowUFQxYVFDNm1hY1pIVEc1MXpaa0czRGF1WkVoVWh0?=
 =?utf-8?B?UGxEdjIwSTZVWEovWEdnSTg4S0ZqejNrS3lPTnc5VE9XUGVJUk9ZVDdXNDB0?=
 =?utf-8?B?TEtON0V5ZlpaYWVIMVVqMFRLblZxKzF0MjhOVFVIMmNaL1R4eEozZGZFUmVi?=
 =?utf-8?B?a3JKM3B4M3VxMVppL2tWYU1rZmZ4VW93aldLeEZhN2l2T3h2S2h3eDhLT2Z1?=
 =?utf-8?B?NTMzeit6NXhEZGRHNFNQcVRxZWYwUnR6TENmQ2dFM0MvQnBoV1p3WGlRcDYz?=
 =?utf-8?B?UkJERlVRV1FPL1Jyc3J3VUJqZy9OSlUzdVBQYjFwR09HU0N1Y1NtRVRDWmtI?=
 =?utf-8?B?NEoyK1VHc0RPd0lHd2w5VDV4T2VDVXA0eHNnUVJuOWNSbFBzK0VSbENTeDRp?=
 =?utf-8?B?c1dnZjNhMEF0NTBVUGgrTk1DdjFXeDZvZHNFNS82VzhENXBRbHRuUTNUSm5t?=
 =?utf-8?B?YUhKa29iU3pOVkVjUTVscjZySTBOVnI1WFVBVjlNVTdBUUs0QVBxckN1VVVv?=
 =?utf-8?B?c1BUK2tWSTMvY3RKNWxSbmRzTjdwYlNDeTY3dVJWVlU4ZTY4V3MydUdiSU5V?=
 =?utf-8?Q?aQcPuWgUlhIGli4lPzfYXgX8Vc1J+GL+jQ+ymw/qMvjl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a9942e-1ef5-4084-aebe-08da9b3c960d
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 19:16:14.5574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1JRvSC0L7QRjbwytliZMuwJHYFWgJVHPVAXWxpF2U9702nHmYtTWdBw9X+NLhBaRU5Tk1j/tQMm6vjLRblXsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4086
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


On 2022-09-19 23:11, Luben Tuikov wrote:
> Please run this patch through checkpatch.pl, as it shows
> 12 warnings with it. Use these command line options:
> "--strict --show-types".
>
> Inlined:
>
> On 2022-09-13 16:40, Andrey Grodzovsky wrote:
>> Given many entities competing for same run queue on
>> the same scheduler and unacceptably long wait time for some
>> jobs waiting stuck in the run queue before being picked up are
>> observed (seen using  GPUVis).
> Since the second part of this sentence is the result of the first,
> I'd say something like "When many entities ... we see unacceptably long ...".
>
>> The issue is due to the Round Robin policy used by schedulers
>> to pick up the next entity's job queue for execution. Under stress
>> of many entities and long job queus within entity some
> Spelling: "queues".
>
>> jobs could be stack for very long time in it's entity's
> "stuck", not "stack".
>
>> queue before being popped from the queue and executed
>> while for other entities with smaller job queues a job
>> might execute earlier even though that job arrived later
>> then the job in the long queue.
> "than".
>
>>     
>> Fix:
>> Add FIFO selection policy to entities in run queue, chose next entity
>> on run queue in such order that if job on one entity arrived
>> earlier then job on another entity the first job will start
>> executing earlier regardless of the length of the entity's job
>> queue.
>>     
>> v2:
>> Switch to rb tree structure for entities based on TS of
>> oldest job waiting in the job queue of an entity. Improves next
>> entity extraction to O(1). Entity TS update
>> O(log N) where N is the number of entities in the run-queue
>>     
>> Drop default option in module control parameter.
>>
>> v3:
>> Various cosmetical fixes and minor refactoring of fifo update function.
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c |  26 ++++-
>>   drivers/gpu/drm/scheduler/sched_main.c   | 132 ++++++++++++++++++++++-
>>   include/drm/gpu_scheduler.h              |  35 ++++++
>>   3 files changed, 187 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 6b25b2f4f5a3..f3ffce3c9304 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -73,6 +73,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>   	entity->priority = priority;
>>   	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>>   	entity->last_scheduled = NULL;
>> +	RB_CLEAR_NODE(&entity->rb_tree_node);
>>   
>>   	if(num_sched_list)
>>   		entity->rq = &sched_list[0]->sched_rq[entity->priority];
>> @@ -417,14 +418,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>   
>>   	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>>   	if (!sched_job)
>> -		return NULL;
>> +		goto skip;
>>   
>>   	while ((entity->dependency =
>>   			drm_sched_job_dependency(sched_job, entity))) {
>>   		trace_drm_sched_job_wait_dep(sched_job, entity->dependency);
>>   
>> -		if (drm_sched_entity_add_dependency_cb(entity))
>> -			return NULL;
>> +		if (drm_sched_entity_add_dependency_cb(entity)) {
>> +			sched_job = NULL;
>> +			goto skip;
>> +		}
>>   	}
>>   
>>   	/* skip jobs from entity that marked guilty */
>> @@ -443,6 +446,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>   	smp_wmb();
>>   
>>   	spsc_queue_pop(&entity->job_queue);
>> +
>> +	/*
>> +	 * It's when head job is extracted we can access the next job (or empty)
>> +	 * queue and update the entity location in the min heap accordingly.
>> +	 */
>> +skip:
>> +	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> +		drm_sched_rq_update_fifo(entity,
>> +					 (sched_job ? sched_job->submit_ts : ktime_get()));
>> +
>>   	return sched_job;
>>   }
>>   
>> @@ -502,11 +515,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>   {
>>   	struct drm_sched_entity *entity = sched_job->entity;
>>   	bool first;
>> +	ktime_t ts =  ktime_get();
>>   
>>   	trace_drm_sched_job(sched_job, entity);
>>   	atomic_inc(entity->rq->sched->score);
>>   	WRITE_ONCE(entity->last_user, current->group_leader);
>>   	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
>> +	sched_job->submit_ts = ts;
>>   
>>   	/* first job wakes up scheduler */
>>   	if (first) {
>> @@ -518,8 +533,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>   			DRM_ERROR("Trying to push to a killed entity\n");
>>   			return;
>>   		}
>> +
>>   		drm_sched_rq_add_entity(entity->rq, entity);
>>   		spin_unlock(&entity->rq_lock);
>> +
>> +		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> +			drm_sched_rq_update_fifo(entity, ts);
>> +
>>   		drm_sched_wakeup(entity->rq->sched);
>>   	}
>>   }
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index e5a4ecde0063..72f7105e0b16 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -62,6 +62,65 @@
>>   #define to_drm_sched_job(sched_job)		\
>>   		container_of((sched_job), struct drm_sched_job, queue_node)
>>   
>> +int drm_sched_policy = DRM_SCHED_POLICY_RR;
>> +
>> +/**
>> + * DOC: sched_policy (int)
>> + * Used to override default entities scheduling policy in a run queue.
>> + */
>> +MODULE_PARM_DESC(sched_policy,
>> +	"specify schedule policy for entities on a runqueue (DRM_SCHED_POLICY_RR = Round Robin (default) ,DRM_SCHED_POLICY_FIFO  = use FIFO");
> " ... Robin (default) ,DRM_SCHED_POLICY_FIFO ..."
>
> Swap the position of the space and comma. Check with modinfo that those are correctly
> substituted and look nice in the output.
>
>> +module_param_named(sched_policy, drm_sched_policy, int, 0444);
>> +
>> +static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>> +							     const struct rb_node *b)
>> +{
>> +	struct drm_sched_entity *ent_a =  rb_entry((a), struct drm_sched_entity, rb_tree_node);
>> +	struct drm_sched_entity *ent_b =  rb_entry((b), struct drm_sched_entity, rb_tree_node);
>> +
>> +	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
>> +}
>> +
>> +static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity)
>> +{
>> +	struct drm_sched_rq *rq = entity->rq;
>> +
>> +	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
>> +		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
>> +		RB_CLEAR_NODE(&entity->rb_tree_node);
>> +	}
>> +}
>> +
>> +static inline void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>> +						   ktime_t ts)
>> +{
>> +	struct drm_sched_rq *rq = entity->rq;
>> +
>> +	drm_sched_rq_remove_fifo_locked(entity);
>> +
>> +	entity->oldest_job_waiting = ts;
>> +
>> +	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>> +			drm_sched_entity_compare_before);
>> +}
>> +
>> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
>> +{
>> +
>> +	/*
>> +	 * Both locks need to be grabbed, one to protect from entity->rq change
>> +	 * for entity from within concurrent drm_sched_entity_select_rq and the
>> +	 * other to update the rb tree structure.
>> +	 */
>> +	spin_lock(&entity->rq_lock);
>> +	spin_lock(&entity->rq->lock);
>> +
>> +	drm_sched_rq_update_fifo_locked(entity, ts);
>> +
>> +	spin_unlock(&entity->rq->lock);
>> +	spin_unlock(&entity->rq_lock);
>> +}
> Here you grab both locks, but you call drm_sched_rq_update_fifo_locked()
> from drm_sched_rq_select_entity_fifo() with only the rq->lock.


It's somewhat problematic I agree but, as you can see from 
drm_sched_rq_update_fifo
comment we need both locks to protect from racing 
drm_sched_entity_select_rq against us
which can change entity->rq while we update the time stamp. For the 
particular case of
drm_sched_rq_select_entity_fifo it's ok IMHO to rely on rq->lock only 
because we only access those entities
which are still in the rq rb_tree meaning if drm_sched_entity_select_rq 
runs concurrently now, we grabbed the
rq->lock before drm_sched_entity_select_rq->drm_sched_rq_remove_entity 
executed which means
entity->rq = rq in drm_sched_entity_select_rq didn't happen yet so we 
should be ok


>
>> +
>>   /**
>>    * drm_sched_rq_init - initialize a given run queue struct
>>    *
>> @@ -75,6 +134,7 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>>   {
>>   	spin_lock_init(&rq->lock);
>>   	INIT_LIST_HEAD(&rq->entities);
>> +	rq->rb_tree_root = RB_ROOT_CACHED;
>>   	rq->current_entity = NULL;
>>   	rq->sched = sched;
>>   }
>> @@ -92,9 +152,12 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>   {
>>   	if (!list_empty(&entity->list))
>>   		return;
>> +
>>   	spin_lock(&rq->lock);
>> +
>>   	atomic_inc(rq->sched->score);
>>   	list_add_tail(&entity->list, &rq->entities);
>> +
>>   	spin_unlock(&rq->lock);
>>   }
>>   
>> @@ -111,23 +174,32 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>   {
>>   	if (list_empty(&entity->list))
>>   		return;
>> +
>>   	spin_lock(&rq->lock);
>> +
>> +
>>   	atomic_dec(rq->sched->score);
>>   	list_del_init(&entity->list);
>> +
>>   	if (rq->current_entity == entity)
>>   		rq->current_entity = NULL;
>> +
>> +	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> +		drm_sched_rq_remove_fifo_locked(entity);
>> +
>>   	spin_unlock(&rq->lock);
>>   }
>>   
>> +
>>   /**
>> - * drm_sched_rq_select_entity - Select an entity which could provide a job to run
>> + * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>    *
>>    * @rq: scheduler run queue to check.
>>    *
>>    * Try to find a ready entity, returns NULL if none found.
>>    */
>>   static struct drm_sched_entity *
>> -drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>   {
>>   	struct drm_sched_entity *entity;
>>   
>> @@ -163,6 +235,58 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>   	return NULL;
>>   }
>>   
>> +
>> +/**
>> + * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>> + *
>> + * @rq: scheduler run queue to check.
>> + *
>> + * Try to find a ready entity, returns NULL if none found.
>> + */
>> +static struct drm_sched_entity *
>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>> +{
>> +		struct drm_sched_entity *first, *entity = NULL;
>> +		struct rb_node *rb;
>> +
>> +		spin_lock(&rq->lock);
>> +
>> +		rb = rb_first_cached(&rq->rb_tree_root);
>> +		if (!rb)
>> +			goto out;
>> +
>> +		first = rb_entry((rb), struct drm_sched_entity, rb_tree_node);
>> +		entity = first;
>> +
>> +		while (true) {
>> +
>> +			if (drm_sched_entity_is_ready(entity)) {
>> +				rq->current_entity = entity;
>> +				reinit_completion(&entity->entity_idle);
>> +				break;
>> +			}
>> +
>> +			/*
>> +			 * Push not ready entity to the end of the line so others
>> +			 * have chance
>> +			 */
>> +			drm_sched_rq_update_fifo_locked(entity, ktime_get());
>> +
>> +
>> +			rb = rb_first_cached(&rq->rb_tree_root);
> You've an extra blank line above--checkpatch.pl with the options mentioned above
> will reveal them all.
>
> You call drm_sched_rq_update_fifo_locked() with, what it seems, only the rq->lock
> held, but in drm_sched_rq_update_fifo() you stipulate that both locks need to be held.
> Should resolve this.
>
> Note that if no entity is ready, this code modifies all the timestamps of all entities
> in the tree, and reinserts all the entities back again, for a total of O(N * log N),
> O(N) to pick each one and O(log N) to reinsert, again, if no entity is ready and you
> go over all of them. (Using rb_first_cached(), modify timestamp, rb_add_cached(),
> rb_first_cached(), modify timestamp, rb_add_cached(), ..., and so on for all elements
> in the tree).
>
> I feel that you shouldn't have to modify the time stamp of any entity, and that
> you shouldn't have to modify the tree. You want to preserve the order in which
> entities were added. Instead you should do an ordered walk, i.e. oldest entity to
> youngest entity and pick the oldest one ready, using something like the following:
>
> static struct drm_sched_entity *
> drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> {
> 	struct rb_node *rb;
>
> 	spin_lock(&rq->lock);
> 	for (rb = rb_first_cached(&rq->rb_tree); rb; rb = rb_next(rb)) {
> 		struct drm_sched_entity *entity;
>
> 		entity = rb_entry(rb, struct drm_sched_entity, rb_node);
> 		if (drm_sched_entity_is_ready(entity)) {
> 			rq->current_entity = entity;
> 			reinit_completion(&entity->entity_idle);
> 			break;
> 		}
> 	}
> 	spin_unlock(&rq->lock);
>
> 	return rb ? rb_entry(rb, struct drm_sched_entity, rb_node) : NULL;
> }
>
> The idea is that this preserves the insertion order, the timestamp, and
> you search for the oldest entity, which is also ready, to schedule--not getting
> the time, and no tree insert/modify operations, other than an in-order walk.


This one much more elegant and efficient agree but - imagine now you 
have 100 idle
entities and 1 active  (100 idle game instances and one running) - in my 
approach you would (with one minor tweak of updating idle entity time 
stamp to TIME64_MAX instead of current time ktime_get)
spend 1 time nlogn effort to put the running game in the head of the 
priority queue but since then and on
all the idle entities would stay in the back of the queue until a real 
job comes to them. For your approach
we would always keep iterating over all of them first before reaching 
active entity because they have oldest TS which we never updated.

Andrey


>
>> +			entity =  rb_entry((rb), struct drm_sched_entity, rb_tree_node);
> Extra space after = and before rb_entry().
>
>> +
>> +			/* We completed full cycle */
>> +			if (!drm_sched_entity_is_ready(entity) && entity == first) {
>> +				entity = NULL;
>> +				break;
>> +			}
>> +		}
>> +out:
>> +		spin_unlock(&rq->lock);
>> +		return entity;
>> +}
>> +
>>   /**
>>    * drm_sched_job_done - complete a job
>>    * @s_job: pointer to the job which is done
>> @@ -803,7 +927,9 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>   
>>   	/* Kernel run queue has higher priority than normal run queue*/
>>   	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>> -		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
>> +		entity = drm_sched_policy != DRM_SCHED_POLICY_FIFO ?
>> +				drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
>> +				drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);
>>   		if (entity)
>>   			break;
>>   	}
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 599855c6a672..e3fdfb757d61 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -50,6 +50,13 @@ enum drm_sched_priority {
>>   	DRM_SCHED_PRIORITY_UNSET = -2
>>   };
>>   
>> +/* Used to chose between FIFO and RR jobs scheduling */
>> +extern int drm_sched_policy;
>> +
>> +
>> +#define DRM_SCHED_POLICY_RR    0
>> +#define DRM_SCHED_POLICY_FIFO  1
>> +
>>   /**
>>    * struct drm_sched_entity - A wrapper around a job queue (typically
>>    * attached to the DRM file_priv).
>> @@ -196,6 +203,21 @@ struct drm_sched_entity {
>>   	 * drm_sched_entity_fini().
>>   	 */
>>   	struct completion		entity_idle;
>> +
>> +	/**
>> +	 * @oldest_job_waiting:
>> +	 *
>> +	 * Marks earliest job waiting in SW queue
>> +	 */
>> +	ktime_t				oldest_job_waiting;
>> +
>> +	/**
>> +	 * @rb_tree_node:
>> +	 *
>> +	 * The node used to insert this entity into time based priority queue
>> +	 */
>> +	struct rb_node			rb_tree_node;
> I'd probably call it "rb_node", shorter--it's up to you.
>
>> +
>>   };
>>   
>>   /**
>> @@ -205,6 +227,7 @@ struct drm_sched_entity {
>>    * @sched: the scheduler to which this rq belongs to.
>>    * @entities: list of the entities to be scheduled.
>>    * @current_entity: the entity which is to be scheduled.
>> + * @rb_tree_root: root of time based priory queue of entities for FIFO scheduling
>>    *
>>    * Run queue is a set of entities scheduling command submissions for
>>    * one specific ring. It implements the scheduling policy that selects
>> @@ -215,6 +238,7 @@ struct drm_sched_rq {
>>   	struct drm_gpu_scheduler	*sched;
>>   	struct list_head		entities;
>>   	struct drm_sched_entity		*current_entity;
>> +	struct rb_root_cached		rb_tree_root;
> I'd probably just call it "rb_tree", shorter--it's up to you.
>
> Regards,
> Luben
>
>>   };
>>   
>>   /**
>> @@ -314,6 +338,14 @@ struct drm_sched_job {
>>   
>>   	/** @last_dependency: tracks @dependencies as they signal */
>>   	unsigned long			last_dependency;
>> +
>> +
>> +	/**
>> +	 * @submit_ts:
>> +	 *
>> +	 * When the job was pushed into the entity queue.
>> +	 */
>> +	ktime_t                         submit_ts;
>>   };
>>   
>>   static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
>> @@ -503,6 +535,9 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>   				struct drm_sched_entity *entity);
>>   
>> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts);
>> +
>> +
>>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>>   			  enum drm_sched_priority priority,
>>   			  struct drm_gpu_scheduler **sched_list,
