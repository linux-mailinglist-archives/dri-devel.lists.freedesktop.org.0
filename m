Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A501421ABE
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 01:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2614B6EAB7;
	Mon,  4 Oct 2021 23:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F1E6EABB
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 23:35:49 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id n8so22688343lfk.6
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 16:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bAbUrq+YEGQ8QqX2x0huaegjL+DVKSS+ia5e1PaJxbQ=;
 b=g7W5OPmi1aIkzDo+3ETFXRiySovtja0OIr8nT1tL7ZjQT6aVgeLI26HzuGEdUdqcDy
 6qld8PFaqKQdAmJ679ADX84uIOf2HkayYVSsR41TsYUcnkwQJs3hgjnAqmCHkg4NXtgJ
 ihA7XLOzqxkEoucEGw/bX4GQ0ibaJbjBSFWJ0TOnW3t7+Mh3W/M6eZIFWgsOWEnLb+y3
 gn2UGWrwDGOxDvikkhXLLuxfX9y4fZaCiMt95rE6LpFVYSAmzogbHBYgtFdiT07JLTJ2
 thTmql+V3bde0RKqBUPKY1tBmkOnwRNATvsL+Twdpo2Z+70+DZKGhLaPD5TFnLbYeH0x
 jxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bAbUrq+YEGQ8QqX2x0huaegjL+DVKSS+ia5e1PaJxbQ=;
 b=EVDTDVhltVYx/bWF7SmofG3tg7oaIlCOAWfnRWdSvc3Nwmc7WJgfkKohE4jcd7JnxJ
 wfHBFMgeYtNUAPnTMZfbkgDWFqU5tuuu2245un4Ce4hDgZqXqS8KIMzKLwjEY2GgTkFn
 TuE9omFASXK1YaenGo7I2gxB1kXKjGqA4Ewicul2w5Cv1v4M+MOHcW/44qxs/afEx9LB
 Okzj3M+7/cPyinZB4gbYttFOWG9Vjo+hN0HqlBsCAB8H5i0qKxexIlGhl5/Or0sUHSHV
 m/KonaXxhOCXy0jlNO4paotx0iZu3FU6t4pMn24GZ7bKvaRhRvhiUhTm2psgp2GC8Syp
 jMeQ==
X-Gm-Message-State: AOAM533zP2M0WDCa7/REs2sWa2CJm8GxFI0L9xnCvzqEA+FMzZ2l5gVG
 dW2dZUUkANA0aq+m23Am7ECSLQ==
X-Google-Smtp-Source: ABdhPJxqEOfRrI4DMjINIanU3R0WVfP1o4DgyUrQI2RwWT4K/iTMKPHT32fSDRakRbU/hei4nH9Vbw==
X-Received: by 2002:a05:6512:33c2:: with SMTP id d2mr33196lfg.18.1633390547930; 
 Mon, 04 Oct 2021 16:35:47 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id g27sm276458lfh.162.2021.10.04.16.35.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 16:35:47 -0700 (PDT)
Subject: Re: [PATCH] drm/msm: potential error pointer dereference in init()
To: Dan Carpenter <dan.carpenter@oracle.com>, Rob Clark
 <robdclark@gmail.com>, Jordan Crouse <jordan@cosmicpenguin.net>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Xu Wang <vulab@iscas.ac.cn>,
 Jonathan Marek <jonathan@marek.ca>, Yangtao Li <tiny.windzz@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20211004103806.GD25015@kili>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <60e7beb3-e54b-6367-0989-e0f780a34b52@linaro.org>
Date: Tue, 5 Oct 2021 02:35:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211004103806.GD25015@kili>
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

On 04/10/2021 13:38, Dan Carpenter wrote:
> The msm_iommu_new() returns error pointers on failure so check for that
> to avoid an Oops.
> 
> Fixes: ccac7ce373c1 ("drm/msm: Refactor address space initialization")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ae48f41821cf..ad247c06e198 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -908,6 +908,10 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
>   		return 0;
>   
>   	mmu = msm_iommu_new(dpu_kms->dev->dev, domain);
> +	if (IS_ERR(mmu)) {
> +		iommu_domain_free(domain);
> +		return PTR_ERR(mmu);
> +	}
>   	aspace = msm_gem_address_space_create(mmu, "dpu1",
>   		0x1000, 0x100000000 - 0x1000);
>   
> 


-- 
With best wishes
Dmitry
