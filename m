Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD893F0773
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 17:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B0A6E83C;
	Wed, 18 Aug 2021 15:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6006E83C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 15:05:25 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id c12so5694028ljr.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 08:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aGlCEyRQuTJeUoFwcMyBmvkG6HpGwGhkMF7tidyqkMk=;
 b=M87kjRAMcB8Ej6Q47lM0GYR3alWgY77tCbHd5VPt6/26s7KfdIel+RPo8tLBJ6OQC2
 kr0n4etJEbLpDf9MoZDAFN0QTsHd+9gPEMCmWM5ksKOEgb0AKvQNx3IO3PGUQ/dcG7JN
 O4q2B857vNsGgJAGFJfaf6qa2P3p02g7vMkro/0jkPEf80W+ZLE1qQc8dd9G7bfj3v+G
 QFGCPxYHx/jnAv8b2MO3kLO+ZhZTQeVsJrlw097wwbOioFBgVb4eF6Y3P5jrwoLdljs1
 UUf2sDSOV8KkpdFpAiT6PQOqUxxHhBCgd+5wUmfl+PSKIJaF6Ar2cNQGwh8AeZy87Vkj
 1qkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aGlCEyRQuTJeUoFwcMyBmvkG6HpGwGhkMF7tidyqkMk=;
 b=OOZjkQTsBvu7HaPo5Z+YzqrQd8SiqGE4zBHqsUwrgokMyO3+JTqFt2xKAA1PnZOOKx
 4tl0JUzlg+LOJHGHco1UKdYTKuBlFOSLuUvJoceXTqi1d0+K0EsNxeOoMoTSbyd4BCg+
 lnb+0wUQFLCZz14weUHF/igpRUmbhUHoyzEdyUxOCsIqdtR6dgdt3t+QfEHMx7FN4NEV
 0kM0lYIFlg1UFQEfMYUg/CXokJnDwQj4AkyhT1tQgClNVIPc8WOZ4pp7h8xVSZBUquoZ
 CJLKNQNdM1W4Ne72wLU2dnp06zc0VQ0JlgFSTXO7nek9NrZlnx+Gjs9mEFtNTgl1KTW+
 yuyQ==
X-Gm-Message-State: AOAM530aPSwF/t2QHuzMe72KgfzGcJeBJPBElUSTyOjQdzTDJzuN/2jq
 zyo9wnCNsr06MAqVwVfXzUM=
X-Google-Smtp-Source: ABdhPJzgPx8keOi8/DQzO3f7iOHun/vyL+e/2XSDlGREgL/XxAZF1WVrIsIMO5qrsaQBfPOBnrljWQ==
X-Received: by 2002:a2e:87d0:: with SMTP id v16mr8420209ljj.30.1629299123582; 
 Wed, 18 Aug 2021 08:05:23 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id h22sm11140ljk.133.2021.08.18.08.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 08:05:23 -0700 (PDT)
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
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <da7356cb-05ee-ba84-8a7c-6e69d853a805@gmail.com>
Date: Wed, 18 Aug 2021 18:05:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR0UBi/ejy+oF4Hm@orome.fritz.box>
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

18.08.2021 17:07, Thierry Reding пишет:
> On Tue, Aug 17, 2021 at 04:27:27AM +0300, Dmitry Osipenko wrote:
> [...]
>> +struct clk *tegra_clk_register(struct clk_hw *hw)
>> +{
>> +	struct platform_device *pdev;
>> +	struct device *dev = NULL;
>> +	struct device_node *np;
>> +	const char *dev_name;
>> +
>> +	np = tegra_clk_get_of_node(hw);
>> +
>> +	if (!of_device_is_available(np))
>> +		goto put_node;
>> +
>> +	dev_name = kasprintf(GFP_KERNEL, "tegra_clk_%s", hw->init->name);
>> +	if (!dev_name)
>> +		goto put_node;
>> +
>> +	pdev = of_platform_device_create(np, dev_name, NULL);
>> +	if (!pdev) {
>> +		pr_err("%s: failed to create device for %pOF\n", __func__, np);
>> +		kfree(dev_name);
>> +		goto put_node;
>> +	}
>> +
>> +	dev = &pdev->dev;
>> +	pm_runtime_enable(dev);
>> +put_node:
>> +	of_node_put(np);
>> +
>> +	return clk_register(dev, hw);
>> +}
> 
> This looks wrong. Why do we need struct platform_device objects for each
> of these clocks? That's going to be a massive amount of platform devices
> and they will completely mess up sysfs.

RPM works with a device. It's not a massive amount of devices, it's one
device for T20 and four devices for T30.
