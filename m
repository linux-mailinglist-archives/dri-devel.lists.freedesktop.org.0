Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA19396940
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 23:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A065B6E51B;
	Mon, 31 May 2021 21:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 448 seconds by postgrey-1.36 at gabe;
 Mon, 31 May 2021 08:45:43 UTC
Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F846E885
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 08:45:43 +0000 (UTC)
Received: from plaes.org (localhost [127.0.0.1])
 by mail.plaes.org (Postfix) with ESMTPSA id 53C7E401EF;
 Mon, 31 May 2021 08:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=plaes.org; s=mail;
 t=1622450293; bh=8DR2WfBPfi71xrr6iJvbxQwopR/vHO08E+E1+cSvGdM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HSO1lZ+iejhV4unycQcLpqUOPJKm5/6P/2fasHoSBD1WCYobj6e4/BZIn2895DmPy
 YRnjkgwYp+ploJNhpb/HhDzavwpzf0h+3riVo1eTOviaoNtKNbE/coHQmCwpcCU+uB
 NyMbXdwjxCCvKNYBGiSWRLUDp3jrWdihNe5UD/Aqbxse8IFUSYefYrGwFzJNG2bxKg
 FHgNnDQ6QEcHHkN0VkpGc71+JlIGe/iLvXORVl4o7vJmtWK7MXV1e4w8nzXyH9l+8p
 Fh0obQrVpns0/fDBnm5ZW+E6HsZ2MIGEIJYkZSgcaQ5z3zZUTgnFO8GHp6rWy1nZeE
 YcNAarBAnk6iQ==
Date: Mon, 31 May 2021 08:38:12 +0000
From: Priit Laes <plaes@plaes.org>
To: Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [linux-sunxi] [PATCH v4 1/2] drm/sun4i: Add mode_set callback to
 the engine
Message-ID: <20210531083812.GB7041@plaes.org>
References: <20210528203036.17999-1-r.stratiienko@gmail.com>
 <20210528203036.17999-2-r.stratiienko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528203036.17999-2-r.stratiienko@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 31 May 2021 21:20:09 +0000
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
Cc: megous@megous.com, jernej.skrabec@siol.net, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, wens@csie.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 28, 2021 at 11:30:35PM +0300, Roman Stratiienko wrote:
> Create callback to allow updating engine's registers on mode change.
> 
> Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/sun4i/sun4i_crtc.c   |  3 +++
>  drivers/gpu/drm/sun4i/sunxi_engine.h | 12 ++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i/sun4i_crtc.c
> index 45d9eb552d86..8f01a6b2bbef 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
> @@ -146,6 +146,9 @@ static void sun4i_crtc_mode_set_nofb(struct drm_crtc *crtc)
>  	struct sun4i_crtc *scrtc = drm_crtc_to_sun4i_crtc(crtc);
>  
>  	sun4i_tcon_mode_set(scrtc->tcon, encoder, mode);
> +
> +	if (scrtc->engine->ops->mode_set)
> +		scrtc->engine->ops->mode_set(scrtc->engine, mode);
>  }
>  
>  static const struct drm_crtc_helper_funcs sun4i_crtc_helper_funcs = {
> diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
> index 548710a936d5..7faa844646ff 100644
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
> +	 * responsible for display frame size and other mode attributes.

This sentence needs a little grammatical fixup.

> +	 *
> +	 * This function is optional.
> +	 */
> +	void (*mode_set)(struct sunxi_engine *engine,
> +			 struct drm_display_mode *mode);
>  };
>  
>  /**
> -- 
> 2.30.2
> 
> -- 
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/20210528203036.17999-2-r.stratiienko%40gmail.com.
