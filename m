Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C9341FDEB
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 21:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D796E030;
	Sat,  2 Oct 2021 19:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2526E030
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 19:48:47 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id y26so53248156lfa.11
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 12:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3iD8ut9T1OePPVNgxRODW+TG74L9ph+sNjofBkFX9mg=;
 b=wG2lRoHDQCTj6Halp/cZ2LtDN2u5uTWjX8eziYcpJA9DdBOXDvnWbMnA5ShXMxQ2kH
 dowbU15I0QIc8vNDqpWEAgJqHONlHsmFFidkGSOF4Q/PXteyOh9DnQk39fMIOvMyDluc
 +um3v4Xcar05hv8fPklhZ62KtTvW/mGWTqY5uBCFXBAENZlpxtFT4n+ck9n/UljVX8yp
 +CqUbWxJxMhXeolXBMhRcDtzm1Bt6mDO9Tt8g8H8gDfnSZhG453yumALo7yPZ9Z+/9M2
 EdtewggioCxQ1pgdEWvlOZzbPTYitIt3aTR+iEStuhnmm6EhGighfFiwxbz9vjZ5rHGN
 UdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3iD8ut9T1OePPVNgxRODW+TG74L9ph+sNjofBkFX9mg=;
 b=ijBO9wXtWX3aIC77UDWGrgwT2lwrpKLdqIPOdKTtDneqwvCaMLGKQBB17URMvq1aiw
 nuVFWDk04nap9nktnkuIrvehrULIDF0Adsg0j+cFHeNU5GSASZSWIQhQrvrlmO2x4LV5
 jxG92cRHa2A0BEBgHOoBOMDG1yVy/Zz7xKC3uw+D5/6J5nziWrGRuBbA5vpqDd4h7F4r
 dAjwHdfLp/FYqBiUhoKmsw7cqCphKzkUBr0/nmpzekvRousXNIf1uljs8jDwcrwwU7r4
 VinoGgXwN8X9/UrqSBx0steqBH5qd7Xaqlz+oRce7Lr7RX2NnPH5eFUSQwhBZpX2BE8b
 XzmA==
X-Gm-Message-State: AOAM530jsbAPNPy7Eo7YCWpJh+TdVGITOhvhWUKrJh99tZyIqxkEHijt
 KGVojemtW+NMp3Dt0GMzk/pvXQ==
X-Google-Smtp-Source: ABdhPJy0g6pZkiwHE0oFUqRTjGu57K8i4MMyLOxOgQQmBEd1NUDk2GlFyW5BjqmnEINAiGmmJijFnQ==
X-Received: by 2002:a2e:80d6:: with SMTP id r22mr5393812ljg.127.1633204126011; 
 Sat, 02 Oct 2021 12:48:46 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id r23sm491197lfe.268.2021.10.02.12.48.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 12:48:45 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/mdp5: Remove redundant null check before
 clk_prepare_enable/clk_disable_unprepare
To: Xu Wang <vulab@iscas.ac.cn>, robdclark@gmail.com, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, jcrouse@codeaurora.org,
 tzimmermann@suse.de, abhinavk@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20201231094935.25737-1-vulab@iscas.ac.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <b8e7ca23-b8aa-18ef-c4a9-2fcaec0f52f6@linaro.org>
Date: Sat, 2 Oct 2021 22:48:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20201231094935.25737-1-vulab@iscas.ac.cn>
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

On 31/12/2020 12:49, Xu Wang wrote:
> Because clk_prepare_enable() and clk_disable_unprepare() already checked
> NULL clock parameter, so the additional checks are unnecessary, just
> remove them.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 18 ++++++------------
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c | 12 ++++--------
>   2 files changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 15aed45022bc..8d373d2ffd51 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -303,15 +303,12 @@ static int mdp5_disable(struct mdp5_kms *mdp5_kms)
>   	mdp5_kms->enable_count--;
>   	WARN_ON(mdp5_kms->enable_count < 0);
>   
> -	if (mdp5_kms->tbu_rt_clk)
> -		clk_disable_unprepare(mdp5_kms->tbu_rt_clk);
> -	if (mdp5_kms->tbu_clk)
> -		clk_disable_unprepare(mdp5_kms->tbu_clk);
> +	clk_disable_unprepare(mdp5_kms->tbu_rt_clk);
> +	clk_disable_unprepare(mdp5_kms->tbu_clk);
>   	clk_disable_unprepare(mdp5_kms->ahb_clk);
>   	clk_disable_unprepare(mdp5_kms->axi_clk);
>   	clk_disable_unprepare(mdp5_kms->core_clk);
> -	if (mdp5_kms->lut_clk)
> -		clk_disable_unprepare(mdp5_kms->lut_clk);
> +	clk_disable_unprepare(mdp5_kms->lut_clk);
>   
>   	return 0;
>   }
> @@ -325,12 +322,9 @@ static int mdp5_enable(struct mdp5_kms *mdp5_kms)
>   	clk_prepare_enable(mdp5_kms->ahb_clk);
>   	clk_prepare_enable(mdp5_kms->axi_clk);
>   	clk_prepare_enable(mdp5_kms->core_clk);
> -	if (mdp5_kms->lut_clk)
> -		clk_prepare_enable(mdp5_kms->lut_clk);
> -	if (mdp5_kms->tbu_clk)
> -		clk_prepare_enable(mdp5_kms->tbu_clk);
> -	if (mdp5_kms->tbu_rt_clk)
> -		clk_prepare_enable(mdp5_kms->tbu_rt_clk);
> +	clk_prepare_enable(mdp5_kms->lut_clk);
> +	clk_prepare_enable(mdp5_kms->tbu_clk);
> +	clk_prepare_enable(mdp5_kms->tbu_rt_clk);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
> index 09bd46ad820b..02c6c4b68c68 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
> @@ -137,10 +137,8 @@ static int mdp5_mdss_enable(struct msm_mdss *mdss)
>   	DBG("");
>   
>   	clk_prepare_enable(mdp5_mdss->ahb_clk);
> -	if (mdp5_mdss->axi_clk)
> -		clk_prepare_enable(mdp5_mdss->axi_clk);
> -	if (mdp5_mdss->vsync_clk)
> -		clk_prepare_enable(mdp5_mdss->vsync_clk);
> +	clk_prepare_enable(mdp5_mdss->axi_clk);
> +	clk_prepare_enable(mdp5_mdss->vsync_clk);
>   
>   	return 0;
>   }
> @@ -150,10 +148,8 @@ static int mdp5_mdss_disable(struct msm_mdss *mdss)
>   	struct mdp5_mdss *mdp5_mdss = to_mdp5_mdss(mdss);
>   	DBG("");
>   
> -	if (mdp5_mdss->vsync_clk)
> -		clk_disable_unprepare(mdp5_mdss->vsync_clk);
> -	if (mdp5_mdss->axi_clk)
> -		clk_disable_unprepare(mdp5_mdss->axi_clk);
> +	clk_disable_unprepare(mdp5_mdss->vsync_clk);
> +	clk_disable_unprepare(mdp5_mdss->axi_clk);
>   	clk_disable_unprepare(mdp5_mdss->ahb_clk);
>   
>   	return 0;
> 


-- 
With best wishes
Dmitry
