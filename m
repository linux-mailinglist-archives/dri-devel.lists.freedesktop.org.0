Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEA458A1BA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 22:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D841A6842;
	Thu,  4 Aug 2022 20:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9925A359F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 20:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=JaPRpih+53MnLqAbNrdCdICN1nJZgmfyym/UDAbOPdQ=;
 b=MkbAnuzd2cJDLONEf1SHidt/IQxOCbm9up7CXrI4FHNinCMHe9jwgp0YfqseilrUbzsipg6Vienqy
 lHgorwPEU5m+oSOCHDZ04QKWBKR6ix5DO3C/tyrx5Ibkv2m1JB6LTaFHdGTqqJzg6M7sRqgoESQBQ/
 y3HjAGqin29C1bW56PPiii0PhNWO2nBvVclIan1he4ehAj+2G1gd2cxBBso6VghMGjMX/EoatK1uAH
 1grPttm2FPbEeRCdvszLHYmapbM5QTgp0ZpaWhjxIkFxmgm9rLNx5Q5/9bkvf8JA2B69Tum9kyiIgU
 D93JgQQJCeP40HX/dU+hhfSI1jGdHyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=JaPRpih+53MnLqAbNrdCdICN1nJZgmfyym/UDAbOPdQ=;
 b=nD85PbGu7/YZRXLQGIwnEI0ArgZ+qvNtaXp0GgEUaIGwHbQwYtGTZpSlLv7kSu1WzK9e4bG8P/ogP
 o47LUk7CQ==
X-HalOne-Cookie: d0db26ab7414fb0bbb36be4d0c1ebf0bd4cbbb87
X-HalOne-ID: 884683bf-1431-11ed-be81-d0431ea8bb03
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 884683bf-1431-11ed-be81-d0431ea8bb03;
 Thu, 04 Aug 2022 20:10:49 +0000 (UTC)
Date: Thu, 4 Aug 2022 22:10:47 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 04/12] drm/format-helper: Rework XRGB8888-to-RGBG332
 conversion
Message-ID: <YuwnxyuY1ZbRYsBf@ravnborg.org>
References: <20220727113312.22407-1-tzimmermann@suse.de>
 <20220727113312.22407-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727113312.22407-5-tzimmermann@suse.de>
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

On Wed, Jul 27, 2022 at 01:33:04PM +0200, Thomas Zimmermann wrote:
> Update XRGB8888-to-RGB332 conversion to support struct iosys_map
> and convert all users. Although these are single-plane color formats,
> the new interface supports multi-plane formats for consistency with
> drm_fb_blit().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

I am not going to repeat my naming rant here, so
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_format_helper.c           | 25 ++++++++++++++-----
>  drivers/gpu/drm/gud/gud_pipe.c                |  2 +-
>  .../gpu/drm/tests/drm_format_helper_test.c    | 14 ++++++-----
>  include/drm/drm_format_helper.h               |  5 ++--
>  4 files changed, 31 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index fa22d3cb11e8..2b5c3746ff4a 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -265,18 +265,31 @@ static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void *sbuf, unsigne
>  
>  /**
>   * drm_fb_xrgb8888_to_rgb332 - Convert XRGB8888 to RGB332 clip buffer
> - * @dst: RGB332 destination buffer
> - * @dst_pitch: Number of bytes between two consecutive scanlines within dst
> - * @src: XRGB8888 source buffer
> + * @dst: Array of RGB332 destination buffers
> + * @dst_pitch: Array of numbers of bytes between two consecutive scanlines within dst
> + * @vmap: Array of XRGB8888 source buffers
>   * @fb: DRM framebuffer
>   * @clip: Clip rectangle area to copy
>   *
>   * Drivers can use this function for RGB332 devices that don't natively support XRGB8888.
>   */
> -void drm_fb_xrgb8888_to_rgb332(void *dst, unsigned int dst_pitch, const void *src,
> -			       const struct drm_framebuffer *fb, const struct drm_rect *clip)
> +void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pitch,
> +			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> +			       const struct drm_rect *clip)
>  {
> -	drm_fb_xfrm(dst, dst_pitch, 1, src, fb, clip, false, drm_fb_xrgb8888_to_rgb332_line);
> +	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> +		0, 0, 0, 0
> +	};
> +
> +	if (!dst_pitch)
> +		dst_pitch = default_dst_pitch;
> +
> +	if (dst[0].is_iomem)
> +		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 1, vmap[0].vaddr, fb, clip,
> +				 false, drm_fb_xrgb8888_to_rgb332_line);
> +	else
> +		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 1, vmap[0].vaddr, fb, clip,
> +			    false, drm_fb_xrgb8888_to_rgb332_line);
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
>  
> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
> index a15cda9ba058..426a3ae6cc50 100644
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -196,7 +196,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
>  		} else if (format->format == DRM_FORMAT_R8) {
>  			drm_fb_xrgb8888_to_gray8(buf, 0, vaddr, fb, rect);
>  		} else if (format->format == DRM_FORMAT_RGB332) {
> -			drm_fb_xrgb8888_to_rgb332(buf, 0, vaddr, fb, rect);
> +			drm_fb_xrgb8888_to_rgb332(&dst, NULL, map_data, fb, rect);
>  		} else if (format->format == DRM_FORMAT_RGB565) {
>  			drm_fb_xrgb8888_to_rgb565(buf, 0, vaddr, fb, rect, gud_is_big_endian());
>  		} else if (format->format == DRM_FORMAT_RGB888) {
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index 98583bf56044..b74dba06f704 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -124,7 +124,8 @@ static void xrgb8888_to_rgb332_test(struct kunit *test)
>  {
>  	const struct xrgb8888_to_rgb332_case *params = test->param_value;
>  	size_t dst_size;
> -	__u8 *dst = NULL;
> +	struct iosys_map dst, xrgb8888;
> +	__u8 *buf = NULL;
>  
>  	struct drm_framebuffer fb = {
>  		.format = drm_format_info(DRM_FORMAT_XRGB8888),
> @@ -135,12 +136,13 @@ static void xrgb8888_to_rgb332_test(struct kunit *test)
>  				       &params->clip);
>  	KUNIT_ASSERT_GT(test, dst_size, 0);
>  
> -	dst = kunit_kzalloc(test, dst_size, GFP_KERNEL);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dst);
> +	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
>  
> -	drm_fb_xrgb8888_to_rgb332(dst, params->dst_pitch, params->xrgb8888,
> -				  &fb, &params->clip);
> -	KUNIT_EXPECT_EQ(test, memcmp(dst, params->expected, dst_size), 0);
> +	iosys_map_set_vaddr(&dst, buf);
> +	iosys_map_set_vaddr(&xrgb8888, (void __force *)params->xrgb8888);
> +	drm_fb_xrgb8888_to_rgb332(&dst, &params->dst_pitch, &xrgb8888, &fb, &params->clip);
> +	KUNIT_EXPECT_EQ(test, memcmp(buf, params->expected, dst_size), 0);
>  }
>  
>  static struct kunit_case drm_format_helper_test_cases[] = {
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index 60944feaa936..3c28f099e3ed 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -20,8 +20,9 @@ void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
>  void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
>  		 const struct iosys_map *vmap, const struct drm_framebuffer *fb,
>  		 const struct drm_rect *clip, bool cached);
> -void drm_fb_xrgb8888_to_rgb332(void *dst, unsigned int dst_pitch, const void *vaddr,
> -			       const struct drm_framebuffer *fb, const struct drm_rect *clip);
> +void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pitch,
> +			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> +			       const struct drm_rect *clip);
>  void drm_fb_xrgb8888_to_rgb565(void *dst, unsigned int dst_pitch, const void *vaddr,
>  			       const struct drm_framebuffer *fb, const struct drm_rect *clip,
>  			       bool swab);
> -- 
> 2.37.1
