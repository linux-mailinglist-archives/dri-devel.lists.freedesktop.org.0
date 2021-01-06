Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A74992ECBF4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:53:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA6B6E427;
	Thu,  7 Jan 2021 08:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs38.siol.net [185.57.226.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186146E23F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 20:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 11B5D522C68;
 Wed,  6 Jan 2021 21:53:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id 0m-L2fMwazmn; Wed,  6 Jan 2021 21:53:26 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id BCAB8521967;
 Wed,  6 Jan 2021 21:53:26 +0100 (CET)
Received: from kista.localnet (cpe-86-58-58-53.static.triera.net [86.58.58.53])
 (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 387B8522C68;
 Wed,  6 Jan 2021 21:53:26 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Maxime Ripard <maxime@cerno.tech>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Subject: Re: [PATCH 1/2] drm/sun4i: tcon: fix inverted DCLK polarity
Date: Wed, 06 Jan 2021 22:00:04 +0100
Message-ID: <3685133.SLcexNTYsu@kista>
In-Reply-To: <20210106192800.164052-2-giulio.benetti@micronovasrl.com>
References: <20210106192800.164052-1-giulio.benetti@micronovasrl.com>
 <20210106192800.164052-2-giulio.benetti@micronovasrl.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 07 Jan 2021 08:53:13 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, treding@nvidia.com,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Marjan Pascolo <marjan.pascolo@trexom.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne sreda, 06. januar 2021 ob 20:27:59 CET je Giulio Benetti napisal(a):
> During commit "88bc4178568b8e0331143cc0616640ab72f0cba1" DRM_BUS_FLAG_*

Please use same commit referencing approach as for "Fixes" tag.

> macros have been changed to avoid ambiguity but just because of this
> ambiguity previous DRM_BUS_FLAG_PIXDATA_(POS/NEG)EDGE were used meaning
> _SAMPLE_ not _DRIVE_. This lead to DLCK inversion, so let's swap DCLK
> phase to fix it.
> 

Add Fixes tag here.

Best regards,
Jernej

> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/
sun4i_tcon.c
> index eaaf5d70e352..52598bb0fb0b 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -585,10 +585,10 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon 
*tcon,
>  	 * and DOTCLOCK drivers.
>  	 */
>  	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
> -		clk_set_phase(tcon->dclk, 240);
> +		clk_set_phase(tcon->dclk, 0);
>  
>  	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> -		clk_set_phase(tcon->dclk, 0);
> +		clk_set_phase(tcon->dclk, 240);
>  
>  	regmap_update_bits(tcon->regs, SUN4I_TCON0_IO_POL_REG,
>  			   SUN4I_TCON0_IO_POL_HSYNC_POSITIVE |
> -- 
> 2.25.1
> 
> 


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
