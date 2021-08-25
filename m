Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C90B03F7946
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 17:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195E66E32F;
	Wed, 25 Aug 2021 15:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FEF6E32F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 15:41:54 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i28so53931231lfl.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 08:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Jh8WQ9yiN9zpRyuwMdWH53fKRiHl78imM33rFUTmvQc=;
 b=VXTFuvzR5bLNZdHnuy92VMQKovkT2EzOUb9OcN3psg2tkN1i5/AsTKc7AKSGtEXF85
 Kv3LG6+Tn57EqgqQdIFu7fcyD00uYC3VVRasNFaW2hIC3i/hNcdl5MBDtJB3kzhxdCet
 wVwD4YkAEaQHK7uISBdatlDIYJE880IZdnG6G02/xPA2tk5n2zH3MPPJXANijDrbhcYx
 17tod+tgRF+2C8YFqB6X18apDZJm9NiAVIa6wfWKXbvUt4khhVeaLLmRBxhXOo+nP5HW
 B7+AKTu9GxrwBwjGazKwKUpgLJM7aheacozAFUxo3uu0zy3pZvy+b3kjVm+63moLaebu
 VFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jh8WQ9yiN9zpRyuwMdWH53fKRiHl78imM33rFUTmvQc=;
 b=Yp+6jqdotr51sodN+43VBqNY5gowVP7SN9qhrkudg0yhLieRDtGXewAMemRFIvE4ZW
 IjT7FR6/R45K/W8GSkC6jnGQIqQ89yMrkS2xTYZJugwbNHAjHnOQPdyr9eUWb9j9uLWY
 7WKzKu4UdjIEfKKDyFwViXfERDZuYECbCFTsAe+mNeEm4/7mjn0U8okzLKkfSU4JfP9t
 qJOrxbdPb0GTd1I8z9123lJuZNcRW6WpfjJSQyb2aNhuXBXvRosg8siCqvQAhdJNX/14
 JlOUn6cOpE+O9lzKMSKUsHWPmYE0tQnizsfnkT4W1CK+yFgGHnyE5ndpPg6sdqIoDwha
 fBJg==
X-Gm-Message-State: AOAM533gj+xDpRB88befJaRNz+/96b3qqPmO6SDCJDjsl/K2Hu1OBZxV
 W51hfpJYqSCmKdhVD569rt4=
X-Google-Smtp-Source: ABdhPJynPPjKhDfBdRrXu4deYFfQEOhUbJJoP2KAxKZEnwK6Q+6Z6UDmYAY47Ok5OqvkDNllzN7VAQ==
X-Received: by 2002:ac2:592c:: with SMTP id v12mr27667572lfi.249.1629906112733; 
 Wed, 25 Aug 2021 08:41:52 -0700 (PDT)
Received: from [192.168.2.145] (94-29-17-251.dynamic.spd-mgts.ru.
 [94.29.17.251])
 by smtp.googlemail.com with ESMTPSA id j14sm33529lfe.203.2021.08.25.08.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 08:41:52 -0700 (PDT)
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
From: Dmitry Osipenko <digetx@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>, linux-staging@lists.linux.dev,
 linux-spi@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
References: <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <f1314a47-9e8b-58e1-7c3f-0afb1ec8e70a@gmail.com>
 <20210819061617.r4kuqxafjstrv3kt@vireshk-i7>
 <CAPDyKFpg8ixT4AEjzVLTwQR7Nn9CctjnLCDS5GwkOrAERquyxw@mail.gmail.com>
 <20210820051843.5mueqpnjbqt3zdzc@vireshk-i7>
 <b887de8c-a40b-a62e-8abf-698e67cdb70c@gmail.com>
Message-ID: <ed70e422-e0e9-8c2a-7ce6-e39cb6fd8108@gmail.com>
Date: Wed, 25 Aug 2021 18:41:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b887de8c-a40b-a62e-8abf-698e67cdb70c@gmail.com>
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

22.08.2021 21:35, Dmitry Osipenko пишет:
> 20.08.2021 08:18, Viresh Kumar пишет:
>> On 19-08-21, 16:55, Ulf Hansson wrote:
>>> Right, that sounds reasonable.
>>>
>>> We already have pm_genpd_opp_to_performance_state() which translates
>>> an OPP to a performance state. This function invokes the
>>> ->opp_to_performance_state() for a genpd. Maybe we need to allow a
>>> genpd to not have ->opp_to_performance_state() callback assigned
>>> though, but continue up in the hierarchy to see if the parent has the
>>> callback assigned, to make this work for Tegra?
>>>
>>> Perhaps we should add an API dev_pm_genpd_opp_to_performance_state(),
>>> allowing us to pass the device instead of the genpd. But that's a
>>> minor thing.
>>
>> I am not concerned a lot about how it gets implemented, and am not
>> sure as well, as I haven't looked into these details since sometime.
>> Any reasonable thing will be accepted, as simple as that.
>>
>>> Finally, the precondition to use the above, is to first get a handle
>>> to an OPP table. This is where I am struggling to find a generic
>>> solution, because I guess that would be platform or even consumer
>>> driver specific for how to do this. And at what point should we do
>>> this?
> 
> GENPD core can't get OPP table handle, setting up OPP table is a platform/driver specific operation.
> 
>> Hmm, I am not very clear with the whole picture at this point of time.
>>
>> Dmitry, can you try to frame a sequence of events/calls/etc that will
>> define what kind of devices we are looking at here, and how this can
>> be made to work ?
> 
> Could you please clarify what do you mean by a "kind of devices"?
> 
> I made hack based on the recent discussions and it partially works. Getting clock rate involves resuming device which backs the clock and it also may use GENPD, so lockings are becoming complicated. It doesn't work at all if device uses multiple domains because virtual domain device doesn't have OPP table.
> 
> Setting up the performance state from a consumer driver is a cleaner variant so far. 

Thinking a bit more about this, I got a nicer variant which actually works in all cases for Tegra.

Viresh / Ulf, what do you think about this:

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index 3a13a942d012..814b0f7a1909 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -2700,15 +2700,28 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
 		goto err;
 	} else if (pstate > 0) {
 		ret = dev_pm_genpd_set_performance_state(dev, pstate);
-		if (ret)
+		if (ret) {
+			dev_err(dev, "failed to set required performance state for power-domain %s: %d\n",
+				pd->name, ret);
 			goto err;
+		}
 		dev_gpd_data(dev)->default_pstate = pstate;
 	}
+
+	if (pd->get_performance_state) {
+		ret = pd->get_performance_state(pd, base_dev);
+		if (ret < 0) {
+			dev_err(dev, "failed to get performance state for power-domain %s: %d\n",
+				pd->name, ret);
+			goto err;
+		}
+
+		dev_gpd_data(dev)->rpm_pstate = ret;
+	}
+
 	return 1;
 
 err:
-	dev_err(dev, "failed to set required performance state for power-domain %s: %d\n",
-		pd->name, ret);
 	genpd_remove_device(pd, dev);
 	return ret;
 }
diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 2f1da33c2cd5..5f045030879b 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -2136,7 +2136,7 @@ struct opp_table *dev_pm_opp_set_clkname(struct device *dev, const char *name)
 	}
 
 	/* clk shouldn't be initialized at this point */
-	if (WARN_ON(opp_table->clk)) {
+	if (WARN_ON(!IS_ERR_OR_NULL(opp_table->clk))) {
 		ret = -EBUSY;
 		goto err;
 	}
@@ -2967,3 +2967,33 @@ int dev_pm_opp_sync(struct device *dev)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_sync);
+
+/**
+ * dev_pm_opp_from_clk_rate() - Get OPP from current clock rate
+ * @dev:	device for which we do this operation
+ *
+ * Get OPP which corresponds to the current clock rate of a device.
+ *
+ * Return: pointer to 'struct dev_pm_opp' on success and errorno otherwise.
+ */
+struct dev_pm_opp *dev_pm_opp_from_clk_rate(struct device *dev)
+{
+	struct dev_pm_opp *opp = ERR_PTR(-ENODEV);
+	struct opp_table *opp_table;
+	unsigned long freq;
+
+	opp_table = _find_opp_table(dev);
+	if (IS_ERR(opp_table))
+		return ERR_CAST(opp_table);
+
+	if (!IS_ERR(opp_table->clk)) {
+		freq = clk_get_rate(opp_table->clk);
+		opp = _find_freq_ceil(opp_table, &freq);
+	}
+
+	/* Drop reference taken by _find_opp_table() */
+	dev_pm_opp_put_opp_table(opp_table);
+
+	return opp;
+}
+EXPORT_SYMBOL_GPL(dev_pm_opp_from_clk_rate);
diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 7c9bc93147f1..fc863d84f8d5 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -506,6 +506,96 @@ static void tegra_pmc_scratch_writel(struct tegra_pmc *pmc, u32 value,
 		writel(value, pmc->scratch + offset);
 }
 
+static const char * const tegra_pd_no_perf_compats[] = {
+	"nvidia,tegra20-sclk",
+	"nvidia,tegra30-sclk",
+	"nvidia,tegra30-pllc",
+	"nvidia,tegra30-plle",
+	"nvidia,tegra30-pllm",
+	"nvidia,tegra20-dc",
+	"nvidia,tegra30-dc",
+	"nvidia,tegra20-emc",
+	"nvidia,tegra30-emc",
+	NULL,
+};
+
+static int tegra_pmc_pd_get_performance_state(struct generic_pm_domain *genpd,
+					      struct device *dev)
+{
+	struct opp_table *hw_opp_table, *clk_opp_table;
+	struct dev_pm_opp *opp;
+	u32 hw_version;
+	int ret;
+
+	/*
+	 * Tegra114+ SocS don't support OPP yet.  But if they will get OPP
+	 * support, then we want to skip OPP for older kernels to preserve
+	 * compatibility of newer DTBs with older kernels.
+	 */
+	if (!pmc->soc->supports_core_domain)
+		return 0;
+
+	/*
+	 * The EMC devices are a special case because we have a protection
+	 * from non-EMC drivers getting clock handle before EMC driver is
+	 * fully initialized.  The goal of the protection is to prevent
+	 * devfreq driver from getting failures if it will try to change
+	 * EMC clock rate until clock is fully initialized.  The EMC drivers
+	 * will initialize the performance state by themselves.
+	 *
+	 * Display controller also is a special case because only controller
+	 * driver could get the clock rate based on configuration of internal
+	 * divider.
+	 *
+	 * Clock driver uses its own state syncing.
+	 */
+	if (of_device_compatible_match(dev->of_node, tegra_pd_no_perf_compats))
+		return 0;
+
+	if (of_machine_is_compatible("nvidia,tegra20"))
+		hw_version = BIT(tegra_sku_info.soc_process_id);
+	else
+		hw_version = BIT(tegra_sku_info.soc_speedo_id);
+
+	hw_opp_table = dev_pm_opp_set_supported_hw(dev, &hw_version, 1);
+	if (IS_ERR(hw_opp_table)){
+		dev_err(dev, "failed to set OPP supported HW: %pe\n",
+			hw_opp_table);
+		return PTR_ERR(hw_opp_table);
+	}
+
+	clk_opp_table = dev_pm_opp_set_clkname(dev, NULL);
+	if (IS_ERR(clk_opp_table)){
+		dev_err(dev, "failed to set OPP clk: %pe\n", clk_opp_table);
+		ret = PTR_ERR(clk_opp_table);
+		goto put_hw;
+	}
+
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret) {
+		dev_err(dev, "failed to add OPP table: %d\n", ret);
+		goto put_clk;
+	}
+
+	opp = dev_pm_opp_from_clk_rate(dev);
+	if (IS_ERR(opp)) {
+		dev_err(&genpd->dev, "failed to get current OPP for %s: %pe\n",
+			dev_name(dev), opp);
+		ret = PTR_ERR(opp);
+	} else {
+		ret = dev_pm_opp_get_required_pstate(opp, 0);
+		dev_pm_opp_put(opp);
+	}
+
+	dev_pm_opp_of_remove_table(dev);
+put_clk:
+	dev_pm_opp_put_clkname(clk_opp_table);
+put_hw:
+	dev_pm_opp_put_supported_hw(hw_opp_table);
+
+	return ret;
+}
+
 /*
  * TODO Figure out a way to call this with the struct tegra_pmc * passed in.
  * This currently doesn't work because readx_poll_timeout() can only operate
@@ -1238,6 +1328,7 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 
 	pg->id = id;
 	pg->genpd.name = np->name;
+	pg->genpd.get_performance_state = tegra_pmc_pd_get_performance_state;
 	pg->genpd.power_off = tegra_genpd_power_off;
 	pg->genpd.power_on = tegra_genpd_power_on;
 	pg->pmc = pmc;
@@ -1354,6 +1445,7 @@ static int tegra_pmc_core_pd_add(struct tegra_pmc *pmc, struct device_node *np)
 		return -ENOMEM;
 
 	genpd->name = "core";
+	genpd->get_performance_state = tegra_pmc_pd_get_performance_state;
 	genpd->set_performance_state = tegra_pmc_core_pd_set_performance_state;
 	genpd->opp_to_performance_state = tegra_pmc_core_pd_opp_to_performance_state;
 
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 67017c9390c8..abe33be9828f 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -133,6 +133,8 @@ struct generic_pm_domain {
 						 struct dev_pm_opp *opp);
 	int (*set_performance_state)(struct generic_pm_domain *genpd,
 				     unsigned int state);
+	int (*get_performance_state)(struct generic_pm_domain *genpd,
+				     struct device *dev);
 	struct gpd_dev_ops dev_ops;
 	s64 max_off_time_ns;	/* Maximum allowed "suspended" time. */
 	ktime_t next_wakeup;	/* Maintained by the domain governor */
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 686122b59935..e7fd0dd493ca 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -169,6 +169,7 @@ void dev_pm_opp_remove_table(struct device *dev);
 void dev_pm_opp_cpumask_remove_table(const struct cpumask *cpumask);
 int dev_pm_opp_sync_regulators(struct device *dev);
 int dev_pm_opp_sync(struct device *dev);
+struct dev_pm_opp *dev_pm_opp_from_clk_rate(struct device *dev);
 #else
 static inline struct opp_table *dev_pm_opp_get_opp_table(struct device *dev)
 {
@@ -440,6 +441,11 @@ static inline int dev_pm_opp_sync(struct device *dev)
 	return -EOPNOTSUPP;
 }
 
+static struct inline dev_pm_opp *dev_pm_opp_from_clk_rate(struct device *dev)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
 #endif		/* CONFIG_PM_OPP */
 
 #if defined(CONFIG_PM_OPP) && defined(CONFIG_OF)

