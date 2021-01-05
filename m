Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 596262EA4AA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 06:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D36589915;
	Tue,  5 Jan 2021 05:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C0A89915
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 05:15:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 474E43D7;
 Tue,  5 Jan 2021 06:15:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1609823736;
 bh=FNG1uOwG3LpbJXAdfWblkwR1yXexRcL+HDcTRT4pMHQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bwAR47nlD0TS1yszfYfxAS0L6gid9Q3h2G130z5X7fW1llDKCkNobebFfAomqdGyv
 dPFhYzYF51rZ8sMixnI/aZBAEC9pc/BgpoDAZIOupRCxTEIPuftQV32DAuv1xs/y/d
 vgih62SKApg91wWcRUsF8HC2SyNE9ZECdUjmfsOc=
Date: Tue, 5 Jan 2021 07:15:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: Use OF graph schema
Message-ID: <X/P17LVCwd/GPpIi@pendragon.ideasonboard.com>
References: <20210104180724.2275098-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210104180724.2275098-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thank you for the patch.

On Mon, Jan 04, 2021 at 11:07:23AM -0700, Rob Herring wrote:
> Now that we have a graph schema, rework the display related schemas to use
> it. Mostly this is adding a reference to graph.yaml and dropping duplicate
> parts from schemas.
> 
> In panel-common.yaml, 'ports' is dropped. Any binding using 'ports'
> should be one with more than 1 port node, and the binding must define
> what each port is.
> 
> Note that ti,sn65dsi86.yaml, ti,tfp410,yaml and toshiba,tc358768.yaml will
> need further updates to use video-interfaces.yaml once that lands.
> 
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v3:
>  - Rework based on graph.yaml changes. 'port' nodes now have a $ref and
>    endpoint nodes do too if they define additional properties.
>  - Convert ste,mcde.yaml
> 
> v2:
>  - Drop 'type: object' where we have a $ref
>  - Drop any common properties like 'reg', '#address-cells', "#size-cells',
>    'remote-endpoint'
>  - Keep description in ti,k2g-dss.yaml
> ---
>  .../allwinner,sun4i-a10-display-backend.yaml  |  23 +---
>  .../allwinner,sun4i-a10-display-frontend.yaml |  19 +--
>  .../display/allwinner,sun4i-a10-hdmi.yaml     |  19 +--
>  .../display/allwinner,sun4i-a10-tcon.yaml     |  25 +---
>  .../allwinner,sun4i-a10-tv-encoder.yaml       |   6 +-
>  .../display/allwinner,sun6i-a31-drc.yaml      |  19 +--
>  .../display/allwinner,sun6i-a31-mipi-dsi.yaml |   6 +-
>  .../allwinner,sun8i-a83t-de2-mixer.yaml       |  19 +--
>  .../display/allwinner,sun8i-a83t-dw-hdmi.yaml |  19 +--
>  .../display/allwinner,sun8i-r40-tcon-top.yaml | 110 ++----------------
>  .../display/allwinner,sun9i-a80-deu.yaml      |  19 +--
>  .../display/amlogic,meson-dw-hdmi.yaml        |   4 +-
>  .../bindings/display/amlogic,meson-vpu.yaml   |   4 +-
>  .../bindings/display/brcm,bcm2835-dpi.yaml    |   7 +-
>  .../display/bridge/analogix,anx7625.yaml      |   6 +-
>  .../display/bridge/analogix,anx7814.yaml      |  19 +--
>  .../bindings/display/bridge/anx6345.yaml      |  18 +--
>  .../display/bridge/cdns,mhdp8546.yaml         |  22 +---
>  .../display/bridge/chrontel,ch7033.yaml       |   6 +-
>  .../display/bridge/intel,keembay-dsi.yaml     |  14 +--
>  .../bindings/display/bridge/ite,it6505.yaml   |   2 +-
>  .../display/bridge/lontium,lt9611.yaml        |  70 ++---------
>  .../bindings/display/bridge/lvds-codec.yaml   |  18 +--
>  .../bindings/display/bridge/nwl-dsi.yaml      |  41 ++-----
>  .../bindings/display/bridge/ps8640.yaml       |  24 +---
>  .../bindings/display/bridge/renesas,lvds.yaml |  18 +--
>  .../display/bridge/simple-bridge.yaml         |  18 +--
>  .../display/bridge/snps,dw-mipi-dsi.yaml      |   7 +-
>  .../display/bridge/thine,thc63lvd1024.yaml    |  21 +---
>  .../bindings/display/bridge/ti,sn65dsi86.yaml |  45 +------
>  .../bindings/display/bridge/ti,tfp410.yaml    |  24 +---
>  .../display/bridge/toshiba,tc358762.yaml      |  52 +--------
>  .../display/bridge/toshiba,tc358768.yaml      |  48 +-------
>  .../display/bridge/toshiba,tc358775.yaml      |  19 +--
>  .../connector/analog-tv-connector.yaml        |   1 +
>  .../display/connector/dvi-connector.yaml      |   1 +
>  .../display/connector/hdmi-connector.yaml     |   1 +
>  .../display/connector/vga-connector.yaml      |   1 +
>  .../bindings/display/imx/nxp,imx8mq-dcss.yaml |   2 +-
>  .../bindings/display/ingenic,lcd.yaml         |  10 +-
>  .../display/intel,keembay-display.yaml        |   2 +-
>  .../display/panel/advantech,idk-2121wr.yaml   |  21 ++--
>  .../bindings/display/panel/panel-common.yaml  |  11 +-
>  .../rockchip/rockchip,rk3066-hdmi.yaml        |  16 +--
>  .../display/rockchip/rockchip-vop.yaml        |   5 +-
>  .../bindings/display/st,stm32-dsi.yaml        |  12 +-
>  .../bindings/display/st,stm32-ltdc.yaml       |   8 +-
>  .../devicetree/bindings/display/ste,mcde.yaml |   5 +-
>  .../bindings/display/ti/ti,am65x-dss.yaml     |  19 +--
>  .../bindings/display/ti/ti,j721e-dss.yaml     |  23 +---
>  .../bindings/display/ti/ti,k2g-dss.yaml       |   3 +-
>  51 files changed, 185 insertions(+), 747 deletions(-)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
