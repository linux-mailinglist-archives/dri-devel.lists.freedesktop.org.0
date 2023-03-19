Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF34C6C01F5
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 14:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD80710E173;
	Sun, 19 Mar 2023 13:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA08C10E173
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 13:13:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-162-78-nat.elisa-mobile.fi
 [85.76.162.78])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 814C01858;
 Sun, 19 Mar 2023 14:13:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1679231637;
 bh=Xd/tjZ18w+g8BRduBnyXQwN1y551rII9qX9RVTXxAj4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YWAl932HY8YzU4q1QKM+Tt/XUYoT6MKyL9uEQPcM7469SpYzurUjTQjbbwxQXa5Ka
 NzZvsGrX5fX8roM/grgBb9bdTBFbU+8RkWbF7bfNoKwqO+c4INIk5olJi7gPEVFj+N
 1D2NvBw/bvnBGna/2BLAGbg2dWn8nHz2igfhSNJ0=
Date: Sun, 19 Mar 2023 15:14:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/19] drm/bridge: Convert to platform remove callback
 returning void
Message-ID: <20230319131400.GG10144@pendragon.ideasonboard.com>
References: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
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
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rahul T R <r-ravikumar@ti.com>, Robert Foss <rfoss@kernel.org>,
 kernel test robot <lkp@intel.com>, Sandor Yu <Sandor.yu@nxp.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Liu Ying <victor.liu@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jani Nikula <jani.nikula@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jayshri Pawar <jpawar@cadence.com>, Alex Deucher <alexander.deucher@amd.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

Thank you for the patches.

On Sat, Mar 18, 2023 at 08:07:45PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> this series adapts the platform drivers below drivers/gpu/drm/bridge to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver core
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warning. The
> device is removed anyhow and an early return from .remove() usually yields a
> resource leak.
> 
> By changing the remove callback to return void driver authors cannot
> reasonably assume any more that there is some kind of cleanup later.
> 
> The first patch simplifies the cdns-mhdp8546 driver to return zero in its
> remove callback unconditionally and thenn all drivers are trivially converted
> using coccinelle.
> 
> Only patch #3 depends on patch #1, the other are pairwise independant and can
> be applied individually.

For patches 02/19 to 19/19,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> Uwe Kleine-König (19):
>   drm/bridge: cdns-mhdp8546: Improve error reporting in remove callback
>   drm/bridge: cdns-dsi: Convert to platform remove callback returning
>     void
>   drm/bridge: cdns-mhdp8546: Convert to platform remove callback
>     returning void
>   drm/bridge: display-connector: Convert to platform remove callback
>     returning void
>   drm/bridge: fsl-ldb: Convert to platform remove callback returning
>     void
>   drm/bridge: imx8qm-ldb: Convert to platform remove callback returning
>     void
>   drm/bridge: imx8qxp-ldb: Convert to platform remove callback returning
>     void
>   drm/bridge: imx8qxp-pixel-combiner: Convert to platform remove
>     callback returning void
>   drm/bridge: imx8qxp-pixel-link: Convert to platform remove callback
>     returning void
>   drm/bridge: imx8qxp-pxl2dpi: Convert to platform remove callback
>     returning void
>   drm/bridge: lvds-codec: Convert to platform remove callback returning
>     void
>   drm/bridge: nwl-dsi: Convert to platform remove callback returning
>     void
>   drm/bridge: simple-bridg: Convert to platform remove callback
>     returning void
>   drm/bridge: dw-hdmi-ahb-audio: Convert to platform remove callback
>     returning void
>   drm/bridge: dw-hdmi-cec: Convert to platform remove callback returning
>     void
>   drm/bridge: dw-hdmi-gp-audio: Convert to platform remove callback
>     returning void
>   drm/bridge: dw-hdmi-i2s-audio: Convert to platform remove callback
>     returning void
>   drm/bridge: thc63lvd1024: Convert to platform remove callback
>     returning void
>   drm/bridge: ti-tfp410: Convert to platform remove callback returning
>     void
> 
>  .../gpu/drm/bridge/cadence/cdns-dsi-core.c    |  6 ++---
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 22 +++++++++----------
>  drivers/gpu/drm/bridge/display-connector.c    |  6 ++---
>  drivers/gpu/drm/bridge/fsl-ldb.c              |  6 ++---
>  drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c   |  6 ++---
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c  |  6 ++---
>  .../drm/bridge/imx/imx8qxp-pixel-combiner.c   |  6 ++---
>  .../gpu/drm/bridge/imx/imx8qxp-pixel-link.c   |  6 ++---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c  |  6 ++---
>  drivers/gpu/drm/bridge/lvds-codec.c           |  6 ++---
>  drivers/gpu/drm/bridge/nwl-dsi.c              |  5 ++---
>  drivers/gpu/drm/bridge/simple-bridge.c        |  6 ++---
>  .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |  6 ++---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c |  6 ++---
>  .../drm/bridge/synopsys/dw-hdmi-gp-audio.c    |  6 ++---
>  .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   |  6 ++---
>  drivers/gpu/drm/bridge/thc63lvd1024.c         |  6 ++---
>  drivers/gpu/drm/bridge/ti-tfp410.c            |  6 ++---
>  18 files changed, 44 insertions(+), 79 deletions(-)
> 
> 
> base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6

-- 
Regards,

Laurent Pinchart
