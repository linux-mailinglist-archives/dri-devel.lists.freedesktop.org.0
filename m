Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0507212DBEA
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 22:04:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967CA6E271;
	Tue, 31 Dec 2019 21:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs55.siol.net [185.57.226.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF1D6E211
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 11:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id A35B1523032;
 Tue, 31 Dec 2019 12:24:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id mVev96vKAiOH; Tue, 31 Dec 2019 12:24:04 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 4A6DB523035;
 Tue, 31 Dec 2019 12:24:04 +0100 (CET)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net
 [89.212.178.211]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 01118523020;
 Tue, 31 Dec 2019 12:24:03 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: mripard@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 roman.stratiienko@globallogic.com
Subject: Re: [PATCH v2 2/4] drm/sun4i: Add mode_set callback to the engine
Date: Tue, 31 Dec 2019 12:24:03 +0100
Message-ID: <2843589.CbtlEUcBR6@jernej-laptop>
In-Reply-To: <20191229162828.3326-2-roman.stratiienko@globallogic.com>
References: <20191229162828.3326-1-roman.stratiienko@globallogic.com>
 <20191229162828.3326-2-roman.stratiienko@globallogic.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 31 Dec 2019 21:04:21 +0000
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
Cc: Roman Stratiienko <roman.stratiienko@globallogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Dne nedelja, 29. december 2019 ob 17:28:26 CET je 
roman.stratiienko@globallogic.com napisal(a):
> From: Roman Stratiienko <roman.stratiienko@globallogic.com>
> 
> Create callback to update engine's registers on mode change.
> 
> Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej

> ---
> v2:
> - Split commit in 2 parts.
> - Add description to mode_set callback
> - Dropped 1 line from sun4i_crtc_mode_set_nofb()
> - Add struct drm_display_mode declaration (fix build warning)
> ---
>  drivers/gpu/drm/sun4i/sun4i_crtc.c   |  3 +++
>  drivers/gpu/drm/sun4i/sunxi_engine.h | 12 ++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c
> b/drivers/gpu/drm/sun4i/sun4i_crtc.c index 3a153648b369..f9c627d601c3
> 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
> @@ -141,6 +141,9 @@ static void sun4i_crtc_mode_set_nofb(struct drm_crtc
> *crtc) struct sun4i_crtc *scrtc = drm_crtc_to_sun4i_crtc(crtc);
> 
>  	sun4i_tcon_mode_set(scrtc->tcon, encoder, mode);
> +
> +	if (scrtc->engine->ops->mode_set)
> +		scrtc->engine->ops->mode_set(scrtc->engine, mode);
>  }
> 
>  static const struct drm_crtc_helper_funcs sun4i_crtc_helper_funcs = {
> diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h
> b/drivers/gpu/drm/sun4i/sunxi_engine.h index 548710a936d5..44102783ee3c
> 100644
> --- a/drivers/gpu/drm/sun4i/sunxi_engine.h
> +++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
> @@ -9,6 +9,7 @@
>  struct drm_plane;
>  struct drm_device;
>  struct drm_crtc_state;
> +struct drm_display_mode;
> 
>  struct sunxi_engine;
> 
> @@ -108,6 +109,17 @@ struct sunxi_engine_ops {
>  	 * This function is optional.
>  	 */
>  	void (*vblank_quirk)(struct sunxi_engine *engine);
> +
> +	/**
> +	 * @mode_set:
> +	 *
> +	 * This callback is used to update engine registers that
> +	 * responsible for display frame size other mode attributes.
> +	 *
> +	 * This function is optional.
> +	 */
> +	void (*mode_set)(struct sunxi_engine *engine,
> +			 struct drm_display_mode *mode);
>  };
> 
>  /**




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
