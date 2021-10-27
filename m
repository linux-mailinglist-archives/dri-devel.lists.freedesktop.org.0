Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9863643D1D0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 21:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BF26E81A;
	Wed, 27 Oct 2021 19:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E396E81A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 19:39:50 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id 205so6525516ljf.9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 12:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rAmPJfYHzRC+rm0bfc8zWvJNQrGo60yLoxqPzW5j78A=;
 b=Nf8FrgqEjAxhNRNr6ZyQdcPUhhOJYQ0gmHrNA+/9hDUzrt7itfhaONpqMxhY6dWN6B
 iDQg+mxMHuf7ZWvUMb7Lzt4OX51hiY2jaolNc5XtLM6ZPthyIo6jx1g/u+ORa9Cp/4PS
 E/oDftg2l6dE2E4zoU+e5kIOHFhISGDziHSz2dC4w+1lMFYzXXHpsP8Ds/pbSafnV8QE
 2SGd4nvFamN/ZFYZfE/7IISgYBw98NM4uOOAybsDqUf1Q2c/oCNJdHF6yeaEJgEtKpNu
 7/zbJs5OjypWNUtSZLbD/EmdazCUy5iZbB1aZdR7Oyx8ENzeVxshzHuutTrGwt/a8Vfu
 i0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rAmPJfYHzRC+rm0bfc8zWvJNQrGo60yLoxqPzW5j78A=;
 b=ioEZpsm3B18Eeq9uX2o0yokamnIdloQk92Cl4kEpjjseClQoG0TT3HdRfB4o4bqivR
 kwMkbS7eqXX4d3+HXFqi8tGpDB9crlClV287ovyiK78e4K5s4umCa87peyHFjaXtBZDt
 Gy3kBn7nk1nL8dNIEHTagWxjkkfcpvkfDq+eDE2JzDI2/mzTPK6e3AKU7YQWNrvl8tUM
 d+7pz9b/u7t8OBQ9zWKskUyCSwMlVZXbLSOIjcWo/J/v4HzmZtSBqAC+7BpnUp79fYdn
 Ukg68fFDcx1MPw9Pra7ecir0Y6vXO2mYwcuAE0ZJt9+HrvOzjQAQgue+fgVEyugRSugw
 cXTQ==
X-Gm-Message-State: AOAM531/H0bdYyEOpVL6TbEIPkBspDnsJkVJW2X2eOwxsnX1K0HXaf6R
 GPqizrK8AWWvZK+2JEl3OJlEX8+ZEwM=
X-Google-Smtp-Source: ABdhPJxarReFU7RnxAQqcknPbpQOUIP5VL6i4EpFxgGeK2aS9UED9Jy4im3s+hZp3RGqU6hEovYD0g==
X-Received: by 2002:a2e:7804:: with SMTP id t4mr4801093ljc.305.1635363588626; 
 Wed, 27 Oct 2021 12:39:48 -0700 (PDT)
Received: from [192.168.2.145] (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.googlemail.com with ESMTPSA id bq19sm84272lfb.144.2021.10.27.12.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 12:39:48 -0700 (PDT)
Subject: Re: [PATCH v14 29/39] soc/tegra: regulators: Prepare for suspend
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mmc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 David Heidelberg <david@ixit.cz>
References: <20211025224032.21012-1-digetx@gmail.com>
 <20211025224032.21012-30-digetx@gmail.com>
 <CAPDyKFrQfACqtHtsnbk9fJpfaXWgD6-GEy2HFq8DxMTe4+zZmA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a8280b5b-7347-8995-c97b-10b798cdf057@gmail.com>
Date: Wed, 27 Oct 2021 22:39:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFrQfACqtHtsnbk9fJpfaXWgD6-GEy2HFq8DxMTe4+zZmA@mail.gmail.com>
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

27.10.2021 18:47, Ulf Hansson пишет:
>> Depending on hardware version, Tegra SoC may require a higher voltages
>> during resume from system suspend, otherwise hardware will crash. Set
>> SoC voltages to a nominal levels during suspend.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> I don't understand the reason why you need to use pm notifiers to
> manage these things. Those are invoked really early during the system
> suspend process and really late during the system resume process.

The suspend/resume time doesn't matter as long as venc genpd resumes
earlier than regulator is unprepared during late resume. Hence early
suspend and late resume suit well.

> In regards to this, you are mentioning the behaviour in genpd around
> system suspend/resume in a comment a few lines below, and that it's
> problematic for the venc domain. Can you perhaps share some more
> information, just to make sure we shouldn't fix the problem in genpd
> instead?

GENPD core force-resumes all domains early during system resume and this
causes odd problem on Tegra20 device in regards to resuming of video
encoder domain where SoC sometimes hangs after couple milliseconds since
the time of ungating the domain if SoC core voltage is low at that time.

Initially I was blaming WiFi driver because somehow this problem didn't
happen if WiFi chip was disabled [1]. I dived into debugging and found
that hang happens after ungating venc early during resume from suspend,
i.e. when genpd core resumes it.

[1] https://www.spinics.net/lists/linux-wireless/msg212116.html

Interestingly, this problem isn't reproducible when system is fully
resumed, i.e. venc can be freely gated/ungated at a low voltage without
any visible problems.

What's also interesting, it's impossible to reproduce hang on a second
resume from suspend if it didn't happen on the first resume. Need to
reboot and try again in that case.

In the end I found that bumping SoC core voltage 100% solves the trouble.

I knew that downstream kernel bumps voltage during suspend, but it
doesn't explain why. I replicated the suspicious behaviour of downstream
kernel and the problem has gone. Could be that this only masks the real
problem, but I don't have more information and the problem is solved.
