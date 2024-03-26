Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D9188D159
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 23:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD9F10EE2E;
	Tue, 26 Mar 2024 22:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hS9m7+Y3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E6F10EE2E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 22:43:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4DB7497;
 Tue, 26 Mar 2024 23:42:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1711492950;
 bh=GuyTOe7sfsFDL6EEc8g8HvzuSNvtqY2y8Bzhmb6nCxI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hS9m7+Y387Lya0A9eZHtLKLH0rHZXo7KtngBEJ3GASXw3qRA8zl3/VjTi8FP7y2Ns
 1TWjH4pZK/ftMHkZ1I+e3m98Hu/8MZyA77PTrLTAJQUOwMseJL4Ym1IamjiL8No0Bd
 frXsA6Fzbhtq1gh718SEqCrz2hSTclbXdzWdab/M=
Date: Wed, 27 Mar 2024 00:42:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: llvm@lists.linux.dev, Helge Deller <deller@gmx.de>,
 Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] fbdev: shmobile: fix snprintf truncation
Message-ID: <20240326224252.GB14986@pendragon.ideasonboard.com>
References: <20240326223825.4084412-1-arnd@kernel.org>
 <20240326223825.4084412-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240326223825.4084412-2-arnd@kernel.org>
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

Hi Arnd,

Thank you for the patch.

On Tue, Mar 26, 2024 at 11:38:00PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The name of the overlay does not fit into the fixed-length field:
> 
> drivers/video/fbdev/sh_mobile_lcdcfb.c:1577:2: error: 'snprintf' will always be truncated; specified size is 16, but format string expands to at least 25
> 
> Make it short enough by changing the string.
> 
> Fixes: c5deac3c9b22 ("fbdev: sh_mobile_lcdc: Implement overlays support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/video/fbdev/sh_mobile_lcdcfb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
> index eb2297b37504..d35d2cf99998 100644
> --- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
> +++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
> @@ -1575,7 +1575,7 @@ sh_mobile_lcdc_overlay_fb_init(struct sh_mobile_lcdc_overlay *ovl)
>  	 */
>  	info->fix = sh_mobile_lcdc_overlay_fix;
>  	snprintf(info->fix.id, sizeof(info->fix.id),
> -		 "SH Mobile LCDC Overlay %u", ovl->index);
> +		 "SHMobile ovl %u", ovl->index);
>  	info->fix.smem_start = ovl->dma_handle;
>  	info->fix.smem_len = ovl->fb_size;
>  	info->fix.line_length = ovl->pitch;

-- 
Regards,

Laurent Pinchart
