Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A4E60DE32
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 11:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157D110E4A3;
	Wed, 26 Oct 2022 09:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CFE10E4A7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 09:36:07 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id r18so14209345pgr.12
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 02:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=A9mSjdRb9KM4dYC9nqa6mNw2Qysra6o5S2BSbupDfSU=;
 b=lgGeskGbrG8neak0/Y8yJ0WctjcOjrXUgIyL81LVrtR7XQVIdxGyF7+fgpUxDWT04f
 PzAueKh+XaMUAxMFGDdRiOQB/xPcF4tNWQ34ZR/YD2qVLHwP9pCDTmuJ+vX/wkfN5FMv
 a3a0Aq6hDZ3oVkHhk/N8Mumdvp2DqAYy/6f1LHqghRBpURqL3kmFZKpbuVGyzw3ERXGG
 cmzj+5aXtCqIw9uJ9J6ZwGmR499OABiEeHBFETpI+cjdnSvrgMAj2/tlCMO1dPpUbfyt
 q+XZmI+VobE+6TnPMl4CmYe2L/PE0WUCSlv31OBlO8bZi/KiWXluTviIn+eyQ1ugLFRn
 8wYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A9mSjdRb9KM4dYC9nqa6mNw2Qysra6o5S2BSbupDfSU=;
 b=R+9lCxDA9RRJDCaAYtPMplJ4XxM+yGXCCN/NfM2IrkIBMrN3nqnF8zxWPtKf3GZO5T
 MCG7q9tEDI6kvKC7VlfoIszIQH3y4Zf5kWwu+zJWBgbHN15jYzdb0B0/BZhlwFQ9xdqI
 L3IgIugl5u5Gn4UWf/2AXbMEUkWMakRRHPL13dJorU6FEr9ThD5844r9nQwsx3WyiZaC
 75IbY7t5frcQT6RUT9WIvmmWrqkDfdkxn5kboFSMXhq0nqwRLx0vwfR/BA1CIZjVeYst
 Qh11xNQxyeLOByYAHmYTRhpfDB/5kxHlxmmovjjkuKd+R65K8/0o1kTze30pFzc8FjF2
 uMLA==
X-Gm-Message-State: ACrzQf2Ng1Rs7KnR14c6vywbIcmOE9T1qeALMwel5YMzdKUqEGiIc4cx
 +UqJAlVrkT/b8ib5t9ocxqB6Gg==
X-Google-Smtp-Source: AMsMyM6LdL6b5vGvszw5b9WpCHKp6mKcUTgbL+6jq+23PKynOXObS5JWUrmfpyfbH0Potsx5n/ILiA==
X-Received: by 2002:a63:6942:0:b0:41c:9261:54fd with SMTP id
 e63-20020a636942000000b0041c926154fdmr37618341pgc.34.1666776966919; 
 Wed, 26 Oct 2022 02:36:06 -0700 (PDT)
Received: from localhost ([122.172.87.26]) by smtp.gmail.com with ESMTPSA id
 d7-20020a17090a498700b0021134a19ae2sm807871pjh.50.2022.10.26.02.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 02:36:06 -0700 (PDT)
Date: Wed, 26 Oct 2022 15:06:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Erico Nunes <nunes.erico@gmail.com>
Subject: Re: [PATCH] drm/lima: Fix dev_pm_opp_set_config in case of missing
 regulator
Message-ID: <20221026093604.nuielehywjtxe2mn@vireshk-i7>
References: <20221026083950.3712598-1-nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026083950.3712598-1-nunes.erico@gmail.com>
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
Cc: lima@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26-10-22, 10:39, Erico Nunes wrote:
> Commit d8c32d3971e4 ("drm/lima: Migrate to dev_pm_opp_set_config()")
> introduced a regression as it may undo the clk_names setting in case
> the optional regulator is missing. This resulted in test and performance
> regressions with lima.
> 
> Restore the old behavior where clk_names is set separately so it is not
> undone in case of a missing optional regulator.
> 
> Fixes: d8c32d3971e4 ("drm/lima: Migrate to dev_pm_opp_set_config()")
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  drivers/gpu/drm/lima/lima_devfreq.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
> index 011be7ff51e1..9c8654934fea 100644
> --- a/drivers/gpu/drm/lima/lima_devfreq.c
> +++ b/drivers/gpu/drm/lima/lima_devfreq.c
> @@ -113,10 +113,12 @@ int lima_devfreq_init(struct lima_device *ldev)
>  	int ret;
>  	const char *regulator_names[] = { "mali", NULL };
>  	const char *clk_names[] = { "core", NULL };
> -	struct dev_pm_opp_config config = {
> -		.regulator_names = regulator_names,
> +	struct dev_pm_opp_config config_clk_names = {
>  		.clk_names = clk_names,
>  	};
> +	struct dev_pm_opp_config config_regulator_names = {
> +		.regulator_names = regulator_names,
> +	};
>  
>  	if (!device_property_present(dev, "operating-points-v2"))
>  		/* Optional, continue without devfreq */
> @@ -124,7 +126,15 @@ int lima_devfreq_init(struct lima_device *ldev)
>  
>  	spin_lock_init(&ldevfreq->lock);
>  
> -	ret = devm_pm_opp_set_config(dev, &config);
> +	/*
> +	 * Set clk_names separately so it is not undone in case of
> +	 * a missing optional regulator.
> +	 */
> +	ret = devm_pm_opp_set_config(dev, &config_clk_names);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_pm_opp_set_config(dev, &config_regulator_names);

You can directly call devm_pm_opp_set_clkname() and
devm_pm_opp_set_regulators(), like it was done before my patch, for
single configurations. So basically a simple revert of my commit, with
additional comments you added above.

>  	if (ret) {
>  		/* Continue if the optional regulator is missing */
>  		if (ret != -ENODEV)
> -- 
> 2.37.3

-- 
viresh
