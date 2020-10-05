Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AAF28379D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 16:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9200689DBD;
	Mon,  5 Oct 2020 14:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4319D89C82
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 14:23:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601907812; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=j+q6qQHi3OFDDwad/nySobttr3Dg5t06eOfbu86u5fQ=;
 b=COMrghgx4reYsYehSzeaS+qqkzp3zXEmnp9UgtN/A7w2e5l4m4y+PFdAWfkPyBGgi43y1vWp
 QY7vbvoHOA7pJJpKeX3lAH0wOfLJAT8gNoDFe3H1N1sKQQawwZrSi4F6uJdJOLlF6/WDxK7U
 h9iZHP2FENBJeUkM7CrIP6z8Tfc=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f7b2c63aad2c3cd1cd13270 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Oct 2020 14:23:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A1958C433CA; Mon,  5 Oct 2020 14:23:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A55C4C433C8;
 Mon,  5 Oct 2020 14:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A55C4C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 5 Oct 2020 08:23:25 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 06/14] drm/msm: Protect ring->submits with
 it's own lock
Message-ID: <20201005142325.GE4204@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
References: <20201004192152.3298573-1-robdclark@gmail.com>
 <20201004192152.3298573-7-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201004192152.3298573-7-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 04, 2020 at 12:21:38PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> One less place to rely on dev->struct_mutex.
> 

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c |  2 ++
>  drivers/gpu/drm/msm/msm_gpu.c        | 37 ++++++++++++++++++++++------
>  drivers/gpu/drm/msm/msm_ringbuffer.c |  1 +
>  drivers/gpu/drm/msm/msm_ringbuffer.h |  6 +++++
>  4 files changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index aa5c60a7132d..e1d1f005b3d4 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -63,7 +63,9 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>  void msm_gem_submit_free(struct msm_gem_submit *submit)
>  {
>  	dma_fence_put(submit->fence);
> +	spin_lock(&submit->ring->submit_lock);
>  	list_del(&submit->node);
> +	spin_unlock(&submit->ring->submit_lock);
>  	put_pid(submit->pid);
>  	msm_submitqueue_put(submit->queue);
>  
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index ca8c95b32c8b..8d1e254f964a 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -270,6 +270,7 @@ static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>  {
>  	struct msm_gem_submit *submit;
>  
> +	spin_lock(&ring->submit_lock);
>  	list_for_each_entry(submit, &ring->submits, node) {
>  		if (submit->seqno > fence)
>  			break;
> @@ -277,6 +278,7 @@ static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>  		msm_update_fence(submit->ring->fctx,
>  			submit->fence->seqno);
>  	}
> +	spin_unlock(&ring->submit_lock);
>  }
>  
>  #ifdef CONFIG_DEV_COREDUMP
> @@ -430,11 +432,14 @@ find_submit(struct msm_ringbuffer *ring, uint32_t fence)
>  {
>  	struct msm_gem_submit *submit;
>  
> -	WARN_ON(!mutex_is_locked(&ring->gpu->dev->struct_mutex));
> -
> -	list_for_each_entry(submit, &ring->submits, node)
> -		if (submit->seqno == fence)
> +	spin_lock(&ring->submit_lock);
> +	list_for_each_entry(submit, &ring->submits, node) {
> +		if (submit->seqno == fence) {
> +			spin_unlock(&ring->submit_lock);
>  			return submit;
> +		}
> +	}
> +	spin_unlock(&ring->submit_lock);
>  
>  	return NULL;
>  }
> @@ -523,8 +528,10 @@ static void recover_worker(struct work_struct *work)
>  		for (i = 0; i < gpu->nr_rings; i++) {
>  			struct msm_ringbuffer *ring = gpu->rb[i];
>  
> +			spin_lock(&ring->submit_lock);
>  			list_for_each_entry(submit, &ring->submits, node)
>  				gpu->funcs->submit(gpu, submit);
> +			spin_unlock(&ring->submit_lock);
>  		}
>  	}
>  
> @@ -711,7 +718,6 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>  static void retire_submits(struct msm_gpu *gpu)
>  {
>  	struct drm_device *dev = gpu->dev;
> -	struct msm_gem_submit *submit, *tmp;
>  	int i;
>  
>  	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
> @@ -720,9 +726,24 @@ static void retire_submits(struct msm_gpu *gpu)
>  	for (i = 0; i < gpu->nr_rings; i++) {
>  		struct msm_ringbuffer *ring = gpu->rb[i];
>  
> -		list_for_each_entry_safe(submit, tmp, &ring->submits, node) {
> -			if (dma_fence_is_signaled(submit->fence))
> +		while (true) {
> +			struct msm_gem_submit *submit = NULL;
> +
> +			spin_lock(&ring->submit_lock);
> +			submit = list_first_entry_or_null(&ring->submits,
> +					struct msm_gem_submit, node);
> +			spin_unlock(&ring->submit_lock);
> +
> +			/*
> +			 * If no submit, we are done.  If submit->fence hasn't
> +			 * been signalled, then later submits are not signalled
> +			 * either, so we are also done.
> +			 */
> +			if (submit && dma_fence_is_signaled(submit->fence)) {
>  				retire_submit(gpu, ring, submit);
> +			} else {
> +				break;
> +			}
>  		}
>  	}
>  }
> @@ -765,7 +786,9 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  
>  	submit->seqno = ++ring->seqno;
>  
> +	spin_lock(&ring->submit_lock);
>  	list_add_tail(&submit->node, &ring->submits);
> +	spin_unlock(&ring->submit_lock);
>  
>  	msm_rd_dump_submit(priv->rd, submit, NULL);
>  
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index 1b6958e908dc..4d2a2a4abef8 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -46,6 +46,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>  	ring->memptrs_iova = memptrs_iova;
>  
>  	INIT_LIST_HEAD(&ring->submits);
> +	spin_lock_init(&ring->submit_lock);
>  	spin_lock_init(&ring->preempt_lock);
>  
>  	snprintf(name, sizeof(name), "gpu-ring-%d", ring->id);
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
> index 4956d1bc5d0e..fe55d4a1aa16 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
> @@ -39,7 +39,13 @@ struct msm_ringbuffer {
>  	int id;
>  	struct drm_gem_object *bo;
>  	uint32_t *start, *end, *cur, *next;
> +
> +	/*
> +	 * List of in-flight submits on this ring.  Protected by submit_lock.
> +	 */
>  	struct list_head submits;
> +	spinlock_t submit_lock;
> +
>  	uint64_t iova;
>  	uint32_t seqno;
>  	uint32_t hangcheck_fence;
> -- 
> 2.26.2
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
