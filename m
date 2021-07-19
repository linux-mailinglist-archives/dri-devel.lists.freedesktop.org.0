Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7253CEB3D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 21:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35946E1A7;
	Mon, 19 Jul 2021 19:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4136A6E1A7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 19:07:36 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 9a7e0ecd-e8c4-11eb-8d1a-0050568cd888;
 Mon, 19 Jul 2021 19:07:46 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id D2F19194B04;
 Mon, 19 Jul 2021 21:07:49 +0200 (CEST)
Date: Mon, 19 Jul 2021 21:07:32 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH resend 3/5] video: fbdev: ssd1307fb: Extract
 ssd1307fb_set_address_range()
Message-ID: <YPXNdJNpYoPSpxSb@ravnborg.org>
References: <20210714145804.2530727-1-geert@linux-m68k.org>
 <20210714145804.2530727-4-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714145804.2530727-4-geert@linux-m68k.org>
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

On Wed, Jul 14, 2021 at 04:58:02PM +0200, Geert Uytterhoeven wrote:
> Extract the code to set the column and page ranges into a helper
> function.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/video/fbdev/ssd1307fb.c | 61 +++++++++++++++++++--------------
>  1 file changed, 36 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
> index 6d7bd025bca1a175..cfa27ea0feab4f01 100644
> --- a/drivers/video/fbdev/ssd1307fb.c
> +++ b/drivers/video/fbdev/ssd1307fb.c
> @@ -152,6 +152,38 @@ static inline int ssd1307fb_write_cmd(struct i2c_client *client, u8 cmd)
>  	return ret;
>  }
>  
> +static int ssd1307fb_set_address_range(struct ssd1307fb_par *par, u8 col_start,
> +				       u8 cols, u8 page_start, u8 pages)
> +{
Bikeshedding, but I think a dedicated function for col_range and another
for page_range had been simpler to read.

With or wihout this change:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

> +	u8 col_end = col_start + cols - 1;
> +	u8 page_end = page_start + pages - 1;
> +	int ret;
> +
> +	/* Set column range */
> +	ret = ssd1307fb_write_cmd(par->client, SSD1307FB_SET_COL_RANGE);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ssd1307fb_write_cmd(par->client, col_start);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ssd1307fb_write_cmd(par->client, col_end);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set page range */
> +	ret = ssd1307fb_write_cmd(par->client, SSD1307FB_SET_PAGE_RANGE);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ssd1307fb_write_cmd(par->client, page_start);
> +	if (ret < 0)
> +		return ret;
> +
> +	return ssd1307fb_write_cmd(par->client, page_end);
> +}
> +
>  static int ssd1307fb_update_display(struct ssd1307fb_par *par)
>  {
>  	struct ssd1307fb_array *array;
> @@ -461,31 +493,10 @@ static int ssd1307fb_init(struct ssd1307fb_par *par)
>  	if (ret < 0)
>  		return ret;
>  
> -	/* Set column range */
> -	ret = ssd1307fb_write_cmd(par->client, SSD1307FB_SET_COL_RANGE);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = ssd1307fb_write_cmd(par->client, par->col_offset);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = ssd1307fb_write_cmd(par->client, par->col_offset + par->width - 1);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* Set page range */
> -	ret = ssd1307fb_write_cmd(par->client, SSD1307FB_SET_PAGE_RANGE);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = ssd1307fb_write_cmd(par->client, par->page_offset);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = ssd1307fb_write_cmd(par->client,
> -				  par->page_offset +
> -				  DIV_ROUND_UP(par->height, 8) - 1);
> +	/* Set column and page range */
> +	ret = ssd1307fb_set_address_range(par, par->col_offset, par->width,
> +					  par->page_offset,
> +					  DIV_ROUND_UP(par->height, 8));
>  	if (ret < 0)
>  		return ret;
>  
> -- 
> 2.25.1
