Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1631B9933EA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 18:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3FC10E3DD;
	Mon,  7 Oct 2024 16:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hvsJOJ6E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3CD10E3DD
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 16:51:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62C81E0006;
 Mon,  7 Oct 2024 16:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728319878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rRZMTR1n/c5WTha8acx2XuOAYRFLJCXcobXPAU05IwM=;
 b=hvsJOJ6EE7PFjP9GabrrJ0wgvzPInnhglw+nh/p+QObBGGFDXpE6riy8SnHUQ62h/ZkJ8J
 Og1zSCK6QfGbE0S/D4zxkYUGmN2SKX7mRRFtAsyc8juD3b93dq8FjsYNMdWQt7yq1gSSh0
 GA30FDbxOuf2pxzvFZcEspTpL2Ay01nZt3Ek3ksk/VZYlP7SpMqSX+8y0L/zysT89l/Ed+
 MmG1LfvqX1vU2b9EDdb1dXxNwcAKZsXOEJcrbxBatUAyoTxOjXO5NIOCkV3KtFL9D8Hr/R
 2/fzAlSuZPfkB4ZdrDn2rKE5WlvUVFkbvFg4JQjGMjH5MD6JX3xNvvS1TBaxKw==
Date: Mon, 7 Oct 2024 18:51:16 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Paz Zcharya <pazz@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Paz Zcharya <pazz@google.com>,
 David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Maaara Canal <mairacanal@riseup.net>,
 Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/vkms: Add support for ABGR8888 pixel format
Message-ID: <ZwQRhKHZuK4AgWuy@fedora>
Mail-Followup-To: Paz Zcharya <pazz@chromium.org>,
 LKML <linux-kernel@vger.kernel.org>, Paz Zcharya <pazz@google.com>,
 David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maaara Canal <mairacanal@riseup.net>,
 Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20241007142814.4037157-1-pazz@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007142814.4037157-1-pazz@google.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/10/24 - 14:27, Paz Zcharya wrote:
> Add support for pixel format ABGR8888, which is the default format
> on Android devices. This will allow us to use VKMS as the default
> display driver in Android Emulator (Cuttlefish) and increase VKMS
> adoption.

Hi Paz,

Thank you for your contribution!

I am very happy to see new users for VKMS, and I will be glad to add new 
formats to VKMS!

However, as you can see [1], there is a significant rework of the VKMS 
formats and composition that should be merged soon.

This series introduces two key improvements: performance enhancements and 
YUV support. These changes involve substantial modifications to the 
vkms_format.c file, which may conflict with your work.

Additionally, I wrote a few patches [2] and [3] a few months ago to 
practice with VKMS, and they did not receive any comments, so I believe I 
will be able to merge them quickly after [1].

In [2], I added many new formats: ABGR, BGRA, RGBA, XBGR, RGBX, BGRX, 
BGR565, P010, P012, P016. 
Would you mind testing this version to see if it meets your needs?

In [3], I did similar work for writeback, but it is not as complete, so I 
need to add a patch, almost identical to your code:

	static void argb_u16_to_ABGR8888(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
		[...]

Added:	WRITE_LINE(XBGR8888_write_line, argb_u16_to_XBGR8888)

I need to send a v2 of [3] anyway because of conflicts, do you mind if I 
take your argb_u16_to_ABGR8888 to integrate it (with your signed-off-by 
obviously)?

In any case, if you have time to test, or even better review [1], [2] or 
[3], it could be amazing!

Thank you,
Louis Chauvet

[1]:https://lore.kernel.org/all/20241007-yuv-v12-0-01c1ada6fec8@bootlin.com/
[2]:https://lore.kernel.org/all/20241007-b4-new-color-formats-v2-0-d47da50d4674@bootlin.com/
[3]:https://lore.kernel.org/all/20240814-writeback_line_by_line-v2-0-36541c717569@bootlin.com/

> Signed-off-by: Paz Zcharya <pazz@chromium.org>
> ---
> 
>  drivers/gpu/drm/vkms/vkms_formats.c   | 20 ++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_plane.c     |  1 +
>  drivers/gpu/drm/vkms/vkms_writeback.c |  1 +
>  3 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 040b7f113a3b..9e9d7290388e 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -73,6 +73,14 @@ static void XRGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixe
>  	out_pixel->b = (u16)src_pixels[0] * 257;
>  }
>  
> +static void ABGR8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
> +{
> +	out_pixel->a = (u16)src_pixels[3] * 257;
> +	out_pixel->b = (u16)src_pixels[2] * 257;
> +	out_pixel->g = (u16)src_pixels[1] * 257;
> +	out_pixel->r = (u16)src_pixels[0] * 257;
> +}
> +
>  static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>  {
>  	__le16 *pixels = (__force __le16 *)src_pixels;
> @@ -176,6 +184,14 @@ static void argb_u16_to_XRGB8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel
>  	dst_pixels[0] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
>  }
>  
> +static void argb_u16_to_ABGR8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
> +{
> +	dst_pixels[3] = DIV_ROUND_CLOSEST(in_pixel->a, 257);
> +	dst_pixels[2] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
> +	dst_pixels[1] = DIV_ROUND_CLOSEST(in_pixel->g, 257);
> +	dst_pixels[0] = DIV_ROUND_CLOSEST(in_pixel->r, 257);
> +}
> +
>  static void argb_u16_to_ARGB16161616(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
>  {
>  	__le16 *pixels = (__force __le16 *)dst_pixels;
> @@ -234,6 +250,8 @@ void *get_pixel_conversion_function(u32 format)
>  		return &ARGB8888_to_argb_u16;
>  	case DRM_FORMAT_XRGB8888:
>  		return &XRGB8888_to_argb_u16;
> +	case DRM_FORMAT_ABGR8888:
> +		return &ABGR8888_to_argb_u16;
>  	case DRM_FORMAT_ARGB16161616:
>  		return &ARGB16161616_to_argb_u16;
>  	case DRM_FORMAT_XRGB16161616:
> @@ -252,6 +270,8 @@ void *get_pixel_write_function(u32 format)
>  		return &argb_u16_to_ARGB8888;
>  	case DRM_FORMAT_XRGB8888:
>  		return &argb_u16_to_XRGB8888;
> +	case DRM_FORMAT_ABGR8888:
> +		return &argb_u16_to_ABGR8888;
>  	case DRM_FORMAT_ARGB16161616:
>  		return &argb_u16_to_ARGB16161616;
>  	case DRM_FORMAT_XRGB16161616:
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index e5c625ab8e3e..8efd585fc34c 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -15,6 +15,7 @@
>  static const u32 vkms_formats[] = {
>  	DRM_FORMAT_ARGB8888,
>  	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ABGR8888,
>  	DRM_FORMAT_XRGB16161616,
>  	DRM_FORMAT_ARGB16161616,
>  	DRM_FORMAT_RGB565
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index bc724cbd5e3a..04cb9c58e7ad 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -17,6 +17,7 @@
>  static const u32 vkms_wb_formats[] = {
>  	DRM_FORMAT_ARGB8888,
>  	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ABGR8888,
>  	DRM_FORMAT_XRGB16161616,
>  	DRM_FORMAT_ARGB16161616,
>  	DRM_FORMAT_RGB565
> -- 
> 2.47.0.rc0.187.ge670bccf7e-goog
> 
