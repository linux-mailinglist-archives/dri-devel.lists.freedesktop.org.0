Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9E63E15F9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 15:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E556EA60;
	Thu,  5 Aug 2021 13:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2074.outbound.protection.outlook.com [40.107.100.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5DC6EA60;
 Thu,  5 Aug 2021 13:47:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsnFyZy2/hYwot0zOnvto1zIFnTCAuY7m2FI81XyXPBdvEUxSTOORjw08DtfFnI08qWE7whcq5NO6xifWtBpGDreb0oudZSGdp7dpCa129+4YpUVCyWi/Ft9lW+crcmpKcewmzUKW2oQfmGRpBlNo8q+t/ao3DWg0wjLPjoVBVm38a2DoLH1PmuhtZvVnqjuuA5GdBDVIJrLPywdOngw5p/K+BXOWCzF+3kJoJWm70oHrzvV648e32qjG8sF2f7N9bc/Ct7OP652ZxJOY1lDLo6qoFW0D0prBIbWDkx3ggzUnrHGLyPbat+pAanSkAZ5rjtlsZXHR6M45Ru9vBH9+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZrpSx/OvEKFpJPDMD4k5p7UmgnUn8AmTqEzHzUZSDs=;
 b=mdb2tZQ8Fb/YJ8LOUTtNmAq31ZUj+KBnz2kbGKHuy451IC4+Kbhe97SrpU0UbgltXz5fU5b03Iwwa21CDSsvoM1NEhB+ebPGmgyxnqPF9a7zuEls3+4Tkm7OmYfYoZ/pOsm7ISeo5KH1Rpts7NiccGm2MoyHaVdQs6PeaKLzCpBfYPdvdqBDwMXPSMa/03zuqUm+Fh2+zGZFb8BZgX/xZ2yWBFirInYWDE1AqMkJ+eeCKM8N0DdCkej6yLcrMnsvJFW0XqJ63piq7rl1TBV7AOHoDRMU1njsrBjmc0hLH/iJzuRA9BjH5z/1+IjY+xXlybp4599KTXbyxwyrxsFk8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZrpSx/OvEKFpJPDMD4k5p7UmgnUn8AmTqEzHzUZSDs=;
 b=RGnSa7NkblO7Pr2BKnsOexatHwfkBt440UQDraKA5CN/td2+VZ6D3TFLXXTgWvQXvMTlaNOXK3h5E75aOvab/3jJsvvmaiEKRDUsRaKOiiopzQeOaDvBAGgjg3XA9nspLomdoQHh/sbO/ql8OmKQrWYmziW84psxCznqwwhEMe4=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2355.namprd12.prod.outlook.com (2603:10b6:207:3f::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Thu, 5 Aug
 2021 13:47:21 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 13:47:21 +0000
Subject: Re: [PATCH v5 04/20] drm/sched: Add dependency tracking
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Melissa Wen <mwen@igalia.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Lee Jones <lee.jones@linaro.org>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-5-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <04462ef1-f885-9f16-5715-23a5b69aeef0@amd.com>
Date: Thu, 5 Aug 2021 15:47:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210805104705.862416-5-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:ae89:49de:1628:3147]
 (2a02:908:1252:fb60:ae89:49de:1628:3147) by
 FR2P281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.6 via Frontend Transport; Thu, 5 Aug 2021 13:47:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44e399ba-d675-431d-5276-08d958178c90
X-MS-TrafficTypeDiagnostic: BL0PR12MB2355:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB23555FFD09212C699A1753CD83F29@BL0PR12MB2355.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yEIQO5p62JaxnPIIdz2hgKEecXwY8HeJ4cExy6Lo0HJNhBXjor+ed7P6dgVh/4yzUPRRoK3rBEeDv+bDxGoz1+L1Mf0/hlAvI1keynC00H0Btr2u+vPSesQkNKmGiXZZQg7Iqf79F3r2uDlXl6rJwWiW/cLCuxqhBGp7zFp7vgWUFofTM/ebe9T9bSkwsrFJyiAr0AVp70ZHEPm0uXZuvIydvmh0mKj9QXusQvSEl6cMbgUWQn1U/o5D9RROAy75UqGcRf//pyGNT6fIGq9URU6t4qA4DJL+d9IiCSXauRXIpaAUkxH3oEsQw3JaKObCeTS9vYDk5PrNzy3o0ZkGXv8j/mAdWuAS7cVMbmPqOV83HtcnM/QRgWHR5ozhSWnN4B1MPL73nMx3CcwdsODQ3XXBQPodbuWJPLT5T+kcMWZGl3K3AKdVUFkQeqbK2Y+PjKDtpr1X5BRF6dcABsiD/cIkNvfj/hE9UdrV+szxUEqSBgnUMc4U98CxXf3lTy7ZKgs4LqhWLcC+Mo/QW6zq6CeKyJzmYdwz8UEF5azwRYycfoBk0gIIOV+GitScuc53/En0vM2ZZW2NwJu62aLGsjsUj7fKT7DGvmLiLgFHVPGOOQya8JIi2MaXLm9HsNsVHzjiAUH7CDClocp3yJqGJ71b4JP3t0wzIvkAPygn+AGDcwQzceI5taaUTxnAQ0uttWGzwGgcpP9tFOfS29Z23IE71JmbhcRrhOqSdL4iWNw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(36756003)(38100700002)(4326008)(66556008)(66476007)(66946007)(7416002)(31696002)(6666004)(83380400001)(186003)(31686004)(2616005)(6486002)(66574015)(110136005)(5660300002)(8936002)(8676002)(86362001)(2906002)(478600001)(54906003)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjNCMysvdWhnUThxbytCUDB3UXBLSTVneUFiRzhlWWE0SW9wVjhQeUJKN3NR?=
 =?utf-8?B?R2N1VTkySGtlQTZSbU1rNHZBeTg1RFB6ZjdnZ2ZZN0Z2UitsRC9HWERrc29J?=
 =?utf-8?B?Q2JEOVZBdFEwenZQdU9oL0FHWHVQaDVaTndHRlZBVXlrSzBYRDZJaVNPZkZB?=
 =?utf-8?B?Mm9XVnNoQWtyUXBtcjE5NlJUalRiSFF5Z0gzN09xczdaZ0hFOHpIdmF0Z080?=
 =?utf-8?B?cWplWURKNUs4SUNkYVYrSGJ4K0hWbEpDemJrK1F1YllwRnlqYWgxOXM1VEVJ?=
 =?utf-8?B?d3VvV2lLMnkyaGE1NVNwVWVSV1NLNmNodVN2Sld6UUVJdysvWFNBbmxKbUNP?=
 =?utf-8?B?cTJTKzZDRU84Ums0NEtqallqenp6TDNDUkVIV0pTOEwrc2kwUUYwQ0pVWjdI?=
 =?utf-8?B?N2NSVEhSVjRSM1dMaWc0VzhiemtpM3dpM252Wi9iS200Vi9FaWtMWmp4NERU?=
 =?utf-8?B?NUNrMzhGVmc5cUdOOTlaWG1ITDlRcTFQZEtJMFEwTytBa09xNVgwOFB5U1Rz?=
 =?utf-8?B?WEtpc1hZTkE3a2Q1QXEyRXY0L29zTkgweGIvRjRFSzZEaFJuRnlnL1J4RE9p?=
 =?utf-8?B?NzFNM0RiVlllOVRHWURIZ0QwRlpMdllhdWxxa3U1bG9BNGhGOWFZODIwUlo5?=
 =?utf-8?B?M2VWditaKy82aC90ak1IbTM5TGpmOTdITk4yMXZFTlo0YmZ0Q3lIdVZ2b29m?=
 =?utf-8?B?OVVOOEhCUHRPL20ybDE1dWV5WTlaWFpWT2s5cmZ1MGVuU3h5ZWFCYzhJQzdM?=
 =?utf-8?B?SWtZck5yalB6Zk54NDhPYWNSajIwVFlxa1JkT3ROMmJ2eGYxZWpSS2o0SW5O?=
 =?utf-8?B?TWhJL0VDbDRydlBKRFpSdmV5N3N5Q3ZMbkJHb1BYRGZTS01CNkNrbVNhanNK?=
 =?utf-8?B?dFV4N1REcEdhS09pakEzRURGc3pPcXlKbXlzVzhZK1BHSS8wanQ1V1BZd1lh?=
 =?utf-8?B?RFlOTkV4V1E5NFVJL0FIdnI5QXUyU2lPcWZNMjUxUXJYUHFNVGdFajRnVklV?=
 =?utf-8?B?MDcveExSZ0NGbkdwQkdZUEo1NndRUXFCQWd3eGwzcTU4VnYwcGloejR2ZHRF?=
 =?utf-8?B?SzFJQmJqUkd3QzhhU28zZjdyKzJvRHpOc1pvaUN2RDZTUFFDRldNNGJqYWJJ?=
 =?utf-8?B?M1Q0dGZ5S2k2aFNqZit1V2FGbzlRaUlCbVhScU53MjQzRjEwRjdvRGtnT3ZB?=
 =?utf-8?B?VFpTVDIxWkRCU3NiUFEzdWdDZ0NlUHBRSEpvUjdzVkZZNE1TdU83dXB1bWh3?=
 =?utf-8?B?Y1EwMUFSNzFDa2pKVVp5aS9GUzE2QlpNdDNPbnZUTlBDejhtOG1qcXJZZ1VP?=
 =?utf-8?B?N25weW03VExmeWVPckdZK3lnL3JPa1JrYktMdzlFVWtRVVBjTFU4elBKaHF2?=
 =?utf-8?B?dVlxblVGcXQ5TGhzS3JRRkVsdHc4ZVFCZCt2bTAwemp0YUFaVkJrWk44VW1x?=
 =?utf-8?B?dlR5VnB0eWR1dmJ6K0NDREM3emw1bHY3aWpxMnNReG1LaDhhQ0U3YzlIUDhz?=
 =?utf-8?B?a3VHU0VZcC9RMHdxbkJiYWFocHZqQWc1TEVyQi9OUWlVTWNYaHgvZXMrZnFC?=
 =?utf-8?B?MG5GWkNTc0JEUE5KK1N1UW9IS1lyV0RIYnhiQTdGMHp5ejZNSXUyaEV3cW41?=
 =?utf-8?B?SCt2blppOHNKVzBUdmZ3THRWQXorTVJYeW5STkR1WlpQWklxSUhYaFpIck1K?=
 =?utf-8?B?NEpVWWd1NTJNRVZQejVDNlArZCtlcEkvc3JEQnZ6ZFJNNWl5VVZSUkt2Y09M?=
 =?utf-8?B?Q3pNZmJ2ZWtnMmpGckFSdEpMQk50OTRMY0Z1M2ZZVCt0RTk4T2dtVXNDMXFW?=
 =?utf-8?B?TnRIdDJ5b09xbnZZQ0xkTFdwS2d4alY0RStDbkhGMmFjTmFRYkIxZVZvU2Vx?=
 =?utf-8?Q?B+YjZC9YDj7tw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e399ba-d675-431d-5276-08d958178c90
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 13:47:21.7545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWG+Tg4HUcRD8yR8E6kuK7nAvajD/VErd22DuWMr65jLkWkYznjOE0Uq6DK8KfJY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2355
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.08.21 um 12:46 schrieb Daniel Vetter:
> Instead of just a callback we can just glue in the gem helpers that
> panfrost, v3d and lima currently use. There's really not that many
> ways to skin this cat.
>
> v2/3: Rebased.
>
> v4: Repaint this shed. The functions are now called _add_dependency()
> and _add_implicit_dependency()
>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> (v3)
> Reviewed-by: Steven Price <steven.price@arm.com> (v1)
> Acked-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Nirmoy Das <nirmoy.aiemd@gmail.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c |  18 +++-
>   drivers/gpu/drm/scheduler/sched_main.c   | 104 +++++++++++++++++++++++
>   include/drm/gpu_scheduler.h              |  33 ++++++-
>   3 files changed, 149 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 89e3f6eaf519..381fbf462ea7 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -211,6 +211,19 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>   	job->sched->ops->free_job(job);
>   }
>   
> +static struct dma_fence *
> +drm_sched_job_dependency(struct drm_sched_job *job,
> +			 struct drm_sched_entity *entity)
> +{
> +	if (!xa_empty(&job->dependencies))
> +		return xa_erase(&job->dependencies, job->last_dependency++);
> +
> +	if (job->sched->ops->dependency)
> +		return job->sched->ops->dependency(job, entity);
> +
> +	return NULL;
> +}
> +
>   /**
>    * drm_sched_entity_kill_jobs - Make sure all remaining jobs are killed
>    *
> @@ -229,7 +242,7 @@ static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
>   		struct drm_sched_fence *s_fence = job->s_fence;
>   
>   		/* Wait for all dependencies to avoid data corruptions */
> -		while ((f = job->sched->ops->dependency(job, entity)))
> +		while ((f = drm_sched_job_dependency(job, entity)))
>   			dma_fence_wait(f, false);
>   
>   		drm_sched_fence_scheduled(s_fence);
> @@ -419,7 +432,6 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>    */
>   struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   {
> -	struct drm_gpu_scheduler *sched = entity->rq->sched;
>   	struct drm_sched_job *sched_job;
>   
>   	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> @@ -427,7 +439,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   		return NULL;
>   
>   	while ((entity->dependency =
> -			sched->ops->dependency(sched_job, entity))) {
> +			drm_sched_job_dependency(sched_job, entity))) {
>   		trace_drm_sched_job_wait_dep(sched_job, entity->dependency);
>   
>   		if (drm_sched_entity_add_dependency_cb(entity))
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 454cb6164bdc..f77456929139 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -603,6 +603,8 @@ int drm_sched_job_init(struct drm_sched_job *job,
>   
>   	INIT_LIST_HEAD(&job->list);
>   
> +	xa_init_flags(&job->dependencies, XA_FLAGS_ALLOC);
> +
>   	return 0;
>   }
>   EXPORT_SYMBOL(drm_sched_job_init);
> @@ -637,6 +639,99 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>   }
>   EXPORT_SYMBOL(drm_sched_job_arm);
>   
> +/**
> + * drm_sched_job_add_dependency - adds the fence as a job dependency
> + * @job: scheduler job to add the dependencies to
> + * @fence: the dma_fence to add to the list of dependencies.
> + *
> + * Note that @fence is consumed in both the success and error cases.
> + *
> + * Returns:
> + * 0 on success, or an error on failing to expand the array.
> + */
> +int drm_sched_job_add_dependency(struct drm_sched_job *job,
> +				 struct dma_fence *fence)
> +{
> +	struct dma_fence *entry;
> +	unsigned long index;
> +	u32 id = 0;
> +	int ret;
> +
> +	if (!fence)
> +		return 0;
> +
> +	/* Deduplicate if we already depend on a fence from the same context.
> +	 * This lets the size of the array of deps scale with the number of
> +	 * engines involved, rather than the number of BOs.
> +	 */
> +	xa_for_each(&job->dependencies, index, entry) {
> +		if (entry->context != fence->context)
> +			continue;
> +
> +		if (dma_fence_is_later(fence, entry)) {
> +			dma_fence_put(entry);
> +			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
> +		} else {
> +			dma_fence_put(fence);
> +		}
> +		return 0;
> +	}
> +
> +	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
> +	if (ret != 0)
> +		dma_fence_put(fence);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_sched_job_add_dependency);
> +
> +/**
> + * drm_sched_job_add_implicit_dependencies - adds implicit dependencies as job
> + *   dependencies
> + * @job: scheduler job to add the dependencies to
> + * @obj: the gem object to add new dependencies from.
> + * @write: whether the job might write the object (so we need to depend on
> + * shared fences in the reservation object).
> + *
> + * This should be called after drm_gem_lock_reservations() on your array of
> + * GEM objects used in the job but before updating the reservations with your
> + * own fences.
> + *
> + * Returns:
> + * 0 on success, or an error on failing to expand the array.
> + */
> +int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
> +					    struct drm_gem_object *obj,
> +					    bool write)
> +{
> +	int ret;
> +	struct dma_fence **fences;
> +	unsigned int i, fence_count;
> +
> +	if (!write) {
> +		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
> +
> +		return drm_sched_job_add_dependency(job, fence);
> +	}
> +
> +	ret = dma_resv_get_fences(obj->resv, NULL, &fence_count, &fences);
> +	if (ret || !fence_count)
> +		return ret;
> +
> +	for (i = 0; i < fence_count; i++) {
> +		ret = drm_sched_job_add_dependency(job, fences[i]);
> +		if (ret)
> +			break;
> +	}
> +
> +	for (; i < fence_count; i++)
> +		dma_fence_put(fences[i]);
> +	kfree(fences);
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
> +
> +
>   /**
>    * drm_sched_job_cleanup - clean up scheduler job resources
>    * @job: scheduler job to clean up
> @@ -652,6 +747,9 @@ EXPORT_SYMBOL(drm_sched_job_arm);
>    */
>   void drm_sched_job_cleanup(struct drm_sched_job *job)
>   {
> +	struct dma_fence *fence;
> +	unsigned long index;
> +
>   	if (kref_read(&job->s_fence->finished.refcount)) {
>   		/* drm_sched_job_arm() has been called */
>   		dma_fence_put(&job->s_fence->finished);
> @@ -661,6 +759,12 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
>   	}
>   
>   	job->s_fence = NULL;
> +
> +	xa_for_each(&job->dependencies, index, fence) {
> +		dma_fence_put(fence);
> +	}
> +	xa_destroy(&job->dependencies);
> +
>   }
>   EXPORT_SYMBOL(drm_sched_job_cleanup);
>   
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 83afc3aa8e2f..a47946f904b6 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -27,9 +27,12 @@
>   #include <drm/spsc_queue.h>
>   #include <linux/dma-fence.h>
>   #include <linux/completion.h>
> +#include <linux/xarray.h>
>   
>   #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
>   
> +struct drm_gem_object;
> +
>   struct drm_gpu_scheduler;
>   struct drm_sched_rq;
>   
> @@ -198,6 +201,17 @@ struct drm_sched_job {
>   	enum drm_sched_priority		s_priority;
>   	struct drm_sched_entity         *entity;
>   	struct dma_fence_cb		cb;
> +	/**
> +	 * @dependencies:
> +	 *
> +	 * Contains the dependencies as struct dma_fence for this job, see
> +	 * drm_sched_job_add_dependency() and
> +	 * drm_sched_job_add_implicit_dependencies().
> +	 */
> +	struct xarray			dependencies;
> +
> +	/** @last_dependency: tracks @dependencies as they signal */
> +	unsigned long			last_dependency;
>   };
>   
>   static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
> @@ -220,9 +234,15 @@ enum drm_gpu_sched_stat {
>    */
>   struct drm_sched_backend_ops {
>   	/**
> -         * @dependency: Called when the scheduler is considering scheduling
> -         * this job next, to get another struct dma_fence for this job to
> -	 * block on.  Once it returns NULL, run_job() may be called.
> +	 * @dependency:
> +	 *
> +	 * Called when the scheduler is considering scheduling this job next, to
> +	 * get another struct dma_fence for this job to block on.  Once it
> +	 * returns NULL, run_job() may be called.
> +	 *
> +	 * If a driver exclusively uses drm_sched_job_add_dependency() and
> +	 * drm_sched_job_add_implicit_dependencies() this can be ommitted and
> +	 * left as NULL.
>   	 */
>   	struct dma_fence *(*dependency)(struct drm_sched_job *sched_job,
>   					struct drm_sched_entity *s_entity);
> @@ -349,6 +369,13 @@ int drm_sched_job_init(struct drm_sched_job *job,
>   		       struct drm_sched_entity *entity,
>   		       void *owner);
>   void drm_sched_job_arm(struct drm_sched_job *job);
> +int drm_sched_job_add_dependency(struct drm_sched_job *job,
> +				 struct dma_fence *fence);
> +int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
> +					    struct drm_gem_object *obj,
> +					    bool write);
> +
> +
>   void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>   				    struct drm_gpu_scheduler **sched_list,
>                                      unsigned int num_sched_list);

