Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DA79F84F1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 20:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B5910E2AF;
	Thu, 19 Dec 2024 19:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD17510E2AF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 19:57:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B7A21D13
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 11:58:07 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BA00D3F58B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 11:57:38 -0800 (PST)
Date: Thu, 19 Dec 2024 19:57:23 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i2c: move TDA drivers under drivers/gpu/drm/bridge
Message-ID: <Z2R6o6pptzcR6Xt2@e110455-lin.cambridge.arm.com>
References: <20241215-drm-move-tda998x-v1-0-7817122b1d73@linaro.org>
 <20241215-drm-move-tda998x-v1-2-7817122b1d73@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241215-drm-move-tda998x-v1-2-7817122b1d73@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 15, 2024 at 01:09:08PM +0200, Dmitry Baryshkov wrote:
> TDA998x is the HDMI bridge driver, incorporating drm_connector and
> optional drm_encoder (created via the component bind API by the TICLDC
> and HDLCD drivers). Thus it should be residing together with the other
> DRM bridge drivers under drivers/gpu/drm/bridge/.
> 
> TDA9950 is an I2C-CEC translator, being present on-die on the TDA9989
> and TDA19989 chips, so it is being instantiated by the TDA998x driver.
> Move it together with the TDA998x under bridge drivers subdir.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  MAINTAINERS                                       |  2 +-
>  drivers/gpu/drm/arm/Kconfig                       |  1 +
>  drivers/gpu/drm/bridge/Kconfig                    |  2 ++
>  drivers/gpu/drm/bridge/Makefile                   |  1 +
>  drivers/gpu/drm/bridge/tda/Kconfig                | 13 +++++++++++++
>  drivers/gpu/drm/bridge/tda/Makefile               |  4 ++++
>  drivers/gpu/drm/{i2c => bridge/tda}/tda9950.c     |  0
>  drivers/gpu/drm/{i2c => bridge/tda}/tda998x_drv.c |  0
>  drivers/gpu/drm/i2c/Kconfig                       | 13 -------------
>  drivers/gpu/drm/i2c/Makefile                      |  4 ----
>  10 files changed, 22 insertions(+), 18 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9a23e80abf309cbd918a74683895f8dbe0507a6e..a4c7afd564e721e14aebaf828b75776e50760a45 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16982,7 +16982,7 @@ M:	Russell King <linux@armlinux.org.uk>
>  S:	Maintained
>  T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-tda998x-devel
>  T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-tda998x-fixes
> -F:	drivers/gpu/drm/i2c/tda998x_drv.c
> +F:	drivers/gpu/drm/bridge/tda/tda998x_drv.c
>  F:	include/dt-bindings/display/tda998x.h
>  K:	"nxp,tda998x"
>  
> diff --git a/drivers/gpu/drm/arm/Kconfig b/drivers/gpu/drm/arm/Kconfig
> index c901ac00c0c3a8f356bd53d97305c6b39b3e6662..ed3ed617c6884876368c8bd072c53f1b710df443 100644
> --- a/drivers/gpu/drm/arm/Kconfig
> +++ b/drivers/gpu/drm/arm/Kconfig
> @@ -9,6 +9,7 @@ config DRM_HDLCD
>  	select DRM_CLIENT_SELECTION
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_DMA_HELPER
> +	select DRM_BRIDGE # for TDA998x
>  	help
>  	  Choose this option if you have an ARM High Definition Colour LCD
>  	  controller.

For the above change:

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 6b4664d91faa80f096ac6a0548ed342e802ae68b..1ef16dcc2ae53eb172604de2d6899004c080a979 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -438,4 +438,6 @@ source "drivers/gpu/drm/bridge/imx/Kconfig"
>  
>  source "drivers/gpu/drm/bridge/synopsys/Kconfig"
>  
> +source "drivers/gpu/drm/bridge/tda/Kconfig"
> +
>  endmenu
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 97304b429a530c108dcbff906965cda091b0a7a2..52e6c9b3094bba0fd6aaf28af1b58f4bd8bf26d0 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -43,3 +43,4 @@ obj-y += analogix/
>  obj-y += cadence/
>  obj-y += imx/
>  obj-y += synopsys/
> +obj-y += tda/
> diff --git a/drivers/gpu/drm/bridge/tda/Kconfig b/drivers/gpu/drm/bridge/tda/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..5f13e4ffc24eeaa8dd0015c7e84d0dbac93e170c
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/tda/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config DRM_I2C_NXP_TDA998X
> +	tristate "NXP Semiconductors TDA998X HDMI encoder"
> +	default m if DRM_TILCDC
> +	select CEC_CORE if CEC_NOTIFIER
> +	select SND_SOC_HDMI_CODEC if SND_SOC
> +	help
> +	  Support for NXP Semiconductors TDA998X HDMI encoders.
> +
> +config DRM_I2C_NXP_TDA9950
> +	tristate "NXP Semiconductors TDA9950/TDA998X HDMI CEC"
> +	select CEC_NOTIFIER
> +	select CEC_CORE
> diff --git a/drivers/gpu/drm/bridge/tda/Makefile b/drivers/gpu/drm/bridge/tda/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..31fd35527d99d7eb23851d290175a3ff0c756772
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/tda/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +tda998x-y := tda998x_drv.o
> +obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
> +obj-$(CONFIG_DRM_I2C_NXP_TDA9950) += tda9950.o
> diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/bridge/tda/tda9950.c
> similarity index 100%
> rename from drivers/gpu/drm/i2c/tda9950.c
> rename to drivers/gpu/drm/bridge/tda/tda9950.c
> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/bridge/tda/tda998x_drv.c
> similarity index 100%
> rename from drivers/gpu/drm/i2c/tda998x_drv.c
> rename to drivers/gpu/drm/bridge/tda/tda998x_drv.c
> diff --git a/drivers/gpu/drm/i2c/Kconfig b/drivers/gpu/drm/i2c/Kconfig
> index 6f19e1c35e30b0e595c1a60628a6b8cf313fcabc..3205cdb827b95209a4bba9fb126ad2df27ddbdfb 100644
> --- a/drivers/gpu/drm/i2c/Kconfig
> +++ b/drivers/gpu/drm/i2c/Kconfig
> @@ -20,17 +20,4 @@ config DRM_I2C_SIL164
>  	  when used in pairs) TMDS transmitters, used in some nVidia
>  	  video cards.
>  
> -config DRM_I2C_NXP_TDA998X
> -	tristate "NXP Semiconductors TDA998X HDMI encoder"
> -	default m if DRM_TILCDC
> -	select CEC_CORE if CEC_NOTIFIER
> -	select SND_SOC_HDMI_CODEC if SND_SOC
> -	help
> -	  Support for NXP Semiconductors TDA998X HDMI encoders.
> -
> -config DRM_I2C_NXP_TDA9950
> -	tristate "NXP Semiconductors TDA9950/TDA998X HDMI CEC"
> -	select CEC_NOTIFIER
> -	select CEC_CORE
> -
>  endmenu
> diff --git a/drivers/gpu/drm/i2c/Makefile b/drivers/gpu/drm/i2c/Makefile
> index a962f6f085686674ed33010345730db776815ebe..1df3869491e277ca210368c4e48efe6d11af62b6 100644
> --- a/drivers/gpu/drm/i2c/Makefile
> +++ b/drivers/gpu/drm/i2c/Makefile
> @@ -4,7 +4,3 @@ obj-$(CONFIG_DRM_I2C_CH7006) += ch7006.o
>  
>  sil164-y := sil164_drv.o
>  obj-$(CONFIG_DRM_I2C_SIL164) += sil164.o
> -
> -tda998x-y := tda998x_drv.o
> -obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
> -obj-$(CONFIG_DRM_I2C_NXP_TDA9950) += tda9950.o
> 
> -- 
> 2.39.5
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
