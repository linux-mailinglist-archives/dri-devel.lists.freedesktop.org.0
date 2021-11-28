Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 614BF4604B5
	for <lists+dri-devel@lfdr.de>; Sun, 28 Nov 2021 06:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EC56E9EC;
	Sun, 28 Nov 2021 05:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 391 seconds by postgrey-1.36 at gabe;
 Sun, 28 Nov 2021 05:47:34 UTC
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4936E9EC
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Nov 2021 05:47:34 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J1yDh5CCGzWG;
 Sun, 28 Nov 2021 06:47:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638078453; bh=+Cj+BB/A2FsyTFVTgsdgLhKnhMnYskAogn3uwYKOvvs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mDvzO3ZNwgpRiDuAFQm9+pmxug6iiRogj8KsZ2DHrmVfKL9MWSJm9HIQ2sF53TWpd
 L0Cxo/iC7TwwP9CzggOdtnsG8yh61uH/yiyeGKtUaLSuvka7WWpkL+2fp2a7+f17zz
 LHjYvTh7JA7FV6iyq6nBwmZrvFWcELXXfV45m1RCWxlWHolAHnoJwfNUJM70pyRscX
 ENAaoeowyKRpJRtQFR1i2aNe9zfcheSfjlOzpYaHMu1obJu43gZXlYrjkkdRz+K8NR
 sXFW2VroLhE37GnXrisZfCB+nIxUD7dB5BTDMrVasYp8kMZWagiL+RGR5M01Pdi/50
 yPZ70dtIdnSCg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Sun, 28 Nov 2021 06:47:31 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v15 12/39] drm/tegra: gr2d: Support generic power domain
 and runtime PM
Message-ID: <YaMX89bRBlqh0MvB@qmqm.qmqm.pl>
References: <20211114193435.7705-1-digetx@gmail.com>
 <20211114193435.7705-13-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211114193435.7705-13-digetx@gmail.com>
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
Cc: Nishanth Menon <nm@ti.com>, linux-pwm@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Heidelberg <david@ixit.cz>,
 Uwe =?iso-8859-2?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 14, 2021 at 10:34:08PM +0300, Dmitry Osipenko wrote:
> Add runtime power management and support generic power domains.
[...]
> @@ -104,10 +127,17 @@ static int gr2d_open_channel(struct tegra_drm_client *client,
>  			     struct tegra_drm_context *context)
>  {
>  	struct gr2d *gr2d = to_gr2d(client);
> +	int err;
> +
> +	err = pm_runtime_resume_and_get(client->base.dev);
> +	if (err)
> +		return err;
>  
>  	context->channel = host1x_channel_get(gr2d->channel);
> -	if (!context->channel)
> +	if (!context->channel) {
> +		pm_runtime_put(context->client->base.dev);

Could host1x_channel_get/put() handle pm_runtime* calls ? I would expect
this to be common code for the users.

BTW, pm_runtime_resume_and_get() uses different dev than
pm_runtime_put() in the error path - is this intended?

Best Regards
Micha³ Miros³aw
