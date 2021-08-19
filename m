Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612513F22B7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 00:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792D86E904;
	Thu, 19 Aug 2021 22:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0146E8F4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 22:09:50 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id k5so16087612lfu.4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 15:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Djc9fORZaX0jUQ208L1CXmP3iTRD6JSYsA+xYiTuRIM=;
 b=dMU6STbYnm9OflIqSy2qQXqjsJYwl7YMlINi7PykXT2hk4hVpl87FK13Gf1ev8geC3
 K9caemrLnRsk5kMdD8lgWsp4zIB+EXGhHL8lT9qVG+rY9hboNmGWhYzNYfapsyKLHMRr
 BuVLkLyNXbyQV+L42XvasmlaKRmpbZ1esPdEDu7e07tVacSCCkZ69VwjPz7/bcAtO3HY
 MBcCelEAlUxXVzjYivWfZRipGBGcBePWKJgp4sYTzoaLrh6F7gyCw70q5JZvPfAXVxmg
 BBWjfPLtb9tscP8XQdZrCInxEKvKnskPHBdhH1dH2redmXEI+urWw82oLmmmFLtSnzpf
 Bcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Djc9fORZaX0jUQ208L1CXmP3iTRD6JSYsA+xYiTuRIM=;
 b=R8f0JAZuAAAOH+WteY/04j0vmqWr32HUX00HLM4yAQ5C2PKM9osW82/Gqr6rAsyD6X
 QTj/XneuhsWc/Hjc5mXfxwhJjhCwQFgAG+JifJ/aiCua16IJy3kCNL6ZWMj4i/HRdrdR
 MVmulpOExX5/V6j/4kQ+yg2VYtff06tQRrHtgghIT1mRs2IkyLgfLcRrWExWbm4jzWyn
 fRsgTyWwwhuWhFnS2+lBqJAsbzoKWf5nOvyYsOIC8wNcGWVptubPzlk1ewndSEAA6Xjh
 ZnR4LVccfvLCNA0JHxkfM753iqOxa4YmO31+mGxaeDj0iL3lcrcoxDmlnjC3PEUEbFnD
 RoeQ==
X-Gm-Message-State: AOAM532XI5ImTzdwKyVdtUs5UFn+feqSy2tGuudbp+WsLDI0WFIZG37c
 6+jdpBc+BQk76JiOhI7M6xQ=
X-Google-Smtp-Source: ABdhPJxvNxcxk5Wqttm8NgLj2sKnLsuL7sNLBaDY6UpJ6+A1Pob5mT38NwjMtPvD9CLOiEzV59Hqsg==
X-Received: by 2002:a05:6512:3f08:: with SMTP id
 y8mr11381666lfa.221.1629410988761; 
 Thu, 19 Aug 2021 15:09:48 -0700 (PDT)
Received: from [192.168.2.145] (46-138-120-72.dynamic.spd-mgts.ru.
 [46.138.120.72])
 by smtp.googlemail.com with ESMTPSA id z5sm430889lfs.126.2021.08.19.15.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 15:09:48 -0700 (PDT)
Subject: Re: [PATCH v8 07/34] clk: tegra: Support runtime PM and power domain
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
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
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-8-digetx@gmail.com> <YR0UBi/ejy+oF4Hm@orome.fritz.box>
 <da7356cb-05ee-ba84-8a7c-6e69d853a805@gmail.com>
 <YR04YHGEluqLIZeo@orome.fritz.box>
 <ad99db08-4696-1636-5829-5260f93dc681@gmail.com>
 <YR6Mvips3HAntDy0@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e17bbe8d-7c0f-fc3d-03c7-d75c54c24a43@gmail.com>
Date: Fri, 20 Aug 2021 01:09:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR6Mvips3HAntDy0@orome.fritz.box>
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

19.08.2021 19:54, Thierry Reding пишет:
> On Wed, Aug 18, 2021 at 08:11:03PM +0300, Dmitry Osipenko wrote:
>> 18.08.2021 19:42, Thierry Reding пишет:
>>> On Wed, Aug 18, 2021 at 06:05:21PM +0300, Dmitry Osipenko wrote:
>>>> 18.08.2021 17:07, Thierry Reding пишет:
>>>>> On Tue, Aug 17, 2021 at 04:27:27AM +0300, Dmitry Osipenko wrote:
>>>>> [...]
>>>>>> +struct clk *tegra_clk_register(struct clk_hw *hw)
>>>>>> +{
>>>>>> +	struct platform_device *pdev;
>>>>>> +	struct device *dev = NULL;
>>>>>> +	struct device_node *np;
>>>>>> +	const char *dev_name;
>>>>>> +
>>>>>> +	np = tegra_clk_get_of_node(hw);
>>>>>> +
>>>>>> +	if (!of_device_is_available(np))
>>>>>> +		goto put_node;
>>>>>> +
>>>>>> +	dev_name = kasprintf(GFP_KERNEL, "tegra_clk_%s", hw->init->name);
>>>>>> +	if (!dev_name)
>>>>>> +		goto put_node;
>>>>>> +
>>>>>> +	pdev = of_platform_device_create(np, dev_name, NULL);
>>>>>> +	if (!pdev) {
>>>>>> +		pr_err("%s: failed to create device for %pOF\n", __func__, np);
>>>>>> +		kfree(dev_name);
>>>>>> +		goto put_node;
>>>>>> +	}
>>>>>> +
>>>>>> +	dev = &pdev->dev;
>>>>>> +	pm_runtime_enable(dev);
>>>>>> +put_node:
>>>>>> +	of_node_put(np);
>>>>>> +
>>>>>> +	return clk_register(dev, hw);
>>>>>> +}
>>>>>
>>>>> This looks wrong. Why do we need struct platform_device objects for each
>>>>> of these clocks? That's going to be a massive amount of platform devices
>>>>> and they will completely mess up sysfs.
>>>>
>>>> RPM works with a device. It's not a massive amount of devices, it's one
>>>> device for T20 and four devices for T30.
>>>
>>> I'm still not sure I understand why we need to call RPM functions on a
>>> clock. And even if they are few, it seems wrong to make these platform
>>> devices.
>>
>> Before clock is enabled, we need to raise core voltage. After clock is
>> disabled, the voltage should be dropped. CCF+RPM takes care of handling
>> this for us.
> 
> That's the part that I do understand. What I don't understand is why a
> clock needs to be runtime suspend/resumed. Typically we suspend/resume
> devices, and doing so typically involves disabling/enabling clocks. So
> I don't understand why the clocks themselves now need to be runtime
> suspended/resumed.

CCF provides RPM management for a device that backs clock. When clock is enabled, it resumes the backing device.

RPM, GENPD and OPP frameworks work with a device. We use all these frameworks here. Since we don't have a dedicated device for a PLL clock, we need to create it in order to leverage the existing generic kernel APIs.

In this case clocks are not runtime suspended/resumed, the device which backs clock is suspended/resumed.

>>> Perhaps they can be simple struct device:s instead? Ideally they would
>>> also be parented to the CAR so that they appear in the right place in
>>> the sysfs hierarchy.
>>
>> Could you please clarify what do you mean by 'simple struct device:s'?
>> These clock devices should be OF devices with a of_node and etc,
>> otherwise we can't use OPP framework.
> 
> Perhaps I misunderstand the goal of the OPP framework. My understanding
> was that this was to attach a table of operating points with a device so
> that appropriate operating points could be selected and switched to when
> the workload changes.
> 
> Typically these operating points would be roughly a clock rate and a
> corresponding voltage for a regulator, so that when a certain clock rate
> is requested, the regulator can be set to the matching voltage.
> 
> Hm... so is it that each of these clocks that you want to create a
> platform device for has its own regulator? Because the patch series only
> mentions the CORE domain, so I assumed that we would accumulate all the
> clock rates for the clocks that are part of that CORE domain and then
> derive a voltage to be supplied to that CORE domain.
> 
> But perhaps I just don't understand correctly how this is tied together.

We don't use regulators, we use power domain that controls regulator. GENPD takes care of accumulating performance requests on a per-device basis.

I'm creating platform device for the clocks that require DVFS. These clocks don't use regulator, they are attached to the CORE domain. GENPD framework manages the performance state, aggregating perf votes from each device, i.e. from each clock individually.

You want to reinvent another layer of aggregation on top of GENPD. This doesn't worth the effort, we won't get anything from it, it should be a lot of extra complexity for nothing. We will also lose from it because pm_genpd_summary won't show you a per-device info.

domain                          status          children                           performance
    /device                                             runtime status
----------------------------------------------------------------------------------------------
heg                             on                                                 1000000
    /devices/soc0/50000000.host1x                       active                     1000000
    /devices/soc0/50000000.host1x/54140000.gr2d         suspended                  0
mpe                             off-0                                              0
vdec                            off-0                                              0
    /devices/soc0/6001a000.vde                          suspended                  0
venc                            off-0                                              0
3d1                             off-0                                              0
    /devices/genpd:1:54180000.gr3d                      suspended                  0
3d0                             off-0                                              0
    /devices/genpd:0:54180000.gr3d                      suspended                  0
core-domain                     on                                                 1000000
                                                3d0, 3d1, venc, vdec, mpe, heg
    /devices/soc0/7d000000.usb                          active                     1000000
    /devices/soc0/78000400.mmc                          active                     950000
    /devices/soc0/7000f400.memory-controller            unsupported                1000000
    /devices/soc0/7000a000.pwm                          active                     1000000
    /devices/soc0/60006000.clock/tegra_clk_pll_c        active                     1000000
    /devices/soc0/60006000.clock/tegra_clk_pll_e        suspended                  0
    /devices/soc0/60006000.clock/tegra_clk_pll_m        active                     1000000
    /devices/soc0/60006000.clock/tegra_clk_sclk         active                     1000000


>> We don't have driver for CAR to bind. I guess we could try to add a
>> 'dummy' CAR driver that will create sub-devices for the rpm-clocks, is
>> this what you're wanting?
> 
> I got confused by the "tegra-clock" driver that this series was adding.
> This is actually a driver that will bind to the virtual clocks rather
> than the CAR device itself.
> 
> For some reason I had assumed that you wanted to create a CAR driver in
> order to get at the struct device embedded in the CAR's platform device
> and use that as the parent for all these clocks.
> 
> So even if we absolutely need some struct device for these clocks, maybe
> adding that CAR driver and making the clock struct device:s children of
> the CAR device will help keep a bit of a proper hierarchy in sysfs.

Alright, that's easy to do. We will have to move out some clk data out of __init then. I already implemented it as you may see in the above PD summary.
