Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3548AC9A1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 11:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6267110F194;
	Mon, 22 Apr 2024 09:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ohFhZrmn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E8010F194
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 09:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZVvFbUXC5SvQmtQMqBotjGmDQP5EJhizU73U/TOvfjo=; b=ohFhZrmntKpzTa8nb4Zn+x8BJK
 bB41jJtYhmx4RvUV0oJ6i8s47a28VFY//UUSOb4tjrYb5lOkg7XVFUP/zSBOaz4nuJWrv6LjSbKeo
 9b4FpvhPzHJTC2rrEP31xAm2z/9cLq7Ak2zP8JsI2f/fik33pc8yKdcO3bufL/tGlFSSma+WJUl6y
 +jaALSYZpY3zvhFpcNnG70+rdvExLLTvDwDGXulHAWmgovptoy2tIM5NaMkPwgnm4+sBY1Ynrgtdr
 W8bYM14eyC2v8wBUFm0pWDlyHarFbriSn3tjjgvWIcnVzyn0pMOMCNlLJxdL86Ffwf+jHanGWlMdO
 7KOSUX2Q==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ryqHg-007Ca6-4s; Mon, 22 Apr 2024 11:48:24 +0200
Message-ID: <51865880-cceb-48bc-97eb-04d47e8896fc@igalia.com>
Date: Mon, 22 Apr 2024 10:48:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] drm/v3d: Decouple stats calculation from printing
Content-Language: en-GB
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Chema Casanova <jmcasanova@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240420213632.339941-2-mcanal@igalia.com>
 <20240420213632.339941-6-mcanal@igalia.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240420213632.339941-6-mcanal@igalia.com>
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


On 20/04/2024 22:32, Maíra Canal wrote:
> Create a function to decouple the stats calculation from the printing.
> This will be useful in the next step when we add a seqcount to protect
> the stats.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_drv.c   | 18 ++++++++++++++----
>   drivers/gpu/drm/v3d/v3d_drv.h   |  4 ++++
>   drivers/gpu/drm/v3d/v3d_sysfs.c | 11 +++--------
>   3 files changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index 52e3ba9df46f..2ec359ed2def 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -142,6 +142,15 @@ v3d_postclose(struct drm_device *dev, struct drm_file *file)
>   	kfree(v3d_priv);
>   }
>   
> +void v3d_get_stats(const struct v3d_stats *stats, u64 timestamp,
> +		   u64 *active_runtime, u64 *jobs_completed)
> +{
> +	*active_runtime = stats->enabled_ns;
> +	if (stats->start_ns)
> +		*active_runtime += timestamp - stats->start_ns;
> +	*jobs_completed = stats->jobs_completed;
> +}
> +
>   static void v3d_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   {
>   	struct v3d_file_priv *file_priv = file->driver_priv;
> @@ -150,20 +159,21 @@ static void v3d_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   
>   	for (queue = 0; queue < V3D_MAX_QUEUES; queue++) {
>   		struct v3d_stats *stats = &file_priv->stats[queue];
> +		u64 active_runtime, jobs_completed;
> +
> +		v3d_get_stats(stats, timestamp, &active_runtime, &jobs_completed);
>   
>   		/* Note that, in case of a GPU reset, the time spent during an
>   		 * attempt of executing the job is not computed in the runtime.
>   		 */
>   		drm_printf(p, "drm-engine-%s: \t%llu ns\n",
> -			   v3d_queue_to_string(queue),
> -			   stats->start_ns ? stats->enabled_ns + timestamp - stats->start_ns
> -					   : stats->enabled_ns);
> +			   v3d_queue_to_string(queue), active_runtime);
>   
>   		/* Note that we only count jobs that completed. Therefore, jobs
>   		 * that were resubmitted due to a GPU reset are not computed.
>   		 */
>   		drm_printf(p, "v3d-jobs-%s: \t%llu jobs\n",
> -			   v3d_queue_to_string(queue), stats->jobs_completed);
> +			   v3d_queue_to_string(queue), jobs_completed);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index 5a198924d568..ff06dc1cc078 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -510,6 +510,10 @@ struct drm_gem_object *v3d_prime_import_sg_table(struct drm_device *dev,
>   /* v3d_debugfs.c */
>   void v3d_debugfs_init(struct drm_minor *minor);
>   
> +/* v3d_drv.c */
> +void v3d_get_stats(const struct v3d_stats *stats, u64 timestamp,
> +		   u64 *active_runtime, u64 *jobs_completed);
> +
>   /* v3d_fence.c */
>   extern const struct dma_fence_ops v3d_fence_ops;
>   struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum v3d_queue queue);
> diff --git a/drivers/gpu/drm/v3d/v3d_sysfs.c b/drivers/gpu/drm/v3d/v3d_sysfs.c
> index 6a8e7acc8b82..d610e355964f 100644
> --- a/drivers/gpu/drm/v3d/v3d_sysfs.c
> +++ b/drivers/gpu/drm/v3d/v3d_sysfs.c
> @@ -15,18 +15,15 @@ gpu_stats_show(struct device *dev, struct device_attribute *attr, char *buf)
>   	struct v3d_dev *v3d = to_v3d_dev(drm);
>   	enum v3d_queue queue;
>   	u64 timestamp = local_clock();
> -	u64 active_runtime;
>   	ssize_t len = 0;
>   
>   	len += sysfs_emit(buf, "queue\ttimestamp\tjobs\truntime\n");
>   
>   	for (queue = 0; queue < V3D_MAX_QUEUES; queue++) {
>   		struct v3d_stats *stats = &v3d->queue[queue].stats;
> +		u64 active_runtime, jobs_completed;
>   
> -		if (stats->start_ns)
> -			active_runtime = timestamp - stats->start_ns;
> -		else
> -			active_runtime = 0;
> +		v3d_get_stats(stats, timestamp, &active_runtime, &jobs_completed);
>   
>   		/* Each line will display the queue name, timestamp, the number
>   		 * of jobs sent to that queue and the runtime, as can be seem here:
> @@ -40,9 +37,7 @@ gpu_stats_show(struct device *dev, struct device_attribute *attr, char *buf)
>   		 */
>   		len += sysfs_emit_at(buf, len, "%s\t%llu\t%llu\t%llu\n",
>   				     v3d_queue_to_string(queue),
> -				     timestamp,
> -				     stats->jobs_completed,
> -				     stats->enabled_ns + active_runtime);
> +				     timestamp, jobs_completed, active_runtime);
>   	}
>   
>   	return len;

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko
