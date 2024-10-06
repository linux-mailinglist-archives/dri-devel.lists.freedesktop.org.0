Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B7F991FEE
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 19:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C2810E04B;
	Sun,  6 Oct 2024 17:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="euvjhSlX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4733C10E05F
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 17:32:19 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53959a88668so4439822e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 10:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728235937; x=1728840737; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JkkTShwqvEkU2pXAQY0BAtAP+96Mr0a+LcjE8tjGdL0=;
 b=euvjhSlXd3IVmG63e8KtaG85ozT1BctPGNhBBOR543kdGL0FwEUO/W6i5pMvbfTvDJ
 TuQ49pQ6fUo7E76f0LRxyKb7O6wBsTGWtLiWi0dYBq3IquHl2RtrXraDrXL5yyJHTzHc
 h165godT0PPtxZS3q9dNi2DQzQK5BlCo0d4XGDHFHukg5Aiqu+mzWAPBiYLVldbybZdk
 NaDOP46I3fMgKt6oYpZQpQzyTNlxQKdMJR6LyNbuvCKJpxGeAJ6sj7EpZENcl7fxKQ5R
 tEQF6a+xF21djTkrWm3/R+TeH90jy7F0vNNwm0izjI1e11bpNQoMM7rSU0gwU8Vd02Cg
 LKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728235937; x=1728840737;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JkkTShwqvEkU2pXAQY0BAtAP+96Mr0a+LcjE8tjGdL0=;
 b=CRVq9FuRyfqJGlkYK34psIY4k5qH8CoSF+mZykyXDHI1qTMkAXCzFW8yw+gxyEmE1T
 8OlbKNz48zLC578E0txEDa0OTM0NCj0pVR/yB1pcjc02Tr5L8Fput2sqMGQmdI1uoS46
 b02N3YU505u/PF4BjXJFnLudzhSyWCw1Tw3AOBCYtSROaro23h8T9yGFfxm1ezHHC1mF
 qlSFLXXequHdUpwO+7/llyzTYn96F3ZLI4z3vWeP6DN8AYe7dqSQ7j9z9iIhdARlMbfA
 72mBYF6xPn0PWBLZD107u94bPCAiVo/U39StJmgvd2mxfuLXf0bDDEDs9jPtv8+xdwse
 qAZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3jdBzq2uyq8+OXoe0QyKEObIEdqFj/yXXQxPDiip6L12BCbdPgCK1eui6BTkisvPADMbcgla39b0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTyJantOj+f1PB4Vn3Rc9Zdr8+qgSE28W/uAkto0gupXzeS2cY
 KfeAYSM8HGdFWyFKqH6xu5i0HA4/rrJLHJj57+L9fI6TGL784bXrDzt9xodr2pk=
X-Google-Smtp-Source: AGHT+IGK8Akt1ah5HhrTyw13URk23TpEFUe03bKEw6dqgLZPPsHuJ6XyU8+xsn5SsbthvxzekZGOIA==
X-Received: by 2002:a05:6512:3c9f:b0:539:8f2d:a3bc with SMTP id
 2adb3069b0e04-539ab9ec4c3mr4196367e87.49.1728235936960; 
 Sun, 06 Oct 2024 10:32:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff2336fsm572403e87.203.2024.10.06.10.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2024 10:32:16 -0700 (PDT)
Date: Sun, 6 Oct 2024 20:32:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 "open list:DRM DRIVER for Qualcomm display hardware"
 <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER for Qualcomm display hardware"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/msm/dsi: improve/fix dsc pclk calculation
Message-ID: <hibhrxq42xoffxa57fckiwbvzjvyzxi4rrtokdpzu533ul3wnb@kas6rhji52mz>
References: <20241005143818.2036-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241005143818.2036-1-jonathan@marek.ca>
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

On Sat, Oct 05, 2024 at 10:38:09AM GMT, Jonathan Marek wrote:
> drm_mode_vrefresh() can introduce a large rounding error, avoid it.
> 

Fixes?

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 185d7de0bf376..1205aa398e445 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -542,7 +542,7 @@ static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mo
>  
>  	int new_htotal = mode->htotal - mode->hdisplay + new_hdisplay;
>  
> -	return new_htotal * mode->vtotal * drm_mode_vrefresh(mode);
> +	return mult_frac(mode->clock * 1000u, new_htotal, mode->htotal);
>  }
>  
>  static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
> -- 
> 2.45.1
> 

-- 
With best wishes
Dmitry
