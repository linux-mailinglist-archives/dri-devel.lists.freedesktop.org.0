Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0808B6C350D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 16:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A2B10E240;
	Tue, 21 Mar 2023 15:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC6E10E1F5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 15:06:29 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id g18so15854212ljl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 08:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679411187;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FiHy9zm4LtANP3nP8u7ZmP1cRrMSZ1F7M7tdsLnmL5c=;
 b=WVxB8OnWOd82MsZge6qyZe78WYMa2VOUhdSVwMf3MO1ts2efmgCXrK7E+I183v5A2n
 wafE6+D1bTvLkU05rFTK8YrVEGqojO5lVkhDjzhuQoMa2yuJehT4diwB7sqHX97KFmK7
 Wy8n+S49oALnfBvUtGOjNpT4gzttfgzwZyimCUmun85ePPSwKwdXXSz2MqZjk3dTamwy
 Rb2d3JESU3vv2o9p/lMpvyVXGq6JCa3N6vdYnNjMVngtRu3NPx4rlEudBTU3CLp5S/IG
 4myTBrJo6qPEpVhoYmopspUmjFuBdAiCQWFUoEzzfuDE4hVuKaPlVh4krCKX9R/IRLTP
 y8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679411187;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FiHy9zm4LtANP3nP8u7ZmP1cRrMSZ1F7M7tdsLnmL5c=;
 b=OK515YtEVkYj1sv/0XsA8L4ynyPSdCF9Q5wu7kyE//aCNUZ1kHZi+DUqfpmOYN2PeK
 Tm2AuX6tBVQc5k3clhD0let/Jgc+W2Hx3x/FUJF01EvhXziE7TcWtJ2paBTKWyJIZfP4
 QF2/x0C2vIxZBto41dHHn9O/BirjTETQL6cX4UryXuOvqG+GPczzexiyWcOBaHyUtYjn
 ZMEA+PBqgGvEvTnxFZUo1hYaihyBIT8LdujDzS85nnfzehhG9C0PEtFvPcTnnkTMqrCY
 bsZb8njItfZ2Q+MuYLlk2yxJ3p6XATtosn8GU2tmi9PT7MAHz7MkknjaOijNbJzHcb1v
 BVRA==
X-Gm-Message-State: AO0yUKXC+L0j8Y0D4az50nreTzx9mAxw2+IsBI3nl52MyZKAevmsyjO0
 qWlEQBHydujYgDX7Qrci1Cf8ug==
X-Google-Smtp-Source: AK7set+e5ls0OWebGd/IN1tP2tPlzD51sw/ZlRWK0EpUUVd/5kDr0H3DXsUwYYPYx8qvcnam7pB+jw==
X-Received: by 2002:a05:651c:144:b0:298:acea:d261 with SMTP id
 c4-20020a05651c014400b00298acead261mr1128029ljd.21.1679411187677; 
 Tue, 21 Mar 2023 08:06:27 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a2e3216000000b0029e84187ce2sm725080ljy.139.2023.03.21.08.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 08:06:27 -0700 (PDT)
Message-ID: <c0ac71a0-4407-de19-ef7a-05004c3e0a2b@linaro.org>
Date: Tue, 21 Mar 2023 17:06:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 03/10] drm/msm: fix NULL-deref on snapshot tear down
Content-Language: en-GB
To: Johan Hovold <johan+linaro@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230306100722.28485-1-johan+linaro@kernel.org>
 <20230306100722.28485-4-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230306100722.28485-4-johan+linaro@kernel.org>
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/03/2023 12:07, Johan Hovold wrote:
> In case of early initialisation errors and on platforms that do not use
> the DPU controller, the deinitilisation code can be called with the kms
> pointer set to NULL.
> 
> Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
> Cc: stable@vger.kernel.org      # 5.14
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_drv.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 9ded384acba4..17a59d73fe01 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -242,7 +242,8 @@ static int msm_drm_uninit(struct device *dev)
>   		msm_fbdev_free(ddev);
>   #endif
>   
> -	msm_disp_snapshot_destroy(ddev);
> +	if (kms)
> +		msm_disp_snapshot_destroy(ddev);
>   
>   	drm_mode_config_cleanup(ddev);
>   

-- 
With best wishes
Dmitry

