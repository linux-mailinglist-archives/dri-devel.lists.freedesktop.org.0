Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35617710AFC
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 13:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0662210E054;
	Thu, 25 May 2023 11:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BDB10E054
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 11:32:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E493C644F6;
 Thu, 25 May 2023 11:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB3FC433D2;
 Thu, 25 May 2023 11:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685014376;
 bh=jaRONdRd6B0UlNlUVZ+/ikDOkKVWHh2BtpYHjqX5Dx4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cS9Ci5AmeT5wj5DyTVrXrwLsibXdknNMbMEU1HKPk3s2DxnoxvRH8hphi4kyxbTfU
 oajVPD4z/K6wyGmVZPiSE70s+hF+bT6wfEM1m+KaFVTPqIiA0R2cPvS63BwYwGYyvV
 HOcOttkjzt2QoEI818WUc1AZesOkCM24s973fEK9sUI9CHTJjuLZp63UY9CNBthUPh
 1kCvLPJT1Lo91kIU99815LbSzBDOSsPR5Qlto76nqlATInwfOd2BT0OyzEp2K36g5W
 pSpgD5G7ByyBO/2/j6SvxH5NC1qKZROZLb8SwxFi1kgZ51Sn5Z/YSxOwpwvcSawLVI
 Fj+PZqi+mg2dg==
Date: Thu, 25 May 2023 12:32:50 +0100
From: Lee Jones <lee@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: backlight: pwm: Make power-supply not
 required
Message-ID: <20230525113250.GF423913@google.com>
References: <29943059c80c8db0db437f9548f084a67326647b.1684856131.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29943059c80c8db0db437f9548f084a67326647b.1684856131.git.geert+renesas@glider.be>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 May 2023, Geert Uytterhoeven wrote:

> make dtbs_check:
> 
>     arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dtb: backlight: 'power-supply' is a required property
> 	    From schema: Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
> 
> As that backlight device node already has an "enable-gpios" property to
> control the power supplied to the backlight, it sounds a bit silly to
> have to add a "power-supply" property just to silence this warning.  In
> addition, as of commit deaeeda2051fa280 ("backlight: pwm_bl: Don't rely
> on a disabled PWM emiting inactive state"), the Linux driver considers
> the power supply optional.
> 
> Fix this by synchronizing the bindings with actual driver behavior by
> making the "power-supply" optional.
> 
> Fixes: deaeeda2051fa280 ("backlight: pwm_bl: Don't rely on a disabled PWM emiting inactive state")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> As commit deaeeda2051fa280 was only upstreamed in v6.3, I'm wondering if
> the backlight on the iWave Systems RainboW-G20D/G21D Qseven and
> RainboW-G22D-SODIMM boards worked before?  I don't have the hardware.
> 
> Thanks!
> ---
>  .../devicetree/bindings/leds/backlight/pwm-backlight.yaml        | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
