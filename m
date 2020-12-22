Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F174B2E0808
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 10:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D58B6E86D;
	Tue, 22 Dec 2020 09:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53606E19A
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 08:59:43 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id v1so980841pjr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 00:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RHvyko5iU5xg8Cz45AVBchwM4SDGk3Y/8Etp7zQo/0E=;
 b=LfPP06TVJTEK4xWL0o4Uusz6IXwXzk8z3S6CPrE/vyZ9qoOMFRUyzQJWUKQxWhuG/E
 wY5edJUerDgkww2zd4lzbce6lRCficFwzejWrQiDZi/xwHlgy96zpj6C8ioFq0ZrQXBk
 mSOkM2U+2pDJWLqA+j7R2srsKaCnOdyMwev89OKW8IKEfkAPs6AL+3xqznBpqvwnQ0NT
 fjm9Rb+Xfn10diw8TlqXQy8/GkenTeXEg9jbL1dOeVHP/+gjymWREs9O4mMhUSRkCgx+
 FWO4nhtVc54saAG5QAt6VsqTuAXLPGXWUixoDkMsUGzE1xB0aRN/Z6i4X+no1fBNw+u5
 gkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RHvyko5iU5xg8Cz45AVBchwM4SDGk3Y/8Etp7zQo/0E=;
 b=KBC0ZGyyvQ4rFE7QcTJ1UTEudJJlEI7yU58E40ss3oPa1000TuMW/d0ziT/xDsnILR
 hsmzF9/Egvx3NiYXCOX2c4ZBKB2Bvjvgg2CEzU66rpYzTnXUtxx4qdX603BVQaUe4+vl
 Ho6TRDDZUU7etuIEGhpfl4AJwR6TrS+UDn+uuzBb/lpJghUGINVnvYU5T6DiG3rW0Di+
 Sob8z8cTmSMsNfQvRAetEXCsDoMXb0biAoz5qy4v3y56IySlf5HH/tWG1B4kk7rXScbG
 XfgTV6u1LJuYrqqiLytwFAPK4RLbRF2nEJ9NnHbvjiCyFcFEFNUfktVfwYTCH5Z9fv8n
 Hh/Q==
X-Gm-Message-State: AOAM530Q5LivcBzIj2aPPj1k1kS/K4266Jw+OEDQ1V6JiTpe6Vl7Nf9q
 c++Ep02UpbPUMPzIYA9q68v1PA==
X-Google-Smtp-Source: ABdhPJykL54UnjW4ciN4fGRWEBJgf6zWsJDjMds2/uHeESPpVfQNNcqkwOSZPGazCeKG973ySyugcg==
X-Received: by 2002:a17:902:c584:b029:da:cc62:22f1 with SMTP id
 p4-20020a170902c584b02900dacc6222f1mr20408042plx.54.1608627583415; 
 Tue, 22 Dec 2020 00:59:43 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id x4sm19796659pgg.94.2020.12.22.00.59.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Dec 2020 00:59:42 -0800 (PST)
Date: Tue, 22 Dec 2020 14:29:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 14/48] opp: Filter out OPPs based on availability of a
 required-OPP
Message-ID: <20201222085940.y625zxee4tevbqm5@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-15-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-15-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Tue, 22 Dec 2020 09:21:48 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17-12-20, 21:06, Dmitry Osipenko wrote:
> A required OPP may not be available, and thus, all OPPs which are using
> this required OPP should be unavailable too.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/opp/core.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

Please send a separate patchset for fixes, as these can also go to 5.11 itself.

> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index d9feb7639598..3d02fe33630b 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -1588,7 +1588,7 @@ int _opp_add(struct device *dev, struct dev_pm_opp *new_opp,
>  	     struct opp_table *opp_table, bool rate_not_available)
>  {
>  	struct list_head *head;
> -	int ret;
> +	int i, ret;
>  
>  	mutex_lock(&opp_table->lock);
>  	head = &opp_table->opp_list;
> @@ -1615,6 +1615,15 @@ int _opp_add(struct device *dev, struct dev_pm_opp *new_opp,
>  			 __func__, new_opp->rate);
>  	}
>  
> +	for (i = 0; i < opp_table->required_opp_count && new_opp->available; i++) {
> +		if (new_opp->required_opps[i]->available)
> +			continue;
> +
> +		new_opp->available = false;
> +		dev_warn(dev, "%s: OPP not supported by required OPP %pOF (%lu)\n",
> +			 __func__, new_opp->required_opps[i]->np, new_opp->rate);

Why not just break from here ?

> +	}
> +
>  	return 0;
>  }
>  
> -- 
> 2.29.2

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
