Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B97E22E1D0
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 20:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCED89D3E;
	Sun, 26 Jul 2020 18:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 360 seconds by postgrey-1.36 at gabe;
 Sun, 26 Jul 2020 18:03:23 UTC
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF1C89D3E
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 18:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595786601;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=sgrIlsRu3tTV7/SFO/NsvidkS88USSPVoIq5RUCV9cY=;
 b=MTzzYluqxTl12B71+38CjibPS2slcJGCKpx1jN4RyqrzoFHWFDH0ysz14eBiTorwi8
 bU5C04k0StwXutKKvR9MXyjU620GcF4JJ7RWbWMTQMCrRfybfQm1a97jlSPsv3hbknzr
 Aexkcyg3GnU39GEJ6bQL4Ye8aEAVJK8O6EIoFVNf9+j3w7nAHcch8Nd+lo5R/w6OFd7u
 Hf7+S0GPjF5WKLK0lcVtgH3ILJf8MTsUOEn17l4H+sD0kkkpKBKfJlgxq3zbGHMEJa+b
 JlaOnZnPTNJ33QAwiMKn5jlF8hC/V2tKLfVU1eSNSQjj/1sah2XTkE+0cpbC12D66lv0
 g3Mw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j8IcjDBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id Y0939ew6QHpII7L
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 26 Jul 2020 19:51:18 +0200 (CEST)
Date: Sun, 26 Jul 2020 19:51:11 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/mcde: Fix stability issue
Message-ID: <20200726175111.GA5343@gerhold.net>
References: <20200718233323.3407670-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200718233323.3407670-1-linus.walleij@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 19, 2020 at 01:33:22AM +0200, Linus Walleij wrote:
> Whenener a display update was sent, apart from updating
> the memory base address we called mcde_display_send_one_frame()
> which also sent a command to the display requesting the TE IRQ
> and enabling the FIFO.
> 
> When continous updates are running this is wrong: we need
> to only send this to start the flow to the display on
> the very first update. This lead to the display pipeline
> locking up and crashing.
> 
> Check if the flow is already running and in that case
> do not call mcde_display_send_one_frame().
> 
> This fixes crashes on the Samsung GT-S7710 (Skomer).
> 
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: stable@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/mcde/mcde_display.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
> index 212aee60cf61..1d8ea8830a17 100644
> --- a/drivers/gpu/drm/mcde/mcde_display.c
> +++ b/drivers/gpu/drm/mcde/mcde_display.c
> @@ -1086,9 +1086,14 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
>  	 */
>  	if (fb) {
>  		mcde_set_extsrc(mcde, drm_fb_cma_get_gem_addr(fb, pstate, 0));
> -		if (!mcde->video_mode)
> -			/* Send a single frame using software sync */
> -			mcde_display_send_one_frame(mcde);
> +		if (!mcde->video_mode) {
> +			/*
> +			 * Send a single frame using software sync if the flow
> +			 * is not active yet.
> +			 */
> +			if (mcde->flow_active == 0)
> +				mcde_display_send_one_frame(mcde);
> +		}

I think this makes sense as a fix for the issue you described, so FWIW:
Acked-by: Stephan Gerhold <stephan@gerhold.net>

While looking at this I had a few thoughts for potential future patches:

 - Clearly mcde_display_send_one_frame() does not only send a single
   frame only in some cases (when te_sync = true), so maybe it should
   be named differently?

 - I was a bit confused because with this change we also call
   mcde_dsi_te_request() only once. Looking at the vendor driver the
   nova_dsilink_te_request() function that is very similar is only
   called within mcde_add_bta_te_oneshot_listener(), which is only
   called for MCDE_SYNCSRC_BTA.

   However, the rest of the MCDE code looks more similar to
   MCDE_SYNCSRC_TE0, which does not call that function in the vendor
   driver. I wonder if mcde_dsi_te_request() is needed at all?

Thanks,
Stephan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
