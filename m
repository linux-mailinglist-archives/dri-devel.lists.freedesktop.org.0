Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6C076FB58
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 09:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB1610E6C0;
	Fri,  4 Aug 2023 07:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 432 seconds by postgrey-1.36 at gabe;
 Fri, 04 Aug 2023 07:46:02 UTC
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6EF10E6B6
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 07:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 5F95CFB03;
 Fri,  4 Aug 2023 09:38:33 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b8W9eJmQqxIH; Fri,  4 Aug 2023 09:38:32 +0200 (CEST)
Date: Fri, 4 Aug 2023 09:38:29 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] drm: bridge: for GENERIC_PHY_MIPI_DPHY also select
 GENERIC_PHY
Message-ID: <ZMyq9e/On2wzSJWj@qwark.sigxcpu.org>
References: <20230804030140.21395-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230804030140.21395-1-rdunlap@infradead.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aleksandr Nogikh <nogikh@google.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Chiras <robert.chiras@nxp.com>, Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Thu, Aug 03, 2023 at 08:01:37PM -0700, Randy Dunlap wrote:
> Three DRM bridge drivers select GENERIC_PHY_MIPI_DPHY when GENERIC_PHY
> might not be set.  This causes Kconfig warnings and a build error.
> 
> WARNING: unmet direct dependencies detected for GENERIC_PHY_MIPI_DPHY
>   Depends on [n]: GENERIC_PHY [=n]
>   Selected by [y]:
>   - DRM_NWL_MIPI_DSI [=y] && DRM_BRIDGE [=y] && DRM [=y] && COMMON_CLK [=y] && OF [=y] && HAS_IOMEM [=y]
>   - DRM_SAMSUNG_DSIM [=y] && DRM [=y] && DRM_BRIDGE [=y] && COMMON_CLK [=y] && OF [=y] && HAS_IOMEM [=y]
> 
> (drm/bridge/cadence/Kconfig was found by inspection.)
> 
> aarch64-linux-ld: drivers/gpu/drm/bridge/samsung-dsim.o: in function `samsung_dsim_set_phy_ctrl':
> drivers/gpu/drm/bridge/samsung-dsim.c:731: undefined reference to `phy_mipi_dphy_get_default_config_for_hsclk'
> 
> Prevent these warnings and build error by also selecting GENERIC_PHY
n> whenever selecting GENERIC_PHY_MIPI_DPHY.
> 
> Fixes: fced5a364dee ("drm/bridge: cdns: Convert to phy framework")
> Fixes: 44cfc6233447 ("drm/bridge: Add NWL MIPI DSI host controller support")
> Fixes: 171b3b1e0f8b ("drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: Aleksandr Nogikh <nogikh@google.com>
> Link: lore.kernel.org/r/20230803144227.2187749-1-nogikh@google.com
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Guido Günther <agx@sigxcpu.org>
> Cc: Robert Chiras <robert.chiras@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/Kconfig         |    2 ++
>  drivers/gpu/drm/bridge/cadence/Kconfig |    1 +
>  2 files changed, 3 insertions(+)
> 
> diff -- a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
> --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> @@ -4,6 +4,7 @@ config DRM_CDNS_DSI
>  	select DRM_KMS_HELPER
>  	select DRM_MIPI_DSI
>  	select DRM_PANEL_BRIDGE
> +	select GENERIC_PHY
>  	select GENERIC_PHY_MIPI_DPHY
>  	depends on OF
>  	help
> diff -- a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -181,6 +181,7 @@ config DRM_NWL_MIPI_DSI
>  	select DRM_KMS_HELPER
>  	select DRM_MIPI_DSI
>  	select DRM_PANEL_BRIDGE
> +	select GENERIC_PHY
>  	select GENERIC_PHY_MIPI_DPHY
>  	select MFD_SYSCON
>  	select MULTIPLEXER
> @@ -227,6 +228,7 @@ config DRM_SAMSUNG_DSIM
>  	select DRM_KMS_HELPER
>  	select DRM_MIPI_DSI
>  	select DRM_PANEL_BRIDGE
> +	select GENERIC_PHY
>  	select GENERIC_PHY_MIPI_DPHY
>  	help
>  	  The Samsung MIPI DSIM bridge controller driver.
> 

For NWL:

Reviewed-by: Guido Günther <agx@sigxcpu.org>

Cheers,
  -- Guido
