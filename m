Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1999E253F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 16:58:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6DC10EA7E;
	Tue,  3 Dec 2024 15:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UjXlOj3k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518F410EA80
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 15:58:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 31611A416F7;
 Tue,  3 Dec 2024 15:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060DBC4CED6;
 Tue,  3 Dec 2024 15:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733241523;
 bh=XIcKNOfiIWK3lnEygoZBuYhAOFl3mmPl+5JRrgpRj94=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UjXlOj3kmx95EVRr6poZcNT35j3F6GnAt6ahYy9BVBeUuYWKIvGzCuz7ebjkOgjmP
 xhYMZnp21cLCHWLwUHAuLe4U5s3st7DyUl09sBm6Qd/4wALJOxgSR2LT1qFzdDL0Yx
 thaq31UVv2cGr8+5T+qbgaEmzsIUWu6ezVpaiv8eeZNAarY6i6i1aV60dW+sebRNEx
 tLdigGZr/dFckxNmvsbvSypkg1zndloin8aQ+uQp6q669zsZK6xCg9BNi6sYFVD59Z
 8OvMYNh5Otd1dk+wmLLxt6Ufkdji5ziDHv75+ItCZxAzNwqUbXXeTnDg5pAOlAiDzh
 K9XY5KWJ/Xt0w==
Message-ID: <62fa5594-6245-4dff-a1f0-99f2702f5826@kernel.org>
Date: Tue, 3 Dec 2024 16:58:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 07/14] soc: thead: power-domain: Add skeleton
 power-domain driver for TH1520
To: Michal Wilczynski <m.wilczynski@samsung.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 frank.binns@imgtec.com, matt.coster@imgtec.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
 jszhang@kernel.org, m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
References: <20241203134137.2114847-1-m.wilczynski@samsung.com>
 <CGME20241203134158eucas1p1fae346180c0166570ea7e7723076225c@eucas1p1.samsung.com>
 <20241203134137.2114847-8-m.wilczynski@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241203134137.2114847-8-m.wilczynski@samsung.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/12/2024 14:41, Michal Wilczynski wrote:
> The T-Head TH1520 SoC contains multiple power islands that can be
> programmatically turned on and off using the AON (Always-On) protocol
> and a hardware mailbox [1]. The relevant mailbox driver has already been
> merged into the mainline kernel in commit 5d4d263e1c6b ("mailbox:
> Introduce support for T-head TH1520 Mailbox driver"); however, the AON
> implementation is still under development.
> 
> This commit introduces a skeleton power-domain driver for the TH1520
> SoC, designed to be easily extended to work with the AON protocol in the
> future.  Currently, it only supports the GPU. Since there is no
> mechanism yet to turn the GPU power island on, the driver will only set
> the relevant registers to bring the GPU out of the reset state.  This
> should be done after the power-up sequence requested through the mailbox
> is completed.
> 
> Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [1]
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  MAINTAINERS                                   |   2 +
>  drivers/pmdomain/Kconfig                      |   1 +
>  drivers/pmdomain/Makefile                     |   1 +
>  drivers/pmdomain/thead/Kconfig                |  12 ++
>  drivers/pmdomain/thead/Makefile               |   2 +
>  drivers/pmdomain/thead/th1520-pm-domains.c    | 195 ++++++++++++++++++
>  .../dt-bindings/power/thead,th1520-power.h    |  19 ++
>  7 files changed, 232 insertions(+)


Please run scripts/checkpatch.pl and fix reported warnings. Then please
run `scripts/checkpatch.pl --strict` and (probably) fix more warnings.


>  create mode 100644 drivers/pmdomain/thead/Kconfig
>  create mode 100644 drivers/pmdomain/thead/Makefile
>  create mode 100644 drivers/pmdomain/thead/th1520-pm-domains.c
>  create mode 100644 include/dt-bindings/power/thead,th1520-power.h
> 


...

> +
> +static int th1520_pd_power_off(struct generic_pm_domain *domain)
> +{
> +	struct th1520_power_domain *pd = to_th1520_power_domain(domain);
> +
> +	/* The missing component here is the call to E902 core through the

Use Linux coding style comments (see coding style). This applies to
multiple places in your code.

> +	 * AON protocol using hardware mailbox.
> +	 */
> +
> +	/* Put the GPU into reset state after powering it off */
> +	th1520_rst_gpu_disable(pd->reg);
> +
> +	return 0;
> +}
> +
> +static struct generic_pm_domain *th1520_pd_xlate(const struct of_phandle_args *spec,
> +						 void *data)
> +{
> +	struct generic_pm_domain *domain = ERR_PTR(-ENOENT);
> +	struct genpd_onecell_data *pd_data = data;
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(th1520_pd_ranges); i++) {
> +		struct th1520_power_domain *pd;
> +
> +		pd = to_th1520_power_domain(pd_data->domains[i]);
> +		if (pd->rsrc == spec->args[0]) {
> +			domain = &pd->genpd;
> +			break;
> +		}
> +	}
> +
> +	return domain;
> +}
> +
> +static struct th1520_power_domain *
> +th1520_add_pm_domain(struct device *dev, const struct th1520_power_info *pi)
> +{
> +	struct th1520_power_domain *pd;
> +	int ret;
> +
> +	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
> +	if (!pd)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pd->rsrc = pi->rsrc;
> +	pd->genpd.power_on = th1520_pd_power_on;
> +	pd->genpd.power_off = th1520_pd_power_off;
> +	pd->genpd.name = pi->name;
> +
> +	ret = pm_genpd_init(&pd->genpd, NULL, true);
> +	if (ret) {
> +		devm_kfree(dev, pd);

You should rather fail the probe. Failures of power domains are important.

> +		return ERR_PTR(ret);
> +	}
> +
> +	return pd;
> +}
> +
> +static int th1520_pd_probe(struct platform_device *pdev)
> +{
> +	struct generic_pm_domain **domains;
> +	struct genpd_onecell_data *pd_data;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct regmap *reg;
> +	int i;
> +
> +	reg = syscon_regmap_lookup_by_phandle(np, "thead,vosys-regmap");
> +	if (IS_ERR(reg))
> +		return PTR_ERR(reg);
> +
> +	domains = devm_kcalloc(dev, ARRAY_SIZE(th1520_pd_ranges),
> +			       sizeof(*domains), GFP_KERNEL);
> +	if (!domains)
> +		return -ENOMEM;
> +
> +	pd_data = devm_kzalloc(dev, sizeof(*pd_data), GFP_KERNEL);
> +	if (!pd_data)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ARRAY_SIZE(th1520_pd_ranges); i++) {
> +		struct th1520_power_domain *pd;
> +
> +		pd = th1520_add_pm_domain(dev, &th1520_pd_ranges[i]);
> +		if (IS_ERR_OR_NULL(pd))
> +			continue;
> +
> +		pd->reg = reg;
> +		domains[i] = &pd->genpd;
> +		dev_dbg(dev, "added power domain %s\n", pd->genpd.name);
> +	}
> +
> +	pd_data->domains = domains;
> +	pd_data->num_domains = ARRAY_SIZE(th1520_pd_ranges);
> +	pd_data->xlate = th1520_pd_xlate;
> +
> +	return of_genpd_add_provider_onecell(dev->of_node, pd_data);
> +}
> +
> +static const struct of_device_id th1520_pd_match[] = {
> +	{ .compatible = "thead,th1520-pd",},
> +	{ /* sentinel */ }
> +};
> +


Make the driver tristate and module. There is nothing here which
prevents it being a module.


> +builtin_platform_driver(th1520_pd_driver);
> diff --git a/include/dt-bindings/power/thead,th1520-power.h b/include/dt-bindings/power/thead,th1520-power.h
> new file mode 100644
> index 000000000000..30fb4e9892e7
> --- /dev/null
> +++ b/include/dt-bindings/power/thead,th1520-power.h
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0+


Wrong license. See checkpatch.



Best regards,
Krzysztof
