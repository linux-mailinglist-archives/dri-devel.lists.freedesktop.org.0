Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12104C0FB8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 11:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F98B10E9F6;
	Wed, 23 Feb 2022 10:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FC510E9F6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 10:00:16 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id bn33so23757238ljb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 02:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KjRNk806df2NZEel6HR0OBFdyY3J+pUWSPWymkVLPFs=;
 b=L/bY7Hd1l+NE0lFKNPvrvbtKA+XRH/B1g+zl0CBMHf/q7KNnSoiuYRVL+GdIdRu1IU
 jrVFSmUItFlCIugoop31cLAIbtcFbVdtB2BvYqtNBNr7apVUmRt9Cc37Htgd3rUuPH3B
 g4MQqif+5yZMCyEKGfvZe7wXepuSL+tw9pRz1zdE3p13WM9nef9ZGDsiHm+eA5KXGMFU
 sWQJ3/39FchyTtEDvkg1YqK0CDXAxVRIUBNZFZQb+78j35FjxGXDUpuDGKQj0rPwgqQD
 huufR2YpUHPecD21q9oD/HXSt0tVK6cfsMl0V/NbX75r7eDLf6Dmo3VQ4bFkydRu1cnw
 +bnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KjRNk806df2NZEel6HR0OBFdyY3J+pUWSPWymkVLPFs=;
 b=eMPwGNCpgHhDi2WztOpbf69ygycPnTkwVz9NrPRxYVDaMXRZlInuMNkNtPvPva6mLG
 JatX6FSY2Z2XJV+r47o64t4ZfmFSpmXRsvd78E2Quqx3P1Abzu3yz5gsRy3uN6pNxNk5
 aKID2U1qwf0mRGyT+CBSaiWGUvw2xW6/MgOfTx04Cw6nHnX666wJXFgfteHpfGi/4eou
 gK0OIAojy/lK3xMvr1G1RXpt3hG8HYWXjeLgWwy5lfKZo5OffP46c7mipRyrfPnJZKAO
 ph0LsXwbD7C4uiy0PW7PGksh26vRZ2+r6mX9z9YnJWieN3qTTA0azs9X9+N5QHFAfCyF
 LecA==
X-Gm-Message-State: AOAM530pnpV7YlVBBKtTtjhockrmqet8P6EdpCPfehEF5UKk/gH3jeBx
 T+yNTGy9azmn+QJgeJTmibtMsg==
X-Google-Smtp-Source: ABdhPJxxwkBk1LLX9rUTnnMEKW4AA0UWWQGeRBmkSIs6AjPNN93uUfCEPcR6QiXqHXV3t9MDtNakAQ==
X-Received: by 2002:a2e:9048:0:b0:246:1988:3105 with SMTP id
 n8-20020a2e9048000000b0024619883105mr19507617ljg.404.1645610414892; 
 Wed, 23 Feb 2022 02:00:14 -0800 (PST)
Received: from [192.168.43.7] ([94.25.228.217])
 by smtp.gmail.com with ESMTPSA id s5sm1618518lfr.55.2022.02.23.02.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 02:00:14 -0800 (PST)
Message-ID: <a065a843-e7c3-a75b-aa8e-d4b264146df0@linaro.org>
Date: Wed, 23 Feb 2022 13:00:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] drm/msm: Avoid dirtyfb stalls on video mode displays
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220219193957.577054-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220219193957.577054-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Heidelberg <david@ixit.cz>,
 Stephen Boyd <swboyd@chromium.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Xu Wang <vulab@iscas.ac.cn>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>, Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/02/2022 22:39, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Someone on IRC once asked an innocent enough sounding question:  Why
> with xf86-video-modesetting is es2gears limited at 120fps.
> 
> So I broke out the perfetto tracing mesa MR and took a look.  It turns
> out the problem was drm_atomic_helper_dirtyfb(), which would end up
> waiting for vblank.. es2gears would rapidly push two frames to Xorg,
> which would blit them to screen and in idle hook (I assume) call the
> DIRTYFB ioctl.  Which in turn would do an atomic update to flush the
> dirty rects, which would stall until the next vblank.  And then the
> whole process would repeat.
> 
> But this is a bit silly, we only need dirtyfb for command mode DSI
> panels.  So lets just skip it otherwise.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 13 +++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |  9 ++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  1 +
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |  9 ++++
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  |  1 +
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h  |  1 +
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c |  8 +++
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  |  1 +
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h  |  1 +
>   drivers/gpu/drm/msm/msm_fb.c              | 64 ++++++++++++++++++++++-
>   drivers/gpu/drm/msm/msm_kms.h             |  2 +
>   11 files changed, 109 insertions(+), 1 deletion(-)
> 

I have checked your previous dirtyfb patch (and corresponding discussion).

I'm not fond of the idea of acquiring locks, computing the value, then 
releasing the locks and reacquiring the locks again. I understand the 
original needs_dirtyfb approach was frowned upon. Do we have a chance of 
introducing drm_atomic_helper_dirtyfb_unlocked()? Which would perform 
all the steps of the orignal helper, but without locks acquirement (and 
state allocation/freeing)?

[skipped]

> diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
> index 4d34df5354e0..1b0648baeae2 100644
> --- a/drivers/gpu/drm/msm/msm_fb.c
> +++ b/drivers/gpu/drm/msm/msm_fb.c
> @@ -24,10 +24,72 @@ struct msm_framebuffer {
>   static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
>   		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos);
>   
> +static int msm_framebuffer_dirtyfb(struct drm_framebuffer *fb,
> +				   struct drm_file *file_priv, unsigned int flags,
> +				   unsigned int color, struct drm_clip_rect *clips,
> +				   unsigned int num_clips)
> +{
> +	struct msm_drm_private *priv = fb->dev->dev_private;
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_plane *plane;
> +	bool needs_flush = false;
> +	int ret = 0;
> +
> +	/*
> +	 * When called from ioctl, we are interruptible, but not when called
> +	 * internally (ie. defio worker)
> +	 */
> +	drm_modeset_acquire_init(&ctx,
> +		file_priv ? DRM_MODESET_ACQUIRE_INTERRUPTIBLE : 0);
> +
> +retry:
> +	drm_for_each_plane(plane, fb->dev) {
> +		struct drm_plane_state *plane_state;
> +		struct drm_crtc *crtc;
> +
> +		ret = drm_modeset_lock(&plane->mutex, &ctx);
> +		if (ret)
> +			goto out;
> +
> +		if (plane->state->fb != fb) {
> +			drm_modeset_unlock(&plane->mutex);
> +			continue;
> +		}
> +
> +		crtc = plane->state->crtc;
> +
> +		ret = drm_modeset_lock(&crtc->mutex, &ctx);
> +		if (ret)
> +			goto out;
> +
> +		if (priv->kms->funcs->needs_dirtyfb(crtc)) {
> +			needs_flush = true;
> +			break;
> +		}
> +	}
> +
> +out:
> +	if (ret == -EDEADLK) {
> +		ret = drm_modeset_backoff(&ctx);
> +		if (!ret)
> +			goto retry;
> +	}
> +
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +
> +	if (needs_flush) {

This bit triggers my paranoia. The driver computes the value with the 
locks being held and then performs some action depending on the computed 
value after releasing the locks.

I'd prefer to acquire modesetting locks for all the planes (and allocate 
atomic state), check if the dirtyfb processing is needed, then call 
drm_atomic_helper_dirtyfb_unlocked() withith the same locks section.

> +		ret = drm_atomic_helper_dirtyfb(fb, file_priv, flags,
> +						color, clips, num_clips);
> +	}
> +
> +	return ret;
> +}
> +
>   static const struct drm_framebuffer_funcs msm_framebuffer_funcs = {
>   	.create_handle = drm_gem_fb_create_handle,
>   	.destroy = drm_gem_fb_destroy,
> -	.dirty = drm_atomic_helper_dirtyfb,
> +	.dirty = msm_framebuffer_dirtyfb,
>   };
>   
>   #ifdef CONFIG_DEBUG_FS
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 2a4f0526cb98..eb870d499d1e 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -117,6 +117,8 @@ struct msm_kms_funcs {
>   			struct drm_encoder *encoder,
>   			struct drm_encoder *slave_encoder,
>   			bool is_cmd_mode);
> +	bool (*needs_dirtyfb)(struct drm_crtc *crtc);
> +
>   	/* cleanup: */
>   	void (*destroy)(struct msm_kms *kms);
>   


-- 
With best wishes
Dmitry
