Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 763AE79CC8E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 11:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B6410E223;
	Tue, 12 Sep 2023 09:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDA510E071;
 Tue, 12 Sep 2023 09:57:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRh/CYOpgXxDmV4aczIqn+O8uGsI4uTY7frVpX5BtvvhUSUkLaIgXCp5vlcjytJmgMfTI7KHj3glPj7w9OcoZbEGd/YYtT8KfuGA+lhAF4Hno0VTXDxcNmfjNvMDjmccEiV0CSXmv3zc2mjmU+jMbuH6ooXlteIgxuPxc4S0GS7dM8T4p70WySDrq/egd0T+JyceKETSvnQCk2VNdINtj6yaAOaDGKQhO6XvjOZQ18uXtSjCy0u//hgsQMUtpGc0p2aBPv73OR4Jr0TyDo3XoiK8Q29Sp6AM1VmL+UlTdTb7ez9an/z/TyiW2gMcP7epZlL5vHr9FtPztbXoqONZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePF04S2XmPIIqLwbKWTS2Mw7tGuytVsv6g9/JE5qFd0=;
 b=f/6kjyks+MCIO9o126T1NDWW6KcA+yABoQW/2vLlDkI7xcjK2/M9a+daPvJ70reGZM7BQ3gSEAjxZmBVQ11665GSzNDTtyw1KNJRJrBKM9hmYUitJeNGUNhS+jtUEfkQIy+iu6JOSs452dhZwYpoB/Hw2tjI0CkzRtUlQuyrjfDJHqOo4nwJLxSq0p6tUXcXBe8D/ML4gKZ0sbg3HrG92l+tKGqI2+GXpnQQq7D+gweCeGnn1Ns6pOa7NxPRFdLYkm3OWlQC4cr1xg/n66iuaY5rq+AeHEMJsKfEKx1Pz5RBCfaTCyh4hk9+3ZzhG1e/TezXUPFmeMc3lF3x+GpILQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePF04S2XmPIIqLwbKWTS2Mw7tGuytVsv6g9/JE5qFd0=;
 b=4YkxzA3ixUZgD5CVWsf+URHoDbtda6Kn0973T2x95xT7wsXtqVbv1uMc06vj2EujiSHT1zhcx3ZmgRvGqb0l/SHY+3p9NCU7fwB/dDNWHiVslCznOV6xAKJ8OHj+Gm8B6ZBCIEG87sx7x3umi8P2FwBRo/p4UE+9H9ETXm1b27M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB7791.namprd12.prod.outlook.com (2603:10b6:510:280::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.33; Tue, 12 Sep
 2023 09:57:45 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 09:57:38 +0000
Message-ID: <2b5c148c-51e6-c9f4-b950-fe16db5bad17@amd.com>
Date: Tue, 12 Sep 2023 11:57:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 11/13] drm/sched: Waiting for pending jobs to complete
 in scheduler kill
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-12-matthew.brost@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230912021615.2086698-12-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB7791:EE_
X-MS-Office365-Filtering-Correlation-Id: 1530a094-20c8-4f60-f777-08dbb376b1cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8MRsuuRPZIlNww0tDFNhJA1RWXBKfSF6aX75bS42zLWUVMgzgmYqtwL8cyGxLOJ/vY9TlT/EtPBo6QrU8BVINI9A5MREq4nZx/IqSI4pAxQGxKQBZ+JPp89RGEWSDNSGyjY1AsjwhIdR67KSgu0aWrHAI4/9MJeHKYAca5dd3WSKyJdyH+lDLUKEwTmo1vN/IME4qtR8IEG+8JD834vJLIfNAfd887jEQTAvgcnNALrlX3rbunjW/BSxA3+TIBX8I/JLZN0Wi9lDVA66NAsQz1TesUKvy2P5wzPeAamFOXAXpHPX2xcfFterQNQTnbaZ2pE25MBN3Zrm25Rl9lFGBO1D+xhH9vUyj+jsiQyJz49Q4//dQTm0dqpGwgV7cmx+FnO8HT6D/Qt49CLCtT7shOsB9+M/csolh1LKm1Uu4JQzMu3/ntWZByxJxlqnrCKn03z2Ue3Vp/Xsp7Xb5WpaI6XSA8CGO321YKj9xOCw0mwk/VdrVq+OyaPGkUrATziAyXF/2watIXli3KS4tpAMB8ZO0SBVHZAhiNRkGadqMNgRT5nYtdxna30dTHMmGiQE9Qt3mJ3CruVoo/7NQFTauzTmdkYTRWH3ckysFdJtfbiJdNAw/uT3xS39dcpVIPIq0z3f7d9V8Kh4tUEri12kEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(396003)(366004)(346002)(1800799009)(186009)(451199024)(6486002)(6666004)(6506007)(6512007)(83380400001)(2616005)(2906002)(26005)(66556008)(66476007)(66946007)(5660300002)(7416002)(478600001)(4326008)(316002)(8936002)(8676002)(31696002)(86362001)(36756003)(38100700002)(31686004)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzQ1ZGVrNm5EYUhKSVZMZXE0b0NiYkd3Vm9mU2lwZnByZGpteEhpUkpXemJ6?=
 =?utf-8?B?aUc5cHdYQTFtZ00wanFxUk9RRTRxaU90YlcrMllwemZGeTltVDFYbi9kYnVx?=
 =?utf-8?B?SWNFSVllZFZDQ0c0OUVPdG1xTktzbVk1V0QvdUJ6SFRNa1FyRmxHbW9nZ0xI?=
 =?utf-8?B?UEJLbWlOQWo3YnFJbkdYbGFoTWJGZGRIUXdWRUdkenpzcm5Wbjg0ejZhdGxa?=
 =?utf-8?B?VVdSMW9JbzZIa05ZdHA1MFBWa1N5UUJKSE90aGJkSVp5dFJVOFQvUGM3RVFz?=
 =?utf-8?B?TmNaNmtDaXVORGFQSEE4L1dZcGFwOEhuV0M5Y0pLclhsZnl4dEtBSEIydEQ1?=
 =?utf-8?B?QmdpaTFiYWN3dHFKQWhLUDI5dldoeXo5RXpSdWlxeVF6UlhGUmN3bVAydlUy?=
 =?utf-8?B?OHI5a2lNL0szaFk5MEJEMmdvemxaUTZxdml3cXVmaE5KdG1BRkphOXpQZHdl?=
 =?utf-8?B?U0JacCt3L3hYalNHTDhiUHVaZWhzdTlPUlp2Wm1ISXFVY25hM3p0czRvWlRv?=
 =?utf-8?B?Mmt3T0VLVzM4eTYySWE1R0V5RzBIRGJFcGxTMEhMK3dseDVLaUltUlhPZ1pO?=
 =?utf-8?B?TUNLUzc0VU9JVmkzNU53cUl6WE9HUEczWldTNjBNclpHblh0UFNoamxtWWNu?=
 =?utf-8?B?TEEzZmNWZGZIeHlkSGtFZ3pkQTJoVm1YN09yNEJjbC8wTTNJV3NkSnh3RTAz?=
 =?utf-8?B?UXRGVVVDUUJuTmExamVFV0lpV2NTVmdwVzVaaTRRbUhPOE1UWlE5Nm1TOTFX?=
 =?utf-8?B?L05LNW83OVhCZGVMWFQ0Z1d5eHhSeUt6aG1uOHI4Mk03U0kvQ1VmdCtTdHpn?=
 =?utf-8?B?ZjVReWpHeXdyNE9BcEowaXlQL1VuWDVtZktDbUFDRm5ucGZLUlZxQlRrT3R2?=
 =?utf-8?B?WEZJTm53aElLdjdxdjhSU3BGcW80ZnBxUmJDb3ptOTBhUGdsRjhxY2UxTXhV?=
 =?utf-8?B?cXU4dUdralkvSDZXZXA3djV1VjJwazJqb014ZWphUGtVdUQ0QmYwRkFtYmZQ?=
 =?utf-8?B?SSt5SGJsQ2tQZGVZWEdZWXpPZlZNREtoYmdWczB6VUgxbGUxKzBmYzRxeGRO?=
 =?utf-8?B?UE11TnNRaVNDMEhOcStWWW5HckZLTWQ3VGxwaEw1cnA4WUp2T24rRXNxT0xU?=
 =?utf-8?B?bnhNbHI4RlVoeDdGazFRQzd2RWdqc3Z2a1hBd2JWdk1XaTF2QnRmWU5WcTNu?=
 =?utf-8?B?R0FBUmVrd0NQU2IvQ1p6ZFJCUUpwTE5ZbG03M1ZPai8rd3dYdnRxUzRQWDdX?=
 =?utf-8?B?NkJhZVNScjlCaUFqZmlKZmtSbXBzSkhWZmNqZ2lxT2NUQTZoMGs2TDNwSXRU?=
 =?utf-8?B?NjJYYWcrTEVYd3JZOWhRMEo2Z3ZKOS9NdlZ3aWRuR3RHaTFqdFdJeENTeDVC?=
 =?utf-8?B?RFhWS2p0cFg5OE12bksxb0lueU0vdHdjbGxib25QRXlDUG5Wdm5saHRDZlZE?=
 =?utf-8?B?ZjF1WWN6SmJHOGdmbnU3ZHpnVHVMUUVYdW1rZklsK05sbllVTEdIOUlvV2JW?=
 =?utf-8?B?ZDhjOEp3WmNjWFJmTXdibWIzVWZwUTdObHIrUDc2Q2xtM2FWaVdOMFBVR1Z1?=
 =?utf-8?B?SnlwY3FvdFBBNi9lWnlqdkd2a3l1d1VaZzBBL1RDOE5GOUJnNTVKQWNmR1Mr?=
 =?utf-8?B?SktENnlWb3plWkhMM01QWVVTZk1HRzhnN1ZsRzVpWEdsZlNSM1ZmWUpXOVFE?=
 =?utf-8?B?NVlYd3o2eTRXS0FOYVRFZktpMHNVSDJsVjlNRHRVMSs5N3VuMHBCdDZOTFBv?=
 =?utf-8?B?QXZlZ2RjcW9wNGR0blU0UzBBdVdxUWNHdkxmTUo1R3RGSE9nd29samJtOUEw?=
 =?utf-8?B?WmZlZFRYSjdudjVwSkV0TmRPZ0Zqc1RvUmxGeU5mdlBkWUZZRjcyenluc0hn?=
 =?utf-8?B?MG5QZ09LU0xZc1I4amFTVWxBd1JIblBUVno0M245cjd3RTgvNDhFY0ZBS0xM?=
 =?utf-8?B?bFVuM1NxbGhSam1QRlErRjRqZURvT05JNmxKcXAxUG14SFMvUktReElmUGhm?=
 =?utf-8?B?QTRYYlRRdmFsL3lXaUhjaVZDNDE5M2QvVTdOTGs1QzdVRDRGdm02T1YzWDB4?=
 =?utf-8?B?K0ZReVBtVllxMXVaVzB0d2RhaFplTnNoTW9vT2RBTEpmeTc1ai94SzNwY2xI?=
 =?utf-8?Q?wBWMj1wa34MJ2UrC1/GLDW8Qt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1530a094-20c8-4f60-f777-08dbb376b1cc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 09:57:37.9406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dFcBpSqzWHcjMTIznXuNnpKzf3PlPN8pH2jEMf5kmPe3Ry//veuWz3v+8lIJH4f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7791
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
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, mcanal@igalia.com,
 Liviu.Dudau@arm.com, luben.tuikov@amd.com, lina@asahilina.net,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.09.23 um 04:16 schrieb Matthew Brost:
> Wait for pending jobs to be complete before signaling queued jobs. This
> ensures dma-fence signaling order correct and also ensures the entity is
> not running on the hardware after drm_sched_entity_flush or
> drm_sched_entity_fini returns.

Entities are *not* supposed to outlive the submissions they carry and we 
absolutely *can't* wait for submissions to finish while killing the entity.

In other words it is perfectly expected that entities doesn't exists any 
more while the submissions they carried are still running on the hardware.

I somehow better need to document how this working and especially why it 
is working like that.

This approach came up like four or five times now and we already applied 
and reverted patches doing this.

For now let's take a look at the source code of drm_sched_entity_kill():

        /* The entity is guaranteed to not be used by the scheduler */
         prev = rcu_dereference_check(entity->last_scheduled, true);
         dma_fence_get(prev);

         while ((job = 
to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
                 struct drm_sched_fence *s_fence = job->s_fence;

                 dma_fence_get(&s_fence->finished);
                 if (!prev || dma_fence_add_callback(prev, &job->finish_cb,
drm_sched_entity_kill_jobs_cb))
                         drm_sched_entity_kill_jobs_cb(NULL, 
&job->finish_cb);

                 prev = &s_fence->finished;
         }
         dma_fence_put(prev);

This ensures the dma-fence signaling order by delegating signaling of 
the scheduler fences into callbacks.

Regards,
Christian.

>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  2 +-
>   drivers/gpu/drm/scheduler/sched_entity.c    |  7 ++-
>   drivers/gpu/drm/scheduler/sched_main.c      | 50 ++++++++++++++++++---
>   include/drm/gpu_scheduler.h                 | 18 ++++++++
>   4 files changed, 70 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index fb5dad687168..7835c0da65c5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -1873,7 +1873,7 @@ static void amdgpu_ib_preempt_mark_partial_job(struct amdgpu_ring *ring)
>   	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>   		if (dma_fence_is_signaled(&s_job->s_fence->finished)) {
>   			/* remove job from ring_mirror_list */
> -			list_del_init(&s_job->list);
> +			drm_sched_remove_pending_job(s_job);
>   			sched->ops->free_job(s_job);
>   			continue;
>   		}
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 1dec97caaba3..37557fbb96d0 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -104,9 +104,11 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   	}
>   
>   	init_completion(&entity->entity_idle);
> +	init_completion(&entity->jobs_done);
>   
> -	/* We start in an idle state. */
> +	/* We start in an idle and jobs done state. */
>   	complete_all(&entity->entity_idle);
> +	complete_all(&entity->jobs_done);
>   
>   	spin_lock_init(&entity->rq_lock);
>   	spsc_queue_init(&entity->job_queue);
> @@ -256,6 +258,9 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>   	/* Make sure this entity is not used by the scheduler at the moment */
>   	wait_for_completion(&entity->entity_idle);
>   
> +	/* Make sure all pending jobs are done */
> +	wait_for_completion(&entity->jobs_done);
> +
>   	/* The entity is guaranteed to not be used by the scheduler */
>   	prev = rcu_dereference_check(entity->last_scheduled, true);
>   	dma_fence_get(prev);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 689fb6686e01..ed6f5680793a 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -510,12 +510,52 @@ void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
>   }
>   EXPORT_SYMBOL(drm_sched_resume_timeout);
>   
> +/**
> + * drm_sched_add_pending_job - Add pending job to scheduler
> + *
> + * @job: scheduler job to add
> + * @tail: add to tail of pending list
> + */
> +void drm_sched_add_pending_job(struct drm_sched_job *job, bool tail)
> +{
> +	struct drm_gpu_scheduler *sched = job->sched;
> +	struct drm_sched_entity *entity = job->entity;
> +
> +	lockdep_assert_held(&sched->job_list_lock);
> +
> +	if (tail)
> +		list_add_tail(&job->list, &sched->pending_list);
> +	else
> +		list_add(&job->list, &sched->pending_list);
> +	if (!entity->pending_job_count++)
> +		reinit_completion(&entity->jobs_done);
> +}
> +EXPORT_SYMBOL(drm_sched_add_pending_job);
> +
> +/**
> + * drm_sched_remove_pending_job - Remove pending job from` scheduler
> + *
> + * @job: scheduler job to remove
> + */
> +void drm_sched_remove_pending_job(struct drm_sched_job *job)
> +{
> +	struct drm_gpu_scheduler *sched = job->sched;
> +	struct drm_sched_entity *entity = job->entity;
> +
> +	lockdep_assert_held(&sched->job_list_lock);
> +
> +	list_del_init(&job->list);
> +	if (!--entity->pending_job_count)
> +		complete_all(&entity->jobs_done);
> +}
> +EXPORT_SYMBOL(drm_sched_remove_pending_job);
> +
>   static void drm_sched_job_begin(struct drm_sched_job *s_job)
>   {
>   	struct drm_gpu_scheduler *sched = s_job->sched;
>   
>   	spin_lock(&sched->job_list_lock);
> -	list_add_tail(&s_job->list, &sched->pending_list);
> +	drm_sched_add_pending_job(s_job, true);
>   	spin_unlock(&sched->job_list_lock);
>   }
>   
> @@ -538,7 +578,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>   		 * is parked at which point it's safe.
>   		 */
> -		list_del_init(&job->list);
> +		drm_sched_remove_pending_job(job);
>   		spin_unlock(&sched->job_list_lock);
>   
>   		status = job->sched->ops->timedout_job(job);
> @@ -589,7 +629,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>   		 * Add at the head of the queue to reflect it was the earliest
>   		 * job extracted.
>   		 */
> -		list_add(&bad->list, &sched->pending_list);
> +		drm_sched_add_pending_job(bad, false);
>   
>   	/*
>   	 * Iterate the job list from later to  earlier one and either deactive
> @@ -611,7 +651,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>   			 * Locking here is for concurrent resume timeout
>   			 */
>   			spin_lock(&sched->job_list_lock);
> -			list_del_init(&s_job->list);
> +			drm_sched_remove_pending_job(s_job);
>   			spin_unlock(&sched->job_list_lock);
>   
>   			/*
> @@ -1066,7 +1106,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>   
>   	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>   		/* remove job from pending_list */
> -		list_del_init(&job->list);
> +		drm_sched_remove_pending_job(job);
>   
>   		/* cancel this job's TO timer */
>   		cancel_delayed_work(&sched->work_tdr);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index b7b818cd81b6..7c628f36fe78 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -233,6 +233,21 @@ struct drm_sched_entity {
>   	 */
>   	struct completion		entity_idle;
>   
> +	/**
> +	 * @pending_job_count:
> +	 *
> +	 * Number of pending jobs.
> +	 */
> +	unsigned int                    pending_job_count;
> +
> +	/**
> +	 * @jobs_done:
> +	 *
> +	 * Signals when entity has no pending jobs, used to sequence entity
> +	 * cleanup in drm_sched_entity_fini().
> +	 */
> +	struct completion		jobs_done;
> +
>   	/**
>   	 * @oldest_job_waiting:
>   	 *
> @@ -656,4 +671,7 @@ struct drm_gpu_scheduler *
>   drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>   		     unsigned int num_sched_list);
>   
> +void drm_sched_add_pending_job(struct drm_sched_job *job, bool tail);
> +void drm_sched_remove_pending_job(struct drm_sched_job *job);
> +
>   #endif

