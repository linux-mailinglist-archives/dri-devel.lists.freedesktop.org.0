Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BDA818CBA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 17:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF69E10E1C2;
	Tue, 19 Dec 2023 16:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166B410E1BC
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 16:47:04 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a235e394758so279696066b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 08:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703004422; x=1703609222; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NeShSK6cVdZ3tR/tSiq3rkncbpvvwt6PkK61/vcn6JY=;
 b=g5tJtm4kvGuxnEfmv2NF3hdRpsTvw/KsRhf3GTZ7FQDSjiCvpldoV25b4THeiUMTEW
 Z17L6Dj8tVPYXdbF32h4X4HFwRyfjvh4NUl+Gi0dWOVbeddHvyktD04I+brDYVSLS3KM
 RB6NadgfDAtmykqvZoUc6rt8gdrPM5PwnSX2GzNs4oYHPIl/Xff+2pjblUBlVFdlY3NG
 j2C9R1iZU+ZnHA/Kjith07sXpC4lACdJHmRhCrgQu/J2/Aa6tVjlgh8z8/QbDIMZujRp
 jGW2+E/dPsJejZK51zaIpIzxolr8Y/0QKe0YHWSYUh6Rsje7l/+tj1PZ8De8xnaogs87
 lq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703004422; x=1703609222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NeShSK6cVdZ3tR/tSiq3rkncbpvvwt6PkK61/vcn6JY=;
 b=ug1HWDVabnfyoeh8eNQVPYJdsuQf6BojKh5BAW1fb3GBxZGqZBh90udgSWlrbVaFyw
 mLtpMSYv3aHO/6S+fW5TIQ7hcduXDWQmvTbA19iukt7jCGa0/k4eCdYpkzWtCGcsueLr
 b2W9JcGzpfZG+4ojSfelh3tmzHvlPZ0x7aoQWEGugXCRb0Hs36RtlsBOfzeZ8YQJwQ0i
 TPjNz0gVuXpZLmJyQtzcvmqKdcQTIdHDNcvJmJkOO02E2ZL1TSlndywebt2/y3eLqJHT
 88mIH2YLYTMfwdJ2N44TzNU8kZcQSJEsmRpeR/FeGiRgnPW4OHuL9ZnWJRv6x6ynktQi
 wPcw==
X-Gm-Message-State: AOJu0YzKz4SM/t+FarqATWZliYgsIvQuTBwrIR8AY+ifeQnj6akTccWy
 dRxbQZJTcDFvc+UthY+xHo0=
X-Google-Smtp-Source: AGHT+IG/BM4Mx/0Unwhzt2oGgH1Ni3lsEEn7GjfNPeGpMSmWn0LI6JdBChftgTkGEW3WIn9NXYk51A==
X-Received: by 2002:a17:906:c214:b0:a19:a19b:78bd with SMTP id
 d20-20020a170906c21400b00a19a19b78bdmr8931356ejz.128.1703004422323; 
 Tue, 19 Dec 2023 08:47:02 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 x24-20020a170906135800b00a25501f4160sm780675ejb.1.2023.12.19.08.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 08:47:01 -0800 (PST)
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
 Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH 2/5] clk: sunxi-ng: a64: Add constraints on PLL-MIPI's n/m
 ratio and parent rate
Date: Tue, 19 Dec 2023 17:46:59 +0100
Message-ID: <4881920.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20231218-pinephone-pll-fixes-v1-2-e238b6ed6dc1@oltmanns.dev>
References: <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
 <20231218-pinephone-pll-fixes-v1-2-e238b6ed6dc1@oltmanns.dev>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Frank Oltmanns <frank@oltmanns.dev>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne ponedeljek, 18. december 2023 ob 14:35:20 CET je Frank Oltmanns napisal(a):
> The Allwinner A64 manual lists the following constraints for the
> PLL-MIPI clock:
>  - M/N >= 3

Same as in previous patch, should be "<=".

Best regards,
Jernej

>  - (PLL_VIDEO0)/M >= 24MHz
> 
> Use these constraints.
> 
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> index 8951ffc14ff5..c034ac027d1c 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> @@ -176,6 +176,8 @@ static struct ccu_nkm pll_mipi_clk = {
>  	.n		= _SUNXI_CCU_MULT(8, 4),
>  	.k		= _SUNXI_CCU_MULT_MIN(4, 2, 2),
>  	.m		= _SUNXI_CCU_DIV(0, 4),
> +	.max_mn_ratio	= 3,
> +	.parent_wo_nk	= 24000000,
>  	.common		= {
>  		.reg		= 0x040,
>  		.hw.init	= CLK_HW_INIT("pll-mipi", "pll-video0",
> 
> 




