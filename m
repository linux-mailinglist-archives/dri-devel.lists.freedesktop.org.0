Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B761F90CBA6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 14:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DDD10E667;
	Tue, 18 Jun 2024 12:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JUetXo53";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894AF10E662
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 12:25:46 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7061365d2f3so1126267b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 05:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718713546; x=1719318346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NY6uPHPa68jHM+L5M0kCzNkKbofFg3S/GyAR+NOOK/s=;
 b=JUetXo53Et7Ij1kqrUdCjPsxdwCu0fM+vRJJqYnkev2m7dv6Fofeggm0vPS7jY6v89
 RIAVX2coRtZcviU9eCLebUcayMuTx2cDjCdcP7Jf1TxaQEo6Aut4yDgeHQrRd+f53lM7
 bADJnLQlXNj3Izl5Y9qrRnMC9xesJHEBvP9DQ3OxK3CSUvc/BiSUpXTgotP8Ht9B/vOS
 8R4AUVncLucMMtdjHKK83n6sRmqrFigD91KUKWNT+1qns5ijMXfPPuo2U3ZyZfkAvWhF
 RRJl+e/CNBODp3hdQ63Gjxj3hcY0hWt4vWu0WARGU00lnqgTjGhe1rtj9uFfQgY9EIAN
 e+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718713546; x=1719318346;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NY6uPHPa68jHM+L5M0kCzNkKbofFg3S/GyAR+NOOK/s=;
 b=eO/RQ8+3vq24w9NHvbO3jCwl5NWE5ORJYGHtqhT49Fo8bgexAsh/v1g0ETwZuNT2Ig
 LprgIvbHNTHeTKkZD66wxbwYtyaVBLc41+JZVUz/WCtlLwm8R1YtKRjosFT/7HKc5aYv
 IHENUdLHkYo75ABwNRX4UmNeUlToJA6dXr5lBNeuj9yoVU+r09wnqcLy+rMO+lLMjdDb
 DdBNXZt9y8GNCwWfIhP6domLdN5WuzGvd54mHd5V2x3gyPZfsAZ5LL+ZwXU/cjYNzpJ3
 pBPp+IaKcX/REfHFLY4vsBrNyT482L1rM/WzxHNyFQEV15A2zXNWr9kDRIfhAYzA3Mw+
 64KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKu3iPmeeZrtwA3yYaUzzt3V65u5kXruM3Ee3Ft9lxEIKHotKJmoA6rAK30QWPSaOHDiOcRY6s0OhhkQdeTVUVNIm+dMo46mvZ5HVkaQcb
X-Gm-Message-State: AOJu0YxLfTWNno3Im/uRSCYogr4XwTXw/jhGRZvkTXbWGsSVGYr6RA0e
 bXbfgv1tCF9CaRwQYHSaghhztyQr3lgNf39U5Al/CYrznszLCCIB
X-Google-Smtp-Source: AGHT+IGa47riVZyP+rwzU4Nu2pdE+m1GXhxXHaH8DjTcYiTCKYVJF4wq9OFjKTm+ZrYfIlXyuon9jw==
X-Received: by 2002:a05:6a20:3946:b0:1b3:d59f:2d87 with SMTP id
 adf61e73a8af0-1bae82f6f36mr12674618637.55.1718713545588; 
 Tue, 18 Jun 2024 05:25:45 -0700 (PDT)
Received: from [10.0.0.19] ([122.172.85.149]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e56183sm96304755ad.28.2024.06.18.05.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 05:25:45 -0700 (PDT)
Message-ID: <aa757abb-9883-4a46-a5e1-a7d4d5b044eb@gmail.com>
Date: Tue, 18 Jun 2024 17:55:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: raydium-rm692e5: transition to mipi_dsi
 wrapped functions
To: Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240615093758.65431-1-tejasvipin76@gmail.com>
 <CAD=FV=XRZKL_ppjUKDK61fQkWhHiQCJLfmVBS7wSo4sUux2g8Q@mail.gmail.com>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <CAD=FV=XRZKL_ppjUKDK61fQkWhHiQCJLfmVBS7wSo4sUux2g8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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



On 6/18/24 1:36 AM, Doug Anderson wrote:
> Hi,
> 
> On Sat, Jun 15, 2024 at 2:40 AM Tejas Vipin <tejasvipin76@gmail.com> wrote:
>>
>> @@ -168,48 +147,38 @@ static int rm692e5_prepare(struct drm_panel *panel)
>>         struct rm692e5_panel *ctx = to_rm692e5_panel(panel);
>>         struct drm_dsc_picture_parameter_set pps;
>>         struct device *dev = &ctx->dsi->dev;
>> -       int ret;
>> +       struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
>>
>> -       ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>> -       if (ret < 0) {
>> -               dev_err(dev, "Failed to enable regulators: %d\n", ret);
>> -               return ret;
>> +       dsi_ctx.accum_err = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>> +       if (dsi_ctx.accum_err) {
>> +               dev_err(dev, "Failed to enable regulators: %d\n", dsi_ctx.accum_err);
>> +               return dsi_ctx.accum_err;
>>         }
> 
> It would be my preference to get rid of the error print here since
> regulator_bulk_enable() already prints an error message.
> 
> 
>>         rm692e5_reset(ctx);
>>
>> -       ret = rm692e5_on(ctx);
>> -       if (ret < 0) {
>> -               dev_err(dev, "Failed to initialize panel: %d\n", ret);
>> +       dsi_ctx.accum_err = rm692e5_on(ctx);
>> +       if (dsi_ctx.accum_err) {
>> +               dev_err(dev, "Failed to initialize panel: %d\n", dsi_ctx.accum_err);
> 
> I'd probably change rm692e5_on() to take the "dsi_ctx" as a parameter
> and then you don't need to declare a new one there.
> 
> ...also, you don't need to add an error message since rm692e5_on()
> will have already printed one (since the "multi" style functions
> always print error messages for you).

I'm guessing that the change about regulator_bulk_enable and 
rm692e5 should also be applied to all the other panels where
similar behavior occurs?

> 
> 
> 
>>                 gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>>                 regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>> -               return ret;
>> +               return dsi_ctx.accum_err;
> 
> Not new for your patch, but it seems odd that we don't do this error
> handling (re-assert reset and disable the regulator) for errors later
> in the function. Shouldn't it do that? It feels like the error
> handling should be in an "err" label and we should end up doing that
> any time we return an error code... What do you think?

Personally I don't think this is necessary because imo labels
only get useful when there's a couple of them and/or they're 
jumped to multiple times. I don't think either would happen in
this particular function. But I guess if you have some convention
in mind, then it could be done?

> 
> 
> -Doug
