Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAB7396943
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 23:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535966E5A4;
	Mon, 31 May 2021 21:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BAC6E077
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 17:43:50 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 z137-20020a1c7e8f0000b02901774f2a7dc4so282875wmc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 10:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c1dJWE8/bqoCozTf9T8+BdpYclpzU/+Dc7lE6AxNEBI=;
 b=NRPVFwDD8rEy52Orpm6xKCsHgJxm4qfxSPBFHaO3O2WwBO4O/bV2q8L5eMpFYpcF9N
 yMdUV5k6zQ3mqa5b4WTncfq5XO5/7JG1TQzHtyF/mv7eo3I4yUDmmRg0qbysdsrxthkd
 tZIbyUGGtnyavyiJkWgmYZyW1JeFXRc/SOE2E92lYynPtxJ/VHGlUzz+BAij0RsTeohU
 VA9dcXAu+yVKNutno+1Xe0BQQ8m8wwaEOcAkXsRjxRWqd3JxEi6HSPGmYWN9UrjbZYKx
 egONNoYdEU29I6R3SNxWqD2tIijUxDWxxxusYic72vPLvTDFw8ArOMdGO8kyQLF4Ltwn
 uEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c1dJWE8/bqoCozTf9T8+BdpYclpzU/+Dc7lE6AxNEBI=;
 b=KHgtgcPXrCyoRgMEJRVokBeMlskbzvbFOyQAyRT6llB0nDyyNfxKafjbI4QNwVUtJE
 D797ixu/bAqB6bamlg0kvnqhRpRDNBDAPGOmKie/HjKDDqzoIqAXVNKbc9MXC9sJ9x5Q
 /wns8NTFRanYmJDcjxzKgZp4K41cu1nbtswy/XtdXV1wZZILjR/4Xrra4gQLGu+2Tg1x
 niUK0Oq+ZESui7zicTlsjNhfag78oUCVToCBtrCepFO01N4WajBqLWc3k/VXw2hQfXZz
 o7bgz8naAgVjBrGNkrsaT/yGkm3+retC1fU3iBWzjStWWxWhem0gCBMYlIHke0kgnFGL
 RO0Q==
X-Gm-Message-State: AOAM531z84yp5YuIvN92Ijy3kNVpUE9EVi52jEwIaEOLI0xW8z/Jt8NJ
 82CM+aUxUAsPFKFx2p4CyTc=
X-Google-Smtp-Source: ABdhPJyXboJnieQj2LScZWMlnYwhxPqeFGUI7x53NANeeCFFPQRA4whYlsvlHjRf03scAH/8Y5WWaQ==
X-Received: by 2002:a7b:c252:: with SMTP id b18mr22627030wmj.32.1622483029523; 
 Mon, 31 May 2021 10:43:49 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-17-133.cable.triera.net.
 [86.58.17.133])
 by smtp.gmail.com with ESMTPSA id m5sm137060wmq.6.2021.05.31.10.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 10:43:48 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Roman Stratiienko <r.stratiienko@gmail.com>,
 megous@megous.com
Subject: Re: [PATCH v4 2/2] drm/sun4i: Use CRTC size instead of primary plane
 size as mixer frame
Date: Mon, 31 May 2021 19:43:42 +0200
Message-ID: <2057488.cpEgfWUaUY@kista>
In-Reply-To: <20210528203036.17999-3-r.stratiienko@gmail.com>
References: <20210528203036.17999-1-r.stratiienko@gmail.com>
 <20210528203036.17999-3-r.stratiienko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailman-Approved-At: Mon, 31 May 2021 21:20:10 +0000
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
Cc: dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-sunxi@googlegroups.com, Roman Stratiienko <r.stratiienko@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

General note, you should send Allwinner specific patches to linux-
sunxi@lists.linux.dev too. It's already in MAINTAINERS, but probably it's not 
yet propagated in all trees.

Dne petek, 28. maj 2021 ob 22:30:36 CEST je Roman Stratiienko napisal(a):
> Fixes corrupted display picture when primary plane isn't full-screen.

You should expand this a bit more. Most importantly why this fixes a bug? Rule 
of thumb - if you used word "fix" in commit message, most of the time you 
should add Fixes tag too.

> 
> Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 28 ++++++++++++++++++++++++
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 30 --------------------------
>  2 files changed, 28 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/
sun8i_mixer.c
> index 5b42cf25cc86..810c731566c0 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -248,6 +248,33 @@ int sun8i_mixer_drm_format_to_hw(u32 format, u32 
*hw_format)
>  	return -EINVAL;
>  }
>  
> +static void sun8i_mode_set(struct sunxi_engine *engine,
> +			   struct drm_display_mode *mode)
> +{
> +	u32 size = SUN8I_MIXER_SIZE(mode->crtc_hdisplay, mode-
>crtc_vdisplay);

CRTC variants are not appropriate here. These are adjusted for interlacing and 
other stuff. This is important during TCON configuration, not here. Just drop 
"crtc_" prefix.

Best regards,
Jernej

> +	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
> +	u32 bld_base = sun8i_blender_base(mixer);
> +	u32 val;
> +
> +	DRM_DEBUG_DRIVER("Mode change, updating global size W: %u H: %u\n",
> +			 mode->crtc_hdisplay, mode->crtc_vdisplay);
> +	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_SIZE, size);
> +	regmap_write(mixer->engine.regs,
> +		     SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
> +
> +	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> +		val = SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
> +	else
> +		val = 0;
> +
> +	regmap_update_bits(mixer->engine.regs,
> +			   SUN8I_MIXER_BLEND_OUTCTL(bld_base),
> +			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED,
> +			   val);
> +	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
> +			 val ? "on" : "off");
> +}
> +
>  static void sun8i_mixer_commit(struct sunxi_engine *engine)
>  {
>  	DRM_DEBUG_DRIVER("Committing changes\n");
> @@ -301,6 +328,7 @@ static struct drm_plane **sun8i_layers_init(struct 
drm_device *drm,
>  static const struct sunxi_engine_ops sun8i_engine_ops = {
>  	.commit		= sun8i_mixer_commit,
>  	.layers_init	= sun8i_layers_init,
> +	.mode_set	= sun8i_mode_set,
>  };
>  
>  static const struct regmap_config sun8i_mixer_regmap_config = {
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/
sun8i_ui_layer.c
> index 0db164a774a1..d66fff582278 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -120,36 +120,6 @@ static int sun8i_ui_layer_update_coord(struct 
sun8i_mixer *mixer, int channel,
>  	insize = SUN8I_MIXER_SIZE(src_w, src_h);
>  	outsize = SUN8I_MIXER_SIZE(dst_w, dst_h);
>  
> -	if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
> -		bool interlaced = false;
> -		u32 val;
> -
> -		DRM_DEBUG_DRIVER("Primary layer, updating global size 
W: %u H: %u\n",
> -				 dst_w, dst_h);
> -		regmap_write(mixer->engine.regs,
> -			     SUN8I_MIXER_GLOBAL_SIZE,
> -			     outsize);
> -		regmap_write(mixer->engine.regs,
> -			     SUN8I_MIXER_BLEND_OUTSIZE(bld_base), 
outsize);
> -
> -		if (state->crtc)
> -			interlaced = state->crtc->state-
>adjusted_mode.flags
> -				& DRM_MODE_FLAG_INTERLACE;
> -
> -		if (interlaced)
> -			val = SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
> -		else
> -			val = 0;
> -
> -		regmap_update_bits(mixer->engine.regs,
> -				   
SUN8I_MIXER_BLEND_OUTCTL(bld_base),
> -				   
SUN8I_MIXER_BLEND_OUTCTL_INTERLACED,
> -				   val);
> -
> -		DRM_DEBUG_DRIVER("Switching display mixer interlaced 
mode %s\n",
> -				 interlaced ? "on" : "off");
> -	}
> -
>  	/* Set height and width */
>  	DRM_DEBUG_DRIVER("Layer source offset X: %d Y: %d\n",
>  			 state->src.x1 >> 16, state->src.y1 >> 16);
> 


