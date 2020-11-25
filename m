Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAA52C3D4E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 11:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452926E88C;
	Wed, 25 Nov 2020 10:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC1D6E88C;
 Wed, 25 Nov 2020 10:10:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZR97UycP54ELGz105Zn4qjX1O6aEgqKxWce8mqWFVTrB7qKAyXSuI07HyK7eLRUtls3Awk70nMI6zUJgdmBFmSmXsqlR//sMHrU17a/rkZTdiWj7JzVxULVetegtLzqKNtJXaQLXjyZxTe5ZY7e0/KvvvxP9pTopLs9sRVKNX9+B/Ik6iv7e29nRR+jYZYaZnDVI5UA5k27TXMMyqHrUszIT0QsdT4pyR9CnOexSiYW9MShq0OFs7XT9OrHR0FOG72N1AaEDOUMUGGsMPis0oYZkNn4d45FIvMv5M7kTUEf3RFpotasLiXcNZav1GdtEAa+tsn8FjBPrfDVRqi3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zhnee8G/2SRbweY9HEQ/icM6HKInCSzjYEfAeKGH4Bg=;
 b=ZYn5A2DrfEznXWhdlhNuq8RJZ4j0LMSGkxnnhNcvyh4B1tvHk75kDihIxEWLIJUArYb3dVbLHcq4szjYGv/Z83NspinugJhwBVjbR2CS+RuyrrLYFhNKIvts6uZhx9ZNslVld8dsXKqCXiJtpC62iZtEW5rUmZ59oUTBTpIcWBqHKXsrel5Y79IwT6+tmxQqdbl7vuiMW1PLK8FdwMUgPmx3Ts7tm+JSxqSFeLZGKbhDF14wgqzfaLl/WUBtR8DeYWXTHfjZgKgBzszp4IbMTJAzW/fqDkjccnA2sffV1RWbMJbYDdtPREDKwc9tyF8ZiHFk0MIZtLT+UkqljufaDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zhnee8G/2SRbweY9HEQ/icM6HKInCSzjYEfAeKGH4Bg=;
 b=clm0ZolIs270PcJU2625PCxsGDVOIeT9m+C/tS7e8CUEk6n28unInVcg/HacG8ilQI1dARorK2vu21afRTYSjQIzg2BfYoPcO14eoOkR7Co8CKwXc76UE+0ra5YaGRpnocfwku94R26LfRz+vTDCRscD+nmdApl5IjEV83uWwOw=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4319.namprd12.prod.outlook.com (2603:10b6:208:1dc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Wed, 25 Nov
 2020 10:10:46 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.022; Wed, 25 Nov 2020
 10:10:46 +0000
Subject: Re: [PATCH 6/6] drm/sched: Make use of a "done" thread
To: Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Alexander Deucher <Alexander.Deucher@amd.com>
References: <769e72ee-b2d0-d75f-cc83-a85be08e231b@amd.com>
 <20201125031708.6433-1-luben.tuikov@amd.com>
 <20201125031708.6433-7-luben.tuikov@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <86de40f3-730b-a877-8554-cd289456eb29@amd.com>
Date: Wed, 25 Nov 2020 11:10:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201125031708.6433-7-luben.tuikov@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0701CA0003.eurprd07.prod.outlook.com
 (2603:10a6:200:42::13) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0701CA0003.eurprd07.prod.outlook.com (2603:10a6:200:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.13 via Frontend
 Transport; Wed, 25 Nov 2020 10:10:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 21b4bffc-60f6-48c1-4ee4-08d8912a6042
X-MS-TrafficTypeDiagnostic: MN2PR12MB4319:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4319BC1C46061AE91592E8A183FA0@MN2PR12MB4319.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:200;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3jA3QRGhWFGlsu39qtlnWuPwoxU/TmDjG0VBkwJvTbuKzsA2JQY0mC4Z7p1V4YWKvXCG/RZFqX9TmWJ5n/VHwXilZlqJAyyzMMNAnjMY7M/5qe63kIPNfsHWdiPnDqIcf2aE+XsePJvnFzkRQhfXlHpqyveyjjG80GelFWziT1rItIxV7yqlP/C31wGkuERzYxXSOlZK2vPwK/FPYyuOficYgDThO2ID8qWJvVa3bjNLqo3lD5avSxR0Tg3GLLXL4y6sZqOu3D/pX8K49a6INirfVlO7xRZORaFGeEXl70bX0Olv3Eglztvy6XoqyHzapnkUhdNyctXRROq1jfKp/bAL2V/pPKosSbKaKbn0bdxZ8ejIOxSxoTBWi7i1Fqky
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(346002)(136003)(366004)(376002)(8936002)(316002)(86362001)(5660300002)(2906002)(110136005)(186003)(6666004)(66476007)(66556008)(52116002)(16526019)(83380400001)(6636002)(8676002)(6486002)(36756003)(2616005)(4326008)(31696002)(478600001)(30864003)(31686004)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QUZnZ0pwSXZFUnBBZEd4WHNZVjhqUXlJN29ibm9VdG5ncHRHWHZEbE55M1Bp?=
 =?utf-8?B?Q0piazZ2OFd5VUU2VHF4VittUXJKbnVhVW95TCtBUnV0Nk1XWUJ5RzBmRHZ4?=
 =?utf-8?B?WTQzRXgrM0tsZ0pCYm1ic21iSFFpRjFIR2lpYkdjODZPTkJLWkRnTm9HOWhm?=
 =?utf-8?B?WWZRQTZFRGQvQ2QzcTJ4ZXlhRmkvL3kyTUFGRnN0SmlVSGZONFRiaHBxdGFW?=
 =?utf-8?B?TVFHSjM4dzhxUlFVZkhpL1UxeHpJTkxNUnpCcEV1ZUhiSEFyNVFuVHp1eEpG?=
 =?utf-8?B?R1RMWU91dWpPazBTaGhLd3ZRNExFVVZoOWdiRVJ3aHVkeFNJelk5TmpLWmsr?=
 =?utf-8?B?MlJmUkRvblpwb3hPU0I5dGxRaTZYTHF5T3BxU1JtbjB0Rzk4WjNncGhLNVJR?=
 =?utf-8?B?eVNibGVlOVA3bllUZi9pTElQamxLR1BjY2E4OEVhTEVidmFjTHJyS2ZqYmF6?=
 =?utf-8?B?dStLS29hL25CUFJTN09rMjB3ZmVkR1Aralo2R2x1U2VFdWR6SllWU1p0Nkhh?=
 =?utf-8?B?aVpQd1o5bzNiVFV3WW9kTkc1UjByRFgwdVpzUXNaRVlrN1plVXZkTjVnZEFj?=
 =?utf-8?B?VXpuZTUrVkNONk9HOU5nbkpLMDFwV2FodzNBM3g4QndvNGRmakttNG5oaFJs?=
 =?utf-8?B?c1pqbk9LZWdJa2xiZzBmM1BVSmZ1YnZiKzRmOGFpbVdqM2gyQmg5YnlxRVI3?=
 =?utf-8?B?V3JsNWJtTGhVb2d1ZVBaQTRwMlVsdnhjQnpVVkJseVZudEc5QVFsMWx4VENz?=
 =?utf-8?B?Vlhxczk3eUdVbFdudnhwMlpUa2UxN1VLQXFvbTllQzBPdlIyZlpjVFJ4QjdG?=
 =?utf-8?B?TXJLQTJTbjQ0N2h1WXhIQWQ4VlhsVUl5TmpncXRrSHhOcHJrRWtTcjV0TUY5?=
 =?utf-8?B?NzNhc29LWHA2ZXMvRjl2b21SdnI0Z1l5VEpQVEloQnRCS0UrNEtxaVhiRkdq?=
 =?utf-8?B?RWlRNmdUemRLb3M0YzA2N1VRNDhpNGU5M1JWOVQ1ZDFocUtGRzFzbUFaT1dC?=
 =?utf-8?B?N0dicjByYWx4SUtIelVCYUljTjBGYktYcDZHVzY0aVVacEpZaFRWZGFNZDZI?=
 =?utf-8?B?azVFakp3b0dMOWpWRUZreWpMcGtCbnEvRFVzdTEreE5sblJRVWsyVHVZVzFv?=
 =?utf-8?B?RkdIaEdHVUJ4V0MwMXkvNHZBR2hvL1poZll5K05PSTZNMHU1T2xHcnpKeFdE?=
 =?utf-8?B?WTM4ZHRsYTVxbUM0ZHd2RVlielAzTVIyNUpoTnpDNHJOQUt2U2ZyRkVEOUg5?=
 =?utf-8?B?cW1WRXZDWk42Z2hCS2wzT0Iza2QrcnVidTB2amNwc0Y0TmdNeTgxQjVwRmlo?=
 =?utf-8?B?dUxObUNiczVwMXZmYXA0UkVTY0dOSThwSWNNdEFxNXVqUGh6enoxcHlVb01y?=
 =?utf-8?B?WGV6UE84Zm5LdnlVZEMxcGJnRlc2dWVjOGVuaE1yWjcyMFI5SUI1NG1rYUh5?=
 =?utf-8?Q?brlv7jHm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b4bffc-60f6-48c1-4ee4-08d8912a6042
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 10:10:46.4406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbEaGJZPVVUFEFHVo3FXKN3SX+cnNT1UcJZMjmew8wUSx8vu9lu9YnjtcPBdM+AH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4319
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
 dri-devel@lists.freedesktop.org, steven.price@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.11.20 um 04:17 schrieb Luben Tuikov:
> Add a "done" list to which all completed jobs are added
> to be freed. The drm_sched_job_done() callback is the
> producer of jobs to this list.
>
> Add a "done" thread which consumes from the done list
> and frees up jobs. Now, the main scheduler thread only
> pushes jobs to the GPU and the "done" thread frees them
> up, on the way out of the GPU when they've completed
> execution.

Well there are quite a number of problems in this patch.

 From the design I think we should be getting rid of the linked list and 
not extend its use. And we also don't want to offload the freeing of 
jobs into a different thread because that could potentially mean that 
this is executed on a different CPU.

Then one obvious problem seems to be that you don't take into account 
that we moved the job freeing into the scheduler thread to make sure 
that this is suspended while the scheduler thread is stopped. This 
behavior is now completely gone, e.g. the delete thread keeps running 
while the scheduler thread is stopped.

A few more comments below.

> Make use of the status returned by the GPU driver
> timeout handler to decide whether to leave the job in
> the pending list, or to send it off to the done list.
> If a job is done, it is added to the done list and the
> done thread woken up. If a job needs more time, it is
> left on the pending list and the timeout timer
> restarted.
>
> Eliminate the polling mechanism of picking out done
> jobs from the pending list, i.e. eliminate
> drm_sched_get_cleanup_job(). Now the main scheduler
> thread only pushes jobs down to the GPU.
>
> Various other optimizations to the GPU scheduler
> and job recovery are possible with this format.
>
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 173 +++++++++++++------------
>   include/drm/gpu_scheduler.h            |  14 ++
>   2 files changed, 101 insertions(+), 86 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 3eb7618a627d..289ae68cd97f 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -164,7 +164,8 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>    * drm_sched_job_done - complete a job
>    * @s_job: pointer to the job which is done
>    *
> - * Finish the job's fence and wake up the worker thread.
> + * Finish the job's fence, move it to the done list,
> + * and wake up the done thread.
>    */
>   static void drm_sched_job_done(struct drm_sched_job *s_job)
>   {
> @@ -179,7 +180,12 @@ static void drm_sched_job_done(struct drm_sched_job *s_job)
>   	dma_fence_get(&s_fence->finished);
>   	drm_sched_fence_finished(s_fence);
>   	dma_fence_put(&s_fence->finished);
> -	wake_up_interruptible(&sched->wake_up_worker);
> +
> +	spin_lock(&sched->job_list_lock);
> +	list_move(&s_job->list, &sched->done_list);
> +	spin_unlock(&sched->job_list_lock);
> +
> +	wake_up_interruptible(&sched->done_wait_q);

How is the worker thread then woken up to push new jobs to the hardware?

>   }
>   
>   /**
> @@ -221,11 +227,10 @@ bool drm_sched_dependency_optimized(struct dma_fence* fence,
>   EXPORT_SYMBOL(drm_sched_dependency_optimized);
>   
>   /**
> - * drm_sched_start_timeout - start timeout for reset worker
> - *
> - * @sched: scheduler instance to start the worker for
> + * drm_sched_start_timeout - start a timeout timer
> + * @sched: scheduler instance whose job we're timing
>    *
> - * Start the timeout for the given scheduler.
> + * Start a timeout timer for the given scheduler.
>    */
>   static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
>   {
> @@ -305,8 +310,8 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
>   
>   	spin_lock(&sched->job_list_lock);
>   	list_add_tail(&s_job->list, &sched->pending_list);
> -	drm_sched_start_timeout(sched);
>   	spin_unlock(&sched->job_list_lock);
> +	drm_sched_start_timeout(sched);

This looks wrong, the drm_sched_start_timeout() function used to need 
the lock. Why should that have changed?

>   }
>   
>   static void drm_sched_job_timedout(struct work_struct *work)
> @@ -316,37 +321,30 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   
>   	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>   
> -	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
>   	spin_lock(&sched->job_list_lock);
>   	job = list_first_entry_or_null(&sched->pending_list,
>   				       struct drm_sched_job, list);
> +	spin_unlock(&sched->job_list_lock);
>   
>   	if (job) {
> -		/*
> -		 * Remove the bad job so it cannot be freed by concurrent
> -		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> -		 * is parked at which point it's safe.
> -		 */
> -		list_del_init(&job->list);
> -		spin_unlock(&sched->job_list_lock);
> +		int res;
>   
> -		job->sched->ops->timedout_job(job);
> +		job->job_status |= DRM_JOB_STATUS_TIMEOUT;
> +		res = job->sched->ops->timedout_job(job);
> +		if (res == 0) {
> +			/* The job is out of the device.
> +			 */
> +			spin_lock(&sched->job_list_lock);
> +			list_move(&job->list, &sched->done_list);
> +			spin_unlock(&sched->job_list_lock);
>   
> -		/*
> -		 * Guilty job did complete and hence needs to be manually removed
> -		 * See drm_sched_stop doc.
> -		 */
> -		if (sched->free_guilty) {
> -			job->sched->ops->free_job(job);
> -			sched->free_guilty = false;
> +			wake_up_interruptible(&sched->done_wait_q);
> +		} else {
> +			/* The job needs more time.
> +			 */
> +			drm_sched_start_timeout(sched);
>   		}
> -	} else {
> -		spin_unlock(&sched->job_list_lock);
>   	}
> -
> -	spin_lock(&sched->job_list_lock);
> -	drm_sched_start_timeout(sched);
> -	spin_unlock(&sched->job_list_lock);
>   }
>   
>    /**
> @@ -511,15 +509,13 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>   			else if (r)
>   				DRM_ERROR("fence add callback failed (%d)\n",
>   					  r);
> -		} else
> +		} else {
>   			drm_sched_job_done(s_job);
> +		}
>   	}
>   
> -	if (full_recovery) {
> -		spin_lock(&sched->job_list_lock);
> +	if (full_recovery)
>   		drm_sched_start_timeout(sched);
> -		spin_unlock(&sched->job_list_lock);

Same here.

Regards,
Christian.

> -	}
>   
>   	kthread_unpark(sched->thread);
>   }
> @@ -667,47 +663,6 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>   	return entity;
>   }
>   
> -/**
> - * drm_sched_get_cleanup_job - fetch the next finished job to be destroyed
> - *
> - * @sched: scheduler instance
> - *
> - * Returns the next finished job from the pending list (if there is one)
> - * ready for it to be destroyed.
> - */
> -static struct drm_sched_job *
> -drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
> -{
> -	struct drm_sched_job *job;
> -
> -	/*
> -	 * Don't destroy jobs while the timeout worker is running  OR thread
> -	 * is being parked and hence assumed to not touch pending_list
> -	 */
> -	if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
> -	    !cancel_delayed_work(&sched->work_tdr)) ||
> -	    kthread_should_park())
> -		return NULL;
> -
> -	spin_lock(&sched->job_list_lock);
> -
> -	job = list_first_entry_or_null(&sched->pending_list,
> -				       struct drm_sched_job, list);
> -
> -	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
> -		/* remove job from pending_list */
> -		list_del_init(&job->list);
> -	} else {
> -		job = NULL;
> -		/* queue timeout for next job */
> -		drm_sched_start_timeout(sched);
> -	}
> -
> -	spin_unlock(&sched->job_list_lock);
> -
> -	return job;
> -}
> -
>   /**
>    * drm_sched_pick_best - Get a drm sched from a sched_list with the least load
>    * @sched_list: list of drm_gpu_schedulers
> @@ -761,6 +716,44 @@ static bool drm_sched_blocked(struct drm_gpu_scheduler *sched)
>   	return false;
>   }
>   
> +/**
> + * drm_sched_done - free done tasks
> + * @param: pointer to a scheduler instance
> + *
> + * Returns 0.
> + */
> +static int drm_sched_done(void *param)
> +{
> +	struct drm_gpu_scheduler *sched = param;
> +
> +	do {
> +		LIST_HEAD(done_q);
> +
> +		wait_event_interruptible(sched->done_wait_q,
> +					 kthread_should_stop() ||
> +					 !list_empty(&sched->done_list));
> +
> +		spin_lock(&sched->job_list_lock);
> +		list_splice_init(&sched->done_list, &done_q);
> +		spin_unlock(&sched->job_list_lock);
> +
> +		if (list_empty(&done_q))
> +			continue;
> +
> +		while (!list_empty(&done_q)) {
> +			struct drm_sched_job *job;
> +
> +			job = list_first_entry(&done_q,
> +					       struct drm_sched_job,
> +					       list);
> +			list_del_init(&job->list);
> +			sched->ops->free_job(job);
> +		}
> +	} while (!kthread_should_stop());
> +
> +	return 0;
> +}
> +
>   /**
>    * drm_sched_main - main scheduler thread
>    *
> @@ -770,7 +763,7 @@ static bool drm_sched_blocked(struct drm_gpu_scheduler *sched)
>    */
>   static int drm_sched_main(void *param)
>   {
> -	struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
> +	struct drm_gpu_scheduler *sched = param;
>   	int r;
>   
>   	sched_set_fifo_low(current);
> @@ -780,20 +773,12 @@ static int drm_sched_main(void *param)
>   		struct drm_sched_fence *s_fence;
>   		struct drm_sched_job *sched_job;
>   		struct dma_fence *fence;
> -		struct drm_sched_job *cleanup_job = NULL;
>   
>   		wait_event_interruptible(sched->wake_up_worker,
> -					 (cleanup_job = drm_sched_get_cleanup_job(sched)) ||
>   					 (!drm_sched_blocked(sched) &&
>   					  (entity = drm_sched_select_entity(sched))) ||
>   					 kthread_should_stop());
>   
> -		if (cleanup_job) {
> -			sched->ops->free_job(cleanup_job);
> -			/* queue timeout for next job */
> -			drm_sched_start_timeout(sched);
> -		}
> -
>   		if (!entity)
>   			continue;
>   
> @@ -820,8 +805,7 @@ static int drm_sched_main(void *param)
>   			if (r == -ENOENT)
>   				drm_sched_job_done(sched_job);
>   			else if (r)
> -				DRM_ERROR("fence add callback failed (%d)\n",
> -					  r);
> +				DRM_ERROR("fence add callback failed (%d)\n", r);
>   			dma_fence_put(fence);
>   		} else {
>   			if (IS_ERR(fence))
> @@ -865,7 +849,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   
>   	init_waitqueue_head(&sched->wake_up_worker);
>   	init_waitqueue_head(&sched->job_scheduled);
> +	init_waitqueue_head(&sched->done_wait_q);
>   	INIT_LIST_HEAD(&sched->pending_list);
> +	INIT_LIST_HEAD(&sched->done_list);
>   	spin_lock_init(&sched->job_list_lock);
>   	atomic_set(&sched->hw_rq_count, 0);
>   	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> @@ -881,6 +867,21 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		return ret;
>   	}
>   
> +	snprintf(sched->thread_done_name, DRM_THREAD_NAME_LEN, "%s%s",
> +		 sched->name, "-done");
> +	sched->thread_done_name[DRM_THREAD_NAME_LEN - 1] = '\0';
> +	sched->thread_done = kthread_run(drm_sched_done, sched,
> +					 sched->thread_done_name);
> +	if (IS_ERR(sched->thread_done)) {
> +		ret = kthread_stop(sched->thread);
> +		if (!ret) {
> +			/* free_kthread_struct(sched->thread); */
> +			sched->thread = NULL;
> +		}
> +		DRM_ERROR("Failed to start thread %s", sched->thread_done_name);
> +		return ret;
> +	}
> +
>   	sched->ready = true;
>   	return 0;
>   }
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 3a5686c3b5e9..b282d6158b50 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -169,6 +169,12 @@ struct drm_sched_fence {
>   
>   struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>   
> +enum drm_job_status {
> +	DRM_JOB_STATUS_NONE    = 0 << 0,
> +	DRM_JOB_STATUS_DONE    = 1 << 0,
> +	DRM_JOB_STATUS_TIMEOUT = 1 << 1,
> +};
> +
>   /**
>    * struct drm_sched_job - A job to be run by an entity.
>    *
> @@ -198,6 +204,7 @@ struct drm_sched_job {
>   	uint64_t			id;
>   	atomic_t			karma;
>   	enum drm_sched_priority		s_priority;
> +	enum drm_job_status             job_status;
>   	struct drm_sched_entity         *entity;
>   	struct dma_fence_cb		cb;
>   };
> @@ -284,15 +291,22 @@ struct drm_gpu_scheduler {
>   	uint32_t			hw_submission_limit;
>   	long				timeout;
>   	const char			*name;
> +	char                            thread_done_name[DRM_THREAD_NAME_LEN];
> +
>   	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
>   	wait_queue_head_t		wake_up_worker;
>   	wait_queue_head_t		job_scheduled;
> +	wait_queue_head_t               done_wait_q;
>   	atomic_t			hw_rq_count;
>   	atomic64_t			job_id_count;
>   	struct delayed_work		work_tdr;
>   	struct task_struct		*thread;
> +	struct task_struct		*thread_done;
> +
>   	struct list_head		pending_list;
> +	struct list_head                done_list;
>   	spinlock_t			job_list_lock;
> +
>   	int				hang_limit;
>   	atomic_t                        score;
>   	bool				ready;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
