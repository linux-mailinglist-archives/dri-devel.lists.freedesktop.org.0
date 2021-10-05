Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8544233B0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 00:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572816E466;
	Tue,  5 Oct 2021 22:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702D26E466
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 22:43:23 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id i24so2068143lfj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 15:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QG+ghKl7BYypZZjDut6dTGHyiOgVAsyM1BWUZUWMu5U=;
 b=Hd/Hgnl41abY2ut8awTV9Znfi0+mLbBx9rjGKMvBmv1GvhO4shIY8zKBANOfUfey6t
 f5Ia/T7DT6465kZqrrXQThtz+C/Dyv3WwmTVE2S1/knhHJ2ZkcQGMJbpA7lJW8S92LV6
 d4sMrDbdjRQ26EUeegNXhFT6soeFLf+BrXj5mPF3K+E6tl1/jGMbmKZnQ0VlaBRfoOWR
 LuKoByxkOGkGhSjkSGOlHwyrskSGBdkV8ouXlaDVeZDQXkFs5OsF+2lgPEibKvUXARwq
 QkljhBPkuFryLkM004napUFJxFdOqOTZNrXbWHEUeRQ3+onIjoSJKZ6XnhXG+LemKrOd
 A8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QG+ghKl7BYypZZjDut6dTGHyiOgVAsyM1BWUZUWMu5U=;
 b=eA0X6i0PjXoTF9rJxuQC1TEZMoTvI9L1ZCHL+Q5xHlJkCyWASmNf2rLcuUpwuj8a33
 kzjOc+qDdYEwPeuKU2RE0xEJeHWQwBC+TXVCxGj4zWJ3TSBffvIoOPkMkSw+8UHMZhOa
 3E7Zjv95HLSMxll41wbvNT/l1D0OiYsVx5WGUjhuIxSs1/eiFLG9rIcVkreoGMLdYb1J
 3qlwR9H9FPsq+YP53nJ6E1GjQ9J070ZzGX4Svvaw+BMg898AULV0FkQliDlbpN+YKcQx
 xFwrnlWBGJEjsYfC3uypypt62MjWeYJ0QhGFrhKAthlrBGxYYZbaPD53omCT55KRm0is
 lLyw==
X-Gm-Message-State: AOAM531nX2ANukzscMSmij9zfoIpsyDdMv194UcyzILjvcNhtaE8D2Gy
 gr62rAvkI318eDb26VPoV3k=
X-Google-Smtp-Source: ABdhPJxfNs4Gfg7N3fvFBrC2l/U9ZmVjgRHnpJ3ajA7WdQF4gcWUZ5S7J4URL5OZbbHW8d5K2gyE2g==
X-Received: by 2002:a2e:743:: with SMTP id i3mr24366437ljd.250.1633473801726; 
 Tue, 05 Oct 2021 15:43:21 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru.
 [79.139.163.57])
 by smtp.googlemail.com with ESMTPSA id q30sm2086817lfb.108.2021.10.05.15.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 15:43:21 -0700 (PDT)
Subject: Re: [PATCH v13 06/35] clk: tegra: Support runtime PM and power domain
From: Dmitry Osipenko <digetx@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>, linux-staging@lists.linux.dev,
 linux-pwm@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
References: <20210926224058.1252-1-digetx@gmail.com>
 <20210926224058.1252-7-digetx@gmail.com>
 <CAPDyKFq+LS4Jr1GyC-a-tGWPzGH0JxfJ9wKY=uQEBGYm952azw@mail.gmail.com>
 <24101cd6-d3f5-1e74-db39-145ecd30418b@gmail.com>
 <CAPDyKFreK7976PJL-1zySoza_yXM7rMQ64aODWUZ+U3L-uCa0w@mail.gmail.com>
 <4bdba8a2-4b9b-ed7d-e6ca-9218d8200a85@gmail.com>
Message-ID: <74a47158-e2e4-5fd0-3f37-0b50d4ead4d9@gmail.com>
Date: Wed, 6 Oct 2021 01:43:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4bdba8a2-4b9b-ed7d-e6ca-9218d8200a85@gmail.com>
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

06.10.2021 01:19, Dmitry Osipenko пишет:
...
> I reproduced the OFF problem by removing the clk prepare/unprepare from
> the suspend/resume of the clk driver and making some extra changes to
> clock tree topology and etc to trigger the problem on Nexus 7.
> 
> tegra-pmc 7000e400.pmc: failed to turn off PM domain heg: -13
> 
> It happens from genpd_suspend_noirq() -> tegra_genpd_power_off() -> clk
> -> GENPD -> I2C -> runtime-pm.
> 
> -13 is EACCES, it comes from the runtime PM of I2C device. RPM is
> prohibited/disabled during late (NOIRQ) suspend by the drivers core.

My bad, I double-checked and it's not I2C RPM that is failing now, but
the clock's RPM [1], which is also unavailable during NOIRQ.

[1]
https://elixir.free-electrons.com/linux/v5.15-rc4/source/drivers/clk/clk.c#L116

Previously it was I2C RPM that was failing in a similar way, but code
changed a tad since that time.
