Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7303F5203
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 22:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B697289B65;
	Mon, 23 Aug 2021 20:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1A589B65
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 20:24:06 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id j12so19221866ljg.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 13:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J41x529VlTspZMrpThFHJLBr2g65jbs1WO5P40LCen4=;
 b=okYdM6r/OEM+GpVMmndUDSUnFuATe7k+UqV9Xd6SnEB6FCQnedxeMEPVsABonqs4N4
 bW0CUVBYgP/wVgNhvKRjjJZHkQWqjAfdAXHaWOprlSkmDVUGTjWH0QHqHe/JDzPhBYMW
 VS78dI9TbqWyfxbPdEd9M68PCp/85z5U4mMqUTiCNVQcQnpHeloJ5A8DDCAgG+UndNk2
 4AMRro0QimKicKoXkXK7fx6Xlty7DPO0Rz/T7e7AYrMNjr1lsW8oLXtit6l5wdRItw9Y
 0sCrelfgm2KgdesCrJhygLOJ6k4XDHAPdBtXpSk4O9XXGH416S+WsJAn5UMZlTogyo6e
 LVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J41x529VlTspZMrpThFHJLBr2g65jbs1WO5P40LCen4=;
 b=J3lMgA1DCww+GD5D3H0wMrDzy2GATdgr7zoI4ydCOlZ76eQVUME7hD8zfmDWToYCII
 sCqpGggU1VKdRdJvsKnasE4F0Lr9RnkT1itByJjrh8NccyW2PRLCgKqMqziUGjj37DfZ
 r0WQAxfYA9pU4Y40z6ENFElEc0pwJAVg26KGvplaowXyLgh9lcfe2f5uPiX06+92lxep
 c6EUrH/R19w58dkzZCv4PL+xZ6K7L+k+1XtvzU3COWNmGAC0Tg0SrokqiPskl/O/oR2E
 ujq2YEFDpRRqN/pTslmLA1WRXAH6AlI30LD1e/YB4qfpwpThmrStsSmgFYyKysKSJHUk
 DxZA==
X-Gm-Message-State: AOAM531f5R4w1C1SF4+tM8Q/0BWd7DU2e8jkxZqgNXKXz8QHWsV1bovS
 DOQ5dPNfi6+B3QIpHnKHGFA=
X-Google-Smtp-Source: ABdhPJwqnW4H12JkFByYZki5F25wX7CFl/4OxdrLQBKSJLK7Hp+HrjfGNLOpxwFObeZey6c6a7G84A==
X-Received: by 2002:a2e:a4db:: with SMTP id p27mr29314648ljm.161.1629750244353; 
 Mon, 23 Aug 2021 13:24:04 -0700 (PDT)
Received: from [192.168.2.145] (46-138-120-72.dynamic.spd-mgts.ru.
 [46.138.120.72])
 by smtp.googlemail.com with ESMTPSA id r2sm854722ljj.14.2021.08.23.13.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 13:24:03 -0700 (PDT)
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
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
 <CAPDyKFo0rzHT4AhueWjyz9k2ZqUy8N6Od5pbr8sL_m0Jf2AwUg@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <085d1a2e-57b0-222e-c569-12f3c6bc8161@gmail.com>
Date: Mon, 23 Aug 2021 23:24:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFo0rzHT4AhueWjyz9k2ZqUy8N6Od5pbr8sL_m0Jf2AwUg@mail.gmail.com>
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

20.08.2021 15:57, Ulf Hansson пишет:
...
>> We already have similar APIs, so that won't be a problem. We also have
>> a mechanism inside the OPP core, frequency based, which is used to
>> guess the current OPP. Maybe we can enhance and use that directly
>> here.
> 
> After reading the last reply from Dmitry, I am starting to think that
> the problem he is facing can be described and solved in a much easier
> way.
> 
> If I am correct, it looks like we don't need to add APIs to get OPPs
> for a clock rate or set initial performance state values according to
> the HW in genpd.
> 
> See my other response to Dmitry, let's see where that leads us.

I'm going to start preparing v9 with GENPD performance state syncing moved into driver's probe where appropriate.

It's not clear to me whether it will be okay to add a generic OPP syncing by clock rate or should it be a Tegra-specific helper. Viresh, what do you think about this generic OPP helper:

/**
 * dev_pm_opp_sync_with_clk_rate() - Sync OPP state with clock rate
 * @dev:	device for which we do this operation
 *
 * Sync OPP table state with the current clock rate of device.
 *
 * Return: 0 on success or a negative error value.
 */
int dev_pm_opp_sync_with_clk_rate(struct device *dev)
{
	struct opp_table *opp_table;
	int ret = 0;

	/* Device may not have OPP table */
	opp_table = _find_opp_table(dev);
	if (IS_ERR(opp_table))
		return 0;

	/* Device may not use clock */
	if (IS_ERR(opp_table->clk))
		goto put_table;

	/* Device may have empty OPP table */
	if (!_get_opp_count(opp_table))
		goto put_table;

	ret = dev_pm_opp_set_rate(dev, clk_get_rate(opp_table->clk));
put_table:
	/* Drop reference taken by _find_opp_table() */
	dev_pm_opp_put_opp_table(opp_table);

	return ret;
}
EXPORT_SYMBOL_GPL(dev_pm_opp_sync_with_clk_rate);
