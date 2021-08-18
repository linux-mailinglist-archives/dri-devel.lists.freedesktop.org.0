Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4AB3F0891
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 17:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873A16E853;
	Wed, 18 Aug 2021 15:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAB66E852
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 15:55:25 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id n6so5927275ljp.9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 08:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FDEHOwK/tV+p4BwibJ2eZxjOpc4MiqVcjf+8RCPnl/I=;
 b=H0RQfIKG86hjucXIS4WiNewr/HEa0soca6FW/SoC/rnEEopBHfFKy8EBd0pGQounk/
 Oq9/0nUk373C3fZI609KQfoxLIlCX33VL4jD/UoSCTP1jNz94LT73hGlRg0OGe2pZPMl
 Oibirrv4BUfG5Z6A9XvafJxus+f47S5hMtsDMR0PfSid8tbadkJELX8svkntbABSkpcD
 RimCcpLAmvdux+9g7Wlco/fYko0MP+hTZL/CMoVJHvmpnxNhBGRdHEtQ4ME9XbOrtsOg
 Ou9Bf0Prbo4kHm9SvJmQDHot8vFIRpjN5c2/oXbQGbbtlY4/TvTgQHm5WSs8SXzEzrL/
 q0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FDEHOwK/tV+p4BwibJ2eZxjOpc4MiqVcjf+8RCPnl/I=;
 b=qn/UyYK8sVX/qXpKF/Lbvc6RGeH7aAA105HmswOy63oBU6Icfp2Yf00g++VtJkYgjA
 n7WJYk5j4sWgPJbopwnqsCDTTiBfIxy/SSlk9JhY2wudCoYdG8QEuEMm9QsLO6pvvBFL
 XFUt57cSXMDGoRTXs1tSmablQ2DpQt4e7wn8crOeBprTx4d5+n94O9ORFFuFyLaH3etp
 73O7+/4gLqGdaTutyGDoJ7DGXoMWDRyxx8ayjdGrL7DiRph1gNTKPoeDxGzOCa/NLmXi
 jDHw2Ug9Ui7BEmDJrDUSvnGFS5tyE1n8vhrcVZ9fQLOVkbNBH2so9amY2DndrderX2RY
 vZkQ==
X-Gm-Message-State: AOAM5300LFwRKIYsRl9cFfx+DG2qB6MXxQk7dLsmqYFRZUU8NRNz72ax
 evppXqoD/mbMm+SnvLK+uF0=
X-Google-Smtp-Source: ABdhPJwH2B3VgRzJIvI+pIkKDsVXz6Nb3IHX68qBDgW7hPMqkLurd3vlILu0yEDQld58r5qYiUr6VQ==
X-Received: by 2002:a2e:300a:: with SMTP id w10mr8608460ljw.510.1629302124200; 
 Wed, 18 Aug 2021 08:55:24 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id y8sm7917lfh.249.2021.08.18.08.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 08:55:23 -0700 (PDT)
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
References: <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f1314a47-9e8b-58e1-7c3f-0afb1ec8e70a@gmail.com>
Date: Wed, 18 Aug 2021 18:55:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
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

18.08.2021 12:41, Ulf Hansson пишет:
> On Wed, 18 Aug 2021 at 11:14, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>
>> On 18-08-21, 10:29, Ulf Hansson wrote:
>>> Me and Dmitry discussed adding a new genpd callback for this. I agreed
>>> that it seems like a reasonable thing to add, if he insists.

Either way gives the equal result. The new callback allows to remove the
boilerplate dev_pm_opp_set_rate(clk_get_rate() code from the rpm-resume
of consumer devices, that's it.

>>> The intent was to invoke the new callback from __genpd_dev_pm_attach()
>>> when the device has been attached to its genpd. This allows the
>>> callback, to invoke clk_get_rate() and then dev_pm_opp_set_rate(), to
>>> update the vote according to the current state of the HW.
>>
>> I wouldn't call dev_pm_opp_set_rate() from there, since it means
>> configure and enable (both) for different resources, clk, regulator,
>> genpd, etc..
> 
> Right, good point!
> 
> dev_pm_opp_set_rate() is best called from consumer drivers, as they
> need to be in control.
>> What we need here is just configure. So something like this then:
The intent wasn't to use dev_pm_opp_set_rate() from
__genpd_dev_pm_attach(), but to set genpd->rpm_pstate in accordance to
the h/w configuration.

On Tegra we have a chain of PDs and it's not trivial to convert the
device's OPP into pstate because only the parent domain can translate
the required OPP.

Viresh, please take a look at what I did in [1]. Maybe it could be done
in another way.

[1]
https://patchwork.ozlabs.org/project/linux-tegra/patch/20210701232728.23591-3-digetx@gmail.com/
