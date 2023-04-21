Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0596EA942
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 13:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6DE10E30C;
	Fri, 21 Apr 2023 11:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B08C10E30C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 11:36:15 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Q2st650ZrzDqn9;
 Fri, 21 Apr 2023 11:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1682076974; bh=5Sxjg6qYr3ioMBbhsC27BGQKs9avRNiqXXIDwFPj3jk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dUTWgah7lGwenPhNR5BHoDSp/aIeO9b/9/FOQbjRCA/skJyte7vlFK3cSo+s7eCuC
 TG21vAzQlFUxJxiIhxKOy6wxOUkeBJzfWnrOsBI9gFnWRA+PUySUZoZ4aLs50hGCfa
 xpljtYVANXdwplxxegkauqr5CXZCbJC1/QqCI84c=
X-Riseup-User-ID: 999D6C49BA5E1D72404351FE978E5E1D32509960FCB9F13CFA670008A362B9D9
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Q2st40B1BzFrxY;
 Fri, 21 Apr 2023 11:36:11 +0000 (UTC)
Message-ID: <f8ce92b5-962b-adef-284a-7254ba56321d@riseup.net>
Date: Fri, 21 Apr 2023 08:36:07 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] drm/vkms: allow full alpha blending on all planes
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>
References: <20230420232228.273340-1-mcanal@igalia.com>
From: Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net>
In-Reply-To: <20230420232228.273340-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 20/04/23 20:22, Maíra Canal wrote:
> Before commit bc0d7fdefec6 ("drm: vkms: Supports to the case where
> primary plane doesn't match the CRTC"), the composition was executed on
> top of the primary plane. Therefore, the primary plane was not able to
> support the alpha channel. After commit bc0d7fdefec6, this is possible,
> as the composition is now executed on top of the CRTC.
> 
> So, allow all planes to support the alpha channel, making full alpha
> blending possible in vkms.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> ---

On both:

Reviewed-by: Arthur Grillo <arthurgrillo@riseup.net>

Best Regards,
~Arthur Grillo

> 
> v1 -> v2: https://lore.kernel.org/dri-devel/20230414190913.106633-1-mcanal@igalia.com/T/
> 
> * s/vkms_primary_helper_funcs/vkms_plane_helper_funcs (Melissa Wen)
> * Add Melissa's Reviewed-by
> 
> ---
>  drivers/gpu/drm/vkms/vkms_plane.c | 34 +++----------------------------
>  1 file changed, 3 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index c41cec7dcb70..c2888e5266bc 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -12,12 +12,6 @@
>  #include "vkms_formats.h"
>  
>  static const u32 vkms_formats[] = {
> -	DRM_FORMAT_XRGB8888,
> -	DRM_FORMAT_XRGB16161616,
> -	DRM_FORMAT_RGB565
> -};
> -
> -static const u32 vkms_plane_formats[] = {
>  	DRM_FORMAT_ARGB8888,
>  	DRM_FORMAT_XRGB8888,
>  	DRM_FORMAT_XRGB16161616,
> @@ -185,7 +179,7 @@ static void vkms_cleanup_fb(struct drm_plane *plane,
>  	drm_gem_fb_vunmap(fb, shadow_plane_state->map);
>  }
>  
> -static const struct drm_plane_helper_funcs vkms_primary_helper_funcs = {
> +static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
>  	.atomic_update		= vkms_plane_atomic_update,
>  	.atomic_check		= vkms_plane_atomic_check,
>  	.prepare_fb		= vkms_prepare_fb,
> @@ -196,38 +190,16 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  				   enum drm_plane_type type, int index)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
> -	const struct drm_plane_helper_funcs *funcs;
>  	struct vkms_plane *plane;
> -	const u32 *formats;
> -	int nformats;
> -
> -	switch (type) {
> -	case DRM_PLANE_TYPE_PRIMARY:
> -		formats = vkms_formats;
> -		nformats = ARRAY_SIZE(vkms_formats);
> -		funcs = &vkms_primary_helper_funcs;
> -		break;
> -	case DRM_PLANE_TYPE_CURSOR:
> -	case DRM_PLANE_TYPE_OVERLAY:
> -		formats = vkms_plane_formats;
> -		nformats = ARRAY_SIZE(vkms_plane_formats);
> -		funcs = &vkms_primary_helper_funcs;
> -		break;
> -	default:
> -		formats = vkms_formats;
> -		nformats = ARRAY_SIZE(vkms_formats);
> -		funcs = &vkms_primary_helper_funcs;
> -		break;
> -	}
>  
>  	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
>  					   &vkms_plane_funcs,
> -					   formats, nformats,
> +					   vkms_formats, ARRAY_SIZE(vkms_formats),
>  					   NULL, type, NULL);
>  	if (IS_ERR(plane))
>  		return plane;
>  
> -	drm_plane_helper_add(&plane->base, funcs);
> +	drm_plane_helper_add(&plane->base, &vkms_plane_helper_funcs);
>  
>  	return plane;
>  }
