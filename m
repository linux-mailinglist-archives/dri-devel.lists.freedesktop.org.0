Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A56B99877F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 15:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E1910E8F4;
	Thu, 10 Oct 2024 13:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jgX9LVBy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333A210E8F6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 13:21:22 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5389fbb28f3so874098e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 06:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728566480; x=1729171280; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XigYU3sB/s2Rw0iXGaJ9OicIPQ+b9qifNZZ8fxL3Ss0=;
 b=jgX9LVByMuqjRvlswIXmgSVNMqyLtI+i80+uSWgwgxcFpiSsv6CAdBvGpCUhJq5Bfi
 x0SXg2Loal6b4Z6R+LzoJu49DkMVa7ZyBFUIh20zSFvcGgOV4Lk5T596CYFf+bdI9nfX
 qu0ReBbZCezDdYC7TXUYANZTLx+fwfpK5bX2o2hrwqhd9sM61UB+lLbP5S/m0Lm7telP
 scICqkD4uPyediKkfnhtTAi1w0naxElZD7Dgvt/3bfIcHNOCDA7DkpSZ6AqC87/I6ei2
 0VbRjCle/clqxtb372y2Z+IwvfkJR61mJ9FXsTcOn9no9DLMw4EPcz0+BrQY5Ro11ETd
 y1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728566480; x=1729171280;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XigYU3sB/s2Rw0iXGaJ9OicIPQ+b9qifNZZ8fxL3Ss0=;
 b=IFdHhEEld2Lwjdo/apy3Of+r2S20k+mFLbdgAa6PH7t51nUDn1eMpsvf7yDgy5GVvi
 2pzyuXaKhFBu01FJ0ofgRbPzdUYrdlWDfhQ+W+LdqEV/p6X6F8CJWir6D6TWlMI/sQDh
 iEYgxmF13YH7hy7e8KLvJeDBzAM3gvxtFIVgKuEk+1fmwaSdG65L1zbrBN2sAkjDNg4F
 4SbBzhcherVhOMm0WJxSl8w0gAQyzLzMCnBQHrOWupHKFHW4nwI3++caKF+LPlWrhk2d
 hq/si5p3x4AsRmM3A9Xkt4JvJlFiLzAIcVEJg1kfAJba5HsaXi6LsjRa3u9Q249oYMAw
 Zgmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLFTGne94yVP7HmhdKby4v0UPrhWl1QZzQu8tSNVvB6qdrnbld9QO3aG5JT08hQFKyvdExmfJsuuY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpYnEfMvc/8XjWB2XYRUFXcwEgja7OMIUUJ//azqk2r+peNgew
 zuHiqhPQXPbnPcpoq22Wm5IntptsPdjihXbzsQOJM0LSI4xBan7oevxOP9hRLGI=
X-Google-Smtp-Source: AGHT+IF+YKWCkRaviw5WO8kAYdrmWTSD0wjNIqxxPvLjLHR42AM2SSftnbdZgot9P+As/E1/AS0loA==
X-Received: by 2002:a05:6512:2392:b0:535:6480:707d with SMTP id
 2adb3069b0e04-539c98ab991mr1255454e87.19.1728566480282; 
 Thu, 10 Oct 2024 06:21:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539cb6c11e4sm255304e87.10.2024.10.10.06.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 06:21:19 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:21:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/14] drm/msm/dpu: Share SSPP info for multi-rect case
Message-ID: <olzxobeurhyi76tdn7mq3wegxth4c7a2ys7dikajkx4d5y5z7i@3vkyjy3hg57s>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-11-76d4f5d413bf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-11-76d4f5d413bf@linaro.org>
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

On Wed, Oct 09, 2024 at 04:50:24PM GMT, Jun Nie wrote:
> Share SSPP info for multi-rect case if virtual plane is not enabled.
> Otherwise, the 2nd half of DMA content is not displayed due to sspp
> pointer of r_pipe is null.

Fixes?

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 904ebec1c8a18..898fc2937954e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1042,6 +1042,11 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>  		pipe->multirect_index = DPU_SSPP_RECT_0;
>  		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
>  
> +		/*
> +		 * Signifies that r_pipe is to be used if the width of the 2nd
> +		 * pipe is not 0. This does not apply to virtual plane case.
> +		 */
> +		r_pipe->sspp = pipe->sspp;
>  		r_pipe->multirect_index = DPU_SSPP_RECT_1;
>  		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
>  	}
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
