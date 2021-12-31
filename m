Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B14C8482590
	for <lists+dri-devel@lfdr.de>; Fri, 31 Dec 2021 19:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52780898C2;
	Fri, 31 Dec 2021 18:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA29898C2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 18:55:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 597A05B0;
 Fri, 31 Dec 2021 19:55:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1640976912;
 bh=KKu45Gk1n9nZDucUIE87JSE5dJKBeCwQd5FO/lEmJlw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k0Y5+MFanVJxg8aeOMFKkyQi6KzC7/JJHn6gXrL4EG/cEFQ8SRjn9OCJ7087Cltmi
 FkRTNWaLB6g0GW8n72P10yC8IltCuqC+zIi5fyHL7R2u3xe5l/8/AWYGtrC3BvElIw
 sMFxzIh7qwsB4Apo+OcvZ51uzAI8c5UYbK/wG7Lc=
Date: Fri, 31 Dec 2021 20:55:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm: mxsfb: Shutdown the display on remove
Message-ID: <Yc9SDZM8k69SrwOf@pendragon.ideasonboard.com>
References: <20211231160056.302276-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211231160056.302276-1-marex@denx.de>
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

On Fri, Dec 31, 2021 at 05:00:56PM +0100, Marek Vasut wrote:
> When the device is unbound from the driver, the display may be active.
> Make sure it gets shut down.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 86d78634a9799..6d7a3aeff50b0 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -374,6 +374,7 @@ static int mxsfb_remove(struct platform_device *pdev)
>  	struct drm_device *drm = platform_get_drvdata(pdev);
>  
>  	drm_dev_unregister(drm);
> +	drm_atomic_helper_shutdown(drm);

That looks reasonable. While at it, should you also implement the
.shutdown driver operation ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	mxsfb_unload(drm);
>  	drm_dev_put(drm);
>  

-- 
Regards,

Laurent Pinchart
