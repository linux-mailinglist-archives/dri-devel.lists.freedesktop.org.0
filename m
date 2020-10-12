Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFC928BAF3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 16:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED406E49F;
	Mon, 12 Oct 2020 14:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227D26E49C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 14:35:59 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f21so17344634wml.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 07:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=CS4OyMq4fS0Bhwsobzu7guLhX4olV/G/ClLkhuhMjgI=;
 b=fkxMwduPy7Mi/n+bV9EyV6Z1vJ1ek7B2dpi5Z+Cc1zoGQaPeAwtnD3hIUYpNwz8NNy
 grfTiephWpviO0XUTqemeoX5Fy0if/33WSQfHcs3Bnf5eC6FYLBpVWNoHVBL75gAP37l
 OLHc52gBx4Y8FnkvvzekCPn+IErOtdoHNRGKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=CS4OyMq4fS0Bhwsobzu7guLhX4olV/G/ClLkhuhMjgI=;
 b=Q0Vh1mutKghjEiepJ1YQg3B1wtOzup5rcHsbQlclcnOOz5uOJ3G+gloxi3EDW4K8FH
 lL5QMGuH7VZoYIVa3gV4+HMm1RZZLm+OIHxcgxPn+32n2SJ9ppaGGx6ikkD38au3mZCD
 HGP4BlC6jnXljbMx1velIFbjFYd5c+mYQUG91Y+RVHxSZmpYvNd6L7PuZg751OBzaREU
 6O0aOThaNXxdBKEmR6mehNsnoVYhPxKa9tfjG1A4PLDpenrozrTjvqaCGC3YMt5c/q+E
 FcIVD1QwM+lYk49e73CG0WWUfcSEo/dLsfPGzA+K75P3+G0H6YbBA4tCz1auMdYas90S
 q64w==
X-Gm-Message-State: AOAM532632UnXHkRAKRhYqkYYeQFoUvpuUpsrqV35V0PV8c/6wE037J8
 XRBwe1HAu+vCGcheOGz/lyswVQ==
X-Google-Smtp-Source: ABdhPJxGVuL+rWFfcFuPZBFAL6pDzTxq2Ad70ao8xyHZW6uniXqiGrdMDz9Voec37zpOONepDpbVBQ==
X-Received: by 2002:a7b:c8c9:: with SMTP id f9mr2895067wml.162.1602513357830; 
 Mon, 12 Oct 2020 07:35:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 30sm15869709wrs.84.2020.10.12.07.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 07:35:56 -0700 (PDT)
Date: Mon, 12 Oct 2020 16:35:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 07/22] drm/msm: Do rpm get sooner in the submit path
Message-ID: <20201012143555.GA438822@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20201012020958.229288-1-robdclark@gmail.com>
 <20201012020958.229288-8-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012020958.229288-8-robdclark@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 11, 2020 at 07:09:34PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Unfortunately, due to an dev_pm_opp locking interaction with
> mm->mmap_sem, we need to do pm get before aquiring obj locks,
> otherwise we can have anger lockdep with the chain:

tbh this sounds like a bug in that subsystem, since it means we cannot use
said subsystem in mmap handlers either.

So if you have some remapping unit or need to wake up your gpu to blt the
buffer into system memory first, we're toast. That doesn't sound right. So
maybe Cc: pm folks and figure out how to fix this long term properly? Imo
not a good reason to hold up this patch set, since unwrangling mmap_sem
tends to be work ...
-Daniel

> 
>   opp_table_lock --> &mm->mmap_sem --> reservation_ww_class_mutex
> 
> For an explicit fencing userspace, the impact should be minimal
> as we do all the fence waits before this point.  It could result
> in some needless resumes in error cases, etc.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 002130d826aa..a9422d043bfe 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -744,11 +744,20 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>  
>  	ret = submit_lookup_objects(submit, args, file);
>  	if (ret)
> -		goto out;
> +		goto out_pre_pm;
>  
>  	ret = submit_lookup_cmds(submit, args, file);
>  	if (ret)
> -		goto out;
> +		goto out_pre_pm;
> +
> +	/*
> +	 * Thanks to dev_pm_opp opp_table_lock interactions with mm->mmap_sem
> +	 * in the resume path, we need to to rpm get before we lock objs.
> +	 * Which unfortunately might involve powering up the GPU sooner than
> +	 * is necessary.  But at least in the explicit fencing case, we will
> +	 * have already done all the fence waiting.
> +	 */
> +	pm_runtime_get_sync(&gpu->pdev->dev);
>  
>  	/* copy_*_user while holding a ww ticket upsets lockdep */
>  	ww_acquire_init(&submit->ticket, &reservation_ww_class);
> @@ -825,6 +834,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>  
>  
>  out:
> +	pm_runtime_put(&gpu->pdev->dev);
> +out_pre_pm:
>  	submit_cleanup(submit);
>  	if (has_ww_ticket)
>  		ww_acquire_fini(&submit->ticket);
> -- 
> 2.26.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
