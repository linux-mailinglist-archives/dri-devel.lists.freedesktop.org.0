Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57717B3DAFA
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291B410E396;
	Mon,  1 Sep 2025 07:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PkXND/HT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BAF10E396
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 07:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756711640;
 bh=LAcnBodV1W8hZWleUCLeTPPUE98/reb7yOHhqiqbJ/o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PkXND/HTsf7p4+y9DgvDdRKdN+1KRkjeu9YmiGWIuA9Nf/JY5F5STyeFZi0PDhPx+
 6/nU0K/k6OvH0HbhdJT0tokmcCsbcXTFa9QxsDY+oXD+v4e7Pa/p0xr6z0SHeJxqdt
 4fKrV0qXyABD6VcX0vEIciiLc5UEPOeli0mpeEp+uEi5gm3bcsW/p691lPCqjXKAEP
 ZXxIOxX4Dy12e8CbBWiSp8hAWXdVI57gkuBc6v2FjqeO/30lJS85ov0UibWMQ2hQzz
 4zxgO2UJzERxC0drlt2hb+2wo45eSCFW+N3AkNtFe4ByPIc/g2VtCNzYcbASqVcxZz
 lMxmlYX78R0Aw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EDF2617E0FDB;
 Mon,  1 Sep 2025 09:27:19 +0200 (CEST)
Date: Mon, 1 Sep 2025 09:27:11 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/panthor: assign unique names to queues
Message-ID: <20250901092711.15832cfe@fedora>
In-Reply-To: <20250829230251.3095911-1-olvaffe@gmail.com>
References: <20250829230251.3095911-1-olvaffe@gmail.com>
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

On Fri, 29 Aug 2025 16:02:50 -0700
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
> 
> ---
> 
> v2:
>  - include drm_client_id in the name to be truly unique
>  - remove unnecessary NULL in drm_sched_init_args initialization
>  - reformat to column width 100
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c   |  2 +-
>  drivers/gpu/drm/panthor/panthor_sched.c | 32 +++++++++++++++++--------
>  drivers/gpu/drm/panthor/panthor_sched.h |  3 ++-
>  3 files changed, 25 insertions(+), 12 deletions(-)
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

Hm, maybe it's time we start passing drm_file instead of panthor_file
to limit the number of arguments, but I guess this can be done in a
follow-up patch.

>  	if (ret < 0)
>  		goto out;
>  	args->group_handle = ret;
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index ba5dc3e443d9c..62f17476e5852 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -360,6 +360,9 @@ struct panthor_queue {
>  	/** @entity: DRM scheduling entity used for this queue. */
>  	struct drm_sched_entity entity;
>  
> +	/** @name: DRM scheduler name for this queue. */
> +	char name[32];

The base string ("panthor-queue---") is already 16 characters. You then
have a group ID that's below 128 IIRC, and a queue ID that's no more
than 15, so that's 5 more chars. This leaves you 10 chars for the
client ID (theoretically a 64-bit integer). I know the logic is sane
because you truncate the string, but I'm wondering if we shouldn't make
this string bigger to cover the theoretical max client_id, or simply
dynamically allocate it (kasprintf()), so we don't have to think about
it if we end up adding more stuff to the string.

> +
>  	/**
>  	 * @remaining_time: Time remaining before the job timeout expires.
>  	 *
> @@ -3308,9 +3311,10 @@ static u32 calc_profiling_ringbuf_num_slots(struct panthor_device *ptdev,
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
> @@ -3323,7 +3327,6 @@ group_create_queue(struct panthor_group *group,
>  		.credit_limit = args->ringbuf_size / sizeof(u64),
>  		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
>  		.timeout_wq = group->ptdev->reset.wq,
> -		.name = "panthor-queue",
>  		.dev = group->ptdev->base.dev,
>  	};
>  	struct drm_gpu_scheduler *drm_sched;
> @@ -3398,6 +3401,11 @@ group_create_queue(struct panthor_group *group,
>  	if (ret)
>  		goto err_free_queue;
>  
> +	/* assign a unique name */
> +	snprintf(queue->name, sizeof(queue->name), "panthor-queue-%llu-%u-%u",
> +		 drm_client_id, gid, qid);
> +	sched_args.name = queue->name;
> +
>  	ret = drm_sched_init(&queue->scheduler, &sched_args);
>  	if (ret)
>  		goto err_free_queue;
> @@ -3447,7 +3455,8 @@ static void add_group_kbo_sizes(struct panthor_device *ptdev,
>  
>  int panthor_group_create(struct panthor_file *pfile,
>  			 const struct drm_panthor_group_create *group_args,
> -			 const struct drm_panthor_queue_create *queue_args)
> +			 const struct drm_panthor_queue_create *queue_args,
> +			 u64 drm_client_id)
>  {
>  	struct panthor_device *ptdev = pfile->ptdev;
>  	struct panthor_group_pool *gpool = pfile->groups;
> @@ -3540,12 +3549,16 @@ int panthor_group_create(struct panthor_file *pfile,
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
> @@ -3553,10 +3566,6 @@ int panthor_group_create(struct panthor_file *pfile,
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
> @@ -3575,6 +3584,9 @@ int panthor_group_create(struct panthor_file *pfile,
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

