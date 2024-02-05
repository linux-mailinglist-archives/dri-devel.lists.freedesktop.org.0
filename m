Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C9C84A185
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 18:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F306410FB28;
	Mon,  5 Feb 2024 17:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yr8eTUTh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDCE510FB39
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 17:56:13 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-40fe076f911so572915e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 09:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707155772; x=1707760572; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yQo7DEH+Zbxsn/GDq6x2R3lR0LaSJXJADj+lFUkrcCQ=;
 b=Yr8eTUThyZrA5QI2ZRdgl+G9oSvtEqvqEnMQeimtD3BBisLiiaw5gY72Qz8zF9EK5F
 CAZQM5lbVsMwa8Ug8Pa4hZXCNcdcf6kIU6gWM+pqDnDmo0UEc73L8OKnvBUg5b+NvZGz
 ie6wkTG/FtuM5ODAmACkSTNPPa2ewFrSmMZ3QfzsO70isnsvL9xZLXk6KPfJ8tQsReLN
 XINC62GxUDAxZAQ2lOKfGXshBYq7oy2vmagYA2F8v1fbB+7amfOKxLuTRm+74noHswsl
 Zv51ZzftW8jx2o/XbDXay6JNRIjn3Gr+K0bcwRPA0J73bKKR9Y/gdpWy8/goUELD/m6M
 wHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707155772; x=1707760572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yQo7DEH+Zbxsn/GDq6x2R3lR0LaSJXJADj+lFUkrcCQ=;
 b=YcUjnTloqcE3M4/KNs7X8C9yLblYImMo/UY5O5nnu4u+hnBoN/l73tnzqlYhTl8gj1
 YP0xF8ZsI74Ho4BwRkbdr3OjsGw8mN/4O1+Bo4ICcHwHhKcFloLXiV335UPbNQPyEbAA
 NkasjNrl8nUNnNk8ueFHMKAzUwDHnceEJ48tr/l1qiaFvICZ12kzXozQodUtB11bVAyO
 rz4XlfxU3uj0uuGfM1lGPwsxhcdH1gbZ/6Qy1gnNbHKCO95++W8qWeo/8jkoMRpAFo58
 pBsllXhPm5kh4WZqnN5YkZA0kGbjaTGbHR9cssaltJHYMfiGrapz3v0qptOtBOlR5LEl
 Fy9w==
X-Gm-Message-State: AOJu0Yx7GlzIE1jmw6rjHpyI1NVZ1fYQetdGd3GXrI4RaXfaOnTqtw10
 iKyExYhbDx8htm878Ewl5yi3dlYEMb6AhGuLSTJdhbLjqAMR66YI
X-Google-Smtp-Source: AGHT+IEsTlp9iHH6e8DPKagWNrPZEnjKRxqc6vq6sXhD5ZPYHBTALUGH8fsHvNTKshHOCqRe73BnQw==
X-Received: by 2002:a05:600c:4e90:b0:40e:f681:b7b6 with SMTP id
 f16-20020a05600c4e9000b0040ef681b7b6mr340863wmq.37.1707155772063; 
 Mon, 05 Feb 2024 09:56:12 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXPLF5BJxHk+SVf+iXJqOC4NqstlwVSQCIrIQZ0CNKx8ubzjsfiVziRQGSQjYrsoTpZS719hvULJu17cAsZCT1mJqFYI87qvTedGmJh27eHfDmDc/xT+M4qqBBmjm1fw5N0GFwDaOt5pID6gTxIDZzOG699DFKNj10o5fwAuCAjF/iBN5GfoIDWavEsOcGYJRC0i0oc/EEWvPfQfDpX8V0OXLXLm7zbwOgTkrV840/lRKYjWXEzpdNT7ruexZWEx7yt1Y7AWw0mgsfD3gF9jzPiqwVeqtLeVkKk6OiP0pg11SrkJkWPpcD33wXcDmrzX44WIjkvgzTvM01NkQiFu6sKPtuHTxjVmc7DKWkYk0HMq8w9DVJVHId+g8FMK5qFa3a+Hbe5YwXWckiu65qxVa6SUJuagtrMU6nr5bKCqks/E9gLYFxzvum7AFxwEcph+cl9FtZklC6jPxL12g41YTi4tG6usJR9juOrxJMvKmQiRH9CF4e9yBZBlEopCajudfY3Sk+I5UmM/i2DXlhyB0rEoqns95uSDxyUgBtgbv+0bdeL+xLYqpuMU/cjhxrmZ44fkH+BvJ5nz6cBI7Z+/mO2rQzRk66jE62DAIeCR36FneUwm7kHaV5CQ+wvM1x1M6a24wmx0kviiUARhVkKOtxWREpKRc6Z0erXqYG2cTyUDJjw0U0LsZ4R7WTH+Rtx2NI9tzNWsnjEM1WG5YUcs684BlQZBX6+EC4/1q2b2veO7C/qHXyN0jZMKO5H7Z7NoyHN5pObCTBBPA==
Received: from jernej-laptop.localnet (82-149-13-182.dynamic.telemach.net.
 [82.149.13.182]) by smtp.gmail.com with ESMTPSA id
 c29-20020adfa31d000000b0033b3a010001sm144509wrb.4.2024.02.05.09.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 09:56:11 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Oltmanns <frank@oltmanns.dev>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH v2 3/6] clk: sunxi-ng: nkm: Support minimum and maximum
 rate
Date: Mon, 05 Feb 2024 18:56:09 +0100
Message-ID: <4543794.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20240205-pinephone-pll-fixes-v2-3-96a46a2d8c9b@oltmanns.dev>
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <20240205-pinephone-pll-fixes-v2-3-96a46a2d8c9b@oltmanns.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Dne ponedeljek, 05. februar 2024 ob 16:22:26 CET je Frank Oltmanns napisal(a):
> According to the Allwinner User Manual, the Allwinner A64 requires
> PLL-MIPI to run at 500MHz-1.4GHz. Add support for that to ccu_nkm.
> 
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> ---
>  drivers/clk/sunxi-ng/ccu_nkm.c | 13 +++++++++++++
>  drivers/clk/sunxi-ng/ccu_nkm.h |  2 ++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
> index 1168d894d636..7d135908d6e0 100644
> --- a/drivers/clk/sunxi-ng/ccu_nkm.c
> +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> @@ -181,6 +181,12 @@ static unsigned long ccu_nkm_round_rate(struct ccu_mux_internal *mux,
>  	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
>  		rate *= nkm->fixed_post_div;
>  
> +	if (nkm->min_rate && rate < nkm->min_rate)
> +		rate = nkm->min_rate;
> +
> +	if (nkm->max_rate && rate > nkm->max_rate)
> +		rate = nkm->max_rate;

Please take a look at ccu_nm_round_rate() code. You need to consider postdiv
and you can return immediately.

> +
>  	if (!clk_hw_can_set_rate_parent(&nkm->common.hw))
>  		rate = ccu_nkm_find_best(*parent_rate, rate, &_nkm, &nkm->common);
>  	else
> @@ -220,6 +226,13 @@ static int ccu_nkm_set_rate(struct clk_hw *hw, unsigned long rate,
>  	_nkm.min_m = 1;
>  	_nkm.max_m = nkm->m.max ?: 1 << nkm->m.width;
>  
> +
> +	if (nkm->min_rate && rate < nkm->min_rate)
> +		rate = nkm->min_rate;
> +
> +	if (nkm->max_rate && rate > nkm->max_rate)
> +		rate = nkm->max_rate;
> +

No need for this, clk subsystem calls round rate before setting actual clock
rate.

Best regards,
Jernej

>  	ccu_nkm_find_best(parent_rate, rate, &_nkm, &nkm->common);
>  
>  	spin_lock_irqsave(nkm->common.lock, flags);
> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.h b/drivers/clk/sunxi-ng/ccu_nkm.h
> index c409212ee40e..358a9df6b6a0 100644
> --- a/drivers/clk/sunxi-ng/ccu_nkm.h
> +++ b/drivers/clk/sunxi-ng/ccu_nkm.h
> @@ -27,6 +27,8 @@ struct ccu_nkm {
>  	struct ccu_mux_internal	mux;
>  
>  	unsigned int		fixed_post_div;
> +	unsigned long		min_rate;
> +	unsigned long		max_rate;
>  	unsigned long		max_m_n_ratio;
>  	unsigned long		min_parent_m_ratio;
>  
> 
> 




