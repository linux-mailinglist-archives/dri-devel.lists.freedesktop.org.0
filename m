Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF913708E1
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 22:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A9F6E1C0;
	Sat,  1 May 2021 20:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2876E1C0
 for <dri-devel@lists.freedesktop.org>; Sat,  1 May 2021 20:12:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A510DA46;
 Sat,  1 May 2021 22:12:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1619899972;
 bh=afs17JqfG99KjURG9n8/XjP5JPlXG/Ts/WyS/teFV0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EM5GBZ00F6z0TlemqMVkixs6Ey6eMrJxUMaoWqr7N9Lva1v0mLzUsKEUmwFgrSqAq
 kB4OLtlztg4p4G5M50lXcHvAm/LmZ6LAYGW2kod3B/cqxqwqdf2tOdPGgIKantA+Nd
 K3MbiKtJKofg7zaHj3auKdxFQVBcO3F5LkpBpnwA=
Date: Sat, 1 May 2021 23:12:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv1] drm/omap: get fbdev working for manually updated display
Message-ID: <YI22QjS3M15Pu10i@pendragon.ideasonboard.com>
References: <20210501200050.410704-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210501200050.410704-1-sebastian.reichel@collabora.com>
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
Cc: Carl Philipp Klemm <philipp@uvos.xyz>, kernel@collabora.com,
 Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Merlijn Wajer <merlijn@wizzup.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 01, 2021 at 10:00:50PM +0200, Sebastian Reichel wrote:
> Running a legacy application, which directly uses /dev/fb0
> currently results in display not being refreshed when the
> application mmaps the memory instead of calling write().
> 
> Deferred IO support will also schedule dirty_work with the
> damage collected from the mmap page writes and thus gets
> some more legacy applications working.
> 
> Delay frequency settings have been taken over from
> drm_fb_helper_generic_probe().
> 
> Reported-by: Carl Philipp Klemm <philipp@uvos.xyz>
> Tested-by: Carl Philipp Klemm <philipp@uvos.xyz>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> Hi,
> 
> I still need to fix my Droid 4, so I only compile tested this
> myself.
> 
> -- Sebastian
> ---
>  drivers/gpu/drm/omapdrm/omap_fbdev.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> index 42eac6ad12bd..fc3897d2d7cc 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -87,6 +87,11 @@ static const struct fb_ops omap_fb_ops = {
>  	.fb_imageblit = drm_fb_helper_sys_imageblit,
>  };
>  
> +static struct fb_deferred_io omap_fb_defio = {
> +	.delay		= HZ / 20,
> +	.deferred_io	= drm_fb_helper_deferred_io,
> +};

Wish this could be const :-S

> +
>  static int omap_fbdev_create(struct drm_fb_helper *helper,
>  		struct drm_fb_helper_surface_size *sizes)
>  {
> @@ -176,6 +181,9 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
>  
>  	drm_fb_helper_fill_info(fbi, helper, sizes);
>  
> +	fbi->fbdefio = &omap_fb_defio;
> +	fb_deferred_io_init(fbi);
> +

This looks good to me. Trusting the Tested-by,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	dev->mode_config.fb_base = dma_addr;
>  
>  	fbi->screen_buffer = omap_gem_vaddr(fbdev->bo);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
