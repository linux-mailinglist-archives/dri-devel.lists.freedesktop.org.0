Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B6A2D3259
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 19:48:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8953C89A98;
	Tue,  8 Dec 2020 18:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959AA894A7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 18:48:39 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 9B4BA804FC;
 Tue,  8 Dec 2020 19:48:37 +0100 (CET)
Date: Tue, 8 Dec 2020 19:48:36 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 01/19] drm/encoder: make encoder control functions
 optional
Message-ID: <20201208184836.GA165851@ravnborg.org>
References: <20201208155451.8421-1-p.zabel@pengutronix.de>
 <20201208155451.8421-2-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208155451.8421-2-p.zabel@pengutronix.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=7gkXJVJtAAAA:8
 a=gXE83F-jS_NvKnHU4g4A:9 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,
On Tue, Dec 08, 2020 at 04:54:33PM +0100, Philipp Zabel wrote:
> Simple managed encoders do not require the .destroy callback,
> make the whole funcs structure optional.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> New in v4.
> ---
>  drivers/gpu/drm/drm_encoder.c     | 4 ++--
>  drivers/gpu/drm/drm_mode_config.c | 5 +++--
>  include/drm/drm_encoder.h         | 2 +-
>  3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index e555281f43d4..b0b86a3c08f5 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -72,7 +72,7 @@ int drm_encoder_register_all(struct drm_device *dev)
>  	int ret = 0;
>  
>  	drm_for_each_encoder(encoder, dev) {
> -		if (encoder->funcs->late_register)
> +		if (encoder->funcs && encoder->funcs->late_register)
>  			ret = encoder->funcs->late_register(encoder);
>  		if (ret)
>  			return ret;
> @@ -86,7 +86,7 @@ void drm_encoder_unregister_all(struct drm_device *dev)
>  	struct drm_encoder *encoder;
>  
>  	drm_for_each_encoder(encoder, dev) {
> -		if (encoder->funcs->early_unregister)
> +		if (encoder->funcs && encoder->funcs->early_unregister)
>  			encoder->funcs->early_unregister(encoder);
>  	}
>  }
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index f1affc1bb679..87e144155456 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -195,7 +195,7 @@ void drm_mode_config_reset(struct drm_device *dev)
>  			crtc->funcs->reset(crtc);
>  
>  	drm_for_each_encoder(encoder, dev)
> -		if (encoder->funcs->reset)
> +		if (encoder->funcs && encoder->funcs->reset)
>  			encoder->funcs->reset(encoder);
>  
>  	drm_connector_list_iter_begin(dev, &conn_iter);
> @@ -487,7 +487,8 @@ void drm_mode_config_cleanup(struct drm_device *dev)
>  
>  	list_for_each_entry_safe(encoder, enct, &dev->mode_config.encoder_list,
>  				 head) {
> -		encoder->funcs->destroy(encoder);
> +		if (encoder->funcs)
> +			encoder->funcs->destroy(encoder);

So late_register and early_unregister are both optional.
But if encoder->funcs is set then the destroy callback is mandatory.

I am just wondering if this is intended.
Reding the documnetation of drm_encoder_funcs thist matches the
documentation but anyway..

With this comment considered,
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
