Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A3D3F7223
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 11:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8F56E17B;
	Wed, 25 Aug 2021 09:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DD66E17B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 09:45:04 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id x27so51644671lfu.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 02:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E7cNoLLVAVafjNCc4brMRUN01zZAHm0abXpnMpPuTt4=;
 b=XcByKSJRdga/HRYU9DdYIrJkJ5aCKCn6sFPQhJpp+zqLBFptssdthmbwTTqrJU2O1y
 Fh9T4cOSANuA0NBWqKrxyE6rpE3VUg9YurSVTT9N3ewKp/QELYAgj+C6HkBCJMlVTiOb
 M7DocgSIXf8gWx7DP6hz+XSoX32UueKJZitZdD1fhIKA/N5U6YwHLEpd41Qt4bCHL0G4
 ZtJc+vpaJ07T3DdXx/qHSdSN5QI3+K4IqS5ki+/rdR5v1sPFOYpfj0rw4qkKgMj2ioo3
 hQKDnoVXbW3M/+9DGxJ8r4dLnR6TG4RgZNyl3L7PnWj5GlgkD82og3xcltkjAKoMzhav
 ZUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E7cNoLLVAVafjNCc4brMRUN01zZAHm0abXpnMpPuTt4=;
 b=tQCeortJOtX5qIYlXQvkd5Q/yLRPgJLgkREluk1iNqxXnAiffBN97vSfzqhIordUFZ
 aCBRAf1LXZ7toLr6c981aoBEHs/jLtJsVyL5ZlkJ2A8cwTy0JZVB5v6E4zs5Am2oLl0y
 XrOnDEHQu6zR/ayQykJNzdtR92JRz6WyuwfCCC5cOWRQ3uD+Oc2LlTfPng5HX4Duxuou
 jR/VndMCabPRGZHlZW63OjYO9Il5TuGOdzE0McuGN73vY4NBYezrTJ6DxmLIetI5nu67
 J27nOjUA2K46vBtM+F/egN5esrLYaObYFg5rzk/aSBvwIP3+GhwUDkKiKRBG7CSoexbD
 l87w==
X-Gm-Message-State: AOAM531J7PgW31/pvffGjofyio/qTHHA6fWEQxGvIhmB7C2FhBGEiGqj
 HAmqgQYXkZQlNfgW61yJZNw=
X-Google-Smtp-Source: ABdhPJxxgQwWKc4KlfaiaB2F9L+jo3PpEaZtT5gXKDmMvuZmO5i5+f3TfZJ4xZuLO6DnWagwNOSZkQ==
X-Received: by 2002:a05:6512:3190:: with SMTP id
 i16mr32170681lfe.340.1629884702691; 
 Wed, 25 Aug 2021 02:45:02 -0700 (PDT)
Received: from [192.168.2.145] (94-29-17-251.dynamic.spd-mgts.ru.
 [94.29.17.251])
 by smtp.googlemail.com with ESMTPSA id z13sm2103349ljj.43.2021.08.25.02.45.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 02:45:02 -0700 (PDT)
Subject: Re: [PATCH v8 20/34] mmc: sdhci-tegra: Add runtime PM and OPP support
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
 <20210817012754.8710-21-digetx@gmail.com> <YR6O9Om+HzMMG8AR@orome.fritz.box>
 <05b7ff28-4c01-fb56-deeb-595a5797394b@gmail.com>
 <YR+TgfCHKOPS3Ng8@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5a15647c-bc6a-294d-61c8-91efa33c681e@gmail.com>
Date: Wed, 25 Aug 2021 12:45:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR+TgfCHKOPS3Ng8@orome.fritz.box>
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

20.08.2021 14:35, Thierry Reding пишет:
> On Fri, Aug 20, 2021 at 01:37:13AM +0300, Dmitry Osipenko wrote:
>> 19.08.2021 20:03, Thierry Reding пишет:
>>> On Tue, Aug 17, 2021 at 04:27:40AM +0300, Dmitry Osipenko wrote:
>>>> The SDHCI on Tegra belongs to the core power domain and we're going to
>>>> enable GENPD support for the core domain. Now SDHCI must be resumed using
>>>> runtime PM API in order to initialize the SDHCI power state. The SDHCI
>>>> clock rate must be changed using OPP API that will reconfigure the power
>>>> domain performance state in accordance to the rate. Add runtime PM and OPP
>>>> support to the SDHCI driver.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  drivers/mmc/host/sdhci-tegra.c | 146 ++++++++++++++++++++++++---------
>>>>  1 file changed, 105 insertions(+), 41 deletions(-)
>>>>
>>>> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
>>>> index 387ce9cdbd7c..a3583359c972 100644
>>>> --- a/drivers/mmc/host/sdhci-tegra.c
>>>> +++ b/drivers/mmc/host/sdhci-tegra.c
>>>> @@ -15,6 +15,8 @@
>>>>  #include <linux/of.h>
>>>>  #include <linux/of_device.h>
>>>>  #include <linux/pinctrl/consumer.h>
>>>> +#include <linux/pm_opp.h>
>>>> +#include <linux/pm_runtime.h>
>>>>  #include <linux/regulator/consumer.h>
>>>>  #include <linux/reset.h>
>>>>  #include <linux/mmc/card.h>
>>>> @@ -24,6 +26,8 @@
>>>>  #include <linux/gpio/consumer.h>
>>>>  #include <linux/ktime.h>
>>>>  
>>>> +#include <soc/tegra/common.h>
>>>> +
>>>>  #include "sdhci-pltfm.h"
>>>>  #include "cqhci.h"
>>>>  
>>>> @@ -123,6 +127,12 @@
>>>>  					 SDHCI_TRNS_BLK_CNT_EN | \
>>>>  					 SDHCI_TRNS_DMA)
>>>>  
>>>> +enum {
>>>> +	TEGRA_CLK_BULK_SDHCI,
>>>> +	TEGRA_CLK_BULK_TMCLK,
>>>> +	TEGRA_CLK_BULK_NUM,
>>>> +};
>>>> +
>>>>  struct sdhci_tegra_soc_data {
>>>>  	const struct sdhci_pltfm_data *pdata;
>>>>  	u64 dma_mask;
>>>> @@ -171,6 +181,8 @@ struct sdhci_tegra {
>>>>  	bool enable_hwcq;
>>>>  	unsigned long curr_clk_rate;
>>>>  	u8 tuned_tap_delay;
>>>> +
>>>> +	struct clk_bulk_data clocks[TEGRA_CLK_BULK_NUM];
>>>
>>> This doesn't seem worth it to me. There's a lot of churn in this driver
>>> that's only needed to convert this to the clk_bulk API and it makes the
>>> code a lot more difficult to read, in my opinion.
>>>
>>> It looks like the only benefit that this gives us is that runtime
>>> suspend and resume become a few lines shorter.
>>
>> The driver probe code looks cleaner with that. You should be looking at
>> the final result and not at the patch to see it.
> 
> I did look at the final result and didn't find it cleaner at all. =)

There is UAF bug in this patch that was spotted by kasan. The
sdhci_tegra_soc_data isn't resource-managed, but clk_bulk_data is. I'm
now thinking that it should be okay to keep tmclk always-on, so I'll
replace the bulk clks back with the sdhci clk in v9.
