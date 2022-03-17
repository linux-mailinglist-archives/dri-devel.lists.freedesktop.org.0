Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0342B4DC454
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 11:54:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FF210E02C;
	Thu, 17 Mar 2022 10:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B7A10E02C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 10:54:30 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h23so6174204wrb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 03:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5Fp2JXvvqH+aC7FWmIBL6IG5t/36fiHTfVb+LcUMFDM=;
 b=QLReWDu5wJKUk35iq079YDYVoE3/bXnpEvyru+ZXG+wITiiktIikL1b+fPgxyWnpWx
 nuEEhRo3HoQ2dou2AYSNGt6y6kxWOVkcBXB4jRR34QvTyIadRLpJd1JhLNij9y9kkeQ4
 M6lHzfdxM7D1g2DxK65tcWGFYLryOUbjTZDgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5Fp2JXvvqH+aC7FWmIBL6IG5t/36fiHTfVb+LcUMFDM=;
 b=OMxJoi3AE0o4yWMjnXqQ0p4+uCcBpIZmqX9raq9qxPlebhWGkyFEHOnB6eWFTTT/bV
 5sMmpgiIATaKP5CxnirF2ZwKi+w9HSznsfIclqganRRJboyZQDw0zq0FqqEr4kt/HdIN
 o1SFWzUYWU1SmFSgI1WyCXu6kpUcgLpAW71HEanfw1PtEVur/0oRbbjeZt3TVO2VC3Lk
 1AM1EpK0qVGA+5GnJmr3kV2h+11Q853vhMC1gDkNIzxN3Dp/wkXiTqhXvhMKbSWMduZG
 5p6yt9kTcBC4qxqsoQ/4nqEqJsXiP3wuuv/alr5TWhRsSAZfQq6oVkwyI/FE5LvWSsEf
 rmlw==
X-Gm-Message-State: AOAM532xuQUa001sZrqa/mezFn9TK7ao9o8O2400J3Dl+zcAU4+tJUcd
 TVVrPEivv+QI+iLx50tTEnqOhQ==
X-Google-Smtp-Source: ABdhPJyzdNkTXnro8TEwmY6RE5NfAdDw2G3/f+2vjbkmXlFXwMY0+IToPEqpVXsYxuvJNencL18NRg==
X-Received: by 2002:a5d:4d8d:0:b0:203:ed23:e330 with SMTP id
 b13-20020a5d4d8d000000b00203ed23e330mr1393036wru.143.1647514468311; 
 Thu, 17 Mar 2022 03:54:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a05600c19cb00b00389efe9c512sm8243034wmq.23.2022.03.17.03.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 03:54:27 -0700 (PDT)
Date: Thu, 17 Mar 2022 11:54:26 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] fbdev: Fix cfb_imageblit() for arbitrary image widths
Message-ID: <YjMTYpf7zAUrFeUM@phenom.ffwll.local>
References: <20220313192952.12058-1-tzimmermann@suse.de>
 <20220313192952.12058-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220313192952.12058-3-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, geert@linux-m68k.org, sam@ravnborg.org,
 m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 13, 2022 at 08:29:52PM +0100, Thomas Zimmermann wrote:
> Commit 0d03011894d2 ("fbdev: Improve performance of cfb_imageblit()")
> broke cfb_imageblit() for image widths that are not aligned to 8-bit
> boundaries. Fix this by handling the trailing pixels on each line
> separately. The performance improvements in the original commit do not
> regress by this change.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 0d03011894d2 ("fbdev: Improve performance of cfb_imageblit()")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

On both patches:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/video/fbdev/core/cfbimgblt.c | 28 ++++++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/cfbimgblt.c b/drivers/video/fbdev/core/cfbimgblt.c
> index 7361cfabdd85..9ebda4e0dc7a 100644
> --- a/drivers/video/fbdev/core/cfbimgblt.c
> +++ b/drivers/video/fbdev/core/cfbimgblt.c
> @@ -218,7 +218,7 @@ static inline void fast_imageblit(const struct fb_image *image, struct fb_info *
>  {
>  	u32 fgx = fgcolor, bgx = bgcolor, bpp = p->var.bits_per_pixel;
>  	u32 ppw = 32/bpp, spitch = (image->width + 7)/8;
> -	u32 bit_mask, eorx;
> +	u32 bit_mask, eorx, shift;
>  	const char *s = image->data, *src;
>  	u32 __iomem *dst;
>  	const u32 *tab = NULL;
> @@ -259,17 +259,23 @@ static inline void fast_imageblit(const struct fb_image *image, struct fb_info *
>  
>  	for (i = image->height; i--; ) {
>  		dst = (u32 __iomem *)dst1;
> +		shift = 8;
>  		src = s;
>  
> +		/*
> +		 * Manually unroll the per-line copying loop for better
> +		 * performance. This works until we processed the last
> +		 * completely filled source byte (inclusive).
> +		 */
>  		switch (ppw) {
>  		case 4: /* 8 bpp */
> -			for (j = k; j; j -= 2, ++src) {
> +			for (j = k; j >= 2; j -= 2, ++src) {
>  				FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
>  				FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
>  			}
>  			break;
>  		case 2: /* 16 bpp */
> -			for (j = k; j; j -= 4, ++src) {
> +			for (j = k; j >= 4; j -= 4, ++src) {
>  				FB_WRITEL(colortab[(*src >> 6) & bit_mask], dst++);
>  				FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
>  				FB_WRITEL(colortab[(*src >> 2) & bit_mask], dst++);
> @@ -277,7 +283,7 @@ static inline void fast_imageblit(const struct fb_image *image, struct fb_info *
>  			}
>  			break;
>  		case 1: /* 32 bpp */
> -			for (j = k; j; j -= 8, ++src) {
> +			for (j = k; j >= 8; j -= 8, ++src) {
>  				FB_WRITEL(colortab[(*src >> 7) & bit_mask], dst++);
>  				FB_WRITEL(colortab[(*src >> 6) & bit_mask], dst++);
>  				FB_WRITEL(colortab[(*src >> 5) & bit_mask], dst++);
> @@ -290,6 +296,20 @@ static inline void fast_imageblit(const struct fb_image *image, struct fb_info *
>  			break;
>  		}
>  
> +		/*
> +		 * For image widths that are not a multiple of 8, there
> +		 * are trailing pixels left on the current line. Print
> +		 * them as well.
> +		 */
> +		for (; j--; ) {
> +			shift -= ppw;
> +			FB_WRITEL(colortab[(*src >> shift) & bit_mask], dst++);
> +			if (!shift) {
> +				shift = 8;
> +				++src;
> +			}
> +		}
> +
>  		dst1 += p->fix.line_length;
>  		s += spitch;
>  	}
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
