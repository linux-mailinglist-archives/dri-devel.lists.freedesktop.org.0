Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B731D12DBE5
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 22:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7415189F0A;
	Tue, 31 Dec 2019 21:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs43.siol.net [185.57.226.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4866E215
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 12:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 5A4B05234D4;
 Tue, 31 Dec 2019 13:06:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id 2dJjqKlJ9pgR; Tue, 31 Dec 2019 13:06:03 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id DD6FD52345B;
 Tue, 31 Dec 2019 13:06:03 +0100 (CET)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net
 [89.212.178.211]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id A6E955234B2;
 Tue, 31 Dec 2019 13:06:03 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: mripard@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 roman.stratiienko@globallogic.com
Subject: Re: [PATCH v2 3/4] drm/sun4i: Use CRTC size instead of PRIMARY plane
 size as mixer frame.
Date: Tue, 31 Dec 2019 13:06:03 +0100
Message-ID: <6139998.4vTCxPXJkl@jernej-laptop>
In-Reply-To: <20191229162828.3326-3-roman.stratiienko@globallogic.com>
References: <20191229162828.3326-1-roman.stratiienko@globallogic.com>
 <20191229162828.3326-3-roman.stratiienko@globallogic.com>
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

Sorry that I missed few details in first review. Please take a look below.

Dne nedelja, 29. december 2019 ob 17:28:27 CET je 
roman.stratiienko@globallogic.com napisal(a):
> From: Roman Stratiienko <roman.stratiienko@globallogic.com>
> 
> According to DRM documentation the only difference between PRIMARY
> and OVERLAY plane is that each CRTC must have PRIMARY plane and
> OVERLAY are optional.
> 
> Allow PRIMARY plane to have dimension different from full-screen.
> 
> Fixes: 90212fffa4fc ("drm/sun4i: Use values calculated by atomic check")

This fixes tag doesn't seem to be a good choice. First time where code in 
question was introduced was:

9d75b8c0b999 drm/sun4i: add support for Allwinner DE2 mixers

and it was later moved to sun8i_ui_layer.c in:

5bb5f5dafa1a drm/sun4i: Reorganize UI layer code in DE2

Not sure which one is better. You can also include both.

> Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
> ---
> v2:
> - Split commit in 2 parts
> - Add Fixes line to the commit message
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 35 ++++++++++++++++++++++++++
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 30 ----------------------
>  2 files changed, 35 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> b/drivers/gpu/drm/sun4i/sun8i_mixer.c index d306ad5dc093..5d90a95ff855
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -257,6 +257,40 @@ const struct de2_fmt_info *sun8i_mixer_format_info(u32
> format) return NULL;
>  }
> 
> +static void sun8i_mode_set(struct sunxi_engine *engine,
> +			   struct drm_display_mode *mode)
> +{
> +	u32 dst_w = mode->crtc_hdisplay;
> +	u32 dst_h = mode->crtc_vdisplay;

Now that you moved code in separate function, "dst_" prefix doesn't make sense 
anymore. Plain "width" and "height" work just fine.

> +	u32 outsize = SUN8I_MIXER_SIZE(dst_w, dst_h);
> +	bool interlaced = false;

No need to initialize above variable. This value is never used.

> +	u32 val;
> +	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
> +	u32 bld_base = sun8i_blender_base(mixer);

Not extremely important, but can you move above two lines to the top? At least 
I prefer to have those lines sorted from longest to shortest as much as 
possible.

Once above comments are addressed, code is:
Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej

> +
> +	DRM_DEBUG_DRIVER("Mode change, updating global size W: %u H: %u\n",
> +			 dst_w, dst_h);
> +	regmap_write(mixer->engine.regs,
> +		     SUN8I_MIXER_GLOBAL_SIZE,
> +		     outsize);
> +	regmap_write(mixer->engine.regs,
> +		     SUN8I_MIXER_BLEND_OUTSIZE(bld_base), outsize);
> +
> +	interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
> +
> +	if (interlaced)
> +		val = SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
> +	else
> +		val = 0;
> +
> +	regmap_update_bits(mixer->engine.regs,
> +			   SUN8I_MIXER_BLEND_OUTCTL(bld_base),
> +			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED,
> +			   val);
> +	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
> +			 interlaced ? "on" : "off");
> +}
> +
>  static void sun8i_mixer_commit(struct sunxi_engine *engine)
>  {
>  	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
> @@ -356,6 +390,7 @@ static struct drm_plane **sun8i_layers_init(struct
> drm_device *drm, static const struct sunxi_engine_ops sun8i_engine_ops = {
>  	.commit		= sun8i_mixer_commit,
>  	.layers_init	= sun8i_layers_init,
> +	.mode_set	= sun8i_mode_set,
>  };
> 
>  static struct regmap_config sun8i_mixer_regmap_config = {
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c index ee7c13d8710f..23c2f4b68c89
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -72,36 +72,6 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer
> *mixer, int channel, insize = SUN8I_MIXER_SIZE(src_w, src_h);
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




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
