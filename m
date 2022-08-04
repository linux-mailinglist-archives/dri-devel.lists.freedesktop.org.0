Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F37F58A1C0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 22:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2931A65E1;
	Thu,  4 Aug 2022 20:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5538AA585D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 20:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=y8TPE8j+P7wgBe//XTuEJNgbqxxwoLp7CEEYJPa0wX0=;
 b=BFhqeXf+RP+75k75uLEKVjUwSY3oOeG7I3Evv427OoFYDz7UTpbQEEXLGP6dXZ8kIuEjxcTDhfsUf
 5JG+2UOgBhyyabc1GIucjfXd34PPJ53w6gBUD4Yw082gbnVHuW5HNlxVAHZDRkRjq1ntpnf+b26dLu
 oAhEKJsL57IgkbP1E0YD8ikBsC7har9jLVr+Pxhwbx3Te+phkrc2y48gLMhO2msmj5baEmVtKDzWcq
 x2e7cd4L6xL6qtdjzkJ9iirDzqHfby4RFMzaEK0CDibiXDts0KJuvHNF6RiM0n36S7vVmbExIe8QdC
 POX3hKiNhIONNIvvyAHuXNwp4P5HR0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=y8TPE8j+P7wgBe//XTuEJNgbqxxwoLp7CEEYJPa0wX0=;
 b=6QKaeVl0vd42kXjl5jSCXhCRbwsfDqJV/z7o8pOUEMQJRqi+MYlXQ4EIl0qXNWyxP2kykydRM/uRk
 p6y22xDBg==
X-HalOne-Cookie: 52615ae4e67fbd6e211cd0f333d85e867fe0bc58
X-HalOne-ID: bc4d4596-1431-11ed-8244-d0431ea8bb10
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id bc4d4596-1431-11ed-8244-d0431ea8bb10;
 Thu, 04 Aug 2022 20:12:16 +0000 (UTC)
Date: Thu, 4 Aug 2022 22:12:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 05/12] drm/format-helper: Rework XRGB8888-to-RGBG565
 conversion
Message-ID: <YuwoH1GIRl8wthIY@ravnborg.org>
References: <20220727113312.22407-1-tzimmermann@suse.de>
 <20220727113312.22407-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727113312.22407-6-tzimmermann@suse.de>
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

On Wed, Jul 27, 2022 at 01:33:05PM +0200, Thomas Zimmermann wrote:
> Update XRGB8888-to-RGB565 conversion to support struct iosys_map
> and convert all users. Although these are single-plane color formats,
> the new interface supports multi-plane formats for consistency with
> drm_fb_blit().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/drm_format_helper.c | 59 +++++++++++------------------
>  drivers/gpu/drm/drm_mipi_dbi.c      |  4 +-
>  drivers/gpu/drm/gud/gud_pipe.c      |  3 +-
>  drivers/gpu/drm/tiny/cirrus.c       |  3 +-
>  include/drm/drm_format_helper.h     |  9 ++---
>  5 files changed, 30 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 2b5c3746ff4a..8bf5655f5ce0 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -330,9 +330,9 @@ static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
>  
>  /**
>   * drm_fb_xrgb8888_to_rgb565 - Convert XRGB8888 to RGB565 clip buffer
> - * @dst: RGB565 destination buffer
> - * @dst_pitch: Number of bytes between two consecutive scanlines within dst
> - * @vaddr: XRGB8888 source buffer
> + * @dst: Array of RGB565 destination buffers
> + * @dst_pitch: Array of numbers of bytes between two consecutive scanlines within dst
> + * @vmap: Array of XRGB8888 source buffer
>   * @fb: DRM framebuffer
>   * @clip: Clip rectangle area to copy
>   * @swab: Swap bytes
> @@ -340,43 +340,31 @@ static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
>   * Drivers can use this function for RGB565 devices that don't natively
>   * support XRGB8888.
>   */
> -void drm_fb_xrgb8888_to_rgb565(void *dst, unsigned int dst_pitch, const void *vaddr,
> -			       const struct drm_framebuffer *fb, const struct drm_rect *clip,
> -			       bool swab)
> +void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
> +			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> +			       const struct drm_rect *clip, bool swab)
>  {
> +	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> +		0, 0, 0, 0
> +	};
> +	void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels);
> +
>  	if (swab)
> -		drm_fb_xfrm(dst, dst_pitch, 2, vaddr, fb, clip, false,
> -			    drm_fb_xrgb8888_to_rgb565_swab_line);
> +		xfrm_line = drm_fb_xrgb8888_to_rgb565_swab_line;
>  	else
> -		drm_fb_xfrm(dst, dst_pitch, 2, vaddr, fb, clip, false,
> -			    drm_fb_xrgb8888_to_rgb565_line);
> -}
> -EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
> +		xfrm_line = drm_fb_xrgb8888_to_rgb565_line;
>  
> -/**
> - * drm_fb_xrgb8888_to_rgb565_toio - Convert XRGB8888 to RGB565 clip buffer
> - * @dst: RGB565 destination buffer (iomem)
> - * @dst_pitch: Number of bytes between two consecutive scanlines within dst
> - * @vaddr: XRGB8888 source buffer
> - * @fb: DRM framebuffer
> - * @clip: Clip rectangle area to copy
> - * @swab: Swap bytes
> - *
> - * Drivers can use this function for RGB565 devices that don't natively
> - * support XRGB8888.
> - */
> -void drm_fb_xrgb8888_to_rgb565_toio(void __iomem *dst, unsigned int dst_pitch,
> -				    const void *vaddr, const struct drm_framebuffer *fb,
> -				    const struct drm_rect *clip, bool swab)
> -{
> -	if (swab)
> -		drm_fb_xfrm_toio(dst, dst_pitch, 2, vaddr, fb, clip, false,
> -				 drm_fb_xrgb8888_to_rgb565_swab_line);
> +	if (!dst_pitch)
> +		dst_pitch = default_dst_pitch;
> +
> +	if (dst[0].is_iomem)
> +		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 2, vmap[0].vaddr, fb, clip,
> +				 false, xfrm_line);
>  	else
> -		drm_fb_xfrm_toio(dst, dst_pitch, 2, vaddr, fb, clip, false,
> -				 drm_fb_xrgb8888_to_rgb565_line);
> +		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 2, vmap[0].vaddr, fb, clip,
> +			    false, xfrm_line);
>  }
> -EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565_toio);
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
>  
>  static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigned int pixels)
>  {
> @@ -605,8 +593,7 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
>  
>  	} else if (dst_format == DRM_FORMAT_RGB565) {
>  		if (fb_format == DRM_FORMAT_XRGB8888) {
> -			drm_fb_xrgb8888_to_rgb565_toio(dst[0].vaddr_iomem, dst_pitch[0],
> -						       vmap[0].vaddr, fb, clip, false);
> +			drm_fb_xrgb8888_to_rgb565(dst, dst_pitch, vmap, fb, clip, false);
>  			return 0;
>  		}
>  	} else if (dst_format == DRM_FORMAT_RGB888) {
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index 973a75585cad..d0bdbcb96705 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -206,7 +206,6 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
>  	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
>  	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
>  	struct iosys_map dst_map = IOSYS_MAP_INIT_VADDR(dst);
> -	void *src;
>  	int ret;
>  
>  	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> @@ -216,7 +215,6 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
>  	ret = drm_gem_fb_vmap(fb, map, data);
>  	if (ret)
>  		goto out_drm_gem_fb_end_cpu_access;
> -	src = data[0].vaddr; /* TODO: Use mapping abstraction properly */
>  
>  	switch (fb->format->format) {
>  	case DRM_FORMAT_RGB565:
> @@ -226,7 +224,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
>  			drm_fb_memcpy(&dst_map, NULL, data, fb, clip);
>  		break;
>  	case DRM_FORMAT_XRGB8888:
> -		drm_fb_xrgb8888_to_rgb565(dst, 0, src, fb, clip, swap);
> +		drm_fb_xrgb8888_to_rgb565(&dst_map, NULL, data, fb, clip, swap);
>  		break;
>  	default:
>  		drm_err_once(fb->dev, "Format is not supported: %p4cc\n",
> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
> index 426a3ae6cc50..a43eb6645352 100644
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -198,7 +198,8 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
>  		} else if (format->format == DRM_FORMAT_RGB332) {
>  			drm_fb_xrgb8888_to_rgb332(&dst, NULL, map_data, fb, rect);
>  		} else if (format->format == DRM_FORMAT_RGB565) {
> -			drm_fb_xrgb8888_to_rgb565(buf, 0, vaddr, fb, rect, gud_is_big_endian());
> +			drm_fb_xrgb8888_to_rgb565(&dst, NULL, map_data, fb, rect,
> +						  gud_is_big_endian());
>  		} else if (format->format == DRM_FORMAT_RGB888) {
>  			drm_fb_xrgb8888_to_rgb888(buf, 0, vaddr, fb, rect);
>  		} else {
> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
> index 73fb9f63d227..9cd398e4700b 100644
> --- a/drivers/gpu/drm/tiny/cirrus.c
> +++ b/drivers/gpu/drm/tiny/cirrus.c
> @@ -335,8 +335,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
>  
>  	} else if (fb->format->cpp[0] == 4 && cirrus->cpp == 2) {
>  		iosys_map_incr(&dst, drm_fb_clip_offset(cirrus->pitch, fb->format, rect));
> -		drm_fb_xrgb8888_to_rgb565_toio(dst.vaddr_iomem, cirrus->pitch, vaddr, fb, rect,
> -					       false);
> +		drm_fb_xrgb8888_to_rgb565(&dst, &cirrus->pitch, vmap, fb, rect, false);
>  
>  	} else if (fb->format->cpp[0] == 4 && cirrus->cpp == 3) {
>  		iosys_map_incr(&dst, drm_fb_clip_offset(cirrus->pitch, fb->format, rect));
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index 3c28f099e3ed..9f1d45d7ce84 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -23,12 +23,9 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
>  void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pitch,
>  			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
>  			       const struct drm_rect *clip);
> -void drm_fb_xrgb8888_to_rgb565(void *dst, unsigned int dst_pitch, const void *vaddr,
> -			       const struct drm_framebuffer *fb, const struct drm_rect *clip,
> -			       bool swab);
> -void drm_fb_xrgb8888_to_rgb565_toio(void __iomem *dst, unsigned int dst_pitch,
> -				    const void *vaddr, const struct drm_framebuffer *fb,
> -				    const struct drm_rect *clip, bool swab);
> +void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
> +			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> +			       const struct drm_rect *clip, bool swab);
>  void drm_fb_xrgb8888_to_rgb888(void *dst, unsigned int dst_pitch, const void *src,
>  			       const struct drm_framebuffer *fb, const struct drm_rect *clip);
>  void drm_fb_xrgb8888_to_rgb888_toio(void __iomem *dst, unsigned int dst_pitch,
> -- 
> 2.37.1
