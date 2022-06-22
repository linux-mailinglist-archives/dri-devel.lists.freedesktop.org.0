Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA77D5544BD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 10:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCFB10E1E9;
	Wed, 22 Jun 2022 08:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC74910E1E9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 08:52:09 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1o3w5l-00019i-PF; Wed, 22 Jun 2022 10:52:05 +0200
Message-ID: <ee89fef24afc2b740aa126d734cd382d3d3f9c92.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: print offender task information on
 hangcheck recovery
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 linux-kernel@vger.kernel.org
Date: Wed, 22 Jun 2022 10:52:04 +0200
In-Reply-To: <20220603123706.678320-1-christian.gmeiner@gmail.com>
References: <20220603123706.678320-1-christian.gmeiner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: David Airlie <airlied@linux.ie>, "moderated list:DRM DRIVERS FOR VIVANTE
 GPU IP" <etnaviv@lists.freedesktop.org>, "open list:DRM DRIVERS FOR VIVANTE
 GPU IP" <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

Am Freitag, dem 03.06.2022 um 14:37 +0200 schrieb Christian Gmeiner:
> Track the pid per submit, so we can print the name and cmdline of
> the task which submitted the batch that caused the gpu to hang.
> 
I really like the idea. I think the pid handling could be integrated
into the scheduler, so we don't have to carry it on each submit, but
not requesting any changes right now. I'm leaning toward taking this
patch as-is and doing the scheduler integration as a second step.

Regards,
Lucas

> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.h        |  1 +
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  6 ++++++
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c        | 18 +++++++++++++++++-
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h        |  2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c      |  2 +-
>  5 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> index 63688e6e4580..baa81cbf701a 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> @@ -96,6 +96,7 @@ struct etnaviv_gem_submit {
>  	int out_fence_id;
>  	struct list_head node; /* GPU active submit list */
>  	struct etnaviv_cmdbuf cmdbuf;
> +	struct pid *pid;       /* submitting process */
>  	bool runtime_resumed;
>  	u32 exec_state;
>  	u32 flags;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 1ac916b24891..1491159d0d20 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -399,6 +399,9 @@ static void submit_cleanup(struct kref *kref)
>  		mutex_unlock(&submit->gpu->fence_lock);
>  		dma_fence_put(submit->out_fence);
>  	}
> +
> +	put_pid(submit->pid);
> +
>  	kfree(submit->pmrs);
>  	kfree(submit);
>  }
> @@ -422,6 +425,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>  	struct sync_file *sync_file = NULL;
>  	struct ww_acquire_ctx ticket;
>  	int out_fence_fd = -1;
> +	struct pid *pid = get_pid(task_pid(current));
>  	void *stream;
>  	int ret;
>  
> @@ -519,6 +523,8 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>  		goto err_submit_ww_acquire;
>  	}
>  
> +	submit->pid = pid;
> +
>  	ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &submit->cmdbuf,
>  				  ALIGN(args->stream_size, 8) + 8);
>  	if (ret)
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 37018bc55810..7d9bf4673e2d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1045,12 +1045,28 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
>  }
>  #endif
>  
> -void etnaviv_gpu_recover_hang(struct etnaviv_gpu *gpu)
> +void etnaviv_gpu_recover_hang(struct etnaviv_gem_submit *submit)
>  {
> +	struct etnaviv_gpu *gpu = submit->gpu;
> +	char *comm = NULL, *cmd = NULL;
> +	struct task_struct *task;
>  	unsigned int i;
>  
>  	dev_err(gpu->dev, "recover hung GPU!\n");
>  
> +	task = get_pid_task(submit->pid, PIDTYPE_PID);
> +	if (task) {
> +		comm = kstrdup(task->comm, GFP_KERNEL);
> +		cmd = kstrdup_quotable_cmdline(task, GFP_KERNEL);
> +		put_task_struct(task);
> +	}
> +
> +	if (comm && cmd)
> +		dev_err(gpu->dev, "offending task: %s (%s)\n", comm, cmd);
> +
> +	kfree(cmd);
> +	kfree(comm);
> +
>  	if (pm_runtime_get_sync(gpu->dev) < 0)
>  		goto pm_put;
>  
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> index 85eddd492774..b3a0941d56fd 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -168,7 +168,7 @@ bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu);
>  int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m);
>  #endif
>  
> -void etnaviv_gpu_recover_hang(struct etnaviv_gpu *gpu);
> +void etnaviv_gpu_recover_hang(struct etnaviv_gem_submit *submit);
>  void etnaviv_gpu_retire(struct etnaviv_gpu *gpu);
>  int etnaviv_gpu_wait_fence_interruptible(struct etnaviv_gpu *gpu,
>  	u32 fence, struct drm_etnaviv_timespec *timeout);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 72e2553fbc98..d29f467eee13 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -67,7 +67,7 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
>  
>  	/* get the GPU back into the init state */
>  	etnaviv_core_dump(submit);
> -	etnaviv_gpu_recover_hang(gpu);
> +	etnaviv_gpu_recover_hang(submit);
>  
>  	drm_sched_resubmit_jobs(&gpu->sched);
>  


