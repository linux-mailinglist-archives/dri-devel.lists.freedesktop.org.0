Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFCF9B188B
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 16:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0335D10E065;
	Sat, 26 Oct 2024 14:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="KUEV9YZj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB76A10E065
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 14:17:46 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4XbMDp0b8Xz9vjC;
 Sat, 26 Oct 2024 14:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1729952266; bh=ojQyuL54P/Axrba4i4MZJ3xejZFVPA2UUIAJ3CEhRLA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KUEV9YZjC3iVkITj732zZLrZ4L1bKH1LMzi3paIh3ExBJ2bjk9Mo5iXOzrJqC3MxF
 yzz/inKffEBoKoERX4VY3BGsys/aUdlt90nbkBvkHXrjcBKN2aPELEK5vvZE6RPeLW
 vKY/ggvz2GH7eujICf1qPbpGzU7dFJaQWzwycHK0=
X-Riseup-User-ID: 9BB3AEDD323DC9B7A54997FEF095999AC26B4FDDCA584D7972737B3AD7B532D7
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4XbMDg0P27zJn4t;
 Sat, 26 Oct 2024 14:17:38 +0000 (UTC)
Message-ID: <63f0bf12-4df8-48d1-b8c8-2ed27a860937@riseup.net>
Date: Sat, 26 Oct 2024 11:17:36 -0300
MIME-Version: 1.0
Subject: Re: [PATCH RESEND v2 4/8] drm/vkms: Add support for RGB565 formats
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 20241007-yuv-v12-0-01c1ada6fec8@bootlin.com
References: <20241007-b4-new-color-formats-v2-0-d47da50d4674@bootlin.com>
 <20241007-b4-new-color-formats-v2-4-d47da50d4674@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20241007-b4-new-color-formats-v2-4-d47da50d4674@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Louis,

On 07/10/24 13:46, Louis Chauvet wrote:
> The format RGB565 was already supported. Add the support for:
> - BGR565
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_formats.c | 25 ++++++++++++++++++++++++-
>   drivers/gpu/drm/vkms/vkms_plane.c   |  1 +
>   2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index c03a481f5005..e34bea5da752 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -249,7 +249,7 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(const __le16 *pixel)
>   	return out_pixel;
>   }
>   
> -static struct pixel_argb_u16 argb_u16_from_gray8(u16 gray)
> +static struct pixel_argb_u16 argb_u16_from_gray8(u8 gray)

Again, fix the issue in the patch that introduce it.

Best Regards,
- Maíra

>   {
>   	return argb_u16_from_u8888(255, gray, gray, gray);
>   }
> @@ -259,6 +259,26 @@ static struct pixel_argb_u16 argb_u16_from_grayu16(u16 gray)
>   	return argb_u16_from_u16161616(0xFFFF, gray, gray, gray);
>   }
>   
> +static struct pixel_argb_u16 argb_u16_from_BGR565(const __le16 *pixel)
> +{
> +	struct pixel_argb_u16 out_pixel;
> +
> +	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
> +	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> +
> +	u16 rgb_565 = le16_to_cpu(*pixel);
> +	s64 fp_b = drm_int2fixp((rgb_565 >> 11) & 0x1f);
> +	s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
> +	s64 fp_r = drm_int2fixp(rgb_565 & 0x1f);
> +
> +	out_pixel.a = (u16)0xffff;
> +	out_pixel.b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
> +	out_pixel.g = drm_fixp2int_round(drm_fixp_mul(fp_g, fp_g_ratio));
> +	out_pixel.r = drm_fixp2int_round(drm_fixp_mul(fp_r, fp_rb_ratio));
> +
> +	return out_pixel;
> +}
> +
>   VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
>   							    const struct conversion_matrix *matrix)
>   {
> @@ -447,6 +467,7 @@ READ_LINE_16161616(XRGB16161616_read_line, px, 0xFFFF, px[2], px[1], px[0])
>   READ_LINE_16161616(XBGR16161616_read_line, px, 0xFFFF, px[0], px[1], px[2])
>   
>   READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
> +READ_LINE(BGR565_read_line, px, __le16, argb_u16_from_BGR565, px)
>   
>   READ_LINE(R8_read_line, px, u8, argb_u16_from_gray8, *px)
>   
> @@ -668,6 +689,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
>   		return &XBGR16161616_read_line;
>   	case DRM_FORMAT_RGB565:
>   		return &RGB565_read_line;
> +	case DRM_FORMAT_BGR565:
> +		return &BGR565_read_line;
>   	case DRM_FORMAT_NV12:
>   	case DRM_FORMAT_NV16:
>   	case DRM_FORMAT_NV24:
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 1e971c7760d9..a243a706459f 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -26,6 +26,7 @@ static const u32 vkms_formats[] = {
>   	DRM_FORMAT_ARGB16161616,
>   	DRM_FORMAT_ABGR16161616,
>   	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_BGR565,
>   	DRM_FORMAT_NV12,
>   	DRM_FORMAT_NV16,
>   	DRM_FORMAT_NV24,
> 
