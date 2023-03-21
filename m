Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 750DC6C3568
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 16:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA0910E4E2;
	Tue, 21 Mar 2023 15:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E0A10E360
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 15:17:29 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id e21so3287404ljn.7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 08:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679411848;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0XuN8ioBm9gED1jU+nlNm3booZamb6HksWvoqUTWd1g=;
 b=c4gxjGtla+JNjRGkDzpJTdkTRVA6lR2ifbRYG3M4hp8vN8IZyjFHxibGGeo6/tMNmQ
 7bJE3Dm6yE7h4W24X+p6mcJWxxy1Im2NZQ+ishRd45Hl4HY2JeItLVYG0+pz+7RP4827
 XgbgVC0tOL9BnefuWstAyqHmy7RIvPcc0YZoagMEDVMqJKMFcKAA0kBfGKkJwm5tg+UJ
 nAkGoxn4kwhMAMc0LDE7AfoLnLVtBY4E5YikSRr9s3XkZ5OUckDzGdY5cpO5v3AMNYW6
 XATgQ3pMEGc+4Eg96s7hdQy7COOyRHK1+uMCx4+NN+Hv+6RLjMzZgJAhi8t3hefQhYPn
 ba0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679411848;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0XuN8ioBm9gED1jU+nlNm3booZamb6HksWvoqUTWd1g=;
 b=t7s/aBFqvqVR/KL/s7ajVfcDD89+NIajZcM+jV5zlgZZ0AS0jwpVLqsqWXdK9oTe5k
 u7Tq0F1NUTde1d3ZBExzxXwjO17CUltsjV2WaMDZHRX7kflotSviU3V9WYZmxFa7tNNQ
 RxD4LP2l+UtHlXR0KXYcsimwTxkY9bY4RDgXLypwB70AydelRdXhzajB4ZF8M9LXOzk+
 rm2Nv2Oedes8b9/aLEkbcKXb6vhgTa1UyZG02t2zJBJFeT6g7/e1ky6s2v5zFD8tdzlx
 u18RhCmNRY06J8IJkbYj+31VcaS/8FTr7i3Wit4lTm9ewfA9+eyslFQ1TJe2mAMqJvNE
 FbNA==
X-Gm-Message-State: AO0yUKWO3RT/FMjnv5FJumbCDX43+myvqQq2XdS5Wc8yhZkOLCbE7gtt
 Hz7JTroqNFthzCBjBmIHx0jKGQ==
X-Google-Smtp-Source: AK7set+wO4LorH7uYnHfYL0IdUkOOFwxIV3C4LbBFNE9iVka078oBidQSR39tP5A80cThqr2YQnN4Q==
X-Received: by 2002:a2e:7e0f:0:b0:295:9265:b36a with SMTP id
 z15-20020a2e7e0f000000b002959265b36amr960881ljc.12.1679411848056; 
 Tue, 21 Mar 2023 08:17:28 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 e21-20020a2e8ed5000000b002934ea0def9sm2222690ljl.140.2023.03.21.08.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 08:17:27 -0700 (PDT)
Message-ID: <3025b62f-fbaa-cda3-8ab4-73e86b942450@linaro.org>
Date: Tue, 21 Mar 2023 17:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 04/10] drm/msm: fix NULL-deref on irq uninstall
Content-Language: en-GB
To: Johan Hovold <johan+linaro@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230306100722.28485-1-johan+linaro@kernel.org>
 <20230306100722.28485-5-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230306100722.28485-5-johan+linaro@kernel.org>
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
Cc: Sean Paul <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/03/2023 12:07, Johan Hovold wrote:
> In case of early initialisation errors and on platforms that do not use
> the DPU controller, the deinitilisation code can be called with the kms
> pointer set to NULL.
> 
> Fixes: f026e431cf86 ("drm/msm: Convert to Linux IRQ interfaces")
> Cc: stable@vger.kernel.org	# 5.14
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_drv.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 17a59d73fe01..2f2bcdb671d2 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -251,9 +251,11 @@ static int msm_drm_uninit(struct device *dev)
>   		drm_bridge_remove(priv->bridges[i]);
>   	priv->num_bridges = 0;
>   
> -	pm_runtime_get_sync(dev);
> -	msm_irq_uninstall(ddev);
> -	pm_runtime_put_sync(dev);
> +	if (kms) {
> +		pm_runtime_get_sync(dev);
> +		msm_irq_uninstall(ddev);
> +		pm_runtime_put_sync(dev);
> +	}
>   
>   	if (kms && kms->funcs)
>   		kms->funcs->destroy(kms);

-- 
With best wishes
Dmitry

