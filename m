Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E333723E8C6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 10:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97206E053;
	Fri,  7 Aug 2020 08:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B326E053
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 08:21:17 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a5so855660wrm.6
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 01:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=UqxiNGL80BLdDN30QUUee1y7IG4JiUdyhB9Ly20qJKI=;
 b=CIeg/alnrvDZeEY6m+aWi1luGEHJDycuJGQ7nP34JINNUyrrx8SIRKZnydaFDoEYsQ
 z3du814PWCYyYmKRpLUoCo4OvaLjTx0m5yxc2zFV5qSH9PQU/EOojpREL2YXSlg+Hkuj
 KaoGNZ5pUETPZShaeI0gLGd8YyADGy4nkkquE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=UqxiNGL80BLdDN30QUUee1y7IG4JiUdyhB9Ly20qJKI=;
 b=nJT3FPrI0lqzSfnjeIAH2d6R29loCfuHlBJifktxJOV7Vuuf8OlZQHgmdNUJwEeBTt
 9vi8LZcHYlSMsvsOLvcRKQaSpezToKcogfHvAygTU5Oo6dwH/h8roxYRLQkw6hLeFRwM
 FYAYsyxM077lbVOsGAmGFwiVVNBuyT8HWIYCNHK30tfWqnFQK8Kow1zBIoCq+jGLHk0E
 MZ480mKEt1nSCwBLMDPu3MkMpZapKDI/1xO7bTbx6ylCB6y7QMr2B8GuN86vu6GRnT1k
 sB5SBCgtRVhgPOiFUdcC0HGlWYHPcbKTYYSQHoM0Qi6QRR/NQoaSeJBlPHfenG0Iip9Q
 kx/w==
X-Gm-Message-State: AOAM531Ni5+LfbQabbaQ3LMaMxt5gICiMvG78Lbgr6WSTnC0bSFN+Cp5
 lqDiei63i4dAadW59NksNvReng==
X-Google-Smtp-Source: ABdhPJznfPys24FShDvFjWJ2NDzMFWVf+kHqgSLbgWxDZ+J7ylB679aTuEYbnHVK0dLGgOJMTEXglg==
X-Received: by 2002:a5d:538a:: with SMTP id d10mr11703089wrv.280.1596788476358; 
 Fri, 07 Aug 2020 01:21:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r3sm9649430wro.1.2020.08.07.01.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 01:21:15 -0700 (PDT)
Date: Fri, 7 Aug 2020 10:21:13 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 2/3] backlight: pwm_bl: Artificially add 0% during
 interpolation
Message-ID: <20200807082113.GI6419@phenom.ffwll.local>
Mail-Followup-To: Alexandru Stan <amstan@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthias Kaehlcke <mka@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20200721042522.2403410-1-amstan@chromium.org>
 <20200720212502.2.Iab4d2192e4cf50226e0a58d58df7d90ef92713ce@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720212502.2.Iab4d2192e4cf50226e0a58d58df7d90ef92713ce@changeid>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>, Matthias Kaehlcke <mka@chromium.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 20, 2020 at 09:25:21PM -0700, Alexandru Stan wrote:
> Some displays need the low end of the curve cropped in order to make
> them happy. In that case we still want to have the 0% point, even though
> anything between 0% and 5%(example) would be skipped.
> 
> Signed-off-by: Alexandru Stan <amstan@chromium.org>
> ---
> 
>  drivers/video/backlight/pwm_bl.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> index 5193a72305a2..b24711ddf504 100644
> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -349,6 +349,14 @@ static int pwm_backlight_parse_dt(struct device *dev,
>  			/* Fill in the last point, since no line starts here. */
>  			table[x2] = y2;
>  
> +			/*
> +			 * If we don't start at 0 yet we're increasing, assume
> +			 * the dts wanted to crop the low end of the range, so
> +			 * insert a 0 to provide a display off mode.
> +			 */
> +			if (table[0] > 0 && table[0] < table[num_levels - 1])
> +				table[0] = 0;

Isn't that what the enable/disable switch in backlights are for? There's
lots of backligh drivers (mostly the firmware variety) where setting the
backlight to 0 does not shut it off, it's just the lowest setting.

But I've not been involved in the details of these discussions.
-Daniel

> +
>  			/*
>  			 * As we use interpolation lets remove current
>  			 * brightness levels table and replace for the
> -- 
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
