Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2780A4235ED
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 04:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E276ECBC;
	Wed,  6 Oct 2021 02:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632126ECBC
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 02:40:06 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id n8so3945295lfk.6
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 19:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jBjl2SKIDUWdGGNNCdNQzm0sXvagxduES6I98oCU5Y8=;
 b=chv8eTFsLZvhIeL+hkzvYI0WTv6C1hQt4IbTe+2xmGQkTHoN3MvZ0Jtjaf5nJ60yH8
 Qll610va/L7nfzXyHi9q5H18Ow+SshG+eVNj+gSdDfOq3y7RXIcXU17IFSrdKUsqMGDl
 Bns94mjB430lIX1L+jpyb63pJy7SuBLUq2Zz5gUmkoa+ld9TdVOzDhd/itLWhWEQUYh6
 w/ij/t35/Agn1d9bEjw9KP0FJwCJbX0TIcoQQ9rohRXEEbOoZw69in/qeyGnWiJ4R/RF
 +DxmiKiv3q4SpB4Czd0/XkoQ7itREY7Ra4KeHWPZGr13fZLG2O0bWXrsMD3HPPH5buvd
 Yn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jBjl2SKIDUWdGGNNCdNQzm0sXvagxduES6I98oCU5Y8=;
 b=EQLd95KFEiaNjZbfVRjUtzFOHaW3p5moTbJKNNSej96rV3urNhVPpPkPkhd5BqC9Sy
 uWqXnhth3W5qeecL3z5FMeJC1JtNynDbIoqakAJ6xZkeuZYJHpZcnIGYFJNfLKcJFGzS
 bXNLsRppL4xRW8Gk/u/+jG9aK9Hj3dVoQbNwiblxEnzdC6HcyHDr1sfKMz2s9CLEqS7j
 /AqGXZZ4wa/ZPxVgrsscAePVds9fxUoQkXmuUa7YeG247eFejjOJduVX643RyL4rLIvT
 7cx9f7THVOnvrIr31XFQ2jUK8Rf7V5vvK+Sh9Ok/O4VbtFHhVp4bfPYfvHLShaqOcQqr
 m5uA==
X-Gm-Message-State: AOAM530aSRjH7qjfcgLwoNzk1ZjfCMGQquHHnzKKpCtxocbFLzgIZ0Ex
 XXxLMFNscgYQ5Mj0ci4fSHA=
X-Google-Smtp-Source: ABdhPJz5nDf5e1lLckhTPfcq8ws67JWhBNrPmg70PycmaRWuWT397hKxpbU2YgDLYDLc8supNRztWA==
X-Received: by 2002:a2e:91d4:: with SMTP id u20mr25686467ljg.81.1633488004426; 
 Tue, 05 Oct 2021 19:40:04 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru.
 [79.139.163.57])
 by smtp.googlemail.com with ESMTPSA id o19sm2137695lfg.68.2021.10.05.19.40.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 19:40:03 -0700 (PDT)
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
 <74a47158-e2e4-5fd0-3f37-0b50d4ead4d9@gmail.com>
Message-ID: <8597d539-311b-4f04-481c-b48e6a5a882a@gmail.com>
Date: Wed, 6 Oct 2021 05:40:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <74a47158-e2e4-5fd0-3f37-0b50d4ead4d9@gmail.com>
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

06.10.2021 01:43, Dmitry Osipenko пишет:
> 06.10.2021 01:19, Dmitry Osipenko пишет:
> ...
>> I reproduced the OFF problem by removing the clk prepare/unprepare from
>> the suspend/resume of the clk driver and making some extra changes to
>> clock tree topology and etc to trigger the problem on Nexus 7.
>>
>> tegra-pmc 7000e400.pmc: failed to turn off PM domain heg: -13
>>
>> It happens from genpd_suspend_noirq() -> tegra_genpd_power_off() -> clk
>> -> GENPD -> I2C -> runtime-pm.
>>
>> -13 is EACCES, it comes from the runtime PM of I2C device. RPM is
>> prohibited/disabled during late (NOIRQ) suspend by the drivers core.
> 
> My bad, I double-checked and it's not I2C RPM that is failing now, but
> the clock's RPM [1], which is also unavailable during NOIRQ.
> 
> [1]
> https://elixir.free-electrons.com/linux/v5.15-rc4/source/drivers/clk/clk.c#L116
> 
> Previously it was I2C RPM that was failing in a similar way, but code
> changed a tad since that time.
> 

Just in case, I checked that the suspension order isn't somehow the
source of the problem by adding links to device tree in order to always
suspend clocks after the rest of devices and still GENPD gets -EACCESS
from clk_pm_runtime_get().

RPM is disabled by dpm_suspend_late(), which is invoked before
dpm_suspend_noirq() [1]. Hence RPM is unavailable in NOIRQ phase in any
case.

[1]
https://elixir.bootlin.com/linux/v5.15-rc4/source/kernel/power/suspend.c#L399
