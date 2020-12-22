Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEC12E07FC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 10:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749E46E853;
	Tue, 22 Dec 2020 09:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75F66E1BE
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 09:12:58 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id s15so2697721plr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 01:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aRm1EWTlrTuCGHC7vrOatFzPVY2kkbfTNw0mXXouB3Y=;
 b=Tz4gidYhRSQQPvxdsB7tqMzsVoYO3crt2ApaMJh6sBPNnz4QdlfPaFxg6Qw+Q9Ttkt
 wKFwX+PObpzq/4fdMTp+4B5KTH7Re12uhYrXa3HvCaddYet13JjFo+rTTdsSEt5DlkKf
 bp6SZO5FTIRmcpzQljrgkAITPVaV0bSdOcJWvfc30sM+iw3nPXkWpPYye4ZZWT5QEdXD
 faqbA50HRxcmPr6Nr9VSBUdTtKxm6LXMJ4WI1xvuYIbxPBsTtG37wCAzUBTtYOR26zRD
 K/mV0VlzeObZyhDbSnYISRJfGVOrWvx6nt6WqoFU5TRml3oWxZBdtwp7XRKvKR1Qp9D/
 ptAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aRm1EWTlrTuCGHC7vrOatFzPVY2kkbfTNw0mXXouB3Y=;
 b=mucDPDR1j86vH5bJ6GWDoRBcPtuuuWD9y7utyqzIdLI+cpRpKYtDqJvHz9gIA4Ltef
 xQb34Ha25GtEc15BIBlIrUabL+5TgWEPQSv4xMygBjD4DQtOkPOz9/W/FYUZrnzDcIIN
 svX2IzIH/h7KFo/T3h/OYd+LiDJ1jW7lxgfvbGBESUiZ5mTmqvQDwMtqs42ZRKqox6U3
 ofNHJ+iywWb5BpSvTPpw8qkMKWJVjFCdCiTWKgfasDgyh3vCKMjIM3I4fTd4/C3osGVJ
 YTIkyl8FkjLwfWRmIgFcO93CzUVfXcs7x4IeR641hX0H4ILpwcyDwvFrIXIu393pMbbp
 ag/A==
X-Gm-Message-State: AOAM533dqc+F0vaSnOl9OUbyO5aDIu7tFoHPN/e+Qk31mpv8MTbg+sXE
 0W5oLcv71Wan21sgOQwTjEtbOQ==
X-Google-Smtp-Source: ABdhPJyTuAI/kmpjoi97riBT35OzUfQwSMT6NxASqK0wJXFrTdvspmvEYCyC6FWsQNUmwA+WXnqrWg==
X-Received: by 2002:a17:902:6f01:b029:dc:3182:ce69 with SMTP id
 w1-20020a1709026f01b02900dc3182ce69mr16778961plk.10.1608628378460; 
 Tue, 22 Dec 2020 01:12:58 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id q12sm19544480pgj.24.2020.12.22.01.12.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Dec 2020 01:12:57 -0800 (PST)
Date: Tue, 22 Dec 2020 14:42:55 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 19/48] opp: Fix adding OPP entries in a wrong order if
 rate is unavailable
Message-ID: <20201222091255.wentz5hyt726qezg@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-20-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-20-digetx@gmail.com>
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
> Fix adding OPP entries in a wrong (opposite) order if OPP rate is
> unavailable. The OPP comparison is erroneously skipped if OPP rate is
> missing, thus OPPs are left unsorted.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/opp/core.c | 23 ++++++++++++-----------
>  drivers/opp/opp.h  |  2 +-
>  2 files changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 34f7e530d941..5c7f130a8de2 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -1531,9 +1531,10 @@ static bool _opp_supported_by_regulators(struct dev_pm_opp *opp,
>  	return true;
>  }
>  
> -int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2)
> +int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2,
> +		     bool rate_not_available)
>  {
> -	if (opp1->rate != opp2->rate)
> +	if (!rate_not_available && opp1->rate != opp2->rate)

rate will be 0 for both the OPPs here if rate_not_available is true and so this
change shouldn't be required.

>  		return opp1->rate < opp2->rate ? -1 : 1;
>  	if (opp1->bandwidth && opp2->bandwidth &&
>  	    opp1->bandwidth[0].peak != opp2->bandwidth[0].peak)
> @@ -1545,7 +1546,8 @@ int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2)
>  
>  static int _opp_is_duplicate(struct device *dev, struct dev_pm_opp *new_opp,
>  			     struct opp_table *opp_table,
> -			     struct list_head **head)
> +			     struct list_head **head,
> +			     bool rate_not_available)
>  {
>  	struct dev_pm_opp *opp;
>  	int opp_cmp;
> @@ -1559,13 +1561,13 @@ static int _opp_is_duplicate(struct device *dev, struct dev_pm_opp *new_opp,
>  	 * loop.
>  	 */
>  	list_for_each_entry(opp, &opp_table->opp_list, node) {
> -		opp_cmp = _opp_compare_key(new_opp, opp);
> +		opp_cmp = _opp_compare_key(new_opp, opp, rate_not_available);
>  		if (opp_cmp > 0) {
>  			*head = &opp->node;
>  			continue;
>  		}
>  
> -		if (opp_cmp < 0)
> +		if (opp_cmp < 0 || rate_not_available)
>  			return 0;

This shouldn't be required as well, isn't it ?

>  
>  		/* Duplicate OPPs */
> @@ -1601,12 +1603,11 @@ int _opp_add(struct device *dev, struct dev_pm_opp *new_opp,
>  	mutex_lock(&opp_table->lock);
>  	head = &opp_table->opp_list;
>  
> -	if (likely(!rate_not_available)) {
> -		ret = _opp_is_duplicate(dev, new_opp, opp_table, &head);
> -		if (ret) {
> -			mutex_unlock(&opp_table->lock);
> -			return ret;
> -		}
> +	ret = _opp_is_duplicate(dev, new_opp, opp_table, &head,
> +				rate_not_available);

This is the only thing we need to do here I believe.

> +	if (ret) {
> +		mutex_unlock(&opp_table->lock);
> +		return ret;
>  	}
>  
>  	list_add(&new_opp->node, head);
> diff --git a/drivers/opp/opp.h b/drivers/opp/opp.h
> index 4ced7ffa8158..6f5be6c72f13 100644
> --- a/drivers/opp/opp.h
> +++ b/drivers/opp/opp.h
> @@ -219,7 +219,7 @@ struct opp_table *_find_opp_table(struct device *dev);
>  struct opp_device *_add_opp_dev(const struct device *dev, struct opp_table *opp_table);
>  struct dev_pm_opp *_opp_allocate(struct opp_table *opp_table);
>  void _opp_free(struct dev_pm_opp *opp);
> -int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2);
> +int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2, bool rate_not_available);
>  int _opp_add(struct device *dev, struct dev_pm_opp *new_opp, struct opp_table *opp_table, bool rate_not_available);
>  int _opp_add_v1(struct opp_table *opp_table, struct device *dev, unsigned long freq, long u_volt, bool dynamic);
>  void _dev_pm_opp_cpumask_remove_table(const struct cpumask *cpumask, int last_cpu);
> -- 
> 2.29.2

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
