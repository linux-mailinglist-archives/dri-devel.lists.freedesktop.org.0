Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF042355C9
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 09:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988696E073;
	Sun,  2 Aug 2020 07:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08316E073
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 07:07:52 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B9F9E20020;
 Sun,  2 Aug 2020 09:07:45 +0200 (CEST)
Date: Sun, 2 Aug 2020 09:07:43 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Bernard Zhao <bernard@vivo.com>
Subject: Re: [PATCH] drm/panel: remove return value of function drm_panel_add
Message-ID: <20200802070743.GA822300@ravnborg.org>
References: <20200801120216.8488-1-bernard@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200801120216.8488-1-bernard@vivo.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=1WtWmnkvAAAA:8 a=gVjrpwQ8AGm25h8jbrwA:9
 a=CjuIK1q_8ugA:10 a=-_UHfarfsM-RsASml2Jt:22
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
Cc: dri-devel@lists.freedesktop.org, opensource.kernel@vivo.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Stefan Mavrodiev <stefan@olimex.com>,
 David Airlie <airlied@linux.ie>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bernard.

On Sat, Aug 01, 2020 at 08:02:13PM +0800, Bernard Zhao wrote:
> The function "int drm_panel_add(struct drm_panel *panel)"
> always returns 0, this return value is meaningless.
> Also, there is no need to check return value which calls
> "drm_panel_add and", error branch code will never run.

Thanks for this nice cleanup.
Applied to drm-misc-next - so it will appear in -next after the
upcoming merge window and will hit upstream in 5.10

While applying I did the following modifications:
- Fixed kernel-doc as the function returns a void
- Fixed one panel that was missing the conversion
- Fixed warnings due to unused labels


If you are up to another cleanup task there is drm_panel_attach()
and drm_panel_detach() which are no longer needed and all users
and the empty implementations can be dropped.

This will touch a lot of drivers so this change should be split
in one patch/driver.

bridge/* can be handled as one patch I think.
imx/* is already done, awaiting to be applied.

	Sam

> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/drm_panel.c                              | 4 +---
>  drivers/gpu/drm/panel/panel-arm-versatile.c              | 4 +++-
>  drivers/gpu/drm/panel/panel-boe-himax8279d.c             | 4 +++-
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c           | 4 +++-
>  drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c        | 4 +---
>  drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c    | 4 +---
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c             | 4 +++-
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c            | 4 +---
>  drivers/gpu/drm/panel/panel-innolux-p079zca.c            | 4 +---
>  drivers/gpu/drm/panel/panel-jdi-lt070me05000.c           | 4 ++--
>  drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c       | 4 +++-
>  drivers/gpu/drm/panel/panel-lg-lb035q02.c                | 4 +++-
>  drivers/gpu/drm/panel/panel-lg-lg4573.c                  | 4 +++-
>  drivers/gpu/drm/panel/panel-lvds.c                       | 4 +---
>  drivers/gpu/drm/panel/panel-nec-nl8048hl11.c             | 4 +++-
>  drivers/gpu/drm/panel/panel-novatek-nt35510.c            | 4 +---
>  drivers/gpu/drm/panel/panel-novatek-nt39016.c            | 6 +-----
>  drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c       | 4 +++-
>  drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c       | 4 +++-
>  drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c     | 4 +++-
>  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c    | 4 +---
>  drivers/gpu/drm/panel/panel-raydium-rm67191.c            | 4 +---
>  drivers/gpu/drm/panel/panel-ronbo-rb070d30.c             | 4 +---
>  drivers/gpu/drm/panel/panel-samsung-ld9040.c             | 4 +++-
>  drivers/gpu/drm/panel/panel-samsung-s6d16d0.c            | 4 +---
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c            | 4 +---
>  drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c         | 4 +---
>  drivers/gpu/drm/panel/panel-samsung-s6e63m0.c            | 4 +++-
>  drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c | 6 +-----
>  drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c            | 4 +---
>  drivers/gpu/drm/panel/panel-seiko-43wvf1g.c              | 4 +---
>  drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c          | 4 +++-
>  drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c          | 4 +++-
>  drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c          | 4 +++-
>  drivers/gpu/drm/panel/panel-simple.c                     | 4 +---
>  drivers/gpu/drm/panel/panel-sitronix-st7701.c            | 4 +---
>  drivers/gpu/drm/panel/panel-sitronix-st7789v.c           | 4 +---
>  drivers/gpu/drm/panel/panel-sony-acx424akp.c             | 4 +---
>  drivers/gpu/drm/panel/panel-sony-acx565akm.c             | 7 +------
>  drivers/gpu/drm/panel/panel-tpo-td028ttec1.c             | 4 +++-
>  drivers/gpu/drm/panel/panel-tpo-td043mtea1.c             | 6 +-----
>  drivers/gpu/drm/panel/panel-tpo-tpg110.c                 | 4 +++-
>  include/drm/drm_panel.h                                  | 2 +-
>  43 files changed, 80 insertions(+), 99 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index 8c7bac85a793..fab41f63ad12 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -73,13 +73,11 @@ EXPORT_SYMBOL(drm_panel_init);
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int drm_panel_add(struct drm_panel *panel)
> +void drm_panel_add(struct drm_panel *panel)
>  {
>  	mutex_lock(&panel_lock);
>  	list_add_tail(&panel->list, &panel_list);
>  	mutex_unlock(&panel_lock);
> -
> -	return 0;
>  }
>  EXPORT_SYMBOL(drm_panel_add);
>  
> diff --git a/drivers/gpu/drm/panel/panel-arm-versatile.c b/drivers/gpu/drm/panel/panel-arm-versatile.c
> index 41444a73c980..5aaee5414c40 100644
> --- a/drivers/gpu/drm/panel/panel-arm-versatile.c
> +++ b/drivers/gpu/drm/panel/panel-arm-versatile.c
> @@ -353,7 +353,9 @@ static int versatile_panel_probe(struct platform_device *pdev)
>  	drm_panel_init(&vpanel->panel, dev, &versatile_panel_drm_funcs,
>  		       DRM_MODE_CONNECTOR_DPI);
>  
> -	return drm_panel_add(&vpanel->panel);
> +	drm_panel_add(&vpanel->panel);
> +
> +	return 0;
>  }
>  
>  static const struct of_device_id versatile_panel_match[] = {
> diff --git a/drivers/gpu/drm/panel/panel-boe-himax8279d.c b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
> index 74d58ee7d04c..e0630ce04147 100644
> --- a/drivers/gpu/drm/panel/panel-boe-himax8279d.c
> +++ b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
> @@ -896,7 +896,9 @@ static int panel_add(struct panel_info *pinfo)
>  	if (ret)
>  		return ret;
>  
> -	return drm_panel_add(&pinfo->base);
> +	drm_panel_add(&pinfo->base);
> +
> +	return 0;
>  }
>  
>  static int panel_probe(struct mipi_dsi_device *dsi)
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index 2649469070aa..b9379ad92546 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -792,7 +792,9 @@ static int boe_panel_add(struct boe_panel *boe)
>  	boe->base.funcs = &boe_panel_funcs;
>  	boe->base.dev = &boe->dsi->dev;
>  
> -	return drm_panel_add(&boe->base);
> +	drm_panel_add(&boe->base);
> +
> +	return 0;
>  }
>  
>  static int boe_panel_probe(struct mipi_dsi_device *dsi)
> diff --git a/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
> index fddbfddf6566..7f2eb54e4254 100644
> --- a/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
> +++ b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
> @@ -478,9 +478,7 @@ static int k101_im2ba02_dsi_probe(struct mipi_dsi_device *dsi)
>  	if (ret)
>  		return ret;
>  
> -	ret = drm_panel_add(&ctx->panel);
> -	if (ret < 0)
> -		return ret;
> +	drm_panel_add(&ctx->panel);
>  
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
> diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
> index 95b789ab9d29..2c168a405928 100644
> --- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
> +++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
> @@ -225,9 +225,7 @@ static int feiyang_dsi_probe(struct mipi_dsi_device *dsi)
>  	if (ret)
>  		return ret;
>  
> -	ret = drm_panel_add(&ctx->panel);
> -	if (ret < 0)
> -		return ret;
> +	drm_panel_add(&ctx->panel);
>  
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> index 873b1c7059bd..4a41d8734cc7 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> @@ -899,7 +899,9 @@ static int ili9322_probe(struct spi_device *spi)
>  	drm_panel_init(&ili->panel, dev, &ili9322_drm_funcs,
>  		       DRM_MODE_CONNECTOR_DPI);
>  
> -	return drm_panel_add(&ili->panel);
> +	drm_panel_add(&ili->panel);
> +
> +	return 0;
>  }
>  
>  static int ili9322_remove(struct spi_device *spi)
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index f54077c216a3..52fd6f3d4452 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -447,9 +447,7 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
>  	if (ret)
>  		return ret;
>  
> -	ret = drm_panel_add(&ctx->panel);
> -	if (ret < 0)
> -		return ret;
> +	drm_panel_add(&ctx->panel);
>  
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
> diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
> index 7419f1f0acee..cc3e07b61a6c 100644
> --- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
> +++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
> @@ -477,9 +477,7 @@ static int innolux_panel_add(struct mipi_dsi_device *dsi,
>  	if (err)
>  		return err;
>  
> -	err = drm_panel_add(&innolux->base);
> -	if (err < 0)
> -		return err;
> +	drm_panel_add(&innolux->base);
>  
>  	mipi_dsi_set_drvdata(dsi, innolux);
>  	innolux->link = dsi;
> diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
> index 4bfd8c877c8e..4fc2185575a7 100644
> --- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
> +++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
> @@ -441,9 +441,9 @@ static int jdi_panel_add(struct jdi_panel *jdi)
>  	drm_panel_init(&jdi->base, &jdi->dsi->dev, &jdi_panel_funcs,
>  		       DRM_MODE_CONNECTOR_DSI);
>  
> -	ret = drm_panel_add(&jdi->base);
> +	drm_panel_add(&jdi->base);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static void jdi_panel_del(struct jdi_panel *jdi)
> diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
> index bac1a2a06c92..c75790f95461 100644
> --- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
> +++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
> @@ -383,7 +383,9 @@ static int kingdisplay_panel_add(struct kingdisplay_panel *kingdisplay)
>  	if (err)
>  		return err;
>  
> -	return drm_panel_add(&kingdisplay->base);
> +	drm_panel_add(&kingdisplay->base);
> +
> +	return 0;
>  }
>  
>  static void kingdisplay_panel_del(struct kingdisplay_panel *kingdisplay)
> diff --git a/drivers/gpu/drm/panel/panel-lg-lb035q02.c b/drivers/gpu/drm/panel/panel-lg-lb035q02.c
> index e90efeaba4ad..8cb403ed2d5f 100644
> --- a/drivers/gpu/drm/panel/panel-lg-lb035q02.c
> +++ b/drivers/gpu/drm/panel/panel-lg-lb035q02.c
> @@ -199,7 +199,9 @@ static int lb035q02_probe(struct spi_device *spi)
>  	drm_panel_init(&lcd->panel, &lcd->spi->dev, &lb035q02_funcs,
>  		       DRM_MODE_CONNECTOR_DPI);
>  
> -	return drm_panel_add(&lcd->panel);
> +	drm_panel_add(&lcd->panel);
> +
> +	return 0;
>  }
>  
>  static int lb035q02_remove(struct spi_device *spi)
> diff --git a/drivers/gpu/drm/panel/panel-lg-lg4573.c b/drivers/gpu/drm/panel/panel-lg-lg4573.c
> index 5907f2503755..02e8e593ba17 100644
> --- a/drivers/gpu/drm/panel/panel-lg-lg4573.c
> +++ b/drivers/gpu/drm/panel/panel-lg-lg4573.c
> @@ -262,7 +262,9 @@ static int lg4573_probe(struct spi_device *spi)
>  	drm_panel_init(&ctx->panel, &spi->dev, &lg4573_drm_funcs,
>  		       DRM_MODE_CONNECTOR_DPI);
>  
> -	return drm_panel_add(&ctx->panel);
> +	drm_panel_add(&ctx->panel);
> +
> +	return 0;
>  }
>  
>  static int lg4573_remove(struct spi_device *spi)
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> index 5ce3f4a2b7a1..41305c3dcf31 100644
> --- a/drivers/gpu/drm/panel/panel-lvds.c
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -227,9 +227,7 @@ static int panel_lvds_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	ret = drm_panel_add(&lvds->panel);
> -	if (ret < 0)
> -		return ret;
> +	drm_panel_add(&lvds->panel);
>  
>  	dev_set_drvdata(lvds->dev, lvds);
>  	return 0;
> diff --git a/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c b/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
> index c4f83f6384e1..8217cb9a0658 100644
> --- a/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
> +++ b/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
> @@ -208,7 +208,9 @@ static int nl8048_probe(struct spi_device *spi)
>  	drm_panel_init(&lcd->panel, &lcd->spi->dev, &nl8048_funcs,
>  		       DRM_MODE_CONNECTOR_DPI);
>  
> -	return drm_panel_add(&lcd->panel);
> +	drm_panel_add(&lcd->panel);
> +
> +	return 0;
>  }
>  
>  static int nl8048_remove(struct spi_device *spi)
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> index 4a8fa908a2cf..9a701a30fe04 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> @@ -956,9 +956,7 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
>  		nt->panel.backlight = bl;
>  	}
>  
> -	ret = drm_panel_add(&nt->panel);
> -	if (ret < 0)
> -		return ret;
> +	drm_panel_add(&nt->panel);
>  
>  	ret = mipi_dsi_attach(dsi);
>  	if (ret < 0)
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
> index 05cae8d62d56..9957b846bcff 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
> @@ -303,11 +303,7 @@ static int nt39016_probe(struct spi_device *spi)
>  	drm_panel_init(&panel->drm_panel, dev, &nt39016_funcs,
>  		       DRM_MODE_CONNECTOR_DPI);
>  
> -	err = drm_panel_add(&panel->drm_panel);
> -	if (err < 0) {
> -		dev_err(dev, "Failed to register panel");
> -		return err;
> -	}
> +	drm_panel_add(&panel->drm_panel);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
> index 09deb99981a4..2edda548fffd 100644
> --- a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
> +++ b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
> @@ -284,7 +284,9 @@ static int lcd_olinuxino_probe(struct i2c_client *client,
>  	if (ret)
>  		return ret;
>  
> -	return drm_panel_add(&lcd->panel);
> +	drm_panel_add(&lcd->panel);
> +
> +	return 0;
>  }
>  
>  static int lcd_olinuxino_remove(struct i2c_client *client)
> diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
> index 3a0229d60095..4fbf12ee858e 100644
> --- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
> +++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
> @@ -165,7 +165,9 @@ static int osd101t2587_panel_add(struct osd101t2587_panel *osd101t2587)
>  	if (ret)
>  		return ret;
>  
> -	return drm_panel_add(&osd101t2587->base);
> +	drm_panel_add(&osd101t2587->base);
> +
> +	return 0;
>  }
>  
>  static int osd101t2587_panel_probe(struct mipi_dsi_device *dsi)
> diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
> index 69693451462e..368722d98faf 100644
> --- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
> +++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
> @@ -207,7 +207,9 @@ static int wuxga_nt_panel_add(struct wuxga_nt_panel *wuxga_nt)
>  	if (ret)
>  		return ret;
>  
> -	return drm_panel_add(&wuxga_nt->base);
> +	drm_panel_add(&wuxga_nt->base);
> +
> +	return 0;
>  }
>  
>  static void wuxga_nt_panel_del(struct wuxga_nt_panel *wuxga_nt)
> diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> index 8f078b7dd89e..25112e5b353b 100644
> --- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> +++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> @@ -429,9 +429,7 @@ static int rpi_touchscreen_probe(struct i2c_client *i2c,
>  	/* This appears last, as it's what will unblock the DSI host
>  	 * driver's component bind function.
>  	 */
> -	ret = drm_panel_add(&ts->base);
> -	if (ret)
> -		return ret;
> +	drm_panel_add(&ts->base);
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
> index 313637d53d28..055201534bf5 100644
> --- a/drivers/gpu/drm/panel/panel-raydium-rm67191.c
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
> @@ -610,9 +610,7 @@ static int rad_panel_probe(struct mipi_dsi_device *dsi)
>  		       DRM_MODE_CONNECTOR_DSI);
>  	dev_set_drvdata(dev, panel);
>  
> -	ret = drm_panel_add(&panel->panel);
> -	if (ret)
> -		return ret;
> +	drm_panel_add(&panel->panel);
>  
>  	ret = mipi_dsi_attach(dsi);
>  	if (ret)
> diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> index ef18559e237e..6298051c7244 100644
> --- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> +++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> @@ -201,9 +201,7 @@ static int rb070d30_panel_dsi_probe(struct mipi_dsi_device *dsi)
>  	if (ret)
>  		return ret;
>  
> -	ret = drm_panel_add(&ctx->panel);
> -	if (ret < 0)
> -		return ret;
> +	drm_panel_add(&ctx->panel);
>  
>  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_LPM;
>  	dsi->format = MIPI_DSI_FMT_RGB888;
> diff --git a/drivers/gpu/drm/panel/panel-samsung-ld9040.c b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> index 9bb2e8c7934a..358168ed8355 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> @@ -354,7 +354,9 @@ static int ld9040_probe(struct spi_device *spi)
>  	drm_panel_init(&ctx->panel, dev, &ld9040_drm_funcs,
>  		       DRM_MODE_CONNECTOR_DPI);
>  
> -	return drm_panel_add(&ctx->panel);
> +	drm_panel_add(&ctx->panel);
> +
> +	return 0;
>  }
>  
>  static int ld9040_remove(struct spi_device *spi)
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> index 2150043dcf6b..72c26a63dbe5 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> @@ -218,9 +218,7 @@ static int s6d16d0_probe(struct mipi_dsi_device *dsi)
>  	drm_panel_init(&s6->panel, dev, &s6d16d0_drm_funcs,
>  		       DRM_MODE_CONNECTOR_DSI);
>  
> -	ret = drm_panel_add(&s6->panel);
> -	if (ret < 0)
> -		return ret;
> +	drm_panel_add(&s6->panel);
>  
>  	ret = mipi_dsi_attach(dsi);
>  	if (ret < 0)
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> index 36ebd5a4ac7b..d242b2f5f2d8 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> @@ -735,9 +735,7 @@ static int s6e3ha2_probe(struct mipi_dsi_device *dsi)
>  	drm_panel_init(&ctx->panel, dev, &s6e3ha2_drm_funcs,
>  		       DRM_MODE_CONNECTOR_DSI);
>  
> -	ret = drm_panel_add(&ctx->panel);
> -	if (ret < 0)
> -		goto unregister_backlight;
> +	drm_panel_add(&ctx->panel);
>  
>  	ret = mipi_dsi_attach(dsi);
>  	if (ret < 0)
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> index a3570e0a90a8..0c60f61015ff 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> @@ -480,9 +480,7 @@ static int s6e63j0x03_probe(struct mipi_dsi_device *dsi)
>  	ctx->bl_dev->props.brightness = DEFAULT_BRIGHTNESS;
>  	ctx->bl_dev->props.power = FB_BLANK_POWERDOWN;
>  
> -	ret = drm_panel_add(&ctx->panel);
> -	if (ret < 0)
> -		goto unregister_backlight;
> +	drm_panel_add(&ctx->panel);
>  
>  	ret = mipi_dsi_attach(dsi);
>  	if (ret < 0)
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> index a5f76eb4fa25..40f2f427dc91 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> @@ -480,7 +480,9 @@ static int s6e63m0_probe(struct spi_device *spi)
>  	if (ret < 0)
>  		return ret;
>  
> -	return drm_panel_add(&ctx->panel);
> +	drm_panel_add(&ctx->panel);
> +
> +	return 0;
>  }
>  
>  static int s6e63m0_remove(struct spi_device *spi)
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
> index 9d843fcc3a22..e17ba1d84481 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
> @@ -243,11 +243,7 @@ static int s6e88a0_ams452ef01_probe(struct mipi_dsi_device *dsi)
>  	drm_panel_init(&ctx->panel, dev, &s6e88a0_ams452ef01_panel_funcs,
>  		       DRM_MODE_CONNECTOR_DSI);
>  
> -	ret = drm_panel_add(&ctx->panel);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to add panel: %d\n", ret);
> -		return ret;
> -	}
> +	drm_panel_add(&ctx->panel);
>  
>  	ret = mipi_dsi_attach(dsi);
>  	if (ret < 0) {
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> index 8a028d2bd0d6..e36cb1a25318 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> @@ -1020,9 +1020,7 @@ static int s6e8aa0_probe(struct mipi_dsi_device *dsi)
>  	drm_panel_init(&ctx->panel, dev, &s6e8aa0_drm_funcs,
>  		       DRM_MODE_CONNECTOR_DSI);
>  
> -	ret = drm_panel_add(&ctx->panel);
> -	if (ret < 0)
> -		return ret;
> +	drm_panel_add(&ctx->panel);
>  
>  	ret = mipi_dsi_attach(dsi);
>  	if (ret < 0)
> diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> index 40fcbbbacb2c..46428b513a5d 100644
> --- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> +++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> @@ -257,9 +257,7 @@ static int seiko_panel_probe(struct device *dev,
>  	if (err)
>  		return err;
>  
> -	err = drm_panel_add(&panel->base);
> -	if (err < 0)
> -		return err;
> +	drm_panel_add(&panel->base);
>  
>  	dev_set_drvdata(dev, panel);
>  
> diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
> index b5d1977221a7..9727d3748034 100644
> --- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
> +++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
> @@ -326,7 +326,9 @@ static int sharp_panel_add(struct sharp_panel *sharp)
>  	if (ret)
>  		return ret;
>  
> -	return drm_panel_add(&sharp->base);
> +	drm_panel_add(&sharp->base);
> +
> +	return 0;
>  }
>  
>  static void sharp_panel_del(struct sharp_panel *sharp)
> diff --git a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
> index 1cf3f02435c1..be5cdadf5147 100644
> --- a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
> +++ b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
> @@ -188,7 +188,9 @@ static int ls037v7dw01_probe(struct platform_device *pdev)
>  	drm_panel_init(&lcd->panel, &pdev->dev, &ls037v7dw01_funcs,
>  		       DRM_MODE_CONNECTOR_DPI);
>  
> -	return drm_panel_add(&lcd->panel);
> +	drm_panel_add(&lcd->panel);
> +
> +	return 0;
>  }
>  
>  static int ls037v7dw01_remove(struct platform_device *pdev)
> diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> index ce586c6d70c7..730efc3d6984 100644
> --- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> +++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> @@ -262,7 +262,9 @@ static int sharp_nt_panel_add(struct sharp_nt_panel *sharp_nt)
>  	if (ret)
>  		return ret;
>  
> -	return drm_panel_add(&sharp_nt->base);
> +	drm_panel_add(&sharp_nt->base);
> +
> +	return 0;
>  }
>  
>  static void sharp_nt_panel_del(struct sharp_nt_panel *sharp_nt)
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 4aeb960ccf15..b290b2b966c2 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -555,9 +555,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  	if (err)
>  		goto free_ddc;
>  
> -	err = drm_panel_add(&panel->base);
> -	if (err < 0)
> -		goto free_ddc;
> +	drm_panel_add(&panel->base);
>  
>  	dev_set_drvdata(dev, panel);
>  
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> index 4b4f2558e3b4..66030978bcf9 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> @@ -380,9 +380,7 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
>  	if (ret)
>  		return ret;
>  
> -	ret = drm_panel_add(&st7701->panel);
> -	if (ret < 0)
> -		return ret;
> +	drm_panel_add(&st7701->panel);
>  
>  	mipi_dsi_set_drvdata(dsi, st7701);
>  	st7701->dsi = dsi;
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> index cc02c54c1b2e..6ed8c9823ee6 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> @@ -383,9 +383,7 @@ static int st7789v_probe(struct spi_device *spi)
>  	if (ret)
>  		return ret;
>  
> -	ret = drm_panel_add(&ctx->panel);
> -	if (ret < 0)
> -		return ret;
> +	drm_panel_add(&ctx->panel);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/panel/panel-sony-acx424akp.c b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> index c91e55b2d7a3..4c46ed9b3f6d 100644
> --- a/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> +++ b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> @@ -506,9 +506,7 @@ static int acx424akp_probe(struct mipi_dsi_device *dsi)
>  	acx->bl->props.brightness = 512;
>  	acx->bl->props.power = FB_BLANK_POWERDOWN;
>  
> -	ret = drm_panel_add(&acx->panel);
> -	if (ret < 0)
> -		return ret;
> +	drm_panel_add(&acx->panel);
>  
>  	ret = mipi_dsi_attach(dsi);
>  	if (ret < 0) {
> diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> index 5c4b6f6e5c2d..08442104dc43 100644
> --- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> +++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> @@ -651,12 +651,7 @@ static int acx565akm_probe(struct spi_device *spi)
>  	drm_panel_init(&lcd->panel, &lcd->spi->dev, &acx565akm_funcs,
>  		       DRM_MODE_CONNECTOR_DPI);
>  
> -	ret = drm_panel_add(&lcd->panel);
> -	if (ret < 0) {
> -		if (lcd->has_bc)
> -			acx565akm_backlight_cleanup(lcd);
> -		return ret;
> -	}
> +	drm_panel_add(&lcd->panel);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> index aeca15dfeb3c..5f4001a21a04 100644
> --- a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> +++ b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> @@ -351,7 +351,9 @@ static int td028ttec1_probe(struct spi_device *spi)
>  	if (ret)
>  		return ret;
>  
> -	return drm_panel_add(&lcd->panel);
> +	drm_panel_add(&lcd->panel);
> +
> +	return 0;
>  }
>  
>  static int td028ttec1_remove(struct spi_device *spi)
> diff --git a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
> index 75f1f1f1b6de..1d7a0df1680e 100644
> --- a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
> +++ b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
> @@ -461,11 +461,7 @@ static int td043mtea1_probe(struct spi_device *spi)
>  	drm_panel_init(&lcd->panel, &lcd->spi->dev, &td043mtea1_funcs,
>  		       DRM_MODE_CONNECTOR_DPI);
>  
> -	ret = drm_panel_add(&lcd->panel);
> -	if (ret < 0) {
> -		sysfs_remove_group(&spi->dev.kobj, &td043mtea1_attr_group);
> -		return ret;
> -	}
> +	drm_panel_add(&lcd->panel);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/panel/panel-tpo-tpg110.c b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
> index 8472d018c16f..b54dfcc5b3ef 100644
> --- a/drivers/gpu/drm/panel/panel-tpo-tpg110.c
> +++ b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
> @@ -453,7 +453,9 @@ static int tpg110_probe(struct spi_device *spi)
>  
>  	spi_set_drvdata(spi, tpg);
>  
> -	return drm_panel_add(&tpg->panel);
> +	drm_panel_add(&tpg->panel);
> +
> +	return 0;
>  }
>  
>  static int tpg110_remove(struct spi_device *spi)
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 6193cb555acc..ff066524cb70 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -175,7 +175,7 @@ void drm_panel_init(struct drm_panel *panel, struct device *dev,
>  		    const struct drm_panel_funcs *funcs,
>  		    int connector_type);
>  
> -int drm_panel_add(struct drm_panel *panel);
> +void drm_panel_add(struct drm_panel *panel);
>  void drm_panel_remove(struct drm_panel *panel);
>  
>  int drm_panel_attach(struct drm_panel *panel, struct drm_connector *connector);
> -- 
> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
