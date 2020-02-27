Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD211729C4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 21:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0AB6ED3E;
	Thu, 27 Feb 2020 20:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420E76ED3D;
 Thu, 27 Feb 2020 20:55:37 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E65FD804F6;
 Thu, 27 Feb 2020 21:55:33 +0100 (CET)
Date: Thu, 27 Feb 2020 21:55:32 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 05/51] drm/mipi_dbi: Use drmm_add_final_kfree in all
 drivers
Message-ID: <20200227205532.GA29498@ravnborg.org>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-6-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227181522.2711142-6-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=SJz97ENfAAAA:8
 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=-VAfIpHNAAAA:8 a=WZHNqt2aAAAA:8
 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8 a=oc-KeUEeAPEbiV5KqdcA:9
 a=wPNLvfGTeEIA:10 a=vFet0B0WnEQeilDPIY6i:22 a=AjGcO6oz07-iQ99wixmX:22
 a=srlwD-8ojaedGGhPAyx8:22 a=PrHl9onO2p7xFKlKy1af:22
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 m.felsch@pengutronix.de, DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, David Lechner <david@lechnology.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 07:14:36PM +0100, Daniel Vetter wrote:
> They all share mipi_dbi_release so we need to switch them all
> together. With this we can drop the final kfree from the release
> function.
> =

> Aside, I think we could perhaps have a tiny additional helper for
> these mipi_dbi drivers, the first few lines around devm_drm_dev_init
> are all the same (except for the drm_driver pointer).
> =

> Reviewed-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> Tested-by: Noralf Tr=F8nnes <noralf@tronnes.org>
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
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_mipi_dbi.c  | 3 ---
>  drivers/gpu/drm/tiny/hx8357d.c  | 2 ++
>  drivers/gpu/drm/tiny/ili9225.c  | 2 ++
>  drivers/gpu/drm/tiny/ili9341.c  | 2 ++
>  drivers/gpu/drm/tiny/ili9486.c  | 2 ++
>  drivers/gpu/drm/tiny/mi0283qt.c | 2 ++
>  drivers/gpu/drm/tiny/st7586.c   | 2 ++
>  drivers/gpu/drm/tiny/st7735r.c  | 2 ++
>  8 files changed, 14 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_db=
i.c
> index 558baf989f5a..069603dfcd10 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -588,13 +588,10 @@ EXPORT_SYMBOL(mipi_dbi_dev_init);
>   */
>  void mipi_dbi_release(struct drm_device *drm)
>  {
> -	struct mipi_dbi_dev *dbidev =3D drm_to_mipi_dbi_dev(drm);
> -
>  	DRM_DEBUG_DRIVER("\n");
>  =

>  	drm_mode_config_cleanup(drm);
>  	drm_dev_fini(drm);
> -	kfree(dbidev);
>  }
>  EXPORT_SYMBOL(mipi_dbi_release);
>  =

> diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357=
d.c
> index 9af8ff84974f..42bc5dadcb1c 100644
> --- a/drivers/gpu/drm/tiny/hx8357d.c
> +++ b/drivers/gpu/drm/tiny/hx8357d.c
> @@ -21,6 +21,7 @@
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_mipi_dbi.h>
>  #include <drm/drm_modeset_helper.h>
>  #include <video/mipi_display.h>
> @@ -236,6 +237,7 @@ static int hx8357d_probe(struct spi_device *spi)
>  		kfree(dbidev);
>  		return ret;
>  	}
> +	drmm_add_final_kfree(drm, dbidev);
>  =

>  	drm_mode_config_init(drm);
>  =

> diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili922=
5.c
> index 802fb8dde1b6..aae88dc5b3f7 100644
> --- a/drivers/gpu/drm/tiny/ili9225.c
> +++ b/drivers/gpu/drm/tiny/ili9225.c
> @@ -24,6 +24,7 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_mipi_dbi.h>
>  #include <drm/drm_rect.h>
>  =

> @@ -387,6 +388,7 @@ static int ili9225_probe(struct spi_device *spi)
>  		kfree(dbidev);
>  		return ret;
>  	}
> +	drmm_add_final_kfree(drm, dbidev);
>  =

>  	drm_mode_config_init(drm);
>  =

> diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili934=
1.c
> index 33b51dc7faa8..7d40cb4ff72b 100644
> --- a/drivers/gpu/drm/tiny/ili9341.c
> +++ b/drivers/gpu/drm/tiny/ili9341.c
> @@ -20,6 +20,7 @@
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_mipi_dbi.h>
>  #include <drm/drm_modeset_helper.h>
>  #include <video/mipi_display.h>
> @@ -194,6 +195,7 @@ static int ili9341_probe(struct spi_device *spi)
>  		kfree(dbidev);
>  		return ret;
>  	}
> +	drmm_add_final_kfree(drm, dbidev);
>  =

>  	drm_mode_config_init(drm);
>  =

> diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili948=
6.c
> index 5084b38c1a71..7d735fc67498 100644
> --- a/drivers/gpu/drm/tiny/ili9486.c
> +++ b/drivers/gpu/drm/tiny/ili9486.c
> @@ -19,6 +19,7 @@
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_mipi_dbi.h>
>  #include <drm/drm_modeset_helper.h>
>  =

> @@ -208,6 +209,7 @@ static int ili9486_probe(struct spi_device *spi)
>  		kfree(dbidev);
>  		return ret;
>  	}
> +	drmm_add_final_kfree(drm, dbidev);
>  =

>  	drm_mode_config_init(drm);
>  =

> diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi028=
3qt.c
> index e2cfd9a17143..8555a56bce8c 100644
> --- a/drivers/gpu/drm/tiny/mi0283qt.c
> +++ b/drivers/gpu/drm/tiny/mi0283qt.c
> @@ -18,6 +18,7 @@
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_mipi_dbi.h>
>  #include <drm/drm_modeset_helper.h>
>  #include <video/mipi_display.h>
> @@ -198,6 +199,7 @@ static int mi0283qt_probe(struct spi_device *spi)
>  		kfree(dbidev);
>  		return ret;
>  	}
> +	drmm_add_final_kfree(drm, dbidev);
>  =

>  	drm_mode_config_init(drm);
>  =

> diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
> index 9ef559dd3191..427c2561f5f4 100644
> --- a/drivers/gpu/drm/tiny/st7586.c
> +++ b/drivers/gpu/drm/tiny/st7586.c
> @@ -21,6 +21,7 @@
>  #include <drm/drm_format_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_mipi_dbi.h>
>  #include <drm/drm_rect.h>
>  =

> @@ -328,6 +329,7 @@ static int st7586_probe(struct spi_device *spi)
>  		kfree(dbidev);
>  		return ret;
>  	}
> +	drmm_add_final_kfree(drm, dbidev);
>  =

>  	drm_mode_config_init(drm);
>  =

> diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735=
r.c
> index 18b925df6e51..b447235c3d47 100644
> --- a/drivers/gpu/drm/tiny/st7735r.c
> +++ b/drivers/gpu/drm/tiny/st7735r.c
> @@ -21,6 +21,7 @@
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_mipi_dbi.h>
>  =

>  #define ST7735R_FRMCTR1		0xb1
> @@ -209,6 +210,7 @@ static int st7735r_probe(struct spi_device *spi)
>  		kfree(dbidev);
>  		return ret;
>  	}
> +	drmm_add_final_kfree(drm, dbidev);
>  =

>  	drm_mode_config_init(drm);
>  =

> -- =

> 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
