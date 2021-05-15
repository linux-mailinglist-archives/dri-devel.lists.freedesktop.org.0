Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4BF381A40
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 19:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F466E0AC;
	Sat, 15 May 2021 17:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDC26E0AC
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 17:45:18 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id 131so2256900ljj.3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 10:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Uew60+G+SsxW8j8MijONIawIC+5YuiNS9/uDWrf3cP4=;
 b=q7uMGfIu5kGZ+6hGNujZ64ZmMGy4RAikXSf8gFyIKdRbA71krFjYMlArGdyx2gq9Vq
 d9WOncS48vT9ws4TVxrvOPftv0vDMA0vs1BNZuOx0H1ORjEG171ueeUTtuYABCXCtDV8
 VU02/2EfHzaGqprgipQVXAGhRyhW15jGjR19GiwNRD813aX3pyJgYqC6LekkD/on9E3k
 VTNYeguiwopR8UazK/toaPKYuSp0akJesQd0poBUiPBsST6mjHa7hywxSBqTb7DyWN1n
 J7fS/NOQsKnZ4+tBOHtHEefonMt015EkuoJrRFfV35eFvsEiMVk5/759MpZUEX/dRu79
 JrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Uew60+G+SsxW8j8MijONIawIC+5YuiNS9/uDWrf3cP4=;
 b=h05S5UjXDhB26dhWovlUZ0UQkdSd47RimZSzZWxxhAdExVbLuw6YaK1pm/XcrO03zC
 L114tDvzbu4vZydzeh1+0WfvWw0Q0l8Xs/eb2itf+iJlMedXeA6JuCgMkcECdNBZVpFh
 Or+9spLSXwsO8LqQND3Wgbdk8GyOUbPszvwrxcWvWJKPkxSmB60rK1yKV/DjYOY5EVeD
 qQH0Q0fqRcqDuZ5buRJ+R8mMwJNh6NAqLP8D6kz85ReiQ+tGusjJA6aCoeYY8QVE6mAh
 swzu4d9SLJ2OL9kdBy0x7vAG0acPsYjp8Yi5cV4yFNBLwAhb85bPc5OywvrKJ1iS222w
 4a6g==
X-Gm-Message-State: AOAM533eAIvvgAqMoijd2utjPzEywMIzwTGv4kl3dFEDyUldIGcK2KJl
 xCn7do83tc0REldmGon9giGtuQ==
X-Google-Smtp-Source: ABdhPJzZpYVpC+2X095uKXRc/Oo5tcpmRjH0WCm9hYwhP9EBhCF2KrssdyelK4eKiW3/vctO7ffvdA==
X-Received: by 2002:a2e:b807:: with SMTP id u7mr42869439ljo.67.1621100717420; 
 Sat, 15 May 2021 10:45:17 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h4sm1430170lfv.264.2021.05.15.10.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 10:45:16 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] drm/msm/dpu: Fix error return code in
 dpu_mdss_init()
To: Zhen Lei <thunder.leizhen@huawei.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20210510031606.3112-1-thunder.leizhen@huawei.com>
 <20210510031606.3112-2-thunder.leizhen@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <c19cb5e0-2ca3-0453-3c8f-e01f30748031@linaro.org>
Date: Sat, 15 May 2021 20:45:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210510031606.3112-2-thunder.leizhen@huawei.com>
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

On 10/05/2021 06:16, Zhen Lei wrote:
> The error code returned by platform_get_irq() is stored in 'irq', it's
> forgotten to be copied to 'ret' before being returned. As a result, the
> value 0 of 'ret' is returned incorrectly.
> 
> After the above fix is completed, initializing the local variable 'ret'
> to 0 is no longer needed, remove it.
> 
> In addition, when dpu_mdss_init() is successfully returned, the value of
> 'ret' is always 0. Therefore, replace "return ret" with "return 0" to make
> the code clearer.
> 
> Fixes: 070e64dc1bbc ("drm/msm/dpu: Convert to a chained irq chip")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> index 06b56fec04e047a..6b0a7bc87eb75b8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> @@ -225,7 +225,7 @@ int dpu_mdss_init(struct drm_device *dev)
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct dpu_mdss *dpu_mdss;
>   	struct dss_module_power *mp;
> -	int ret = 0;
> +	int ret;
>   	int irq;
>   
>   	dpu_mdss = devm_kzalloc(dev->dev, sizeof(*dpu_mdss), GFP_KERNEL);
> @@ -253,8 +253,10 @@ int dpu_mdss_init(struct drm_device *dev)
>   		goto irq_domain_error;
>   
>   	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0)
> +	if (irq < 0) {
> +		ret = irq;
>   		goto irq_error;
> +	}
>   
>   	irq_set_chained_handler_and_data(irq, dpu_mdss_irq,
>   					 dpu_mdss);
> @@ -263,7 +265,7 @@ int dpu_mdss_init(struct drm_device *dev)
>   
>   	pm_runtime_enable(dev->dev);
>   
> -	return ret;
> +	return 0;
>   
>   irq_error:
>   	_dpu_mdss_irq_domain_fini(dpu_mdss);
> 


-- 
With best wishes
Dmitry
