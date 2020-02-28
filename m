Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 692C2174114
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 21:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A22A6F4CB;
	Fri, 28 Feb 2020 20:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651866F4CB;
 Fri, 28 Feb 2020 20:36:24 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 75E072002C;
 Fri, 28 Feb 2020 21:36:21 +0100 (CET)
Date: Fri, 28 Feb 2020 21:36:20 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 48/51] drm/mipi-dbi: Drop explicit
 drm_mode_config_cleanup call
Message-ID: <20200228203620.GE22966@ravnborg.org>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-49-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227181522.2711142-49-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=P1BnusSwAAAA:8
 a=SJz97ENfAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=-VAfIpHNAAAA:8
 a=WZHNqt2aAAAA:8 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8 a=an-GS5leC11lmbAuHc8A:9
 a=wPNLvfGTeEIA:10 a=D0XLA9XvdZm18NrgonBM:22 a=vFet0B0WnEQeilDPIY6i:22
 a=AjGcO6oz07-iQ99wixmX:22 a=srlwD-8ojaedGGhPAyx8:22
 a=PrHl9onO2p7xFKlKy1af:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 m.felsch@pengutronix.de, DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, David Lechner <david@lechnology.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 07:15:19PM +0100, Daniel Vetter wrote:
> Allows us to drop the drm_driver.release callback from all
> drivers, and remove the mipi_dbi_release() function.
> =

> This is made possible by a preceeding patch which added a drmm_
> cleanup action to drm_mode_config_init(), hence all we need to do to
> ensure that drm_mode_config_cleanup() is run on final drm_device
> cleanup is check the new error code for _init().
> =

> v2: Explain why this cleanup is possible (Laurent).
> =

> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> Tested-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: David Lechner <david@lechnology.com>
> Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> Cc: "Noralf Tr=F8nnes" <noralf@tronnes.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_mipi_dbi.c  | 16 ----------------
>  drivers/gpu/drm/tiny/hx8357d.c  |  1 -
>  drivers/gpu/drm/tiny/ili9225.c  |  1 -
>  drivers/gpu/drm/tiny/ili9341.c  |  1 -
>  drivers/gpu/drm/tiny/ili9486.c  |  1 -
>  drivers/gpu/drm/tiny/mi0283qt.c |  1 -
>  drivers/gpu/drm/tiny/st7586.c   |  1 -
>  drivers/gpu/drm/tiny/st7735r.c  |  1 -
>  include/drm/drm_mipi_dbi.h      |  1 -
>  9 files changed, 24 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_db=
i.c
> index 9de1586659be..c0060a1c569f 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -582,22 +582,6 @@ int mipi_dbi_dev_init(struct mipi_dbi_dev *dbidev,
>  }
>  EXPORT_SYMBOL(mipi_dbi_dev_init);
>  =

> -/**
> - * mipi_dbi_release - DRM driver release helper
> - * @drm: DRM device
> - *
> - * This function finalizes and frees &mipi_dbi.
> - *
> - * Drivers can use this as their &drm_driver->release callback.
> - */
> -void mipi_dbi_release(struct drm_device *drm)
> -{
> -	DRM_DEBUG_DRIVER("\n");
> -
> -	drm_mode_config_cleanup(drm);
> -}
> -EXPORT_SYMBOL(mipi_dbi_release);
> -
>  /**
>   * mipi_dbi_hw_reset - Hardware reset of controller
>   * @dbi: MIPI DBI structure
> diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357=
d.c
> index c88b84366dc5..af7f3d10aac3 100644
> --- a/drivers/gpu/drm/tiny/hx8357d.c
> +++ b/drivers/gpu/drm/tiny/hx8357d.c
> @@ -196,7 +196,6 @@ DEFINE_DRM_GEM_CMA_FOPS(hx8357d_fops);
>  static struct drm_driver hx8357d_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			=3D &hx8357d_fops,
> -	.release		=3D mipi_dbi_release,
>  	DRM_GEM_CMA_VMAP_DRIVER_OPS,
>  	.debugfs_init		=3D mipi_dbi_debugfs_init,
>  	.name			=3D "hx8357d",
> diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili922=
5.c
> index fa998a16026c..118477af4491 100644
> --- a/drivers/gpu/drm/tiny/ili9225.c
> +++ b/drivers/gpu/drm/tiny/ili9225.c
> @@ -346,7 +346,6 @@ DEFINE_DRM_GEM_CMA_FOPS(ili9225_fops);
>  static struct drm_driver ili9225_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			=3D &ili9225_fops,
> -	.release		=3D mipi_dbi_release,
>  	DRM_GEM_CMA_VMAP_DRIVER_OPS,
>  	.name			=3D "ili9225",
>  	.desc			=3D "Ilitek ILI9225",
> diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili934=
1.c
> index 945e15169866..e152de369019 100644
> --- a/drivers/gpu/drm/tiny/ili9341.c
> +++ b/drivers/gpu/drm/tiny/ili9341.c
> @@ -152,7 +152,6 @@ DEFINE_DRM_GEM_CMA_FOPS(ili9341_fops);
>  static struct drm_driver ili9341_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			=3D &ili9341_fops,
> -	.release		=3D mipi_dbi_release,
>  	DRM_GEM_CMA_VMAP_DRIVER_OPS,
>  	.debugfs_init		=3D mipi_dbi_debugfs_init,
>  	.name			=3D "ili9341",
> diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili948=
6.c
> index 38d293cf5377..577aea662aa4 100644
> --- a/drivers/gpu/drm/tiny/ili9486.c
> +++ b/drivers/gpu/drm/tiny/ili9486.c
> @@ -165,7 +165,6 @@ DEFINE_DRM_GEM_CMA_FOPS(ili9486_fops);
>  static struct drm_driver ili9486_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			=3D &ili9486_fops,
> -	.release		=3D mipi_dbi_release,
>  	DRM_GEM_CMA_VMAP_DRIVER_OPS,
>  	.debugfs_init		=3D mipi_dbi_debugfs_init,
>  	.name			=3D "ili9486",
> diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi028=
3qt.c
> index b8c973bc2347..decaf57053ff 100644
> --- a/drivers/gpu/drm/tiny/mi0283qt.c
> +++ b/drivers/gpu/drm/tiny/mi0283qt.c
> @@ -156,7 +156,6 @@ DEFINE_DRM_GEM_CMA_FOPS(mi0283qt_fops);
>  static struct drm_driver mi0283qt_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			=3D &mi0283qt_fops,
> -	.release		=3D mipi_dbi_release,
>  	DRM_GEM_CMA_VMAP_DRIVER_OPS,
>  	.debugfs_init		=3D mipi_dbi_debugfs_init,
>  	.name			=3D "mi0283qt",
> diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
> index 1f1a576be93c..c3295c717ba6 100644
> --- a/drivers/gpu/drm/tiny/st7586.c
> +++ b/drivers/gpu/drm/tiny/st7586.c
> @@ -285,7 +285,6 @@ DEFINE_DRM_GEM_CMA_FOPS(st7586_fops);
>  static struct drm_driver st7586_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			=3D &st7586_fops,
> -	.release		=3D mipi_dbi_release,
>  	DRM_GEM_CMA_VMAP_DRIVER_OPS,
>  	.debugfs_init		=3D mipi_dbi_debugfs_init,
>  	.name			=3D "st7586",
> diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735=
r.c
> index 0f48a5a2d3d7..631801c36f46 100644
> --- a/drivers/gpu/drm/tiny/st7735r.c
> +++ b/drivers/gpu/drm/tiny/st7735r.c
> @@ -157,7 +157,6 @@ DEFINE_DRM_GEM_CMA_FOPS(st7735r_fops);
>  static struct drm_driver st7735r_driver =3D {
>  	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			=3D &st7735r_fops,
> -	.release		=3D mipi_dbi_release,
>  	DRM_GEM_CMA_VMAP_DRIVER_OPS,
>  	.debugfs_init		=3D mipi_dbi_debugfs_init,
>  	.name			=3D "st7735r",
> diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
> index 33f325f5af2b..4129bba55873 100644
> --- a/include/drm/drm_mipi_dbi.h
> +++ b/include/drm/drm_mipi_dbi.h
> @@ -152,7 +152,6 @@ int mipi_dbi_dev_init_with_formats(struct mipi_dbi_de=
v *dbidev,
>  int mipi_dbi_dev_init(struct mipi_dbi_dev *dbidev,
>  		      const struct drm_simple_display_pipe_funcs *funcs,
>  		      const struct drm_display_mode *mode, unsigned int rotation);
> -void mipi_dbi_release(struct drm_device *drm);
>  void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
>  			  struct drm_plane_state *old_state);
>  void mipi_dbi_enable_flush(struct mipi_dbi_dev *dbidev,
> -- =

> 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
