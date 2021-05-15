Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 945FC381A33
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 19:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB186E440;
	Sat, 15 May 2021 17:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D456E431
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 17:41:43 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id p12so2265260ljg.1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 10:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=b7eX77q8eKbpdnMvJxfoJvBkAq9vgiVC8Eptr8qHOxM=;
 b=IHGdBBzTmj0VpkUBKhTvgL7ff21LY6rZpUEOV3viZVLWRG8L747QMqM1X1LPtFkbZh
 EJvhV8MZPe7isHM0+kW+Yoey9ivxWHwnk/JMSgWgkVw4cnAZdYpRK5KzLhwTZuhyo+Nn
 Olms4DtUW52q+cHwHUSZSkId+NnfvpdrA65XHDr5qXEE/UaFnAkOwT+kESdSE8/g0WLY
 jJUmQ5VkyZDBeoAKNelXs1BQOA4sdFn9nTYGnkX+Aj8MAi1PsEVp6pJP5nxZebo+tx+r
 taRE2AgAWsf1M4OApV4dm7YYBO2l5DMWCyekP73xI7v9FWHCA8U/FajH4mLMYnI5VrVV
 Q6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b7eX77q8eKbpdnMvJxfoJvBkAq9vgiVC8Eptr8qHOxM=;
 b=DWecHxBx96l4AVUVCuG7ZJuSYCJnYb9VI3N+vVc9R5qO/cirwCtwbCyFEbrCIwC7lm
 abYgyes7xbnwKRO6FZ5UGsbMHu1h+zp/QsD08DZncUy5jAjmSKdc6MLevW7QpdHhA8lI
 VW5/XYVwykX58GgtBM0I7Yz3grAAU7uMl0FH2cW8pYfIowYKCXpfhbwK4/78KsAE91oT
 QR2nc2WbsjJa4Rl3ZTaS/b0TDZe6/G/p9DPOYccc9mvpfkx4swz/9PHI/BBoefCAA9My
 4Y1t42cZsc7tHaUjgF6D9AaVr1bJBf6lTeYleNJA0YVXMCA3BYMDiTZ+a9MGQLKT0w4X
 4/ew==
X-Gm-Message-State: AOAM533M4bafNC/tiGzVCIYDhxm9+cezaWF6vmY5AWcfh4ONl5j8DGEO
 nKC0hHa23SZcQk/TywwC3TJNzQ==
X-Google-Smtp-Source: ABdhPJywo+0YyXrXkHIsvx+8Y2y5PtGhqM4kuVUcPeW2DVE2rC9aZH144ekNIyXTmHQxnYIgvKLC3w==
X-Received: by 2002:a2e:9215:: with SMTP id k21mr42376171ljg.224.1621100502083; 
 Sat, 15 May 2021 10:41:42 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z20sm952196ljk.123.2021.05.15.10.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 10:41:41 -0700 (PDT)
Subject: Re: [PATCH 1/1] drm/msm: Fix error return code in msm_drm_init()
To: Zhen Lei <thunder.leizhen@huawei.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jeykumar Sankaran <jsanka@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20210508022836.1777-1-thunder.leizhen@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ad97839c-8849-d4d7-91ff-af2ac2453745@linaro.org>
Date: Sat, 15 May 2021 20:41:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210508022836.1777-1-thunder.leizhen@huawei.com>
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

On 08/05/2021 05:28, Zhen Lei wrote:
> Fix to return a negative error code from the error handling case instead
> of 0, as done elsewhere in this function.
> 
> Fixes: 7f9743abaa79 ("drm/msm: validate display and event threads")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_drv.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index e1104d2454e2..ebd856dde1f1 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -523,6 +523,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   		priv->event_thread[i].worker = kthread_create_worker(0,
>   			"crtc_event:%d", priv->event_thread[i].crtc_id);
>   		if (IS_ERR(priv->event_thread[i].worker)) {
> +			ret = PTR_ERR(priv->event_thread[i].worker);
>   			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
>   			goto err_msm_uninit;
>   		}
> 


-- 
With best wishes
Dmitry
