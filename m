Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A529B416F5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 09:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863C610E418;
	Wed,  3 Sep 2025 07:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jjzxFdSd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91C010E418
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 07:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756885221;
 bh=hhSAMSQrkXhD2o3m/B4dWzq5cXZfmbWoROyPBzStHGA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jjzxFdSdRavg8LWIhLEq96iWWR1q7iLPMomMe3lTvyX25lLfMRTbrHXgQTcZJO8KS
 OumgbTNQJ8vxKIV//SydgzBQ15eNY1f4a+KIAx4r0iROPyr4skkJ8cADVGO0GxSVPD
 mPIEUdBDyAbliCzfs3mnIRtfN+DKaRrT8v05ltZB4CYP3HiIuntKmmRG3iVTwpybEh
 c9pQ83L0x9xkHfwfYl7fZGI1u6u76R3cmO/d5ianLut3OC2Swz+qOclT1b6ktoZwdi
 A+mckqja41cmmK4cJ5cQhBiOsZuUHlh+BiILySjtiaGdC73VzIFKTHFRf4N0E+yMls
 xRF+1IoPT25fg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C3A7B17E127E;
 Wed,  3 Sep 2025 09:40:20 +0200 (CEST)
Date: Wed, 3 Sep 2025 09:40:15 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/panthor: assign unique names to queues
Message-ID: <20250903094015.0e47de12@fedora>
In-Reply-To: <20250902200624.428175-1-olvaffe@gmail.com>
References: <20250902200624.428175-1-olvaffe@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue,  2 Sep 2025 13:06:24 -0700
Chia-I Wu <olvaffe@gmail.com> wrote:

> Userspace relies on the ring field of gpu_scheduler tracepoints to
> identify a drm_gpu_scheduler.  The value of the ring field is taken from
> sched->name.
> 
> Because we typically have multiple schedulers running in parallel in
> each process, assign unique names to schedulers such that userspace can
> distinguish them.
> 
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
> ---
> 
> v2:
>  - include drm_client_id in the name to be truly unique
>  - remove unnecessary NULL in drm_sched_init_args initialization
>  - reformat to column width 100
> 
> v3:
>  - switch to kasprintf for queue name
>    - open to alternatives such as name[48], shorter prefix (e.g.,
>      panthor-q), etc.
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c   |  2 +-
>  drivers/gpu/drm/panthor/panthor_sched.c | 38 ++++++++++++++++++-------
>  drivers/gpu/drm/panthor/panthor_sched.h |  3 +-
>  3 files changed, 31 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 9256806eb6623..be962b1387f03 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1105,7 +1105,7 @@ static int panthor_ioctl_group_create(struct drm_device *ddev, void *data,
>  	if (ret)
>  		goto out;
>  
> -	ret = panthor_group_create(pfile, args, queue_args);
> +	ret = panthor_group_create(pfile, args, queue_args, file->client_id);
>  	if (ret < 0)
>  		goto out;
>  	args->group_handle = ret;
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index ba5dc3e443d9c..b328631c00489 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -360,6 +360,9 @@ struct panthor_queue {
>  	/** @entity: DRM scheduling entity used for this queue. */
>  	struct drm_sched_entity entity;
>  
> +	/** @name: DRM scheduler name for this queue. */
> +	char *name;
> +
>  	/**
>  	 * @remaining_time: Time remaining before the job timeout expires.
>  	 *
> @@ -901,6 +904,8 @@ static void group_free_queue(struct panthor_group *group, struct panthor_queue *
>  	if (queue->scheduler.ops)
>  		drm_sched_fini(&queue->scheduler);
>  
> +	kfree(queue->name);
> +
>  	panthor_queue_put_syncwait_obj(queue);
>  
>  	panthor_kernel_bo_destroy(queue->ringbuf);
> @@ -3308,9 +3313,10 @@ static u32 calc_profiling_ringbuf_num_slots(struct panthor_device *ptdev,
>  
>  static struct panthor_queue *
>  group_create_queue(struct panthor_group *group,
> -		   const struct drm_panthor_queue_create *args)
> +		   const struct drm_panthor_queue_create *args,
> +		   u64 drm_client_id, u32 gid, u32 qid)
>  {
> -	const struct drm_sched_init_args sched_args = {
> +	struct drm_sched_init_args sched_args = {
>  		.ops = &panthor_queue_sched_ops,
>  		.submit_wq = group->ptdev->scheduler->wq,
>  		.num_rqs = 1,
> @@ -3323,7 +3329,6 @@ group_create_queue(struct panthor_group *group,
>  		.credit_limit = args->ringbuf_size / sizeof(u64),
>  		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
>  		.timeout_wq = group->ptdev->reset.wq,
> -		.name = "panthor-queue",
>  		.dev = group->ptdev->base.dev,
>  	};
>  	struct drm_gpu_scheduler *drm_sched;
> @@ -3398,6 +3403,15 @@ group_create_queue(struct panthor_group *group,
>  	if (ret)
>  		goto err_free_queue;
>  
> +	/* assign a unique name */
> +	queue->name = kasprintf(GFP_KERNEL, "panthor-queue-%llu-%u-%u", drm_client_id, gid, qid);
> +	if (!queue->name) {
> +		ret = -ENOMEM;
> +		goto err_free_queue;
> +	}
> +
> +	sched_args.name = queue->name;
> +
>  	ret = drm_sched_init(&queue->scheduler, &sched_args);
>  	if (ret)
>  		goto err_free_queue;
> @@ -3447,7 +3461,8 @@ static void add_group_kbo_sizes(struct panthor_device *ptdev,
>  
>  int panthor_group_create(struct panthor_file *pfile,
>  			 const struct drm_panthor_group_create *group_args,
> -			 const struct drm_panthor_queue_create *queue_args)
> +			 const struct drm_panthor_queue_create *queue_args,
> +			 u64 drm_client_id)
>  {
>  	struct panthor_device *ptdev = pfile->ptdev;
>  	struct panthor_group_pool *gpool = pfile->groups;
> @@ -3540,12 +3555,16 @@ int panthor_group_create(struct panthor_file *pfile,
>  	memset(group->syncobjs->kmap, 0,
>  	       group_args->queues.count * sizeof(struct panthor_syncobj_64b));
>  
> +	ret = xa_alloc(&gpool->xa, &gid, group, XA_LIMIT(1, MAX_GROUPS_PER_POOL), GFP_KERNEL);
> +	if (ret)
> +		goto err_put_group;
> +
>  	for (i = 0; i < group_args->queues.count; i++) {
> -		group->queues[i] = group_create_queue(group, &queue_args[i]);
> +		group->queues[i] = group_create_queue(group, &queue_args[i], drm_client_id, gid, i);
>  		if (IS_ERR(group->queues[i])) {
>  			ret = PTR_ERR(group->queues[i]);
>  			group->queues[i] = NULL;
> -			goto err_put_group;
> +			goto err_erase_gid;
>  		}
>  
>  		group->queue_count++;
> @@ -3553,10 +3572,6 @@ int panthor_group_create(struct panthor_file *pfile,
>  
>  	group->idle_queues = GENMASK(group->queue_count - 1, 0);
>  
> -	ret = xa_alloc(&gpool->xa, &gid, group, XA_LIMIT(1, MAX_GROUPS_PER_POOL), GFP_KERNEL);
> -	if (ret)
> -		goto err_put_group;
> -
>  	mutex_lock(&sched->reset.lock);
>  	if (atomic_read(&sched->reset.in_progress)) {
>  		panthor_group_stop(group);
> @@ -3575,6 +3590,9 @@ int panthor_group_create(struct panthor_file *pfile,
>  
>  	return gid;
>  
> +err_erase_gid:
> +	xa_erase(&gpool->xa, gid);
> +
>  err_put_group:
>  	group_put(group);
>  	return ret;
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
> index 742b0b4ff3a3c..f4a475aa34c0a 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.h
> +++ b/drivers/gpu/drm/panthor/panthor_sched.h
> @@ -21,7 +21,8 @@ struct panthor_job;
>  
>  int panthor_group_create(struct panthor_file *pfile,
>  			 const struct drm_panthor_group_create *group_args,
> -			 const struct drm_panthor_queue_create *queue_args);
> +			 const struct drm_panthor_queue_create *queue_args,
> +			 u64 drm_client_id);
>  int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle);
>  int panthor_group_get_state(struct panthor_file *pfile,
>  			    struct drm_panthor_group_get_state *get_state);

