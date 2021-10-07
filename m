Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 547A142512C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 12:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E556F3F3;
	Thu,  7 Oct 2021 10:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278EC6F3F3
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 10:36:43 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id t9so22604578lfd.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Oct 2021 03:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ykOpkcPay17tN46aJsTbBt/EvOAhIOt9Ph+3e4w9jz0=;
 b=afTh3cKAR41VV1PzE4qeHfwMWxfp0/pcOp3Da/PudAOrW+6HBuKX/lfLd/NzTKwNma
 ufMSpUrFcOojZcWaNgGv/bI92xdz4jP055eLah+Isfxcq9LZlZV+5o92WFw3nhfNIg8b
 03bp6aqODY9zL3GDYaXmZzLqH18tsLd3UGA6I028Q9FYLwMrPtUMobVZldWX5ovYkl/B
 oo9VaiP6FWirRUX6Y9X3ZVnPRAS6CDzQxIR2EGXUbTMdVa0/YNXVWMQ1SAgebOktiGWK
 Pk8o3odzNbqyAuC2/RW72o9N5r/lduG7vF09Bj9DjozW/EkST+ugoVGToScUwpVWnDFo
 Plkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ykOpkcPay17tN46aJsTbBt/EvOAhIOt9Ph+3e4w9jz0=;
 b=qk+MB18VqjIUGMzohd+zuHIiEFeBApUktOtMtUxjpLWhPL5fR4/hA6Mv+kpWlXYcIl
 ANR71SnlbccFleLjPhB9NQi96DvMHjNX2VEKIdL0bTeiNSk7x87/UVXTEwVLpDR1zVM4
 nX4QQnSeHJY6kPRtwwZV++SP1A/Ksfd+HSsjBiUB+5hgJkjlIiMKrJAHa0UjZMPwjETt
 gTwcomhfS46Z8oIus1kin1eky3K0D/z0t4fhQfgx2ALZj1jUageoAXWIDIPbfY/H0grG
 uyCI6AGCBvpCdusBB1K7Rf3MxtSP285VkuscElFHNx9jvjfDaiS7I3j08sCtB8vb8pE7
 JPrw==
X-Gm-Message-State: AOAM531frHKbY2TLLLBIppghh/OMaCriTxNUywO0oFv5VuhzCOdVRnMH
 Nl5oNLAG9+eLD+VtsosxeKw=
X-Google-Smtp-Source: ABdhPJyE8Q56+BzF1am4IROAPlSkQQYH4pyokUqMf5GkrZE9wtSrOR5LeCuCqwdD3O56FQleQsf4qg==
X-Received: by 2002:a05:6512:39d3:: with SMTP id
 k19mr1115363lfu.258.1633603001431; 
 Thu, 07 Oct 2021 03:36:41 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru.
 [79.139.163.57])
 by smtp.googlemail.com with ESMTPSA id k10sm2601041ljj.24.2021.10.07.03.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 03:36:41 -0700 (PDT)
Subject: Re: [PATCH v13 06/35] clk: tegra: Support runtime PM and power domain
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
 <CAPDyKFr2-f1wM+6jF9vWJ-Nq80Zg1Z3qFP6saULOrBi1270HGw@mail.gmail.com>
 <b06bf794-b8b3-417b-58ef-4d815ca86c95@gmail.com>
 <4c7b1a4c-c136-3650-8f77-9f98caa506f7@gmail.com>
 <2dd6bffc-9817-f4b1-0b92-f82f22fcf79a@gmail.com>
 <CAPDyKFox6THcxDouW2T7F2W__ZcoJP5GeG+H_a4NQmSqAFZ_oQ@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <81ce6f35-acb0-fe34-1efc-537c058a2160@gmail.com>
Date: Thu, 7 Oct 2021 13:36:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFox6THcxDouW2T7F2W__ZcoJP5GeG+H_a4NQmSqAFZ_oQ@mail.gmail.com>
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

07.10.2021 12:18, Ulf Hansson пишет:
>> Please let me iterate once again. The problem we currently have is that
>> clock may be enabled during NOIRQ time. In order to enable clock, it
>> needs to be prepared. In order to prepare clock, the clock's device
>> needs to be runtime-resumed. The runtime PM is unavailable at the NOIRQ
>> time.
>>
>> To solve this problem we need to prepare clock beforehand.
>>
>> The clock will stay prepared during suspend, but this is not a problem
>> since all the clocks we care about don't require high voltage and
>> voltage is guaranteed to be bumped high during suspend by Tegra's
>> regulator-coupler driver anyways.
>>
>> So everything we need to do is to keep clocks prepared. There are two
>> options how to do that:
>>
>> [1] this patch which explicitly prepares clocks using clk API.
>>
>> [2] Use runtime PM API, like this:
>>
>> static const struct dev_pm_ops tegra_clock_pm = {
>>         SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_resume_and_get, pm_runtime_put)
>> };
>>
>> Ulf, are you now okay with the current variant [1] of the patch or you
>> prefer the second [2] option more?
> I prefer option [2]. The clock_prepare|unprepare() thingy in option
> [1], looks more like an odd workaround to me.
> 
> Does that make sense to you as well?

I don't have a strong preference since both variants give the same
effect. I'll keep testing option [2] and will use it in the next version
if no problem will be found. Thank you!

