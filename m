Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA9A421A51
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 00:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167CE6E247;
	Mon,  4 Oct 2021 22:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FC26E245
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 22:52:31 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id j5so73061299lfg.8
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 15:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pDk/FVPOlxwV0pour3j7eAFM0fv3H6VSdZ22j28Ul7U=;
 b=LIv4rNlTW8FZGeFN9OkcGsftb922JtWUGHeoNCbgBi6EOkzrphtlaL86X0Hx7bs80t
 p7VXvOlZVNc7F5AQNYcglEw20Ah86By1tMy+7LoL0pQ7DRafzu+tN99UGZ2PlKx0IOIK
 aPWXsf7+wTAFck25sXUSAL58cQVuU6rzuOc9KXLu/HwXWpthKx9f8pyq9GQ6PMwqhDRr
 UjsFpM7bZYRaH/8eKjibPnwG+lfKVEgnAl1nxyUoN6IqWK5Ml/aRS7ZCq6rnVyXOnPTY
 cle+wYnhZFt7nWOkdiccozA7HSZ9Suk6A4+aEVP3fGjfMDOQevNReKtFdSy2h6CnMjNV
 xsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pDk/FVPOlxwV0pour3j7eAFM0fv3H6VSdZ22j28Ul7U=;
 b=KBvOw2F4oj+OFNvi0V5cMQzgI5rLzmlXaFg++FOkttwcqdEIZ8yVkZToRFZCmh0Qx+
 uPOsaTO7d6+dRenff7TfoLCji7Cm+0TWr7uHHaAKyr4s3eWiSOIze1XTD18UigDoGwIl
 mA9bU6idWpf0csQQaRieQ5haQltAQ7pCZNNyjtZPHpNowFMLaRf8+KUrdc3x8z60MkkE
 T8hiUmrt9kdPd292otwnudK+W1nDSzfu0w1r8pVpGomvk83LT6Ouwc0utz6vxYlDDHlC
 rIk2/eDE9VCElEE4cEgh1xMnUGb0AOnZPEBj/abEG/XAwyav5tamB/RoS1HJHS4H/snt
 RyhA==
X-Gm-Message-State: AOAM530tbcHrLpczY7NR3N/i8GMif7+4gXuCM5saGPXuIJJkGUmHMW1t
 A3eopxLtDr5ZICs7un7bn220Xw==
X-Google-Smtp-Source: ABdhPJwHXTIoF58UEmE9I595+cUvc0Pa9iUt0YlUP6A5/oqTKG230Mc7tliM7eddZqoG3qUtMqgpUw==
X-Received: by 2002:a05:651c:10a6:: with SMTP id
 k6mr7148355ljn.325.1633387949735; 
 Mon, 04 Oct 2021 15:52:29 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s29sm1886275ljd.54.2021.10.04.15.52.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 15:52:29 -0700 (PDT)
Subject: Re: [PATCH v3 11/14] drm/msm/dp: Re-order dp_audio_put in
 deinit_sub_modules
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc: swboyd@chromium.org, jani.nikula@linux.intel.com,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
References: <20211001151145.55916-1-sean@poorly.run>
 <20211001151145.55916-12-sean@poorly.run>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <39d559a6-d656-7904-7f1c-ac891a386a7a@linaro.org>
Date: Tue, 5 Oct 2021 01:52:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001151145.55916-12-sean@poorly.run>
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

On 01/10/2021 18:11, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Audio is initialized last, it should be de-initialized first to match
> the order in dp_init_sub_modules().
> 
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-12-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-12-sean@poorly.run #v2

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Changes in v2:
> -None
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index fbe4c2cd52a3..19946024e235 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -714,9 +714,9 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>   static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
>   {
>   	dp_debug_put(dp->debug);
> +	dp_audio_put(dp->audio);
>   	dp_panel_put(dp->panel);
>   	dp_aux_put(dp->aux);
> -	dp_audio_put(dp->audio);
>   }
>   
>   static int dp_init_sub_modules(struct dp_display_private *dp)
> 


-- 
With best wishes
Dmitry
