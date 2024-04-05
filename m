Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C7E8993BF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 05:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9A51137FD;
	Fri,  5 Apr 2024 03:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KWddfEKX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A757E1137FC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 03:24:05 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-516d0161e13so1419396e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Apr 2024 20:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712287443; x=1712892243; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=djoX0jMYV8yyXli2/egywXNwRqExDcF+IAyDdSCliAI=;
 b=KWddfEKXhVR/Tq1L95in2fvK2cewe8rK+GYAmD0VBh7ii71knKkhAum83x4joUSVqI
 3F8WwmjBkov46Cs3t5+FtOwfPAzA2BHStqN4MddRBxC2m/7txtIzxD4c9cnsUFb4GrOB
 cKF45diD7bpOZMtDrE3L9D4ohsrI7p3A8xWP4A9pSsDX0w9b4TUgX33+gES/+RZNCqus
 uWYL0SbDbQ7C7EWoK2XF/oFx6Ro/TUHaTfZv11qbJ99TtryBdLzlTQFL1v1Hv4OdhFsi
 JXQ2btFKeLHPOQ+YSFgs+Y9pXpFwqIk6Z/pBTs6vOUHynYNJKBT+xTuNxb0s9Zki5GO1
 kVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712287443; x=1712892243;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=djoX0jMYV8yyXli2/egywXNwRqExDcF+IAyDdSCliAI=;
 b=NEFDK7SCFqkMBkjACLPFG6lBaeiropHVA3vOzQjIhu0/V12XE9I8HbqPojMFvU3WIB
 fgGlp3MtROC7/pHMSkhe9SlSBTvhLkEWQskQGpthXjU7A0OYdnM33EaZThTItBWG4feP
 DQtuzI5lBVobK3BZgJ+OY6vF3DAKM6zhPZSouMOMG/tPJbgfJwQG8/Ojp3DRuxPKlW1Q
 JKKZd3N6haFl/AH13aYLe/OxYDo6amzqnTel+uuN4sbE54uBKGSARbWk2OT42P4tiY3v
 0cXNjldAaF4HVKrs6s+ycWcmc9e/xezHDrbyjiWsgcMvv37FLMJhcGHW+h4EmID2xSHm
 SVAA==
X-Gm-Message-State: AOJu0Yxu6ZX7zLcETQnQs1faSmWhRSGILB55dPzeVTKpbgF068nFUzSe
 RBeLkLc8pDe28zXjmp8CGiy/6dsM+7Pn0jSUqR2X2VnMPNVi8iwCLpbikPTE7Ts=
X-Google-Smtp-Source: AGHT+IEIYG99dBzN4VueKpfW7+dyTWa53Fr9LTF5gytJHu7FYsHu+6uYU2u16oTmwD5X3RZ8TFDawQ==
X-Received: by 2002:a05:6512:3e17:b0:516:cc31:dbf0 with SMTP id
 i23-20020a0565123e1700b00516cc31dbf0mr191938lfv.17.1712287443372; 
 Thu, 04 Apr 2024 20:24:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 c5-20020ac24145000000b00516c8826719sm70778lfi.197.2024.04.04.20.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 20:24:02 -0700 (PDT)
Date: Fri, 5 Apr 2024 06:24:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 stable@vger.kernel.org
Subject: Re: [PATCH 01/12] drm/client: Fully protect modes[] with
 dev->mode_config.mutex
Message-ID: <jeg4se3nkphfpgovaidzu5bspjhyasafplmyktjo6pwzlvpj5s@cmjtomlj4had>
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
 <20240404203336.10454-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240404203336.10454-2-ville.syrjala@linux.intel.com>
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

On Thu, Apr 04, 2024 at 11:33:25PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> The modes[] array contains pointers to modes on the connectors'
> mode lists, which are protected by dev->mode_config.mutex.
> Thus we need to extend modes[] the same protection or by the
> time we use it the elements may already be pointing to
> freed/reused memory.
> 
> Cc: stable@vger.kernel.org
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10583
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I tried looking for the proper Fixes tag, but it looks like it might be
something like 386516744ba4 ("drm/fb: fix fbdev object model + cleanup properly.")


> ---
>  drivers/gpu/drm/drm_client_modeset.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index 871e4e2129d6..0683a129b362 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -777,6 +777,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>  	unsigned int total_modes_count = 0;
>  	struct drm_client_offset *offsets;
>  	unsigned int connector_count = 0;
> +	/* points to modes protected by mode_config.mutex */
>  	struct drm_display_mode **modes;
>  	struct drm_crtc **crtcs;
>  	int i, ret = 0;
> @@ -845,7 +846,6 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>  		drm_client_pick_crtcs(client, connectors, connector_count,
>  				      crtcs, modes, 0, width, height);
>  	}
> -	mutex_unlock(&dev->mode_config.mutex);
>  
>  	drm_client_modeset_release(client);
>  
> @@ -875,6 +875,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>  			modeset->y = offset->y;
>  		}
>  	}
> +	mutex_unlock(&dev->mode_config.mutex);
>  
>  	mutex_unlock(&client->modeset_mutex);
>  out:
> -- 
> 2.43.2
> 

-- 
With best wishes
Dmitry
