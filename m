Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC1D4828AC
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jan 2022 23:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0DE10E1D1;
	Sat,  1 Jan 2022 22:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A0210E1D1
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jan 2022 22:02:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D2EFEE;
 Sat,  1 Jan 2022 23:02:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1641074570;
 bh=DXY+IfPxOjgFMcnlWMqtzH4AWyqCUY/AFI8EsQNPXno=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UhTtEPj3mM/xcMWDqH32oQxqTrfOowsYqIat2HVJH4owiRvtSaMOr+8eiHtcixnER
 PN1BfwUMVCR5hwYYwkTQgDhb4pCxMmwCMUDofoRFF0c6VTkBCPBVW2yXpYMAhT0qb8
 WpHO63u1pHlyQx4M+03oUStTrgAvSe9rnBCpNqJs=
Date: Sun, 2 Jan 2022 00:02:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm: mxsfb: Shutdown the display on system shutdown
Message-ID: <YdDPiGeCeI553rUx@pendragon.ideasonboard.com>
References: <20220101213755.506404-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220101213755.506404-1-marex@denx.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Thank you for the patch.

On Sat, Jan 01, 2022 at 10:37:55PM +0100, Marek Vasut wrote:
> When the system shuts down or warm reboots, the display may be active.
> Implement the platform_driver .shutdown() operation and shut down the
> display.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 6d7a3aeff50b0..375f26d4a4172 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -381,6 +381,13 @@ static int mxsfb_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static void mxsfb_shutdown(struct platform_device *pdev)
> +{
> +	struct drm_device *drm = platform_get_drvdata(pdev);
> +
> +	drm_atomic_helper_shutdown(drm);
> +}
> +
>  #ifdef CONFIG_PM_SLEEP
>  static int mxsfb_suspend(struct device *dev)
>  {
> @@ -404,6 +411,7 @@ static const struct dev_pm_ops mxsfb_pm_ops = {
>  static struct platform_driver mxsfb_platform_driver = {
>  	.probe		= mxsfb_probe,
>  	.remove		= mxsfb_remove,
> +	.shutdown	= mxsfb_shutdown,
>  	.driver	= {
>  		.name		= "mxsfb",
>  		.of_match_table	= mxsfb_dt_ids,

-- 
Regards,

Laurent Pinchart
