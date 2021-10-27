Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2126543D1BD
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 21:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC040890A6;
	Wed, 27 Oct 2021 19:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B0C890A6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 19:32:37 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id l13so8427948lfg.6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 12:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OTBdPJFa+ah3P9FuQhKUL9RznqjaKHz1+CuZIYV3wsc=;
 b=agih9qYZmYcntiWOtjjpqFInO/NVgVrWGE905q2yfSEyyV2BoggudSRC0uWF+1avff
 7h8uADNMgxE72KU5FMyuapAtk8t88XRt2jfl54CZfqYvfnhCV75du+zNwvIkpk3yCgVL
 5o9kX2dk8r96+D9juLvJdGhh7jbf4BxzAJXKAEQRsRoc3C6FmbCmEAsyjnlucSt2pWtU
 83u5VeuC3bsmPi7byNO1u5d3lYPRedAvTMiCRtXBDeyQCqpUwvSHd2PVm0VgcshYs06T
 bsc+rK79JJB2gmNcE8cTUf426Ht1SndEa2i1Np6mV8Ss5aEDyzIPzgP6y8adlqO2cjBC
 Qp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OTBdPJFa+ah3P9FuQhKUL9RznqjaKHz1+CuZIYV3wsc=;
 b=hQxMYxOtaJ0dfJbAZUMoROr7cLGXGzN+ZhgVEQGTw1upnYI37Vls4iWCwA0GRAso/G
 Zkfjqn7pDzsE5bPsHGCWpa0LG9+fYy4Xd8lJBn0GlAtETwy42WiyySauiFlkgVlVC0KD
 Oiw2baaZGbZ/RT74ykLEtWGIMbEcFCPqNV2tGbTPzcodQUXbEhsyTrrYXSjvelubzuxN
 btZNctgW2sUY5btuLVt8+m0VXYXOK5iDviRwnNex7OPfhNB0p1pZzu76ASfyOA1V1JUb
 eJw/bP7V8NO5G4g8nH0fKTcIgh5BTwyBM1UVmHRJouenoxx3AvaG/Yqv+kHELBVVjhdo
 Jf/w==
X-Gm-Message-State: AOAM530JW2piJQPKL+tJ9viAWSjgeeMTyfzYzuTGZO+yw2cfYmOUC1sv
 E5TR046oK2dr+Q0eUuBwetI=
X-Google-Smtp-Source: ABdhPJyaiRz/Ui6iA1xiTx91a3t+RwtvYGxJT3StDDfm32LrCKRStVdKsTDTbJW/siFtx98e9FjJ2w==
X-Received: by 2002:a05:6512:1510:: with SMTP id
 bq16mr31326351lfb.268.1635363156058; 
 Wed, 27 Oct 2021 12:32:36 -0700 (PDT)
Received: from [192.168.2.145] (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.googlemail.com with ESMTPSA id t3sm81030lfc.216.2021.10.27.12.32.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 12:32:35 -0700 (PDT)
Subject: Re: [PATCH v14 01/39] soc/tegra: Enable runtime PM during OPP
 state-syncing
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
 <20211025224032.21012-2-digetx@gmail.com>
 <CAPDyKFr7VY73cQugSA5n-p_oXf43o1M-7s3-M+fnk0656h25UA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8076eee8-ac8b-90a7-b87a-35e40d7300fb@gmail.com>
Date: Wed, 27 Oct 2021 22:32:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFr7VY73cQugSA5n-p_oXf43o1M-7s3-M+fnk0656h25UA@mail.gmail.com>
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

27.10.2021 18:06, Ulf Hansson пишет:
> On Tue, 26 Oct 2021 at 00:45, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> GENPD core now can set up domain's performance state properly while device
>> is RPM-suspended. Runtime PM of a device must be enabled during setup
>> because GENPD checks whether device is suspended and check doesn't work
>> while RPM is disabled. Instead of replicating the boilerplate RPM-enable
>> code around OPP helper for each driver, let's make OPP helper to take care
>> of enabling it.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 
> Just a minor nitpick, see below. Nevertheless feel free to add:
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> 
> Kind regards
> Uffe
> 
>> ---
>>  drivers/soc/tegra/common.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
>> index cd33e99249c3..d930a2b4facc 100644
>> --- a/drivers/soc/tegra/common.c
>> +++ b/drivers/soc/tegra/common.c
>> @@ -10,6 +10,7 @@
>>  #include <linux/export.h>
>>  #include <linux/of.h>
>>  #include <linux/pm_opp.h>
>> +#include <linux/pm_runtime.h>
>>
>>  #include <soc/tegra/common.h>
>>  #include <soc/tegra/fuse.h>
>> @@ -43,6 +44,7 @@ static int tegra_core_dev_init_opp_state(struct device *dev)
>>  {
>>         unsigned long rate;
>>         struct clk *clk;
>> +       bool rpm_enabled;
>>         int err;
>>
>>         clk = devm_clk_get(dev, NULL);
>> @@ -57,8 +59,22 @@ static int tegra_core_dev_init_opp_state(struct device *dev)
>>                 return -EINVAL;
>>         }
>>
>> +       /*
>> +        * Runtime PM of the device must be enabled in order to set up
>> +        * GENPD's performance properly because GENPD core checks whether
>> +        * device is suspended and this check doesn't work while RPM is
>> +        * disabled.
>> +        */
>> +       rpm_enabled = pm_runtime_enabled(dev);
>> +       if (!rpm_enabled)
>> +               pm_runtime_enable(dev);
> 
> This makes sure the OPP vote below gets cached in genpd for the
> device. Instead, the vote is done the next time the device gets
> runtime resumed.

Thanks, I'll extend the code's comment with this text in v15.

I also noticed that won't hurt to add extra sanity check of whether RPM
indeed got enabled since it could be disabled multiple times in a
nesting fashion.

> I don't have an issue doing it like this, but at the same time it does
> remove some flexibility for the drivers/subsystem that calls
> tegra_core_dev_init_opp_state().
> 
> Isn't it better to leave this to be flexible - or you prefer to have
> it done like this for everybody?

All the current users of the helper function want this behaviour by
default. It's unlikely that we will ever have a user that will want
different bahaviour, but even then it won't be a problem to add extra
flag to struct tegra_core_opp_params to specify that special case.
