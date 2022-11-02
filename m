Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D52615769
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 03:15:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3166410E021;
	Wed,  2 Nov 2022 02:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 323 seconds by postgrey-1.36 at gabe;
 Wed, 02 Nov 2022 02:14:54 UTC
Received: from r3-24.sinamail.sina.com.cn (r3-24.sinamail.sina.com.cn
 [202.108.3.24])
 by gabe.freedesktop.org (Postfix) with ESMTP id 16BD510E021
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 02:14:53 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([114.249.57.238])
 by sina.com (172.16.97.23) with ESMTP
 id 6361D0E400003E1E; Wed, 2 Nov 2022 10:07:33 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 75547554924426
From: Hillf Danton <hdanton@sina.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm: Hangcheck progress detection
Date: Wed,  2 Nov 2022 10:09:17 +0800
Message-Id: <20221102020917.3812-1-hdanton@sina.com>
In-Reply-To: <20221101223319.165493-3-robdclark@gmail.com>
References: <20221101223319.165493-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1 Nov 2022 15:33:10 -0700 Rob Clark <robdclark@chromium.org>
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -500,6 +500,21 @@ static void hangcheck_timer_reset(struct msm_gpu *gpu)
>  			round_jiffies_up(jiffies + msecs_to_jiffies(priv->hangcheck_period)));
>  }
>  
> +static bool made_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
> +{
> +	if (ring->hangcheck_progress_retries >= DRM_MSM_HANGCHECK_PROGRESS_RETRIES)
> +		return false;
> +
> +	if (!gpu->funcs->progress)
> +		return false;

Retry can not make difference without the progress callback provided.

> +
> +	if (!gpu->funcs->progress(gpu, ring))
> +		return false;
> +
> +	ring->hangcheck_progress_retries++;
> +	return true;
> +}
> +
>  static void hangcheck_handler(struct timer_list *t)
>  {
>  	struct msm_gpu *gpu = from_timer(gpu, t, hangcheck_timer);
> @@ -511,9 +526,12 @@ static void hangcheck_handler(struct timer_list *t)
>  	if (fence != ring->hangcheck_fence) {
>  		/* some progress has been made.. ya! */
>  		ring->hangcheck_fence = fence;
> -	} else if (fence_before(fence, ring->fctx->last_fence)) {
> +		ring->hangcheck_progress_retries = 0;
> +	} else if (fence_before(fence, ring->fctx->last_fence) &&
> +			!made_progress(gpu, ring)) {
>  		/* no progress and not done.. hung! */
>  		ring->hangcheck_fence = fence;
> +		ring->hangcheck_progress_retries = 0;
>  		DRM_DEV_ERROR(dev->dev, "%s: hangcheck detected gpu lockup rb %d!\n",
>  				gpu->name, ring->id);
>  		DRM_DEV_ERROR(dev->dev, "%s:     completed fence: %u\n",

Cutting DRM_MSM_HANGCHECK_DEFAULT_PERIOD down to 250ms leads to report of
false hang detected in case of no ->progress implemented.

> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 585fd9c8d45a..d8f355e9f0b2 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -78,6 +78,8 @@ struct msm_gpu_funcs {
>  	struct msm_gem_address_space *(*create_private_address_space)
>  		(struct msm_gpu *gpu);
>  	uint32_t (*get_rptr)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
> +
> +	bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
>  };
>  
>  /* Additional state for iommu faults: */
> @@ -236,7 +238,8 @@ struct msm_gpu {
>  	 */
>  #define DRM_MSM_INACTIVE_PERIOD   66 /* in ms (roughly four frames) */
>  
> -#define DRM_MSM_HANGCHECK_DEFAULT_PERIOD 500 /* in ms */
> +#define DRM_MSM_HANGCHECK_DEFAULT_PERIOD 250 /* in ms */
> +#define DRM_MSM_HANGCHECK_PROGRESS_RETRIES 3
