Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59724591EFE
	for <lists+dri-devel@lfdr.de>; Sun, 14 Aug 2022 09:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AAD4CBAEB;
	Sun, 14 Aug 2022 07:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82214CBABF
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 07:55:17 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id r4so6110114edi.8
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 00:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=4w/IYgas/KEaZkPoBOHl3Ktyf22rgljFAdRahUvKw0Q=;
 b=UaWwx7RnKoZFY+QQJBrqa+xaqrw/tCuv3/g+xWnkqhFoJGTh69vG0NArr2XQRv8x+p
 +EBxr2Zk3u9+qZb3Se2Q5tvrdwUuLjHTVQgRuqM4hXkSYULVUasoVlq+ndPaPdTlvr1n
 UUjJQxboMElsZjt22ig/3PHvYoaB+UwaUxzAG6E0u3ysPcHCmCM5qh4Rni21oT7HSWVw
 Bf1QfjxPo+ZQYix7mT8680yEBF34q12q9tjJdNlVJDeg+PMzkW7o+e5hI6Vi9Tk9Ml0R
 /yuLOWaqGJwIsnLDi3g4+E6sXV2s8AXRUAmBDbwlsGGQnzqS4u63yFQaKzdH7A+5HG39
 tB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=4w/IYgas/KEaZkPoBOHl3Ktyf22rgljFAdRahUvKw0Q=;
 b=TgSyYQ9hWXFnrlHduwXSdeDDCjZcbEWAyUI8bgiJBVuDy3Kq1WzkzBhNqxBGf3LfT6
 YIqXAAJxVcjUx6/p/XkxGPF1uk45CZJpp2h8VbZa88tV9mrgHPp4EOZxskaSGN2tO+cl
 ZWdcv/X2CEFiwYgj2kdOPAJ2SjJOkJpDjQWf7eKoGYI8TMyGTpcL+7Y8AK/H4xToYeyF
 dEcPCNKVbP+gDjkpGlFrEVCeO5o6zrZ36qO6MdDsK50PtL8B2nP5MCDCZAKY77lq/7y2
 ejIdUeNIjRP3AyVETFQzYi4EGJdKiKJWE+maoaCPKrOT67JE2RpI7lPDyGSi4P63RYAe
 fQIA==
X-Gm-Message-State: ACgBeo0bMg7HnmfCQjZTuqkRq+CoSKZTwVjvoz5WS1gV74qM0TqQqhXa
 WV4DuBFfr+2a7+56jKrOsYo=
X-Google-Smtp-Source: AA6agR4LrdbCnhUUan6ufYrpIzRk/yYg41zWcRstMORxRKeVEKoCnJr0E5pWZQnEgn8DdH/0WeSdaA==
X-Received: by 2002:a05:6402:27c6:b0:43d:6fab:146e with SMTP id
 c6-20020a05640227c600b0043d6fab146emr10006225ede.376.1660463715968; 
 Sun, 14 Aug 2022 00:55:15 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115]) by smtp.gmail.com with ESMTPSA id
 b2-20020aa7d482000000b0043a6df72c11sm4279953edr.63.2022.08.14.00.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 00:55:15 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] drm/sun4i: dsi: Prevent underflow when computing packet
 sizes
Date: Sun, 14 Aug 2022 09:55:14 +0200
Message-ID: <8100632.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <20220812031623.34057-1-samuel@sholland.org>
References: <20220812031623.34057-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne petek, 12. avgust 2022 ob 05:16:23 CEST je Samuel Holland napisal(a):
> Currently, the packet overhead is subtracted using unsigned arithmetic.
> With a short sync pulse, this could underflow and wrap around to near
> the maximal u16 value. Fix this by using signed subtraction. The call to
> max() will correctly handle any negative numbers that are produced.
> 
> Apply the same fix to the other timings, even though those subtractions
> are less likely to underflow.
> 
> Fixes: 133add5b5ad4 ("drm/sun4i: Add Allwinner A31 MIPI-DSI controller
> support") Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c index b4dfa166eccd..34234a144e87
> 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -522,77 +522,77 @@ static void sun6i_dsi_setup_format(struct sun6i_dsi
> *dsi, SUN6I_DSI_PIXEL_PF1_CRC_INIT_LINE0(0xffff) |
>  		     SUN6I_DSI_PIXEL_PF1_CRC_INIT_LINEN(0xffff));
> 
>  	regmap_write(dsi->regs, SUN6I_DSI_PIXEL_CTL0_REG,
>  		     SUN6I_DSI_PIXEL_CTL0_PD_PLUG_DISABLE |
>  		     SUN6I_DSI_PIXEL_CTL0_FORMAT(fmt));
>  }
> 
>  static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
>  				    struct drm_display_mode 
*mode)
>  {
>  	struct mipi_dsi_device *device = dsi->device;
> -	unsigned int Bpp = mipi_dsi_pixel_format_to_bpp(device->format) / 
8;
> +	int Bpp = mipi_dsi_pixel_format_to_bpp(device->format) / 8;

Nit: mipi_dsi_pixel_format_to_bpp() can return -EINVAL in case of unsupported 
format. Would it make sense to check it?

In any case:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  	u16 hbp = 0, hfp = 0, hsa = 0, hblk = 0, vblk = 0;
>  	u32 basic_ctl = 0;
>  	size_t bytes;
>  	u8 *buffer;
> 
>  	/* Do all timing calculations up front to allocate buffer space */
> 
>  	if (device->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
>  		hblk = mode->hdisplay * Bpp;
>  		basic_ctl = SUN6I_DSI_BASIC_CTL_VIDEO_BURST |
>  			    SUN6I_DSI_BASIC_CTL_HSA_HSE_DIS |
>  			    SUN6I_DSI_BASIC_CTL_HBP_DIS;
> 
>  		if (device->lanes == 4)
>  			basic_ctl |= SUN6I_DSI_BASIC_CTL_TRAIL_FILL 
|
>  				     
SUN6I_DSI_BASIC_CTL_TRAIL_INV(0xc);
>  	} else {
>  		/*
>  		 * A sync period is composed of a blanking packet (4
>  		 * bytes + payload + 2 bytes) and a sync event packet
>  		 * (4 bytes). Its minimal size is therefore 10 bytes
>  		 */
>  #define HSA_PACKET_OVERHEAD	10
> -		hsa = max((unsigned int)HSA_PACKET_OVERHEAD,
> +		hsa = max(HSA_PACKET_OVERHEAD,
>  			  (mode->hsync_end - mode->hsync_start) * 
Bpp - HSA_PACKET_OVERHEAD);
> 
>  		/*
>  		 * The backporch is set using a blanking packet (4
>  		 * bytes + payload + 2 bytes). Its minimal size is
>  		 * therefore 6 bytes
>  		 */
>  #define HBP_PACKET_OVERHEAD	6
> -		hbp = max((unsigned int)HBP_PACKET_OVERHEAD,
> +		hbp = max(HBP_PACKET_OVERHEAD,
>  			  (mode->htotal - mode->hsync_end) * Bpp - 
HBP_PACKET_OVERHEAD);
> 
>  		/*
>  		 * The frontporch is set using a sync event (4 bytes)
>  		 * and two blanking packets (each one is 4 bytes +
>  		 * payload + 2 bytes). Its minimal size is therefore
>  		 * 16 bytes
>  		 */
>  #define HFP_PACKET_OVERHEAD	16
> -		hfp = max((unsigned int)HFP_PACKET_OVERHEAD,
> +		hfp = max(HFP_PACKET_OVERHEAD,
>  			  (mode->hsync_start - mode->hdisplay) * Bpp 
- HFP_PACKET_OVERHEAD);
> 
>  		/*
>  		 * The blanking is set using a sync event (4 bytes)
>  		 * and a blanking packet (4 bytes + payload + 2
>  		 * bytes). Its minimal size is therefore 10 bytes.
>  		 */
>  #define HBLK_PACKET_OVERHEAD	10
> -		hblk = max((unsigned int)HBLK_PACKET_OVERHEAD,
> +		hblk = max(HBLK_PACKET_OVERHEAD,
>  			   (mode->htotal - (mode->hsync_end - mode-
>hsync_start)) * Bpp -
>  			   HBLK_PACKET_OVERHEAD);
> 
>  		/*
>  		 * And I'm not entirely sure what vblk is about. The 
driver in
>  		 * Allwinner BSP is using a rather convoluted 
calculation
>  		 * there only for 4 lanes. However, using 0 (the !4 
lanes
>  		 * case) even with a 4 lanes screen seems to work...
>  		 */
>  		vblk = 0;
>  	}




