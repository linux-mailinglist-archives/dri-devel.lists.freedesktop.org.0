Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C61655E6660
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 17:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A840610EB4F;
	Thu, 22 Sep 2022 15:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAE510EB4F;
 Thu, 22 Sep 2022 15:03:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXiqiKSryLK2gGlr18wXyzqK38lEzkAavTKOyWMsRpeiwk6EwzSGV2Nk4HHT5FbYdrlHTOSHG7vfUna2GQvw8uJJKPQtTp4rIv0IjaHlK7pr3vXcv4rZ2IkZol13SY7gS0lBI0mdZCJl4CKM8wLjKv14fOt3vQz5NhvohJ1vBexT0YHWbVkUZILiUHp+9Rv+sW/S5Fic4g3QMyAR5WUU7DavhSeXCn9mB0H5lMOo7Vr4CSMekhb8jQ5rcJIkVkL1/tzBNBNEhWv5cLnz9NVLu6/wFvXdSauunqvk8UcG4LwcI+HcskWeo1ylZb7xBQ11MSHuc3zZnuPsUNc507/fNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zOJfCUo9jzv82urDv0/i25wMT4tea3hef/GZnkQaHM=;
 b=hx3p+ZpOYUI4gNzIIVzKphE5kDvMy+hq2/3mPTHDhDD0g9G8byJD7/wxs+4RcewGsYaUywzDh+wLXTRoxVGhEpAWNlNK4YzZwo2B0z4vwjRipnE0tfzVvC4Grg7/B+1y1E9m364PcnNkKY1Q4EtEv7xyE0jp9OqtQiRo/KREn5xiW+Gw80aqZ7qABwyH//hgTt8T7sWiSwOzWSUxvtT3uI8aVK1DTt+rEnnU2q7LmyYLOsenBipLFjFRzRPhjzT2TXPs7/rmCkJ40RR+gU6GHs5TPwiYfUKPNsRknLYuVypVjRBxqi0AUufolMurvVXdsgiKgNuCvjkEKelZOTAUvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zOJfCUo9jzv82urDv0/i25wMT4tea3hef/GZnkQaHM=;
 b=ZMXkpDbJO22Xz4iTcClhroYxllN52ezJ1yuTit7ew7FacI+9WYuszZ8J0AS0CG6IC6ZgHpnQ8HWfVunqLWx8qlvk3ZPqZwbag1N1PItYvHYgyPXiQ7Huoj7OubSJj55eLTmB23uHMK2gl8H03y8KyTZLyvh5NNKs4BTB7S+fXls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MW3PR12MB4587.namprd12.prod.outlook.com (2603:10b6:303:5d::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.19; Thu, 22 Sep 2022 15:03:23 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::c549:82d4:60d9:2a8a]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::c549:82d4:60d9:2a8a%3]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 15:03:23 +0000
Message-ID: <5c3e72bb-0df7-b76c-1679-5bbb571e4a2c@amd.com>
Date: Thu, 22 Sep 2022 11:03:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4] drm/sched: Add FIFO sched policy to run queue v3
Content-Language: en-CA
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20220921182831.25214-1-andrey.grodzovsky@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20220921182831.25214-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::7) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MW3PR12MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b7799ec-94d8-4bde-2a75-08da9cab97ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iRlx65szYIlEhnvi8Eh4s6l/sHuoerAhETdaNr3K04y/crO8uLitmTaWMi5vgA0hoqSKEJkG1nLcqMvCmWPExeu1xTEE/OGM+VAX5Queg+lBA6GO9ukT4wSQnlFvQjM1nUzJKpZdinayjj/6v77GLlUwH0lAkMNv0NNBwKOzN+mO1pc3ENQOG5waPtLKhX2iX9+pm667AU6WGAFE3mlMfuD5z6yk+qUbzG6Rifd9eizjnwrDKCrdN5zR80owQriPCFxouHKIckaysU0Y1+rQ+54+pzSaXhBhHmBpzjy0bib/Df5ZmV6WXNZ9PvwvPO/BEMNuKsb5ESJu5N3dH5w75EuDMx9bAWxS/5mDnoothLrNXXeioxZ0yVE+OIlUhIkbW6nXrhJOjjaPEtSMZhw4wh0W7aFmifiIO36GcY6RXGZSQYeb8NAPyU2pXGdjOMX0QnSZ1VvmWc06WdE0jwFUnrwOAA7ZAXPoKsCvWwE6NjN44wd06lC7BPH/T0+t9fHL3rHKSvo27Hy4Pnlr5BHad0NlaT/VsogH2tXkjmXrh049eqwZtte3ioJ1SZZiXpAGaBMLFz8cgrFVYsWQPqOgU1ifRP5/hBzd69zAQfEZYCMpC6Vn9vSojg2q2uAbGU0K+y7w2S/FydVSs1o4IAmDL0dtUYOIs+TWSGDdvmldog9PlDY2e6cvK/7xFqEUV2GceEX19YKoOGV5N72tyAd8S4KA64Mx2x43ESwC8ZBvB068YdlxbJvgNCsYF7BcfFtBvP6IMuDDSFqr/ngDDFsBVroEr72aT1XZJGRABozDKm0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199015)(30864003)(38100700002)(478600001)(44832011)(41300700001)(31696002)(36756003)(6486002)(5660300002)(2906002)(86362001)(66556008)(8936002)(66476007)(316002)(26005)(6506007)(53546011)(6512007)(4326008)(83380400001)(66946007)(8676002)(186003)(2616005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFMwTHEzTXRXVFZOSTJHUFZQeXpsNm9tRkRYVVdmb1F1NFJWQWJOREo1S2ll?=
 =?utf-8?B?NUFuZFE2MnFTWFpGSDhwMVlhUlNHMzVrcVRpTG5PK2k1Ym5MTE9IOUdOWVVs?=
 =?utf-8?B?d3FDejI3bkdjRTRHMWZQdGZzNHV6L2NvMDZMNW9Uay8xNEdYUlNaQlR2elEz?=
 =?utf-8?B?MzlZSWo0U29wV3IySFpFSmlkaGVRL2hnNmNzSW44SlNGNGZuRmkyU05KYWtl?=
 =?utf-8?B?bGJMV0t5UVVoRSswcmREL1lqaFZObnNkSXA5dVhhWXhpTWJheTlqK0xqcHhU?=
 =?utf-8?B?dTFEZEJFdFBkcXd4K2tsVXdibXpobCs4cFE1VlFwUkRuYWtsQ21Xem0zcS9I?=
 =?utf-8?B?em5GSXcwSVdMeEpqdzVOclZMOGR2Y09rN1RyWGJDeXg5aGtXU1ZNQ3JCQmRK?=
 =?utf-8?B?Sk50azNrTm9xb00yNU5LWncvekVVNVZpR0JRU0t3TGwvVWMrTmMwaFdJZTFq?=
 =?utf-8?B?TC9DUzhReWhjZFJvMWhGWlk3WFhGdlhyT3o0K0d2U1pYN29tYUxkYjVkRUVt?=
 =?utf-8?B?L2g5RnovQmxNSmEvZDVaTlp2em5yWUFxendoMEJYbS9pYVhPK1MyVmJhbXpJ?=
 =?utf-8?B?N1Jmc0N4VzNBQmZGZkdsYzJQNXpjaElqejZCSXZ4Vmw4SVdxcFB3Vm9Gelpz?=
 =?utf-8?B?clZ3YysyUjRIM0lFdTNyekVsZGEzNklMM3k1RHdqWUhlVXJlc0dKT1I2aGZo?=
 =?utf-8?B?VE5mdWNmNENIeVJxMlJXSCtzalhPVjVJb0NwV3RuQ2JwcDU3MmdwWHc1aTlv?=
 =?utf-8?B?Y0x0a2h6My90eHJrWEtSVGlTdGM2K1VEcm84RnRURGxaVTdTZk5GVlpqT1p6?=
 =?utf-8?B?WC8zNExuSUluTDdyMk9tT1k3dWhpWDlrUGJYalcxRzI5MGQ4alorKzZiSTlr?=
 =?utf-8?B?dndtSnpsMVlHVXdQaWFIS0M4WlhkSjh5RndxUGEwZ3BUMWRScHpzRzdsQ0ZW?=
 =?utf-8?B?ZVhOTUZwZ0NsMGNWbkdwSUdwTXRmN1V3Q0NBc1VvekxIZENWa1VzVDJISEpj?=
 =?utf-8?B?eHBma1JnY1JUOG5JR21FdXUvenE2VnJueUdBWFNXVWJMWkpvWDRwTlFZakc5?=
 =?utf-8?B?MjRkSStRTlR4N3V0NHo5aFVxWDB0UFJsNUtXZE02L0xvS0NNSFgxQ21iZE54?=
 =?utf-8?B?ZWkxcGFlUU5pYWErZm00REJ1Q3VoSEVodjRnY1U5UW9GUjkwOXQxMUFGalJ2?=
 =?utf-8?B?OXY2TEhqWFNYMVNSQTV1TDgrYXRMcG04U0I3Q2NCcVM0SzV6Q0drVzN2MVkw?=
 =?utf-8?B?NlFrOTFlME9pMnlLajh4L252QlZCRHZ0dzQ0NW5PZm9QZ2VuTkM5WnhuVG1o?=
 =?utf-8?B?MHFIQVdSaXRwS2NFRlF4amtqY1MzVmxvTVVKNmJqNGYzVUEvdmpzeVQwdEhG?=
 =?utf-8?B?aEY2WW1QNnIxdW9XN0dlWlA0ZHMvWUphdTJBamI2N2VGeUsrVlJLZndFNEgv?=
 =?utf-8?B?UUc0T1E0OFByS1hLblQxbnl5QTdPYVltbGtNbGlVRkZRaDJ1WEVyZE9QaEMw?=
 =?utf-8?B?ejBJUzI2Z2FOSnRBMDRkTFBCUWM3VzE5aElZRWJ4YzBZNXZ5N2hMVzUwcFo2?=
 =?utf-8?B?Ylduak8xV2RjamtXK3dKVldMcHY4TDVsY0pHQjZLdmxQaHo0UTZwZkJVTVVW?=
 =?utf-8?B?UEp4dExmV2ozOGliMnFqTTlLM3FXRitBcTRpcUxaYUdLNzg0WGxPdkQ4b3Rz?=
 =?utf-8?B?WGhPYVd2dWc1YnZkbWY5ZUc4RVBYT3JGUFhSSmNWWTlXc1luYmQ5b1ZZcE00?=
 =?utf-8?B?aUFIUFpPM1VFL1ZwbUtTaEgwMkQ1TFZ3bURrc2poSFV1OG5McnFCR01Fa2hp?=
 =?utf-8?B?MjI0VWhuTU1wYUFpYU5BWFExRXVLa1VuMHErVXhpaVJzbzhNREFjRFV3aUZz?=
 =?utf-8?B?S2Zja0hyUk5kalNkbGU3SE1TaG9ZTWFQL0JFNTZ1VTN3ZmNqeUVZeG9CT0Rh?=
 =?utf-8?B?bXRRem5ST2t5djdWSHN4VjRhdGltUU5MNmhCK1d5UlI1a2JYTXYwZCtZU0J3?=
 =?utf-8?B?bXY0ZkpkZ1ZUTUxMNm5nTHNOdXFXOWRvUmFlMk5KL1p1cmRxUVFGM0FCL0lK?=
 =?utf-8?B?MThtN2p6TE9OWHZLQXYrZ08xNkFXN1JaWDhtVEZHaEhwbDI1R2Z2YkdtQXRF?=
 =?utf-8?Q?CFHGOUg2MB1XJ/HKQy9rsdXpE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7799ec-94d8-4bde-2a75-08da9cab97ef
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 15:03:23.0751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xh6Pfdy2SH3jvFSJI0OW0jehgzb9WjdE5jujbxV3/n0wbH2rtmRCGxv6D/SLBNRe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4587
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

The title of this patch has "v3", but "v4" in the title prefix.
If you're using "-v" to git-format-patch, please remove the "v3" from the title.

Inlined:

On 2022-09-21 14:28, Andrey Grodzovsky wrote:
> When many entities competing for same run queue on
> the same scheduler When many entities have  unacceptably long wait
> time for some jobs waiting stuck in the run queue before being picked
> up are observed (seen using  GPUVis).

Use this as your opening:

"When many entities are competing for the same run queue on the same scheduler,
we observe an unusually long wait times and some jobs get starved. This has
been observed on GPUVis."

> The issue is due to the Round Robin policy used by schedulers
> to pick up the next entity's job queue for execution. Under stress
> of many entities and long job queues within entity some
> jobs could be stack for very long time in it's entity's

"stuck", not "stack".

> queue before being popped from the queue and executed
> while for other entities with smaller job queues a job
> might execute earlier even though that job arrived later
> then the job in the long queue.
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
> Various cosmetical fixes and minor refactoring of fifo update function. (Luben)
> 
> v4:
> Switch drm_sched_rq_select_entity_fifo to in order search (Luben)
>    
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c |  26 +++++-
>  drivers/gpu/drm/scheduler/sched_main.c   | 107 ++++++++++++++++++++++-
>  include/drm/gpu_scheduler.h              |  32 +++++++
>  3 files changed, 159 insertions(+), 6 deletions(-)
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
> index 4f2395d1a791..565707a1c5c7 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -62,6 +62,64 @@
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
> +		 "specify schedule policy for entities on a runqueue (DRM_SCHED_POLICY_RR = Round Robin (default), DRM_SCHED_POLICY_FIFO  = use FIFO");
> +module_param_named(sched_policy, drm_sched_policy, int, 0444);
> +
> +static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
> +							    const struct rb_node *b)
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
> +		      drm_sched_entity_compare_before);
> +}
> +
> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
> +{
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

I thought you were going to drop one of the locks here?
Address this by either updating the comment to explain to future programmers
what is going on here and why the locking is not consistent (2 vs 1 lock),
or drop one of the locks, as per my previous review.

> +
>  /**
>   * drm_sched_rq_init - initialize a given run queue struct
>   *
> @@ -75,6 +133,7 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>  {
>  	spin_lock_init(&rq->lock);
>  	INIT_LIST_HEAD(&rq->entities);
> +	rq->rb_tree_root = RB_ROOT_CACHED;
>  	rq->current_entity = NULL;
>  	rq->sched = sched;
>  }
> @@ -92,9 +151,12 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
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
> @@ -111,23 +173,30 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>  {
>  	if (list_empty(&entity->list))
>  		return;
> +
>  	spin_lock(&rq->lock);
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
> @@ -163,6 +232,36 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>  	return NULL;
>  }
>  
> +/**
> + * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
> + *
> + * @rq: scheduler run queue to check.
> + *
> + * Find oldest waiting ready entity, returns NULL if none found.
> + */
> +static struct drm_sched_entity *
> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> +{
> +	struct rb_node *rb;
> +	bool found = false;
> +	struct drm_sched_entity *entity;
> +
> +	spin_lock(&rq->lock);
> +	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
> +		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> +
> +		if (drm_sched_entity_is_ready(entity)) {
> +			rq->current_entity = entity;
> +			reinit_completion(&entity->entity_idle);
> +			found = true;
> +			break;
> +		}
> +	}
> +	spin_unlock(&rq->lock);
> +
> +	return found ? entity : NULL;
> +}

You really don't need "found", and you don't need "entity" to be outside the loop.

As per my last review, use this (which I've compiled and run):

static struct drm_sched_entity *
drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
{
	struct rb_node *rb;

	spin_lock(&rq->lock);
	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
		struct drm_sched_entity *entity;

		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
		if (drm_sched_entity_is_ready(entity)) {
			rq->current_entity = entity;
			reinit_completion(&entity->entity_idle);
			break;
		}
	}
	spin_unlock(&rq->lock);

	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
}

The only way we can exit the loop is,
1. The loop invariant is false, i.e. rb == NULL, or
2. The "break;" jump from inside the if () inside the loop.

Also note that "rb" does NOT need to be initialized, since, the for() statement
is always executed, and the assignment "rb = rb_first_cached(&rq->rb_tree_root);"
initializes it--this is why GCC doesn't complain :-)

Also note that you don't need to export "entity" as it makes the for() loop relocatable
to another function with only having a dependency on "rb" being defined--the loop
is self-contained.

At the "return" statement, we know that we've exited the loop, by either the loop
invariant being false, i.e. rb == NULL, or by the "break;" jump, in which case
we know that rb != NULL. This is why the "return;" statement as presented above works
correctly.

Please use that function in the way it is above, which is minimal and mature.

Regards,
Luben

> +
>  /**
>   * drm_sched_job_done - complete a job
>   * @s_job: pointer to the job which is done
> @@ -803,7 +902,9 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
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
> index 599855c6a672..1f7d9dd1a444 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -50,6 +50,12 @@ enum drm_sched_priority {
>  	DRM_SCHED_PRIORITY_UNSET = -2
>  };
>  
> +/* Used to chose between FIFO and RR jobs scheduling */
> +extern int drm_sched_policy;
> +
> +#define DRM_SCHED_POLICY_RR    0
> +#define DRM_SCHED_POLICY_FIFO  1
> +
>  /**
>   * struct drm_sched_entity - A wrapper around a job queue (typically
>   * attached to the DRM file_priv).
> @@ -196,6 +202,21 @@ struct drm_sched_entity {
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
> +
>  };
>  
>  /**
> @@ -205,6 +226,7 @@ struct drm_sched_entity {
>   * @sched: the scheduler to which this rq belongs to.
>   * @entities: list of the entities to be scheduled.
>   * @current_entity: the entity which is to be scheduled.
> + * @rb_tree_root: root of time based priory queue of entities for FIFO scheduling
>   *
>   * Run queue is a set of entities scheduling command submissions for
>   * one specific ring. It implements the scheduling policy that selects
> @@ -215,6 +237,7 @@ struct drm_sched_rq {
>  	struct drm_gpu_scheduler	*sched;
>  	struct list_head		entities;
>  	struct drm_sched_entity		*current_entity;
> +	struct rb_root_cached		rb_tree_root;
>  };
>  
>  /**
> @@ -314,6 +337,13 @@ struct drm_sched_job {
>  
>  	/** @last_dependency: tracks @dependencies as they signal */
>  	unsigned long			last_dependency;
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
> @@ -503,6 +533,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>  void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>  				struct drm_sched_entity *entity);
>  
> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts);
> +
>  int drm_sched_entity_init(struct drm_sched_entity *entity,
>  			  enum drm_sched_priority priority,
>  			  struct drm_gpu_scheduler **sched_list,
