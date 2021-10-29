Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFE443FF5C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 17:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270CB6E12C;
	Fri, 29 Oct 2021 15:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969656E12C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 15:20:52 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id y26so21655639lfa.11
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 08:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lKRvF3HEzsPjmvnhdSOneYxn8GKeq2VyROYToBcwKqg=;
 b=NOKTBqx0zL9etgzmHgf1oJxxEva2iGeeOh+4E1i+Uoun1qXSNBFS1lNQC88fmc/XOx
 EyAsxSZly1bRq3TmlsSW08aYbK/JB9WKiZjvvAc6IRSVBHFLgaxq5WghrNgqH9N06Cgk
 rVszgStQ8TpOhlNS+BEfMv2qPVDnZzTEXL2vamo6PvIjGTbjHy4zAlniV7LCLM4z8qJ+
 3d31fE3KYfU1VMXEHzZS2oldd3BUoObYtPfHaEBGLFbTrlAVq3+HlsjsOz7ean0hjU7/
 HGTTI/1EcTjErLyfGPhmM82MicBuWD5C+m3+1geOb7uZN0RBh1lgz8H3yqSys+vx0w95
 nBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lKRvF3HEzsPjmvnhdSOneYxn8GKeq2VyROYToBcwKqg=;
 b=OXDlWNSk5yaL462Jmx6WyBSbTN0t+IsgOnhESoJTALFCXx60MujnanvKcKzTqtaodl
 rZcCSKN+4Izun2mOfFhaQXyqB1QvjKUIcLFuqwKjoX1BHryxJqSUl59sf0QTujXT0g4Y
 jv8KAYWvPdVyrtC3Jk5udU7ZV26XjBwG0jiruREE9arkG0X1ol/+Hi23b1hkZcotx035
 0Z7Uo+9/Kqg2bqCU9IdKV8SE1Iz0u+GQyzqeOBeY0JVGXONs506aR0Wwn7dgULnLYOmm
 DZBUqp9CmD6pUQL2oepJ2fDRBYAeWNM+qKWF5jufigbzk6+o+wX2EZvp8AzpFXyJlrQN
 8MVQ==
X-Gm-Message-State: AOAM532WUnFW9CrtZ4aQD9cIwQIec4uw+T+DgDRWZaJN5CwvraUdhhYN
 GpLw0fXbROVRBam13OgE1go=
X-Google-Smtp-Source: ABdhPJxvYqPO801LDBYB4F60HZArGOgVHSUSi60pYfKAJNyhUGpwrMQ1Y80dwIJ4c7MkaVL/b474ZQ==
X-Received: by 2002:a05:6512:228d:: with SMTP id
 f13mr3384237lfu.491.1635520850816; 
 Fri, 29 Oct 2021 08:20:50 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id e5sm28298lfs.52.2021.10.29.08.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 08:20:50 -0700 (PDT)
Subject: Re: [PATCH v14 20/39] pwm: tegra: Add runtime PM and OPP support
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20211025224032.21012-1-digetx@gmail.com>
 <20211025224032.21012-21-digetx@gmail.com>
Message-ID: <09c05206-c0e5-9a25-8ffa-b9291f6ea5ae@gmail.com>
Date: Fri, 29 Oct 2021 18:20:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211025224032.21012-21-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

26.10.2021 01:40, Dmitry Osipenko пишет:
> +	ret = devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
>  	/* Set maximum frequency of the IP */
> -	ret = clk_set_rate(pwm->clk, pwm->soc->max_frequency);
> +	ret = dev_pm_opp_set_rate(pwm->dev, pwm->soc->max_frequency);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "Failed to set max frequency: %d\n", ret);
> -		return ret;
> +		goto put_pm;
>  	}
>  
>  	/*
> @@ -278,7 +294,7 @@ static int tegra_pwm_probe(struct platform_device *pdev)
>  	if (IS_ERR(pwm->rst)) {
>  		ret = PTR_ERR(pwm->rst);
>  		dev_err(&pdev->dev, "Reset control is not found: %d\n", ret);
> -		return ret;
> +		goto put_pm;
>  	}
>  
>  	reset_control_deassert(pwm->rst);
> @@ -291,10 +307,15 @@ static int tegra_pwm_probe(struct platform_device *pdev)
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "pwmchip_add() failed: %d\n", ret);
>  		reset_control_assert(pwm->rst);
> -		return ret;
> +		goto put_pm;
>  	}
>  
> +	pm_runtime_put(&pdev->dev);
> +
>  	return 0;
> +put_pm:
> +	pm_runtime_put_sync_suspend(&pdev->dev);
> +	return ret;
>  }
>  
>  static int tegra_pwm_remove(struct platform_device *pdev)
> @@ -305,20 +326,44 @@ static int tegra_pwm_remove(struct platform_device *pdev)
>  
>  	reset_control_assert(pc->rst);
>  
> +	pm_runtime_force_suspend(&pdev->dev);

I just noticed that RPM core doesn't reset RPM-enable count of a device
on driver's unbind (pm_runtime_reinit). It was a bad idea to use
devm_pm_runtime_enable() + pm_runtime_force_suspend() here, since RPM is
disabled twice on driver's removal, and thus, RPM will never be enabled
again.

I'll fix it for PWM and other drivers in this series, in v15.
