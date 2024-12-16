Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B499F31CA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 14:43:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4899B10E68B;
	Mon, 16 Dec 2024 13:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hb1upfRo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CDAF10E687;
 Mon, 16 Dec 2024 13:43:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1A7845C4299;
 Mon, 16 Dec 2024 13:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88EC4C4CED0;
 Mon, 16 Dec 2024 13:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734356599;
 bh=e2opvldajuZelV/o6BcZbkHj/D8nGe5IIPLsT48a3kA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hb1upfRoPQAyrn/M5Mff3OXQCfmQFPW+gJolS8uBi76DkLLsxPQ1BnLMzDKyG5YJH
 k6ynsWFgSIc4pahXCvIZcz6SzWKLqhzBE2+57EzXrCsNjkSvz4WVo8dKs5l+8Fo2lb
 hkO+Jq9B69NWbnUs3spA625Wz54Cp7El1Fimapvu0t/bBIUUxBlqUqr2/cF7zvheN3
 NR+pNTJ01NC6O3DDEOag6Hm+fJImFM/5RAee0F77oiuxdSb50TpQdBVU6aM1NEIiRH
 SQXnNFtNE/MmioHDJinbITT+hXEeX0+1p3ZjXLi6DRiAzi9LbIFrZuyQmPOxTzRSnj
 J25rvpJ0PWusA==
Date: Mon, 16 Dec 2024 14:43:13 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/2] drm/nouveau: incorporate I2C TV encoder drivers
Message-ID: <Z2AucVR_QAWQp27S@cassiopeiae>
References: <20241215-nouveau-encoder-slave-v2-0-ef7a0e687242@linaro.org>
 <20241215-nouveau-encoder-slave-v2-1-ef7a0e687242@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241215-nouveau-encoder-slave-v2-1-ef7a0e687242@linaro.org>
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

On Sun, Dec 15, 2024 at 12:19:23PM +0200, Dmitry Baryshkov wrote:
> Chrontel CH7006 and Silicon Image sil164 drivers use drm_encoder_slave
> interface which is being used only by the nouveau driver. It doesn't
> make sense to keep this interface inside the DRM subsystem. In
> preparation to moving this set of helpers to the nouveau driver, move
> the only two I2C driver that use that interface to the nouveau driver
> too.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm/configs/multi_v7_defconfig                  |  4 ++--
>  arch/parisc/configs/generic-32bit_defconfig          |  4 ++--
>  arch/parisc/configs/generic-64bit_defconfig          |  4 ++--
>  drivers/gpu/drm/i2c/Kconfig                          | 18 ------------------
>  drivers/gpu/drm/i2c/Makefile                         |  6 ------
>  drivers/gpu/drm/nouveau/Kconfig                      | 20 ++++++++++++++++++++
>  drivers/gpu/drm/nouveau/dispnv04/Kbuild              |  2 ++
>  drivers/gpu/drm/nouveau/dispnv04/dfp.c               |  2 +-
>  drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild          |  5 +++++
>  .../gpu/drm/{ => nouveau/dispnv04}/i2c/ch7006_drv.c  |  0
>  .../gpu/drm/{ => nouveau/dispnv04}/i2c/ch7006_mode.c |  0
>  .../gpu/drm/{ => nouveau/dispnv04}/i2c/ch7006_priv.h |  7 ++++---
>  .../gpu/drm/{ => nouveau/dispnv04}/i2c/sil164_drv.c  |  3 ++-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv04.c            |  2 +-
>  .../gpu/drm/nouveau/include}/i2c/ch7006.h            |  4 ++--
>  .../gpu/drm/nouveau/include}/i2c/sil164.h            |  4 ++--

Please move this one (and the one above) to include/dispnv04/i2c/ch7006.h

>  16 files changed, 45 insertions(+), 40 deletions(-)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 9d4336261e450ce5bf99a1aa53e603bd7c0037bb..7fb24a4fb9f697c0c726204d0ba3754e87000e6a 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -713,10 +713,10 @@ CONFIG_VIDEO_ADV7604_CEC=y
>  CONFIG_VIDEO_ML86V7667=m
>  CONFIG_IMX_IPUV3_CORE=m
>  CONFIG_DRM=y
> -# CONFIG_DRM_I2C_CH7006 is not set
> -# CONFIG_DRM_I2C_SIL164 is not set
>  CONFIG_DRM_I2C_NXP_TDA998X=m
>  CONFIG_DRM_NOUVEAU=m
> +# CONFIG_DRM_NOUVEAU_CH7006 is not set
> +# CONFIG_DRM_NOUVEAU_SIL164 is not set
>  CONFIG_DRM_EXYNOS=m
>  CONFIG_DRM_EXYNOS_FIMD=y
>  CONFIG_DRM_EXYNOS_MIXER=y
> diff --git a/arch/parisc/configs/generic-32bit_defconfig b/arch/parisc/configs/generic-32bit_defconfig
> index 5ce258f3fffaf0e3aac5f8f5450dd65bad305879..f5fffc24c3bc5baf0d77b845e3ac77fae49b276e 100644
> --- a/arch/parisc/configs/generic-32bit_defconfig
> +++ b/arch/parisc/configs/generic-32bit_defconfig
> @@ -132,11 +132,11 @@ CONFIG_I2C=y
>  CONFIG_HWMON=m
>  CONFIG_DRM=m
>  CONFIG_DRM_DISPLAY_DP_AUX_CEC=y
> -# CONFIG_DRM_I2C_CH7006 is not set
> -# CONFIG_DRM_I2C_SIL164 is not set
>  CONFIG_DRM_RADEON=m
>  CONFIG_DRM_NOUVEAU=m
>  # CONFIG_DRM_NOUVEAU_BACKLIGHT is not set
> +# CONFIG_DRM_NOUVEAU_CH7006 is not set
> +# CONFIG_DRM_NOUVEAU_SIL164 is not set
>  CONFIG_DRM_VGEM=m
>  CONFIG_DRM_UDL=m
>  CONFIG_DRM_MGAG200=m
> diff --git a/arch/parisc/configs/generic-64bit_defconfig b/arch/parisc/configs/generic-64bit_defconfig
> index 19a804860ed5b355f82396c2314bd0d8f3fb768a..704f68fbf960fb865206c8f8ab1751c9f0db6de3 100644
> --- a/arch/parisc/configs/generic-64bit_defconfig
> +++ b/arch/parisc/configs/generic-64bit_defconfig
> @@ -193,11 +193,11 @@ CONFIG_MEDIA_SUPPORT=m
>  CONFIG_AGP=y
>  CONFIG_AGP_PARISC=y
>  CONFIG_DRM=y
> -# CONFIG_DRM_I2C_CH7006 is not set
> -# CONFIG_DRM_I2C_SIL164 is not set
>  CONFIG_DRM_RADEON=y
>  CONFIG_DRM_NOUVEAU=m
>  # CONFIG_DRM_NOUVEAU_BACKLIGHT is not set
> +# CONFIG_DRM_NOUVEAU_CH7006 is not set
> +# CONFIG_DRM_NOUVEAU_SIL164 is not set
>  CONFIG_DRM_MGAG200=m
>  CONFIG_FB=y
>  CONFIG_FB_PM2=m
> diff --git a/drivers/gpu/drm/i2c/Kconfig b/drivers/gpu/drm/i2c/Kconfig
> index 6f19e1c35e30b0e595c1a60628a6b8cf313fcabc..d5200f67958e68a8ec73401f1d3b79cbe0aa303d 100644
> --- a/drivers/gpu/drm/i2c/Kconfig
> +++ b/drivers/gpu/drm/i2c/Kconfig
> @@ -2,24 +2,6 @@
>  menu "I2C encoder or helper chips"
>       depends on DRM && DRM_KMS_HELPER && I2C
>  
> -config DRM_I2C_CH7006
> -	tristate "Chrontel ch7006 TV encoder"
> -	default m if DRM_NOUVEAU
> -	help
> -	  Support for Chrontel ch7006 and similar TV encoders, found
> -	  on some nVidia video cards.
> -
> -	  This driver is currently only useful if you're also using
> -	  the nouveau driver.
> -
> -config DRM_I2C_SIL164
> -	tristate "Silicon Image sil164 TMDS transmitter"
> -	default m if DRM_NOUVEAU
> -	help
> -	  Support for sil164 and similar single-link (or dual-link
> -	  when used in pairs) TMDS transmitters, used in some nVidia
> -	  video cards.
> -
>  config DRM_I2C_NXP_TDA998X
>  	tristate "NXP Semiconductors TDA998X HDMI encoder"
>  	default m if DRM_TILCDC
> diff --git a/drivers/gpu/drm/i2c/Makefile b/drivers/gpu/drm/i2c/Makefile
> index a962f6f085686674ed33010345730db776815ebe..31fd35527d99d7eb23851d290175a3ff0c756772 100644
> --- a/drivers/gpu/drm/i2c/Makefile
> +++ b/drivers/gpu/drm/i2c/Makefile
> @@ -1,10 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> -ch7006-y := ch7006_drv.o ch7006_mode.o
> -obj-$(CONFIG_DRM_I2C_CH7006) += ch7006.o
> -
> -sil164-y := sil164_drv.o
> -obj-$(CONFIG_DRM_I2C_SIL164) += sil164.o
> -
>  tda998x-y := tda998x_drv.o
>  obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
>  obj-$(CONFIG_DRM_I2C_NXP_TDA9950) += tda9950.o
> diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
> index ce840300578d8a4011c448b61caf830cef3805bf..4cffac26f90ae6130ef30ba389b2a8c9b732058c 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -109,3 +109,23 @@ config DRM_NOUVEAU_GSP_DEFAULT
>  	help
>  	  Say Y here if you want to use the GSP codepaths by default on
>  	  Turing and Ampere GPUs.
> +
> +config DRM_NOUVEAU_CH7006
> +	tristate "Chrontel ch7006 TV encoder"
> +	depends on DRM_NOUVEAU
> +	default m
> +	help
> +	  Support for Chrontel ch7006 and similar TV encoders, found

This help text should probably end right after "TV encoders".

> +	  on some nVidia video cards.
> +
> +	  This driver is currently only useful if you're also using
> +	  the nouveau driver.
> +
> +config DRM_NOUVEAU_SIL164
> +	tristate "Silicon Image sil164 TMDS transmitter"
> +	depends on DRM_NOUVEAU
> +	default m
> +	help
> +	  Support for sil164 and similar single-link (or dual-link
> +	  when used in pairs) TMDS transmitters, used in some nVidia
> +	  video cards.

I think we can remove everything after "TMDS transmitters".

> diff --git a/drivers/gpu/drm/nouveau/dispnv04/Kbuild b/drivers/gpu/drm/nouveau/dispnv04/Kbuild
> index 975c4e2269366d57e928eedbbbc669d24744379f..949802882ebd53c15e124c218a092af9693d36bc 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/Kbuild
> +++ b/drivers/gpu/drm/nouveau/dispnv04/Kbuild
> @@ -10,3 +10,5 @@ nouveau-y += dispnv04/overlay.o
>  nouveau-y += dispnv04/tvmodesnv17.o
>  nouveau-y += dispnv04/tvnv04.o
>  nouveau-y += dispnv04/tvnv17.o
> +
> +include $(src)/dispnv04/i2c/Kbuild
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/dfp.c b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
> index 504c421aa176ef3d944592a0109cb72e21fd47b7..28a42ab5cb900ebe8a526e154f9e90598333356c 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/dfp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
> @@ -35,7 +35,7 @@
>  #include "hw.h"
>  #include "nvreg.h"
>  
> -#include <drm/i2c/sil164.h>
> +#include <i2c/sil164.h>
>  
>  #include <subdev/i2c.h>
>  
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild b/drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild
> new file mode 100644
> index 0000000000000000000000000000000000000000..3fddfc97bcb399ef3821c6065e5868363883ac74
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild
> @@ -0,0 +1,5 @@
> +ch7006-y := dispnv04/i2c/ch7006_drv.o dispnv04/i2c/ch7006_mode.o
> +obj-$(CONFIG_DRM_NOUVEAU_CH7006) += ch7006.o
> +
> +sil164-y := dispnv04/i2c/sil164_drv.o
> +obj-$(CONFIG_DRM_NOUVEAU_SIL164) += sil164.o
> diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
> similarity index 100%
> rename from drivers/gpu/drm/i2c/ch7006_drv.c
> rename to drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c
> diff --git a/drivers/gpu/drm/i2c/ch7006_mode.c b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_mode.c
> similarity index 100%
> rename from drivers/gpu/drm/i2c/ch7006_mode.c
> rename to drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_mode.c
> diff --git a/drivers/gpu/drm/i2c/ch7006_priv.h b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_priv.h
> similarity index 99%
> rename from drivers/gpu/drm/i2c/ch7006_priv.h
> rename to drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_priv.h
> index 052bdc48a339df47073ab305f224f96c8630d66c..8136f8cd8f9b859ccf915e295c783f9fc8321c2e 100644
> --- a/drivers/gpu/drm/i2c/ch7006_priv.h
> +++ b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_priv.h
> @@ -24,12 +24,13 @@
>   *
>   */
>  
> -#ifndef __DRM_I2C_CH7006_PRIV_H__
> -#define __DRM_I2C_CH7006_PRIV_H__
> +#ifndef __NOUVEAU_I2C_CH7006_PRIV_H__
> +#define __NOUVEAU_I2C_CH7006_PRIV_H__
>  
>  #include <drm/drm_encoder_slave.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/i2c/ch7006.h>
> +
> +#include <i2c/ch7006.h>
>  
>  typedef int64_t fixed;
>  #define fixed1 (1LL << 32)
> diff --git a/drivers/gpu/drm/i2c/sil164_drv.c b/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c
> similarity index 99%
> rename from drivers/gpu/drm/i2c/sil164_drv.c
> rename to drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c
> index ff23422727fce290a188e495d343e32bc2c373ec..74fc961c0d0de06f1fe8dd93d351452cd20cead7 100644
> --- a/drivers/gpu/drm/i2c/sil164_drv.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c
> @@ -30,7 +30,8 @@
>  #include <drm/drm_encoder_slave.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/i2c/sil164.h>
> +
> +#include <i2c/sil164.h>
>  
>  struct sil164_priv {
>  	struct sil164_encoder_params config;
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
> index d3014027a8122be499b85459b038fdcce5800720..67f3e0ac0e109b223ca8ec4ddc4e688247373b2e 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
> @@ -32,7 +32,7 @@
>  #include "hw.h"
>  #include <drm/drm_modeset_helper_vtables.h>
>  
> -#include <drm/i2c/ch7006.h>
> +#include <i2c/ch7006.h>
>  
>  static struct nvkm_i2c_bus_probe nv04_tv_encoder_info[] = {
>  	{
> diff --git a/include/drm/i2c/ch7006.h b/drivers/gpu/drm/nouveau/include/i2c/ch7006.h
> similarity index 97%
> rename from include/drm/i2c/ch7006.h
> rename to drivers/gpu/drm/nouveau/include/i2c/ch7006.h
> index 5305b9797f938626c8f6c464ddc9bf424a39b4a0..1a6fa405f85b2a0d0f9a4d1c786defc527fa1d3b 100644
> --- a/include/drm/i2c/ch7006.h
> +++ b/drivers/gpu/drm/nouveau/include/i2c/ch7006.h
> @@ -24,8 +24,8 @@
>   *
>   */
>  
> -#ifndef __DRM_I2C_CH7006_H__
> -#define __DRM_I2C_CH7006_H__
> +#ifndef __NOUVEAU_I2C_CH7006_H__
> +#define __NOUVEAU_I2C_CH7006_H__
>  
>  /**
>   * struct ch7006_encoder_params
> diff --git a/include/drm/i2c/sil164.h b/drivers/gpu/drm/nouveau/include/i2c/sil164.h
> similarity index 96%
> rename from include/drm/i2c/sil164.h
> rename to drivers/gpu/drm/nouveau/include/i2c/sil164.h
> index ddf248693c8be8809777723c272f82af8d334c99..b86750d7abe1c2e7142eac32898398475fd42531 100644
> --- a/include/drm/i2c/sil164.h
> +++ b/drivers/gpu/drm/nouveau/include/i2c/sil164.h
> @@ -24,8 +24,8 @@
>   *
>   */
>  
> -#ifndef __DRM_I2C_SIL164_H__
> -#define __DRM_I2C_SIL164_H__
> +#ifndef __NOUVEAU_I2C_SIL164_H__
> +#define __NOUVEAU_I2C_SIL164_H__
>  
>  /**
>   * struct sil164_encoder_params
> 
> -- 
> 2.39.5
> 
