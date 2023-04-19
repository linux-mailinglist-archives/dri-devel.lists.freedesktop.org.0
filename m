Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 285336E7682
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 11:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6976010E904;
	Wed, 19 Apr 2023 09:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B44B10E90B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 09:39:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A1FE143D;
 Wed, 19 Apr 2023 02:40:19 -0700 (PDT)
Received: from [10.57.20.93] (unknown [10.57.20.93])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EB0D3F5A1;
 Wed, 19 Apr 2023 02:39:33 -0700 (PDT)
Message-ID: <ddaf4984-6f5a-404c-df9d-537245e99420@arm.com>
Date: Wed, 19 Apr 2023 10:39:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] drm/scheduler: set entity to NULL in
 drm_sched_entity_pop_job()
Content-Language: en-GB
To: Danilo Krummrich <dakr@redhat.com>, luben.tuikov@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, l.stach@pengutronix.de,
 christian.koenig@amd.com
References: <20230418100453.4433-1-dakr@redhat.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230418100453.4433-1-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/04/2023 11:04, Danilo Krummrich wrote:
> It already happend a few times that patches slipped through which
> implemented access to an entity through a job that was already removed
> from the entities queue. Since jobs and entities might have different
> lifecycles, this can potentially cause UAF bugs.
> 
> In order to make it obvious that a jobs entity pointer shouldn't be
> accessed after drm_sched_entity_pop_job() was called successfully, set
> the jobs entity pointer to NULL once the job is removed from the entity
> queue.
> 
> Moreover, debugging a potential NULL pointer dereference is way easier
> than potentially corrupted memory through a UAF.
> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

This triggers a splat for me (with Panfrost driver), the cause of which
is the following code in drm_sched_get_cleanup_job():

	if (job) {
		job->entity->elapsed_ns += ktime_to_ns(
			ktime_sub(job->s_fence->finished.timestamp,
				  job->s_fence->scheduled.timestamp));
	}

which indeed is accessing entity after the job has been returned from
drm_sched_entity_pop_job(). And obviously job->entity is a NULL pointer
with this patch.

I'm afraid I don't fully understand the lifecycle so I'm not sure if
this is simply exposing an existing bug in drm_sched_get_cleanup_job()
or if this commit needs to be reverted.

Thanks,

Steve

> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 6 ++++++
>  drivers/gpu/drm/scheduler/sched_main.c   | 4 ++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 15d04a0ec623..a9c6118e534b 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -448,6 +448,12 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  			drm_sched_rq_update_fifo(entity, next->submit_ts);
>  	}
>  
> +	/* Jobs and entities might have different lifecycles. Since we're
> +	 * removing the job from the entities queue, set the jobs entity pointer
> +	 * to NULL to prevent any future access of the entity through this job.
> +	 */
> +	sched_job->entity = NULL;
> +
>  	return sched_job;
>  }
>  
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 9b16480686f6..e89a3e469cd5 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -42,6 +42,10 @@
>   *    the hardware.
>   *
>   * The jobs in a entity are always scheduled in the order that they were pushed.
> + *
> + * Note that once a job was taken from the entities queue and pushed to the
> + * hardware, i.e. the pending queue, the entity must not be referenced anymore
> + * through the jobs entity pointer.
>   */
>  
>  #include <linux/kthread.h>

