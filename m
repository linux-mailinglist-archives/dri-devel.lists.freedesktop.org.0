Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0038A565B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 17:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C29C10E04F;
	Mon, 15 Apr 2024 15:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TvZgIJ98";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B889E11268E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 15:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g/simM61+7lgnckpkc/ZO44RqqkrmaWqF8atUhHLjIo=; b=TvZgIJ98UNE5RMKfDZpsVfmzyL
 mYxBPaXCAsQPRIZ+2gr9LMa8ody3wQs2Ouk6YKsGF2lCZZ1quuYAqqSJFDGG/bsXnd1hpuXOlyfin
 KgR5NGKWnB32vJz7mwcgpNvAmfqY2+Fp2XSwVr8MO+6d1BP32SxBg+mBHn7j1CvIO7mfZe+CVq4nH
 oglJG5rDk5P6XdjxaabfM2DlV6Qn1aDQbzSAoSKbOmiKau549qb75bqdj8iDnHKGOpgWxwGgeP/ET
 4t7iMIOdAL8jSE2UuSHM3B4hTS6Qt543R7ynxib74wJni5Gwv1GBHK+S/p98Z5JQZzpYgBgo35K1i
 +zRGf+aw==;
Received: from 3.32.60.213.dynamic.reverse-mundo-r.com ([213.60.32.3]
 helo=[192.168.50.63]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rwOEr-004oXR-H3; Mon, 15 Apr 2024 17:27:21 +0200
Message-ID: <8df92197-8ea7-45cd-8b99-b60bf4148f3a@igalia.com>
Date: Mon, 15 Apr 2024 17:27:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/v3d: Create a struct to store the GPU stats
Content-Language: en-US
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240403203517.731876-1-mcanal@igalia.com>
 <20240403203517.731876-4-mcanal@igalia.com>
From: Chema Casanova <jmcasanova@igalia.com>
Organization: Igalia
In-Reply-To: <20240403203517.731876-4-mcanal@igalia.com>
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

El 3/4/24 a las 22:24, Maíra Canal escribió:
> This will make it easier to instantiate the GPU stats variables and it
> will create a structure where we can store all the variables that refer
> to GPU stats.
>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_drv.c   | 14 ++++++--------
>   drivers/gpu/drm/v3d/v3d_drv.h   | 18 ++++++++++--------
>   drivers/gpu/drm/v3d/v3d_gem.c   |  4 +---
>   drivers/gpu/drm/v3d/v3d_sched.c | 20 ++++++++++++--------
>   drivers/gpu/drm/v3d/v3d_sysfs.c | 10 ++++++----
>   5 files changed, 35 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index 3debf37e7d9b..cbb62be18aa5 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -115,14 +115,11 @@ v3d_open(struct drm_device *dev, struct drm_file *file)
>   	v3d_priv->v3d = v3d;
>   
>   	for (i = 0; i < V3D_MAX_QUEUES; i++) {
> -		v3d_priv->enabled_ns[i] = 0;
> -		v3d_priv->start_ns[i] = 0;
> -		v3d_priv->jobs_sent[i] = 0;
> -
>   		sched = &v3d->queue[i].sched;
>   		drm_sched_entity_init(&v3d_priv->sched_entity[i],
>   				      DRM_SCHED_PRIORITY_NORMAL, &sched,
>   				      1, NULL);
> +		memset(&v3d_priv->stats[i], 0, sizeof(v3d_priv->stats[i]));
>   	}
>   
>   	v3d_perfmon_open_file(v3d_priv);
> @@ -151,20 +148,21 @@ static void v3d_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   	enum v3d_queue queue;
>   
>   	for (queue = 0; queue < V3D_MAX_QUEUES; queue++) {
> +		struct v3d_stats *stats = &file_priv->stats[queue];
> +
>   		/* Note that, in case of a GPU reset, the time spent during an
>   		 * attempt of executing the job is not computed in the runtime.
>   		 */
>   		drm_printf(p, "drm-engine-%s: \t%llu ns\n",
>   			   v3d_queue_to_string(queue),
> -			   file_priv->start_ns[queue] ? file_priv->enabled_ns[queue]
> -						      + timestamp - file_priv->start_ns[queue]
> -						      : file_priv->enabled_ns[queue]);
> +			   stats->start_ns ? stats->enabled_ns + timestamp - stats->start_ns
> +					   : stats->enabled_ns);
>   
>   		/* Note that we only count jobs that completed. Therefore, jobs
>   		 * that were resubmitted due to a GPU reset are not computed.
>   		 */
>   		drm_printf(p, "v3d-jobs-%s: \t%llu jobs\n",
> -			   v3d_queue_to_string(queue), file_priv->jobs_sent[queue]);
> +			   v3d_queue_to_string(queue), stats->jobs_sent);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index ee3545226d7f..0117593976ed 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -36,15 +36,20 @@ static inline char *v3d_queue_to_string(enum v3d_queue queue)
>   	return "UNKNOWN";
>   }
>   
> +struct v3d_stats {
> +	u64 start_ns;
> +	u64 enabled_ns;
> +	u64 jobs_sent;

As currently, we are only accounting jobs that have been completed. What
do you think of renaming jobs_sent to jobs_completed?

> +};
> +
>   struct v3d_queue_state {
>   	struct drm_gpu_scheduler sched;
>   
>   	u64 fence_context;
>   	u64 emit_seqno;
>   
> -	u64 start_ns;
> -	u64 enabled_ns;
> -	u64 jobs_sent;
> +	/* Stores the GPU stats for this queue in the global context. */
> +	struct v3d_stats stats;
>   };
>   
>   /* Performance monitor object. The perform lifetime is controlled by userspace
> @@ -188,11 +193,8 @@ struct v3d_file_priv {
>   
>   	struct drm_sched_entity sched_entity[V3D_MAX_QUEUES];
>   
> -	u64 start_ns[V3D_MAX_QUEUES];
> -
> -	u64 enabled_ns[V3D_MAX_QUEUES];
> -
> -	u64 jobs_sent[V3D_MAX_QUEUES];
> +	/* Stores the GPU stats for a specific queue for this fd. */
> +	struct v3d_stats stats[V3D_MAX_QUEUES];
>   };
>   
>   struct v3d_bo {
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index afc565078c78..d14589d3ae6c 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -248,9 +248,7 @@ v3d_gem_init(struct drm_device *dev)
>   
>   	for (i = 0; i < V3D_MAX_QUEUES; i++) {
>   		v3d->queue[i].fence_context = dma_fence_context_alloc(1);
> -		v3d->queue[i].start_ns = 0;
> -		v3d->queue[i].enabled_ns = 0;
> -		v3d->queue[i].jobs_sent = 0;
> +		memset(&v3d->queue[i].stats, 0, sizeof(v3d->queue[i].stats));
>   	}
>   
>   	spin_lock_init(&v3d->mm_lock);
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 8ca61bcd4b1c..ea5f5a84b55b 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -110,10 +110,12 @@ v3d_job_start_stats(struct v3d_job *job, enum v3d_queue queue)
>   {
>   	struct v3d_dev *v3d = job->v3d;
>   	struct v3d_file_priv *file = job->file->driver_priv;
> +	struct v3d_stats *global_stats = &v3d->queue[queue].stats;
> +	struct v3d_stats *local_stats = &file->stats[queue];
>   	u64 now = local_clock();
>   
> -	file->start_ns[queue] = now;
> -	v3d->queue[queue].start_ns = now;
> +	local_stats->start_ns = now;
> +	global_stats->start_ns = now;
>   }
>   
>   void
> @@ -121,15 +123,17 @@ v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue)
>   {
>   	struct v3d_dev *v3d = job->v3d;
>   	struct v3d_file_priv *file = job->file->driver_priv;
> +	struct v3d_stats *global_stats = &v3d->queue[queue].stats;
> +	struct v3d_stats *local_stats = &file->stats[queue];
>   	u64 now = local_clock();
>   
> -	file->enabled_ns[queue] += now - file->start_ns[queue];
> -	file->jobs_sent[queue]++;
> -	file->start_ns[queue] = 0;
> +	local_stats->enabled_ns += now - local_stats->start_ns;
> +	local_stats->jobs_sent++;
> +	local_stats->start_ns = 0;
>   
> -	v3d->queue[queue].enabled_ns += now - v3d->queue[queue].start_ns;
> -	v3d->queue[queue].jobs_sent++;
> -	v3d->queue[queue].start_ns = 0;
> +	global_stats->enabled_ns += now - global_stats->start_ns;
> +	global_stats->jobs_sent++;
> +	global_stats->start_ns = 0;
>   }
>   
>   static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
> diff --git a/drivers/gpu/drm/v3d/v3d_sysfs.c b/drivers/gpu/drm/v3d/v3d_sysfs.c
> index d106845ba890..1eb5f3de6937 100644
> --- a/drivers/gpu/drm/v3d/v3d_sysfs.c
> +++ b/drivers/gpu/drm/v3d/v3d_sysfs.c
> @@ -21,8 +21,10 @@ gpu_stats_show(struct device *dev, struct device_attribute *attr, char *buf)
>   	len += sysfs_emit(buf, "queue\ttimestamp\tjobs\truntime\n");
>   
>   	for (queue = 0; queue < V3D_MAX_QUEUES; queue++) {
> -		if (v3d->queue[queue].start_ns)
> -			active_runtime = timestamp - v3d->queue[queue].start_ns;
> +		struct v3d_stats *stats = &v3d->queue[queue].stats;
> +
> +		if (stats->start_ns)
> +			active_runtime = timestamp - stats->start_ns;
>   		else
>   			active_runtime = 0;
>   
> @@ -39,8 +41,8 @@ gpu_stats_show(struct device *dev, struct device_attribute *attr, char *buf)
>   		len += sysfs_emit_at(buf, len, "%s\t%llu\t%llu\t%llu\n",
>   				     v3d_queue_to_string(queue),
>   				     timestamp,
> -				     v3d->queue[queue].jobs_sent,
> -				     v3d->queue[queue].enabled_ns + active_runtime);
> +				     stats->jobs_sent,
> +				     stats->enabled_ns + active_runtime);
>   	}
>   
>   	return len;

Not related to this review, but as a general doubt, I miss with our current
implementation the possibility of the user checking if a queue is running
or not when the stats are checked. That information is stored in the struct
as (start_ns !=0) but is not exposed, and it could be interesting 
information.

It would explain why you have running time (enabled_ns>0) but
jobs_sent/completed is still 0, that is possible as you have one job 
running.
It would be useful also if you want to check the average enabled/time 
per job.
As we should consider the number of jobs completed + currently running
to calculate the average.

In any case, this patch is:

Reviewed-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>


