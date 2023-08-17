Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF5D77F7E9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 15:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC3010E47D;
	Thu, 17 Aug 2023 13:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D21C10E47D;
 Thu, 17 Aug 2023 13:39:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYobSVjcw3qP6EoGl6Z+ZdDicPnJ4c58bjHqp4c6GHmwwDnwgAG85YixM+5K1ZcmRI+wiVG4GbNSU9bK7JE67NdtPjrC9II9QIHNYrvwW7qVpGikma46C3AnyqrWr/JdaoYS7IWyRkVrwQKxE8Zg1hBwfbNYdyqJDCKwKhtvtAUVk8WSNjalAhfUUIMuq/9QHckXTbApaKXmaFbGNgN6x09Xu7AxXJLRwJoKdZQpvrJdU+H3v/4Nvd/MU5p3zoHnXXQfLleoeUPzo/uDYNz/c9MgGR+RfmBn4RpF1Ozir2ugGvR8scm5u1YTec1kymBq/fx3np8UilNSYWfrNBGX/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6Ioo3lkWNzsbE4VuBzUdXNX4Hb055s3GdCfO23bOqg=;
 b=Rz25kEkThUIMLEvfpZWEeruwa17sFFYcspAndhtUupCaad6rpGuAwahFYSryFF4bcDQg4RqU8YhUWES3WeQBVJL9iaKl39r6lj3ypLl8a4vgJe+oE/XkHVzi6qV9C3pvRB2hZva8ZLYXBbYzzz6yosI4VNccefGY4aGa1PgCdxF5GS82Zn+wMiXAu+m/u5+3dksPY97cbbuvBc8iKIPVSkxUuQf/7jF3W4WPBaZPR57a+9Id+8L2sk8dyeXh4Ii8YBkdMMR+I1dCvKx1plLoT+DFZsx5txsO2D4Z5AnE6VkmIRXiLiYDHcPfB+kSYe9kGseoaeJ9g4AtYZUKPEq+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6Ioo3lkWNzsbE4VuBzUdXNX4Hb055s3GdCfO23bOqg=;
 b=GlhqUUcwKJ7dqBCP4u7xOl1kv8bZDeVQojAXhipdu54MAxnA8cghfZ1hmhEjYhplU01aRWUdu14Y4W2mLWeS350X+rsxGKulGouQYt9rg1KmKblgK3YhHhXjY0sDlCvjAHU6NKUzP85KQM06WIJ8IoKsl41/lCUI95ZeQwQjPwU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB8425.namprd12.prod.outlook.com (2603:10b6:510:240::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Thu, 17 Aug
 2023 13:39:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 13:39:47 +0000
Message-ID: <f6b7c246-fd87-a853-b7c4-e2c1b6727a93@amd.com>
Date: Thu, 17 Aug 2023 15:39:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230811023137.659037-5-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: c4803d96-bd8f-415f-e9d0-08db9f276c6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VTn9LZ3gI4hQo4mf7bMUxczYBtXXHiplsm/pAN2R4Lf4wG9xzICk7Lf6wxM0orIaEUp8AvJNdEKDGKG0gZiHdc3/juRVz8XjlBVu1KhMxlUagvzW4QFddSwhozn/lXQIscySdZBLr+Ms9KbXWj6PgqELsfFyB84CKH7M81dlRpWNOvvjwvMXbEZ2f3mFFt+0wOEdz4cQ3SoxtGpbti5COWOvCq8ytCTk/4O7dbcADVnGmTydeDznDfBmZFs1JH9m86fxYmMWD4X+/xnSUvgzoWOSsZ4Etg/l1MY7148EYrLCtNIemgaCvZNqBZdJyt/TaXKl4CrEqIIVjylIq0zkoO8FSxj2+NARkvU8hg0nX/f1OEuXxmD0DNgUI3drd7kQYZOLx26LglpwqkTRMGlrf4McBhrL4fHn6gKI0Z70oHGn9Rjwu5PW+E3hKj36Pjagb1ZoejjY64BqahLjBRWu64N3ENJPzGqzXDCHstw3yFNhHOnKqUrsQWEAhjIXBsrWpxg3OHj97JrBGlqLPwJzylcCmfkvHX8KBxfOvvaZt76Ne6oFuD8mQZs6VNQM+jucqQXvm1kdXg89RGrksXVxJEe95l6XJwuTwp/gDE+H/adPg6RlPbxIHXsi2+DiHBVEJDOviFTB4l9gA20RwSUh/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(346002)(376002)(39860400002)(186009)(451199024)(1800799009)(36756003)(86362001)(31696002)(31686004)(8676002)(4326008)(83380400001)(5660300002)(2906002)(8936002)(30864003)(41300700001)(26005)(6506007)(6666004)(6486002)(2616005)(6512007)(66946007)(478600001)(38100700002)(66476007)(316002)(7416002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aElKMm5Sd2JscEJhTDZrT3A1dGpSRDByZUdCMmJ2bEJRMjd0WGE2SEVzTVFx?=
 =?utf-8?B?alA2TDdaMGxNeGhHWkxDek5scmhZcmVyd3poZ1dJOTZsQ0NkUG1MYUJBSS8z?=
 =?utf-8?B?Yi9NMnRJK1hhTjk3OG1SUXJDRkpkKy9ENmJ1RjJ4bjhtc1RqWUk4T1lsNWh2?=
 =?utf-8?B?NEgvZmZvR0s4R0x1MzZGRzNVaTJEckorR1Z5YjIwRjE3V2JBUmFrUTJyRUkw?=
 =?utf-8?B?Q3o3NmFMdGZmZENIU0xmaEdtdWtJMFFWelBlR0NEdnpLdlNDYjBXMzZPbVJQ?=
 =?utf-8?B?S2g1SWxvVVduV1ZvL09OY2ZSelNmRWRIUGdIajhXcjdNbmZlMlA3VVFYRzM5?=
 =?utf-8?B?U0JpTE5rZWhPOGI3Mnd2M0pYNFlCdzY4dGZTTzl4RHNNRUNYeUxWQm1BdU9y?=
 =?utf-8?B?QzF5eHRia0Q4S0VUVWhoalc3Z3ZOM1NQb0dwdUVKbEwyNHY5SW96K2hTejV1?=
 =?utf-8?B?MzFNc0doMVdXbVlqeVA1ZDhRMzVWeWxaTlNmQnBjQmtrWStXWW9zSG56RjBi?=
 =?utf-8?B?T0dmUUM3UXlaTGVOcHptNVRYZjIyMzJFR1drTCtVdlNPb1p5WklieUZka0Rw?=
 =?utf-8?B?aFhVeGlCb0xaS2pOQzE4SnhWSU9iSnpQUjRmU1E0TlhKZEZob2xkNkpjWHVI?=
 =?utf-8?B?QU1iN2ltdmw3enpIbjhScFhjOGxraHkzSUxxWHp3QjlpUWkvclZxNy9oMUZo?=
 =?utf-8?B?Q2NnSWIvQW9XeXJnNXdUSXpYV2ZwUWs2ZEJ2YVdaQnFwQW5mRFZaRFI2TmpG?=
 =?utf-8?B?TFNsdFNPQ21PNkFhZUJKWXdmZzBFaWZyS1FIWmFIQlkzWkxhK1JlZVJYM2Fo?=
 =?utf-8?B?Wmk2bzZtTGl2UTB4YjFBcE41MlE0Zk1BajhVSS9rUlpSNFBWTy93bmo0WGRN?=
 =?utf-8?B?dGJ0aFdyNjdOWEpudVV3SlZLM0ZBbUtQMFVhT2RkejFSL1VxaHRMQnRKZVl0?=
 =?utf-8?B?ZVpCWDcwSWc5cWtSaEJ3a1ZSbG5KalBxY2JlNktzU2w5SXM1RjZ0OFQyb3Ar?=
 =?utf-8?B?SmZ2eG0zRVEyYURBOTQwQ3BBSWtwSUd5M0dsdFBOaUZqNGFtSmdmMUswOG9R?=
 =?utf-8?B?R0FQdEJLcXZYSCs4NmowSlc0VEZSZ1lhNlFFS3BXNWtRVG50WEtJbWZTR01p?=
 =?utf-8?B?eTBCV1BXc2VOaFN1NXhuMXdueWJLczNwTHQrNDBuQ1JuUGFqNXpBTnFwMEhQ?=
 =?utf-8?B?L3FGakgrNmg5VURoVzBmSkFlNVJhWWN4NWZHQS9ZandJQTdKRXZZOEZxSVkv?=
 =?utf-8?B?UW9mNVNiWTF5WjEyZFBMK1gwZnA3ZzY1SE43bE1rT044cEYraDlTSDJVcjVl?=
 =?utf-8?B?YmZjTVVZRjJCUVQ5OTRweEplSzAzQjF3VDNNVWo1R2t0b0VsZkMwampHdVV2?=
 =?utf-8?B?UE12UW04dzNNbVlGYmxXRmNIQ2thbFZzYUhla3haTFZCN0xiSTlnV2owekd0?=
 =?utf-8?B?ZTRveWlNVVN5VDdJaVBKbVowc0czQ1lEem9Lbk5LOE5NWFBCbWJBM0lCWFcy?=
 =?utf-8?B?emsxNXNlKzFxV1dFVElYelRpdHlUNzh1SXZNaTFscjRUNzU3ZVdJd2thYXQ2?=
 =?utf-8?B?Z2NQb3I4alVHUU1CVU9JamFiUmczRWJTRzRnc1UrL0xaZjd0YWpIUXc4QWVT?=
 =?utf-8?B?Y1FleWUxV0cxSERNSk9iTTFWUmJFSnVhM0FCaGVsQzFLQ2dKTEZiQ1FzRlR4?=
 =?utf-8?B?UitncWZENG5CM3c3VXA1anlZVTgyeWpQbURMeE1WeXhOUWNQREUxWG1mZkFR?=
 =?utf-8?B?RERBYUNxMFBjcndUWEJpMDRJRUNKOTlFN25Edmg3Zk1uWG05dlE5Q2VMdHhu?=
 =?utf-8?B?Wk5BRFRKZEMyWHRucVV4WnRyb01Fc3VCV1F6akIxeHNkeG1oN212T1BWdFBj?=
 =?utf-8?B?OUcyODhSa0I5VHFIZzA3emlRODRIbnBhUUFsVWlYL3Z1aUZ5akxkVEIweFRx?=
 =?utf-8?B?WkM0NSt6c2FHZDA5bXQyVERkRjhOUVNzREllQW1lNUlWT3M0TktYTFBITDQ4?=
 =?utf-8?B?RGdxRXkwRlcyVmRBNlZmZnRNQ1djcEhoMmRlYTlKY3AwdHF0akJRem5VMTVB?=
 =?utf-8?B?Zk9zOWRxWERBRk1qc01JbUV2dktsbVhka3pya1htdnRXbUtyVlZNZHpBVHJ1?=
 =?utf-8?Q?usR0E3hscRTAnkot4ExLs1UqJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4803d96-bd8f-415f-e9d0-08db9f276c6e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 13:39:47.7532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pw9EQzC/XnGycfoQggt8eQPIgKbM6wZ2zBA5LfjOdEqP9THZTgBkoaiG9oqGztGh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8425
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 luben.tuikov@amd.com, lina@asahilina.net, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.08.23 um 04:31 schrieb Matthew Brost:
> Rather than call free_job and run_job in same work item have a dedicated
> work item for each. This aligns with the design and intended use of work
> queues.

I would rather say we should get completely rid of the free_job callback.

Essentially the job is just the container which carries the information 
which are necessary before you push it to the hw. The real 
representation of the submission is actually the scheduler fence.

All the lifetime issues we had came from ignoring this fact and I think 
we should push for fixing this design up again.

Regards,
Christian.

>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 137 ++++++++++++++++++-------
>   include/drm/gpu_scheduler.h            |   8 +-
>   2 files changed, 106 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index cede47afc800..b67469eac179 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>    * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>    *
>    * @rq: scheduler run queue to check.
> + * @dequeue: dequeue selected entity
>    *
>    * Try to find a ready entity, returns NULL if none found.
>    */
>   static struct drm_sched_entity *
> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>   {
>   	struct drm_sched_entity *entity;
>   
> @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>   	if (entity) {
>   		list_for_each_entry_continue(entity, &rq->entities, list) {
>   			if (drm_sched_entity_is_ready(entity)) {
> -				rq->current_entity = entity;
> -				reinit_completion(&entity->entity_idle);
> +				if (dequeue) {
> +					rq->current_entity = entity;
> +					reinit_completion(&entity->entity_idle);
> +				}
>   				spin_unlock(&rq->lock);
>   				return entity;
>   			}
> @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>   	list_for_each_entry(entity, &rq->entities, list) {
>   
>   		if (drm_sched_entity_is_ready(entity)) {
> -			rq->current_entity = entity;
> -			reinit_completion(&entity->entity_idle);
> +			if (dequeue) {
> +				rq->current_entity = entity;
> +				reinit_completion(&entity->entity_idle);
> +			}
>   			spin_unlock(&rq->lock);
>   			return entity;
>   		}
> @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>    * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>    *
>    * @rq: scheduler run queue to check.
> + * @dequeue: dequeue selected entity
>    *
>    * Find oldest waiting ready entity, returns NULL if none found.
>    */
>   static struct drm_sched_entity *
> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
>   {
>   	struct rb_node *rb;
>   
> @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>   
>   		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>   		if (drm_sched_entity_is_ready(entity)) {
> -			rq->current_entity = entity;
> -			reinit_completion(&entity->entity_idle);
> +			if (dequeue) {
> +				rq->current_entity = entity;
> +				reinit_completion(&entity->entity_idle);
> +			}
>   			break;
>   		}
>   	}
> @@ -282,13 +290,54 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>   }
>   
>   /**
> - * drm_sched_submit_queue - scheduler queue submission
> + * drm_sched_run_job_queue - queue job submission
>    * @sched: scheduler instance
>    */
> -static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>   {
>   	if (!READ_ONCE(sched->pause_submit))
> -		queue_work(sched->submit_wq, &sched->work_submit);
> +		queue_work(sched->submit_wq, &sched->work_run_job);
> +}
> +
> +static struct drm_sched_entity *
> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue);
> +
> +/**
> + * drm_sched_run_job_queue_if_ready - queue job submission if ready
> + * @sched: scheduler instance
> + */
> +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> +{
> +	if (drm_sched_select_entity(sched, false))
> +		drm_sched_run_job_queue(sched);
> +}
> +
> +/**
> + * drm_sched_free_job_queue - queue free job
> + *
> + * @sched: scheduler instance to queue free job
> + */
> +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
> +{
> +	if (!READ_ONCE(sched->pause_submit))
> +		queue_work(sched->submit_wq, &sched->work_free_job);
> +}
> +
> +/**
> + * drm_sched_free_job_queue_if_ready - queue free job if ready
> + *
> + * @sched: scheduler instance to queue free job
> + */
> +static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> +{
> +	struct drm_sched_job *job;
> +
> +	spin_lock(&sched->job_list_lock);
> +	job = list_first_entry_or_null(&sched->pending_list,
> +				       struct drm_sched_job, list);
> +	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> +		drm_sched_free_job_queue(sched);
> +	spin_unlock(&sched->job_list_lock);
>   }
>   
>   /**
> @@ -310,7 +359,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>   	dma_fence_get(&s_fence->finished);
>   	drm_sched_fence_finished(s_fence, result);
>   	dma_fence_put(&s_fence->finished);
> -	drm_sched_submit_queue(sched);
> +	drm_sched_free_job_queue(sched);
>   }
>   
>   /**
> @@ -906,18 +955,19 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>   void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>   {
>   	if (drm_sched_can_queue(sched))
> -		drm_sched_submit_queue(sched);
> +		drm_sched_run_job_queue(sched);
>   }
>   
>   /**
>    * drm_sched_select_entity - Select next entity to process
>    *
>    * @sched: scheduler instance
> + * @dequeue: dequeue selected entity
>    *
>    * Returns the entity to process or NULL if none are found.
>    */
>   static struct drm_sched_entity *
> -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
>   {
>   	struct drm_sched_entity *entity;
>   	int i;
> @@ -935,8 +985,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>   	/* Kernel run queue has higher priority than normal run queue*/
>   	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>   		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
> +							dequeue) :
> +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
> +						      dequeue);
>   		if (entity)
>   			break;
>   	}
> @@ -1024,30 +1076,44 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>   EXPORT_SYMBOL(drm_sched_pick_best);
>   
>   /**
> - * drm_sched_main - main scheduler thread
> + * drm_sched_free_job_work - worker to call free_job
>    *
> - * @param: scheduler instance
> + * @w: free job work
>    */
> -static void drm_sched_main(struct work_struct *w)
> +static void drm_sched_free_job_work(struct work_struct *w)
>   {
>   	struct drm_gpu_scheduler *sched =
> -		container_of(w, struct drm_gpu_scheduler, work_submit);
> -	struct drm_sched_entity *entity;
> +		container_of(w, struct drm_gpu_scheduler, work_free_job);
>   	struct drm_sched_job *cleanup_job;
> -	int r;
>   
>   	if (READ_ONCE(sched->pause_submit))
>   		return;
>   
>   	cleanup_job = drm_sched_get_cleanup_job(sched);
> -	entity = drm_sched_select_entity(sched);
> +	if (cleanup_job) {
> +		sched->ops->free_job(cleanup_job);
> +
> +		drm_sched_free_job_queue_if_ready(sched);
> +		drm_sched_run_job_queue_if_ready(sched);
> +	}
> +}
>   
> -	if (!entity && !cleanup_job)
> -		return;	/* No more work */
> +/**
> + * drm_sched_run_job_work - worker to call run_job
> + *
> + * @w: run job work
> + */
> +static void drm_sched_run_job_work(struct work_struct *w)
> +{
> +	struct drm_gpu_scheduler *sched =
> +		container_of(w, struct drm_gpu_scheduler, work_run_job);
> +	struct drm_sched_entity *entity;
> +	int r;
>   
> -	if (cleanup_job)
> -		sched->ops->free_job(cleanup_job);
> +	if (READ_ONCE(sched->pause_submit))
> +		return;
>   
> +	entity = drm_sched_select_entity(sched, true);
>   	if (entity) {
>   		struct dma_fence *fence;
>   		struct drm_sched_fence *s_fence;
> @@ -1056,9 +1122,7 @@ static void drm_sched_main(struct work_struct *w)
>   		sched_job = drm_sched_entity_pop_job(entity);
>   		if (!sched_job) {
>   			complete_all(&entity->entity_idle);
> -			if (!cleanup_job)
> -				return;	/* No more work */
> -			goto again;
> +			return;	/* No more work */
>   		}
>   
>   		s_fence = sched_job->s_fence;
> @@ -1088,10 +1152,8 @@ static void drm_sched_main(struct work_struct *w)
>   		}
>   
>   		wake_up(&sched->job_scheduled);
> +		drm_sched_run_job_queue_if_ready(sched);
>   	}
> -
> -again:
> -	drm_sched_submit_queue(sched);
>   }
>   
>   /**
> @@ -1150,7 +1212,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	spin_lock_init(&sched->job_list_lock);
>   	atomic_set(&sched->hw_rq_count, 0);
>   	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> -	INIT_WORK(&sched->work_submit, drm_sched_main);
> +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>   	atomic_set(&sched->_score, 0);
>   	atomic64_set(&sched->job_id_count, 0);
>   	sched->pause_submit = false;
> @@ -1275,7 +1338,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
>   void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
>   {
>   	WRITE_ONCE(sched->pause_submit, true);
> -	cancel_work_sync(&sched->work_submit);
> +	cancel_work_sync(&sched->work_run_job);
> +	cancel_work_sync(&sched->work_free_job);
>   }
>   EXPORT_SYMBOL(drm_sched_submit_stop);
>   
> @@ -1287,6 +1351,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
>   void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
>   {
>   	WRITE_ONCE(sched->pause_submit, false);
> -	queue_work(sched->submit_wq, &sched->work_submit);
> +	queue_work(sched->submit_wq, &sched->work_run_job);
> +	queue_work(sched->submit_wq, &sched->work_free_job);
>   }
>   EXPORT_SYMBOL(drm_sched_submit_start);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 04eec2d7635f..fbc083a92757 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
>    *                 finished.
>    * @hw_rq_count: the number of jobs currently in the hardware queue.
>    * @job_id_count: used to assign unique id to the each job.
> - * @submit_wq: workqueue used to queue @work_submit
> + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
>    * @timeout_wq: workqueue used to queue @work_tdr
> - * @work_submit: schedules jobs and cleans up entities
> + * @work_run_job: schedules jobs
> + * @work_free_job: cleans up jobs
>    * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>    *            timeout interval is over.
>    * @pending_list: the list of jobs which are currently in the job queue.
> @@ -518,7 +519,8 @@ struct drm_gpu_scheduler {
>   	atomic64_t			job_id_count;
>   	struct workqueue_struct		*submit_wq;
>   	struct workqueue_struct		*timeout_wq;
> -	struct work_struct		work_submit;
> +	struct work_struct		work_run_job;
> +	struct work_struct		work_free_job;
>   	struct delayed_work		work_tdr;
>   	struct list_head		pending_list;
>   	spinlock_t			job_list_lock;

