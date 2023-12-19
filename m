Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D31818D00
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 17:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8556E10E1C7;
	Tue, 19 Dec 2023 16:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F82C10E1C7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 16:54:23 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a2340c803c6so353312666b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 08:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703004862; x=1703609662; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hnbv43rPSyuI7Tjsf1jCy999PgtXeEb5DS5jkSFPK+Y=;
 b=bykiSj0xo0xsalMCEAe2OBu+KM303UNBZoFxRREZ7lsTLAjWv7mMjGJZc/Fgv2QefI
 5Why+G54BizlOEgXSyUpAIN2um1P4WkVgb68Wu7Ur8TGQDVN2VeDBAaJClxT5b3DSclE
 0wM9GRrULhIrlQqkIhBS9pTqK40pduLRe3NGLKr4W5udpEnYqXgse26ZJI8YlxDit1oj
 bOi55zJk1V2ScLeQQKvegScsnw10mOPzacbNAt9YEq7JofW0pYRo+UFScLP+HPp0kDLB
 KVnnlcUGQRvLYQF/ON0oKnKlmTyQNRPHG26fJW2bUeiMudz1oz5f5uRvpJgDE6k257NE
 Q+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703004862; x=1703609662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hnbv43rPSyuI7Tjsf1jCy999PgtXeEb5DS5jkSFPK+Y=;
 b=EnNZ3Q+Bqwq8mCRJ0C+tz8EadbMWVauBGUGp/ny8JhfNdhGFUGzM7ftXL4rSjoQMiw
 NIgdZnCjvqNlmz8DxJgXOqVOYaCaMzK7a+hR6QkHLL/cipBs1vQ56xeU32CBdemvW/kK
 O29kUYChItb31f/DDdW61YoDOFwQQMXr9YaNFUgrsM91N9h2/kw7V2VGwcBRTZy1Ecle
 yuvgnwCxkIQS+QEZUJ1LDe/StZdyBUs514Ccu2jbNjpf0MRzyxNQeQmGny1EeMUn4Q0Z
 KtwP3bfUMzlzh9iPuAfIwTZqf96kOH8WrN+KB0WzpuV93693IrZxSm+R92BdX6oTAOmI
 DBPQ==
X-Gm-Message-State: AOJu0YzaBOEVPc8lciVw05CgsID3cOkxtVKe2QE8mTOxwhHme7Jf4zbY
 R4eRog32glvwP12zco4xIok=
X-Google-Smtp-Source: AGHT+IFGpPOrKgiesvyt3dvb35pzq6oOzYVmDiF0hcfrJBLGErG46GoedhJeqiXAL1OIyI4NZrBVxQ==
X-Received: by 2002:a17:906:2611:b0:a23:48d2:be33 with SMTP id
 h17-20020a170906261100b00a2348d2be33mr1859295ejc.128.1703004861755; 
 Tue, 19 Dec 2023 08:54:21 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 s19-20020a170906c31300b00a236e9cfe74sm1381021ejz.103.2023.12.19.08.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 08:54:21 -0800 (PST)
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
Subject: Re: [PATCH 4/5] clk: sunxi-ng: a64: Add constraints on PLL-VIDEO0's
 n/m ratio
Date: Tue, 19 Dec 2023 17:54:19 +0100
Message-ID: <13411739.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20231218-pinephone-pll-fixes-v1-4-e238b6ed6dc1@oltmanns.dev>
References: <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
 <20231218-pinephone-pll-fixes-v1-4-e238b6ed6dc1@oltmanns.dev>
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

Dne ponedeljek, 18. december 2023 ob 14:35:22 CET je Frank Oltmanns napisal(a):
> The Allwinner A64 manual lists the following constraint for the
> PLL-VIDEO0 clock: 8 <= N/M <= 25
> 
> Use this constraint.
> 
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> index c034ac027d1c..75d839da446c 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> @@ -68,7 +68,8 @@ static SUNXI_CCU_NM_WITH_SDM_GATE_LOCK(pll_audio_base_clk, "pll-audio-base",
>  				       BIT(28),	/* lock */
>  				       CLK_SET_RATE_UNGATE);
>  
> -static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_CLOSEST(pll_video0_clk, "pll-video0",
> +static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_FEAT_NM_RATIO(pll_video0_clk,
> +						"pll-video0",
>  						"osc24M", 0x010,
>  						192000000,	/* Minimum rate */
>  						1008000000,	/* Maximum rate */
> @@ -80,7 +81,10 @@ static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_CLOSEST(pll_video0_clk, "pll-vid
>  						297000000,	/* frac rate 1 */
>  						BIT(31),	/* gate */
>  						BIT(28),	/* lock */
> -						CLK_SET_RATE_UNGATE);
> +						CLK_SET_RATE_UNGATE,
> +						CCU_FEATURE_FRACTIONAL |
> +						CCU_FEATURE_CLOSEST_RATE,

Above flags are unrelated change, put them in new patch if needed.

Best regards,
Jernej

> +						8, 25);		/* min/max nm ratio */
>  
>  static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK(pll_ve_clk, "pll-ve",
>  					"osc24M", 0x018,
> 
> 




