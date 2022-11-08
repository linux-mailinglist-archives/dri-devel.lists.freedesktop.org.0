Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 193016218E1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 16:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598DE10E292;
	Tue,  8 Nov 2022 15:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D691710E4AB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 15:56:55 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id v27so23172235eda.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 07:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dSoGsNNzwJCDbWzxRNBKjkhjgMTimL8twfEGhMdFli8=;
 b=Hd5dzIwqWy+aEd7oSwfljuxw0DtlNyX8BDpEiNGBL0+JenoJpAZZbmZAnvtEx4e+H0
 RtKDPUjKnkBFRnsC89h6K0Ko3DkDGrGAnSyWD9JIsdiG/5jYXquR94xk8rB3J0EUalTo
 Lm9XojIMHeRbC8Ff8RnuqG8YF8huwWlqTV7Aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dSoGsNNzwJCDbWzxRNBKjkhjgMTimL8twfEGhMdFli8=;
 b=rykL2lD+7NcqMJ/VcGUZzH3z/h7T+cyuwdNVm6+nVEJKI9Sr4/PrVApiuDYYtBjimT
 g7ydQAFec/nALqEkaKN901ADUQaqUdG9tBuDX527/vyM9QLYDQOJMMIUhXXFDc9MDywO
 BkxWkCFz6nCY5urOTq6WHksqwEbIhPBz1EgeS088Ai/sDngqD/6NIQx0gCf5ebBQKWzF
 aipx8lo/9hHg4Rw9KeFwoM7rjK+Cjfo0Om/z7AxWIc0SUMcqLI5bhd+Fm5WUYr3OO0ip
 k62ib297NZ36fSrV/zE5vcOXknApbp6159ZqBkd2IZSqtpeOCv6JtfND17LU8HEFDwkV
 jGYg==
X-Gm-Message-State: ACrzQf1fRLVDqmaE4CaiG49f6FWtkCz63ckPJwDAhRbYdpbsA7Mymll6
 A67+GQAlzCS/O6sjcvAZAE1uEg==
X-Google-Smtp-Source: AMsMyM4MjkhpuEnAbkQowdMbQZ9VTCKiUzTKDueLsa8+Gya1tpvEj70/wj3qF9DActgf3HlMlCHS6A==
X-Received: by 2002:aa7:c54b:0:b0:463:e966:d30c with SMTP id
 s11-20020aa7c54b000000b00463e966d30cmr37282931edr.222.1667923014412; 
 Tue, 08 Nov 2022 07:56:54 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 m19-20020aa7c493000000b00458dc7e8ecasm5720737edq.72.2022.11.08.07.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 07:56:53 -0800 (PST)
Date: Tue, 8 Nov 2022 16:56:51 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH 1/2] drm/v3d: switch to drmm_mutex_init
Message-ID: <Y2p8QzOMH/nm4IM3@phenom.ffwll.local>
Mail-Followup-To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@gmail.com>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 "Juan A . Suarez" <jasuarez@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221107224656.278135-1-mcanal@igalia.com>
 <20221107224656.278135-2-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221107224656.278135-2-mcanal@igalia.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Emma Anholt <emma@anholt.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 "Juan A . Suarez" <jasuarez@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 07:46:55PM -0300, Maíra Canal wrote:
> mutex_init() is supposed to be balanced by a call to mutex_destroy(), but
> this is not currently happening on the v3d driver.
> 
> Considering the introduction of a DRM-managed mutex_init variant, switch
> to drmm_mutex_init.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/v3d/v3d_gem.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index b8980440d137..96af1cb5202a 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -10,6 +10,7 @@
>  #include <linux/sched/signal.h>
>  #include <linux/uaccess.h>
>  
> +#include <drm/drm_managed.h>
>  #include <drm/drm_syncobj.h>
>  #include <uapi/drm/v3d_drm.h>
>  
> @@ -1075,10 +1076,18 @@ v3d_gem_init(struct drm_device *dev)
>  
>  	spin_lock_init(&v3d->mm_lock);
>  	spin_lock_init(&v3d->job_lock);
> -	mutex_init(&v3d->bo_lock);
> -	mutex_init(&v3d->reset_lock);
> -	mutex_init(&v3d->sched_lock);
> -	mutex_init(&v3d->cache_clean_lock);
> +	ret = drmm_mutex_init(dev, &v3d->bo_lock);
> +	if (ret)
> +		return ret;
> +	ret = drmm_mutex_init(dev, &v3d->reset_lock);
> +	if (ret)
> +		return ret;
> +	ret = drmm_mutex_init(dev, &v3d->sched_lock);
> +	if (ret)
> +		return ret;
> +	ret = drmm_mutex_init(dev, &v3d->cache_clean_lock);
> +	if (ret)
> +		return ret;
>  
>  	/* Note: We don't allocate address 0.  Various bits of HW
>  	 * treat 0 as special, such as the occlusion query counters
> -- 
> 2.38.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
