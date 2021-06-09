Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CFA3A1009
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 12:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0507289FDD;
	Wed,  9 Jun 2021 10:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 361 seconds by postgrey-1.36 at gabe;
 Wed, 09 Jun 2021 10:17:04 UTC
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA3A6E0C2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 10:17:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1623233100; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=kHO6KBv82tPQXRN/96teOiv5/v9VW9hWDsRaVShOnsbeTBIzB6y4QPW6SiPbPLu9EE
 Yvxs1WdMdqxezQHsjWWcOQrVC8D77wvJs5PCehFcHYAKtL95nR8rAmhL/Q0MNvF6U+2s
 ad4OR5g80R35YHmmwybX23pbStgyd2iR+j+qVs24EU6RvYKXEGWqZ99y5OsPedo34WCW
 hAX/a6OlryPu8o4We9G6gJwzlOVlOKoSpWernNJFM2Pv7RXiNVMIjV9B0APIFVsbGaa3
 DkJSZKfMEcCpA3zp/1U3rZmc21rUQi7y7Am79dQOWfTtBYzHKz+iB5IYabJGmoBfdQNP
 PIxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623233100;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=ItsPMlHbJWRbDzq8RhdjxHbYrMVELXpPagW5og9aBug=;
 b=ivU/7eSS/vplEe67FfTcNsnnYehtQrTXE7NReOHXDzUIyC/Cd1YQ99LG5fNUYdQFXV
 5K0b1NLUqj6hEfD2Yf1BMuMB1OG3prAg0gjx0OxVk3CH98lc18A1e/LI60s8GvKNwSVe
 ZAJ8w0wb6DVhW9Yp3/LqTBGLUhxT0r5w2tfaibuolyjSaeb9UFFVdBz3kSTGb0LQAowZ
 lGRKTYerwajr9ERwULMWMQDvbkOMQrm4a1RqWnDoLWJ5t/YJczl+Yh8xcStRxpS2RTRp
 ZLXRzBml3mrLwZE8RRnFmwwa7Jfl0nwbT0xhZcPU0ptFhex6HgFlWfQ54N6JmxBaHWgE
 Tl4w==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623233100;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=ItsPMlHbJWRbDzq8RhdjxHbYrMVELXpPagW5og9aBug=;
 b=G2lylwr1PPWZNvT831Kqcln6U5qMIhEvuhEgYS2YfGPEIiGca/FsKu1O8Lo27C108t
 RZYtprebD38Z1li1ZxxPeRxraogUQSXVPkyir7s/8SkCUl+I+r7hdHLNq34pOVjCSHEw
 7i78hS8wUjE9JjZl+if1pVJO6LslYNORXYEfSFuhcvYTkFhGku+Matyfhn3QgiJPfnis
 JCcibc8cgXWBeOBl1+WYoTEi9V9JKW4Snr19e5C4Vf6FLQQoYdkfuCPcSTbfI5RkddP8
 bKgB3408WkeSsd+XcrH5lYB1s6k/Yhiuirl2MCl9371DsN13EG+4rVM/YKUvnsadSWpF
 969g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9IcbDBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.27.2 DYNA|AUTH)
 with ESMTPSA id y01375x59A4xkmc
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 9 Jun 2021 12:04:59 +0200 (CEST)
Date: Wed, 9 Jun 2021 12:04:52 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/mcde: Fix off by 10^3 in calculation
Message-ID: <YMCSRLsPBfvlwt1e@gerhold.net>
References: <20210608213318.3897858-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210608213318.3897858-1-linus.walleij@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 08, 2021 at 11:33:18PM +0200, Linus Walleij wrote:
> The calclulation of how many bytes we stuff into the
> DSI pipeline for video mode panels is off by three
> orders of magnitude because we did not account for the
> fact that the DRM mode clock is in kilohertz rather
> than hertz.
> 
> This used to be:
> drm_mode_vrefresh(mode) * mode->htotal * mode->vtotal
> which would become for example for s6e63m0:
> 60 x 514 x 831 = 25628040 Hz, but mode->clock is
> 25628 as it is in kHz.
> 
> This affects only the Samsung GT-I8190 "Golden" phone
> right now since it is the only MCDE device with a video
> mode display.
> 
> Curiously some specimen work with this code and wild
> settings in the EOL and empty packets at the end of the
> display, but I have noticed an eeire flicker until now.
> Others were not so lucky and got black screens.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Reported-by: Stephan Gerhold <stephan@gerhold.net>
> Fixes: 920dd1b1425b ("drm/mcde: Use mode->clock instead of reverse calculating it from the vrefresh")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Can confirm this makes things much better, thanks :)
There is some garbage on the screen for a short moment, but overall it
works really well now.

> ---
>  drivers/gpu/drm/mcde/mcde_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
> index b3fd3501c412..5275b2723293 100644
> --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> @@ -577,7 +577,7 @@ static void mcde_dsi_setup_video_mode(struct mcde_dsi *d,
>  	 * porches and sync.
>  	 */
>  	/* (ps/s) / (pixels/s) = ps/pixels */
> -	pclk = DIV_ROUND_UP_ULL(1000000000000, mode->clock);
> +	pclk = DIV_ROUND_UP_ULL(1000000000000, (mode->clock * 1000));

Removing three 0 in the dividend might be slightly more efficient, i.e.

	pclk = DIV_ROUND_UP(1000000000, mode->clock);

since then we don't need 64-bit division (_ULL) anymore
(1000000000 < 4294967296 = 2^32).

but that's more nitpick level. I tested both, so for both options:

Tested-by: Stephan Gerhold <stephan@gerhold.net>
Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

Thanks!
Stephan
