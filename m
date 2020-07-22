Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CAD2299A7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 16:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C633B6E05D;
	Wed, 22 Jul 2020 14:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7EA6E05D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 14:01:55 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jyFJi-0006Y8-11; Wed, 22 Jul 2020 16:01:54 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jyFJh-0005JH-OH; Wed, 22 Jul 2020 16:01:53 +0200
Message-ID: <ac269aecd712d8740e334367afa0c2e5db3a85c9.camel@pengutronix.de>
Subject: Re: [PATCH 5/8] drm/imx: parallel-display: use drm managed resources
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Date: Wed, 22 Jul 2020 16:01:53 +0200
In-Reply-To: <20200722133042.30140-5-p.zabel@pengutronix.de>
References: <20200722133042.30140-1-p.zabel@pengutronix.de>
 <20200722133042.30140-5-p.zabel@pengutronix.de>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-07-22 at 15:30 +0200, Philipp Zabel wrote:
[...]
> and use drmm_add_action_or_reset() to make sure drm_encoder_cleanup() is
> called before the memory is freed.
[...]
> @@ -259,6 +259,13 @@ static const struct drm_bridge_funcs imx_pd_bridge_funcs = {
>  	.atomic_get_output_bus_fmts = imx_pd_bridge_atomic_get_output_bus_fmts,
>  };
>  
> +static void imx_pd_encoder_cleanup(struct drm_device *drm, void *ptr)
> +{
> +	struct drm_encoder *encoder = ptr;
> +
> +	drm_encoder_cleanup(encoder);
> +}
> +
>  static int imx_pd_register(struct drm_device *drm,
>  	struct imx_parallel_display *imxpd)
>  {
> @@ -276,7 +283,13 @@ static int imx_pd_register(struct drm_device *drm,
>  	 */
>  	imxpd->connector.dpms = DRM_MODE_DPMS_OFF;
>  
> -	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
> +	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
> +	if (ret)
> +		return ret;
> +
> +	ret = drmm_add_action_or_reset(drm, imx_pd_encoder_cleanup, encoder);
> +	if (ret)
> +		return ret;

This is only required because this is a component driver: our
drmm_kzalloc() is called after drmm_mode_config_init(), so we can't rely
on drm_mode_config_init_release() for cleanup. That is only called after
drmres already freed our memory.

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
