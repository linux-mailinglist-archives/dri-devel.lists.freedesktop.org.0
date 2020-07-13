Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1CF21D60B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 14:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87B26E087;
	Mon, 13 Jul 2020 12:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73946E087
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 12:36:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 210A7C9;
 Mon, 13 Jul 2020 14:36:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1594643792;
 bh=eQqBxzhfy3ECRvCRmvkzfLqjnHOU6snkgpR0p5EZQmo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wWzKfsY2YCOa80iVBWCLlMEVDonTYq5enooi1FWog8nBr0o4BodiAONC6Uzh0nTvm
 9uu9Wb+sd4elwjPczr1l4aksukwpOAzHrqduSHkyFODj+2DJ+qcMpo5pf9iUrpdfiW
 dpR2XuTLA5eAvmdL9fBFUGfwx0yR1hgEqOhzJ378=
Date: Mon, 13 Jul 2020 15:36:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: Re: [PATCH] drm: omapdrm: Replace HTTP links with HTTPS ones
Message-ID: <20200713123625.GC6272@pendragon.ideasonboard.com>
References: <20200713122859.34135-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200713122859.34135-1-grandmaster@al2klimov.de>
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
Cc: airlied@linux.ie, masahiroy@kernel.org, sebastian.reichel@collabora.com,
 krzk@kernel.org, linux-kernel@vger.kernel.org, zhengbin13@huawei.com,
 ajhernandez@ti.com, tony@atomide.com, tomi.valkeinen@ti.com,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 sam@ravnborg.org, wen.yang99@zte.com.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexander,

Thank you for the patch.

On Mon, Jul 13, 2020 at 02:28:59PM +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  Continuing my work started at 93431e0607e5.
>  See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>  (Actually letting a shell for loop submit all this stuff for me.)
> 
>  If there are any URLs to be removed completely or at least not just HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also: https://lkml.org/lkml/2020/6/27/64
> 
>  If there are any valid, but yet not changed URLs:
>  See: https://lkml.org/lkml/2020/6/26/837
> 
>  If you apply the patch, please let me know.
> 
>  Sorry again to all maintainers who complained about subject lines.
>  Now I realized that you want an actually perfect prefixes,
>  not just subsystem ones.
>  I tried my best...

You've done good here :-)

>  And yes, *I could* (at least half-)automate it.
>  Impossible is nothing! :)
> 
> 
>  drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 2 +-
>  drivers/gpu/drm/omapdrm/dss/Kconfig             | 4 ++--
>  drivers/gpu/drm/omapdrm/dss/base.c              | 2 +-
>  drivers/gpu/drm/omapdrm/dss/dispc.h             | 2 +-
>  drivers/gpu/drm/omapdrm/dss/dispc_coefs.c       | 2 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi.h              | 2 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c             | 2 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c         | 2 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi4_core.c        | 2 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi4_core.h        | 2 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c             | 2 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi5_core.c        | 2 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi5_core.h        | 2 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi_phy.c          | 2 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi_pll.c          | 2 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi_wp.c           | 2 +-
>  drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c | 2 +-
>  drivers/gpu/drm/omapdrm/dss/omapdss.h           | 2 +-
>  drivers/gpu/drm/omapdrm/dss/output.c            | 2 +-
>  drivers/gpu/drm/omapdrm/dss/pll.c               | 2 +-
>  drivers/gpu/drm/omapdrm/dss/video-pll.c         | 2 +-
>  drivers/gpu/drm/omapdrm/omap_connector.c        | 2 +-
>  drivers/gpu/drm/omapdrm/omap_crtc.c             | 2 +-
>  drivers/gpu/drm/omapdrm/omap_debugfs.c          | 2 +-
>  drivers/gpu/drm/omapdrm/omap_dmm_priv.h         | 2 +-
>  drivers/gpu/drm/omapdrm/omap_dmm_tiler.c        | 2 +-
>  drivers/gpu/drm/omapdrm/omap_dmm_tiler.h        | 2 +-
>  drivers/gpu/drm/omapdrm/omap_drv.c              | 2 +-
>  drivers/gpu/drm/omapdrm/omap_drv.h              | 2 +-
>  drivers/gpu/drm/omapdrm/omap_encoder.c          | 2 +-
>  drivers/gpu/drm/omapdrm/omap_fb.c               | 2 +-
>  drivers/gpu/drm/omapdrm/omap_fbdev.c            | 2 +-
>  drivers/gpu/drm/omapdrm/omap_gem.c              | 2 +-
>  drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c       | 2 +-
>  drivers/gpu/drm/omapdrm/omap_irq.c              | 2 +-
>  drivers/gpu/drm/omapdrm/omap_plane.c            | 2 +-
>  drivers/gpu/drm/omapdrm/tcm-sita.c              | 2 +-
>  37 files changed, 38 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index 3484b5d4a91c..ec394746cd2d 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -2,7 +2,7 @@
>  /*
>   * Generic DSI Command Mode panel driver
>   *
> - * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/

I wonder if we shouldn't drop the URL instead. I'll let Tomi reply.

>   * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
>   */
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/Kconfig b/drivers/gpu/drm/omapdrm/dss/Kconfig
> index 2658c521b702..e11b258a2294 100644
> --- a/drivers/gpu/drm/omapdrm/dss/Kconfig
> +++ b/drivers/gpu/drm/omapdrm/dss/Kconfig
> @@ -80,7 +80,7 @@ config OMAP5_DSS_HDMI
>  	select OMAP2_DSS_HDMI_COMMON
>  	help
>  	  HDMI Interface for OMAP5 and similar cores. This adds the High
> -	  Definition Multimedia Interface. See http://www.hdmi.org/ for HDMI
> +	  Definition Multimedia Interface. See https://www.hdmi.org/ for HDMI
>  	  specification.

Same here, the URL has little value given that specs are not public, and
it's fairly evident where the HDMI forum can be found. Same for MIPI
below. Tomi, what do you think ?

>  
>  config OMAP2_DSS_SDI
> @@ -101,7 +101,7 @@ config OMAP2_DSS_DSI
>  	  DSI is a high speed half-duplex serial interface between the host
>  	  processor and a peripheral, such as a display or a framebuffer chip.
>  
> -	  See http://www.mipi.org/ for DSI specifications.
> +	  See https://www.mipi.org/ for DSI specifications.
>  
>  config OMAP2_DSS_MIN_FCK_PER_PCK
>  	int "Minimum FCK/PCK ratio (for scaling)"
> diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
> index c7650a7c155d..cf50430e6363 100644
> --- a/drivers/gpu/drm/omapdrm/dss/base.c
> +++ b/drivers/gpu/drm/omapdrm/dss/base.c
> @@ -2,7 +2,7 @@
>  /*
>   * OMAP Display Subsystem Base
>   *
> - * Copyright (C) 2015-2017 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2015-2017 Texas Instruments Incorporated - https://www.ti.com/
>   */
>  
>  #include <linux/kernel.h>
> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.h b/drivers/gpu/drm/omapdrm/dss/dispc.h
> index 2348faf88768..3f842c1ff81a 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dispc.h
> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Archit Taneja <archit@ti.com>
>   */
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc_coefs.c b/drivers/gpu/drm/omapdrm/dss/dispc_coefs.c
> index bccb28de5a59..d1f3a93b8efd 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dispc_coefs.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dispc_coefs.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Chandrabhanu Mahapatra <cmahapatra@ti.com>
>   */
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi.h b/drivers/gpu/drm/omapdrm/dss/hdmi.h
> index 3a40833d3368..c4a4e07f0b99 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi.h
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi.h
> @@ -2,7 +2,7 @@
>  /*
>   * HDMI driver definition for TI OMAP4 Processor.
>   *
> - * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com/
>   */
>  
>  #ifndef _HDMI_H
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> index 2578c95570f6..401168a21e03 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> @@ -2,7 +2,7 @@
>  /*
>   * HDMI interface DSS driver for TI's OMAP4 family of SoCs.
>   *
> - * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com/
>   * Authors: Yong Zhi
>   *	Mythri pk <mythripk@ti.com>
>   */
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
> index ebf9c96d43ee..43592c1cf081 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
> @@ -3,7 +3,7 @@
>   *
>   * Based on the CEC code from hdmi_ti_4xxx_ip.c from Android.
>   *
> - * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com/
>   * Authors: Yong Zhi
>   *	Mythri pk <mythripk@ti.com>
>   *
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
> index 751985a2679a..35faa7f028c4 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
> @@ -2,7 +2,7 @@
>  /*
>   * HDMI TI81xx, TI38xx, TI OMAP4 etc IP driver Library
>   *
> - * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com/
>   * Authors: Yong Zhi
>   *	Mythri pk <mythripk@ti.com>
>   */
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.h b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.h
> index dc64ae2aa300..3c9e1f600fbe 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.h
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.h
> @@ -2,7 +2,7 @@
>  /*
>   * HDMI header definition for OMAP4 HDMI core IP
>   *
> - * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com/
>   */
>  
>  #ifndef _HDMI4_CORE_H_
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> index 4d4c1fabd0a1..bdac755288ff 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> @@ -2,7 +2,7 @@
>  /*
>   * HDMI driver for OMAP5
>   *
> - * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com/
>   *
>   * Authors:
>   *	Yong Zhi
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
> index 7dd587035160..6cc2ad7a420c 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
> @@ -2,7 +2,7 @@
>  /*
>   * OMAP5 HDMI CORE IP driver library
>   *
> - * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com/
>   * Authors:
>   *	Yong Zhi
>   *	Mythri pk
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
> index 65eadefdb3f9..070cbf5fb57d 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
> @@ -2,7 +2,7 @@
>  /*
>   * HDMI driver definition for TI OMAP5 processors.
>   *
> - * Copyright (C) 2011-2012 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2011-2012 Texas Instruments Incorporated - https://www.ti.com/
>   */
>  
>  #ifndef _HDMI5_CORE_H_
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi_phy.c b/drivers/gpu/drm/omapdrm/dss/hdmi_phy.c
> index 00bbf24488c1..5dc200f09c3c 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi_phy.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi_phy.c
> @@ -2,7 +2,7 @@
>  /*
>   * HDMI PHY
>   *
> - * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
>   */
>  
>  #include <linux/kernel.h>
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c b/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c
> index cf2b000f397f..13bf649aba52 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c
> @@ -2,7 +2,7 @@
>  /*
>   * HDMI PLL
>   *
> - * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
>   */
>  
>  #define DSS_SUBSYS_NAME "HDMIPLL"
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi_wp.c b/drivers/gpu/drm/omapdrm/dss/hdmi_wp.c
> index 32f45f4f569d..9d830584a762 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi_wp.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi_wp.c
> @@ -2,7 +2,7 @@
>  /*
>   * HDMI wrapper
>   *
> - * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
>   */
>  
>  #define DSS_SUBSYS_NAME "HDMIWP"
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
> index 72a7da7bfff1..f21b5df31213 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
>   */
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index ab19d4af8de7..a48a9a254e33 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (C) 2016 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2016 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
>   */
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
> index ce21c798cca6..5affdf078134 100644
> --- a/drivers/gpu/drm/omapdrm/dss/output.c
> +++ b/drivers/gpu/drm/omapdrm/dss/output.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Archit Taneja <archit@ti.com>
>   */
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/pll.c b/drivers/gpu/drm/omapdrm/dss/pll.c
> index 1212f3cc52d1..241a338ace29 100644
> --- a/drivers/gpu/drm/omapdrm/dss/pll.c
> +++ b/drivers/gpu/drm/omapdrm/dss/pll.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com/
>   */
>  
>  #define DSS_SUBSYS_NAME "PLL"
> diff --git a/drivers/gpu/drm/omapdrm/dss/video-pll.c b/drivers/gpu/drm/omapdrm/dss/video-pll.c
> index a612e2696dbc..b72c3ffddc9a 100644
> --- a/drivers/gpu/drm/omapdrm/dss/video-pll.c
> +++ b/drivers/gpu/drm/omapdrm/dss/video-pll.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com/
>   */
>  
>  #include <linux/clk.h>
> diff --git a/drivers/gpu/drm/omapdrm/omap_connector.c b/drivers/gpu/drm/omapdrm/omap_connector.c
> index 528764566b17..797efccfd46d 100644
> --- a/drivers/gpu/drm/omapdrm/omap_connector.c
> +++ b/drivers/gpu/drm/omapdrm/omap_connector.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Rob Clark <rob@ti.com>
>   */
>  
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
> index fce7e944a280..26b9a45a116e 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Rob Clark <rob@ti.com>
>   */
>  
> diff --git a/drivers/gpu/drm/omapdrm/omap_debugfs.c b/drivers/gpu/drm/omapdrm/omap_debugfs.c
> index b57fbe8a0ac2..2d3909a37f51 100644
> --- a/drivers/gpu/drm/omapdrm/omap_debugfs.c
> +++ b/drivers/gpu/drm/omapdrm/omap_debugfs.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Rob Clark <rob.clark@linaro.org>
>   */
>  
> diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_priv.h b/drivers/gpu/drm/omapdrm/omap_dmm_priv.h
> index 60bb3f9297bc..58a8239d3e69 100644
> --- a/drivers/gpu/drm/omapdrm/omap_dmm_priv.h
> +++ b/drivers/gpu/drm/omapdrm/omap_dmm_priv.h
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Rob Clark <rob@ti.com>
>   *         Andy Gross <andy.gross@ti.com>
>   *
> diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
> index 42ec51bb7b1b..7d5aa21ae1f3 100644
> --- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
> +++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
> @@ -1,7 +1,7 @@
>  /*
>   * DMM IOMMU driver support functions for TI OMAP processors.
>   *
> - * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Rob Clark <rob@ti.com>
>   *         Andy Gross <andy.gross@ti.com>
>   *
> diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.h b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.h
> index 43c1d096b021..2f8918fe06d5 100644
> --- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.h
> +++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.h
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Rob Clark <rob@ti.com>
>   *         Andy Gross <andy.gross@ti.com>
>   *
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index cdafd7ef1c32..70846a8bb8a5 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Rob Clark <rob@ti.com>
>   */
>  
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
> index 8a1fac680138..ae57e7ada876 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.h
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Rob Clark <rob@ti.com>
>   */
>  
> diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
> index ae4b867a67a3..57e92a4d5937 100644
> --- a/drivers/gpu/drm/omapdrm/omap_encoder.c
> +++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Rob Clark <rob@ti.com>
>   */
>  
> diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
> index 9aeab81dfb90..4f1079d19388 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fb.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fb.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Rob Clark <rob@ti.com>
>   */
>  
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> index 09a84919ef73..43bcb43aca2f 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Rob Clark <rob@ti.com>
>   */
>  
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
> index d08ae95ecc0a..c7eefb248a98 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Rob Clark <rob.clark@linaro.org>
>   */
>  
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> index b319fe7f2371..f4cde3a169d8 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Rob Clark <rob.clark@linaro.org>
>   */
>  
> diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapdrm/omap_irq.c
> index 382bcdc72ac0..de80cd3455c8 100644
> --- a/drivers/gpu/drm/omapdrm/omap_irq.c
> +++ b/drivers/gpu/drm/omapdrm/omap_irq.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Rob Clark <rob.clark@linaro.org>
>   */
>  
> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
> index 73ec99819a3d..21e0b9785599 100644
> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
>   * Author: Rob Clark <rob.clark@linaro.org>
>   */
>  
> diff --git a/drivers/gpu/drm/omapdrm/tcm-sita.c b/drivers/gpu/drm/omapdrm/tcm-sita.c
> index 817be3c41863..9e1acbd2c7aa 100644
> --- a/drivers/gpu/drm/omapdrm/tcm-sita.c
> +++ b/drivers/gpu/drm/omapdrm/tcm-sita.c
> @@ -5,7 +5,7 @@
>   *          Lajos Molnar <molnar@ti.com>
>   *          Andy Gross <andy.gross@ti.com>
>   *
> - * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
>   *
>   * This package is free software; you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License version 2 as

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
