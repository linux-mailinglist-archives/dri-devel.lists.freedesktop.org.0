Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCF684A1A6
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 18:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2C010E543;
	Mon,  5 Feb 2024 17:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gXE+dbDC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805B910ECBE
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 17:59:15 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-40fdc500db5so7947605e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 09:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707155954; x=1707760754; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/C76pIYyE7acYLURd95YZ9JvqXFzoendTPcs1BJgd4E=;
 b=gXE+dbDCzPvHZWYP7c7RYzs/s596vNqPSpVWxpTx2xgftqD68B5XMYNYf8okaMWGmi
 levGnishGsfnJsl3XLpEIbC39RHs2Eiiz4gm6kIwWDiV3KsCVzvd1oFR5sjjxWRgG+iI
 avOsKg9H1CnLRGwUUGkik0gVGkO/bs+VvEzo6p1wJys3l/FdIsSfrrSH0dLNo4/qnpU1
 B6CV76adXsFAXDAVq31BUZt//AQAcHfjtzfk7H52jyJrjTmFWongwtijXs8QQI0PBDtp
 +qFt+drnrjmGd5WOYkKItA80Zf8epno5vCGKl9ovKykqtzks/gPf+3ZWrCfaCrzsvYuu
 xjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707155954; x=1707760754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/C76pIYyE7acYLURd95YZ9JvqXFzoendTPcs1BJgd4E=;
 b=HjYv5qb8RZn6BqCc9AQGVJBJdb5VmFPmwel44WQRcda7REydK/6yulvh8L1oS+tmdM
 ynxuliEvPGBK6Xi5w8xtj9TfWe98X6gVvGuvyagJ70Pc2PnZzin2WfVG9rWw04+hIUUc
 5fEIuhtoNQGJriSzVilkq1ZWg7tOgZkiBXzYYKfPVRjiLpGqwW05eE2dfOyFYBsGLoml
 n8nz7usW/SJ+TNXmsy/OhcqB050v0pLu6LJltjHGTZdEm+VC4/cvNlnsei5qbr9hfSvE
 bxQ5TIV0dVg2a2+0FM4gR5yj8zPa7CoJbLNr1gaCWjn4j/VgDokK7yRfD+OnF5diUtNT
 Sp+Q==
X-Gm-Message-State: AOJu0Yx0JgTcU1yIujrgj4GxmxFqnZBEH+u3C4YgEHSoE6LjmEFQl6j4
 p+y3vrSctfYkPKVZaC9WVK66F5e2Lk1MB6O4FBGsA9HMp6nzxP1O
X-Google-Smtp-Source: AGHT+IFDfuNn+dprW7ssb+MdCy5jmgRJzkLpuJk9Jj3FJq01fEAA1ewSEAVDfj9a3mttC9NNW39/qQ==
X-Received: by 2002:a05:600c:1f84:b0:40f:b69e:aa20 with SMTP id
 je4-20020a05600c1f8400b0040fb69eaa20mr367170wmb.11.1707155953740; 
 Mon, 05 Feb 2024 09:59:13 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXLGxFNA/76SPYxu2gToiQ41JQj1r64t0+xMs6T6ok0+J1kX7Lo3HRGsUqaghaMGWDQKL6PXq6NGNLqkkIL6fSH+q/R9n/7nX8t2HjGfS3xy3tDno+jNBpq3yhdlwMv0JwIiWGHs7pPMDmY3tppwuh007wlxUZZNFKoz77/2ORkHBIoHDnI/ufPPjYSKeEjDHiim+gWsQfvUDhYaX4z4mypzFDUcevPha6r2x7iWsfup6Oiqst2nvuH9rdJU+46xkyCnn4/ivUw8S9IVKnsMGJMg7qLChe9iXwNVF4SCU8JxeoTjvXi+r+Z7MWS7ud6I6MU3beXQxs2GYwHrSALeZRdfuLoAOymERlSPSMKGdcDcx94TlN6SAedrWcdATopdC7sw+tGASkr4zKKwBMRUJe1wqriolatAq9Krhbe2ZvlAVP8+Zy9nmXh5532Nn2rGu603uvVkCKmx1uBEh3bNT/W3C96U2wkhKAwy+zzb0/Hryn9kMrnc5Zde3M5KIM1PCxu3jMYbICJMCjqOU3GXYf/+aNklvlAAL7wlqEid1ZvQbER77q+Sl3cnYa2OWdgpqgT93pkXJ5ey7ataDjI4ghXTLkxxVsmaktCslsYlt9Ju6YQORWFaRAX9Z/+h/vH5qsTw8NvtUZlaj6372xbn8YDKQpN3d3WD4PqIgRvAa0bGxQ6j1r+SY0ebh56EgW/cmCqa02ZWncBwHOt/d33kTfrgMWYlRohrPyqeEHjhi/B1UjcLy/CNW+Bqv7keb9iJQ0cLjehkuUPyw==
Received: from jernej-laptop.localnet (82-149-13-182.dynamic.telemach.net.
 [82.149.13.182]) by smtp.gmail.com with ESMTPSA id
 v8-20020a05600c444800b0040fddd8de88sm2013072wmn.15.2024.02.05.09.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 09:59:13 -0800 (PST)
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
Subject: Re: [PATCH v2 5/6] drm/panel: st7703: Drive XBD599 panel at higher
 clock rate
Date: Mon, 05 Feb 2024 18:59:11 +0100
Message-ID: <13445659.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20240205-pinephone-pll-fixes-v2-5-96a46a2d8c9b@oltmanns.dev>
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <20240205-pinephone-pll-fixes-v2-5-96a46a2d8c9b@oltmanns.dev>
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

Dne ponedeljek, 05. februar 2024 ob 16:22:28 CET je Frank Oltmanns napisal(a):
> This panel is used in the pinephone that runs on a Allwinner A64 SOC.
> The SOC requires pll-mipi to run at more than 500 MHz.
> 
> This is the relevant clock tree:
>  pll-mipi
>     tcon0
>        tcon-data-clock
> 
> tcon-data-clock has to run at 1/4 the DSI per-lane bit rate. The XBD599
> has 24 bpp and 4 lanes. Therefore, the resulting requested
> tcon-data-clock rate is:
>     crtc_clock * 1000 * (24 / 4) / 4
> 
> tcon-data-clock runs at tcon0 / 4 (fixed divisor), so it requests a
> parent rate of
>     4 * (crtc_clock * 1000 * (24 / 4) / 4)
> 
> Since tcon0 is a ccu_mux, the rate of tcon0 equals the rate of pll-mipi.
> 
> pll-mipi's constraint to run at 500MHz or higher forces us to have a
> crtc_clock >= 83333 kHz if we want a 60 Hz vertical refresh rate.
> 
> Change [hv]sync_(start|end) so that we reach a clock rate of 83502 kHz
> so that it is high enough to align with pll-pipi limits.

Typo: pll-pipi -> pll-mipi

Best regards,
Jernej

> 
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index b55bafd1a8be..6886fd7f765e 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -320,14 +320,14 @@ static int xbd599_init_sequence(struct st7703 *ctx)
>  
>  static const struct drm_display_mode xbd599_mode = {
>  	.hdisplay    = 720,
> -	.hsync_start = 720 + 40,
> -	.hsync_end   = 720 + 40 + 40,
> -	.htotal	     = 720 + 40 + 40 + 40,
> +	.hsync_start = 720 + 65,
> +	.hsync_end   = 720 + 65 + 65,
> +	.htotal      = 720 + 65 + 65 + 65,
>  	.vdisplay    = 1440,
> -	.vsync_start = 1440 + 18,
> -	.vsync_end   = 1440 + 18 + 10,
> -	.vtotal	     = 1440 + 18 + 10 + 17,
> -	.clock	     = 69000,
> +	.vsync_start = 1440 + 30,
> +	.vsync_end   = 1440 + 30 + 22,
> +	.vtotal	     = 1440 + 30 + 22 + 29,
> +	.clock	     = (720 + 65 + 65 + 65) * (1440 + 30 + 22 + 29) * 60 / 1000,
>  	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>  	.width_mm    = 68,
>  	.height_mm   = 136,
> 
> 




