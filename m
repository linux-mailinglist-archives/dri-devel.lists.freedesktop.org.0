Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E6D19226B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 09:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4126A6E5A5;
	Wed, 25 Mar 2020 08:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs53.siol.net [185.57.226.244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510606E4FF
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 17:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id C5D455203C2;
 Tue, 24 Mar 2020 18:49:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id GHJdAO5FWp1p; Tue, 24 Mar 2020 18:49:26 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id 00C10524752;
 Tue, 24 Mar 2020 18:49:25 +0100 (CET)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net
 [194.152.20.232]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Zimbra) with ESMTPA id 8F7C45203C2;
 Tue, 24 Mar 2020 18:49:21 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: mripard@kernel.org, wens@csie.org,
 Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [PATCH v4 3/4] drm/sun4i: Add support for premulti/coverage
 blending mode handling
Date: Tue, 24 Mar 2020 18:49:21 +0100
Message-ID: <20591297.EfDdHjke4D@jernej-laptop>
In-Reply-To: <20200302103138.17916-4-r.stratiienko@gmail.com>
References: <20200302103138.17916-4-r.stratiienko@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Mar 2020 08:16:37 +0000
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
Cc: airlied@linux.ie, Roman Stratiienko <r.stratiienko@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Dne ponedeljek, 02. marec 2020 ob 11:31:37 CET je Roman Stratiienko 
napisal(a):
> Argument:
> 
> All information below is author's understanding of underlying processes.
> This information was obtained from DE2.0-3.0 datasheet analysis and
> analysis of different DRM driver source code and commit messages.
> 
> Input buffers could have 2 ways of holding pixel alpha channel value.
> 1. Coverage means that in case of transparency - only alpha channel changes.
> Example of 50% transparent white pixel: R=0xff B=0xff B=0xff A=0x7f
> 
> 2. Premultiply means that RGB pixel values should be dimmed proportional to
>    alpha channel value. Alpha channel value has also to be set in this case.
> Example of 50% transparent white pixel: R=0x7f B=0x7f B=0x7f A=0x7f
> 
> Userspace informs DRM/KMS which blending type frame buffer uses with
> 'pixel blend mode' property.
> 
> Allwinner DE2.0 and DE3.0 have 2 block of image processing:
> Overlay and Blending. Both should aware of blending type are used in the
> buffer.
> 
> Overlay block uses this information to:
> 1. Unify blending types if more then 1 overlay channel are used. It can
> unify it only as premultiplied by converting coverage to premultiplied.
> 2. Calculate correct pixel value in case of applying plane alpha.
>    For coverage alpha only alpha channel should be affected:
>      [Ro=Ri, Go=Gi, Bo=Bi, Ao=Ai*AGlobal]
>    For premultiplied alpha all 4 channels should be affected:
>      [Ro=Ri*AGlobal, Go=Gi*AGlobal, Bo=Bi*AGlobal, Ao=Ai*AGlobal]
> 
> Blending functional block should aware of blending type each pipe
> channel uses. Otherwise image can't blend correctly.
> 
> In case we've specified premultiplied format for blending PIPE0, blender
> converts premultiplied RGB values to original (divides by normalized Alpha).
> In case for some reason pixel value after division exceeds 0xff, blender
> clamps it to 0xff. [Was discovered in experimental way]
> If image that passed through PIPE1-3 restored to coverage before mixing or
> used in premultiplied form still require testing and out of scope of this
> patch.
> 
> Implementation:
> 
> 1. Add blend property to UI channel
> 2. Add blend property to VI channel in case of DE3.0 used
> 3. Make all DE2.0 UI and DE3.0 VI overlay channels to use premultiply
> format. Mark all blending pipes as premultiply except DE2.0 VI plane.
> 4. If DRM plane uses coverage blending format, set blending mode register
>    to convert it to premultiply.

Regarding 3 and 4 - do we really need to convert everything to premultiply? 
Currently only one overlay is used in each channel, so there is no need to 
convert coverage to premultiply if I understand datasheet correctly. Just mark 
it accordingly in BLD premultiply control register.

> 
> Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
> 
> --
> 
> v4:
> - Initial version (Depends on unmerged patches from patchset)
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.h    |  2 ++
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 33 ++++++++++++++++++-----
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  5 ++++
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 36 +++++++++++++++++++++-----
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.h |  5 ++++
>  5 files changed, 69 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> b/drivers/gpu/drm/sun4i/sun8i_mixer.h index 915479cc3077..8a18372938d5
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -70,6 +70,8 @@
>  #define SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(n)	(0xf << ((n) << 2))
>  #define SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(n)	((n) << 2)
> 
> +#define SUN8I_MIXER_BLEND_PREMULTIPLY_EN(pipe)	BIT(pipe)
> +
>  #define SUN8I_MIXER_BLEND_OUTCTL_INTERLACED	BIT(1)
> 
>  #define SUN50I_MIXER_BLEND_CSC_CTL_EN(ch)	BIT(ch)
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c index 5278032567a3..dd6145f80c36
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -73,10 +73,12 @@ static void sun8i_ui_layer_enable(struct sun8i_mixer
> *mixer, int channel, }
> 
>  static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int
> channel, -					int overlay, struct 
drm_plane *plane)
> +					int overlay, struct 
drm_plane *plane,
> +					unsigned int zpos)
>  {
> -	u32 mask, val, ch_base;
> +	u32 mask, val, ch_base, bld_base;
> 
> +	bld_base = sun8i_blender_base(mixer);
>  	ch_base = sun8i_channel_base(mixer, channel);
> 
>  	mask = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK |
> @@ -84,13 +86,27 @@ static void sun8i_ui_layer_update_alpha(struct
> sun8i_mixer *mixer, int channel,
> 
>  	val = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(plane->state->alpha >> 
8);
> 
> -	val |= (plane->state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
> -		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
> -		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> +	if (plane->state->pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
> +		val |= SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_LAYER;
> +	} else {
> +		val |= (plane->state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
> +			
SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
> +			
SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> +
> +		if (plane->state->pixel_blend_mode == 
DRM_MODE_BLEND_COVERAGE)
> +			val |= 
SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_COV2PREMUL;
> +		else
> +			val |= 
SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_PREMULTI;
> +	}
> 
>  	regmap_update_bits(mixer->engine.regs,
>  			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, 
overlay),
>  			   mask, val);
> +
> +	regmap_update_bits(mixer->engine.regs,
> +			   SUN8I_MIXER_BLEND_PREMULTIPLY(bld_base),
> +			   SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos),
> +			   SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos));

As you already figured out in previous patch [1], register values based on zpos 
can only be properly determined in sun8i_mixer_commit(). To be honest, I would 
like to see patch [1] to go in before this.

Note: Comment is also applicable to VI layer changes.

Best regards,
Jernej

[1] https://patchwork.freedesktop.org/patch/346998/

>  }
> 
>  static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int
> channel, @@ -280,7 +296,7 @@ static void
> sun8i_ui_layer_atomic_update(struct drm_plane *plane,
> sun8i_ui_layer_update_coord(mixer, layer->channel,
>  				    layer->overlay, plane, zpos);
>  	sun8i_ui_layer_update_alpha(mixer, layer->channel,
> -				    layer->overlay, plane);
> +				    layer->overlay, plane, zpos);
>  	sun8i_ui_layer_update_formats(mixer, layer->channel,
>  				      layer->overlay, plane);
>  	sun8i_ui_layer_update_buffer(mixer, layer->channel,
> @@ -361,6 +377,11 @@ struct sun8i_ui_layer *sun8i_ui_layer_init_one(struct
> drm_device *drm, return ERR_PTR(ret);
>  	}
> 
> +	drm_plane_create_blend_mode_property(&layer->plane,
> +					     
BIT(DRM_MODE_BLEND_PREMULTI) |
> +					     
BIT(DRM_MODE_BLEND_COVERAGE) |
> +					     
BIT(DRM_MODE_BLEND_PIXEL_NONE));
> +
>  	ret = drm_plane_create_zpos_property(&layer->plane, channel,
>  					     0, plane_cnt - 
1);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
> b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h index e3e32ee1178d..c5136f4841bc
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
> @@ -41,6 +41,11 @@
>  #define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET	8
>  #define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK	GENMASK(31, 24)
>  #define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(x)		((x) << 24)
> +#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_MASK	GENMASK(16, 17)
> +
> +#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_COVERAGE		
((0) << 16)
> +#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_COV2PREMUL		
((1) << 16)
> +#define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_BLEND_PREMULTI		
((2) << 16)
> 
>  #define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL		
((0) << 1)
>  #define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_LAYER		
((1) << 1)
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c index f2469b5e97ee..e6d8a539614f
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -66,11 +66,13 @@ static void sun8i_vi_layer_enable(struct sun8i_mixer
> *mixer, int channel, }
> 
>  static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int
> channel, -					int overlay, struct 
drm_plane *plane)
> +					int overlay, struct 
drm_plane *plane,
> +					unsigned int zpos)
>  {
> -	u32 mask, val, ch_base;
> +	u32 mask, val, ch_base, bld_base;
> 
>  	ch_base = sun8i_channel_base(mixer, channel);
> +	bld_base = sun8i_blender_base(mixer);
> 
>  	if (mixer->cfg->is_de3) {
>  		mask = SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK |
> @@ -78,9 +80,18 @@ static void sun8i_vi_layer_update_alpha(struct
> sun8i_mixer *mixer, int channel, val =
> SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA
>  			(plane->state->alpha >> 8);
> 
> -		val |= (plane->state->alpha == DRM_BLEND_ALPHA_OPAQUE) 
?
> -			
SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL :
> -			
SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> +		if (plane->state->pixel_blend_mode == 
DRM_MODE_BLEND_PIXEL_NONE) {
> +			val |= 
SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_LAYER;
> +		} else {
> +			val |= (plane->state->alpha == 
DRM_BLEND_ALPHA_OPAQUE) ?
> +				
SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL :
> +				
SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> +
> +			if (plane->state->pixel_blend_mode == 
DRM_MODE_BLEND_COVERAGE)
> +				val |= 
SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_COV2PREMUL;
> +			else
> +				val |= 
SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_PREMULTI;
> +		}
> 
>  		regmap_update_bits(mixer->engine.regs,
>  				   
SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base,
> @@ -93,6 +104,13 @@ static void sun8i_vi_layer_update_alpha(struct
> sun8i_mixer *mixer, int channel, SUN8I_MIXER_FCC_GLOBAL_ALPHA
>  					(plane->state->alpha 
>> 8));
>  	}
> +
> +	regmap_update_bits(mixer->engine.regs,
> +			   SUN8I_MIXER_BLEND_PREMULTIPLY(bld_base),
> +			   SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos),
> +			   (mixer->cfg->is_de3) ?
> +				
SUN8I_MIXER_BLEND_PREMULTIPLY_EN(zpos) : 0);
> +
>  }
> 
>  static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int
> channel, @@ -396,7 +414,7 @@ static void
> sun8i_vi_layer_atomic_update(struct drm_plane *plane,
> sun8i_vi_layer_update_coord(mixer, layer->channel,
>  				    layer->overlay, plane, zpos);
>  	sun8i_vi_layer_update_alpha(mixer, layer->channel,
> -				    layer->overlay, plane);
> +				    layer->overlay, plane, zpos);
>  	sun8i_vi_layer_update_formats(mixer, layer->channel,
>  				      layer->overlay, plane);
>  	sun8i_vi_layer_update_buffer(mixer, layer->channel,
> @@ -504,6 +522,12 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct
> drm_device *drm, }
>  	}
> 
> +	if (mixer->cfg->is_de3)
> +		drm_plane_create_blend_mode_property
> +			(&layer->plane, BIT(DRM_MODE_BLEND_PREMULTI) 
|
> +			 BIT(DRM_MODE_BLEND_COVERAGE) |
> +			 BIT(DRM_MODE_BLEND_PIXEL_NONE));
> +
>  	ret = drm_plane_create_zpos_property(&layer->plane, index,
>  					     0, plane_cnt - 
1);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
> b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h index 48c399e1c86d..a1cf0ff16543
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
> @@ -43,6 +43,11 @@
>  #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_MASK	GENMASK(2, 1)
>  #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MASK	GENMASK(31, 24)
>  #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA(x)	((x) << 24)
> +#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_MASK	GENMASK(16, 17)
> +
> +#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_COVERAGE		
((0) << 16)
> +#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_COV2PREMUL	((1) << 16)
> +#define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_BLEND_PREMULTI		
((2) << 16)
> 
>  #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL	((0) << 1)
>  #define SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_LAYER	((1) << 1)




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
