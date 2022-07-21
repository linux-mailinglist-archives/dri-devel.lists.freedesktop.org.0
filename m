Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5C757CA98
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 14:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1189075C;
	Thu, 21 Jul 2022 12:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B179076C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 12:25:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28F41496;
 Thu, 21 Jul 2022 14:25:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1658406304;
 bh=Emp/6tFuyFlwG6QHbyW9jzXRmPRexPwIgBYyovQerJM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pmFgHDk6rGBfrUbse68M/3VoyInH8PcSKFdWsM1dLMQxVrMMv7rpgumH95jQIbcHd
 yTKslEAg/vwlqeAOfWkLYcvrd9UlVS7KPqHuREhrAx9LpE6rnk1gxKRdKz6VJEDn6U
 l5TufDS+IcQBv+07gJHstmjK0P3ODcWaN0bqqobQ=
Date: Thu, 21 Jul 2022 15:25:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH] drm/imx/dcss: get rid of HPD warning message
Message-ID: <YtlFniiVnYUoZCPM@pendragon.ideasonboard.com>
References: <20220721120912.6639-1-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220721120912.6639-1-laurentiu.palcu@oss.nxp.com>
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurentiu,

Thank you for the patch.

On Thu, Jul 21, 2022 at 03:09:12PM +0300, Laurentiu Palcu wrote:
> When DCSS + MIPI_DSI is used, and the last bridge in the chain supports
> HPD, we can see a "Hot plug detection already enabled" warning stack
> trace dump that's thrown when DCSS is initialized.
> 
> The problem appeared when HPD was enabled by default in the
> bridge_connector initialization, which made the
> drm_bridge_connector_enable_hpd() call, in DCSS init path, redundant.
> So, let's remove that call.
> 
> Fixes: 09077bc311658 ("drm/bridge_connector: enable HPD by default if supported")
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/imx/dcss/dcss-kms.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> index 9b84df34a6a12..8cf3352d88582 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> @@ -142,8 +142,6 @@ struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
>  
>  	drm_kms_helper_poll_init(drm);
>  
> -	drm_bridge_connector_enable_hpd(kms->connector);
> -
>  	ret = drm_dev_register(drm, 0);
>  	if (ret)
>  		goto cleanup_crtc;

-- 
Regards,

Laurent Pinchart
