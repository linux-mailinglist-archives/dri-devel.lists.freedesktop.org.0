Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5503F083B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 17:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3736E830;
	Wed, 18 Aug 2021 15:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C12F6E830
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 15:43:12 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id y6so5930530lje.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 08:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lIuMFp8lfdAxjvsE4KV5hsgygseTRFOfUkeg317UTqw=;
 b=dtxLX4b5qLF8zJg4U/tH1i5TLkCJQlLRGlM2ztQHxAxkEicBA3GgWrdEZtc+2qzQQ0
 6a8pb1OUyJBXSSUlTK4EwMpTqT1ojblCSfASZ95zK5PrbpQsC7mdRTU1//Ez3cWcrBRe
 Iq/odKvRlhN3wJQDN8V8dZOm8Clfju/bJu1hebRScB6VdPRLcb8AsNEhaoe5Nz2Fcb7V
 xDRyCCAdBrHHixEpfT3gLjONzBy264Yfv49IIXx4JnjGiqPrqldsrBs6YegkW2URPTvj
 GDyCPXiG3rcBxKDlskFp0j+TcRhfWoCzYU6QHjIUcKA7TczgiZtN0vnVaED8i1VKeTlS
 ny2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lIuMFp8lfdAxjvsE4KV5hsgygseTRFOfUkeg317UTqw=;
 b=Pue5ptU4dcLo6QTzlhKIzvy3hzPY9Zcw9pY72bWXgN5TVU/m0NxdGXUT4qc+KGMPIt
 EgyTlwH/G4ikj2FEZZ8n/hUpvKSUvgLcecaU9Goh43T4NDy8DsK658RCNxvPfJf4dnSw
 NQV/MNo8gUDukSaGx/VYEcQfy7U25uZA6QsLYZTwRlVjV9MG+Zqnhh9u6x1JnCJbeGQO
 sld7R5LaTka+L4hZZ9pllFPbWnJHjhXxKdeJyn12Tfx8trwPJcmhtHbgshzE0qBQHSQ5
 ZDJOl1KrFCezNvyVtzvlVJ51NlFPDhezUsgR/8RFB+Hml18s8VrgxB8neVlqSnIsxKVE
 MPfQ==
X-Gm-Message-State: AOAM531EHmC2YosMk6tNSzXVjymjfT5jTJxyO/V2FPzOMnthT8nZvKyO
 39XlLfrv1/i6f8d/KfOUvUc=
X-Google-Smtp-Source: ABdhPJxHinOU9QfMFxcyBQEWGYvz/BOpXsNrwiitYcP2iJAqNtbW+KnNJW82u2bMuO8HNcWCppaSuQ==
X-Received: by 2002:a2e:8008:: with SMTP id j8mr8242690ljg.233.1629301390791; 
 Wed, 18 Aug 2021 08:43:10 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id d20sm6145lfs.155.2021.08.18.08.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 08:43:10 -0700 (PDT)
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
References: <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <20210818095044.e2ntsm45h5cddk7s@vireshk-i7>
 <CAPDyKFrFF00xGDWPCQnPwF0_QkG4TB2UqggpuBpp8LY_CMKP-A@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0354acbe-d856-4040-f453-8e8164102045@gmail.com>
Date: Wed, 18 Aug 2021 18:43:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFrFF00xGDWPCQnPwF0_QkG4TB2UqggpuBpp8LY_CMKP-A@mail.gmail.com>
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

18.08.2021 13:08, Ulf Hansson пишет:
> On Wed, 18 Aug 2021 at 11:50, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>
>> On 18-08-21, 11:41, Ulf Hansson wrote:
>>> On Wed, 18 Aug 2021 at 11:14, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>>> What we need here is just configure. So something like this then:
>>>>
>>>> - genpd->get_performance_state()
>>>>   -> dev_pm_opp_get_current_opp() //New API
>>>>   -> dev_pm_genpd_set_performance_state(dev, current_opp->pstate);
>>>>
>>>> This can be done just once from probe() then.
>>>
>>> How would dev_pm_opp_get_current_opp() work? Do you have a suggestion?
>>
>> The opp core already has a way of finding current OPP, that's what
>> Dmitry is trying to use here. It finds it using clk_get_rate(), if
>> that is zero, it picks the lowest freq possible.
>>
>>> I am sure I understand the problem. When a device is getting probed,
>>> it needs to consume power, how else can the corresponding driver
>>> successfully probe it?
>>
>> Dmitry can answer that better, but a device doesn't necessarily need
>> to consume energy in probe. It can consume bus clock, like APB we
>> have, but the more energy consuming stuff can be left disabled until
>> the time a user comes up. Probe will just end up registering the
>> driver and initializing it.
> 
> That's perfectly fine, as then it's likely that it won't vote for an
> OPP, but can postpone that as well.
> 
> Perhaps the problem is rather that the HW may already carry a non-zero
> vote made from a bootloader. If the consumer driver tries to clear
> that vote (calling dev_pm_opp_set_rate(dev, 0), for example), it would
> still not lead to any updates of the performance state in genpd,
> because genpd internally has initialized the performance-state to
> zero.

We don't need to discover internal SoC devices because we use
device-tree on ARM. For most devices power isn't required at a probe
time because probe function doesn't touch h/w at all, thus devices are
left in suspended state after probe.

We have three components comprising PM on Tegra:

1. Power gate
2. Clock state
3. Voltage state

GENPD on/off represents the 'power gate'.

Clock and reset are controlled by device drivers using clk and rst APIs.

Voltage state is represented by GENPD's performance level.

GENPD core assumes that at a first rpm-resume of a consumer device, its
genpd_performance=0. Not true for Tegra because h/w of the device is
preconfigured to a non-zero perf level initially, h/w may not support
zero level at all.

GENPD core assumes that consumer devices can work at any performance
level. Not true for Tegra because voltage needs to be set in accordance
to the clock rate before clock is enabled, otherwise h/w won't work
properly, perhaps clock may be unstable or h/w won't be latching.

Performance level should be set to 0 while device is suspended.
Performance level needs to be bumped on rpm-resume of a device in
accordance to h/w state before hardware is enabled.
