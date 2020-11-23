Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3362C012B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 09:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41C589C49;
	Mon, 23 Nov 2020 08:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9F289B65
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 06:33:12 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p8so17443160wrx.5
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Nov 2020 22:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=bA6PxX8QLzsGPO0mHBN+3Dtvap+C8KIb1Z8Udw0nO2Q=;
 b=dWLZqofKsdhEgABif3Bioetz8qih1qcB80fqacMhJo3qbRlmgvkSjpf6KfOnapZooC
 XkowLImJFECW49B/96Na1+iiQILiX339zOB9wPpVpQDC5DBYTsboBByQ1HfKYJg+o8LD
 CkaxrP/J0mgb7TYTF9Aan+MwAfRu68XJ9cQoEHzUwvGpVq5MyCkZyM9MgstYMeZifXda
 +PdO08Q3Q2Qvy82Z4zlD1IjzS2e3VdNmCF+McBtr1esqW5YHW7rBOO3khdGd5lbZvwo7
 pgkiLIGXoUHWGa/z6YUu2svO38+07/OlvlO0gIhuv9cmtUJgH/moRnI83yALB50jIUGw
 Ufiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bA6PxX8QLzsGPO0mHBN+3Dtvap+C8KIb1Z8Udw0nO2Q=;
 b=aUaWMGP641SbLVFc5nUoA5AjlwvORAhQBw5tlrdA4w+lD3hEOEIo2EdhcrGj8gxfdU
 D4gga1oiOs2mt6i53bE49YAR2SHS+Hp/8RldOdQgnAAkLLCMtLZlfcqXdcSB5k5qjuv5
 R8hax5OLdDdJ53REMkwZZYQJyDlB9SQNXzKexMmGzZOXiYvLkSDvSvAnqCq20Wxr3fsb
 SWWD3VD6afo8iCn6mXjt+YFi5HEfHJsFA8T1E2aKrRQQeF8sYCQNlZBUdDi//GIid1D1
 pTtaajSuV80Y9MbnJryF/qljTK4Fyk3JJrfEabIVu/uD/ZRAJVhNx9QTPExI0RoPlemj
 r6iQ==
X-Gm-Message-State: AOAM531G+z60VlGfY8KS0wW6FDXdyMJCSCe8cZm9Qbp6k5OtcfthGwkK
 TL8p6UIU7VR+13wbL/2wl58ordAzapHMAQ==
X-Google-Smtp-Source: ABdhPJxj3l+5ygzvJnGvao/pLWVRCcUon/irO3mlsfmWiGjI66Lp7ac+52xe4O+T97k2/Htaikrpsg==
X-Received: by 2002:adf:f24a:: with SMTP id b10mr29509390wrp.352.1606113190342; 
 Sun, 22 Nov 2020 22:33:10 -0800 (PST)
Received: from MacBook-Pro.local ([212.45.64.13])
 by smtp.googlemail.com with ESMTPSA id l23sm11165881wmh.40.2020.11.22.22.33.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Nov 2020 22:33:09 -0800 (PST)
Subject: Re: [PATCH v10 06/19] memory: tegra124: Support interconnect framework
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
References: <20201123002723.28463-1-digetx@gmail.com>
 <20201123002723.28463-7-digetx@gmail.com>
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <8871a6d3-23da-01e2-18b6-b0dcd4df1a54@linaro.org>
Date: Mon, 23 Nov 2020 08:33:08 +0200
MIME-Version: 1.0
In-Reply-To: <20201123002723.28463-7-digetx@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 23 Nov 2020 08:12:51 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23.11.20 2:27, Dmitry Osipenko wrote:
> Now Internal and External memory controllers are memory interconnection
> providers. This allows us to use interconnect API for tuning of memory
> configuration. EMC driver now supports OPPs and DVFS.
> 
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Georgi Djakov <georgi.djakov@linaro.org>

Thanks,
Georgi

> ---
>   drivers/memory/tegra/Kconfig        |   1 +
>   drivers/memory/tegra/tegra124-emc.c | 320 +++++++++++++++++++++++++++-
>   drivers/memory/tegra/tegra124.c     |  82 ++++++-
>   3 files changed, 391 insertions(+), 12 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
