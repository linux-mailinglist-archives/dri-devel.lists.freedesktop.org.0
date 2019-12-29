Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4907812C2CC
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2019 15:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D649D89E32;
	Sun, 29 Dec 2019 14:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs48.siol.net [185.57.226.239])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A67889AB3
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2019 09:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 5405F521AA5;
 Sun, 29 Dec 2019 10:40:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id npAMj_sTePaG; Sun, 29 Dec 2019 10:40:28 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id A6CEB521A9B;
 Sun, 29 Dec 2019 10:40:28 +0100 (CET)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net
 [89.212.178.211]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 710FA521A9A;
 Sun, 29 Dec 2019 10:40:28 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: mripard@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 roman.stratiienko@globallogic.com
Subject: Re: [RFC 3/4] drm/sun4i: Reimplement plane z position setting logic
Date: Sun, 29 Dec 2019 10:40:28 +0100
Message-ID: <3994677.ejJDZkT8p0@jernej-laptop>
In-Reply-To: <20191228202818.69908-4-roman.stratiienko@globallogic.com>
References: <20191228202818.69908-1-roman.stratiienko@globallogic.com>
 <20191228202818.69908-4-roman.stratiienko@globallogic.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 29 Dec 2019 14:43:42 +0000
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

Dne sobota, 28. december 2019 ob 21:28:17 CET je 
roman.stratiienko@globallogic.com napisal(a):
> From: Roman Stratiienko <roman.stratiienko@globallogic.com>
> 
> To set blending channel order register software needs to know state and
> position of each channel, which impossible at plane commit stage.
> 
> Move this procedure to atomic_flush stage, where all necessary information
> is available.
> 
> Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 47 +++++++++++++++++++++++++-
>  drivers/gpu/drm/sun4i/sun8i_mixer.h    |  3 ++
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 42 ++++-------------------
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 39 +++------------------
>  4 files changed, 60 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> b/drivers/gpu/drm/sun4i/sun8i_mixer.c index bb9a665fd053..da84fccf7784
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -307,8 +307,47 @@ static void sun8i_atomic_begin(struct sunxi_engine
> *engine,
> 
>  static void sun8i_mixer_commit(struct sunxi_engine *engine)
>  {
> -	DRM_DEBUG_DRIVER("Committing changes\n");
> +	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
> +	u32 base = sun8i_blender_base(mixer);
> +	int i, j;
> +	int channel_by_zpos[4] = {-1, -1, -1, -1};
> +	u32 route = 0, pipe_ctl = 0;
> +
> +	DRM_DEBUG_DRIVER("Update blender routing\n");

Use drm_dbg().

> +	for (i = 0; i < 4; i++)	{
> +		int zpos = mixer->channel_zpos[i];

channel_zpos can hold 5 elements which is also theoretical maximum for current 
HW design. Why do you check only 4 elements?

It would be great to introduce a macro like SUN8I_MIXER_MAX_LAYERS so everyone 
would understand where this number comes from.

> +
> +		if (zpos >= 0 && zpos < 4)
> +			channel_by_zpos[zpos] = i;
> +	}
> +
> +	j = 0;
> +	for (i = 0; i < 4; i++)	{
> +		int ch = channel_by_zpos[i];
> +
> +		if (ch >= 0) {
> +			pipe_ctl |= SUN8I_MIXER_BLEND_PIPE_CTL_EN(j);
> +			route |= ch << 
SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(j);
> +			j++;
> +		}
> +	}
> +
> +	for (i = 0; i < 4 && j < 4; i++) {
> +		int zpos = mixer->channel_zpos[i];
> 
> +		if (zpos < 0) {
> +			route |= i << 
SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(j);
> +			j++;
> +		}
> +	}
> +
> +	regmap_update_bits(mixer->engine.regs, 
SUN8I_MIXER_BLEND_PIPE_CTL(base),
> +			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 
pipe_ctl);
> +
> +	regmap_write(mixer->engine.regs,
> +		     SUN8I_MIXER_BLEND_ROUTE(base), route);
> +
> +	DRM_DEBUG_DRIVER("Committing changes\n");

Use drm_dbg().

>  	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
>  		     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
>  }
> @@ -422,6 +461,12 @@ static int sun8i_mixer_bind(struct device *dev, struct
> device *master, mixer->engine.ops = &sun8i_engine_ops;
>  	mixer->engine.node = dev->of_node;
> 
> +	mixer->channel_zpos[0] = -1;
> +	mixer->channel_zpos[1] = -1;
> +	mixer->channel_zpos[2] = -1;
> +	mixer->channel_zpos[3] = -1;
> +	mixer->channel_zpos[4] = -1;
> +

for loop would be better, especially using proposed macro.

Best regards,
Jernej

>  	/*
>  	 * While this function can fail, we shouldn't do anything
>  	 * if this happens. Some early DE2 DT entries don't provide
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> b/drivers/gpu/drm/sun4i/sun8i_mixer.h index 915479cc3077..9c2ff87923d8
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -178,6 +178,9 @@ struct sun8i_mixer {
> 
>  	struct clk			*bus_clk;
>  	struct clk			*mod_clk;
> +
> +	/* -1 means that layer is disabled */
> +	int channel_zpos[5];
>  };
> 
>  static inline struct sun8i_mixer *
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c index 893076716070..23c2f4b68c89
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -24,12 +24,10 @@
>  #include "sun8i_ui_scaler.h"
> 
>  static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int channel,
> -				  int overlay, bool enable, 
unsigned int zpos,
> -				  unsigned int old_zpos)
> +				  int overlay, bool enable, 
unsigned int zpos)
>  {
> -	u32 val, bld_base, ch_base;
> +	u32 val, ch_base;
> 
> -	bld_base = sun8i_blender_base(mixer);
>  	ch_base = sun8i_channel_base(mixer, channel);
> 
>  	DRM_DEBUG_DRIVER("%sabling channel %d overlay %d\n",
> @@ -44,32 +42,7 @@ static void sun8i_ui_layer_enable(struct sun8i_mixer
> *mixer, int channel, SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
>  			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN, val);
> 
> -	if (!enable || zpos != old_zpos) {
> -		regmap_update_bits(mixer->engine.regs,
> -				   
SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> -				   
SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
> -				   0);
> -
> -		regmap_update_bits(mixer->engine.regs,
> -				   
SUN8I_MIXER_BLEND_ROUTE(bld_base),
> -				   
SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
> -				   0);
> -	}
> -
> -	if (enable) {
> -		val = SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
> -
> -		regmap_update_bits(mixer->engine.regs,
> -				   
SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> -				   val, val);
> -
> -		val = channel << 
SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
> -
> -		regmap_update_bits(mixer->engine.regs,
> -				   
SUN8I_MIXER_BLEND_ROUTE(bld_base),
> -				   
SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(zpos),
> -				   val);
> -	}
> +	mixer->channel_zpos[channel] = enable ? zpos : -1;
>  }
> 
>  static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int
> channel, @@ -235,11 +208,9 @@ static void
> sun8i_ui_layer_atomic_disable(struct drm_plane *plane, struct
> drm_plane_state *old_state)
>  {
>  	struct sun8i_ui_layer *layer = plane_to_sun8i_ui_layer(plane);
> -	unsigned int old_zpos = old_state->normalized_zpos;
>  	struct sun8i_mixer *mixer = layer->mixer;
> 
> -	sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay, 
false, 0,
> -			      old_zpos);
> +	sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay, false, 
0);
>  }
> 
>  static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
> @@ -247,12 +218,11 @@ static void sun8i_ui_layer_atomic_update(struct
> drm_plane *plane, {
>  	struct sun8i_ui_layer *layer = plane_to_sun8i_ui_layer(plane);
>  	unsigned int zpos = plane->state->normalized_zpos;
> -	unsigned int old_zpos = old_state->normalized_zpos;
>  	struct sun8i_mixer *mixer = layer->mixer;
> 
>  	if (!plane->state->visible) {
>  		sun8i_ui_layer_enable(mixer, layer->channel,
> -				      layer->overlay, false, 0, 
old_zpos);
> +				      layer->overlay, false, 0);
>  		return;
>  	}
> 
> @@ -263,7 +233,7 @@ static void sun8i_ui_layer_atomic_update(struct
> drm_plane *plane, sun8i_ui_layer_update_buffer(mixer, layer->channel,
>  				     layer->overlay, plane);
>  	sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay,
> -			      true, zpos, old_zpos);
> +			      true, zpos);
>  }
> 
>  static struct drm_plane_helper_funcs sun8i_ui_layer_helper_funcs = {
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c index 42d445d23773..97cbc98bf781
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -17,8 +17,7 @@
>  #include "sun8i_vi_scaler.h"
> 
>  static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int channel,
> -				  int overlay, bool enable, 
unsigned int zpos,
> -				  unsigned int old_zpos)
> +				  int overlay, bool enable, 
unsigned int zpos)
>  {
>  	u32 val, bld_base, ch_base;
> 
> @@ -37,32 +36,7 @@ static void sun8i_vi_layer_enable(struct sun8i_mixer
> *mixer, int channel, SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay),
>  			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN, val);
> 
> -	if (!enable || zpos != old_zpos) {
> -		regmap_update_bits(mixer->engine.regs,
> -				   
SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> -				   
SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
> -				   0);
> -
> -		regmap_update_bits(mixer->engine.regs,
> -				   
SUN8I_MIXER_BLEND_ROUTE(bld_base),
> -				   
SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
> -				   0);
> -	}
> -
> -	if (enable) {
> -		val = SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
> -
> -		regmap_update_bits(mixer->engine.regs,
> -				   
SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> -				   val, val);
> -
> -		val = channel << 
SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
> -
> -		regmap_update_bits(mixer->engine.regs,
> -				   
SUN8I_MIXER_BLEND_ROUTE(bld_base),
> -				   
SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(zpos),
> -				   val);
> -	}
> +	mixer->channel_zpos[channel] = enable ? zpos : -1;
>  }
> 
>  static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int
> channel, @@ -350,11 +324,9 @@ static void
> sun8i_vi_layer_atomic_disable(struct drm_plane *plane, struct
> drm_plane_state *old_state)
>  {
>  	struct sun8i_vi_layer *layer = plane_to_sun8i_vi_layer(plane);
> -	unsigned int old_zpos = old_state->normalized_zpos;
>  	struct sun8i_mixer *mixer = layer->mixer;
> 
> -	sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay, 
false, 0,
> -			      old_zpos);
> +	sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay, false, 
0);
>  }
> 
>  static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
> @@ -362,12 +334,11 @@ static void sun8i_vi_layer_atomic_update(struct
> drm_plane *plane, {
>  	struct sun8i_vi_layer *layer = plane_to_sun8i_vi_layer(plane);
>  	unsigned int zpos = plane->state->normalized_zpos;
> -	unsigned int old_zpos = old_state->normalized_zpos;
>  	struct sun8i_mixer *mixer = layer->mixer;
> 
>  	if (!plane->state->visible) {
>  		sun8i_vi_layer_enable(mixer, layer->channel,
> -				      layer->overlay, false, 0, 
old_zpos);
> +				      layer->overlay, false, 0);
>  		return;
>  	}
> 
> @@ -378,7 +349,7 @@ static void sun8i_vi_layer_atomic_update(struct
> drm_plane *plane, sun8i_vi_layer_update_buffer(mixer, layer->channel,
>  				     layer->overlay, plane);
>  	sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay,
> -			      true, zpos, old_zpos);
> +			      true, zpos);
>  }
> 
>  static struct drm_plane_helper_funcs sun8i_vi_layer_helper_funcs = {




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
