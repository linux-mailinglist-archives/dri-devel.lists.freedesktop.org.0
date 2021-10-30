Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0407E44069A
	for <lists+dri-devel@lfdr.de>; Sat, 30 Oct 2021 03:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CBB6EAA0;
	Sat, 30 Oct 2021 01:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9DF6EAA0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Oct 2021 01:04:26 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id l13so24305392lfg.6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 18:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jsVDqvtMCjEItY59BjDdXBjqSCj5AFKpqqKBAZC15PM=;
 b=GpLS5QoeSZiVYuQcyQg/wOKpPbg40IU+2Dfb9FcXU4nYeCmN6KJXjfh49JBd/wKAHD
 591KA3gQIf1SBvyjgUMmYV8cBXFTC/cdQ4HENj5UhrW8Zc5/6NQVTcbHDpp/uP/CtM/l
 31doiyyMMYYg0QJkQWOkCsBIMW+mBz8uv2F64Oi2QMKIfsIG/oChYJ9O+QA33jYEsngE
 FrvXPW+rYpkwao9yDetR1TGipaDBlZx2RObVu97eob6CBZrnUrIsLKwo4+T+zZ5rm6br
 At5zVemkgnR+a9B35XIsz2qkCf1eXFLUUqLj7BeJp/CwzdGna52h2P/7YR84Xq7I1QPX
 qHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jsVDqvtMCjEItY59BjDdXBjqSCj5AFKpqqKBAZC15PM=;
 b=vpFNG9GIjhCrUV2YtfppouyyYZydsn2YAY8Kak+0p9gbbFxGc/y1qsHihHB4ZAQf8t
 ZY2TEl952MqmVtBl3lFTgFTqi8spC5/q8bLqU/kjD67Y0dwJdJmS6wVvopVOb52dLqWY
 VzFybtkfjfB5ghaSooO0b+MJLKzBDuTPigvevuLym0JvgE/u9uXgDX0KWGajkyr+Dy9Q
 WGg0nLduja59QQA+CphO22nogGCEt/yD12+R8GRCfoaDBoTC7get2ARlrqNeYBlciFa5
 2R6ThCgCAsfhJQd6Q6XwwOfxY9NG1d5+iB6i9sJvAwro74emYNN+x8CFqsA26JAubzit
 xR0A==
X-Gm-Message-State: AOAM533ddDxUzPWbCyB3eU0OnQOaDc0ne3c3/ozh7xpk0to+c75o4X2c
 UvZKgS6sjW1MGeQwJxMQy48=
X-Google-Smtp-Source: ABdhPJx9M756TGAugbnDnJ3XSPzCFgHZzkSWbjRs2ZMvdkgT0v7toK9mxfqBf0H0S0K+YMfr11W+ug==
X-Received: by 2002:a05:6512:1287:: with SMTP id
 u7mr9587759lfs.590.1635555864551; 
 Fri, 29 Oct 2021 18:04:24 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id f13sm748072lfv.72.2021.10.29.18.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 18:04:24 -0700 (PDT)
Subject: Re: [PATCH v14 20/39] pwm: tegra: Add runtime PM and OPP support
From: Dmitry Osipenko <digetx@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>, David Heidelberg <david@ixit.cz>
References: <20211025224032.21012-1-digetx@gmail.com>
 <20211025224032.21012-21-digetx@gmail.com>
 <09c05206-c0e5-9a25-8ffa-b9291f6ea5ae@gmail.com>
 <CAJZ5v0i9OtA1nDiv8UXuF3ASdENFYJFV7+nMWm6Pcu=kw8k1aQ@mail.gmail.com>
 <4dc8a6bd-4072-ccbf-513b-221d286bd6d5@gmail.com>
 <CAJZ5v0hKQf-xZq2fx1pA5oxMqP_XJV=AG0Rqu7BKRUZGDz6H5Q@mail.gmail.com>
 <72160e55-6aa5-9541-43f2-fbf025f84ffb@gmail.com>
Message-ID: <5469f48f-2137-59ae-5298-6dc68c12a126@gmail.com>
Date: Sat, 30 Oct 2021 04:04:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <72160e55-6aa5-9541-43f2-fbf025f84ffb@gmail.com>
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

30.10.2021 03:47, Dmitry Osipenko пишет:
> 29.10.2021 21:06, Rafael J. Wysocki пишет:
> ...
>>>>> I just noticed that RPM core doesn't reset RPM-enable count of a device
>>>>> on driver's unbind (pm_runtime_reinit). It was a bad idea to use
>>>>> devm_pm_runtime_enable() + pm_runtime_force_suspend() here, since RPM is
>>>>> disabled twice on driver's removal, and thus, RPM will never be enabled
>>>>> again.
>>>>>
>>>>> I'll fix it for PWM and other drivers in this series, in v15.
>>>>
>>>> Well, for the record, IMV using pm_runtime_force_suspend() is
>>>> generally a questionable idea.
>>>>
>>>
>>> Please clarify why it's a questionable idea.
>>
>> There are a few reasons.
>>
>> Generally speaking, it makes assumptions that may not be satisfied.
>>
>> For instance, it assumes that the driver will never have to work with
>> the ACPI PM domain, because the ACPI PM domain has a separate set of
>> callbacks for system-wide suspend and resume and they are not the same
>> as its PM-runtime callbacks, so if the driver is combined with the
>> ACPI PM domain, running pm_runtime_force_suspend() may not work as
>> expected.
> 
> ACPI is irrelevant to the drivers touched by this series.
> 
> This series is about older ARM32 Tegra SoCs which either don't have ACPI
> at all or it's unusable by Linux, like a non-standard ACPI of M$ Surface
> tablets.

Although, there are VIC and NVDEC drivers of newer Tegra SoCs touched by
this series. Maybe they could get ACPI support in the future, but this
needs to be clarified. Perhaps Thierry or Mikko could comment on it.

>> Next, it assumes that PM-runtime is actually enabled for the device
>> and the RPM_STATUS of it is valid when it is running.
> 
> Runtime PM presence is mandatory for Tegra and drivers take care of
> enabling it, should be good here.
> 
>> Further, it assumes that the PM-runtime suspend callback of the driver
>> will always be suitable for system-wide suspend which may not be the
>> case if the device can generate wakeup signals and it is not allowed
>> to wake up the system from sleep by user space.
> 
> There are no such 'wakeup' drivers in the context of this patchset.
> 
>> Next, if the driver has to work with a PM domain (other than the ACPI
>> one) or bus type that doesn't take the pm_runtime_force_suspend()
>> explicitly into account, it may end up running the runtime-suspend
>> callback provided by that entity from within its system-wide suspend
>> callback which may not work as expected.
> 
> Only platform bus and generic power domain are relevant for this patchset.
> 
>> I guess I could add a few if I had to.
>>
> 
> So far I can't see any problems.
> 
> If you have a better alternative on yours mind, please share.
> 

