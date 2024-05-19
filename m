Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4187C8C9411
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 10:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F117110E1E6;
	Sun, 19 May 2024 08:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="URBv7rQ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CD310E15A
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 08:39:45 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-523b20e2615so3990003e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 01:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716107983; x=1716712783; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wINRsVYOfc9e8SdgZRbrSE/ek9LX88q64lK0ONVJskM=;
 b=URBv7rQ0QCsowPRfq2bzNxNG9hGBJZYamLVL5EbyiEKQUA+BDHhyGpkq/rPfnVfj4S
 VohTDmWD7AX8NG2vwm5keh/Y64dFwUz/G3n9BSbuuJryWihGBzZmAUw+3th14mWfoClT
 M1HuOwWlzzXc/UjJNLmKB81tvCM/+Rwzc4AiOoYcYOf2FC/1eHkvHi9plEfH3ZgFalG0
 ZO72BytyFJrah+n2aYvV15nwVjwP0UpnM3mTwS1RKlsUlvZca2BbHnT1axcdMsIqVce7
 f346Dr4VAEgc+9XpqxqsKZWYoea5izAGcxfIyQdqESCqULdCn3E6v6IK1dWwbwgY9arY
 T9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716107983; x=1716712783;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wINRsVYOfc9e8SdgZRbrSE/ek9LX88q64lK0ONVJskM=;
 b=AOoWQfnme8c0A77aiyDC2A094iqM04EBCyE7a9KcXuSxUjC9I95z9hm4MQ5CamPpR/
 x6mtxoZsot2Gm8QCO/B6mrUpSXHUhW2BWXPOGPRAPiEyTRT43atKiSZ+ujlDA385NjPV
 aJda8qd4a1FMk3JzClxqQHU0D7cGu6WPuKdvUnrhYZUrGF1REGwXjh3301OxHig2x0Qy
 onIzAZ2UHStDvHXvw05SxjjStx1Ro8nHT1mOYIgAq9KnjyS1/lLM92YI4X8GU1Kj2hus
 4y4a6ZmFoiR6ZOS0eAjG/PPp59zD9C5Gwaws0vuX5b5moE2eIWWuPyR4YVufPV/zkiV6
 BqAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1+KGoxwlAWG3UWXRzPT0XY5BE+FvQcLjQoCNCb1c8mHufYkNz56zGZurzl/i2bm0TPgCqtAI0VeFrxE+uxvo0vsaPsTyCLMhsVyCWYG1f
X-Gm-Message-State: AOJu0YzJI3GrpMGBWAfQw2nRyVeapPMUKbt1IrroARGa7gHpB1eQrGCX
 Mvd+PuVIJ5vMJkLGsXeMlB7WIj6lsej/V+yvldgrDZR8lpuFJSsMIVDU9qdIN24=
X-Google-Smtp-Source: AGHT+IFI6PXjXa5dIVUKDoC56AXg8GLn15W3jSRDWvlVXmFTkJPr2Sj8InmpAqQX1jsCJ0QL5wMf+w==
X-Received: by 2002:ac2:520a:0:b0:51f:1e8e:f7d5 with SMTP id
 2adb3069b0e04-5220fc6d51bmr17374319e87.35.1716107983501; 
 Sun, 19 May 2024 01:39:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d8d70sm3840903e87.226.2024.05.19.01.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 01:39:43 -0700 (PDT)
Date: Sun, 19 May 2024 11:39:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 seanpaul@chromium.org, swboyd@chromium.org, dianders@chromium.org, 
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 4/4] drm/msm: switch msm_kms to use
 msm_iommu_disp_new()
Message-ID: <gfmxslhxpokhwsbnxucd4od2kdqldelrysl6gd2tmgb3dfx6bs@gku27mrctqfh>
References: <20240517233801.4071868-1-quic_abhinavk@quicinc.com>
 <20240517233801.4071868-5-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517233801.4071868-5-quic_abhinavk@quicinc.com>
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

On Fri, May 17, 2024 at 04:37:59PM -0700, Abhinav Kumar wrote:
> Switch msm_kms to use msm_iommu_disp_new() so that the newly
> registered fault handler will kick-in during any mmu faults.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> index 62c8e6163e81..1859efbbff1d 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -181,7 +181,7 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
>  	else
>  		iommu_dev = mdss_dev;
>  
> -	mmu = msm_iommu_new(iommu_dev, 0);
> +	mmu = msm_iommu_disp_new(iommu_dev, 0);
>  	if (IS_ERR(mmu))
>  		return ERR_CAST(mmu);

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Note to myself: make mdp4 use msm_kms_init_aspace().

-- 
With best wishes
Dmitry
