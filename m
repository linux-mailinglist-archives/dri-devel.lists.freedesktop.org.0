Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 679DF9F20B0
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 21:29:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12B910E2B2;
	Sat, 14 Dec 2024 20:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ONu7iTlN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8B010E2AA;
 Sat, 14 Dec 2024 20:29:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45881741;
 Sat, 14 Dec 2024 21:29:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1734208141;
 bh=QTxXMH5UTUUuT8FLw/plrPNbZtUIWNZsmAa68YVMRHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ONu7iTlNyG1ZQpIOSNGJ23rDxpj23rUct2etRutHVxFCDahfz4d4F+3R2YYWy3eTe
 C/H6jcaYnamkjGwe6qr2a/zKtGjZU0HSNmFa4fOKZrt1rEO3n7/pSgKUoxm07aISL8
 WMqYIJ1pQ9KL2qX+21vKLyaubPOFgCMCsz5sskl8=
Date: Sat, 14 Dec 2024 22:29:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/nouveau: incorporate I2C TV encoder drivers
Message-ID: <20241214202920.GC8294@pendragon.ideasonboard.com>
References: <20241214-nouveau-encoder-slave-v1-0-beda767472e3@linaro.org>
 <20241214-nouveau-encoder-slave-v1-1-beda767472e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241214-nouveau-encoder-slave-v1-1-beda767472e3@linaro.org>
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

Hi Dmitry,

Thank you for the patch.

On Sat, Dec 14, 2024 at 05:35:44PM +0200, Dmitry Baryshkov wrote:
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
>  drivers/gpu/drm/i2c/Kconfig                          | 18 ------------------
>  drivers/gpu/drm/i2c/Makefile                         |  6 ------
>  drivers/gpu/drm/nouveau/Kconfig                      | 20 ++++++++++++++++++++
>  drivers/gpu/drm/nouveau/dispnv04/Kbuild              |  2 ++
>  drivers/gpu/drm/nouveau/dispnv04/dfp.c               |  2 +-
>  .../gpu/drm/{ => nouveau/dispnv04}/i2c/ch7006_drv.c  |  0
>  .../gpu/drm/{ => nouveau/dispnv04}/i2c/ch7006_mode.c |  0
>  .../gpu/drm/{ => nouveau/dispnv04}/i2c/ch7006_priv.h |  3 ++-
>  .../gpu/drm/{ => nouveau/dispnv04}/i2c/sil164_drv.c  |  3 ++-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv04.c            |  2 +-
>  .../gpu/drm/nouveau/include}/i2c/ch7006.h            |  0
>  .../gpu/drm/nouveau/include}/i2c/sil164.h            |  0
>  12 files changed, 28 insertions(+), 28 deletions(-)
> 
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

You need to update the defconfigs files to rename the Kconfig symbols there
too.

> +	tristate "Chrontel ch7006 TV encoder"
> +	depends on DRM_NOUVEAU
> +	default m
> +	help
> +	  Support for Chrontel ch7006 and similar TV encoders, found
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

I don't see this file being added in this series.

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
> index 052bdc48a339df47073ab305f224f96c8630d66c..c66ca7f525034bb9fd113c5edf10c371a01c3c79 100644
> --- a/drivers/gpu/drm/i2c/ch7006_priv.h
> +++ b/drivers/gpu/drm/nouveau/dispnv04/i2c/ch7006_priv.h
> @@ -29,7 +29,8 @@
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
> similarity index 100%
> rename from include/drm/i2c/ch7006.h
> rename to drivers/gpu/drm/nouveau/include/i2c/ch7006.h
> diff --git a/include/drm/i2c/sil164.h b/drivers/gpu/drm/nouveau/include/i2c/sil164.h
> similarity index 100%
> rename from include/drm/i2c/sil164.h
> rename to drivers/gpu/drm/nouveau/include/i2c/sil164.h
> 

-- 
Regards,

Laurent Pinchart
