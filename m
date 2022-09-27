Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E97E5ED152
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 01:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856EB10E1BC;
	Tue, 27 Sep 2022 23:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2048.outbound.protection.outlook.com [40.107.96.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1190B10E1A3;
 Tue, 27 Sep 2022 23:56:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+lFq6/s3mJDNBJrvMkgAyTjFspqGbcKkMpXkkEqwEVMyFGY7WBhcO38JScWs38iip925IrWJROT12newkSPc5PYkXYiKeLFDxwDtFawHybYqKc0K55MO6yIHUvRXQhNUVOFs6k2kxO25D46SsabL989GumWdyjUkFTgUswXBM/m3Z0fBiteGriEsLkUhRZOTMJBCgLvh9ST8ptGl1Hz3HKin6Oc1QJispXPuidYXoO6lXxhxtOrMF/sV4vOvSR/M+fRAidUFn55JmhRJ3UsisvbgfiBQz1jgXSyxN3R30NeysxmJpQxxfr29b68dJXPRjPBJB8eKKuARnzyTNgYsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvCIMtfaYVRmZk03Qtgr57wUiF6yQoyV2tTjZsyeH6E=;
 b=e+OXu6oXSEsOi9dzGJ2OxhE8iHF2cqOrG4qRIR3v6hkfDr0O5wQT+SwDbjH6rTf06fAXoKh/xYLjfWv8TrlGaxOQuAl8KRgCDcASxxqnKsVTNUxK2aOeNe2AxGqHMUN8/UKNft5tDeRlXZD76Aw7TvT9AnZDq0FWDj/4G5xF5905Efkn5mi6iuaR7FtUgfG6XV0iVcL5yl2ZwzT4+1VnXV94W1Tv7QWdLpLOl+zFiSTt6ubcBfqFjA3shFODb8tvrnjpbrdE/GFTx20ciz/CJnoyH1XJAajn+No872yjD4Nt142+iyb55i4auCQztuyya9bZ7y2SFMkyr1NXV16xaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvCIMtfaYVRmZk03Qtgr57wUiF6yQoyV2tTjZsyeH6E=;
 b=21/c1CcFDkjlH3q8bGTIk3GpbX5mOFbkQ48vPEcIpIUEu12lhn9jfFvW8dfg2aW/fY3lzeat0TfEq6ivROxaBRwcGEPToSYCuztnZcWi3e2kgHhiVQ8FMIreZj6PdDp0WGarKiyHo15R6aHDPgS8NDKy7Q+OJpVZaxX9c1MYKtw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3375.namprd12.prod.outlook.com (2603:10b6:208:cc::12)
 by MN0PR12MB6270.namprd12.prod.outlook.com (2603:10b6:208:3c2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 23:56:22 +0000
Received: from MN2PR12MB3375.namprd12.prod.outlook.com
 ([fe80::e506:7427:7aca:e6ab]) by MN2PR12MB3375.namprd12.prod.outlook.com
 ([fe80::e506:7427:7aca:e6ab%4]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 23:56:22 +0000
Message-ID: <7e9ca77b-80a1-57d3-f505-d1761c38c5ee@amd.com>
Date: Tue, 27 Sep 2022 19:56:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4] drm/sched: Add FIFO sched policy to run queue v3
Content-Language: en-CA
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20220921182831.25214-1-andrey.grodzovsky@amd.com>
 <5c3e72bb-0df7-b76c-1679-5bbb571e4a2c@amd.com>
 <43891f6c-615b-3b5e-204d-b0815dc858cf@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <43891f6c-615b-3b5e-204d-b0815dc858cf@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::30) To MN2PR12MB3375.namprd12.prod.outlook.com
 (2603:10b6:208:cc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3375:EE_|MN0PR12MB6270:EE_
X-MS-Office365-Filtering-Correlation-Id: f4181a6b-98b5-476c-1498-08daa0e3e112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RXV92faOGrdqj1G1OCcJGQ5m25QdIVaRw+lvpPh5hU5gMHI1YrFTA0/JN2jjY3ojSn+cuIH8+7e3UKHTcgjr8cOl9GpN4I1X1Q8eHImxc9tvzbx3ranba0WkIC+9g0VMr7H1xGlwboQI4Ede6j9E1rVVEmXmj7NpybWgya+mpClGZDQWs6MLaHT2D005lQag3UZRFy0FIWosEFHY6xrXijZ6tYMiQdHOThjUgRjpwrpJikO4rocREgIRsSEZ927L7MUAv94FQyOO/Mhkwja5mIgBEHqvRI9fP/S54fE1fpvL2Xx1OrFkgBNKCVf4mFVFXRraMlTd7jhn5HyqEcFr2N7OgRFA+F9K8LvNU8FKs+v7Dqo0Z/5XBzw96pNaUsOIveNOl0GfziJpMR9l+r54w8KAUNBaFQ42ceF3bBztqgYT2rFdRLog1PL6C/z5DG6vEdpkXP1YzLF0ZMqCoD0C4l4TBXpXm9OcyTRGc8v84nrsXkM15vzVWbL2xF51sndVj2v3JlnHHpw/EMuuQHKcA9dlvASbqnn3eXSTanlEPUOWiU8H7ay9DFANqF8+g8vwqsY/Kmda/66S/D/myl10V2qFtfbKn1xZYMFZp2qc1uPeCiIxNvo6J0vCs01B4yT5mmK7gSxg7gAVpgae66BdaSIn4Yh1Ztk+Rm3QJgldvB1ITWcmnzR+wBMD2aMc8tG1dLji6ToRibVs51XFdURs+gefkU/2mv9neIraUV1XKGPVUSUU4VCEMrTY4jLosRydM5NL4cAMJ77ORZyHMKquYEX4JllllTf5K5vnqcjG8gA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3375.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199015)(5660300002)(30864003)(44832011)(41300700001)(6666004)(53546011)(6506007)(8676002)(26005)(8936002)(6512007)(316002)(6486002)(86362001)(83380400001)(31696002)(36756003)(478600001)(31686004)(66556008)(66476007)(4326008)(2616005)(186003)(66946007)(2906002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azZ1b1JaMVBvT25KekFMNjNIYXNCbVNtTWdlMTVpdmpnWDN5UzBhUnBsdnkw?=
 =?utf-8?B?YytudSszaWltNFE5U0JRa25xdkh1TkhCUVRQU2doVlV5UnNiR2RqT0lkSlhZ?=
 =?utf-8?B?Mkg4cysxbW1oTGNYK1FjWGV0cXJ1ZVVLVTRtZHdhcjdOTEtzNldYODhsWkFh?=
 =?utf-8?B?QkREem16QXdxTWZ3OGVpdEtlZnB1QjJ2RWpCUUFPZG9Bejkrd0FTWXVaUmlw?=
 =?utf-8?B?a1duZHROVGdYd2lCS3EvUUhGSXNFdzc4VFBUK0lkcGhmR2JJNWdweis1cW51?=
 =?utf-8?B?RHdBZ2tyR29iRStBRzVNUlhNVVh4SmZxN3N2UkNpTDdLQ0xtL01UcWlNdURy?=
 =?utf-8?B?QzZyTTVNUWpvRG1aeXQ2SlY2aTVoZXVZS2UvbXd1Q2I4amw1U0o4dVJPSG00?=
 =?utf-8?B?RHZGMENCL0I5aE5FVG1MQmxWbnpqZUhWalFCM2VYM09XVGRwME5heWoxQ0ov?=
 =?utf-8?B?aDVjZFJuZzVLMFJmZFMxK3hoOWluZDZzeWNmMnRoNkd2QmdoRy9yTkVWQlVh?=
 =?utf-8?B?emt6RU1tTHFZQzluV0l0TVJ2Z1lDdWVoRm1oaU1oY2tqRzVEQUNBM3pEMy9t?=
 =?utf-8?B?clZRZlRHTG9JOHlWVEhvb2FzQTgxeURlL1VFTXlDVGJ0dE9WL2VlcERLN1ZL?=
 =?utf-8?B?QmtCTFBqZUFuMHBwSEpEKzRoZ2Vkc2swRzB6bVNPZXBGSytRTGx6dTFtYXpY?=
 =?utf-8?B?NDc1MnRIS3ptMnV6M3FwakxKMU40VnBDYnFTdDEranFNajlxeWo1cDZudk8z?=
 =?utf-8?B?TnVYZ0xadEpleXJJeTNoSGxjYUpqUGttU2o0UE1hSW1lQUgzYUdYZFozVkNz?=
 =?utf-8?B?QmlHK2h5akM3OVlaajMySGYvbjdFaVhhc1hxek1mSnN2S2JKbVVFT045cmp1?=
 =?utf-8?B?dFowbjArY1ZoUWZGR2pqRGg4NjczWVFkY0xnSk9Ra21adW53b2szUFdEV0po?=
 =?utf-8?B?NXJneHFVTFhyanMxNlJzZnFpL28rdGNBcElkbHQyR1hJRUlnM0FSRGpYbCsx?=
 =?utf-8?B?a01RbU9DOXBWZjF4TzdNRFdIbXFoY2pMelF6dkl2dXdYdG82RW1KMVpHdm05?=
 =?utf-8?B?NlRUR2JBemJKaThNL04zZ09ZUFNnby9oQ2NYaFNYT0xNQ3VmOGN1SkkyQ3Ir?=
 =?utf-8?B?NXpHMnpUeStPWWRSQm1IanV1THUzTzg5Vm1iQ2lkT2ZrMUdXYzhGbDdFalVn?=
 =?utf-8?B?L21OU1ZPMVA2RWhQM0VHRjg5REI4UXcxQm5Sa1VwZVArTXJNN0VOM25Uamh3?=
 =?utf-8?B?T1VoU2xUVnpzRGcrdGVKZ2huc0tpSmlXTlB5Si92R1JaVFFMSW5SRHpyaS9j?=
 =?utf-8?B?cXVmME1Da0s5NHhNVzY2WlVDMS9KVm0rTjdWMHdLUytZSUdDRURKSGw2eXJG?=
 =?utf-8?B?YTc3c0ZXaElYL2tEdjJOaks5SmtJSURyOWlVR2I5QXVKVUh3bVM1TmtrdEhx?=
 =?utf-8?B?ZEFaU0wyRVdueGRoNzR0SzVNTUR0eERScnduWlJQWk9pQ2FQdnVSOGFzeFN0?=
 =?utf-8?B?Ykowd0FUSTFJclRMbGI3ZDFaNGY3YkMvQlZFZ3RrcGdxZ2d1cWU0VHhLMlZv?=
 =?utf-8?B?emQyUmVCdU1EemF4NGNobGJMS1BmeTM0SVM0OCtKbEtJcktqdzdqbnZnWEVE?=
 =?utf-8?B?dVdBeHJiZjhXSHVQeXFGeEVRZy9uOER0czlSdHRQZzM3aWN6eXJVcmg5NUdD?=
 =?utf-8?B?TTY0VHpCYStYaUNQRHMwVGc5UnpjejNhbzBxZXNkSFBzNGtJaGxRVXNCTERw?=
 =?utf-8?B?dmtkOTU2RFZmL2xocWxVcUtUendTeDdvN3Z0M1Y3eFMvOWRuUTVab0hpZXp5?=
 =?utf-8?B?TFZRSVJ3dE83SzZMaGNnRjI4Q0x1TlBiVCtoU2JWY0dIVjhXb1I5VCs4dFA3?=
 =?utf-8?B?NTZsMzA1RXRMUzBlUk9oUlhkNHlqY0RQRWFra1A4UHkvd0NIOVJHMmdnRHlk?=
 =?utf-8?B?YWkyNllqVVJrenM3UHVZcnRSc2k5MUtWMFlVbUFwMWx2bW1iaTgwUUx6Qjds?=
 =?utf-8?B?YVNyLzZ0OGIxN3A0NEpDTTlCbnM3cDZrWXpZMEljUlZzN3lnZW1EVDBqL1VY?=
 =?utf-8?B?V0E1eHZKcWsrWWV1Nm9ENDNNc2l6bWVxVHYzeHZoN3VZTGl3Q25XN0tkamNt?=
 =?utf-8?Q?y1kNGq32nKdRQTCf9O0G6XmLM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4181a6b-98b5-476c-1498-08daa0e3e112
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3375.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 23:56:22.2456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGnXE65C4IaPBUDldwUuqErNDgnHvS5noPpFCbtpZpqQN9BEp21KKJHQ8WcqsnZo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6270
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

On 2022-09-22 12:15, Andrey Grodzovsky wrote:
> 
> On 2022-09-22 11:03, Luben Tuikov wrote:
>> The title of this patch has "v3", but "v4" in the title prefix.
>> If you're using "-v" to git-format-patch, please remove the "v3" from the title.
>>
>> Inlined:
>>
>> On 2022-09-21 14:28, Andrey Grodzovsky wrote:
>>> When many entities competing for same run queue on
>>> the same scheduler When many entities have  unacceptably long wait
>>> time for some jobs waiting stuck in the run queue before being picked
>>> up are observed (seen using  GPUVis).
>> Use this as your opening:
>>
>> "When many entities are competing for the same run queue on the same scheduler,
>> we observe an unusually long wait times and some jobs get starved. This has
>> been observed on GPUVis."
>>
>>> The issue is due to the Round Robin policy used by schedulers
>>> to pick up the next entity's job queue for execution. Under stress
>>> of many entities and long job queues within entity some
>>> jobs could be stack for very long time in it's entity's
>> "stuck", not "stack".
>>
>>> queue before being popped from the queue and executed
>>> while for other entities with smaller job queues a job
>>> might execute earlier even though that job arrived later
>>> then the job in the long queue.
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
>>> Various cosmetical fixes and minor refactoring of fifo update function. (Luben)
>>>
>>> v4:
>>> Switch drm_sched_rq_select_entity_fifo to in order search (Luben)
>>>     
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_entity.c |  26 +++++-
>>>   drivers/gpu/drm/scheduler/sched_main.c   | 107 ++++++++++++++++++++++-
>>>   include/drm/gpu_scheduler.h              |  32 +++++++
>>>   3 files changed, 159 insertions(+), 6 deletions(-)
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
>>> index 4f2395d1a791..565707a1c5c7 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -62,6 +62,64 @@
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
>>> +		 "specify schedule policy for entities on a runqueue (DRM_SCHED_POLICY_RR = Round Robin (default), DRM_SCHED_POLICY_FIFO  = use FIFO");
>>> +module_param_named(sched_policy, drm_sched_policy, int, 0444);
>>> +
>>> +static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>>> +							    const struct rb_node *b)
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
>>> +		      drm_sched_entity_compare_before);
>>> +}
>>> +
>>> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
>>> +{
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
>> I thought you were going to drop one of the locks here?
>> Address this by either updating the comment to explain to future programmers
>> what is going on here and why the locking is not consistent (2 vs 1 lock),
>> or drop one of the locks, as per my previous review.
> 
> 
> Note that after last review drm_sched_rq_update_fifo_locked is not 
> called anywhere
> besides drm_sched_rq_update_fifo and so becomes obsolete and I will 
> remove it now.
> In this case the double locking above is consistent and the reason is 
> explained in the
> comment above.

WHen you say "it's consistent" you mean it's being done from other places, I suppose.


> 
> 
>>
>>> +
>>>   /**
>>>    * drm_sched_rq_init - initialize a given run queue struct
>>>    *
>>> @@ -75,6 +133,7 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>>>   {
>>>   	spin_lock_init(&rq->lock);
>>>   	INIT_LIST_HEAD(&rq->entities);
>>> +	rq->rb_tree_root = RB_ROOT_CACHED;
>>>   	rq->current_entity = NULL;
>>>   	rq->sched = sched;
>>>   }
>>> @@ -92,9 +151,12 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
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
>>> @@ -111,23 +173,30 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>   {
>>>   	if (list_empty(&entity->list))
>>>   		return;
>>> +
>>>   	spin_lock(&rq->lock);
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
>>> @@ -163,6 +232,36 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>>   	return NULL;
>>>   }
>>>   
>>> +/**
>>> + * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>>> + *
>>> + * @rq: scheduler run queue to check.
>>> + *
>>> + * Find oldest waiting ready entity, returns NULL if none found.
>>> + */
>>> +static struct drm_sched_entity *
>>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>> +{
>>> +	struct rb_node *rb;
>>> +	bool found = false;
>>> +	struct drm_sched_entity *entity;
>>> +
>>> +	spin_lock(&rq->lock);
>>> +	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
>>> +		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>>> +
>>> +		if (drm_sched_entity_is_ready(entity)) {
>>> +			rq->current_entity = entity;
>>> +			reinit_completion(&entity->entity_idle);
>>> +			found = true;
>>> +			break;
>>> +		}
>>> +	}
>>> +	spin_unlock(&rq->lock);
>>> +
>>> +	return found ? entity : NULL;
>>> +}
>> You really don't need "found", and you don't need "entity" to be outside the loop.
>>
>> As per my last review, use this (which I've compiled and run):
>>
>> static struct drm_sched_entity *
>> drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>> {
>> 	struct rb_node *rb;
>>
>> 	spin_lock(&rq->lock);
>> 	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
>> 		struct drm_sched_entity *entity;
>>
>> 		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>> 		if (drm_sched_entity_is_ready(entity)) {
>> 			rq->current_entity = entity;
>> 			reinit_completion(&entity->entity_idle);
>> 			break;
>> 		}
>> 	}
>> 	spin_unlock(&rq->lock);
>>
>> 	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
>> }
>>
>> The only way we can exit the loop is,
>> 1. The loop invariant is false, i.e. rb == NULL, or
>> 2. The "break;" jump from inside the if () inside the loop.
>>
>> Also note that "rb" does NOT need to be initialized, since, the for() statement
>> is always executed, and the assignment "rb = rb_first_cached(&rq->rb_tree_root);"
>> initializes it--this is why GCC doesn't complain :-)
>>
>> Also note that you don't need to export "entity" as it makes the for() loop relocatable
>> to another function with only having a dependency on "rb" being defined--the loop
>> is self-contained.
>>
>> At the "return" statement, we know that we've exited the loop, by either the loop
>> invariant being false, i.e. rb == NULL, or by the "break;" jump, in which case
>> we know that rb != NULL. This is why the "return;" statement as presented above works
>> correctly.
>>
>> Please use that function in the way it is above, which is minimal and mature.
> 
> 
> Makes sense, missed the point that at the end rb will be set to NULL

Yeah, use the loop as I've written it above.

Okay, send out v5.

Regards,
Luben

> 
> Andrey
> 
> 
>>
>> Regards,
>> Luben
>>
>>> +
>>>   /**
>>>    * drm_sched_job_done - complete a job
>>>    * @s_job: pointer to the job which is done
>>> @@ -803,7 +902,9 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
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
>>> index 599855c6a672..1f7d9dd1a444 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -50,6 +50,12 @@ enum drm_sched_priority {
>>>   	DRM_SCHED_PRIORITY_UNSET = -2
>>>   };
>>>   
>>> +/* Used to chose between FIFO and RR jobs scheduling */
>>> +extern int drm_sched_policy;
>>> +
>>> +#define DRM_SCHED_POLICY_RR    0
>>> +#define DRM_SCHED_POLICY_FIFO  1
>>> +
>>>   /**
>>>    * struct drm_sched_entity - A wrapper around a job queue (typically
>>>    * attached to the DRM file_priv).
>>> @@ -196,6 +202,21 @@ struct drm_sched_entity {
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
>>> +
>>>   };
>>>   
>>>   /**
>>> @@ -205,6 +226,7 @@ struct drm_sched_entity {
>>>    * @sched: the scheduler to which this rq belongs to.
>>>    * @entities: list of the entities to be scheduled.
>>>    * @current_entity: the entity which is to be scheduled.
>>> + * @rb_tree_root: root of time based priory queue of entities for FIFO scheduling
>>>    *
>>>    * Run queue is a set of entities scheduling command submissions for
>>>    * one specific ring. It implements the scheduling policy that selects
>>> @@ -215,6 +237,7 @@ struct drm_sched_rq {
>>>   	struct drm_gpu_scheduler	*sched;
>>>   	struct list_head		entities;
>>>   	struct drm_sched_entity		*current_entity;
>>> +	struct rb_root_cached		rb_tree_root;
>>>   };
>>>   
>>>   /**
>>> @@ -314,6 +337,13 @@ struct drm_sched_job {
>>>   
>>>   	/** @last_dependency: tracks @dependencies as they signal */
>>>   	unsigned long			last_dependency;
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
>>> @@ -503,6 +533,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>   				struct drm_sched_entity *entity);
>>>   
>>> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts);
>>> +
>>>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>   			  enum drm_sched_priority priority,
>>>   			  struct drm_gpu_scheduler **sched_list,
