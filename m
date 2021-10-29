Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BC1440050
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 18:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07EE6E167;
	Fri, 29 Oct 2021 16:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C6A6E167
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 16:28:18 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bu18so4916703lfb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 09:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zb37U00i0UsxFiui6h8A52VDFSlAKY4vOYHPxpea81c=;
 b=TsfcoTQsth3GMbA87xy3JOsrwOf9WUKLzUc1wq2aKb8nm+h1lWm9UwjtFcoTaGbvKe
 sQ98YEE3QTH3m8zyDHhKCFjRS2hXMx5wd8getGuez1vRzftxlQjogBvlwfvmpymu6W7T
 ySq7aJHbfubll8P5mvCIAJdENcRSriG+nWUKGt8YXm41HMxIL0jeguvwUK7okHibeY+c
 0K6K3NNXM6vt4yGO7r8IfmgknSut+OZ/JVcueYwKiXs2/OlLlWtYgatm0NmVojWdmF+O
 pSRIxigawMyoXfrvt4/Wr7uKB1Lo6pJbK/PxNamCiFzGsZ7HRRdZQvolu6lW6C5IYH0R
 hbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zb37U00i0UsxFiui6h8A52VDFSlAKY4vOYHPxpea81c=;
 b=wnljhlcWIA6jj86U3siVHIub0g5ivug1QYAEU5qJUxrizBLe/PqIU2BA9Bd1zTN0aA
 EH0CYsEke7K9OMWwXOVZFSux6iP4X/UvjSu1xBIDsftelOJpxuumWxgWkDDRC86xP4wl
 TnGu+GSbrfsON5zPbmgYcsLwFSj/joRPMe4E0qOtn1a894rXoZghihvWcuWCDNxDCRvD
 5TCk/KB8o+kZYMRqJuZHCAGN5z1qfWn8N/jhat3AmbfgRdKh3a34eblsbHiw8DrDhX2L
 cjYx+vX0YigHi27jYHr+bSiLyekmC8JJ55Ca3rhJxhU+Rzqd5yaVrXZUPaoXOUHn1z6/
 zhlA==
X-Gm-Message-State: AOAM5307HYgjd8lOPjD04Coub8+/bcEgulT3ttIPEHf2DpH0ACDFdDTK
 RChXcQiQ/9BahZS9gmvpanc=
X-Google-Smtp-Source: ABdhPJxqvCXUpic4tjN7rVlUMkTQZOd/62uMiYgoMdbQ434pB4vyHg9RWPIeJ8n3oYvJT9rPA0Mo5w==
X-Received: by 2002:a05:6512:230b:: with SMTP id
 o11mr12461455lfu.490.1635524896479; 
 Fri, 29 Oct 2021 09:28:16 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id m4sm644841lfu.107.2021.10.29.09.28.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 09:28:16 -0700 (PDT)
Subject: Re: [PATCH v14 20/39] pwm: tegra: Add runtime PM and OPP support
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mmc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 David Heidelberg <david@ixit.cz>
References: <20211025224032.21012-1-digetx@gmail.com>
 <20211025224032.21012-21-digetx@gmail.com>
 <09c05206-c0e5-9a25-8ffa-b9291f6ea5ae@gmail.com>
 <CAPDyKFoa5eQTrNxyiFevUCWitUecX=hi=y7qv1dC2mqk0+0XBA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a1b9d966-5eb1-da02-5e77-6fe008e0c8a2@gmail.com>
Date: Fri, 29 Oct 2021 19:28:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFoa5eQTrNxyiFevUCWitUecX=hi=y7qv1dC2mqk0+0XBA@mail.gmail.com>
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

29.10.2021 18:28, Ulf Hansson пишет:
> On Fri, 29 Oct 2021 at 17:20, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 26.10.2021 01:40, Dmitry Osipenko пишет:
>>> +     ret = devm_pm_runtime_enable(&pdev->dev);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     ret = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     ret = pm_runtime_resume_and_get(&pdev->dev);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>>       /* Set maximum frequency of the IP */
>>> -     ret = clk_set_rate(pwm->clk, pwm->soc->max_frequency);
>>> +     ret = dev_pm_opp_set_rate(pwm->dev, pwm->soc->max_frequency);
>>>       if (ret < 0) {
>>>               dev_err(&pdev->dev, "Failed to set max frequency: %d\n", ret);
>>> -             return ret;
>>> +             goto put_pm;
>>>       }
>>>
>>>       /*
>>> @@ -278,7 +294,7 @@ static int tegra_pwm_probe(struct platform_device *pdev)
>>>       if (IS_ERR(pwm->rst)) {
>>>               ret = PTR_ERR(pwm->rst);
>>>               dev_err(&pdev->dev, "Reset control is not found: %d\n", ret);
>>> -             return ret;
>>> +             goto put_pm;
>>>       }
>>>
>>>       reset_control_deassert(pwm->rst);
>>> @@ -291,10 +307,15 @@ static int tegra_pwm_probe(struct platform_device *pdev)
>>>       if (ret < 0) {
>>>               dev_err(&pdev->dev, "pwmchip_add() failed: %d\n", ret);
>>>               reset_control_assert(pwm->rst);
>>> -             return ret;
>>> +             goto put_pm;
>>>       }
>>>
>>> +     pm_runtime_put(&pdev->dev);
>>> +
>>>       return 0;
>>> +put_pm:
>>> +     pm_runtime_put_sync_suspend(&pdev->dev);
>>> +     return ret;
>>>  }
>>>
>>>  static int tegra_pwm_remove(struct platform_device *pdev)
>>> @@ -305,20 +326,44 @@ static int tegra_pwm_remove(struct platform_device *pdev)
>>>
>>>       reset_control_assert(pc->rst);
>>>
>>> +     pm_runtime_force_suspend(&pdev->dev);
>>
>> I just noticed that RPM core doesn't reset RPM-enable count of a device
>> on driver's unbind (pm_runtime_reinit). It was a bad idea to use
>> devm_pm_runtime_enable() + pm_runtime_force_suspend() here, since RPM is
>> disabled twice on driver's removal, and thus, RPM will never be enabled
>> again.
>>
>> I'll fix it for PWM and other drivers in this series, in v15.
> 
> Good catch - and sorry for not spotting it while reviewing!
> 
> Maybe devm_pm_runtime_enable() isn't that useful after all? Should we
> suggest to remove it so others don't fall into the same trap?

devm_pm_runtime_enable() was added to the recent v5.15 kernel. It's a
useful helper, if it's used consciously. I'm not going to remove its
usage entirely from this series, for example it still should be good to
use for Tegra FUSE and HDMI drivers.
