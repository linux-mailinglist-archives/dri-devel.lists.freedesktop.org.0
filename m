Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8342C3F3BDB
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 19:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE87C6EB80;
	Sat, 21 Aug 2021 17:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8436EB80
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Aug 2021 17:45:59 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id g13so27662634lfj.12
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Aug 2021 10:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IUNZGcwEvLiT98uruvqOHnHGgaNyFWtPLETI2dPthCw=;
 b=p08OD/GPPXR4tm7RkNA9toKvQsVUl8L8J4oVZmC67OE0wZNQVqTaUco2HrwrnDiQ5w
 YuB7XIX+XHBkQHFFdAzLyF2BxZCm+jSnFq4FsCUAM2T1sDn/9oxf4t2nPY94dg8ZOy02
 4ifXdf59PODf4caGN1F1ErdH+dIo7YXjnB5cY+HfdftEYqOCt2+nTokc6UD388Ko2qxo
 MvhYOSvGDT1/FsQM/l16oRX1i1OGSNP7dXhT5bdzGaUHSnydnyQWWVAxmDtcpnGU6hl9
 akWPj9WfjbxtYLM0nKZbQdHyelXHGLCzov3c1u9xeUbYJI6bez6nJO7fiBHU51tlE3bJ
 Ui+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IUNZGcwEvLiT98uruvqOHnHGgaNyFWtPLETI2dPthCw=;
 b=sDZ6m5UQtcWJsu+xyucrddcJiNV6LxOEcfbblogNzoPWekXgfg3addrtVA6388lgvN
 OxyWVF3aEtdqgCWPAKBN+qAgjMl+Wv4pZLmaVq0Vaz77IZaIryG8HPUDLD6xEFf2RXdO
 JhC++shxXOscpHom7tOsnRVh5+d5cs2GdU4IR/eOzSymm8NQ4M+AdTqYeQja4QC93Pe8
 s3MDgSYAnRpQcNX8lVOGh5+6chgIzmoHEaqkskiltVCT02phTUUEINciz3qBBnV9hh9m
 HFo9SIppRiJO+bRrUeUbqMyCHFOUHRGe0EK8Ug4zSF+JpGoTNcLykYdFfr73/1wj6xKI
 EDSA==
X-Gm-Message-State: AOAM531OmihYQbI3y7g+GVN1ZjJ7mWP2aHtXexAibaM1bUvrFu2m6oHC
 5hzrNpDoYRr7iH9P2uT7v38=
X-Google-Smtp-Source: ABdhPJwQTUwfeBc8x+Qc/XgoFvNgZwRj7DA1ImLYu2aN3NoNJ/vJapVfLwS/Dwin1R3kajnXi5wLGA==
X-Received: by 2002:ac2:4839:: with SMTP id 25mr19053893lft.455.1629567957530; 
 Sat, 21 Aug 2021 10:45:57 -0700 (PDT)
Received: from [192.168.2.145] (46-138-120-72.dynamic.spd-mgts.ru.
 [46.138.120.72])
 by smtp.googlemail.com with ESMTPSA id e19sm868158ljj.28.2021.08.21.10.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Aug 2021 10:45:56 -0700 (PDT)
Subject: Re: [PATCH v8 07/34] clk: tegra: Support runtime PM and power domain
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Viresh Kumar
 <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Peter Chen <peter.chen@kernel.org>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
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
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-8-digetx@gmail.com> <YR0UBi/ejy+oF4Hm@orome.fritz.box>
 <da7356cb-05ee-ba84-8a7c-6e69d853a805@gmail.com>
 <YR04YHGEluqLIZeo@orome.fritz.box>
 <ad99db08-4696-1636-5829-5260f93dc681@gmail.com>
 <YR6Mvips3HAntDy0@orome.fritz.box>
 <e17bbe8d-7c0f-fc3d-03c7-d75c54c24a43@gmail.com>
 <YR+VDZzTihmpENp6@orome.fritz.box>
 <CAPDyKFpJ+TK0w1GZEA7G=rtAjq5ipmVR4P0wy7uHiEGVWRk5yA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <89ea1694-be9e-7654-abeb-22de0ca5255a@gmail.com>
Date: Sat, 21 Aug 2021 20:45:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFpJ+TK0w1GZEA7G=rtAjq5ipmVR4P0wy7uHiEGVWRk5yA@mail.gmail.com>
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

20.08.2021 16:08, Ulf Hansson пишет:
...
>> I suppose if there's really no good way of doing this other than
>> providing a struct device, then so be it. I think the cleaned up sysfs
>> shown in the summary above looks much better than what the original
>> would've looked like.
>>
>> Perhaps an additional tweak to that would be to not create platform
>> devices. Instead, just create struct device. Those really have
>> everything you need (.of_node, and can be used with RPM and GENPD). As I
>> mentioned earlier, platform device implies a CPU-memory-mapped bus,
>> which this clearly isn't. It's kind of a separate "bus" if you want, so
>> just using struct device directly seems more appropriate.
> 
> Just a heads up. If you don't use a platform device or have a driver
> associated with it for probing, you need to manage the attachment to
> genpd yourself. That means calling one of the dev_pm_domain_attach*()
> APIs, but that's perfectly fine, ofcourse.
> 
>>
>> We did something similar for XUSB pads, see drivers/phy/tegra/xusb.[ch]
>> for an example of how that was done. I think you can do something
>> similar here.

We need a platform device because we have a platform device driver that
must be bound to the device, otherwise PMC driver state won't be synced
since it it's synced after all drivers of devices that reference PMC
node in DT are probed.
