Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A89873BDAA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 19:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A5010E68E;
	Fri, 23 Jun 2023 17:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C071510E68C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 17:18:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97FB3838;
 Fri, 23 Jun 2023 19:17:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687540652;
 bh=0YZ1lxPbJiyDK0Mx7CR1+kV4GfIdauMzmbmUCh2M2yg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I80U+ueO1+v3u+Akn9EWaSLkx1e6Z1BF8fHrMrFnz3SNglr77oZHGHNOAV2/B6DaG
 tXC7IHbwESkqu7MTeeYE2l+kqt4cTfaZGH2A9W9m924sfNsORuMF64ebfvEtEbzaBU
 g6eaEz66f6uhobK56I8/6d5c9ZEmlggEQXKZe1Ig=
Date: Fri, 23 Jun 2023 20:18:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 38/39] drm: renesas: shmobile: Atomic conversion part 3
Message-ID: <20230623171808.GN2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <9fcb81f939a6c4f09204f084519bf29d993b005a.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9fcb81f939a6c4f09204f084519bf29d993b005a.1687423204.git.geert+renesas@glider.be>
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

On Thu, Jun 22, 2023 at 11:21:50AM +0200, Geert Uytterhoeven wrote:
> Complete the conversion to atomic mode setting by converting the
> connector, and setting the DRIVER_ATOMIC flag.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 5 +----
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c  | 2 +-
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> index f2332bb0fbbd51a1..17456dde57637ab8 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> @@ -574,7 +574,6 @@ static void shmob_drm_connector_destroy(struct drm_connector *connector)
>  }
>  
>  static const struct drm_connector_funcs connector_funcs = {
> -	.dpms = drm_helper_connector_dpms,
>  	.reset = drm_atomic_helper_connector_reset,
>  	.fill_modes = drm_helper_probe_single_connector_modes,
>  	.destroy = shmob_drm_connector_destroy,
> @@ -644,9 +643,7 @@ int shmob_drm_connector_create(struct shmob_drm_device *sdev,
>  	if (ret < 0)
>  		goto error;
>  
> -	drm_helper_connector_dpms(connector, DRM_MODE_DPMS_OFF);
> -	drm_object_property_set_value(&connector->base,
> -		sdev->ddev.mode_config.dpms_property, DRM_MODE_DPMS_OFF);
> +	connector->dpms = DRM_MODE_DPMS_OFF;
>  
>  	sdev->connector = connector;
>  
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> index c43f408d6b1fcc5b..576869164479ec6b 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -98,7 +98,7 @@ static irqreturn_t shmob_drm_irq(int irq, void *arg)
>  DEFINE_DRM_GEM_DMA_FOPS(shmob_drm_fops);
>  
>  static const struct drm_driver shmob_drm_driver = {
> -	.driver_features	= DRIVER_GEM | DRIVER_MODESET,
> +	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	DRM_GEM_DMA_DRIVER_OPS,
>  	.fops			= &shmob_drm_fops,
>  	.name			= "shmob-drm",

-- 
Regards,

Laurent Pinchart
