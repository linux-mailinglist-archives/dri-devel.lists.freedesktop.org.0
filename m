Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 415E04D7DB3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 09:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6446510E2FB;
	Mon, 14 Mar 2022 08:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D826B10E2FB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 08:41:42 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220314084141euoutp0131ec5ea928c5194e6f9fe992e01d8c74~cMrFiijSn1001910019euoutp01N
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 08:41:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220314084141euoutp0131ec5ea928c5194e6f9fe992e01d8c74~cMrFiijSn1001910019euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1647247301;
 bh=QzWsiaCXF/XnwpKhvZQAPNdButwclLs37p5octIymVk=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=ue6N/yjuoD8xEnnuR00Hy8nFuXTwj3tdiMmNSs5zpwyTiLMNy/moTrHfrto4Al+B9
 hzWfRr6zAM3gu+1Y+HtN5MccyMUcjuy+9fFZe1svREi+vLZq2jbwCv8kEiGVRJtEoP
 /YpRsOjE9wc0vRIcG+5FjyXjfo0H15bzmsWn9q4Y=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220314084141eucas1p1f355bc57886d2a0f7a9a624a04f9b890~cMrFbN6BZ2099020990eucas1p1L;
 Mon, 14 Mar 2022 08:41:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id AE.68.10260.4CFFE226; Mon, 14
 Mar 2022 08:41:40 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220314084140eucas1p24eba008ab47155c66d365432fbab80c4~cMrFJqgcN1053010530eucas1p2E;
 Mon, 14 Mar 2022 08:41:40 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220314084140eusmtrp2623ea207aca3605efa5a410815d1945c~cMrFIfoqH1247712477eusmtrp2g;
 Mon, 14 Mar 2022 08:41:40 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-74-622effc496f3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 99.85.09404.4CFFE226; Mon, 14
 Mar 2022 08:41:40 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220314084140eusmtip1cfaa29432b31795e740e253fe31bd17f~cMrEqCnqB0569505695eusmtip1C;
 Mon, 14 Mar 2022 08:41:40 +0000 (GMT)
Message-ID: <08bdcc50-5c82-9058-a5b3-85bbef631b9e@samsung.com>
Date: Mon, 14 Mar 2022 09:41:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Subject: Re: [PATCH 2/2] fbdev: Fix cfb_imageblit() for arbitrary image widths
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch, deller@gmx.de,
 geert@linux-m68k.org, javierm@redhat.com, sam@ravnborg.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220313192952.12058-3-tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUiTURTHu3v28ria3JbhaUbGQM2iVWrx9GYWg4YfoqAvRaSzPW2mztg0
 e58ZM50l08RqSpYl01W+Za6C9bLMma9lGmFWZEtKXGW6wqiZ22Pll8v/nP+555zf5ZKEsI4j
 IhPVabRGLU8Wc/nsxubxzqVNE5KE5bkda6mJxgKCevvtFaJ63F+41GCfjUVdLjYjqiX/K4eq
 HL+FqIbhAk4MKbN9v8SWfR3ZLbM/ykGyt3kOluxqcS9X9uXe5HGz7YhstH7BVnInf52CTk48
 QGuWRcfzVfYKD7G/J+ig21rMzUS/AwzIjwQcBc7iYcKA+KQQVyIoKdAjJhhD0J7dxmOCUQSW
 Z2fR3yvvPTemDDMClyuTxQQjCC7axyYdkhTgaDAZ13svsHEImHrLuV4twLPhyQUn26vn4gSw
 FZ7gePUcvBWu3W/2aQIHQp+zzNczAOciaLI+mTJiwJNzxdeIi1eAwWXwaT+8GtwXHrKYmmCw
 ukp9QIAnSHiVq+cxa0vB7ejnMHoODDkapvLzYeIOMw3wSQTvOhk2wKcRPM86PwW9Fvo7f3K9
 aAQOh5q7y5j0Rhguve4jBuwPL12zmSX8obDxHMGkBZCTLWSqQ8HkqP439uHTbsKIxKZp72Ka
 xm+ahmP6P/cSYltQIJ2uTVHS2kg1nSHRylO06WqlZE9qSj2a/FVtHof7NqocGpHYEYtEdgQk
 IQ4QrKmQJAgFCvmhw7QmNU6Tnkxr7SiIZIsDBXsSa+VCrJSn0Uk0vZ/W/HVZpJ8ok5Wvu6xT
 GS0HVdXBA9nnhkL2OgvF6nLhoE71eKFxgaW5cv7dYOv7QOmMjh2GXPvTNW+qqxT3JC1bBto9
 NQ1d8KA/qqj7daS5rpXo2IdSqwh2meDXymPzut5l6YtCS5cPlov0u0Z1rasiQrfFOD1Bn1oj
 A2Z9jG5fpFh6UZfcZY57nrQkTFMa4V+0K99POqss70OaOsHaJZ0rDHs5Y6GiqEZ/nHes9sTY
 xm9ZNwdFqs7QqFjRZkvm9l5U65EOlPVhVnp43tH7sTaP8QU/XmTLWPWL5xibueG1+8gGJXW+
 KVY588foJlRPQMmpkNaR8dQwXprrs3mxrudM7YtPGW5azNaq5CsWExqt/A+EZ7QcxAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xu7pH/uslGazo0LD4v20is8X9T7cZ
 La58fc9m8ezWXiaLhdOWM1qc6PvAarHi51ZGiy1vJrI6cHjs/baAxePDxziPQ4c7GD3udx9n
 8lgy7Sqbx/t9QGLz6WqPz5vkAjii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62M
 TJX07WxSUnMyy1KL9O0S9DIOLf3HXHBFuuLr9mlsDYx/RboYOTkkBEwkHv9by97FyMUhJLCU
 UeLG8Z2MEAkZiZPTGlghbGGJP9e62CCK3jNK3H80g7mLkYODV8BOYtYEW5AaFgFViVlXF7GB
 2LwCghInZz5hAbFFBZIker+9ZgEpFxbwk/g+uwAkzCwgLnHryXwmkJEiAp2MEt2bL7FBJBwk
 /nUshtq1m1Hi6vR5zCAJNgFDia63XWBFnAKWEl9nHmSCaDCT6NraxQhhy0tsfzuHeQKj0Cwk
 d8xCsnAWkpZZSFoWMLKsYhRJLS3OTc8tNtIrTswtLs1L10vOz93ECIzMbcd+btnBuPLVR71D
 jEwcjIcYJTiYlUR4rZbqJQnxpiRWVqUW5ccXleakFh9iNAUGxkRmKdHkfGBqyCuJNzQzMDU0
 MbM0MLU0M1YS5/Us6EgUEkhPLEnNTk0tSC2C6WPi4JRqYNr433St7qbMv6zhl+O4+q8m6/2L
 YV2gtIeBscu4kLdK/eXWqAVlrcbmoRzH1Jz+rfS/ssbvbLUhT9mCVZp8didqz3c8O7Lqw4+I
 vy1CXcoeXwMEwhrUi27y5bHkfP+m+Tv+zMTFadPeh2/ve3TUZXL6t3XPe6JvPGlvjmbZfvTb
 NLU9K+etVPzhFfSh7OVeDuNA9r+VD++qaIb98v+r9Paj8vwXdw4on5OJlptr+i+hYbW7qsgz
 aWWR18LXkuQfp9R28OfZ5nvM0f19e+NbTn/1pz4zgw51cvlPmv7Y5+3HefyXW19e+FNbuTPT
 jWX33XN39sv263w7+/PhZHH7QDWRiDmeLHsZym/cC94zrV2JpTgj0VCLuag4EQAHaklwVQMA
 AA==
X-CMS-MailID: 20220314084140eucas1p24eba008ab47155c66d365432fbab80c4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220313193000eucas1p1ca39fa83b854d7c4ed5507325983eaa3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220313193000eucas1p1ca39fa83b854d7c4ed5507325983eaa3
References: <20220313192952.12058-1-tzimmermann@suse.de>
 <CGME20220313193000eucas1p1ca39fa83b854d7c4ed5507325983eaa3@eucas1p1.samsung.com>
 <20220313192952.12058-3-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13.03.2022 20:29, Thomas Zimmermann wrote:
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
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/video/fbdev/core/cfbimgblt.c | 28 ++++++++++++++++++++++++----
>   1 file changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/cfbimgblt.c b/drivers/video/fbdev/core/cfbimgblt.c
> index 7361cfabdd85..9ebda4e0dc7a 100644
> --- a/drivers/video/fbdev/core/cfbimgblt.c
> +++ b/drivers/video/fbdev/core/cfbimgblt.c
> @@ -218,7 +218,7 @@ static inline void fast_imageblit(const struct fb_image *image, struct fb_info *
>   {
>   	u32 fgx = fgcolor, bgx = bgcolor, bpp = p->var.bits_per_pixel;
>   	u32 ppw = 32/bpp, spitch = (image->width + 7)/8;
> -	u32 bit_mask, eorx;
> +	u32 bit_mask, eorx, shift;
>   	const char *s = image->data, *src;
>   	u32 __iomem *dst;
>   	const u32 *tab = NULL;
> @@ -259,17 +259,23 @@ static inline void fast_imageblit(const struct fb_image *image, struct fb_info *
>   
>   	for (i = image->height; i--; ) {
>   		dst = (u32 __iomem *)dst1;
> +		shift = 8;
>   		src = s;
>   
> +		/*
> +		 * Manually unroll the per-line copying loop for better
> +		 * performance. This works until we processed the last
> +		 * completely filled source byte (inclusive).
> +		 */
>   		switch (ppw) {
>   		case 4: /* 8 bpp */
> -			for (j = k; j; j -= 2, ++src) {
> +			for (j = k; j >= 2; j -= 2, ++src) {
>   				FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
>   				FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
>   			}
>   			break;
>   		case 2: /* 16 bpp */
> -			for (j = k; j; j -= 4, ++src) {
> +			for (j = k; j >= 4; j -= 4, ++src) {
>   				FB_WRITEL(colortab[(*src >> 6) & bit_mask], dst++);
>   				FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
>   				FB_WRITEL(colortab[(*src >> 2) & bit_mask], dst++);
> @@ -277,7 +283,7 @@ static inline void fast_imageblit(const struct fb_image *image, struct fb_info *
>   			}
>   			break;
>   		case 1: /* 32 bpp */
> -			for (j = k; j; j -= 8, ++src) {
> +			for (j = k; j >= 8; j -= 8, ++src) {
>   				FB_WRITEL(colortab[(*src >> 7) & bit_mask], dst++);
>   				FB_WRITEL(colortab[(*src >> 6) & bit_mask], dst++);
>   				FB_WRITEL(colortab[(*src >> 5) & bit_mask], dst++);
> @@ -290,6 +296,20 @@ static inline void fast_imageblit(const struct fb_image *image, struct fb_info *
>   			break;
>   		}
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
>   		dst1 += p->fix.line_length;
>   		s += spitch;
>   	}

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

