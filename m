Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E35A84992BF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 21:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAC210E3C5;
	Mon, 24 Jan 2022 20:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BFA10E658
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 20:24:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67ED3143B;
 Mon, 24 Jan 2022 21:24:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1643055895;
 bh=gBuGhTe0RPpi7GDtt20ahJp+BTqYDSJm2nPG8lQMKdE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mPJoTZ//1Sa+jfKF+RrqNuj+z/stiFCL4nEdPoI+4QIrfmOfh8xKgj2/KpYepnNnz
 an5uV4ALkGhtEPipOaI/SNwkk2s2vzfsnCTEp95xIiaUFf8/xBUFNUd6z/4d2+IdXH
 zYSDQEw92pPAkdUooqyDH4IJCyzy9MPJBifNZr2w=
Date: Mon, 24 Jan 2022 22:24:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/docs: Document where the C8 color lut is stored
Message-ID: <Ye8LBfWBr5fPTgCN@pendragon.ideasonboard.com>
References: <20220124194706.930319-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220124194706.930319-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Thank you for the patch.

On Mon, Jan 24, 2022 at 08:47:06PM +0100, Daniel Vetter wrote:
> Also add notes that for atomic drivers it's really somewhere else and
> no longer in struct drm_crtc.
> 
> Maybe we should put a bigger warning here that this is confusing,
> since the pixel format is a plane property, but the GAMMA_LUT property
> is on the crtc. But I think we can fix this if/when someone finds a
> need for a per-plane CLUT, since I'm not sure such hw even exists. I'm
> also not sure whether even hardware with a CLUT and a full color
> correction pipeline with degamm/cgm/gamma exists.

Exists, maybe, exists and has a real use case, I'd be surprised.

> Motivated by comments from Geert that we have a gap here.
> 
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_color_mgmt.c |  4 ++++
>  include/drm/drm_crtc.h           | 10 ++++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index bb14f488c8f6..96ce57ad37e6 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -82,6 +82,10 @@
>   *	driver boot-up state too. Drivers can access this blob through
>   *	&drm_crtc_state.gamma_lut.
>   *
> + *	Note that for mostly historical reasons stemming from Xorg heritage,
> + *	this is also used to store the color lookup table (CLUT) for indexed
> + *	formats like DRM_FORMAT_C8.

CLUT also stands for Cubic Look Up Table, a type of LUT commonly used
for tone mapping that maps an RGB sample (in 3D space) to a colour.
Compared to traditional LUTs such as gamma and degamma, it allows
correlating colour components, while the gamma and degamma LUTs operate
on each colour component independently.

Is there any commonly used acronym for the indexed colours lookup table
that we could use here, to avoid future confusions ?

Other than that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + *
>   * “GAMMA_LUT_SIZE”:
>   *	Unsigned range property to give the size of the lookup table to be set
>   *	on the GAMMA_LUT property (the size depends on the underlying hardware).
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 4d01b4d89775..03cc53220a2a 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -285,6 +285,10 @@ struct drm_crtc_state {
>  	 * Lookup table for converting pixel data after the color conversion
>  	 * matrix @ctm.  See drm_crtc_enable_color_mgmt(). The blob (if not
>  	 * NULL) is an array of &struct drm_color_lut.
> +	 *
> +	 * Note that for mostly historical reasons stemming from Xorg heritage,
> +	 * this is also used to store the color lookup table (CLUT) for indexed
> +	 * formats like DRM_FORMAT_C8.
>  	 */
>  	struct drm_property_blob *gamma_lut;
>  
> @@ -1075,12 +1079,18 @@ struct drm_crtc {
>  	/**
>  	 * @gamma_size: Size of legacy gamma ramp reported to userspace. Set up
>  	 * by calling drm_mode_crtc_set_gamma_size().
> +	 *
> +	 * Note that atomic drivers need to instead use
> +	 * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt().
>  	 */
>  	uint32_t gamma_size;
>  
>  	/**
>  	 * @gamma_store: Gamma ramp values used by the legacy SETGAMMA and
>  	 * GETGAMMA IOCTls. Set up by calling drm_mode_crtc_set_gamma_size().
> +	 *
> +	 * Note that atomic drivers need to instead use
> +	 * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt().
>  	 */
>  	uint16_t *gamma_store;
>  

-- 
Regards,

Laurent Pinchart
