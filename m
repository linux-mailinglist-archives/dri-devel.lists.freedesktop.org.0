Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF3085C19A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 17:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF8110E4F0;
	Tue, 20 Feb 2024 16:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="FUQQWI2G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A66810E3D7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 16:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
 t=1708447414; bh=z4JWuWnGXxtj1e13X8/078DUzc51WgJgv/eBSFm2h68=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=FUQQWI2GUEfDPYh40q++n2IQFf5euFWbZYd/sMkhbd4YMtnzo+/j3Tv2v8HPdgYeB
 pOvSFLFvC6DOlZhTl26ZZi+xGX1fMErCGsPfrzxU1U50TvZi96MmlDWOlUyoVL+JfC
 uRCRDnSxr6Mzj9O/IFyIi2arF2v2wX92NXY3+6jU=
From: Luca Weiss <luca@z3ntu.xyz>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Andrew Morton <akpm@linux-foundation.org>,
 "G.Shark Jeong" <gshark.jeong@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maximilian Weigand <mweigand@mweigand.net>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] backlight: lm3630a: Use backlight_get_brightness
 helper in update_status
Date: Tue, 20 Feb 2024 17:43:32 +0100
Message-ID: <5027630.31r3eYUQgx@g550jk>
In-Reply-To: <20240220141107.GF6716@aspen.lan>
References: <20240220-lm3630a-fixups-v1-0-9ca62f7e4a33@z3ntu.xyz>
 <20240220-lm3630a-fixups-v1-3-9ca62f7e4a33@z3ntu.xyz>
 <20240220141107.GF6716@aspen.lan>
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

On Dienstag, 20. Februar 2024 15:11:07 CET Daniel Thompson wrote:
> On Tue, Feb 20, 2024 at 12:11:21AM +0100, Luca Weiss wrote:
> > As per documentation "drivers are expected to use this function in their
> > update_status() operation to get the brightness value.".
> >
> > With this we can also drop the manual backlight_is_blank() handling
> > since backlight_get_brightness() is already handling this correctly.
> >
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> However...
> 
> > ---
> >  	/* disable sleep */
> > @@ -201,9 +202,9 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
> >  		goto out_i2c_err;
> >  	usleep_range(1000, 2000);
> >  	/* minimum brightness is 0x04 */
> > -	ret = lm3630a_write(pchip, REG_BRT_A, bl->props.brightness);
> > +	ret = lm3630a_write(pchip, REG_BRT_A, brightness);
> 
> ... then handling of the minimum brightness looks weird in this driver.
> 
> The range of the backlight is 0..max_brightness. Sadly the drivers
> are inconsistant regarding whether zero means off or just minimum,
> however three certainly isn't supposed to mean off! In other words the
> offsetting should be handled by driver rather than hoping userspace has
> some magic LM3630A mode.

I could also try and fix that..

1. Treat 1..4 as 4, so have backlight on at that minimum level? Probably
wouldn't be noticable that brightness 1=2=3=4. And the backlight will be
on compared to off as it is now.

2. Decrease max_brightness by 4 values, so probably 0..251 and shift the
values up in the driver so we get 4..255?

Or would you have some other idea here?

Regards
Luca

> 
> You didn't introduce this so this patch still has my R-b ...
> 
> 
> Daniel.
> 




