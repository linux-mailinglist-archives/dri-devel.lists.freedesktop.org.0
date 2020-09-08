Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99052610C3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 13:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26EF6E1B7;
	Tue,  8 Sep 2020 11:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53226E1B7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:36:47 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200908113644euoutp013e7f59801be2a98dff9115a6a59a8291~yy_WCKPxj0570405704euoutp01H
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:36:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200908113644euoutp013e7f59801be2a98dff9115a6a59a8291~yy_WCKPxj0570405704euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599565004;
 bh=m5SiHGtB7aCZeEWY7mux4FUg5x879IROw2zkg7TBLFc=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=CzyQpw5K7szWGHITINdvKlIa5UqDlYA1UkJcYk5XZ3M6lvp7gzsyV3DA2PtPuVaG+
 fqbvwA+53JYkmMyknvJXXV4yktv8+oxkyuw73TtS+RKoLMZIiHDXlTOo95G0AR9vZr
 rF537hVoOZ/yq2I4oXbFRleIlWRLnzkTKINPEc6Q=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200908113644eucas1p103a7469440b3e66640ad0b64a26ff0aa~yy_V6qfQK0545005450eucas1p1z;
 Tue,  8 Sep 2020 11:36:44 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id C2.3E.06456.BCC675F5; Tue,  8
 Sep 2020 12:36:44 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200908113643eucas1p17854ce62206401d0fdf33653380a4b46~yy_VfbuY61373613736eucas1p1Q;
 Tue,  8 Sep 2020 11:36:43 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200908113643eusmtrp13517167108b3686fb356fa7757cb01ac~yy_Ve19p62002320023eusmtrp1Y;
 Tue,  8 Sep 2020 11:36:43 +0000 (GMT)
X-AuditID: cbfec7f2-c30869c000001938-5a-5f576ccb4b05
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 09.94.06017.BCC675F5; Tue,  8
 Sep 2020 12:36:43 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200908113643eusmtip1a0e4ba746f1b94b17a4c1ddcf20074f6~yy_VIg-mD0442104421eusmtip1i;
 Tue,  8 Sep 2020 11:36:43 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: fbdev: fix setting of pixclock because a
 pass-by-value error
To: Colin King <colin.king@canonical.com>
Message-ID: <ed082436-9ce3-23fd-679c-9cdf7b1da0cd@samsung.com>
Date: Tue, 8 Sep 2020 13:36:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200723170227.996229-1-colin.king@canonical.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7djP87pncsLjDV70Mlr8Xt3LZrHw4V1m
 iytf37NZ7LnzmtFi6y1pixN9H1gtLu+aw+bA7jGroZfNY++3BSwei/e8ZPK4332cyePzJrkA
 1igum5TUnMyy1CJ9uwSujC0XO5gKTopVNEw4ztjAeFSwi5GTQ0LARKJ3TQt7FyMXh5DACkaJ
 n1OusEE4Xxglvr2dzwzhfGaU6D67hQWmZV3vBqiq5YwSa/vOMkI4bxklerZcAqtiE7CSmNi+
 ihHEFhaIklh85j3QEg4OEQFNifPnikDqmQUuMUpsnbsHrIZXwE7iyrJfbCA2i4CKxK+Tn5lA
 bFGBCIlPDw6zQtQISpyc+QRsPqeAvcTlw2/BbGYBcYlbT+YzQdjyEtvfzgE7W0JgG7vElnMf
 oM52kTj85AI7hC0s8er4FihbRuL05B4WiIZ1jBJ/O15AdW9nlFg++R8bRJW1xJ1zIOdxAK3Q
 lFi/Sx8i7Cixq/kLM0hYQoBP4sZbQYgj+CQmbZsOFeaV6GgTgqhWk9iwbAMbzNqunSuZJzAq
 zULy2iwk78xC8s4shL0LGFlWMYqnlhbnpqcWG+allusVJ+YWl+al6yXn525iBCah0/+Of9rB
 +PVS0iFGAQ5GJR7eD15h8UKsiWXFlbmHGCU4mJVEeJ3Ono4T4k1JrKxKLcqPLyrNSS0+xCjN
 waIkzmu86GWskEB6YklqdmpqQWoRTJaJg1OqgZEzsutJzd+tjyZMqArffPbD0rbj5x0OC6bt
 5qhb1Sttn55R8++Qy2xzfReOTx4u1eteb4z2LtN8MMVWeply2Le9gT+XHuf9lTt/kqZT3P03
 GULWOis1xKNfW++zdDoXcsOUvyEnNto42/zQD/5Lu1aFrGNfxp8RxFEvfcC04KD4lzvi8jFz
 fiqxFGckGmoxFxUnAgCnkfvPPgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRmVeSWpSXmKPExsVy+t/xu7qnc8LjDQ4vUrX4vbqXzWLhw7vM
 Fle+vmez2HPnNaPF1lvSFif6PrBaXN41h82B3WNWQy+bx95vC1g8Fu95yeRxv/s4k8fnTXIB
 rFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GVsu
 djAVnBSraJhwnLGB8ahgFyMnh4SAicS63g1sXYxcHEICSxkllnd/Yuxi5ABKyEgcX18GUSMs
 8edaF1TNa0aJxUdnsYIk2ASsJCa2r2IEsYUFoiQWn3nPDtIrIqApcf5cEUg9s8AlRokLR26w
 QzRPAmpe9gWsmVfATuLKsl9sIDaLgIrEr5OfmUBsUYEIicM7ZjFC1AhKnJz5hAXE5hSwl7h8
 +C2YzSygLvFn3iVmCFtc4taT+UwQtrzE9rdzmCcwCs1C0j4LScssJC2zkLQsYGRZxSiSWlqc
 m55bbKRXnJhbXJqXrpecn7uJERhz24793LKDsetd8CFGAQ5GJR7eD15h8UKsiWXFlbmHGCU4
 mJVEeJ3Ono4T4k1JrKxKLcqPLyrNSS0+xGgK9NxEZinR5HxgOsgriTc0NTS3sDQ0NzY3NrNQ
 EuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cDo+at/9qLNq3j/LRO5nFlSXGZ2qrx4kx/PqYe3
 ny3jODC3bpF81+lJlp2rgmULtPonb9/88NuDNTO8OvfvbuIMnhj/sabt5sWi4G6hlX4zPnTW
 u/vaXcj77cxcKmHRM48hUH310zNVPXb9W7fMDJ+7V43Z5+5FR80TMs0LF2tGBrtKcDhIPRJV
 YinOSDTUYi4qTgQAKPrPVM8CAAA=
X-CMS-MailID: 20200908113643eucas1p17854ce62206401d0fdf33653380a4b46
X-Msg-Generator: CA
X-RootMTR: 20200723170235eucas1p21b1e0f5ff092d550d65057ae2a31a897
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200723170235eucas1p21b1e0f5ff092d550d65057ae2a31a897
References: <CGME20200723170235eucas1p21b1e0f5ff092d550d65057ae2a31a897@eucas1p2.samsung.com>
 <20200723170227.996229-1-colin.king@canonical.com>
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
Cc: linux-fbdev@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/23/20 7:02 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pixclock is being set locally because it is being passed as a
> pass-by-value argument rather than pass-by-reference, so the computed
> pixclock is never being set in var->pixclock. Fix this by passing
> by reference.
> 
> [This dates back to 2002, I found the offending commit from the git
> history git://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git ]
> 
> Addresses-Coverity: ("Unused value")
> Fixes: 115f4504a64a ("Removed currcon and other console related code. Very little is now left.")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to drm-misc-next tree, thanks and sorry for the delay.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/vga16fb.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
> index a20eeb8308ff..52f273af6cae 100644
> --- a/drivers/video/fbdev/vga16fb.c
> +++ b/drivers/video/fbdev/vga16fb.c
> @@ -243,7 +243,7 @@ static void vga16fb_update_fix(struct fb_info *info)
>  }
>  
>  static void vga16fb_clock_chip(struct vga16fb_par *par,
> -			       unsigned int pixclock,
> +			       unsigned int *pixclock,
>  			       const struct fb_info *info,
>  			       int mul, int div)
>  {
> @@ -259,14 +259,14 @@ static void vga16fb_clock_chip(struct vga16fb_par *par,
>  		{     0 /* bad */,    0x00, 0x00}};
>  	int err;
>  
> -	pixclock = (pixclock * mul) / div;
> +	*pixclock = (*pixclock * mul) / div;
>  	best = vgaclocks;
> -	err = pixclock - best->pixclock;
> +	err = *pixclock - best->pixclock;
>  	if (err < 0) err = -err;
>  	for (ptr = vgaclocks + 1; ptr->pixclock; ptr++) {
>  		int tmp;
>  
> -		tmp = pixclock - ptr->pixclock;
> +		tmp = *pixclock - ptr->pixclock;
>  		if (tmp < 0) tmp = -tmp;
>  		if (tmp < err) {
>  			err = tmp;
> @@ -275,7 +275,7 @@ static void vga16fb_clock_chip(struct vga16fb_par *par,
>  	}
>  	par->misc |= best->misc;
>  	par->clkdiv = best->seq_clock_mode;
> -	pixclock = (best->pixclock * div) / mul;		
> +	*pixclock = (best->pixclock * div) / mul;
>  }
>  			       
>  #define FAIL(X) return -EINVAL
> @@ -497,10 +497,10 @@ static int vga16fb_check_var(struct fb_var_screeninfo *var,
>  
>  	if (mode & MODE_8BPP)
>  		/* pixel clock == vga clock / 2 */
> -		vga16fb_clock_chip(par, var->pixclock, info, 1, 2);
> +		vga16fb_clock_chip(par, &var->pixclock, info, 1, 2);
>  	else
>  		/* pixel clock == vga clock */
> -		vga16fb_clock_chip(par, var->pixclock, info, 1, 1);
> +		vga16fb_clock_chip(par, &var->pixclock, info, 1, 1);
>  	
>  	var->red.offset = var->green.offset = var->blue.offset = 
>  	var->transp.offset = 0;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
