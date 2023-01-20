Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CD1675AC4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 18:07:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE70110E0D9;
	Fri, 20 Jan 2023 17:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BA910E0D9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 17:07:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B16CBCE298C;
 Fri, 20 Jan 2023 17:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71900C433EF;
 Fri, 20 Jan 2023 17:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674234433;
 bh=yrSqpcs8yxwI9UUhr3/WzrPeWuyl/ClrxQ9Yls6h0KE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UbQUQKw3wAPAPV336MhRFF45ylggW2RQ5swyP56hsO5qG6lYQXwjOgdXbIJK4EfKi
 WDxoQpoWj/httmpiZv+qhGJh1V++68dn0wNBwgyipWyhK+IUZ0I9eko6a3V0jmVRL4
 I7+TCZnIuhIIDjYlNjkCa2ylM06AheCq4i3MRLn4pA3qZsFR+1ayoHrR3trFpGUoZR
 qOtb8TMpRGsJ5/VHi9iWMyYvv7bNboa+vZZ7UXF36GmNx+JBMUCRRTou4IVJkS0KIR
 QHIbguy5y1rQ1IW4sp+X/hvMawSzwEankSx6otN3GvRXFfRCwidyOqbR/B8q6v4by8
 uhwk713JliSyA==
Date: Fri, 20 Jan 2023 17:07:06 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 1/2] backlight: pwm_bl: Configure pwm only once per
 backlight toggle
Message-ID: <Y8rKOozBnOGg2Sxg@google.com>
References: <20230120120018.161103-1-u.kleine-koenig@pengutronix.de>
 <20230120120018.161103-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230120120018.161103-2-u.kleine-koenig@pengutronix.de>
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
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 20 Jan 2023, Uwe Kleine-König wrote:

> When the function pwm_backlight_update_status() was called with
> brightness > 0, pwm_get_state() was called twice (once directly and once
> in compute_duty_cycle). Also pwm_apply_state() was called twice (once in
> pwm_backlight_power_on() and once directly).
> 
> Optimize this to do both calls only once.
> 
> Note that with this affects the order of regulator and PWM setup. It's
> not expected to have a relevant effect on hardware. The rationale for
> this is that the regulator (and the GPIO) are reasonable to switch in
> pwm_backlight_power_on()/pwm_backlight_power_off() but the PWM has
> nothing to do with power. (The post_pwm_on_delay and pwm_off_delay are
> still there though.)
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/video/backlight/pwm_bl.c | 28 ++++++++++------------------
>  1 file changed, 10 insertions(+), 18 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
