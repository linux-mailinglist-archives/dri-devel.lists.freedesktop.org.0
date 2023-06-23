Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFE673BC16
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 17:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCD910E668;
	Fri, 23 Jun 2023 15:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA3F10E668
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 15:53:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EF9C838;
 Fri, 23 Jun 2023 17:52:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687535558;
 bh=2BeHCYMx6ELN64dN+qHx+B2q1EuIWFZMQRAyVaTmU+0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u7tQAf5dx+djV3xgF88HyEcJdpSAY2XeTCnr7R2uQWztOkxlFU+SDbfgcVzPvTGrP
 pqOxRAzDGa2k6IirOhh7fXFWyq0/cvmKpxc3/IujeW2lsCtHseR8pYQg5gcyfT4X0h
 izWRbVeZJwdAh4tPd66iNqsPK6FEGiDf5ntfujxE=
Date: Fri, 23 Jun 2023 18:53:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 21/39] drm: renesas: shmobile: Use struct videomode in
 platform data
Message-ID: <20230623155314.GY2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <d8d4d80699e8a7da1cb7f31b29d64a6f2c05dee5.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d8d4d80699e8a7da1cb7f31b29d64a6f2c05dee5.1687423204.git.geert+renesas@glider.be>
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

On Thu, Jun 22, 2023 at 11:21:33AM +0200, Geert Uytterhoeven wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Replace the drm_mode_modeinfo field with videomode that includes more
> signal polarity flags.  This simplifies driver handling of panel modes
> and prepares for DT support.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> [geert: Simplify]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> Changes compared to Laurent's original:
>   - Rebase,
>   - Fix build,
>   - Remove unneeded {width,height}_mm intermediaries from
>     shmob_drm_connector,
>   - Replace embedded videomode by a const pointer to pdata.
> ---
>  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 35 ++++++++-----------
>  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.h |  3 ++
>  include/linux/platform_data/shmob_drm.h       | 11 ++----
>  3 files changed, 19 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> index 291b3a5014c24f08..5328910ebe09c832 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> @@ -23,6 +23,8 @@
>  #include <drm/drm_simple_kms_helper.h>
>  #include <drm/drm_vblank.h>
>  
> +#include <video/videomode.h>
> +
>  #include "shmob_drm_crtc.h"
>  #include "shmob_drm_drv.h"
>  #include "shmob_drm_kms.h"
> @@ -64,18 +66,16 @@ static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
>  {
>  	struct drm_crtc *crtc = &scrtc->crtc;
>  	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
> -	const struct shmob_drm_interface_data *idata = &sdev->pdata->iface;
> +	enum display_flags dpy_flags = sdev->connector.mode->flags;
>  	const struct drm_display_mode *mode = &crtc->mode;
>  	u32 value;
>  
>  	value = sdev->ldmt1r
>  	      | ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? 0 : LDMT1R_VPOL)
>  	      | ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? 0 : LDMT1R_HPOL)
> -	      | ((idata->flags & SHMOB_DRM_IFACE_FL_DWPOL) ? LDMT1R_DWPOL : 0)
> -	      | ((idata->flags & SHMOB_DRM_IFACE_FL_DIPOL) ? LDMT1R_DIPOL : 0)
> -	      | ((idata->flags & SHMOB_DRM_IFACE_FL_DAPOL) ? LDMT1R_DAPOL : 0)
> -	      | ((idata->flags & SHMOB_DRM_IFACE_FL_HSCNT) ? LDMT1R_HSCNT : 0)
> -	      | ((idata->flags & SHMOB_DRM_IFACE_FL_DWCNT) ? LDMT1R_DWCNT : 0);
> +	      | ((dpy_flags & DISPLAY_FLAGS_PIXDATA_POSEDGE) ? LDMT1R_DWPOL : 0)
> +	      | ((dpy_flags & DISPLAY_FLAGS_DE_LOW) ? LDMT1R_DIPOL : 0);
> +
>  	lcdc_write(sdev, LDMT1R, value);
>  
>  	value = ((mode->hdisplay / 8) << 16)			/* HDCN */
> @@ -581,7 +581,7 @@ static inline struct shmob_drm_connector *to_shmob_connector(struct drm_connecto
>  
>  static int shmob_drm_connector_get_modes(struct drm_connector *connector)
>  {
> -	struct shmob_drm_device *sdev = to_shmob_device(connector->dev);
> +	struct shmob_drm_connector *scon = to_shmob_connector(connector);
>  	struct drm_display_mode *mode;
>  
>  	mode = drm_mode_create(connector->dev);
> @@ -589,18 +589,9 @@ static int shmob_drm_connector_get_modes(struct drm_connector *connector)
>  		return 0;
>  
>  	mode->type = DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER;
> -	mode->clock = sdev->pdata->panel.mode.clock;
> -	mode->hdisplay = sdev->pdata->panel.mode.hdisplay;
> -	mode->hsync_start = sdev->pdata->panel.mode.hsync_start;
> -	mode->hsync_end = sdev->pdata->panel.mode.hsync_end;
> -	mode->htotal = sdev->pdata->panel.mode.htotal;
> -	mode->vdisplay = sdev->pdata->panel.mode.vdisplay;
> -	mode->vsync_start = sdev->pdata->panel.mode.vsync_start;
> -	mode->vsync_end = sdev->pdata->panel.mode.vsync_end;
> -	mode->vtotal = sdev->pdata->panel.mode.vtotal;
> -	mode->flags = sdev->pdata->panel.mode.flags;
> -
> -	drm_mode_set_name(mode);
> +
> +	drm_display_mode_from_videomode(scon->mode, mode);
> +
>  	drm_mode_probed_add(connector, mode);
>  
>  	return 1;
> @@ -634,10 +625,12 @@ static const struct drm_connector_funcs connector_funcs = {
>  int shmob_drm_connector_create(struct shmob_drm_device *sdev,
>  			       struct drm_encoder *encoder)
>  {
> -	struct drm_connector *connector = &sdev->connector.connector;
> +	struct shmob_drm_connector *scon = &sdev->connector;
> +	struct drm_connector *connector = &scon->connector;
>  	int ret;
>  
> -	sdev->connector.encoder = encoder;
> +	scon->encoder = encoder;
> +	scon->mode = &sdev->pdata->panel.mode;
>  
>  	connector->display_info.width_mm = sdev->pdata->panel.width_mm;
>  	connector->display_info.height_mm = sdev->pdata->panel.height_mm;
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> index bce6926269453b77..f507eaf912e16a22 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> @@ -14,6 +14,8 @@
>  #include <drm/drm_connector.h>
>  #include <drm/drm_encoder.h>
>  
> +#include <video/videomode.h>
> +
>  struct drm_pending_vblank_event;
>  struct shmob_drm_device;
>  struct shmob_drm_format_info;
> @@ -33,6 +35,7 @@ struct shmob_drm_crtc {
>  struct shmob_drm_connector {
>  	struct drm_connector connector;
>  	struct drm_encoder *encoder;
> +	const struct videomode *mode;
>  };
>  
>  int shmob_drm_crtc_create(struct shmob_drm_device *sdev);
> diff --git a/include/linux/platform_data/shmob_drm.h b/include/linux/platform_data/shmob_drm.h
> index b728e24222d99158..f3cb19ff9f818aca 100644
> --- a/include/linux/platform_data/shmob_drm.h
> +++ b/include/linux/platform_data/shmob_drm.h
> @@ -10,7 +10,7 @@
>  #ifndef __SHMOB_DRM_H__
>  #define __SHMOB_DRM_H__
>  
> -#include <drm/drm_mode.h>
> +#include <video/videomode.h>
>  
>  enum shmob_drm_clk_source {
>  	SHMOB_DRM_CLK_BUS,
> @@ -32,19 +32,12 @@ enum shmob_drm_interface {
>  struct shmob_drm_panel_data {
>  	unsigned int width_mm;		/* Panel width in mm */
>  	unsigned int height_mm;		/* Panel height in mm */
> -	struct drm_mode_modeinfo mode;
> +	struct videomode mode;
>  };
>  
> -#define SHMOB_DRM_IFACE_FL_DWPOL (1 << 0) /* Rising edge dot clock data latch */
> -#define SHMOB_DRM_IFACE_FL_DIPOL (1 << 1) /* Active low display enable */
> -#define SHMOB_DRM_IFACE_FL_DAPOL (1 << 2) /* Active low display data */
> -#define SHMOB_DRM_IFACE_FL_HSCNT (1 << 3) /* Disable HSYNC during VBLANK */
> -#define SHMOB_DRM_IFACE_FL_DWCNT (1 << 4) /* Disable dotclock during blanking */
> -
>  struct shmob_drm_interface_data {
>  	enum shmob_drm_interface interface;
>  	unsigned int clk_div;
> -	unsigned int flags;
>  };
>  
>  struct shmob_drm_platform_data {

-- 
Regards,

Laurent Pinchart
