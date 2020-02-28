Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65509174119
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 21:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13776F4CD;
	Fri, 28 Feb 2020 20:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274EC6F4CD;
 Fri, 28 Feb 2020 20:37:48 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 745E42003C;
 Fri, 28 Feb 2020 21:37:45 +0100 (CET)
Date: Fri, 28 Feb 2020 21:37:44 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 49/51] drm/udl: Drop explicit drm_mode_config_cleanup call
Message-ID: <20200228203744.GF22966@ravnborg.org>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-50-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227181522.2711142-50-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=P1BnusSwAAAA:8
 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=SJz97ENfAAAA:8
 a=7gkXJVJtAAAA:8 a=_3mJ8jWSVA0NoDjyCeQA:9 a=wPNLvfGTeEIA:10
 a=D0XLA9XvdZm18NrgonBM:22 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, m.felsch@pengutronix.de,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 07:15:20PM +0100, Daniel Vetter wrote:
> It's right above the drm_dev_put().
> =

> This allows us to delete a bit of onion unwinding in
> udl_modeset_init().
> =

> This is made possible by a preceeding patch which added a drmm_
> cleanup action to drm_mode_config_init(), hence all we need to do to
> ensure that drm_mode_config_cleanup() is run on final drm_device
> cleanup is check the new error code for _init().
> =

> v2: Explain why this cleanup is possible (Laurent).
> =

> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: "Noralf Tr=F8nnes" <noralf@tronnes.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/udl/udl_drv.c     |  1 -
>  drivers/gpu/drm/udl/udl_drv.h     |  1 -
>  drivers/gpu/drm/udl/udl_modeset.c | 21 ++++++---------------
>  3 files changed, 6 insertions(+), 17 deletions(-)
> =

> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
> index 8b78c356beb5..b447fb053e78 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -37,7 +37,6 @@ DEFINE_DRM_GEM_FOPS(udl_driver_fops);
>  static void udl_driver_release(struct drm_device *dev)
>  {
>  	udl_fini(dev);
> -	udl_modeset_cleanup(dev);
>  }
>  =

>  static struct drm_driver driver =3D {
> diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
> index e67227c44cc4..1de7eb1b6aac 100644
> --- a/drivers/gpu/drm/udl/udl_drv.h
> +++ b/drivers/gpu/drm/udl/udl_drv.h
> @@ -68,7 +68,6 @@ struct udl_device {
>  =

>  /* modeset */
>  int udl_modeset_init(struct drm_device *dev);
> -void udl_modeset_cleanup(struct drm_device *dev);
>  struct drm_connector *udl_connector_init(struct drm_device *dev);
>  =

>  struct urb *udl_get_urb(struct drm_device *dev);
> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_=
modeset.c
> index d59ebac70b15..cad0c87f8de6 100644
> --- a/drivers/gpu/drm/udl/udl_modeset.c
> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> @@ -468,7 +468,9 @@ int udl_modeset_init(struct drm_device *dev)
>  	struct drm_connector *connector;
>  	int ret;
>  =

> -	drm_mode_config_init(dev);
> +	ret =3D drm_mode_config_init(dev);
> +	if (ret)
> +		return ret;
>  =

>  	dev->mode_config.min_width =3D 640;
>  	dev->mode_config.min_height =3D 480;
> @@ -482,10 +484,8 @@ int udl_modeset_init(struct drm_device *dev)
>  	dev->mode_config.funcs =3D &udl_mode_funcs;
>  =

>  	connector =3D udl_connector_init(dev);
> -	if (IS_ERR(connector)) {
> -		ret =3D PTR_ERR(connector);
> -		goto err_drm_mode_config_cleanup;
> -	}
> +	if (IS_ERR(connector))
> +		return PTR_ERR(connector);
>  =

>  	format_count =3D ARRAY_SIZE(udl_simple_display_pipe_formats);
>  =

> @@ -494,18 +494,9 @@ int udl_modeset_init(struct drm_device *dev)
>  					   udl_simple_display_pipe_formats,
>  					   format_count, NULL, connector);
>  	if (ret)
> -		goto err_drm_mode_config_cleanup;
> +		return ret;
>  =

>  	drm_mode_config_reset(dev);
>  =

>  	return 0;
> -
> -err_drm_mode_config_cleanup:
> -	drm_mode_config_cleanup(dev);
> -	return ret;
> -}
> -
> -void udl_modeset_cleanup(struct drm_device *dev)
> -{
> -	drm_mode_config_cleanup(dev);
>  }
> -- =

> 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
