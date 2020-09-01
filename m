Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9111C25A613
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 09:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFAC6E90B;
	Wed,  2 Sep 2020 07:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1034E6E08E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 21:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1598995769; bh=UVR0IHel+T0FWD7dA6eVPkZHb0vUQx1w3OEGve81MbY=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=Qs6nD3IdWHH9RKN0XHSGx20Q9atSLEZgl3gxccoBuJDBaNfP+9OmD+Yja29dOvb8p
 OucJvB6eT8G3diKV0BFoIPH6n+dMzsBTjD0fQ46ucRrOHOzaABJGdzgBOw75fqLLYr
 cKo52rRA2qAZSz4r4iJTy+8uXb92ftIguYYzD/GU=
Date: Tue, 1 Sep 2020 23:29:29 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [PATCH] RFC: sun4i/drm: Swap back U and V channels for
 DRM_FORMAT_YVU4xx
Message-ID: <20200901212929.xty2pvn3w4d5tkg4@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Roman Stratiienko <r.stratiienko@gmail.com>,
 jernej.skrabec@siol.net, jernej.skrabec@gmail.com,
 linux-sunxi@googlegroups.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200901203047.1110851-1-r.stratiienko@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200901203047.1110851-1-r.stratiienko@gmail.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Mailman-Approved-At: Wed, 02 Sep 2020 07:07:59 +0000
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
Cc: jernej.skrabec@siol.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 jernej.skrabec@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 01, 2020 at 11:30:47PM +0300, Roman Stratiienko wrote:
> Fixes: e1ef9006663b ("drm/sun4i: Wire in DE2 YUV support")
> Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
> 
> ---
> CC: megous@megous.com
> CC: jernej.skrabec@gmail.com
> CC: linux-sunxi@googlegroups.com
> CC: dri-devel@lists.freedesktop.org
> CC: linux-arm-kernel@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> 
> Hi, this patch fixes wrong colors during video playback for me.
> Implemented ugly for now, please review/suggest how to improve.

Why do you think the issue is at DRM level? Have you tried displaying a known
color image via a vi layer, and was it wrong?

I used DRM with YUV data in the past, and didn't notice any weird colors,
so I'm a bit skeptical.

regards,
	o.

> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c    |  8 +++++++-
>  drivers/gpu/drm/sun4i/sun8i_mixer.h    |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 28 +++++++++++++++++++-------
>  4 files changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> index dce40c430100..bbbeef44899a 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -31,6 +31,7 @@
>  struct de2_fmt_info {
>  	u32	drm_fmt;
>  	u32	de2_fmt;
> +	bool	swap_uv;
>  };
>  
>  static bool hw_preconfigured;
> @@ -219,14 +220,17 @@ static const struct de2_fmt_info de2_formats[] = {
>  	{
>  		.drm_fmt = DRM_FORMAT_YVU422,
>  		.de2_fmt = SUN8I_MIXER_FBFMT_YUV422,
> +		.swap_uv = true,
>  	},
>  	{
>  		.drm_fmt = DRM_FORMAT_YVU420,
>  		.de2_fmt = SUN8I_MIXER_FBFMT_YUV420,
> +		.swap_uv = true,
>  	},
>  	{
>  		.drm_fmt = DRM_FORMAT_YVU411,
>  		.de2_fmt = SUN8I_MIXER_FBFMT_YUV411,
> +		.swap_uv = true,
>  	},
>  	{
>  		.drm_fmt = DRM_FORMAT_P010,
> @@ -238,13 +242,15 @@ static const struct de2_fmt_info de2_formats[] = {
>  	},
>  };
>  
> -int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_format)
> +int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_format, bool *swap_uv)
>  {
>  	unsigned int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(de2_formats); ++i)
>  		if (de2_formats[i].drm_fmt == format) {
>  			*hw_format = de2_formats[i].de2_fmt;
> +			if (swap_uv)
> +				*swap_uv = de2_formats[i].swap_uv;
>  			return 0;
>  		}
>  
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> index 79a74bca1ea3..6358ffd251f9 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -207,5 +207,5 @@ sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
>  		return DE2_CH_BASE + channel * DE2_CH_SIZE;
>  }
>  
> -int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_format);
> +int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_format, bool *swap_uv);
>  #endif /* _SUN8I_MIXER_H_ */
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> index a7f21f08ec89..57bbd9f1071c 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -215,7 +215,7 @@ static int sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
>  	ch_base = sun8i_channel_base(mixer, channel);
>  
>  	fmt = state->fb->format;
> -	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> +	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt, NULL);
>  	if (ret || fmt->is_yuv) {
>  		DRM_DEBUG_DRIVER("Invalid format\n");
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> index 3553e38ec642..4da51155c4d5 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -313,7 +313,7 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
>  	ch_base = sun8i_channel_base(mixer, channel);
>  
>  	fmt = state->fb->format;
> -	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> +	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt, NULL);
>  	if (ret) {
>  		DRM_DEBUG_DRIVER("Invalid format\n");
>  		return ret;
> @@ -368,8 +368,17 @@ static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
>  	struct drm_gem_cma_object *gem;
>  	u32 dx, dy, src_x, src_y;
>  	dma_addr_t paddr;
> +	bool swap_uv;
>  	u32 ch_base;
> -	int i;
> +	u32 hw_fmt;
> +	int ret;
> +	int i, j;
> +
> +	ret = sun8i_mixer_drm_format_to_hw(plane->state->fb->format->format, &hw_fmt, &swap_uv);
> +	if (ret) {
> +		DRM_DEBUG_DRIVER("Invalid format\n");
> +		return ret;
> +	}
>  
>  	ch_base = sun8i_channel_base(mixer, channel);
>  
> @@ -377,7 +386,12 @@ static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
>  	src_x = (state->src.x1 >> 16) & ~(format->hsub - 1);
>  	src_y = (state->src.y1 >> 16) & ~(format->vsub - 1);
>  
> -	for (i = 0; i < format->num_planes; i++) {
> +	for (j = 0; j < format->num_planes; j++) {
> +		i = j;
> +		if (swap_uv && i > 0 && format->num_planes == 3) {
> +			i = j == 1 ? 2 : 1;
> +		}
> +
>  		/* Get the physical address of the buffer in memory */
>  		gem = drm_fb_cma_get_gem_obj(fb, i);
>  
> @@ -400,18 +414,18 @@ static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
>  
>  		/* Set the line width */
>  		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
> -				 i + 1, fb->pitches[i]);
> +				 j + 1, fb->pitches[i]);
>  		regmap_write(mixer->engine.regs,
>  			     SUN8I_MIXER_CHAN_VI_LAYER_PITCH(ch_base,
> -							     overlay, i),
> +							     overlay, j),
>  			     fb->pitches[i]);
>  
>  		DRM_DEBUG_DRIVER("Setting %d. buffer address to %pad\n",
> -				 i + 1, &paddr);
> +				 j + 1, &paddr);
>  
>  		regmap_write(mixer->engine.regs,
>  			     SUN8I_MIXER_CHAN_VI_LAYER_TOP_LADDR(ch_base,
> -								 overlay, i),
> +								 overlay, j),
>  			     lower_32_bits(paddr));
>  	}
>  
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
