Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48810591567
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 20:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B999D37E;
	Fri, 12 Aug 2022 18:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1C59D5D5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 18:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=k/o2PPgXa9HciKe9YYQOrwEc9W2dZDXwhASuB/WhBmc=;
 b=G/x8vVe4p04Yzxt5fBqxr4fEVTC55H8cAvUyYHq0PxJJcyET3/AoVPvcqAsQoM7a0ie7Cn/r4sN3S
 DvOjOSw4IIrcbHF7414A3IFy+f6Gfd9a4l1v1CbW3M1blnRyHoulkOlUOAsTLycXifggie9y3dKazN
 3raZMm11PKV3+jbXfQOwmY502J1QTwcCIaYQuqcrhDo5OIGD5pSoLc+Qmql2Yiwo5OwgiZOHfGYC09
 aOj6xkbQSB5NWjCRidpsnOIo3MLq9Da1vHpY98GdHgVlTo2rRSbvZBzncoqjtVZhkpdG49WdJFDWa9
 w8jyHG7HkmHDs7h6H7NN+GKpVT2qgDA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=k/o2PPgXa9HciKe9YYQOrwEc9W2dZDXwhASuB/WhBmc=;
 b=M1Zp8jx0ddls4hJrgye9BwEwwHa5xv7JjZaZAUARVQCW5VzDIpLWkgm+eEr56FWqIy+orYe98usHM
 OhOmvlgCw==
X-HalOne-Cookie: 9b367950df8abbb7e28978f2003c4ad592710d04
X-HalOne-ID: 5f1dc0df-1a6b-11ed-be83-d0431ea8bb03
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 5f1dc0df-1a6b-11ed-be83-d0431ea8bb03;
 Fri, 12 Aug 2022 18:19:58 +0000 (UTC)
Date: Fri, 12 Aug 2022 20:19:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/4] drm/format-helper: Add drm_fb_build_fourcc_list()
 helper
Message-ID: <YvaZzIPv09Uj2C0D@ravnborg.org>
References: <20220810112053.19547-1-tzimmermann@suse.de>
 <20220810112053.19547-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810112053.19547-5-tzimmermann@suse.de>
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

On Wed, Aug 10, 2022 at 01:20:53PM +0200, Thomas Zimmermann wrote:
> Add drm_fb_build_fourcc_list() function that builds a list of supported
> formats from native and emulated ones. Helpful for all drivers that do
> format conversion as part of their plane updates. Update current caller.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

A few comments in the following. Consider to add the warning and with it
added or not:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_format_helper.c | 94 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/tiny/simpledrm.c    | 47 ++-------------
>  include/drm/drm_format_helper.h     | 11 +++-
>  3 files changed, 109 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 56642816fdff..dca5531615f3 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -793,3 +793,97 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
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
> + * supported formats and the emulated formats.  *
Stray '*' at the end of the line.

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
> +				const uint32_t *native_fourccs, size_t native_nfourccs,
> +				const uint32_t *extra_fourccs, size_t extra_nfourccs,
> +				uint32_t *fourccs_out, size_t nfourccs_out)

drm_fourcc.c uses the type u32 for fourcc codes, why no go with the same
here?

I wish we had a better way to express that we have a list of fourcc
codes, for example using list_head. But it is a bad mismatch with
the current drm_universal_plane_init() implementation.

The format negotiation operation in the bridges could benefit too.

> +{
> +	uint32_t *fourccs = fourccs_out;
> +	const uint32_t *fourccs_end = fourccs_out + nfourccs_out;
> +	bool found_native = false;
> +	size_t nfourccs, i;
> +
> +	/* native formats go first */
> +
Drop extra line, capital start
> +	nfourccs = min_t(size_t, native_nfourccs, nfourccs_out);
> +
> +	for (i = 0; i < nfourccs; ++i) {
> +		uint32_t fourcc = native_fourccs[i];
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
> +	 * to the native format when copying them to device memory.
> +	 *
> +	 * If there is not a single format supported by both, device and
> +	 * plane, the native formats are likely not supported by the conversion
> +	 * helpers. Therefore *only* support the native formats and add a
> +	 * conversion helper ASAP.
> +	 */
Despite the nice comment I had to think twice. In the end I agree with
this.

> +	if (!found_native) {
> +		drm_warn(dev, "format conversion helpers required to add extra formats\n");
> +		goto out;
> +	}
> +
> +	/* extra formats go second */
> +
Drop extra line, capital start.
> +	nfourccs = min_t(size_t, extra_nfourccs, fourccs_end - fourccs);
> +
> +	for (i = 0; i < nfourccs; ++i) {
> +		uint32_t fourcc = extra_fourccs[i];
> +
> +		if (is_listed_fourcc(native_fourccs, native_nfourccs, fourcc))
> +			continue; /* native formats already went first */
> +		*fourccs = fourcc;
> +		++fourccs;
> +	}
> +
> +out:
> +	return fourccs - fourccs_out;
> +}
It would be prudent to warn if the supplied fourccs_out array is too
small to the provided input formats. simpledrm is about to hit the limit.

> +EXPORT_SYMBOL(drm_fb_build_fourcc_list);
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index cc509154b296..79c9fd6bedf0 100644
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
simpledrm_primary_plane_formats is 6 long, with a todo to add 2 more.
So the current array of 8 in sdev->formats is big enough for now.


>  
>  	primary_plane = &sdev->primary_plane;
>  	ret = drm_universal_plane_init(dev, primary_plane, 0, &simpledrm_primary_plane_funcs,
> -				       formats, nformats,
> +				       sdev->formats, nformats,
>  				       simpledrm_primary_plane_format_modifiers,
>  				       DRM_PLANE_TYPE_PRIMARY, NULL);
>  	if (ret)
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index caa181194335..33278870e0d8 100644
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
> +				const uint32_t *native_fourccs, size_t native_nfourccs,
> +				const uint32_t *extra_fourccs, size_t extra_nfourccs,
> +				uint32_t *fourccs_out, size_t nfourccs_out);
> +
>  #endif /* __LINUX_DRM_FORMAT_HELPER_H */
> -- 
> 2.37.1
