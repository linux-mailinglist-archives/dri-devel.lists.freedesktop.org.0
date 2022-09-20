Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9B85BDAB1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 05:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C617010E257;
	Tue, 20 Sep 2022 03:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC8210E18A;
 Tue, 20 Sep 2022 03:11:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RI53e+497ZtbM/G5xPoSlUVZsBS5TQNql1eGVd3rF1I/7OZ69JFu9FFxGXmy2KKICrkeYQ8L0iJ7BjdNJfPmUugm5poV1zs7HplYwIe7iQ5HE+IPwt2f28i5Ehom7pYrqEe8IZWam+N2Rfpl6O7Urs0SgJQDYSfJsP0kVEoySLjKjlNLZM17Z2q9pLktwIe035R8yv5d4NAFTZpdgegCOAG1VLQcL/ImS6OhhpBFcUZQlK61vb2sc1B2cMRF6SUoqOJ2iMu9jjjjJYgdD19XtAlfM9YvSVAQieXp5OhY8/Umn/U62+z4C58cDdu35Nc1+As9bJ8XGB7z9ZiozaHL5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tkbaW2KkifxGRgV83HAI4kqvBtiVw8t2e+sfggdDVI=;
 b=DtdtiJxrm2X5o1xg1F5rMXXvMG5fIZXIXQOxU9eLiqNNF9jr8ZE4ZRiOuxHJazXYxGtA/9R82AabgQ8xvbpXyxG7VLLUReeKrmKpXTVHxxZ875XRHh8LooijveCRdjlgtuW3fKYZf4hwAhC58OF2DL+X6QD10XU69iWa892BycDs4XiXDlnuW+vSCh5+0y8PwLxA+ygH/SrF4ZfnkBhXRW4YHg04+VImPAwb9QSsTNBmWk+dST5DVCyTNYTJ0FsGxb1I46/q46G48+yFzvf0vkGgY21LIn3fNg7JmzQtL6bnrsm2n6+xHPFGCNFG1M18hEN1sXTAfjk0jttebL1Ohg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tkbaW2KkifxGRgV83HAI4kqvBtiVw8t2e+sfggdDVI=;
 b=FiZdJ/44zNBpTcwhc0rGk8BlVjgjqovDELvFhs8Db4s3L3DEXcYZLGLsl4C8bSd/Q7uitc1WacOChn6FebBS0PIb6VX5aaTN085L5Np61y0f2vXADzyiVXmry8lDZlz92c9VjRUXfpAFcONy4f7sXzoI8jCRJDycvdOY2PuqRRY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SA0PR12MB4479.namprd12.prod.outlook.com (2603:10b6:806:95::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.21; Tue, 20 Sep 2022 03:11:41 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::c549:82d4:60d9:2a8a]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::c549:82d4:60d9:2a8a%3]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 03:11:34 +0000
Message-ID: <d227810a-e39a-dd86-2954-a9df0904cbdc@amd.com>
Date: Mon, 19 Sep 2022 23:11:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v3] drm/sched: Add FIFO sched policy to run queue v3
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20220913204025.1473086-1-andrey.grodzovsky@amd.com>
Content-Language: en-CA
In-Reply-To: <20220913204025.1473086-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0077.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::16) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SA0PR12MB4479:EE_
X-MS-Office365-Filtering-Correlation-Id: 529a5f80-5a02-4999-ccb7-08da9ab5d2ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +14RBV3ynoT4SziX8B19mRjXGly/20LIHJ2pycZpT3GSdTrox+ovXLoAC2htQGCf7QRLEj+xtEQinUwlG/z7OsX1RPfL74QNBFKqWhBf/85+QyO8j9yYqrNQD8JpL0PynwiV7c1a7gDb6tMmCp4koXbyTDgGgBuOyBdIfEOdB6u0OGHclpnBkUDxLF/2eTN0CrnpL1afKwUolZY5b839vtDMbIqjhzZIo0R/r7WkfLDEuNp+ubp9rU6u2QOTj/sAkbpUK4MjeGocAJ3pc04AHp4w+k8NOC1ujI4n/nfNnMifMcLwX2+YmIvi30f5UQNk2nEPKd36oZRJLmjETjR5e9llhpBtCMHp2mvSj1yIIXrgUMaOFU/wllVEdbMx3FDSKrP0VlJwQ166KCHLMrpP5U5SXJ4jWogprgxFqD4pAnwVpGm9K0sjvTGeUtp0dW/J6F8iYIC4weLkVljzkqfMwxO+pO6C6N11Q/qrv8t1LFXQylU3zG+u1+mmivgbUPuu5gtqyKD3Nanxxu8hi3L64pC7jcpsHGXNvqIiX7eD4D7d5vG20IKc6QrPQtvn/C5JZRDtw3azl11DiWgqaC0uHleuFqBpoe/pdmBEkj9ZaNxtek2Kh79z0pQkA7ktkjDFyqGJZmezHxCsI/jdSKVp2srB7coLJi39+J6NlWXQB37op3Xx4uWNQ0ubhPqQ9P+Y1IiqiO4M5Ol/rcrAnQyyLt9jEadidAnzaMtH3iGpIu49mAS4IoHAjjA0MINF/RoUqDzHwCndwHjpW9fuSv5PXgt7N+VOH8PTIc75dGxmrVE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199015)(2616005)(2906002)(44832011)(53546011)(41300700001)(6506007)(6666004)(4326008)(30864003)(8676002)(83380400001)(66476007)(66556008)(66946007)(316002)(6486002)(5660300002)(31696002)(86362001)(186003)(36756003)(8936002)(478600001)(6512007)(26005)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDVaVE1obDFhZW13cyszVm9uM3BPL3M4ZG52MENMU0hJWmlQcVB4dE9xZVlh?=
 =?utf-8?B?Tjk3bUd5ajJKZi9neEY2MHArZDBDRmNqRlhMMnVHNTRVRjZmbnBHcDZMalF6?=
 =?utf-8?B?OVZOd2xiQlhWZmRLeGJEa2JMVHkxUUtQd2RmTTVzRkc4LzVnVi9Yek1sYVBv?=
 =?utf-8?B?NWdxUTZVOGZUc3BNSDVXRkt4a0h4ZzFHd0lJdjFDT0dXTDl2d3h5YkdQdXZ1?=
 =?utf-8?B?Wlg3YmMvWmZKR1k3dFBUZFdaM3ZPZGZYRFBJUzhpTDVFNFJQMmZWT2Q1VzFm?=
 =?utf-8?B?WURhYUIvMjN4a2lEM09yNmVHUUhQd0F5aEd6cXlaZUx1VGkramUrNHhiUW42?=
 =?utf-8?B?V3RWSHhtTHRUK1lJZ3prM25wWFFWUlJDM3VyL2FxaFJIVTZ5a29WOTFIemRa?=
 =?utf-8?B?dmNnVndGTkRDN0FPMXMvR2JIZkhLZ2xBUU92TlZnank4b3FCTmNOUzhySjNL?=
 =?utf-8?B?ZGVlVjZGMkNXaW1pVmN1TmJkK0MwMEhNZmtPaEx5L3ovdXRXM3VleVlQK0ZF?=
 =?utf-8?B?b2ltTzJ3TStjenV6YXkrMEZMNnFnUUpoOFg3VEZUQXJkVHp3TEgxQ002WUdI?=
 =?utf-8?B?dFRyWE1pdTJ4dHV0bmwvVy9aQ3pXbDBiWFc0a1h1aGQ3S2VPQ3BMKzRpUHc0?=
 =?utf-8?B?M25ILytLT25ldEdDN05aK1ZlRHc0bzgyQkxRS0ptOUhnM28waTJpd3lCbmtD?=
 =?utf-8?B?N0ZiNjg2SDAxY0VFK213Yit6Zk1nanVKbmJpNWlLOEZKMDhMWVlUaXJlWE9U?=
 =?utf-8?B?TW5VcUdNSzhFNUZGc1BoaFdPTG91WGUwSEhTa3Fvbmk0U0xmMThXTWowcHZ1?=
 =?utf-8?B?QlhNMUFidk85V0xrdzh2UmR0Uk9JYysxNkwxQ1RmR0NRS1VZbnIybEpSTG12?=
 =?utf-8?B?KzByeEg4bTVILy9wbXd5T2NnRGVFVk1ZVkIwOFZhdUNmdVI3Ky9FVVpVV3hV?=
 =?utf-8?B?WTQ2UlJadWZLUFlaRHF1RWpMSUhIajZwTWFwM05TdVQvUVU0Z1BCN2NsV1pD?=
 =?utf-8?B?S2xQMWFQcVdQNHl5YnhSWWNQUW9FT1dGQ2xXY0RXYm1qWkhSNjdDQkFneDNp?=
 =?utf-8?B?NG5odnJhMldVSktCekxveUdYUTYrd0ZYallzbWQ0Q1I0Y3BEaXRMQzZ5blRN?=
 =?utf-8?B?RkZXQXlFbERhN3ppSERPVkI1TDF4VGc3UTFyazlIb0grMnNDOXFvalcrWVgv?=
 =?utf-8?B?d0JuRWxhbDdpeGNZZE5xNzVkTW9Fdm93VUJwcWtxUFpTdFg4S0JYU3UrS2I0?=
 =?utf-8?B?MXd2Y29NRU85T09LbEZTZHAwaThLbmFocUpmRUFtOUxmWGRTeWx6Znd6RzFx?=
 =?utf-8?B?cTBBa0Y3ekphUjBjUk93NXpIa3lpb0hFK1paWXgxbnFjTklWSnFYaUJTV09o?=
 =?utf-8?B?WVp6ZGZ1Z0VPTXZ2U0ZHU2Y1VFRnelpqdXJYYzNseG00R0c3SkJkdDRqenBN?=
 =?utf-8?B?cFRyOWZBbTRRMzdxMFgxRDlVS3ozSUJhN1JHUll5blF1Sml4MHJ3bGthT0or?=
 =?utf-8?B?Yko3YkczN1dXTGJ1WWJrOXQ4TEFRakpMRGNXRGVFNDEyUE5WWWRGUFMvVWND?=
 =?utf-8?B?b04xT3FGNG8xTVZWQUtSZm9kbTMxU1lHc0tua1FHR0k5L0duWWVrd3IwY290?=
 =?utf-8?B?TGJET0Mvby9NS1VzYjM5S0M2OGxJS1JUeXJ4TUN2QW5IRkNmMEVmTy9NNlow?=
 =?utf-8?B?SjFYUWE4ajZuTG14aEtWdnYydHUvY3lkZWJNZDF6RWp6SlBRMFFmUFNucHEz?=
 =?utf-8?B?N2JnQS9BWnNrNWJ0VnNycG11TFdCblRSSWt3QWZSWWpmZXVicGk2NWdYNm52?=
 =?utf-8?B?dG4wUys3V3c4ZGFXNHM5MG5WYU5SZGkvZzdpVnBsbU1Ka0JscGE4WEVNTGxx?=
 =?utf-8?B?US84R2ZJV0VhcG9ZdCt6YzNCaENGWXdlUXZPbEwxbWt1NmlOZWNyRmVEM2lP?=
 =?utf-8?B?cVFwMU1hTk9wNmhWL3AwV3VMcTlnUndHT1JITWVrZTN6NVpQR2FJZ0N5RlNx?=
 =?utf-8?B?R1cvS0Y0NjhpcFd0YmtrbXI0N2xmeGlSVG94clI3cDJyN2hkclRLMGg0WGVI?=
 =?utf-8?B?eEFBWUhobDc3WjZiRTZPOUVMT3B4TGRzR0NJTUpmOE9waGlQVXpQNXgxQmtV?=
 =?utf-8?Q?FU8VvUJcr9v3ZzGQqzmygamle?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 529a5f80-5a02-4999-ccb7-08da9ab5d2ec
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 03:11:34.6244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6mNLgZPWmaIXz1cjJ3U7y0l120hrxu7IgU2ZbVo11D2aNf8f6K8YeoYS5J0s1zF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4479
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

Please run this patch through checkpatch.pl, as it shows
12 warnings with it. Use these command line options:
"--strict --show-types".

Inlined:

On 2022-09-13 16:40, Andrey Grodzovsky wrote:
> Given many entities competing for same run queue on
> the same scheduler and unacceptably long wait time for some
> jobs waiting stuck in the run queue before being picked up are
> observed (seen using  GPUVis).

Since the second part of this sentence is the result of the first,
I'd say something like "When many entities ... we see unacceptably long ...".

> The issue is due to the Round Robin policy used by schedulers
> to pick up the next entity's job queue for execution. Under stress
> of many entities and long job queus within entity some

Spelling: "queues".

> jobs could be stack for very long time in it's entity's

"stuck", not "stack".

> queue before being popped from the queue and executed
> while for other entities with smaller job queues a job
> might execute earlier even though that job arrived later
> then the job in the long queue.

"than".

>    
> Fix:
> Add FIFO selection policy to entities in run queue, chose next entity
> on run queue in such order that if job on one entity arrived
> earlier then job on another entity the first job will start
> executing earlier regardless of the length of the entity's job
> queue.
>    
> v2:
> Switch to rb tree structure for entities based on TS of
> oldest job waiting in the job queue of an entity. Improves next
> entity extraction to O(1). Entity TS update
> O(log N) where N is the number of entities in the run-queue
>    
> Drop default option in module control parameter.
> 
> v3:
> Various cosmetical fixes and minor refactoring of fifo update function.
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c |  26 ++++-
>  drivers/gpu/drm/scheduler/sched_main.c   | 132 ++++++++++++++++++++++-
>  include/drm/gpu_scheduler.h              |  35 ++++++
>  3 files changed, 187 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 6b25b2f4f5a3..f3ffce3c9304 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -73,6 +73,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  	entity->priority = priority;
>  	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>  	entity->last_scheduled = NULL;
> +	RB_CLEAR_NODE(&entity->rb_tree_node);
>  
>  	if(num_sched_list)
>  		entity->rq = &sched_list[0]->sched_rq[entity->priority];
> @@ -417,14 +418,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  
>  	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>  	if (!sched_job)
> -		return NULL;
> +		goto skip;
>  
>  	while ((entity->dependency =
>  			drm_sched_job_dependency(sched_job, entity))) {
>  		trace_drm_sched_job_wait_dep(sched_job, entity->dependency);
>  
> -		if (drm_sched_entity_add_dependency_cb(entity))
> -			return NULL;
> +		if (drm_sched_entity_add_dependency_cb(entity)) {
> +			sched_job = NULL;
> +			goto skip;
> +		}
>  	}
>  
>  	/* skip jobs from entity that marked guilty */
> @@ -443,6 +446,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  	smp_wmb();
>  
>  	spsc_queue_pop(&entity->job_queue);
> +
> +	/*
> +	 * It's when head job is extracted we can access the next job (or empty)
> +	 * queue and update the entity location in the min heap accordingly.
> +	 */
> +skip:
> +	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> +		drm_sched_rq_update_fifo(entity,
> +					 (sched_job ? sched_job->submit_ts : ktime_get()));
> +
>  	return sched_job;
>  }
>  
> @@ -502,11 +515,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  {
>  	struct drm_sched_entity *entity = sched_job->entity;
>  	bool first;
> +	ktime_t ts =  ktime_get();
>  
>  	trace_drm_sched_job(sched_job, entity);
>  	atomic_inc(entity->rq->sched->score);
>  	WRITE_ONCE(entity->last_user, current->group_leader);
>  	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
> +	sched_job->submit_ts = ts;
>  
>  	/* first job wakes up scheduler */
>  	if (first) {
> @@ -518,8 +533,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  			DRM_ERROR("Trying to push to a killed entity\n");
>  			return;
>  		}
> +
>  		drm_sched_rq_add_entity(entity->rq, entity);
>  		spin_unlock(&entity->rq_lock);
> +
> +		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> +			drm_sched_rq_update_fifo(entity, ts);
> +
>  		drm_sched_wakeup(entity->rq->sched);
>  	}
>  }
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index e5a4ecde0063..72f7105e0b16 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -62,6 +62,65 @@
>  #define to_drm_sched_job(sched_job)		\
>  		container_of((sched_job), struct drm_sched_job, queue_node)
>  
> +int drm_sched_policy = DRM_SCHED_POLICY_RR;
> +
> +/**
> + * DOC: sched_policy (int)
> + * Used to override default entities scheduling policy in a run queue.
> + */
> +MODULE_PARM_DESC(sched_policy,
> +	"specify schedule policy for entities on a runqueue (DRM_SCHED_POLICY_RR = Round Robin (default) ,DRM_SCHED_POLICY_FIFO  = use FIFO");

" ... Robin (default) ,DRM_SCHED_POLICY_FIFO ..."

Swap the position of the space and comma. Check with modinfo that those are correctly
substituted and look nice in the output.

> +module_param_named(sched_policy, drm_sched_policy, int, 0444);
> +
> +static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
> +							     const struct rb_node *b)
> +{
> +	struct drm_sched_entity *ent_a =  rb_entry((a), struct drm_sched_entity, rb_tree_node);
> +	struct drm_sched_entity *ent_b =  rb_entry((b), struct drm_sched_entity, rb_tree_node);
> +
> +	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
> +}
> +
> +static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity)
> +{
> +	struct drm_sched_rq *rq = entity->rq;
> +
> +	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
> +		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
> +		RB_CLEAR_NODE(&entity->rb_tree_node);
> +	}
> +}
> +
> +static inline void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
> +						   ktime_t ts)
> +{
> +	struct drm_sched_rq *rq = entity->rq;
> +
> +	drm_sched_rq_remove_fifo_locked(entity);
> +
> +	entity->oldest_job_waiting = ts;
> +
> +	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> +			drm_sched_entity_compare_before);
> +}
> +
> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
> +{
> +
> +	/*
> +	 * Both locks need to be grabbed, one to protect from entity->rq change
> +	 * for entity from within concurrent drm_sched_entity_select_rq and the
> +	 * other to update the rb tree structure.
> +	 */
> +	spin_lock(&entity->rq_lock);
> +	spin_lock(&entity->rq->lock);
> +
> +	drm_sched_rq_update_fifo_locked(entity, ts);
> +
> +	spin_unlock(&entity->rq->lock);
> +	spin_unlock(&entity->rq_lock);
> +}

Here you grab both locks, but you call drm_sched_rq_update_fifo_locked()
from drm_sched_rq_select_entity_fifo() with only the rq->lock.

> +
>  /**
>   * drm_sched_rq_init - initialize a given run queue struct
>   *
> @@ -75,6 +134,7 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>  {
>  	spin_lock_init(&rq->lock);
>  	INIT_LIST_HEAD(&rq->entities);
> +	rq->rb_tree_root = RB_ROOT_CACHED;
>  	rq->current_entity = NULL;
>  	rq->sched = sched;
>  }
> @@ -92,9 +152,12 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>  {
>  	if (!list_empty(&entity->list))
>  		return;
> +
>  	spin_lock(&rq->lock);
> +
>  	atomic_inc(rq->sched->score);
>  	list_add_tail(&entity->list, &rq->entities);
> +
>  	spin_unlock(&rq->lock);
>  }
>  
> @@ -111,23 +174,32 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>  {
>  	if (list_empty(&entity->list))
>  		return;
> +
>  	spin_lock(&rq->lock);
> +
> +
>  	atomic_dec(rq->sched->score);
>  	list_del_init(&entity->list);
> +
>  	if (rq->current_entity == entity)
>  		rq->current_entity = NULL;
> +
> +	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> +		drm_sched_rq_remove_fifo_locked(entity);
> +
>  	spin_unlock(&rq->lock);
>  }
>  
> +
>  /**
> - * drm_sched_rq_select_entity - Select an entity which could provide a job to run
> + * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>   *
>   * @rq: scheduler run queue to check.
>   *
>   * Try to find a ready entity, returns NULL if none found.
>   */
>  static struct drm_sched_entity *
> -drm_sched_rq_select_entity(struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>  {
>  	struct drm_sched_entity *entity;
>  
> @@ -163,6 +235,58 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>  	return NULL;
>  }
>  
> +
> +/**
> + * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
> + *
> + * @rq: scheduler run queue to check.
> + *
> + * Try to find a ready entity, returns NULL if none found.
> + */
> +static struct drm_sched_entity *
> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> +{
> +		struct drm_sched_entity *first, *entity = NULL;
> +		struct rb_node *rb;
> +
> +		spin_lock(&rq->lock);
> +
> +		rb = rb_first_cached(&rq->rb_tree_root);
> +		if (!rb)
> +			goto out;
> +
> +		first = rb_entry((rb), struct drm_sched_entity, rb_tree_node);
> +		entity = first;
> +
> +		while (true) {
> +
> +			if (drm_sched_entity_is_ready(entity)) {
> +				rq->current_entity = entity;
> +				reinit_completion(&entity->entity_idle);
> +				break;
> +			}
> +
> +			/*
> +			 * Push not ready entity to the end of the line so others
> +			 * have chance
> +			 */
> +			drm_sched_rq_update_fifo_locked(entity, ktime_get());
> +
> +
> +			rb = rb_first_cached(&rq->rb_tree_root);

You've an extra blank line above--checkpatch.pl with the options mentioned above
will reveal them all.

You call drm_sched_rq_update_fifo_locked() with, what it seems, only the rq->lock
held, but in drm_sched_rq_update_fifo() you stipulate that both locks need to be held.
Should resolve this.

Note that if no entity is ready, this code modifies all the timestamps of all entities
in the tree, and reinserts all the entities back again, for a total of O(N * log N),
O(N) to pick each one and O(log N) to reinsert, again, if no entity is ready and you
go over all of them. (Using rb_first_cached(), modify timestamp, rb_add_cached(),
rb_first_cached(), modify timestamp, rb_add_cached(), ..., and so on for all elements
in the tree).

I feel that you shouldn't have to modify the time stamp of any entity, and that
you shouldn't have to modify the tree. You want to preserve the order in which
entities were added. Instead you should do an ordered walk, i.e. oldest entity to
youngest entity and pick the oldest one ready, using something like the following:

static struct drm_sched_entity *
drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
{
	struct rb_node *rb;

	spin_lock(&rq->lock);
	for (rb = rb_first_cached(&rq->rb_tree); rb; rb = rb_next(rb)) {
		struct drm_sched_entity *entity;

		entity = rb_entry(rb, struct drm_sched_entity, rb_node);
		if (drm_sched_entity_is_ready(entity)) {
			rq->current_entity = entity;
			reinit_completion(&entity->entity_idle);
			break;
		}
	}
	spin_unlock(&rq->lock);

	return rb ? rb_entry(rb, struct drm_sched_entity, rb_node) : NULL;
}

The idea is that this preserves the insertion order, the timestamp, and
you search for the oldest entity, which is also ready, to schedule--not getting
the time, and no tree insert/modify operations, other than an in-order walk.

> +			entity =  rb_entry((rb), struct drm_sched_entity, rb_tree_node);

Extra space after = and before rb_entry().

> +
> +			/* We completed full cycle */
> +			if (!drm_sched_entity_is_ready(entity) && entity == first) {
> +				entity = NULL;
> +				break;
> +			}
> +		}
> +out:
> +		spin_unlock(&rq->lock);
> +		return entity;
> +}
> +
>  /**
>   * drm_sched_job_done - complete a job
>   * @s_job: pointer to the job which is done
> @@ -803,7 +927,9 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>  
>  	/* Kernel run queue has higher priority than normal run queue*/
>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> -		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
> +		entity = drm_sched_policy != DRM_SCHED_POLICY_FIFO ?
> +				drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
> +				drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);
>  		if (entity)
>  			break;
>  	}
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 599855c6a672..e3fdfb757d61 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -50,6 +50,13 @@ enum drm_sched_priority {
>  	DRM_SCHED_PRIORITY_UNSET = -2
>  };
>  
> +/* Used to chose between FIFO and RR jobs scheduling */
> +extern int drm_sched_policy;
> +
> +
> +#define DRM_SCHED_POLICY_RR    0
> +#define DRM_SCHED_POLICY_FIFO  1
> +
>  /**
>   * struct drm_sched_entity - A wrapper around a job queue (typically
>   * attached to the DRM file_priv).
> @@ -196,6 +203,21 @@ struct drm_sched_entity {
>  	 * drm_sched_entity_fini().
>  	 */
>  	struct completion		entity_idle;
> +
> +	/**
> +	 * @oldest_job_waiting:
> +	 *
> +	 * Marks earliest job waiting in SW queue
> +	 */
> +	ktime_t				oldest_job_waiting;
> +
> +	/**
> +	 * @rb_tree_node:
> +	 *
> +	 * The node used to insert this entity into time based priority queue
> +	 */
> +	struct rb_node			rb_tree_node;

I'd probably call it "rb_node", shorter--it's up to you.

> +
>  };
>  
>  /**
> @@ -205,6 +227,7 @@ struct drm_sched_entity {
>   * @sched: the scheduler to which this rq belongs to.
>   * @entities: list of the entities to be scheduled.
>   * @current_entity: the entity which is to be scheduled.
> + * @rb_tree_root: root of time based priory queue of entities for FIFO scheduling
>   *
>   * Run queue is a set of entities scheduling command submissions for
>   * one specific ring. It implements the scheduling policy that selects
> @@ -215,6 +238,7 @@ struct drm_sched_rq {
>  	struct drm_gpu_scheduler	*sched;
>  	struct list_head		entities;
>  	struct drm_sched_entity		*current_entity;
> +	struct rb_root_cached		rb_tree_root;

I'd probably just call it "rb_tree", shorter--it's up to you.

Regards,
Luben

>  };
>  
>  /**
> @@ -314,6 +338,14 @@ struct drm_sched_job {
>  
>  	/** @last_dependency: tracks @dependencies as they signal */
>  	unsigned long			last_dependency;
> +
> +
> +	/**
> +	 * @submit_ts:
> +	 *
> +	 * When the job was pushed into the entity queue.
> +	 */
> +	ktime_t                         submit_ts;
>  };
>  
>  static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
> @@ -503,6 +535,9 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>  void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>  				struct drm_sched_entity *entity);
>  
> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts);
> +
> +
>  int drm_sched_entity_init(struct drm_sched_entity *entity,
>  			  enum drm_sched_priority priority,
>  			  struct drm_gpu_scheduler **sched_list,

