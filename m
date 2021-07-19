Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECE83CEB48
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 21:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3E889C59;
	Mon, 19 Jul 2021 19:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A46089C59
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 19:21:08 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 7722b1a7-e8c6-11eb-9082-0050568c148b;
 Mon, 19 Jul 2021 19:21:06 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id BA06E194B15;
 Mon, 19 Jul 2021 21:21:19 +0200 (CEST)
Date: Mon, 19 Jul 2021 21:21:02 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH resend 4/5] video: fbdev: ssd1307fb: Optimize screen
 updates
Message-ID: <YPXQnlpWUa1QaZKd@ravnborg.org>
References: <20210714145804.2530727-1-geert@linux-m68k.org>
 <20210714145804.2530727-5-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714145804.2530727-5-geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Wed, Jul 14, 2021 at 04:58:03PM +0200, Geert Uytterhoeven wrote:
> Currently, each screen update triggers an I2C transfer of all screen
> data, up to 1 KiB of data for a 128x64 display, which takes at least 20
> ms in Fast mode.
> 
> Reduce the amount of transferred data by only updating the rectangle
> that changed.  Remove the call to ssd1307fb_set_address_range() during
> initialization, as ssd1307fb_update_rect() now takes care of that.
> 
> Note that for now the optimized operation is only used for fillrect,
> copyarea, and imageblit, which are used by fbcon.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/video/fbdev/ssd1307fb.c | 43 ++++++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
> index cfa27ea0feab4f01..8e3d4be74723b9bf 100644
> --- a/drivers/video/fbdev/ssd1307fb.c
> +++ b/drivers/video/fbdev/ssd1307fb.c
> @@ -184,16 +184,18 @@ static int ssd1307fb_set_address_range(struct ssd1307fb_par *par, u8 col_start,
>  	return ssd1307fb_write_cmd(par->client, page_end);
>  }
>  
> -static int ssd1307fb_update_display(struct ssd1307fb_par *par)
> +static int ssd1307fb_update_rect(struct ssd1307fb_par *par, unsigned int x,
> +				 unsigned int y, unsigned int width,
> +				 unsigned int height)
>  {
>  	struct ssd1307fb_array *array;
>  	u8 *vmem = par->info->screen_buffer;
>  	unsigned int line_length = par->info->fix.line_length;
> -	unsigned int pages = DIV_ROUND_UP(par->height, 8);
> +	unsigned int pages = DIV_ROUND_UP(height + y % 8, 8);

Add () like this - at least it helps me:
> +	unsigned int pages = DIV_ROUND_UP((height + y) % 8, 8);


>  	u32 array_idx = 0;
>  	int ret, i, j, k;
>  
> -	array = ssd1307fb_alloc_array(par->width * pages, SSD1307FB_DATA);
> +	array = ssd1307fb_alloc_array(width * pages, SSD1307FB_DATA);
>  	if (!array)
>  		return -ENOMEM;
>  
> @@ -226,13 +228,18 @@ static int ssd1307fb_update_display(struct ssd1307fb_par *par)
>  	 *  (5) A4 B4 C4 D4 E4 F4 G4 H4
>  	 */
>  
> -	for (i = 0; i < pages; i++) {
> +	ret = ssd1307fb_set_address_range(par, par->col_offset + x, width,
> +					  par->page_offset + y / 8, pages);
> +	if (ret < 0)
> +		goto out_free;
> +
> +	for (i = y / 8; i < y / 8 + pages; i++) {
>  		int m = 8;
>  
>  		/* Last page may be partial */
> -		if (i + 1 == pages && par->height % 8)
> +		if (8 * (i + 1) > par->height)
>  			m = par->height % 8;
As before, this looks wrong to me.

	Sam

> -		for (j = 0; j < par->width; j++) {
> +		for (j = x; j < x + width; j++) {
>  			u8 data = 0;
>  
>  			for (k = 0; k < m; k++) {
> @@ -245,11 +252,17 @@ static int ssd1307fb_update_display(struct ssd1307fb_par *par)
>  		}
>  	}
>  
> -	ret = ssd1307fb_write_array(par->client, array, par->width * pages);
> +	ret = ssd1307fb_write_array(par->client, array, width * pages);
> +
> +out_free:
>  	kfree(array);
>  	return ret;
>  }
>  
> +static int ssd1307fb_update_display(struct ssd1307fb_par *par)
> +{
> +	return ssd1307fb_update_rect(par, 0, 0, par->width, par->height);
> +}
>  
>  static ssize_t ssd1307fb_write(struct fb_info *info, const char __user *buf,
>  		size_t count, loff_t *ppos)
> @@ -299,21 +312,24 @@ static void ssd1307fb_fillrect(struct fb_info *info, const struct fb_fillrect *r
>  {
>  	struct ssd1307fb_par *par = info->par;
>  	sys_fillrect(info, rect);
> -	ssd1307fb_update_display(par);
> +	ssd1307fb_update_rect(par, rect->dx, rect->dy, rect->width,
> +			      rect->height);
>  }
>  
>  static void ssd1307fb_copyarea(struct fb_info *info, const struct fb_copyarea *area)
>  {
>  	struct ssd1307fb_par *par = info->par;
>  	sys_copyarea(info, area);
> -	ssd1307fb_update_display(par);
> +	ssd1307fb_update_rect(par, area->dx, area->dy, area->width,
> +			      area->height);
>  }
>  
>  static void ssd1307fb_imageblit(struct fb_info *info, const struct fb_image *image)
>  {
>  	struct ssd1307fb_par *par = info->par;
>  	sys_imageblit(info, image);
> -	ssd1307fb_update_display(par);
> +	ssd1307fb_update_rect(par, image->dx, image->dy, image->width,
> +			      image->height);
>  }
>  
>  static const struct fb_ops ssd1307fb_ops = {
> @@ -493,13 +509,6 @@ static int ssd1307fb_init(struct ssd1307fb_par *par)
>  	if (ret < 0)
>  		return ret;
>  
> -	/* Set column and page range */
> -	ret = ssd1307fb_set_address_range(par, par->col_offset, par->width,
> -					  par->page_offset,
> -					  DIV_ROUND_UP(par->height, 8));
> -	if (ret < 0)
> -		return ret;
> -
>  	/* Clear the screen */
>  	ret = ssd1307fb_update_display(par);
>  	if (ret < 0)
> -- 
> 2.25.1
