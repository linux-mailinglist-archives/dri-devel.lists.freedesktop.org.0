Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D071CC4AA
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 23:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795FC6E3AE;
	Sat,  9 May 2020 21:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8118D6E3AE
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 21:11:08 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8CE632003E;
 Sat,  9 May 2020 23:11:06 +0200 (CEST)
Date: Sat, 9 May 2020 23:11:04 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH] video: fbdev: pxa168fb: make pxa168fb_init_mode() return
 void
Message-ID: <20200509211104.GC12666@ravnborg.org>
References: <20200506061745.19451-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506061745.19451-1-yanaijie@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=e5mUnYsNAAAA:8
 a=LIjMPlzXlnp3mKN0Lz4A:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, b.zolnierkie@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason.

On Wed, May 06, 2020 at 02:17:45PM +0800, Jason Yan wrote:
> No other functions use the return value of pxa168fb_init_mode() and the
> return value is always 0 now. Make it return void. This fixes the
> following coccicheck warning:
> 
> drivers/video/fbdev/pxa168fb.c:565:5-8: Unneeded variable: "ret". Return
> "0" on line 597
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>  drivers/video/fbdev/pxa168fb.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/video/fbdev/pxa168fb.c b/drivers/video/fbdev/pxa168fb.c
> index aef8a3042590..eedfbd3572a8 100644
> --- a/drivers/video/fbdev/pxa168fb.c
> +++ b/drivers/video/fbdev/pxa168fb.c
> @@ -557,12 +557,11 @@ static const struct fb_ops pxa168fb_ops = {
>  	.fb_imageblit	= cfb_imageblit,
>  };
>  
> -static int pxa168fb_init_mode(struct fb_info *info,
> +static void pxa168fb_init_mode(struct fb_info *info,
>  			      struct pxa168fb_mach_info *mi)
I fixed indent while applying.
For patches in drivers/gpu/ please use --strict when you verify with
checkpatch so you catch similar issues yourself.

	Sam

>  {
>  	struct pxa168fb_info *fbi = info->par;
>  	struct fb_var_screeninfo *var = &info->var;
> -	int ret = 0;
>  	u32 total_w, total_h, refresh;
>  	u64 div_result;
>  	const struct fb_videomode *m;
> @@ -593,8 +592,6 @@ static int pxa168fb_init_mode(struct fb_info *info,
>  	div_result = 1000000000000ll;
>  	do_div(div_result, total_w * total_h * refresh);
>  	var->pixclock = (u32)div_result;
> -
> -	return ret;
>  }
>  
>  static int pxa168fb_probe(struct platform_device *pdev)
> -- 
> 2.21.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
