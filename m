Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E572F5EE4CB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 21:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D83710E7D2;
	Wed, 28 Sep 2022 19:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC6C10E011;
 Wed, 28 Sep 2022 19:09:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKAYxYAuInAYHg3BesXylD0O2NKdLDRMTUQEiOzwNpHlP0Z3yexCewBnXeMAyGuAc47yIpCJ7x43ZC/T1J7C6K0lpmZcwsd/YiZAy5j2NbpRntxRUh/+bW1XAUkH/0wpJ0KOW/yJQA1K89iVLihsLCuPojaoiwA6IE7zxlIOkNf8e2WUxx+XB5nrG2Xkz1pwpD19Clx7hq3K5iMrz29Ar8yfUx5XUpGo9vCKIFcnZRs350y/Ji+q3czuJeRS8FYeyelLsKszBEfLq/I8Wy+KxVfoTSwtQNpctoqqLOaOXnBnC9MfJzErozycxPJ5nlMgdLrlKrDbV/C4WfF8ts07+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtaJI3v3TImqsoYOJF1+ldDdVlunkbHknfLQL5HpPL0=;
 b=b3RJJxcv5FlwXR+lCwOLTj/1l0PIxnkbYyHMYu5T+D7XZOWsmjRdq7zTzu2GnvrdX0UEbyX1WGhpQl/EjH+j7DDjouYwssjNrPUVZHpKU9X+eKQWi8X+WaiDnFXgV/b0LzT69lRQIuqVuS9nWBDhgCuNIhO65pU+ocoRA8uV7CeBLbEEQT6hzQXmZOqwApncbRcezQBligxjoVD8pgWrxvujF5VC2Gn7VN6uD3jzjejc8W3bxjKnaS0c3eh0dF/B6AnS7bRfyBFMJuUbeBOvmmhOSEd04oXwvUNiqzdD2HYbQTZTRCerC+d8u4he2a8B/lX1FwoUMtddbQhWzu1Sog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtaJI3v3TImqsoYOJF1+ldDdVlunkbHknfLQL5HpPL0=;
 b=BCLYzWxvA6HxMooMc6Zf/XsZvawB89qnj/tyC6vXmHoOE8Er7PNYkiN36QGd2ZH9kKmCXUhYKfCR0HdOwsh3TDlm70FraQ8T4pe7RVRVI1KsjFvP/lj1mIO5mPxMl56DbbJvmQparVxjo6hPzUxY8y6ImXIQYsck7PVsW8x6PXI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SA1PR12MB7293.namprd12.prod.outlook.com (2603:10b6:806:2b9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.24; Wed, 28 Sep 2022 19:09:12 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::c549:82d4:60d9:2a8a]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::c549:82d4:60d9:2a8a%3]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 19:09:12 +0000
Message-ID: <c685ae37-98d7-552a-f54c-9b4019c4c859@amd.com>
Date: Wed, 28 Sep 2022 15:09:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5] drm/sched: Add FIFO sched policy to run queue
Content-Language: en-CA
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20220928184906.51760-1-andrey.grodzovsky@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20220928184906.51760-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0095.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::11) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SA1PR12MB7293:EE_
X-MS-Office365-Filtering-Correlation-Id: f99bbcc9-0eb1-401a-0846-08daa184eded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uwz7GN6KteNo0yWd3by/qgixK4ilJ0WFFkcr//sw5vJy2xdOuY6ttaB7TLUbcgpGZQ3VAOuZQ6A63QzgUo735h1xLkTs2H6ppKfb2m/ijuxXKF47hr/8sulM+lU8kh6kKFk5XkKqp3BRlJhw9fRcX40seNwd64zH+MTCqV7nNlZ39m3i5OnbuwBt2t+suEB7CTa4RkW00B31j/T2tw3r0H5g3Y1EKueHzIkgt3Dn5dVbJQclDlrIikGewcEepEHH7IdFcaci4HmLYkE1hRHCBkyTWdtMv19XxLVgBFml+NSTxV2hpt8A942iSI+xfKiX0IPl97V/Gv+39DE+luuOTVhEObrc3ZnP+NDO+Ix+VU48l2oUNEVJKxVtCfR2nkFz9z8kVrFq4UuHabLj0vHKGPYMeN45t2nUSS/omlTN/PHCLfLi0YNsyR8+V+lA9JwHKiUkn9e/25h+DTHe5AzYFBRbhRUoqfluU9U+CFL22XNt5/5zjdFApOmIewAEHkaq524RbXZNj8DMbR+FGn3flagzFepbGeVcnDudi9RlfGldxCXqHQYRiYEPq/KhoCImSfhIHy6ygIkYAXsZneDvVcPEsGRB9/WIBWu78iKLMgof4Vov/14+O/HBzHBOLG8VFHT325CorVlrQdRrpUwZL68mqu/tLrH7J3BHQK8B2K7j5kiOGkWHDGLep5i87g06UhFbRtut2WitJvjbj1hYQ+3dTNl/JLzbyok79Plui+LM4Kr95WgTzyVRZRglb3Max9pI9KLffIdvQ7bLtZVUsn0vQDcFiEOlhSA5T0MC3EQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(451199015)(6486002)(5660300002)(8936002)(30864003)(26005)(6512007)(478600001)(36756003)(66556008)(186003)(4326008)(6506007)(8676002)(316002)(31696002)(2616005)(41300700001)(53546011)(83380400001)(66476007)(44832011)(31686004)(86362001)(66946007)(2906002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmJubFphQXBFV2FsYWVTQ3ZHZEdIOFIwNDBrb2xyaHZHek5DeEhNeWtSZkJS?=
 =?utf-8?B?Tk9WaFluTVBIelJyUlpWdG1pbVlXYTJybEJyZDJKRDRHVXIzN3lxVVo1Uzh1?=
 =?utf-8?B?Sk1DMWVYUTlnMHhHSzlQWGFtNW9EMkthczN3Vk51M2g0RHlKbCtBTk1rVjBD?=
 =?utf-8?B?NWRhaFFCTG5Lc1VlVFQ3dkMrR1g2cEU1aW9EeTN2U1llRklvemVXbGI3cGFv?=
 =?utf-8?B?VVRIeTE4ZTRuU2N0Szd5YW9pQVdUSGg2b0h0d2E1RUZGVEFzdzI3RzZuYzJt?=
 =?utf-8?B?WHpxRFN4Sm1WdUw1UUJrbmo2SlZmdEN6ajRtTkY1bG5ja2I0SGRvdzdoS05n?=
 =?utf-8?B?UEZiV1BnSzQ1QyswUGRGU21wbUUvUnkzNVZvSXBzaG5IeEtHdnFPUlM2T2Js?=
 =?utf-8?B?ZlVjSDlMNWhwM1NtczN4aTFqL1l0Wjl4ZW1jdW40b3dYcjFhUy9hMC9JUWUz?=
 =?utf-8?B?UFhkLytrN0lvSkxWZ3VLcHZEYmxhaFJuMkc5SFdsV2tSc3dsRjlLZnM2anl6?=
 =?utf-8?B?NVdaMXcxT1VPSXJObWhzTFhURWtsVnpLVnlsVnM2czhQcmY2UmZrcitvRW9z?=
 =?utf-8?B?ZGt3RmVBU0Z3bjRqWFZyV2RSY2Z3NHNjb1dKYnltWXZYVU85S28zeXFHNWpU?=
 =?utf-8?B?N1dhTmdGVmtzdDUxYVJjc05peExSdGpEWU9aZkNzV0ZhcDYwMTVMQ3U0UHcr?=
 =?utf-8?B?UC9mcmk4NzNyZURMK1YydHNtMERHMGVDNHFsMHBaeGxRUHZ5V1VWYUFDNUZq?=
 =?utf-8?B?TmhqaW1BMWM5dUt2TEJ1L2NEc1VGZkFqU3ljSW5DTDlkbUhEMWsvSSsvT01o?=
 =?utf-8?B?Ym1rY0xWbXRWV2IzWSttbkREMmlzLzdnVDBLSkZ0aHd2Y2lsUVN1RTNkb0VO?=
 =?utf-8?B?UHdnUS9RNm9RVll5d0xpVUUvQktKSUJJWStYOXd4bGREWElRK0FHajcrSnIx?=
 =?utf-8?B?UVNMekxpMCt6MHlhcVB5YnFIWC9GNEpGWHRJekF0bUdiRHBnakFFQXhXTHlk?=
 =?utf-8?B?TEt6WnNydC9oSXNRNjFEdzJHdkc5bWNpRFFTNkI1TUxpR1NaNnFtcXBtZ3JF?=
 =?utf-8?B?SkNmS2ZHWWwzQngyb1RRbzliTzhtMXdmUmZwUmhxeW9FTk11bnNMMkVzcytE?=
 =?utf-8?B?KzhWTXNKYXhEZEYxYlRZUitMTVJaVGhyd1locy9JN1h5eWdZbFkwZlh4UWty?=
 =?utf-8?B?ek5HTk92eHBSZVVwaDVYOHBibkU1WEZ1UFVsMXVFTFJVNkhGaXU3VzF6R1FX?=
 =?utf-8?B?b0wwd3p3KzN0SC85WnN2L2tVbkw1YXJ5djVVQ1lxL3FIUWtBdkpHOXRlSThj?=
 =?utf-8?B?RDRrQmx6NFhGZHh4NW16Rkp2Um9WUlMzT1RwNVcwVGVqQ0xYSVFhclNOemFL?=
 =?utf-8?B?a29pam4vWUxDc1daMlhmWmVaYW5vc0NvN0dxRnp6U05NTmRtOVFkeDJjK2RP?=
 =?utf-8?B?TFJCUnJOLy9rMVNDWkQ2aFNoT3U1YU1wK2lMaFRxMDVKNkFKTTZGMkhYRERL?=
 =?utf-8?B?TFAzS01SSndKbUdZQ29qaytQMkdDQnZaV1Z3ZU9xSzYvcWRBMlBLdmlEajhW?=
 =?utf-8?B?dlBBaW5RVVVKVVpyek5VbUQxeHNpYUpPLytnd0d6WjZqNkNxMUtaUWxkZjlH?=
 =?utf-8?B?bTAvUVFISGRNVWRpL3FRSXVLYUlNNHhoYlFJMjE0SXROeEN2bUxGYzM5eDYr?=
 =?utf-8?B?UDRFeHViZXkzNGN2MTI3YkkvVVlZZmZER0k5ZkVvS2pFcmpWcnhUL2ZFeDhl?=
 =?utf-8?B?YlVXVllENHhwOHhWaGR0WE0wUURPN01tdlZRN01LcFE5NDRDN0xzSlBKV3lX?=
 =?utf-8?B?bUFGYXY4U3d6c3ZvYUlPay9kbjJzNndmeVcvbXF1WmpzSFBNUWpNT0lFSFB4?=
 =?utf-8?B?ZGJCVkNVUEZMTEFnZTZqRnc4dG0xdlh3a0x0V1V0dWpQTTgzUW1ENVFqekxV?=
 =?utf-8?B?d1hXc1A4dFIxZnRsQ1grSG9FbHF1V2tQMUs4cExkT0VqMVVRTnpNOUtHVmhy?=
 =?utf-8?B?UmY2UlZZM3Y2MFpEM1QyRWk1M3l6emlrVFhjWHFnMU42Y0VTOWhSeEdzcXkr?=
 =?utf-8?B?RmpnTEErRFZEUCszY0N6ZGJOaVl0cndSNUgxaUozbDdOZEZtRmtTRHpSeDBW?=
 =?utf-8?Q?Y6ubOm5yfCeCQFan/ZDKYEq4Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f99bbcc9-0eb1-401a-0846-08daa184eded
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 19:09:12.7085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Ym2axwcTDAUJTp0HwowbxnivxWMvtRwN9frj1eWaS1aHojxbGUBtqoF4+nuZGCd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7293
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

On 2022-09-28 14:49, Andrey Grodzovsky wrote:
> When many entities are competing for the same run queue
> on the same scheduler, we observe an unusually long wait
> times and some jobs get starved. This has been observed on GPUVis.
> 
> The issue is due to the Round Robin policy used by schedulers
> to pick up the next entity's job queue for execution. Under stress
> of many entities and long job queues within entity some
> jobs could be stuck for very long time in it's entity's
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

"Cosmetic"

> 
> v4:
> Switch drm_sched_rq_select_entity_fifo to in order search (Luben)
> 
> v5: Fix up drm_sched_rq_select_entity_fifo loop

v5 is actually a major major update of the whole patch and working of the patch.
It fixes the entity selection from ready-first, timestamp-second, to oldest-first
and ready-second, i.e. oldest-ready entity, as I suggested. The v5 blurb should read:

v5: Fix drm_sched_rq_select_entity_fifo loop from reordering and timestamping on
every selection, and picking the last ready first, timestamp-second, to picking
the oldest-ready entity. No reinsertion. (Luben)

>    
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 26 ++++++-
>  drivers/gpu/drm/scheduler/sched_main.c   | 99 +++++++++++++++++++++++-
>  include/drm/gpu_scheduler.h              | 32 ++++++++
>  3 files changed, 151 insertions(+), 6 deletions(-)
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
> index 4f2395d1a791..5349fc049384 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -62,6 +62,58 @@
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
> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
> +{
> +	struct drm_sched_rq *rq;
> +
> +	/*
> +	 * Both locks need to be grabbed, one to protect from entity->rq change
> +	 * for entity from within concurrent drm_sched_entity_select_rq and the
> +	 * other to update the rb tree structure.
> +	 */
> +	spin_lock(&entity->rq_lock);
> +	spin_lock(&entity->rq->lock);
> +
> +	rq = entity->rq;
> +
> +	entity->oldest_job_waiting = ts;
> +
> +	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> +		      drm_sched_entity_compare_before);
> +
> +	spin_unlock(&entity->rq->lock);
> +	spin_unlock(&entity->rq_lock);
> +}
> +
>  /**
>   * drm_sched_rq_init - initialize a given run queue struct
>   *
> @@ -75,6 +127,7 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>  {
>  	spin_lock_init(&rq->lock);
>  	INIT_LIST_HEAD(&rq->entities);
> +	rq->rb_tree_root = RB_ROOT_CACHED;
>  	rq->current_entity = NULL;
>  	rq->sched = sched;
>  }
> @@ -92,9 +145,12 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
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
> @@ -111,23 +167,30 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
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
> @@ -163,6 +226,34 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
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
> +
> +	spin_lock(&rq->lock);
> +	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
> +		struct drm_sched_entity *entity;
> +
> +		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> +		if (drm_sched_entity_is_ready(entity)) {
> +			rq->current_entity = entity;
> +			reinit_completion(&entity->entity_idle);
> +			break;
> +		}
> +	}
> +	spin_unlock(&rq->lock);
> +
> +	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
> +}

Yay!

With the changes to v5 blurb and testing this patch is:

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

Regards,
Luben

> +
>  /**
>   * drm_sched_job_done - complete a job
>   * @s_job: pointer to the job which is done
> @@ -803,7 +894,9 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
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
