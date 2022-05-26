Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 559D4535028
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 15:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E1C10E2C3;
	Thu, 26 May 2022 13:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 69D5A10E23F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 13:45:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D829A1688;
 Thu, 26 May 2022 06:45:57 -0700 (PDT)
Received: from [10.1.37.22] (e122027.cambridge.arm.com [10.1.37.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F10E3F73D;
 Thu, 26 May 2022 06:45:55 -0700 (PDT)
Message-ID: <a6172ae4-d15f-ce89-fac8-0fb3efc623ce@arm.com>
Date: Thu, 26 May 2022 14:45:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 15/31] drm/panfrost: Migrate to dev_pm_opp_set_config()
Content-Language: en-GB
To: Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <cover.1653564321.git.viresh.kumar@linaro.org>
 <2a0970a5cf1fc92e16eb2b782798a6b609594cdc.1653564321.git.viresh.kumar@linaro.org>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <2a0970a5cf1fc92e16eb2b782798a6b609594cdc.1653564321.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: Nishanth Menon <nm@ti.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Rafael Wysocki <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/05/2022 12:42, Viresh Kumar wrote:
> The OPP core now provides a unified API for setting all configuration
> types, i.e. dev_pm_opp_set_config().
> 
> Lets start using it.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Acked-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 194af7f607a6..7826d9366d35 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -91,6 +91,10 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>  	struct devfreq *devfreq;
>  	struct thermal_cooling_device *cooling;
>  	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
> +	struct dev_pm_opp_config config = {
> +		.regulator_names = pfdev->comp->supply_names,
> +		.regulator_count = pfdev->comp->num_supplies,
> +	};
>  
>  	if (pfdev->comp->num_supplies > 1) {
>  		/*
> @@ -101,13 +105,12 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>  		return 0;
>  	}
>  
> -	ret = devm_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
> -					 pfdev->comp->num_supplies);
> +	ret = devm_pm_opp_set_config(dev, &config);
>  	if (ret) {
>  		/* Continue if the optional regulator is missing */
>  		if (ret != -ENODEV) {
>  			if (ret != -EPROBE_DEFER)
> -				DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
> +				DRM_DEV_ERROR(dev, "Couldn't set OPP config\n");
>  			return ret;
>  		}
>  	}

