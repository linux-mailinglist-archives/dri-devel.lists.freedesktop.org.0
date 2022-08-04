Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBFF58A199
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 21:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809EC8B578;
	Thu,  4 Aug 2022 19:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852F595280
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 19:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=5chT9loi+xxoAwjMSJXWjpw7rfcfT1bkxzOH8lvn+Rg=;
 b=RebrH9iYdEhhgzPE1w3se8HkYqR1mGlZrrDMirMbp3tCRfO9z4Du2G/kkkpM49fVxSU6QkdOplR2w
 KqKUSrhT0LPn59toA8dQP4VDA+wrADzm1+2w9uSO+lvhKUBzRel9meDlnxPu9T56noXiAa1s2yFAZ9
 v6mEJl0U//zm4r08sFX9ZJkqtmGmjj/Fw6XOjCzGB2QU+A/Pze4v2p0MZ/q1U25uYrUUTFcK8SSEIj
 wlJC4+z4zhMnOB+PQ0FTvTuNI3xVWopYRyDoijeuNVuJdL8pDBvGtAaE5MNVxEyjpIJIxF0xrJe4lK
 fJaLodP+kr1MQcrPNCQtlzkxFrPHRqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=5chT9loi+xxoAwjMSJXWjpw7rfcfT1bkxzOH8lvn+Rg=;
 b=zAx50Mh47vLxPVm/tRkXBy8YWGB3fiXS1iIcECcn2IW19PerWR8A8m+2MwL0UhT38u7JE/2EtInZf
 4o5t6LKDA==
X-HalOne-Cookie: f7f92b97031977f5e904b5f0b0578198c0ac4343
X-HalOne-ID: f574cf63-142e-11ed-be81-d0431ea8bb03
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id f574cf63-142e-11ed-be81-d0431ea8bb03;
 Thu, 04 Aug 2022 19:52:24 +0000 (UTC)
Date: Thu, 4 Aug 2022 21:52:22 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/12] drm/format-helper: Merge drm_fb_memcpy() and
 drm_fb_memcpy_toio()
Message-ID: <YuwjdhGaW1tTFLyU@ravnborg.org>
References: <20220727113312.22407-1-tzimmermann@suse.de>
 <20220727113312.22407-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727113312.22407-3-tzimmermann@suse.de>
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

On Wed, Jul 27, 2022 at 01:33:02PM +0200, Thomas Zimmermann wrote:
> Merge drm_fb_memcpy() and drm_fb_memcpy() into drm_fb_memcpy() that
One of these is drm_fb_memcpy_toio()
> uses struct iosys_map for buffers. The new function also supports
> multi-plane color formats. Convert all users of the original helpers.

A few comments in the patch below.

	Sam

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_format_helper.c         | 77 +++++++++------------
>  drivers/gpu/drm/drm_mipi_dbi.c              |  3 +-
>  drivers/gpu/drm/gud/gud_pipe.c              |  4 +-
>  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 11 +--
>  drivers/gpu/drm/mgag200/mgag200_mode.c      | 11 +--
>  drivers/gpu/drm/tiny/cirrus.c               | 21 +++---
>  include/drm/drm_format_helper.h             |  7 +-
>  7 files changed, 63 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 4d74d46ab155..49589b442f18 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -131,63 +131,48 @@ static int drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsigned
>  
>  /**
>   * drm_fb_memcpy - Copy clip buffer
> - * @dst: Destination buffer
> - * @dst_pitch: Number of bytes between two consecutive scanlines within dst
> - * @vaddr: Source buffer
> + * @dst: Array of destination buffers
> + * @dst_pitch: Array of numbers of bytes between two consecutive scanlines within dst
Document that this may be NULL, in which case the distance is considered
0.

> + * @vmap: Array of source buffers
It would have helped my understanding if this argument was named src,
so it is a little more obvious that we copy from src to dst.
Maybe document that data is copied from src based on the pitch info in
the framebuffer, and likewise the format_info in the framebuffer.

>   * @fb: DRM framebuffer
>   * @clip: Clip rectangle area to copy
>   *
>   * This function does not apply clipping on dst, i.e. the destination
>   * is at the top-left corner.
>   */
> -void drm_fb_memcpy(void *dst, unsigned int dst_pitch, const void *vaddr,
> -		   const struct drm_framebuffer *fb, const struct drm_rect *clip)
> +void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
> +		   const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> +		   const struct drm_rect *clip)
>  {
> -	unsigned int cpp = fb->format->cpp[0];
> -	size_t len = (clip->x2 - clip->x1) * cpp;
> -	unsigned int y, lines = clip->y2 - clip->y1;
> -
> -	if (!dst_pitch)
> -		dst_pitch = len;
> +	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> +		0, 0, 0, 0
> +	};
This is used in several places in this series. What I read is that a static
variable is declared where the first element in the array is set to all zeroes.
But the other elements in the array are ignored - but since it is static
they are also set to 0 so we are good here.
In some cases I see it removed again, I did not check the end result if
we end up dropping them all again.

>  
> -	vaddr += clip_offset(clip, fb->pitches[0], cpp);
> -	for (y = 0; y < lines; y++) {
> -		memcpy(dst, vaddr, len);
> -		vaddr += fb->pitches[0];
> -		dst += dst_pitch;
> -	}
> -}
> -EXPORT_SYMBOL(drm_fb_memcpy);
> -
> -/**
> - * drm_fb_memcpy_toio - Copy clip buffer
> - * @dst: Destination buffer (iomem)
> - * @dst_pitch: Number of bytes between two consecutive scanlines within dst
> - * @vaddr: Source buffer
> - * @fb: DRM framebuffer
> - * @clip: Clip rectangle area to copy
> - *
> - * This function does not apply clipping on dst, i.e. the destination
> - * is at the top-left corner.
> - */
> -void drm_fb_memcpy_toio(void __iomem *dst, unsigned int dst_pitch, const void *vaddr,
> -			const struct drm_framebuffer *fb, const struct drm_rect *clip)
> -{
> -	unsigned int cpp = fb->format->cpp[0];
> -	size_t len = (clip->x2 - clip->x1) * cpp;
> -	unsigned int y, lines = clip->y2 - clip->y1;
> +	const struct drm_format_info *format = fb->format;
> +	unsigned int i, y, lines = drm_rect_height(clip);
>  
>  	if (!dst_pitch)
> -		dst_pitch = len;
> -
> -	vaddr += clip_offset(clip, fb->pitches[0], cpp);
> -	for (y = 0; y < lines; y++) {
> -		memcpy_toio(dst, vaddr, len);
> -		vaddr += fb->pitches[0];
> -		dst += dst_pitch;
> +		dst_pitch = default_dst_pitch;
> +
> +	for (i = 0; i < format->num_planes; ++i) {
> +		unsigned int cpp_i = format->cpp[i];
		unsigned int cpp_i = drm_format_info_bpp(format, i) / 8;

This avoid adding more uses of the deprecated cpp[] array.

> +		size_t len_i = drm_rect_width(clip) * cpp_i;
> +		unsigned int dst_pitch_i = dst_pitch[i];
> +		struct iosys_map dst_i = dst[i];
> +		struct iosys_map vmap_i = vmap[i];
WARN_ON_ONCE(dst_i == NULL)?
WARN_ON_ONCE(vmap_i == NULL)?
Or something else so we error out somehow if we do not have enough
planes in dst or src (vmap).

> +
> +		if (!dst_pitch_i)
> +			dst_pitch_i = len_i;
		If there can be NULL in the dst_pitch array, this should be
		documented above I think.
		I do not like the current dst pitch workaround, but I
		failed to come up with something better.
> +
> +		iosys_map_incr(&vmap_i, clip_offset(clip, fb->pitches[i], cpp_i));
> +		for (y = 0; y < lines; y++) {
> +			iosys_map_memcpy_to(&dst_i, 0, vmap_i.vaddr, len_i);
This hardcodes (vmap_i.vaddr) that vmap (src) is system memory. From a quick look this
is not fixed in a later patch. At minimum add a TODO entry here.

> +			iosys_map_incr(&vmap_i, fb->pitches[i]);
> +			iosys_map_incr(&dst_i, dst_pitch_i);
> +		}
>  	}
>  }
> -EXPORT_SYMBOL(drm_fb_memcpy_toio);
> +EXPORT_SYMBOL(drm_fb_memcpy);
>  
>  static void drm_fb_swab16_line(void *dbuf, const void *sbuf, unsigned int pixels)
>  {
> @@ -584,7 +569,7 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
>  		dst_format = DRM_FORMAT_XRGB2101010;
>  
>  	if (dst_format == fb_format) {
> -		drm_fb_memcpy_toio(dst[0].vaddr_iomem, dst_pitch[0], vmap[0].vaddr, fb, clip);
> +		drm_fb_memcpy(dst, dst_pitch, vmap, fb, clip);
>  		return 0;
>  
>  	} else if (dst_format == DRM_FORMAT_RGB565) {
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index 2f61f53d472f..22451806fb5c 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -205,6 +205,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
>  	struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
>  	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
>  	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
> +	struct iosys_map dst_map = IOSYS_MAP_INIT_VADDR(dst);
>  	void *src;
>  	int ret;
>  
> @@ -222,7 +223,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
>  		if (swap)
>  			drm_fb_swab(dst, 0, src, fb, clip, !gem->import_attach);
>  		else
> -			drm_fb_memcpy(dst, 0, src, fb, clip);
> +			drm_fb_memcpy(&dst_map, NULL, data, fb, clip);
>  		break;
>  	case DRM_FORMAT_XRGB8888:
>  		drm_fb_xrgb8888_to_rgb565(dst, 0, src, fb, clip, swap);
> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
> index d42592f6daab..449c95a4aee0 100644
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -156,6 +156,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
>  	u8 compression = gdrm->compression;
>  	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
>  	struct iosys_map map_data[DRM_FORMAT_MAX_PLANES];
> +	struct iosys_map dst;
>  	void *vaddr, *buf;
>  	size_t pitch, len;
>  	int ret = 0;
> @@ -179,6 +180,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
>  		buf = gdrm->compress_buf;
>  	else
>  		buf = gdrm->bulk_buf;
> +	iosys_map_set_vaddr(&dst, buf);
>  
>  	/*
>  	 * Imported buffers are assumed to be write-combined and thus uncached
> @@ -208,7 +210,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
>  		/* can compress directly from the framebuffer */
>  		buf = vaddr + rect->y1 * pitch;
>  	} else {
> -		drm_fb_memcpy(buf, 0, vaddr, fb, rect);
> +		drm_fb_memcpy(&dst, NULL, map_data, fb, rect);
>
>  	memset(req, 0, sizeof(*req));
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> index b8e64dd8d3a6..26e63148e226 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> @@ -21,19 +21,20 @@
>  #include "hyperv_drm.h"
>  
>  static int hyperv_blit_to_vram_rect(struct drm_framebuffer *fb,
> -				    const struct iosys_map *map,
> +				    const struct iosys_map *vmap,
>  				    struct drm_rect *rect)
>  {
>  	struct hyperv_drm_device *hv = to_hv(fb->dev);
> -	void __iomem *dst = hv->vram;
> -	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
> +	struct iosys_map dst;
>  	int idx;
>  
>  	if (!drm_dev_enter(&hv->dev, &idx))
>  		return -ENODEV;
>  
> -	dst += drm_fb_clip_offset(fb->pitches[0], fb->format, rect);
> -	drm_fb_memcpy_toio(dst, fb->pitches[0], vmap, fb, rect);
> +	iosys_map_set_vaddr_iomem(&dst, hv->vram);
> +	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, rect));
> +
> +	drm_fb_memcpy(&dst, fb->pitches, vmap, fb, rect);
>  
>  	drm_dev_exit(idx);
>  
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index a02f599cb9cf..a79a0ee3a50d 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -755,13 +755,14 @@ mgag200_simple_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
>  
>  static void
>  mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
> -		      struct drm_rect *clip, const struct iosys_map *map)
> +		      struct drm_rect *clip, const struct iosys_map *vmap)
>  {
> -	void __iomem *dst = mdev->vram;
> -	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
> +	struct iosys_map dst;
Or use
struct iosys_map dst = IOSYS_MAP_INIT_VADDR(mdev->vram);

There is no drm_dev_enter() here we need to pass first, like in
hyperv_drm_modeset.c above.

>  
> -	dst += drm_fb_clip_offset(fb->pitches[0], fb->format, clip);
> -	drm_fb_memcpy_toio(dst, fb->pitches[0], vmap, fb, clip);
> +	iosys_map_set_vaddr_iomem(&dst, mdev->vram);
> +	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
> +
> +	drm_fb_memcpy(&dst, fb->pitches, vmap, fb, clip);
>  }
>  
>  static void
> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
> index c4f5beea1f90..73fb9f63d227 100644
> --- a/drivers/gpu/drm/tiny/cirrus.c
> +++ b/drivers/gpu/drm/tiny/cirrus.c
> @@ -316,28 +316,31 @@ static int cirrus_mode_set(struct cirrus_device *cirrus,
>  }
>  
>  static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
> -			       const struct iosys_map *map,
> +			       const struct iosys_map *vmap,
>  			       struct drm_rect *rect)
>  {
>  	struct cirrus_device *cirrus = to_cirrus(fb->dev);
> -	void __iomem *dst = cirrus->vram;
> -	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
> +	struct iosys_map dst;
> +	void *vaddr = vmap->vaddr; /* TODO: Use mapping abstraction properly */
>  	int idx;
>  
>  	if (!drm_dev_enter(&cirrus->dev, &idx))
>  		return -ENODEV;
>  
> +	iosys_map_set_vaddr_iomem(&dst, cirrus->vram);
> +
>  	if (cirrus->cpp == fb->format->cpp[0]) {
> -		dst += drm_fb_clip_offset(fb->pitches[0], fb->format, rect);
> -		drm_fb_memcpy_toio(dst, fb->pitches[0], vmap, fb, rect);
> +		iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, rect));
> +		drm_fb_memcpy(&dst, fb->pitches, vmap, fb, rect);
>  
>  	} else if (fb->format->cpp[0] == 4 && cirrus->cpp == 2) {
> -		dst += drm_fb_clip_offset(cirrus->pitch, fb->format, rect);
> -		drm_fb_xrgb8888_to_rgb565_toio(dst, cirrus->pitch, vmap, fb, rect, false);
> +		iosys_map_incr(&dst, drm_fb_clip_offset(cirrus->pitch, fb->format, rect));
> +		drm_fb_xrgb8888_to_rgb565_toio(dst.vaddr_iomem, cirrus->pitch, vaddr, fb, rect,
> +					       false);
>  
>  	} else if (fb->format->cpp[0] == 4 && cirrus->cpp == 3) {
> -		dst += drm_fb_clip_offset(cirrus->pitch, fb->format, rect);
> -		drm_fb_xrgb8888_to_rgb888_toio(dst, cirrus->pitch, vmap, fb, rect);
> +		iosys_map_incr(&dst, drm_fb_clip_offset(cirrus->pitch, fb->format, rect));
> +		drm_fb_xrgb8888_to_rgb888_toio(dst.vaddr_iomem, cirrus->pitch, vaddr, fb, rect);
>  
>  	} else {
>  		WARN_ON_ONCE("cpp mismatch");
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index 21daea7fda99..8af6a2717bc9 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -14,10 +14,9 @@ struct drm_rect;
>  unsigned int drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info *format,
>  				const struct drm_rect *clip);
>  
> -void drm_fb_memcpy(void *dst, unsigned int dst_pitch, const void *vaddr,
> -		   const struct drm_framebuffer *fb, const struct drm_rect *clip);
> -void drm_fb_memcpy_toio(void __iomem *dst, unsigned int dst_pitch, const void *vaddr,
> -			const struct drm_framebuffer *fb, const struct drm_rect *clip);
> +void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
> +		   const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> +		   const struct drm_rect *clip);
>  void drm_fb_swab(void *dst, unsigned int dst_pitch, const void *src,
>  		 const struct drm_framebuffer *fb, const struct drm_rect *clip,
>  		 bool cached);
> -- 
> 2.37.1
