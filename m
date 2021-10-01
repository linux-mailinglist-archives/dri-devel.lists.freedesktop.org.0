Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0FC41F7A5
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 00:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9512F6E5BD;
	Fri,  1 Oct 2021 22:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3395C6E59D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 22:45:55 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id b20so44495235lfv.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 15:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j+kPWhijK9ZE/26VUbCAEecJmq5SRMajLA/PCOWEcsE=;
 b=Bg5MG4XDDPuBh92Vk/tlS5dIVM7MtzTS0Ismt29VYAaBr+IFpXSm932DPSRRnvfdIt
 Nyx8Q2fiuKp+UI5YyOuqAJRvFg+LDUK3bdBvAvkIWD2o7XkIhzNaPHCWnsfmmP87Xxtm
 a/phJ1mWw8iRyPbyoBUiCPfQ2pIDi8SkbLnZaLQZt3cZ0ea0mqo0hl0IrxoDSQbiQPzm
 g9mPn14LMLU2RArV3CvPlxS87UJOsRw0gYaCMa2ZjaLzRYF/mCbLAb2qZ8jLpUjdaavC
 /W4OgTJEwQuWJD26fnYirpU4xszFu67Sbkzn1fB13ED04WQ5cQE9QDE5JltP23dS5SM5
 hatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j+kPWhijK9ZE/26VUbCAEecJmq5SRMajLA/PCOWEcsE=;
 b=bf1GgLMF7BCeT/sR+qGeygdOy0+5AKU3zuwFgyBTZ73nsUBgCSlKqc+JEctHjSYVgX
 MaMn94/BBdq1G5gM5uEsc+IP7pFfk0JmUxectQXCge61Cc/OBVHFpHi9RV3DM7UvQnb7
 mfnFxjYG+l/QGk8onoXoodVnnuxueJH+qHPHmNjpXnyTXNcKLbHgTv20a+sJ8bUiwjVa
 jHfSRehTFS2Bni13sdjo1iKoSBpw6e9Qm+dUt3bp3o1LjQ1FPAxdtmv24NMSX7Kzd9ys
 /ejAKqhoNFBgAnjI8hCfcf41QbHcCVwKgHCmXAtAEPHCsgesqR94b2f3rVuft5M0LptW
 zkJg==
X-Gm-Message-State: AOAM531Ck1rnkf66fgkOycDWdr1kptcjco3SzFHeM44BQeokkaoEufZm
 lxYwrJ8rxvYM5G0L38NmDMOK0A==
X-Google-Smtp-Source: ABdhPJzCU0y+2PqtP5/oarv1W4DPLeJhO+Y0HVBwtEqk8HTHDm58RH+SjkVFlxeTeBxkQqkbaYRGRA==
X-Received: by 2002:a05:6512:3d91:: with SMTP id
 k17mr585010lfv.430.1633128353444; 
 Fri, 01 Oct 2021 15:45:53 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u28sm868966lfo.47.2021.10.01.15.45.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 15:45:52 -0700 (PDT)
Subject: Re: [PATCH 1/3] drm/msm/dsi: Fix an error code in
 msm_dsi_modeset_init()
To: Dan Carpenter <dan.carpenter@oracle.com>, Rob Clark
 <robdclark@gmail.com>, Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Archit Taneja <architt@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org
References: <20211001123308.GF2283@kili>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <b5016410-4e26-cbc5-0794-db9482aa3a71@linaro.org>
Date: Sat, 2 Oct 2021 01:45:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001123308.GF2283@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/10/2021 15:33, Dan Carpenter wrote:
> Return an error code if msm_dsi_manager_validate_current_config().
> Don't return success.
> 
> Fixes: 8b03ad30e314 ("drm/msm/dsi: Use one connector for dual DSI mode")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>   drivers/gpu/drm/msm/dsi/dsi.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 614dc7f26f2c..75ae3008b68f 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -215,8 +215,10 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>   		goto fail;
>   	}
>   
> -	if (!msm_dsi_manager_validate_current_config(msm_dsi->id))
> +	if (!msm_dsi_manager_validate_current_config(msm_dsi->id)) {
> +		ret = -EINVAL;
>   		goto fail;
> +	}
>   
>   	msm_dsi->encoder = encoder;
>   
> 


-- 
With best wishes
Dmitry
