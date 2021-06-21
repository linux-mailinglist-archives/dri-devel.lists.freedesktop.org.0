Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B149D3AECE8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 17:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124896E1BB;
	Mon, 21 Jun 2021 15:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692BF6E1BB
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 15:57:32 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 6bd8b341-d2a9-11eb-960d-0050568c148b;
 Mon, 21 Jun 2021 15:57:46 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 36FA6194B13;
 Mon, 21 Jun 2021 17:57:35 +0200 (CEST)
Date: Mon, 21 Jun 2021 17:57:28 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Tomohito Esaki <etom@igel.co.jp>
Subject: Re: [PATH 2/4] rcar-du: Add support virtual DRM device
Message-ID: <20210621155728.GC823900@ravnborg.org>
References: <20210621064403.26663-1-etom@igel.co.jp>
 <20210621064403.26663-3-etom@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621064403.26663-3-etom@igel.co.jp>
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
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 03:44:01PM +0900, Tomohito Esaki wrote:
> In order to use vDRM, it is necessary that the vDRM device is registered
> to du decice in the device tree.
> The "vdrms" key is added in du node and the vDRM device node is specified.
> For example:
> ----------
> & du {
>     ...
>     vdrms = <&vdrm0>;
> };
> ----------
> 
> Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
> ---
>  drivers/gpu/drm/rcar-du/Kconfig        |   4 +
>  drivers/gpu/drm/rcar-du/Makefile       |   1 +
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c |  42 ++++++
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  13 ++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c  |  13 ++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h  |   3 +
>  drivers/gpu/drm/rcar-du/rcar_du_vdrm.c | 191 +++++++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_vdrm.h |  67 +++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c  |  22 +++
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.h  |   1 +
>  10 files changed, 357 insertions(+)
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vdrm.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vdrm.h
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index b47e74421e34..6747f69c8593 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -50,3 +50,7 @@ config DRM_RCAR_WRITEBACK
>  	bool
>  	default y if ARM64
>  	depends on DRM_RCAR_DU
> +
> +config DRM_RCAR_DU_VDRM
> +	tristate "Virtual DRM for R-Car DU"
> +	depends on DRM_RCAR_DU && DRM_VDRM
> diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
> index 4d1187ccc3e5..b589b974a9f3 100644
> --- a/drivers/gpu/drm/rcar-du/Makefile
> +++ b/drivers/gpu/drm/rcar-du/Makefile
> @@ -14,6 +14,7 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_of.o \
>  					   rcar_du_of_lvds_r8a7796.dtb.o
>  rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
>  rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
> +rcar-du-drm-$(CONFIG_DRM_RCAR_DU_VDRM)	+= rcar_du_vdrm.o
>  
>  obj-$(CONFIG_DRM_RCAR_CMM)		+= rcar_cmm.o
>  obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index ea7e39d03545..7d48db24090b 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -32,6 +32,11 @@
>  #include "rcar_du_vsp.h"
>  #include "rcar_lvds.h"
>  
> +#include "rcar_du_vdrm.h"
> +#ifdef CONFIG_DRM_RCAR_DU_VDRM
> +#include "../vdrm/vdrm_api.h"
> +#endif

Seems like vdrm_api.h belongs in include/drm/ as we should not pull in
headers like this.

	Sam
