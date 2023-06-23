Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A05873BAF9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 17:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A48C10E0AD;
	Fri, 23 Jun 2023 15:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD01110E0AD
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 15:03:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 772FB838;
 Fri, 23 Jun 2023 17:03:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687532591;
 bh=p+jpcDayI8eoKM1vIYcLk/Nmf5m012Wf5xfWEnnIwoc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LBEurA2XZTXtHd556If1I29pveYCigHPDXcQOEk4eyYUkaghD/i22N38pSNAJewii
 ZRwVYWZhhJcZpIouRUpETfoiPdV+mhPx7W2lTOxIFqJGHEYf10M9o7pl4kt7jPt8VJ
 DZPMCOAcxzUUV31QCVQhhK3+nprqeVJgW/+YPs2Q=
Date: Fri, 23 Jun 2023 18:03:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 05/39] drm: renesas: shmobile: Correct encoder/connector
 types
Message-ID: <20230623150346.GH2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <2f44ca769d4f524ea475123ca987472589257e0f.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2f44ca769d4f524ea475123ca987472589257e0f.1687423204.git.geert+renesas@glider.be>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:21:17AM +0200, Geert Uytterhoeven wrote:
> The first encoder output on the SH-Mobile LCD Controller is a DPI
> parallel bus.  However, at the time of introduction of the driver, no
> encoder or connector types were defined yet for the DPI parallel bus,
> hence the driver used the ones for LVDS instead.
> 
> Adjust the types accordingly.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> index 11dd2bc803e7cb62..fbfd906844da490c 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> @@ -598,7 +598,7 @@ int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
>  	encoder->possible_crtcs = 1;
>  
>  	ret = drm_simple_encoder_init(sdev->ddev, encoder,
> -				      DRM_MODE_ENCODER_LVDS);
> +				      DRM_MODE_ENCODER_DPI);

You can use DRM_MODE_ENCODER_NONE, that will simplify the code when
adding support for additional outputs. The encoder type was exposed to
userspace by mistake, and AFAIU is unused by userspace, so it doesn't
need to be specified.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  	if (ret < 0)
>  		return ret;
>  
> @@ -684,7 +684,7 @@ int shmob_drm_connector_create(struct shmob_drm_device *sdev,
>  	connector->display_info.height_mm = sdev->pdata->panel.height_mm;
>  
>  	ret = drm_connector_init(sdev->ddev, connector, &connector_funcs,
> -				 DRM_MODE_CONNECTOR_LVDS);
> +				 DRM_MODE_CONNECTOR_DPI);
>  	if (ret < 0)
>  		return ret;
>  

-- 
Regards,

Laurent Pinchart
