Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B25F5565BA6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CA610F285;
	Mon,  4 Jul 2022 16:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AAECD10E068;
 Mon,  4 Jul 2022 14:35:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBF9423A;
 Mon,  4 Jul 2022 07:35:10 -0700 (PDT)
Received: from [10.57.41.70] (unknown [10.57.41.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 419853F66F;
 Mon,  4 Jul 2022 07:35:07 -0700 (PDT)
Message-ID: <48d865e8-6c0d-99c0-a43b-89793d5c3f85@arm.com>
Date: Mon, 4 Jul 2022 15:35:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V3 02/20] OPP: Make dev_pm_opp_set_regulators() accept
 NULL terminated list
Content-Language: en-GB
To: Viresh Kumar <viresh.kumar@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Chanwoo Choi
 <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Qiang Yu <yuq825@gmail.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <cover.1656935522.git.viresh.kumar@linaro.org>
 <9730e011004b7526e79c6f409f5147fb235b414a.1656935522.git.viresh.kumar@linaro.org>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <9730e011004b7526e79c6f409f5147fb235b414a.1656935522.git.viresh.kumar@linaro.org>
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
Cc: linux-samsung-soc@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>, lima@lists.freedesktop.org,
 linux-pm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/07/2022 13:07, Viresh Kumar wrote:
> Make dev_pm_opp_set_regulators() accept a NULL terminated list of names
> instead of making the callers keep the two parameters in sync, which
> creates an opportunity for bugs to get in.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  drivers/cpufreq/cpufreq-dt.c                |  9 ++++-----
>  drivers/cpufreq/ti-cpufreq.c                |  7 +++----
>  drivers/devfreq/exynos-bus.c                |  4 ++--
>  drivers/gpu/drm/lima/lima_devfreq.c         |  3 ++-
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c |  4 ++--
>  drivers/opp/core.c                          | 18 ++++++++++++------
>  drivers/soc/tegra/pmc.c                     |  4 ++--
>  include/linux/pm_opp.h                      |  9 ++++-----
>  8 files changed, 31 insertions(+), 27 deletions(-)
> 
[...]
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 194af7f607a6..12784f349550 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -91,6 +91,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>  	struct devfreq *devfreq;
>  	struct thermal_cooling_device *cooling;
>  	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
> +	const char *supplies[] = { pfdev->comp->supply_names[0], NULL };
>  
>  	if (pfdev->comp->num_supplies > 1) {
>  		/*
> @@ -101,8 +102,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>  		return 0;
>  	}
>  
> -	ret = devm_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
> -					 pfdev->comp->num_supplies);
> +	ret = devm_pm_opp_set_regulators(dev, supplies);
>  	if (ret) {
>  		/* Continue if the optional regulator is missing */
>  		if (ret != -ENODEV) {

I have to say the 'new improved' list ending with NULL approach doesn't
work out so well for Panfrost. We already have to have a separate
'num_supplies' variable for devm_regulator_bulk_get() /
regulator_bulk_{en,dis}able(), so the keeping everything in sync
argument is lost here.

I would suggest added the NULL on the end of the lists in panfrost_drv.c
but then it would break the use of ARRAY_SIZE() to automagically keep
the length correct...

For now the approach isn't too bad because Panfrost doesn't yet support
enabling devfreq with more than one supply. But that array isn't going
to work so nicely when that restriction is removed.

The only sane way I can see of handling this in Panfrost would be
replicating the loop to count the supplies in the Panfrost code which
would allow dropping num_supplies from struct panfrost_compatible and
then supply_names in the same struct could be NULL terminated ready for
devm_pm_opp_set_regulators().

Steve

> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index e166bfe5fc90..4e4593957ec5 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -2105,13 +2105,20 @@ EXPORT_SYMBOL_GPL(dev_pm_opp_put_prop_name);
>   * This must be called before any OPPs are initialized for the device.
>   */
>  struct opp_table *dev_pm_opp_set_regulators(struct device *dev,
> -					    const char * const names[],
> -					    unsigned int count)
> +					    const char * const names[])
>  {
>  	struct dev_pm_opp_supply *supplies;
> +	const char * const *temp = names;
>  	struct opp_table *opp_table;
>  	struct regulator *reg;
> -	int ret, i;
> +	int count = 0, ret, i;
> +
> +	/* Count number of regulators */
> +	while (*temp++)
> +		count++;
> +
> +	if (!count)
> +		return ERR_PTR(-EINVAL);
>  
>  	opp_table = _add_opp_table(dev, false);
>  	if (IS_ERR(opp_table))
> @@ -2236,12 +2243,11 @@ static void devm_pm_opp_regulators_release(void *data)
>   * Return: 0 on success and errorno otherwise.
>   */
>  int devm_pm_opp_set_regulators(struct device *dev,
> -			       const char * const names[],
> -			       unsigned int count)
> +			       const char * const names[])
>  {
>  	struct opp_table *opp_table;
>  
> -	opp_table = dev_pm_opp_set_regulators(dev, names, count);
> +	opp_table = dev_pm_opp_set_regulators(dev, names);
>  	if (IS_ERR(opp_table))
>  		return PTR_ERR(opp_table);
>  
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 5611d14d3ba2..6a4b8f7e7948 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -1384,7 +1384,7 @@ tegra_pmc_core_pd_opp_to_performance_state(struct generic_pm_domain *genpd,
>  static int tegra_pmc_core_pd_add(struct tegra_pmc *pmc, struct device_node *np)
>  {
>  	struct generic_pm_domain *genpd;
> -	const char *rname = "core";
> +	const char *rname[] = { "core", NULL};
>  	int err;
>  
>  	genpd = devm_kzalloc(pmc->dev, sizeof(*genpd), GFP_KERNEL);
> @@ -1395,7 +1395,7 @@ static int tegra_pmc_core_pd_add(struct tegra_pmc *pmc, struct device_node *np)
>  	genpd->set_performance_state = tegra_pmc_core_pd_set_performance_state;
>  	genpd->opp_to_performance_state = tegra_pmc_core_pd_opp_to_performance_state;
>  
> -	err = devm_pm_opp_set_regulators(pmc->dev, &rname, 1);
> +	err = devm_pm_opp_set_regulators(pmc->dev, rname);
>  	if (err)
>  		return dev_err_probe(pmc->dev, err,
>  				     "failed to set core OPP regulator\n");
> diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
> index 6708b4ec244d..4c490865d574 100644
> --- a/include/linux/pm_opp.h
> +++ b/include/linux/pm_opp.h
> @@ -159,9 +159,9 @@ void dev_pm_opp_put_supported_hw(struct opp_table *opp_table);
>  int devm_pm_opp_set_supported_hw(struct device *dev, const u32 *versions, unsigned int count);
>  struct opp_table *dev_pm_opp_set_prop_name(struct device *dev, const char *name);
>  void dev_pm_opp_put_prop_name(struct opp_table *opp_table);
> -struct opp_table *dev_pm_opp_set_regulators(struct device *dev, const char * const names[], unsigned int count);
> +struct opp_table *dev_pm_opp_set_regulators(struct device *dev, const char * const names[]);
>  void dev_pm_opp_put_regulators(struct opp_table *opp_table);
> -int devm_pm_opp_set_regulators(struct device *dev, const char * const names[], unsigned int count);
> +int devm_pm_opp_set_regulators(struct device *dev, const char * const names[]);
>  struct opp_table *dev_pm_opp_set_clkname(struct device *dev, const char *name);
>  void dev_pm_opp_put_clkname(struct opp_table *opp_table);
>  int devm_pm_opp_set_clkname(struct device *dev, const char *name);
> @@ -379,7 +379,7 @@ static inline struct opp_table *dev_pm_opp_set_prop_name(struct device *dev, con
>  
>  static inline void dev_pm_opp_put_prop_name(struct opp_table *opp_table) {}
>  
> -static inline struct opp_table *dev_pm_opp_set_regulators(struct device *dev, const char * const names[], unsigned int count)
> +static inline struct opp_table *dev_pm_opp_set_regulators(struct device *dev, const char * const names[])
>  {
>  	return ERR_PTR(-EOPNOTSUPP);
>  }
> @@ -387,8 +387,7 @@ static inline struct opp_table *dev_pm_opp_set_regulators(struct device *dev, co
>  static inline void dev_pm_opp_put_regulators(struct opp_table *opp_table) {}
>  
>  static inline int devm_pm_opp_set_regulators(struct device *dev,
> -					     const char * const names[],
> -					     unsigned int count)
> +					     const char * const names[])
>  {
>  	return -EOPNOTSUPP;
>  }

