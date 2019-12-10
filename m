Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F311186F6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 12:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AA56E064;
	Tue, 10 Dec 2019 11:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 355 seconds by postgrey-1.36 at gabe;
 Tue, 10 Dec 2019 11:47:22 UTC
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130FE6E064
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 11:47:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 507ED28B5FF
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 0/4] Genericize DW MIPI DSI bridge and
 add i.MX 6 driver
In-Reply-To: <20191202193359.703709-1-adrian.ratiu@collabora.com>
References: <20191202193359.703709-1-adrian.ratiu@collabora.com>
Date: Tue, 10 Dec 2019 13:41:46 +0200
Message-ID: <871rtc2yrp.fsf@collabora.com>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-imx@nxp.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 02 Dec 2019, Adrian Ratiu <adrian.ratiu@collabora.com> 
wrote:
> Having a generic Synopsis DesignWare MIPI-DSI host controller 
> bridge driver is a very good idea, however the current 
> implementation has hardcoded quite a lot of the register layouts 
> used by the two supported SoC vendors, STM and Rockchip, which 
> use IP cores v1.30 and v1.31. 
> 
> This makes it hard to support other SoC vendors like the FSL/NXP 
> i.MX 6 which use older v1.01 cores or future versions because, 
> based on history, layout changes should also be expected in new 
> DSI versions / SoCs. 
> 
> This patch series converts the bridge and platform drivers to 
> access registers via generic regmap APIs and allows each 
> platform driver to configure its register layout via struct 
> reg_fields, then adds support for the host controller found on 
> i.MX 6. 
> 
> I only have i.MX hardware with MIPI-DSI panel and relevant 
> documentation available for testing so I'll really appreciate it 
> if someone could test the series on Rockchip and 
> STM... eyeballing register fields could only get me so far, so 
> sorry in advance for any breakage! 
> 
> Many thanks to Boris Brezillon <boris.brezillon@collabora.com> 
> for suggesting the regmap solution and to Liu Ying 
> <Ying.Liu@freescale.com> for doing the initial i.MX platform 
> driver implementation. 
> 
> This series applies on top of latest linux-next tree, 
> next-20191202. 
> 
> v3 -> v4: 
>   * Added commmit message to dt-binding patch (Neil) * Converted 
>   the dt-binding to yaml dt-schema format (Neil) * Small DT node 
>   + driver fixes (Rob) * Renamed platform driver to reflect it's 
>   only for i.MX v6 (Fabio) * Added small panel example to the 
>   host controller DT binding 
> 
> v2 -> v3: 
>   * Added const declarations to dw-mipi-dsi.c structs (Emil) * 
>   Fixed Reviewed-by tags and cc'd some more relevant ML (Emil) 
> 
> v1 -> v2: 
>   * Moved register definitions & regmap initialization into 
>   bridge module. Platform drivers get the regmap via plat_data 
>   after calling the bridge probe (Emil). 

I've been told I forgot to explicitly CC some of the maintainers, 
sorry about that! Added a few more persons to CC.

>
> Adrian Ratiu (4):
>   drm: bridge: dw_mipi_dsi: access registers via a regmap
>   drm: bridge: dw_mipi_dsi: abstract register access using reg_fields
>   drm: imx: Add i.MX 6 MIPI DSI host driver
>   dt-bindings: display: add i.MX6 MIPI DSI host controller doc
>
>  .../display/imx/fsl,mipi-dsi-imx6.yaml        | 136 ++++
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 699 +++++++++++++-----
>  drivers/gpu/drm/imx/Kconfig                   |   7 +
>  drivers/gpu/drm/imx/Makefile                  |   1 +
>  drivers/gpu/drm/imx/dw_mipi_dsi-imx6.c        | 378 ++++++++++
>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |  17 +-
>  drivers/gpu/drm/stm/dw_mipi_dsi-stm.c         |  34 +-
>  include/drm/bridge/dw_mipi_dsi.h              |   2 +-
>  8 files changed, 1067 insertions(+), 207 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml
>  create mode 100644 drivers/gpu/drm/imx/dw_mipi_dsi-imx6.c
>
> -- 
> 2.24.0
>
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
