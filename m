Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA53E218287
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 10:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB236E8A5;
	Wed,  8 Jul 2020 08:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36F16E8A0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 08:31:35 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jt5UL-0008CP-Vq; Wed, 08 Jul 2020 10:31:33 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jt5UL-0006jo-Ge; Wed, 08 Jul 2020 10:31:33 +0200
Message-ID: <a55b91f01a2e795fe2dd38d860e63a63c8c8871c.camel@pengutronix.de>
Subject: Re: [PATCH] drm: imx: Fix occasional screen corruption on modeset.
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Martin Fuzzey <martin.fuzzey@flowbird.group>
Date: Wed, 08 Jul 2020 10:31:33 +0200
In-Reply-To: <1594137527-15201-1-git-send-email-martin.fuzzey@flowbird.group>
References: <1594137527-15201-1-git-send-email-martin.fuzzey@flowbird.group>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Martin,

On Tue, 2020-07-07 at 17:56 +0200, Martin Fuzzey wrote:
> When performing a modeset the atomic core calls
> ipu_crtc_atomic_disable() which switches off the DC and DI.
> 
> When we immediately restart as in the modeset case this sometimes
> leads to corruption at the bottom of the screen looking like a mirror
> image of the top.

Could this be just a panel getting confused because the pixel clock is
disabled, or is there really an issue with the IPU? Have you tried just
keeping clk_di_pixel enabled in ipu_di_disable(), but continuing
to disable DI and DC?

> The exact reason isn't understood but it seems timing related.
> 
> This was observed on i.MX6DL on a system that does 2 mode
> transitions on boot (fbcon->android boot animation->android homescreen)
> then no more during normal operation resulting in corruption
> about once every 10 boots that lasted for variable durations
> from a few seconds to several hours.
> 
> Dumping the buffers confirmed that they were correct in memory,
> just the display was wrong.
> 
> For tests the problem was reproduced systematically by forcing
> a full modeset every 10 frames even if when not required.
> 
> Leaving the DC and DI on if the CRTC is staying on fixes this.
> 
> Signed-off-by: Martin Fuzzey <martin.fuzzey@flowbird.group>
> ---
>  drivers/gpu/drm/imx/ipuv3-crtc.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3-crtc.c
> index 63c0284..9137b64 100644
> --- a/drivers/gpu/drm/imx/ipuv3-crtc.c
> +++ b/drivers/gpu/drm/imx/ipuv3-crtc.c
> @@ -84,8 +84,15 @@ static void ipu_crtc_atomic_disable(struct drm_crtc *crtc,
>  	struct ipu_crtc *ipu_crtc = to_ipu_crtc(crtc);
>  	struct ipu_soc *ipu = dev_get_drvdata(ipu_crtc->dev->parent);
>  
> -	ipu_dc_disable_channel(ipu_crtc->dc);
> -	ipu_di_disable(ipu_crtc->di);
> +	/*
> +	 * If we are just doing a modeset don't disable dc/di as that
> +	 * sometimes leads to corruption at the bottom of the screen
> +	 */
> +	if (!crtc->state->active) {
> +		ipu_dc_disable_channel(ipu_crtc->dc);
> +		ipu_di_disable(ipu_crtc->di);

Just removing ipu_di_disable() leaks a clk_prepare_enable refcount on
the di->clk_di_pixel clock.

Also this is followed by an ipu_dc_disable(), which should remove the DC
module's clock if this is the only display. So the DC should be disabled
anyway.

> +	}
> +
>  	/*
>  	 * Planes must be disabled before DC clock is removed, as otherwise the
>  	 * attached IDMACs will be left in undefined state, possibly hanging

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
