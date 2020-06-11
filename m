Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F231F6D86
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 20:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6136E194;
	Thu, 11 Jun 2020 18:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223516E194
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 18:35:11 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id A657B5C8E3D;
 Thu, 11 Jun 2020 20:35:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1591900508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x8xW74BBg4KYcH3lTs4hIBiRwMxx94Vh2Uj/FP9OowI=;
 b=WJuTwOH9RPgAR/O2/XE4axwuoWr2yehibPRfOyQCBfb55NvCcX+ej5wbDEFnK+6A4O497i
 e1+MdJgl9cHJkXSuu6G/huSMi5xqKcB0QpcNF+Q7XzoXpT8hLWyOAOs2c0xDnEh+bIHqqR
 Ex16uKq4e8a4f0FKiwIQbZCPkkCbA3g=
MIME-Version: 1.0
Date: Thu, 11 Jun 2020 20:35:08 +0200
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 14/22] drm: mxsfb: Enable vblank handling
In-Reply-To: <20200530031015.15492-15-laurent.pinchart@ideasonboard.com>
References: <20200530031015.15492-1-laurent.pinchart@ideasonboard.com>
 <20200530031015.15492-15-laurent.pinchart@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <e1b54aa0e4da2334fd387585effb7c02@agner.ch>
X-Sender: stefan@agner.ch
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
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com, kernel@pengutronix.de, robert.chiras@nxp.com,
 leonard.crestez@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-30 05:10, Laurent Pinchart wrote:
> Enable vblank handling when the CRTC is turned on and disable it when it
> is turned off. This requires moving vblank init after the KMS pipeline
> initialisation, otherwise drm_vblank_init() gets called with 0 CRTCs.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Stefan Agner <stefan@agner.ch>

> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 15 +++++++++------
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c |  6 +++++-
>  2 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index e324bd2a63a5..72b4f6a947a4 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -160,12 +160,6 @@ static int mxsfb_load(struct drm_device *drm,
> unsigned long flags)
>  
>  	pm_runtime_enable(drm->dev);
>  
> -	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
> -	if (ret < 0) {
> -		dev_err(drm->dev, "Failed to initialise vblank\n");
> -		goto err_vblank;
> -	}
> -
>  	/* Modeset init */
>  	drm_mode_config_init(drm);
>  
> @@ -175,6 +169,15 @@ static int mxsfb_load(struct drm_device *drm,
> unsigned long flags)
>  		goto err_vblank;
>  	}
>  
> +	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
> +	if (ret < 0) {
> +		dev_err(drm->dev, "Failed to initialise vblank\n");
> +		goto err_vblank;
> +	}
> +
> +	/* Start with vertical blanking interrupt reporting disabled. */
> +	drm_crtc_vblank_off(&mxsfb->crtc);
> +
>  	ret = mxsfb_attach_bridge(mxsfb);
>  	if (ret) {
>  		dev_err(drm->dev, "Cannot connect bridge: %d\n", ret);
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index ac2696c8483d..640305fb1068 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -322,8 +322,10 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>  	dma_addr_t paddr;
>  
>  	pm_runtime_get_sync(drm->dev);
> -
>  	mxsfb_enable_axi_clk(mxsfb);
> +
> +	drm_crtc_vblank_on(crtc);
> +
>  	mxsfb_crtc_mode_set_nofb(mxsfb);
>  
>  	/* Write cur_buf as well to avoid an initial corrupt frame */
> @@ -353,6 +355,8 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
>  	}
>  	spin_unlock_irq(&drm->event_lock);
>  
> +	drm_crtc_vblank_off(crtc);
> +
>  	mxsfb_disable_axi_clk(mxsfb);
>  	pm_runtime_put_sync(drm->dev);
>  }
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
