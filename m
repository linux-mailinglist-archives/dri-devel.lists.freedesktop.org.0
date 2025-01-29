Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CB1A21B52
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 11:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D7410E7A3;
	Wed, 29 Jan 2025 10:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="R4IPIS94";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A102510E102;
 Wed, 29 Jan 2025 10:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B5Z4XB9QVCtHO+K6laFD1YgUCWPpwMXVTwVbCIZ2Zwo=; b=R4IPIS94iI5oaRsATfjwQBlZn5
 0n+UI23ppoXF6qjnDCtY0s6MUlec5Nsqtd4BFMpBGd/T/0aKSC4QU+ICUk/X0z0upp/Rhb4Fo5XAm
 y+/agj3DJ9DBfZ+otPegjDYmbfd672yzLNKzb34TXHBE4qTE19zqYsO77E3AhszVDlyen1StkMDnX
 GDmZQhj2jmpb6rF9wznvVcYXwMxookaOvh2ZhN22oymzkYYvHPi89TcuzbudGvnEk48KNqXAkff5k
 xNLXN59kKGXtNMBFSz3JQxfj07DyFI2E+XgKyPkUpOh0lPVBtgVBAIkfdjhYP9y5OI5nxZZhY3Uxq
 5OykPBVg==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1td5hr-000X1O-9C; Wed, 29 Jan 2025 11:54:09 +0100
Message-ID: <f8c9a876-4616-454d-a816-bb3c90960245@igalia.com>
Date: Wed, 29 Jan 2025 07:53:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: Use struct for drm_sched_init() params
To: Philipp Stanner <phasta@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Melissa Wen <mwen@igalia.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250128142927.103290-2-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250128142927.103290-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Philipp,

On 28/01/25 11:29, Philipp Stanner wrote:
> drm_sched_init() has a great many parameters and upcoming new
> functionality for the scheduler might add even more. Generally, the
> great number of parameters reduces readability and has already caused
> one missnaming in:
> 
> commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in nouveau_sched_init()").
> 
> Introduce a new struct for the scheduler init parameters and port all
> users.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Changes in v2:
>    - Point out that the hang-limit is deprecated. (Christian)
>    - Initialize the structs to 0 at declaration. (Planet Earth)
>    - Don't set stuff explicitly to 0 / NULL. (Tvrtko)
>    - Make the structs const where possible. (Boris)
>    - v3d: Use just 1, universal, function for sched-init. (Maíra)
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 ++++--
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c    | 20 +++----
>   drivers/gpu/drm/imagination/pvr_queue.c    | 18 ++++--
>   drivers/gpu/drm/lima/lima_sched.c          | 16 +++--
>   drivers/gpu/drm/msm/msm_ringbuffer.c       | 17 +++---
>   drivers/gpu/drm/nouveau/nouveau_sched.c    | 15 +++--
>   drivers/gpu/drm/panfrost/panfrost_job.c    | 20 ++++---
>   drivers/gpu/drm/panthor/panthor_mmu.c      | 16 +++--
>   drivers/gpu/drm/panthor/panthor_sched.c    | 29 +++++----
>   drivers/gpu/drm/scheduler/sched_main.c     | 50 ++++++----------
>   drivers/gpu/drm/v3d/v3d_sched.c            | 68 +++++++++-------------
>   drivers/gpu/drm/xe/xe_execlist.c           | 16 +++--
>   drivers/gpu/drm/xe/xe_gpu_scheduler.c      | 17 +++++-
>   include/drm/gpu_scheduler.h                | 37 ++++++++++--
>   14 files changed, 206 insertions(+), 151 deletions(-)
> 

[...]

> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 5844a7f639e0..44713cfdcd74 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3284,6 +3284,22 @@ static struct panthor_queue *
>   group_create_queue(struct panthor_group *group,
>   		   const struct drm_panthor_queue_create *args)
>   {
> +	const struct drm_sched_init_args sched_args = {
> +		.ops = &panthor_queue_sched_ops,
> +		.submit_wq = group->ptdev->scheduler->wq,
> +		.num_rqs = 1,
> +		/*
> +		 * The credit limit argument tells us the total number of
> +		 * instructions across all CS slots in the ringbuffer, with
> +		 * some jobs requiring twice as many as others, depending on
> +		 * their profiling status.
> +		 */
> +		.credit_limit = args->ringbuf_size / sizeof(u64),
> +		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
> +		.timeout_wq = group->ptdev->reset.wq,
> +		.name = "panthor-queue",
> +		.dev = group->ptdev->base.dev
> +	};
>   	struct drm_gpu_scheduler *drm_sched;
>   	struct panthor_queue *queue;
>   	int ret;
> @@ -3354,17 +3370,8 @@ group_create_queue(struct panthor_group *group,
>   	if (ret)
>   		goto err_free_queue;
>   
> -	/*
> -	 * Credit limit argument tells us the total number of instructions
> -	 * across all CS slots in the ringbuffer, with some jobs requiring
> -	 * twice as many as others, depending on their profiling status.
> -	 */
> -	ret = drm_sched_init(&queue->scheduler, &panthor_queue_sched_ops,
> -			     group->ptdev->scheduler->wq, 1,
> -			     args->ringbuf_size / sizeof(u64),
> -			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
> -			     group->ptdev->reset.wq,
> -			     NULL, "panthor-queue", group->ptdev->base.dev);
> +

Please don't use multiple blank lines.

> +	ret = drm_sched_init(&queue->scheduler, &sched_args);
>   	if (ret)
>   		goto err_free_queue;
>   
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index a48be16ab84f..6295b2654a7c 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1244,40 +1244,24 @@ static void drm_sched_run_job_work(struct work_struct *w)
>    * drm_sched_init - Init a gpu scheduler instance
>    *
>    * @sched: scheduler instance
> - * @ops: backend operations for this scheduler
> - * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
> - *	       allocated and used
> - * @num_rqs: number of runqueues, one for each priority, up to DRM_SCHED_PRIORITY_COUNT
> - * @credit_limit: the number of credits this scheduler can hold from all jobs
> - * @hang_limit: number of times to allow a job to hang before dropping it
> - * @timeout: timeout value in jiffies for the scheduler
> - * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
> - *		used
> - * @score: optional score atomic shared with other schedulers
> - * @name: name used for debugging
> - * @dev: target &struct device
> + * @args: scheduler initialization arguments
>    *
>    * Return 0 on success, otherwise error code.
>    */
> -int drm_sched_init(struct drm_gpu_scheduler *sched,
> -		   const struct drm_sched_backend_ops *ops,
> -		   struct workqueue_struct *submit_wq,
> -		   u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
> -		   long timeout, struct workqueue_struct *timeout_wq,
> -		   atomic_t *score, const char *name, struct device *dev)
> +int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_args *args)
>   {
>   	int i;
>   
> -	sched->ops = ops;
> -	sched->credit_limit = credit_limit;
> -	sched->name = name;
> -	sched->timeout = timeout;
> -	sched->timeout_wq = timeout_wq ? : system_wq;
> -	sched->hang_limit = hang_limit;
> -	sched->score = score ? score : &sched->_score;
> -	sched->dev = dev;
> +	sched->ops = args->ops;
> +	sched->credit_limit = args->credit_limit;
> +	sched->name = args->name;
> +	sched->timeout = args->timeout;
> +	sched->timeout_wq = args->timeout_wq ? : system_wq;
> +	sched->hang_limit = args->hang_limit;
> +	sched->score = args->score ? args->score : &sched->_score;

Could we keep it consistent and use the Elvis Operator here as well?
Just like `sched->timeout_wq`.

> +	sched->dev = args->dev;
>   
> -	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
> +	if (args->num_rqs > DRM_SCHED_PRIORITY_COUNT) {
>   		/* This is a gross violation--tell drivers what the  problem is.
>   		 */
>   		drm_err(sched, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
> @@ -1292,16 +1276,16 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		return 0;
>   	}
>   
> -	if (submit_wq) {
> -		sched->submit_wq = submit_wq;
> +	if (args->submit_wq) {
> +		sched->submit_wq = args->submit_wq;
>   		sched->own_submit_wq = false;
>   	} else {
>   #ifdef CONFIG_LOCKDEP
> -		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name,
> +		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(args->name,
>   								       WQ_MEM_RECLAIM,
>   								       &drm_sched_lockdep_map);
>   #else
> -		sched->submit_wq = alloc_ordered_workqueue(name, WQ_MEM_RECLAIM);
> +		sched->submit_wq = alloc_ordered_workqueue(args->name, WQ_MEM_RECLAIM);
>   #endif
>   		if (!sched->submit_wq)
>   			return -ENOMEM;
> @@ -1309,11 +1293,11 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		sched->own_submit_wq = true;
>   	}
>   
> -	sched->sched_rq = kmalloc_array(num_rqs, sizeof(*sched->sched_rq),
> +	sched->sched_rq = kmalloc_array(args->num_rqs, sizeof(*sched->sched_rq),
>   					GFP_KERNEL | __GFP_ZERO);
>   	if (!sched->sched_rq)
>   		goto Out_check_own;
> -	sched->num_rqs = num_rqs;
> +	sched->num_rqs = args->num_rqs;
>   	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>   		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
>   		if (!sched->sched_rq[i])
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 961465128d80..dfccb4cda3a1 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -820,67 +820,57 @@ static const struct drm_sched_backend_ops v3d_cpu_sched_ops = {
>   	.free_job = v3d_cpu_job_free
>   };
>   
> +/*
> + * v3d's scheduler instances are all identical, except for ops and name.
> + */

Could you remove this comment? The function is self-explanatory.

> +static int
> +v3d_queue_sched_init(struct v3d_dev *v3d, const struct drm_sched_backend_ops *ops,
> +		     enum v3d_queue queue, const char *name)
> +{
> +	struct drm_sched_init_args args = {
> +		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
> +		.credit_limit = 1,
> +		.timeout = msecs_to_jiffies(500),
> +		.dev = v3d->drm.dev
> +	};
> +
> +	args.ops = ops;
> +	args.name = name;
> +
> +	return drm_sched_init(&v3d->queue[queue].sched, &args);
> +}
> +
>   int
>   v3d_sched_init(struct v3d_dev *v3d)
>   {
> -	int hw_jobs_limit = 1;
> -	int job_hang_limit = 0;
> -	int hang_limit_ms = 500;
>   	int ret;
>   
> -	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
> -			     &v3d_bin_sched_ops, NULL,
> -			     DRM_SCHED_PRIORITY_COUNT,
> -			     hw_jobs_limit, job_hang_limit,
> -			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_bin", v3d->drm.dev);
> +	ret = v3d_queue_sched_init(v3d, &v3d_bin_sched_ops, V3D_BIN, "v3d_bin");
>   	if (ret)
>   		return ret;
>   
> -	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> -			     &v3d_render_sched_ops, NULL,
> -			     DRM_SCHED_PRIORITY_COUNT,
> -			     hw_jobs_limit, job_hang_limit,
> -			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_render", v3d->drm.dev);
> +	ret = v3d_queue_sched_init(v3d, &v3d_render_sched_ops, V3D_RENDER,
> +				   "v3d_render");
>   	if (ret)
>   		goto fail;
>   
> -	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
> -			     &v3d_tfu_sched_ops, NULL,
> -			     DRM_SCHED_PRIORITY_COUNT,
> -			     hw_jobs_limit, job_hang_limit,
> -			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_tfu", v3d->drm.dev);
> +	ret = v3d_queue_sched_init(v3d, &v3d_tfu_sched_ops, V3D_TFU, "v3d_tfu");
>   	if (ret)
>   		goto fail;
>   
>   	if (v3d_has_csd(v3d)) {
> -		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
> -				     &v3d_csd_sched_ops, NULL,
> -				     DRM_SCHED_PRIORITY_COUNT,
> -				     hw_jobs_limit, job_hang_limit,
> -				     msecs_to_jiffies(hang_limit_ms), NULL,
> -				     NULL, "v3d_csd", v3d->drm.dev);
> +		ret = v3d_queue_sched_init(v3d, &v3d_csd_sched_ops, V3D_CSD,
> +					   "v3d_csd");
>   		if (ret)
>   			goto fail;
>   
> -		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
> -				     &v3d_cache_clean_sched_ops, NULL,
> -				     DRM_SCHED_PRIORITY_COUNT,
> -				     hw_jobs_limit, job_hang_limit,
> -				     msecs_to_jiffies(hang_limit_ms), NULL,
> -				     NULL, "v3d_cache_clean", v3d->drm.dev);
> +		ret = v3d_queue_sched_init(v3d, &v3d_cache_clean_sched_ops,
> +					   V3D_CACHE_CLEAN, "v3d_cache_clean");
>   		if (ret)
>   			goto fail;
>   	}
>   
> -	ret = drm_sched_init(&v3d->queue[V3D_CPU].sched,
> -			     &v3d_cpu_sched_ops, NULL,
> -			     DRM_SCHED_PRIORITY_COUNT,
> -			     1, job_hang_limit,
> -			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_cpu", v3d->drm.dev);
> +	ret = v3d_queue_sched_init(v3d, &v3d_cpu_sched_ops, V3D_CPU, "v3d_cpu");
>   	if (ret)
>   		goto fail;
>   
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index a8c416a48812..db1c52dcf1a6 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -332,6 +332,15 @@ static const struct drm_sched_backend_ops drm_sched_ops = {
>   static int execlist_exec_queue_init(struct xe_exec_queue *q)
>   {
>   	struct drm_gpu_scheduler *sched;
> +	const struct drm_sched_init_args args = {
> +		.ops = &drm_sched_ops,
> +		.num_rqs = 1,
> +		.credit_limit = q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES,
> +		.hang_limit = XE_SCHED_HANG_LIMIT,
> +		.timeout = XE_SCHED_JOB_TIMEOUT,
> +		.name = q->hwe->name,
> +		.dev = gt_to_xe(q->gt)->drm.dev
> +	};
>   	struct xe_execlist_exec_queue *exl;
>   	struct xe_device *xe = gt_to_xe(q->gt);
>   	int err;
> @@ -346,11 +355,8 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>   
>   	exl->q = q;
>   
> -	err = drm_sched_init(&exl->sched, &drm_sched_ops, NULL, 1,
> -			     q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES,
> -			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
> -			     NULL, NULL, q->hwe->name,
> -			     gt_to_xe(q->gt)->drm.dev);
> +

Please don't use multiple blank lines.

> +	err = drm_sched_init(&exl->sched, &args);
>   	if (err)
>   		goto err_free;
>   

[...]

> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index a0ff08123f07..f0f5435598a8 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -540,12 +540,39 @@ struct drm_gpu_scheduler {
>   	struct device			*dev;
>   };
>   
> +/**
> + * struct drm_sched_init_args - parameters for initializing a DRM GPU scheduler
> + *
> + * @ops: backend operations provided by the driver
> + * @submit_wq: workqueue to use for submission. May be NULL.
> + *	If NULL, an ordered wq is allocated and used.

Could you align this line to the first word from the previous line? You
have examples of correct alignment in this file, such as `struct
drm_gpu_scheduler`. Also, you can check examples in [1].

[1] https://docs.kernel.org/doc-guide/kernel-doc.html

> + * @num_rqs: Number of run-queues. This may be at most DRM_SCHED_PRIORITY_COUNT,
> + *	as there's usually one run-queue per priority, but may be less.
> + * @credit_limit: the number of credits this scheduler can hold from all jobs
> + * @hang_limit: number of times to allow a job to hang before dropping it.
> + *	This mechanism is DEPRECATED. Set it to 0.
> + * @timeout: timeout value in jiffies for the scheduler
> + * @timeout_wq: workqueue to use for timeout work. May be NULL.
> + *	If NULL, the system_wq is used.
> + * @score: score atomic shared with other schedulers. May be NULL.
> + * @name: name used for debugging
> + * @dev: associated device. Used for debugging

How do you feel about using the same description of `struct
drm_gpu_scheduler` for @name and @dev?

> + */
> +struct drm_sched_init_args {
> +	const struct drm_sched_backend_ops *ops;
> +	struct workqueue_struct *submit_wq;
> +	struct workqueue_struct *timeout_wq;
> +	u32 num_rqs;
> +	u32 credit_limit;
> +	unsigned int hang_limit;
> +	long timeout;
> +	atomic_t *score;
> +	const char *name;
> +	struct device *dev;
> +};
> +
>   int drm_sched_init(struct drm_gpu_scheduler *sched,
> -		   const struct drm_sched_backend_ops *ops,
> -		   struct workqueue_struct *submit_wq,
> -		   u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
> -		   long timeout, struct workqueue_struct *timeout_wq,
> -		   atomic_t *score, const char *name, struct device *dev);
> +		const struct drm_sched_init_args *args);

Could you keep it aligned to the "("?

Best Regards,
- Maíra

>   
>   void drm_sched_fini(struct drm_gpu_scheduler *sched);
>   int drm_sched_job_init(struct drm_sched_job *job,

