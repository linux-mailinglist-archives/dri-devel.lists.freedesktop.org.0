Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABED57A21F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 16:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACE012BA12;
	Tue, 19 Jul 2022 14:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 369 seconds by postgrey-1.36 at gabe;
 Tue, 19 Jul 2022 14:46:02 UTC
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D7D12B902
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 14:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2ud6nsluqSsKTO9Z0i1MLYe01IcSu66ta8TyQvTI8QI=; b=FDYK2qx4o9VfiSKX4kjtfYaK5d
 CuD34rsqF62M3zMoNqL8juQGVRzEcrLAIraI4aeB1HMVVtlyYKga86QnXJOREm7oSq+j0WLFtD5Zs
 L5HyL2l1RuRLjJbrhHNW3oUF8ytDTnYjhBi9Rc0DN5VoIAugUh0iSrq2O/crqeBL2OmO2s6ELWB1h
 N9V3Gtd5kfj8uZT9etsQ6MMoAAsvk5S9KgTe3dJIFW9Mn4Aib7nsPrlfA5kzNA99tTpoiCuWOkxAm
 afxAmnw+oCgm/4cViLsIstPfylUadQt6qYCFWW4woG80X02NwBHp15NZRPIaA/hSwMPugvNka1r+L
 OVQXiPnA==;
Received: from [2a01:799:961:d200:4408:c06b:bee8:b0a3] (port=52255)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oDoO6-0003Mu-Dz; Tue, 19 Jul 2022 16:39:50 +0200
Message-ID: <59b18586-f53f-9ad3-02a7-d629e4c19b81@tronnes.org>
Date: Tue, 19 Jul 2022 16:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] drm/gud: Fix endianness in gud_xrgb8888_to_color()
 helper
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <cover.1657300532.git.geert@linux-m68k.org>
 <b47589ed5d8ca44e0956684412e3f16f3227f887.1657300532.git.geert@linux-m68k.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <b47589ed5d8ca44e0956684412e3f16f3227f887.1657300532.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 08.07.2022 20.21, skrev Geert Uytterhoeven:
> DRM formats are defined to be little-endian, unless the
> DRM_FORMAT_BIG_ENDIAN flag is set.  Hence when converting from one
> format to another, multi-byte pixel values loaded from memory must be
> converted from little-endian to host-endian.  Conversely, multi-byte
> pixel values written to memory must be converted from host-endian to
> little-endian.  Currently only drm_fb_xrgb8888_to_rgb332_line() includes
> endianness handling.
> 
> Fix gud_xrgb8888_to_color() on big-endian platforms by adding the
> missing endianness handling.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Compile-tested only.
> 
> Interestingly, drm_fb_xrgb8888_to_rgb332() was introduced for GUD,
> and always had correct endiannes handling...

RGB332 support was added later and by that time I had understood that
the framebuffer was little endian and not host endian as I first assumed
(there's a fixme comment in gud_pipe.c that BE is probably broken but I
haven't got any hw to test on so I haven't tried to fix it).

Thanks for fixing this, pathces 2 and 3 tested on drm/gud and applied to
drm-misc-next.

Noralf.

> ---
>  drivers/gpu/drm/gud/gud_pipe.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
> index 4873f9799f412e04..d42592f6daab8b2a 100644
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -105,7 +105,8 @@ static size_t gud_xrgb8888_to_color(u8 *dst, const struct drm_format_info *forma
>  	unsigned int bits_per_pixel = 8 / block_width;
>  	u8 r, g, b, pix, *block = dst; /* Assign to silence compiler warning */
>  	unsigned int x, y, width;
> -	u32 *pix32;
> +	__le32 *sbuf32;
> +	u32 pix32;
>  	size_t len;
>  
>  	/* Start on a byte boundary */
> @@ -114,8 +115,8 @@ static size_t gud_xrgb8888_to_color(u8 *dst, const struct drm_format_info *forma
>  	len = drm_format_info_min_pitch(format, 0, width) * drm_rect_height(rect);
>  
>  	for (y = rect->y1; y < rect->y2; y++) {
> -		pix32 = src + (y * fb->pitches[0]);
> -		pix32 += rect->x1;
> +		sbuf32 = src + (y * fb->pitches[0]);
> +		sbuf32 += rect->x1;
>  
>  		for (x = 0; x < width; x++) {
>  			unsigned int pixpos = x % block_width; /* within byte from the left */
> @@ -126,9 +127,10 @@ static size_t gud_xrgb8888_to_color(u8 *dst, const struct drm_format_info *forma
>  				*block = 0;
>  			}
>  
> -			r = *pix32 >> 16;
> -			g = *pix32 >> 8;
> -			b = *pix32++;
> +			pix32 = le32_to_cpu(*sbuf32++);
> +			r = pix32 >> 16;
> +			g = pix32 >> 8;
> +			b = pix32;
>  
>  			switch (format->format) {
>  			case GUD_DRM_FORMAT_XRGB1111:
