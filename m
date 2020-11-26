Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FCA2C4C08
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 01:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CD66E4B7;
	Thu, 26 Nov 2020 00:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE346E1F8;
 Thu, 26 Nov 2020 00:30:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuPdmXORCywnR36uFnnfXzjvFEA9XAQ2DWoke5FSkC0OR5UlIz5rhx7/qtZSAReIMQuhvp3eLw0PsYkzyBW5pwRdeSMrSeWXoy+BGZ5OF1a1oQB5VMY4dFJpOyPxeFEIt3Te2bwYqkQixBvk7vdAXbu0CnOf7i08r+yFTAnoAdIjUoVcNNU7xwzQw9bu9t7yBtwvoJ5f6TG5mg3wb7zpFoLexq/XjAzeHJ30K66kUHRs85WhZ4HVOhNZPKJeBY2+93OV2+5qmLMVj4MLewxU2fDR7MHrSEOxXqGnDTYBjsjydi+Te/vdHTjFAh2KxyKAvIkkDL8kgxu3WrVx4pLeuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fczOaMURfJ+qQNaS1xQs420Mj8xNSmiY/qySe5seAE=;
 b=JQM2ti3oA04Yib7KsrbdqNE7YZY9R2IwygNW4zgdkQxil9+BqZ+lsmtC2/aSjre+83Y3yDWT6I+HwqBo1u8xpFev6nLc2PHW7ayXkcfqeBAFVjZqZV+2NjKz31WdmtlQsb6q3a8dO8GWfM3dWL2f9ekaRqOFkeZynOXWmPLeayyu7wlZU/+mEAnMvlG0ALX6BzrxqgK+ctksi5VrYkjaG/Qxy9blEyW8AwFzM056JZSzZrlo3jxLTEYszfnps/C+51sQbkkoy1LuujQKeREdZ+yeEfiHPHYH8VcN8ZnuuxV5pmvs8wjkUIRkMwgOm7SibK7rSIMPFiG35SM0cSiTzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fczOaMURfJ+qQNaS1xQs420Mj8xNSmiY/qySe5seAE=;
 b=bWZTdaGJFtQDTni0+6RvfvX5L2lTJDpfEwalGDYOZiAZjYnh9v4mt3gEwukw3f9l4lTAZtnVTFi+1np8D64vJ8XG6W3N+9htLhbokpqK7R1gfEP1GhMUz4miS2+mbf8L51C50lOqpscrrWUrgP0hxToyby5KjpFyzh3EjCb5QKs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB2780.namprd12.prod.outlook.com (2603:10b6:5:4e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.24; Thu, 26 Nov
 2020 00:30:17 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56%6]) with mapi id 15.20.3589.031; Thu, 26 Nov 2020
 00:30:17 +0000
Subject: Re: [PATCH 6/6] drm/sched: Make use of a "done" thread
To: Steven Price <steven.price@arm.com>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Alexander Deucher <Alexander.Deucher@amd.com>
References: <769e72ee-b2d0-d75f-cc83-a85be08e231b@amd.com>
 <20201125031708.6433-1-luben.tuikov@amd.com>
 <20201125031708.6433-7-luben.tuikov@amd.com>
 <6bdf3f46-effb-dea9-fffe-d8c78612d9ff@arm.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <091729fe-e89b-82e2-981e-c38025e9678a@amd.com>
Date: Wed, 25 Nov 2020 19:30:15 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <6bdf3f46-effb-dea9-fffe-d8c78612d9ff@arm.com>
Content-Language: en-CA
X-Originating-IP: [165.204.54.211]
X-ClientProxiedBy: CH2PR20CA0004.namprd20.prod.outlook.com
 (2603:10b6:610:58::14) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.18.65] (165.204.54.211) by
 CH2PR20CA0004.namprd20.prod.outlook.com (2603:10b6:610:58::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Thu, 26 Nov 2020 00:30:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ec7dfbb5-e7ad-41e3-0a3a-08d891a272e7
X-MS-TrafficTypeDiagnostic: DM6PR12MB2780:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2780E7FC7AB6DFD88DE9C31199F90@DM6PR12MB2780.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:252;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3lP/s4ZqdD5LgIzFPCweoAVle4Ts+W0IivDCtVkdhnAXAA42OPIXhVYY8fsrfPGwlrg4QNz9bLqvQvuOCRbwk4laoEDuY1yxx9zHLsxjv1nUsPXIvXLpy3lWPRBAITT+4W3eqUztkwq8oGIictq68IHu0fcno2i0bF4sVpd9+4wKVjZUi/RQGxPwoHursHsnBIpoE+IANN/kvI+Pu6DhEw9V6u3lij4+rrOIsvKodYi67d3uVzEnuNNXWFk37tohHX/H+d/pWTp1n8TLSf7szQQWC4VFuEMO1+cKZSLuacHsb3mAmyDn84UwntCAjx3r7AzL3vhZlJqdXN16wMGIZvlHkJ0mDpyijVKAYAEu01qBce5sBobAe7aDUHxVHgOr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(6636002)(478600001)(16576012)(30864003)(2616005)(956004)(31696002)(66556008)(66946007)(83380400001)(31686004)(44832011)(5660300002)(86362001)(66476007)(16526019)(36756003)(52116002)(2906002)(8936002)(53546011)(110136005)(4326008)(316002)(6486002)(4001150100001)(8676002)(186003)(26005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: B9tVfc1AhaJolxUHDi+UxbmstxaHDEmpJpd5ThJiynFURYCWU7cn0AK3nzRSs/IXz3y0L0evnybTeGQ6t/me9tH2tldz9v2F9zKuNpmnTdROL2gf9V6d0V66d3w0RKLI2Ous3CoBjr8DFHbAl/NwA1U/xZCSsHhnUm50wX3I+buVyf0desZf+6ZSS92B56W6dkOZcrinFeSeH62dVwIT/tlJp4cAgwEfSeXplbOto5Ujwk0RMkPvYZwP3AWCDTGt4CZRH0AAcZVqLs4t08RMBjAE/7m6U3hFF5nue8K1d0lmPy9sOkKwv0OAuL611us3+8fEgO6cIRSHmKKU1dX/HnD6cdJNatT9nXPCxIWDLd9Mk6QYVrIIz+5IB05ZN+UZCab335If2Cf37q9m2Lifvjr8FKngqVfAP/DEW2A+dpvISIJK551jU3yy2k99xM1fWxPvXsitB8y/POjZivhkHHc+W4icCMR49gCq7eK8ESeNOD33OdADiV1RfNtQiNzZTAK/Uau6/tWPjJtz3bbGoaP4rDVPINKgG6j1fjhNLZi0IA/PnWus4mumMoIkT6vh4DcfBF4vDRNsOo8dbd4YXLKFZ4cAlgntq76H9RzGeqSK9NK2gXegExtrjC4Zu/n8x7k5bziYKICEarsT16YiCIcgIvVes4jppM9bi2kIJRSfHcgXvB4hiIF6CyG3Fk1m01PsGo7Kp8bm+D/WVtNgYG1nXcXrIRNKTGysWKbOq9/bzK+AwRs8K7HyuoadHAk/pNemIiJQWmldquiA8uLJ3Lqr/EHyhrxPiF+s24AOkpE/OMGmQoMKz9RVf9i3KJZTYx0PitSUEqDBlbh01rVkGrSTPKxIXpDaAzUZDlTDup2bReM+UI4+tToh397vvui/jsFzNOP0hqIhwdI6nBH+7g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7dfbb5-e7ad-41e3-0a3a-08d891a272e7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2020 00:30:17.3427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: khTKwwL1gFxz00oomI6RNklTMDMncOAndfCsZzOWnwTZ2DJOKi4/sW8hGJDnnRaw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2780
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
Cc: Emily Deng <Emily.Deng@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-25 06:09, Steven Price wrote:
> On 25/11/2020 03:17, Luben Tuikov wrote:
>> Add a "done" list to which all completed jobs are added
>> to be freed. The drm_sched_job_done() callback is the
>> producer of jobs to this list.
>>
>> Add a "done" thread which consumes from the done list
>> and frees up jobs. Now, the main scheduler thread only
>> pushes jobs to the GPU and the "done" thread frees them
>> up, on the way out of the GPU when they've completed
>> execution.
> 
> Generally I'd be in favour of a "done thread" as I think there are some 
> murky corners of Panfrost's locking that would be helped by deferring 
> the free_job() callback.

Check my response to his email.

It seems you're okay with a separate thread, when both threads
could be working concurrently, and Christian wants
a single thread doing all this. You should probably address
this in a follow-up to his email, so this can be hashed out.

> 
> But I think you're trying to do too much in one patch here. And as 
> Christian has pointed out there's some dodgy looking changes to locking 
> which aren't explained.

I've addressed this in my response to his email, check it out.

So, if you're in favour of a separate thread working concurrently,
please follow up to his email, so this can be hashed out.

Thanks and Regards,
Luben

> 
> Steve
> 
>>
>> Make use of the status returned by the GPU driver
>> timeout handler to decide whether to leave the job in
>> the pending list, or to send it off to the done list.
>> If a job is done, it is added to the done list and the
>> done thread woken up. If a job needs more time, it is
>> left on the pending list and the timeout timer
>> restarted.
>>
>> Eliminate the polling mechanism of picking out done
>> jobs from the pending list, i.e. eliminate
>> drm_sched_get_cleanup_job(). Now the main scheduler
>> thread only pushes jobs down to the GPU.
>>
>> Various other optimizations to the GPU scheduler
>> and job recovery are possible with this format.
>>
>> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 173 +++++++++++++------------
>>   include/drm/gpu_scheduler.h            |  14 ++
>>   2 files changed, 101 insertions(+), 86 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 3eb7618a627d..289ae68cd97f 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -164,7 +164,8 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>    * drm_sched_job_done - complete a job
>>    * @s_job: pointer to the job which is done
>>    *
>> - * Finish the job's fence and wake up the worker thread.
>> + * Finish the job's fence, move it to the done list,
>> + * and wake up the done thread.
>>    */
>>   static void drm_sched_job_done(struct drm_sched_job *s_job)
>>   {
>> @@ -179,7 +180,12 @@ static void drm_sched_job_done(struct drm_sched_job *s_job)
>>   	dma_fence_get(&s_fence->finished);
>>   	drm_sched_fence_finished(s_fence);
>>   	dma_fence_put(&s_fence->finished);
>> -	wake_up_interruptible(&sched->wake_up_worker);
>> +
>> +	spin_lock(&sched->job_list_lock);
>> +	list_move(&s_job->list, &sched->done_list);
>> +	spin_unlock(&sched->job_list_lock);
>> +
>> +	wake_up_interruptible(&sched->done_wait_q);
>>   }
>>   
>>   /**
>> @@ -221,11 +227,10 @@ bool drm_sched_dependency_optimized(struct dma_fence* fence,
>>   EXPORT_SYMBOL(drm_sched_dependency_optimized);
>>   
>>   /**
>> - * drm_sched_start_timeout - start timeout for reset worker
>> - *
>> - * @sched: scheduler instance to start the worker for
>> + * drm_sched_start_timeout - start a timeout timer
>> + * @sched: scheduler instance whose job we're timing
>>    *
>> - * Start the timeout for the given scheduler.
>> + * Start a timeout timer for the given scheduler.
>>    */
>>   static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
>>   {
>> @@ -305,8 +310,8 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
>>   
>>   	spin_lock(&sched->job_list_lock);
>>   	list_add_tail(&s_job->list, &sched->pending_list);
>> -	drm_sched_start_timeout(sched);
>>   	spin_unlock(&sched->job_list_lock);
>> +	drm_sched_start_timeout(sched);
>>   }
>>   
>>   static void drm_sched_job_timedout(struct work_struct *work)
>> @@ -316,37 +321,30 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>   
>>   	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>>   
>> -	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
>>   	spin_lock(&sched->job_list_lock);
>>   	job = list_first_entry_or_null(&sched->pending_list,
>>   				       struct drm_sched_job, list);
>> +	spin_unlock(&sched->job_list_lock);
>>   
>>   	if (job) {
>> -		/*
>> -		 * Remove the bad job so it cannot be freed by concurrent
>> -		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>> -		 * is parked at which point it's safe.
>> -		 */
>> -		list_del_init(&job->list);
>> -		spin_unlock(&sched->job_list_lock);
>> +		int res;
>>   
>> -		job->sched->ops->timedout_job(job);
>> +		job->job_status |= DRM_JOB_STATUS_TIMEOUT;
>> +		res = job->sched->ops->timedout_job(job);
>> +		if (res == 0) {
>> +			/* The job is out of the device.
>> +			 */
>> +			spin_lock(&sched->job_list_lock);
>> +			list_move(&job->list, &sched->done_list);
>> +			spin_unlock(&sched->job_list_lock);
>>   
>> -		/*
>> -		 * Guilty job did complete and hence needs to be manually removed
>> -		 * See drm_sched_stop doc.
>> -		 */
>> -		if (sched->free_guilty) {
>> -			job->sched->ops->free_job(job);
>> -			sched->free_guilty = false;
>> +			wake_up_interruptible(&sched->done_wait_q);
>> +		} else {
>> +			/* The job needs more time.
>> +			 */
>> +			drm_sched_start_timeout(sched);
>>   		}
>> -	} else {
>> -		spin_unlock(&sched->job_list_lock);
>>   	}
>> -
>> -	spin_lock(&sched->job_list_lock);
>> -	drm_sched_start_timeout(sched);
>> -	spin_unlock(&sched->job_list_lock);
>>   }
>>   
>>    /**
>> @@ -511,15 +509,13 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>>   			else if (r)
>>   				DRM_ERROR("fence add callback failed (%d)\n",
>>   					  r);
>> -		} else
>> +		} else {
>>   			drm_sched_job_done(s_job);
>> +		}
>>   	}
>>   
>> -	if (full_recovery) {
>> -		spin_lock(&sched->job_list_lock);
>> +	if (full_recovery)
>>   		drm_sched_start_timeout(sched);
>> -		spin_unlock(&sched->job_list_lock);
>> -	}
>>   
>>   	kthread_unpark(sched->thread);
>>   }
>> @@ -667,47 +663,6 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>   	return entity;
>>   }
>>   
>> -/**
>> - * drm_sched_get_cleanup_job - fetch the next finished job to be destroyed
>> - *
>> - * @sched: scheduler instance
>> - *
>> - * Returns the next finished job from the pending list (if there is one)
>> - * ready for it to be destroyed.
>> - */
>> -static struct drm_sched_job *
>> -drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>> -{
>> -	struct drm_sched_job *job;
>> -
>> -	/*
>> -	 * Don't destroy jobs while the timeout worker is running  OR thread
>> -	 * is being parked and hence assumed to not touch pending_list
>> -	 */
>> -	if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>> -	    !cancel_delayed_work(&sched->work_tdr)) ||
>> -	    kthread_should_park())
>> -		return NULL;
>> -
>> -	spin_lock(&sched->job_list_lock);
>> -
>> -	job = list_first_entry_or_null(&sched->pending_list,
>> -				       struct drm_sched_job, list);
>> -
>> -	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>> -		/* remove job from pending_list */
>> -		list_del_init(&job->list);
>> -	} else {
>> -		job = NULL;
>> -		/* queue timeout for next job */
>> -		drm_sched_start_timeout(sched);
>> -	}
>> -
>> -	spin_unlock(&sched->job_list_lock);
>> -
>> -	return job;
>> -}
>> -
>>   /**
>>    * drm_sched_pick_best - Get a drm sched from a sched_list with the least load
>>    * @sched_list: list of drm_gpu_schedulers
>> @@ -761,6 +716,44 @@ static bool drm_sched_blocked(struct drm_gpu_scheduler *sched)
>>   	return false;
>>   }
>>   
>> +/**
>> + * drm_sched_done - free done tasks
>> + * @param: pointer to a scheduler instance
>> + *
>> + * Returns 0.
>> + */
>> +static int drm_sched_done(void *param)
>> +{
>> +	struct drm_gpu_scheduler *sched = param;
>> +
>> +	do {
>> +		LIST_HEAD(done_q);
>> +
>> +		wait_event_interruptible(sched->done_wait_q,
>> +					 kthread_should_stop() ||
>> +					 !list_empty(&sched->done_list));
>> +
>> +		spin_lock(&sched->job_list_lock);
>> +		list_splice_init(&sched->done_list, &done_q);
>> +		spin_unlock(&sched->job_list_lock);
>> +
>> +		if (list_empty(&done_q))
>> +			continue;
>> +
>> +		while (!list_empty(&done_q)) {
>> +			struct drm_sched_job *job;
>> +
>> +			job = list_first_entry(&done_q,
>> +					       struct drm_sched_job,
>> +					       list);
>> +			list_del_init(&job->list);
>> +			sched->ops->free_job(job);
>> +		}
>> +	} while (!kthread_should_stop());
>> +
>> +	return 0;
>> +}
>> +
>>   /**
>>    * drm_sched_main - main scheduler thread
>>    *
>> @@ -770,7 +763,7 @@ static bool drm_sched_blocked(struct drm_gpu_scheduler *sched)
>>    */
>>   static int drm_sched_main(void *param)
>>   {
>> -	struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
>> +	struct drm_gpu_scheduler *sched = param;
>>   	int r;
>>   
>>   	sched_set_fifo_low(current);
>> @@ -780,20 +773,12 @@ static int drm_sched_main(void *param)
>>   		struct drm_sched_fence *s_fence;
>>   		struct drm_sched_job *sched_job;
>>   		struct dma_fence *fence;
>> -		struct drm_sched_job *cleanup_job = NULL;
>>   
>>   		wait_event_interruptible(sched->wake_up_worker,
>> -					 (cleanup_job = drm_sched_get_cleanup_job(sched)) ||
>>   					 (!drm_sched_blocked(sched) &&
>>   					  (entity = drm_sched_select_entity(sched))) ||
>>   					 kthread_should_stop());
>>   
>> -		if (cleanup_job) {
>> -			sched->ops->free_job(cleanup_job);
>> -			/* queue timeout for next job */
>> -			drm_sched_start_timeout(sched);
>> -		}
>> -
>>   		if (!entity)
>>   			continue;
>>   
>> @@ -820,8 +805,7 @@ static int drm_sched_main(void *param)
>>   			if (r == -ENOENT)
>>   				drm_sched_job_done(sched_job);
>>   			else if (r)
>> -				DRM_ERROR("fence add callback failed (%d)\n",
>> -					  r);
>> +				DRM_ERROR("fence add callback failed (%d)\n", r);
>>   			dma_fence_put(fence);
>>   		} else {
>>   			if (IS_ERR(fence))
>> @@ -865,7 +849,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>   
>>   	init_waitqueue_head(&sched->wake_up_worker);
>>   	init_waitqueue_head(&sched->job_scheduled);
>> +	init_waitqueue_head(&sched->done_wait_q);
>>   	INIT_LIST_HEAD(&sched->pending_list);
>> +	INIT_LIST_HEAD(&sched->done_list);
>>   	spin_lock_init(&sched->job_list_lock);
>>   	atomic_set(&sched->hw_rq_count, 0);
>>   	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>> @@ -881,6 +867,21 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>   		return ret;
>>   	}
>>   
>> +	snprintf(sched->thread_done_name, DRM_THREAD_NAME_LEN, "%s%s",
>> +		 sched->name, "-done");
>> +	sched->thread_done_name[DRM_THREAD_NAME_LEN - 1] = '\0';
>> +	sched->thread_done = kthread_run(drm_sched_done, sched,
>> +					 sched->thread_done_name);
>> +	if (IS_ERR(sched->thread_done)) {
>> +		ret = kthread_stop(sched->thread);
>> +		if (!ret) {
>> +			/* free_kthread_struct(sched->thread); */
>> +			sched->thread = NULL;
>> +		}
>> +		DRM_ERROR("Failed to start thread %s", sched->thread_done_name);
>> +		return ret;
>> +	}
>> +
>>   	sched->ready = true;
>>   	return 0;
>>   }
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 3a5686c3b5e9..b282d6158b50 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -169,6 +169,12 @@ struct drm_sched_fence {
>>   
>>   struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>>   
>> +enum drm_job_status {
>> +	DRM_JOB_STATUS_NONE    = 0 << 0,
>> +	DRM_JOB_STATUS_DONE    = 1 << 0,
>> +	DRM_JOB_STATUS_TIMEOUT = 1 << 1,
>> +};
>> +
>>   /**
>>    * struct drm_sched_job - A job to be run by an entity.
>>    *
>> @@ -198,6 +204,7 @@ struct drm_sched_job {
>>   	uint64_t			id;
>>   	atomic_t			karma;
>>   	enum drm_sched_priority		s_priority;
>> +	enum drm_job_status             job_status;
>>   	struct drm_sched_entity         *entity;
>>   	struct dma_fence_cb		cb;
>>   };
>> @@ -284,15 +291,22 @@ struct drm_gpu_scheduler {
>>   	uint32_t			hw_submission_limit;
>>   	long				timeout;
>>   	const char			*name;
>> +	char                            thread_done_name[DRM_THREAD_NAME_LEN];
>> +
>>   	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
>>   	wait_queue_head_t		wake_up_worker;
>>   	wait_queue_head_t		job_scheduled;
>> +	wait_queue_head_t               done_wait_q;
>>   	atomic_t			hw_rq_count;
>>   	atomic64_t			job_id_count;
>>   	struct delayed_work		work_tdr;
>>   	struct task_struct		*thread;
>> +	struct task_struct		*thread_done;
>> +
>>   	struct list_head		pending_list;
>> +	struct list_head                done_list;
>>   	spinlock_t			job_list_lock;
>> +
>>   	int				hang_limit;
>>   	atomic_t                        score;
>>   	bool				ready;
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
