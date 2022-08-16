Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BB2596103
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 19:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C382BDC5;
	Tue, 16 Aug 2022 17:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995742BEB4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 17:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=XPX9PrzpL5Xcnqpikncm9FC54Gepu0K6zD/r+mIO300=;
 b=nZ5qB3X4AdhVxvFyc+53Wmzn6tKXSQgy3ys7uE6gJXGWYlRoUugr7fV8MMz3Zr9VEIJnCzZiJmUAj
 cm/E3OrKX9S6ymw2yjC7YSk2+hkG1y2lFZxXRp6hEt1sqf2NlmLXfG9QmcOI/9lU0hqHhJVjUnIeEa
 Y4HFM27u86YBTQvaRGM2hitDvhP86PNScxVxBa2C0WI5qIcZSGnM4b5V9XrqES+L+9EctEMMZ/4+UT
 22OC9uuzNrIO3MRHI+t0hRrXNJ9H/0AwW4c3uGFcpO+h50FsRS8dKqQS8DhuwSYjGTNUHgO6huuq7z
 ZjRYcEUJF/HuY9GBAJ6BjD7vhQQCXiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=XPX9PrzpL5Xcnqpikncm9FC54Gepu0K6zD/r+mIO300=;
 b=i7PPXGSddFghEtKZqshmrVP2yHwyQ31qjdjZWJsq3J/hVc4kkyW1PLdPWivB8BVH+o7AuslQyHqKt
 KrlZHjgAw==
X-HalOne-Cookie: 195f0b5721d16737a49e7d2502dac724049c8fdb
X-HalOne-ID: 12dc670e-1d88-11ed-be85-d0431ea8bb03
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 12dc670e-1d88-11ed-be85-d0431ea8bb03;
 Tue, 16 Aug 2022 17:22:59 +0000 (UTC)
Date: Tue, 16 Aug 2022 19:22:57 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 4/4] drm/format-helper: Add drm_fb_build_fourcc_list()
 helper
Message-ID: <YvvScZ6P3hf4llz1@ravnborg.org>
References: <20220816134853.12468-1-tzimmermann@suse.de>
 <20220816134853.12468-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816134853.12468-5-tzimmermann@suse.de>
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
Cc: david@lechnology.com, emma@anholt.net, airlied@linux.ie, javierm@redhat.com,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 kamlesh.gurudasani@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, Aug 16, 2022 at 03:48:53PM +0200, Thomas Zimmermann wrote:
> Add drm_fb_build_fourcc_list() function that builds a list of supported
> formats from native and emulated ones. Helpful for all drivers that do
> format conversion as part of their plane updates. Update current caller.
> 
> v2:
> 	* use u32 instead of uint32_t (Sam)
> 	* print a warning if output array is too small (Sam)
> 	* comment fixes (Sam)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/drm_format_helper.c | 103 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/tiny/simpledrm.c    |  47 ++-----------
>  include/drm/drm_format_helper.h     |  11 ++-
>  3 files changed, 118 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 56642816fdff..fe1db7dbda3f 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -793,3 +793,106 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
>  	kfree(src32);
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_mono);
> +
> +static bool is_listed_fourcc(const uint32_t *fourccs, size_t nfourccs, uint32_t fourcc)
> +{
> +	const uint32_t *fourccs_end = fourccs + nfourccs;
> +
> +	while (fourccs < fourccs_end) {
> +		if (*fourccs == fourcc)
> +			return true;
> +		++fourccs;
> +	}
> +	return false;
> +}
> +
> +/**
> + * drm_fb_build_fourcc_list - Filters a list of supported color formats against
> + *                            the device's native formats
> + * @dev: DRM device
> + * @native_fourccs: 4CC codes of natively supported color formats
> + * @native_nfourccs: The number of entries in @native_fourccs
> + * @extra_fourccs: 4CC codes of additionally supported color formats
> + * @extra_nfourccs: The number of entries in @extra_fourccs
> + * @fourccs_out: Returns 4CC codes of supported color formats
> + * @nfourccs_out: The number of available entries in @fourccs_out
> + *
> + * This function create a list of supported color format from natively
> + * supported formats and the emulated formats.
> + * At a minimum, most userspace programs expect at least support for
> + * XRGB8888 on the primary plane. Devices that have to emulate the
> + * format, and possibly others, can use drm_fb_build_fourcc_list() to
> + * create a list of supported color formats. The returned list can
> + * be handed over to drm_universal_plane_init() et al. Native formats
> + * will go before emulated formats. Other heuristics might be applied
> + * to optimize the order. Formats near the beginning of the list are
> + * usually preferred over formats near the end of the list.
> + *
> + * Returns:
> + * The number of color-formats 4CC codes returned in @fourccs_out.
> + */
> +size_t drm_fb_build_fourcc_list(struct drm_device *dev,
> +				const u32 *native_fourccs, size_t native_nfourccs,
> +				const u32 *extra_fourccs, size_t extra_nfourccs,
> +				u32 *fourccs_out, size_t nfourccs_out)
> +{
> +	u32 *fourccs = fourccs_out;
> +	const u32 *fourccs_end = fourccs_out + nfourccs_out;
> +	bool found_native = false;
> +	size_t nfourccs, i;
> +
> +	/*
> +	 * The device's native formats go first.
> +	 */
> +
> +	nfourccs = min_t(size_t, native_nfourccs, nfourccs_out);
If nfourccs < nfourccs_out then there is not enough room for the
formats. I know this is unlikely, but anyway.. Maybe warn here too?

I would use min() here, as the types are all compatible, so no need to
cast to size_t.

> +
> +	for (i = 0; i < nfourccs; ++i) {
> +		u32 fourcc = native_fourccs[i];
> +
> +		drm_dbg_kms(dev, "adding native format %p4cc\n", &fourcc);
> +
> +		if (!found_native)
> +			found_native = is_listed_fourcc(extra_fourccs, extra_nfourccs, fourcc);
> +		*fourccs = fourcc;
> +		++fourccs;
> +	}
> +
> +	/*
> +	 * The plane's atomic_update helper converts the framebuffer's color format
> +	 * to a native format when copying to device memory.
> +	 *
> +	 * If there is not a single format supported by both, device and
> +	 * driver, the native formats are likely not supported by the conversion
> +	 * helpers. Therefore *only* support the native formats and add a
> +	 * conversion helper ASAP.
> +	 */
> +	if (!found_native) {
> +		drm_warn(dev, "Format conversion helpers required to add extra formats.\n");
> +		goto out;
> +	}
> +
> +	/*
> +	 * The extra formats, emulated by the driver, go second.
> +	 */
> +
> +	nfourccs = min_t(size_t, extra_nfourccs, fourccs_end - fourccs);
fourccs_end is a pointer which is subtracted with fourccs * sizeof(fourccs_end)
So the result is a pointer. I do not think this does what you try to do.
(Or I need more coffee?)


Using min() should give a nice warning I think - so drop min_t to avoid
the cast.

> +
> +	for (i = 0; i < nfourccs; ++i) {
> +		u32 fourcc = extra_fourccs[i];
> +
> +		if (is_listed_fourcc(native_fourccs, native_nfourccs, fourcc))
> +			continue; /* native formats already went first */
> +		*fourccs = fourcc;
> +		++fourccs;
> +	}
> +
> +	if (nfourccs < extra_nfourccs) {
> +		drm_warn(dev, "Format buffer too small. %zu trailing formats dropped.\n",
> +			 extra_nfourccs - nfourccs);
> +	}
Move this up right after the min()?

	Sam
> +
> +out:
> +	return fourccs - fourccs_out;
> +}
> +EXPORT_SYMBOL(drm_fb_build_fourcc_list);
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index 404290760c60..777ccd250871 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -644,45 +644,6 @@ static struct drm_display_mode simpledrm_mode(unsigned int width,
>  	return mode;
>  }
>  
> -static const uint32_t *simpledrm_device_formats(struct simpledrm_device *sdev,
> -						size_t *nformats_out)
> -{
> -	struct drm_device *dev = &sdev->dev;
> -	size_t i;
> -
> -	if (sdev->nformats)
> -		goto out; /* don't rebuild list on recurring calls */
> -
> -	/* native format goes first */
> -	sdev->formats[0] = sdev->format->format;
> -	sdev->nformats = 1;
> -
> -	/* default formats go second */
> -	for (i = 0; i < ARRAY_SIZE(simpledrm_primary_plane_formats); ++i) {
> -		if (simpledrm_primary_plane_formats[i] == sdev->format->format)
> -			continue; /* native format already went first */
> -		sdev->formats[sdev->nformats] = simpledrm_primary_plane_formats[i];
> -		sdev->nformats++;
> -	}
> -
> -	/*
> -	 * TODO: The simpledrm driver converts framebuffers to the native
> -	 * format when copying them to device memory. If there are more
> -	 * formats listed than supported by the driver, the native format
> -	 * is not supported by the conversion helpers. Therefore *only*
> -	 * support the native format and add a conversion helper ASAP.
> -	 */
> -	if (drm_WARN_ONCE(dev, i != sdev->nformats,
> -			  "format conversion helpers required for %p4cc",
> -			  &sdev->format->format)) {
> -		sdev->nformats = 1;
> -	}
> -
> -out:
> -	*nformats_out = sdev->nformats;
> -	return sdev->formats;
> -}
> -
>  static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
>  							struct platform_device *pdev)
>  {
> @@ -699,7 +660,6 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
>  	struct drm_encoder *encoder;
>  	struct drm_connector *connector;
>  	unsigned long max_width, max_height;
> -	const uint32_t *formats;
>  	size_t nformats;
>  	int ret;
>  
> @@ -811,11 +771,14 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
>  
>  	/* Primary plane */
>  
> -	formats = simpledrm_device_formats(sdev, &nformats);
> +	nformats = drm_fb_build_fourcc_list(dev, &format->format, 1,
> +					    simpledrm_primary_plane_formats,
> +					    ARRAY_SIZE(simpledrm_primary_plane_formats),
> +					    sdev->formats, ARRAY_SIZE(sdev->formats));
>  
>  	primary_plane = &sdev->primary_plane;
>  	ret = drm_universal_plane_init(dev, primary_plane, 0, &simpledrm_primary_plane_funcs,
> -				       formats, nformats,
> +				       sdev->formats, nformats,
>  				       simpledrm_primary_plane_format_modifiers,
>  				       DRM_PLANE_TYPE_PRIMARY, NULL);
>  	if (ret)
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index caa181194335..eb5c98cf82b8 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -6,11 +6,15 @@
>  #ifndef __LINUX_DRM_FORMAT_HELPER_H
>  #define __LINUX_DRM_FORMAT_HELPER_H
>  
> -struct iosys_map;
> +#include <linux/types.h>
> +
> +struct drm_device;
>  struct drm_format_info;
>  struct drm_framebuffer;
>  struct drm_rect;
>  
> +struct iosys_map;
> +
>  unsigned int drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info *format,
>  				const struct drm_rect *clip);
>  
> @@ -44,4 +48,9 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
>  			     const struct iosys_map *src, const struct drm_framebuffer *fb,
>  			     const struct drm_rect *clip);
>  
> +size_t drm_fb_build_fourcc_list(struct drm_device *dev,
> +				const u32 *native_fourccs, size_t native_nfourccs,
> +				const u32 *extra_fourccs, size_t extra_nfourccs,
> +				u32 *fourccs_out, size_t nfourccs_out);
> +
>  #endif /* __LINUX_DRM_FORMAT_HELPER_H */
> -- 
> 2.37.1
