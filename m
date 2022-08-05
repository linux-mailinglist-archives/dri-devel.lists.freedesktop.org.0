Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5706658AF33
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 19:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35F512A72F;
	Fri,  5 Aug 2022 17:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECC9A0786
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 17:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=ftAwZ++mdcxKPdKhik4xoJUk/80Q6jo7HipKzZB6FB0=;
 b=Gamf2hz84h58aV31UYLbq+O2B+/GC6tTyh2TM4K1iyetiV1UgMU7865DuYqMoQS8aBEG+Hdum156e
 Ve82kNqHCduL6fruZn4QObYhOkmzbo5/ROqLiCGEhcY/3Jfs0IQ3Fo9MLsrFn8ysvtB5Ncpk33t+Yh
 0BWYh9Dj0uZtnjopZZW5fIc1e4X33zcJ0bDcASrZIgPvqPNrI+VhCxJ3lFujuKr4Lwb4NxAC2nKyl7
 k1oBiBXdWhfW+1vLapTL82WjB/QPzHgCc2xVRVi77fgniykZepkz9Wv1h8XzCkHtvD7Iol55npO/at
 1bcUPUwWE7EUBKbBBnx/yqz4dFKLqHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=ftAwZ++mdcxKPdKhik4xoJUk/80Q6jo7HipKzZB6FB0=;
 b=r8sdVmnR4v+eQnbgwaseVF2x0Df0+mlxjrrEasP4UTypQLLDhRqTBqv5JOC1mcmKjJFJi4iijbqxv
 aNyewfQBw==
X-HalOne-Cookie: 263fd95a98dc585b1a1e06b295ca0b988c269500
X-HalOne-ID: 6bb1c18c-14e7-11ed-be82-d0431ea8bb03
Received: from mailproxy2.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 6bb1c18c-14e7-11ed-be82-d0431ea8bb03;
 Fri, 05 Aug 2022 17:52:49 +0000 (UTC)
Date: Fri, 5 Aug 2022 19:52:48 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 12/12] drm/format-helper: Move destination-buffer
 handling into internal helper
Message-ID: <Yu1Y8JZCd+wuV2R1@ravnborg.org>
References: <20220727113312.22407-1-tzimmermann@suse.de>
 <20220727113312.22407-13-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220727113312.22407-13-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, david@lechnology.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, javierm@redhat.com,
 virtualization@lists.linux-foundation.org, drawat.floss@gmail.com,
 noralf@tronnes.org, kraxel@redhat.com, jose.exposito89@gmail.com,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Wed, Jul 27, 2022 at 01:33:12PM +0200, Thomas Zimmermann wrote:
> The format-convertion helpers handle several cases for different
> values of destination buffer and pitch. Move that code into the
> internal helper drm_fb_xfrm() and avoid quite a bit of duplucation.

This is very nice patch that should come before all the conversion
patches - but then you have had to come up with another name.
So I think this is fine.

A few comments below, mostly in the same area as the comments from José.

	Sam

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_format_helper.c | 169 +++++++++++-----------------
>  1 file changed, 64 insertions(+), 105 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index d296d181659d..35aebdb90165 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -41,11 +41,11 @@ unsigned int drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info
>  }
>  EXPORT_SYMBOL(drm_fb_clip_offset);
>  
> -/* TODO: Make this functon work with multi-plane formats. */
> -static int drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
> -		       const void *vaddr, const struct drm_framebuffer *fb,
> -		       const struct drm_rect *clip, bool vaddr_cached_hint,
> -		       void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
> +/* TODO: Make this function work with multi-plane formats. */
> +static int __drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
> +			 const void *vaddr, const struct drm_framebuffer *fb,
> +			 const struct drm_rect *clip, bool vaddr_cached_hint,
> +			 void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
>  {
>  	unsigned long linepixels = drm_rect_width(clip);
>  	unsigned long lines = drm_rect_height(clip);
> @@ -84,11 +84,11 @@ static int drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_pix
>  	return 0;
>  }
>  
> -/* TODO: Make this functon work with multi-plane formats. */
> -static int drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
> -			    const void *vaddr, const struct drm_framebuffer *fb,
> -			    const struct drm_rect *clip, bool vaddr_cached_hint,
> -			    void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
> +/* TODO: Make this function work with multi-plane formats. */
> +static int __drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
> +			      const void *vaddr, const struct drm_framebuffer *fb,
> +			      const struct drm_rect *clip, bool vaddr_cached_hint,
> +			      void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
>  {
>  	unsigned long linepixels = drm_rect_width(clip);
>  	unsigned long lines = drm_rect_height(clip);
> @@ -129,6 +129,29 @@ static int drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsigned
>  	return 0;
>  }
>  
> +/* TODO: Make this function work with multi-plane formats. */
> +static int drm_fb_xfrm(struct iosys_map *dst,
> +		       const unsigned int *dst_pitch, const u8 *dst_pixsize,
> +		       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> +		       const struct drm_rect *clip, bool vaddr_cached_hint,
> +		       void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
> +{
Just to repeat myself a little, this assumes src (vmap) is always system
memory (not io).

> +	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> +		0, 0, 0, 0
> +	};
> +
> +	if (!dst_pitch)
> +		dst_pitch = default_dst_pitch;
> +
> +	if (dst[0].is_iomem)
> +		return __drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], dst_pixsize[0],
> +					  vmap[0].vaddr, fb, clip, false, xfrm_line);
> +	else
> +		return __drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], dst_pixsize[0],
> +				     vmap[0].vaddr, fb, clip, false, xfrm_line);

It looks like vaddr_cached_hint is always false, so can we remove it?

> +}
> +
> +
>  /**
>   * drm_fb_memcpy - Copy clip buffer
>   * @dst: Array of destination buffers
> @@ -213,14 +236,10 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
>  		 const struct iosys_map *vmap, const struct drm_framebuffer *fb,
>  		 const struct drm_rect *clip, bool cached)
>  {
> -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> -		0, 0, 0, 0
> -	};
>  	const struct drm_format_info *format = fb->format;
> -	u8 cpp = format->cpp[0];
>  	void (*swab_line)(void *dbuf, const void *sbuf, unsigned int npixels);
>  
> -	switch (cpp) {
> +	switch (format->cpp[0]) {
>  	case 4:
>  		swab_line = drm_fb_swab32_line;
>  		break;
> @@ -230,21 +249,10 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
>  	default:
>  		drm_warn_once(fb->dev, "Format %p4cc has unsupported pixel size.\n",
>  			      &format->format);
> -		swab_line = NULL;
> -		break;
> -	}
> -	if (!swab_line)
>  		return;
> +	}
>  
> -	if (!dst_pitch)
> -		dst_pitch = default_dst_pitch;
> -
> -	if (dst->is_iomem)
> -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], cpp,
> -				 vmap[0].vaddr, fb, clip, cached, swab_line);
> -	else
> -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], cpp, vmap[0].vaddr, fb,
> -			    clip, cached, swab_line);
> +	drm_fb_xfrm(dst, dst_pitch, format->cpp, vmap, fb, clip, cached, swab_line);

In this case we pass fb->format-cpp as dst_pitch - so we could retreive
is via the fb pointer.

>  }
>  EXPORT_SYMBOL(drm_fb_swab);
>  
> @@ -277,19 +285,12 @@ void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pi
>  			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
>  			       const struct drm_rect *clip)
>  {
> -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> -		0, 0, 0, 0
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		1,
>  	};
>  
> -	if (!dst_pitch)
> -		dst_pitch = default_dst_pitch;
> -
> -	if (dst[0].is_iomem)
> -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 1, vmap[0].vaddr, fb, clip,
> -				 false, drm_fb_xrgb8888_to_rgb332_line);
> -	else
> -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 1, vmap[0].vaddr, fb, clip,
> -			    false, drm_fb_xrgb8888_to_rgb332_line);
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
> +		    drm_fb_xrgb8888_to_rgb332_line);

Here we construct the dst_pixsize.
What is needed to make us trust fb->format->cpp so we can just fetch the
info from format_info and drop dst_pixsize?

I do not see any lookup being necessary here or in the functions below.

If we use cpp (or even better using a helper function that avoid the
deprecated cpp), then adding support for planes is simpler. For now
dst_pixsize only pass the size for the first plane and there are a lot
of updates required to support additional planes.

Maybe I miss something obvious?!?


>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
>  
> @@ -344,9 +345,10 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
>  			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
>  			       const struct drm_rect *clip, bool swab)
>  {
> -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> -		0, 0, 0, 0
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		2,
>  	};
> +
>  	void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels);
>  
>  	if (swab)
> @@ -354,15 +356,7 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
>  	else
>  		xfrm_line = drm_fb_xrgb8888_to_rgb565_line;
>  
> -	if (!dst_pitch)
> -		dst_pitch = default_dst_pitch;
> -
> -	if (dst[0].is_iomem)
> -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 2, vmap[0].vaddr, fb, clip,
> -				 false, xfrm_line);
> -	else
> -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 2, vmap[0].vaddr, fb, clip,
> -			    false, xfrm_line);
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false, xfrm_line);
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
>  
> @@ -396,19 +390,12 @@ void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pi
>  			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
>  			       const struct drm_rect *clip)
>  {
> -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> -		0, 0, 0, 0
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		3,
>  	};
>  
> -	if (!dst_pitch)
> -		dst_pitch = default_dst_pitch;
> -
> -	if (dst[0].is_iomem)
> -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 3, vmap[0].vaddr, fb,
> -				 clip, false, drm_fb_xrgb8888_to_rgb888_line);
> -	else
> -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 3, vmap[0].vaddr, fb,
> -			    clip, false, drm_fb_xrgb8888_to_rgb888_line);
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
> +		    drm_fb_xrgb8888_to_rgb888_line);
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
>  
> @@ -435,19 +422,12 @@ static void drm_fb_rgb565_to_xrgb8888(struct iosys_map *dst, const unsigned int
>  				      const struct drm_framebuffer *fb,
>  				      const struct drm_rect *clip)
>  {
> -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> -		0, 0, 0, 0
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		4,
>  	};
>  
> -	if (!dst_pitch)
> -		dst_pitch = default_dst_pitch;
> -
> -	if (dst[0].is_iomem)
> -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 4, vmap[0].vaddr, fb,
> -				 clip, false, drm_fb_rgb565_to_xrgb8888_line);
> -	else
> -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 4, vmap[0].vaddr, fb,
> -			    clip, false, drm_fb_rgb565_to_xrgb8888_line);
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
> +		    drm_fb_rgb565_to_xrgb8888_line);
>  }
>  
>  static void drm_fb_rgb888_to_xrgb8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
> @@ -470,19 +450,12 @@ static void drm_fb_rgb888_to_xrgb8888(struct iosys_map *dst, const unsigned int
>  				      const struct drm_framebuffer *fb,
>  				      const struct drm_rect *clip)
>  {
> -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> -		0, 0, 0, 0
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		4,
>  	};
>  
> -	if (!dst_pitch)
> -		dst_pitch = default_dst_pitch;
> -
> -	if (dst[0].is_iomem)
> -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 4, vmap[0].vaddr, fb,
> -				 clip, false, drm_fb_rgb888_to_xrgb8888_line);
> -	else
> -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 4, vmap[0].vaddr, fb,
> -			    clip, false, drm_fb_rgb888_to_xrgb8888_line);
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
> +		    drm_fb_rgb888_to_xrgb8888_line);
>  }
>  
>  static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
> @@ -518,19 +491,12 @@ void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *d
>  				    const struct iosys_map *vmap, const struct drm_framebuffer *fb,
>  				    const struct drm_rect *clip)
>  {
> -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> -		0, 0, 0, 0
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		4,
>  	};
>  
> -	if (!dst_pitch)
> -		dst_pitch = default_dst_pitch;
> -
> -	if (dst[0].is_iomem)
> -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 4, vmap[0].vaddr, fb,
> -				 clip, false, drm_fb_xrgb8888_to_xrgb2101010_line);
> -	else
> -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 4, vmap[0].vaddr, fb,
> -			    clip, false, drm_fb_xrgb8888_to_xrgb2101010_line);
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
> +		    drm_fb_xrgb8888_to_xrgb2101010_line);
>  }
>  
>  static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned int pixels)
> @@ -571,19 +537,12 @@ void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pit
>  			      const struct iosys_map *vmap, const struct drm_framebuffer *fb,
>  			      const struct drm_rect *clip)
>  {
> -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> -		0, 0, 0, 0
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		1,
>  	};
>  
> -	if (!dst_pitch)
> -		dst_pitch = default_dst_pitch;
> -
> -	if (dst[0].is_iomem)
> -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 1, vmap[0].vaddr, fb,
> -				 clip, false, drm_fb_xrgb8888_to_gray8_line);
> -	else
> -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 1, vmap[0].vaddr, fb,
> -			    clip, false, drm_fb_xrgb8888_to_gray8_line);
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
> +		    drm_fb_xrgb8888_to_gray8_line);
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
>  
> -- 
> 2.37.1
