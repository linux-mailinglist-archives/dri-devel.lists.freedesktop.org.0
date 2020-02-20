Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EE41666B6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 19:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99E06E901;
	Thu, 20 Feb 2020 18:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D24C6E900;
 Thu, 20 Feb 2020 18:56:47 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id B8BE580910;
 Thu, 20 Feb 2020 19:56:44 +0100 (CET)
Date: Thu, 20 Feb 2020 19:56:42 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 3/4] drm/mgag200: Use simple encoder
Message-ID: <20200220185642.GA20011@ravnborg.org>
References: <20200218084815.2137-1-tzimmermann@suse.de>
 <20200218084815.2137-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218084815.2137-4-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=RZcwhXGlPqQlEAbC35AA:9 a=CjuIK1q_8ugA:10
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kraxel@redhat.com,
 alexander.deucher@amd.com, spice-devel@lists.freedesktop.org,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Tue, Feb 18, 2020 at 09:48:14AM +0100, Thomas Zimmermann wrote:
> The mgag200 driver uses an empty implementation for its encoder. Replace
> the code with the generic simple encoder.
> 
> v2:
> 	* rebase onto new simple-encoder interface
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  7 ---
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 61 ++------------------------
>  2 files changed, 3 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index aa32aad222c2..9bb9e8e14539 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -95,7 +95,6 @@
>  #define MATROX_DPMS_CLEARED (-1)
>  
>  #define to_mga_crtc(x) container_of(x, struct mga_crtc, base)
> -#define to_mga_encoder(x) container_of(x, struct mga_encoder, base)
>  #define to_mga_connector(x) container_of(x, struct mga_connector, base)
>  
>  struct mga_crtc {
> @@ -110,12 +109,6 @@ struct mga_mode_info {
>  	struct mga_crtc *crtc;
>  };
>  
> -struct mga_encoder {
> -	struct drm_encoder base;
> -	int last_dpms;
> -};
> -
> -
>  struct mga_i2c_chan {
>  	struct i2c_adapter adapter;
>  	struct drm_device *dev;

Any particular reason why the drm_encoder is not embedded in struct
mga_device?

I found it more elegant - like you did it for ast in the previous patch.

I also noted there is one more unused "last_dpms" - but it is outside
the scope of this patch to remove it.

	Sam

> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 62a8e9ccb16d..957ea1057b6c 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -15,6 +15,7 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
>  
>  #include "mgag200_drv.h"
>  
> @@ -1449,72 +1450,16 @@ static void mga_crtc_init(struct mga_device *mdev)
>  	drm_crtc_helper_add(&mga_crtc->base, &mga_helper_funcs);
>  }
>  
> -/*
> - * The encoder comes after the CRTC in the output pipeline, but before
> - * the connector. It's responsible for ensuring that the digital
> - * stream is appropriately converted into the output format. Setup is
> - * very simple in this case - all we have to do is inform qemu of the
> - * colour depth in order to ensure that it displays appropriately
> - */
> -
> -/*
> - * These functions are analagous to those in the CRTC code, but are intended
> - * to handle any encoder-specific limitations
> - */
> -static void mga_encoder_mode_set(struct drm_encoder *encoder,
> -				struct drm_display_mode *mode,
> -				struct drm_display_mode *adjusted_mode)
> -{
> -
> -}
> -
> -static void mga_encoder_dpms(struct drm_encoder *encoder, int state)
> -{
> -	return;
> -}
> -
> -static void mga_encoder_prepare(struct drm_encoder *encoder)
> -{
> -}
> -
> -static void mga_encoder_commit(struct drm_encoder *encoder)
> -{
> -}
> -
> -static void mga_encoder_destroy(struct drm_encoder *encoder)
> -{
> -	struct mga_encoder *mga_encoder = to_mga_encoder(encoder);
> -	drm_encoder_cleanup(encoder);
> -	kfree(mga_encoder);
> -}
> -
> -static const struct drm_encoder_helper_funcs mga_encoder_helper_funcs = {
> -	.dpms = mga_encoder_dpms,
> -	.mode_set = mga_encoder_mode_set,
> -	.prepare = mga_encoder_prepare,
> -	.commit = mga_encoder_commit,
> -};
> -
> -static const struct drm_encoder_funcs mga_encoder_encoder_funcs = {
> -	.destroy = mga_encoder_destroy,
> -};
> -
>  static struct drm_encoder *mga_encoder_init(struct drm_device *dev)
>  {
>  	struct drm_encoder *encoder;
> -	struct mga_encoder *mga_encoder;
>  
> -	mga_encoder = kzalloc(sizeof(struct mga_encoder), GFP_KERNEL);
> -	if (!mga_encoder)
> +	encoder = drm_simple_encoder_create(dev, DRM_MODE_ENCODER_DAC);
> +	if (IS_ERR(encoder))
>  		return NULL;
>  
> -	encoder = &mga_encoder->base;
>  	encoder->possible_crtcs = 0x1;
>  
> -	drm_encoder_init(dev, encoder, &mga_encoder_encoder_funcs,
> -			 DRM_MODE_ENCODER_DAC, NULL);
> -	drm_encoder_helper_add(encoder, &mga_encoder_helper_funcs);
> -
>  	return encoder;
>  }
>  
> -- 
> 2.25.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
