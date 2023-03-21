Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B86FC6C34D2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 15:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B149010E23F;
	Tue, 21 Mar 2023 14:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6C710E211
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 14:54:54 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id y15so19460425lfa.7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 07:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679410493;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ogeDtQxSnugT0CZDT5b7rsm/nGwv+3iZej0+faCrhgc=;
 b=qndJwjvRKfP1GJepXrzReRb1vab2cTNz5YnEt1TC/Tg/PbnpqZhsfvbJxvG5wCgMrx
 RkEwJnIiciSh3KcgX4mufCfsUkCH+ARU/fPnn/4xb3orIZDKj7srsep5BooM+vTMvxqp
 K5AgKQYcpRMJOuARYHeX1fPBLIJi3jmD1XT3V0bIMzrlSEvQNn9npdSfz8ZCQh2+dEDT
 8zsJBxxhQjOIUpNsA6HMNUrLAfAVRFNr1hucfEaxnOWD/CbMzmolY46VK1rsMV+Lvv6V
 RN4iy1+9oJBgv+Dn2Gtf1XKMB/RNwEG4FmNwbLW4QBLTkUIo2zXl8mz9x+eHps1cI0+m
 fyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679410493;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ogeDtQxSnugT0CZDT5b7rsm/nGwv+3iZej0+faCrhgc=;
 b=nr+y5aVGE9eMUFBUZALp1aEuWPQYYjs4tiRTnVkn75YJ4eV3mhAw+Nw8lw3v2Z2tYV
 7CLDWRt9HKkuZelHmIyQoKjCEPbMWPNb5+jV2x00hJjR36hBe03PDqYhcgX/H4iFSO5k
 JNG/JFtePrsKCrIxmSkiOtgkoOTUCr5/W4YqmZn9SCZrLS46HDmELSjA6RD18o8kUs8D
 f1c4wjI+zXgITj+kIixxvQutvyaLc0zf5OIq9VMMzPk+Ph02Zy1CHHOwitWg3A3pXAQp
 BcHDfM1X6GyZOw8Q5Qq7dnumnFqX0EgNzy5p3pVdybMaMFdpBXAUcPSP62vGw/zy+gQt
 gixw==
X-Gm-Message-State: AO0yUKV/mfcCVDXRgoBn8yAbItfH+89/COb6o2k+tG0fc0r+VYg7m++k
 452gzuYs25hTBWSBmGD6jUQf7w==
X-Google-Smtp-Source: AK7set+/WVYm+A8eXtH36OMEaLnPPDDi8Ho/QLT8GgYmP7FzUIPufQLjoc+9Pj51zOpwDSMZl/HLCg==
X-Received: by 2002:ac2:5f16:0:b0:4dd:a4e1:4869 with SMTP id
 22-20020ac25f16000000b004dda4e14869mr928315lfq.43.1679410492792; 
 Tue, 21 Mar 2023 07:54:52 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a19f513000000b004e84b79de9bsm2205925lfb.254.2023.03.21.07.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 07:54:52 -0700 (PDT)
Message-ID: <90264695-131e-46b7-46db-822b0aee9801@linaro.org>
Date: Tue, 21 Mar 2023 16:54:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 05/10] drm/msm: fix drm device leak on bind errors
Content-Language: en-GB
To: Johan Hovold <johan+linaro@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230306100722.28485-1-johan+linaro@kernel.org>
 <20230306100722.28485-6-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230306100722.28485-6-johan+linaro@kernel.org>
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
> Make sure to free the DRM device also in case of early errors during
> bind().
> 
> Fixes: 2027e5b3413d ("drm/msm: Initialize MDSS irq domain at probe time")
> Cc: stable@vger.kernel.org      # 5.17
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Can we migrate to devm_drm_dev_alloc instead() ? Will it make code 
simpler and/or easier to handle?

> ---
>   drivers/gpu/drm/msm/msm_drv.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 2f2bcdb671d2..89634159ad75 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -444,12 +444,12 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   
>   	ret = msm_init_vram(ddev);
>   	if (ret)
> -		return ret;
> +		goto err_put_dev;
>   
>   	/* Bind all our sub-components: */
>   	ret = component_bind_all(dev, ddev);
>   	if (ret)
> -		return ret;
> +		goto err_put_dev;
>   
>   	dma_set_max_seg_size(dev, UINT_MAX);
>   
> @@ -544,6 +544,12 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   
>   err_msm_uninit:
>   	msm_drm_uninit(dev);
> +
> +	return ret;
> +
> +err_put_dev:
> +	drm_dev_put(ddev);
> +
>   	return ret;
>   }
>   

-- 
With best wishes
Dmitry

