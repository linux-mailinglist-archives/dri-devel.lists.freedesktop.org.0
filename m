Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B512AEC63
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 09:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756F689FEA;
	Wed, 11 Nov 2020 08:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC0E89FEA
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 08:52:55 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id b9so1420513edu.10
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 00:52:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FR2fk7Xv4lSmlOc9Dd3jcBxGV7rUmCYq9p4pf48MgkE=;
 b=FSfVaENOMCZ+w2Il6IWljJFcW3vbOudehR/hnkQHEgR+JzEekFxCHPnfwqe5bYKRzV
 BQevNoGwYgHwPDR23nMN9sQIt0tIS9hZ7jVlORpmlzaypHtaf5yy2YwrGd20Xcms2F00
 Uvw5hRI64p9ETqIy4UMM7pjbXfVlTCY/+dDZXnvdGO8YlukMjrU3xV6TA1Mzgxw3NIB7
 wphEVWlmPyZef5sW3emu1zUNN6c65tggls9lTNFTCTxFjwp4wA9KiYFJsTkI1GouQiL2
 Wtoiwf98ClZL1WnaCHJgByu+wxP/txUzBz8AObaqUut69kDGTGg+qwX8nKgZ8e/UQj4p
 IXdg==
X-Gm-Message-State: AOAM530MevLczot4viASnGmEO3smpYubQ8U0GaMgfZB5sZuXv3B1JFE3
 +1FGzM0JEmvnGsWzUlavy4g=
X-Google-Smtp-Source: ABdhPJwji6ikeI/Mly+Q6njYPrhT9ggbKIXuArTDm7S8d2rj8FwDw4fd/HOZiSUe1NQbAdVvsnmJTA==
X-Received: by 2002:a05:6402:54c:: with SMTP id
 i12mr26442371edx.9.1605084774010; 
 Wed, 11 Nov 2020 00:52:54 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id f19sm596038edm.70.2020.11.11.00.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 00:52:52 -0800 (PST)
Date: Wed, 11 Nov 2020 09:52:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 10/26] memory: tegra30-emc: Factor out clk
 initialization
Message-ID: <20201111085250.GA11589@kozik-lap>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-11-digetx@gmail.com>
 <20201111085115.GA4050@kozik-lap>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111085115.GA4050@kozik-lap>
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 11, 2020 at 09:51:15AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Nov 11, 2020 at 04:14:40AM +0300, Dmitry Osipenko wrote:
> > Factor out clk initialization and make it resource-managed. This makes
> > easier to follow code and will help to make further changes cleaner.
> > 
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >  drivers/memory/tegra/tegra30-emc.c | 70 ++++++++++++++++++++----------
> >  1 file changed, 47 insertions(+), 23 deletions(-)
> > 
> > diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
> > index d27df842a667..1df42e212d73 100644
> > --- a/drivers/memory/tegra/tegra30-emc.c
> > +++ b/drivers/memory/tegra/tegra30-emc.c
> > @@ -1550,6 +1550,49 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
> >  	return err;
> >  }
> >  
> > +static void devm_tegra_emc_unset_callback(void *data)
> > +{
> > +	tegra20_clk_set_emc_round_callback(NULL, NULL);
> > +}
> > +
> > +static void devm_tegra_emc_unreg_clk_notifier(void *data)
> > +{
> > +	struct tegra_emc *emc = data;
> > +
> > +	clk_notifier_unregister(emc->clk, &emc->clk_nb);
> > +}
> > +
> > +static int tegra_emc_init_clk(struct tegra_emc *emc)
> > +{
> > +	int err;
> > +
> > +	tegra20_clk_set_emc_round_callback(emc_round_rate, emc);
> > +
> > +	err = devm_add_action_or_reset(emc->dev, devm_tegra_emc_unset_callback,
> > +				       NULL);
> > +	if (err)
> > +		return err;
> > +
> > +	emc->clk = devm_clk_get(emc->dev, NULL);
> > +	if (IS_ERR(emc->clk)) {
> > +		dev_err(emc->dev, "failed to get EMC clock: %pe\n", emc->clk);
> > +		return PTR_ERR(emc->clk);
> > +	}
> > +
> > +	err = clk_notifier_register(emc->clk, &emc->clk_nb);
> > +	if (err) {
> > +		dev_err(emc->dev, "failed to register clk notifier: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	err = devm_add_action_or_reset(emc->dev,
> > +				       devm_tegra_emc_unreg_clk_notifier, emc);
> > +	if (err)
> > +		return err;
> > +
> > +	return 0;
> > +}
> > +
> >  static int tegra_emc_probe(struct platform_device *pdev)
> >  {
> >  	struct device_node *np;
> > @@ -1599,25 +1642,13 @@ static int tegra_emc_probe(struct platform_device *pdev)
> >  		return err;
> >  	}
> >  
> > -	tegra20_clk_set_emc_round_callback(emc_round_rate, emc);
> > -
> > -	emc->clk = devm_clk_get(&pdev->dev, "emc");
> > -	if (IS_ERR(emc->clk)) {
> > -		err = PTR_ERR(emc->clk);
> > -		dev_err(&pdev->dev, "failed to get emc clock: %d\n", err);
> > -		goto unset_cb;
> > -	}
> > -
> > -	err = clk_notifier_register(emc->clk, &emc->clk_nb);
> > -	if (err) {
> > -		dev_err(&pdev->dev, "failed to register clk notifier: %d\n",
> > -			err);
> > -		goto unset_cb;
> > -	}
> > +	err = tegra_emc_init_clk(emc);
> > +	if (err)
> > +		return err;
> >  
> >  	err = tegra_emc_opp_table_init(emc);
> >  	if (err)
> > -		goto unreg_notifier;
> > +		return err;
> >  
> >  	platform_set_drvdata(pdev, emc);
> >  	tegra_emc_rate_requests_init(emc);
> > @@ -1632,13 +1663,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
> >  	try_module_get(THIS_MODULE);
> >  
> >  	return 0;
> > -
> > -unreg_notifier:
> > -	clk_notifier_unregister(emc->clk, &emc->clk_nb);
> 
> You added this code in patch #8, so adding-and-removing a piece of code

Correction: you added this in patch #9.

Best regards,
Krzysztof


> is a nice hint that this patch should be before. Don't add new code
> which later you simplify. Move all bugfixes and all simplifications to
> beginning of patchset.
> 
> That's quite similar case to v6 where you put bugfixes in the middle
> of patchset.
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
