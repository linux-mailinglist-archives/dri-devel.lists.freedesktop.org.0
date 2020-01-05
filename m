Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7351306D8
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jan 2020 09:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F08789D83;
	Sun,  5 Jan 2020 08:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9652B89D83
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jan 2020 08:46:34 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 8028080440;
 Sun,  5 Jan 2020 09:46:29 +0100 (CET)
Date: Sun, 5 Jan 2020 09:46:27 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 2/3] drm/mipi_dbi: Add support for display offsets
Message-ID: <20200105084627.GA29102@ravnborg.org>
References: <20200102141246.370-1-geert+renesas@glider.be>
 <20200102141246.370-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200102141246.370-3-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=ZoU0odOk0bs6Eg6Q7zMA:9 a=a0DBwEYVBf8EGunF:21
 a=msDo9IaW2_0JOe--:21 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=pHzHmUro8NiASowvMSCR:22
 a=6VlIyEUom7LUIeUMNQJH:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Lechner <david@lechnology.com>, David Airlie <airlied@linux.ie>,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Chris Brandt <chris.brandt@renesas.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert.

On Thu, Jan 02, 2020 at 03:12:45PM +0100, Geert Uytterhoeven wrote:
> If the resolution of the TFT display is smaller than the maximum
> resolution supported by the display controller, the display may be
> connected to the driver output arrays with a horizontal and/or vertical
> offset, leading to a shifted image.
> 
> Add support for specifying these offsets.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Looks good - the helper made the code more readable.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_mipi_dbi.c | 30 ++++++++++++++++++++----------
>  include/drm/drm_mipi_dbi.h     | 12 ++++++++++++
>  2 files changed, 32 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index 16bff1be4b8ac622..27fe81a53c88e338 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -238,6 +238,23 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
>  }
>  EXPORT_SYMBOL(mipi_dbi_buf_copy);
>  
> +static void mipi_dbi_set_window_address(struct mipi_dbi_dev *dbidev,
> +					unsigned int xs, unsigned int xe,
> +					unsigned int ys, unsigned int ye)
> +{
> +	struct mipi_dbi *dbi = &dbidev->dbi;
> +
> +	xs += dbidev->left_offset;
> +	xe += dbidev->left_offset;
> +	ys += dbidev->top_offset;
> +	ye += dbidev->top_offset;
> +
> +	mipi_dbi_command(dbi, MIPI_DCS_SET_COLUMN_ADDRESS, (xs >> 8) & 0xff,
> +			 xs & 0xff, (xe >> 8) & 0xff, xe & 0xff);
> +	mipi_dbi_command(dbi, MIPI_DCS_SET_PAGE_ADDRESS, (ys >> 8) & 0xff,
> +			 ys & 0xff, (ye >> 8) & 0xff, ye & 0xff);
> +}
> +
>  static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
>  {
>  	struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
> @@ -271,12 +288,8 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
>  		tr = cma_obj->vaddr;
>  	}
>  
> -	mipi_dbi_command(dbi, MIPI_DCS_SET_COLUMN_ADDRESS,
> -			 (rect->x1 >> 8) & 0xff, rect->x1 & 0xff,
> -			 ((rect->x2 - 1) >> 8) & 0xff, (rect->x2 - 1) & 0xff);
> -	mipi_dbi_command(dbi, MIPI_DCS_SET_PAGE_ADDRESS,
> -			 (rect->y1 >> 8) & 0xff, rect->y1 & 0xff,
> -			 ((rect->y2 - 1) >> 8) & 0xff, (rect->y2 - 1) & 0xff);
> +	mipi_dbi_set_window_address(dbidev, rect->x1, rect->x2 - 1, rect->y1,
> +				    rect->y2 - 1);
>  
>  	ret = mipi_dbi_command_buf(dbi, MIPI_DCS_WRITE_MEMORY_START, tr,
>  				   width * height * 2);
> @@ -366,10 +379,7 @@ static void mipi_dbi_blank(struct mipi_dbi_dev *dbidev)
>  
>  	memset(dbidev->tx_buf, 0, len);
>  
> -	mipi_dbi_command(dbi, MIPI_DCS_SET_COLUMN_ADDRESS, 0, 0,
> -			 ((width - 1) >> 8) & 0xFF, (width - 1) & 0xFF);
> -	mipi_dbi_command(dbi, MIPI_DCS_SET_PAGE_ADDRESS, 0, 0,
> -			 ((height - 1) >> 8) & 0xFF, (height - 1) & 0xFF);
> +	mipi_dbi_set_window_address(dbidev, 0, width - 1, 0, height - 1);
>  	mipi_dbi_command_buf(dbi, MIPI_DCS_WRITE_MEMORY_START,
>  			     (u8 *)dbidev->tx_buf, len);
>  
> diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
> index 67c66f5ee591e80f..33f325f5af2b921f 100644
> --- a/include/drm/drm_mipi_dbi.h
> +++ b/include/drm/drm_mipi_dbi.h
> @@ -109,6 +109,18 @@ struct mipi_dbi_dev {
>  	 */
>  	unsigned int rotation;
>  
> +	/**
> +	 * @left_offset: Horizontal offset of the display relative to the
> +	 *               controller's driver array
> +	 */
> +	unsigned int left_offset;
> +
> +	/**
> +	 * @top_offset: Vertical offset of the display relative to the
> +	 *              controller's driver array
> +	 */
> +	unsigned int top_offset;
> +
>  	/**
>  	 * @backlight: backlight device (optional)
>  	 */
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
