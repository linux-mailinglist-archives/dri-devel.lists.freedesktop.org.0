Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBB859CCD6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 02:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE55B18B0B1;
	Tue, 23 Aug 2022 00:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6393A7273
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 00:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=YehCBOjutGZZCPZs4zzc742FPYh7eE3HgoHPaQx9lx8=; b=Y7wP1d+yhFvu2DcYiUhvQeGnUi
 l2u8N5DFPiuIk98/POMKnuo2SrZN8A7yYc4g9DQ6IctsNm9bQO9Izd3JHnmBpdAmysvaq0B1r6F6a
 6wCg5Y5RjpDycFOtl00iU3MaiZQ6nnYwLA4gcMw4yTxLDPp8ebhm7BkRQe98v47krAziHlnDGwtw9
 WsYPs4370Ayy1cpuh81VYtYy7OqmdCvtOSK/tZ3S1wU1TX7dmKksQXFbaehtKrmDXOeG2g6Oe2IJH
 b8/goUIOxdTunfmxrBlAC1gB5vveUKlv3YOy20KP6SnEFEfOu7e1kccRwqKXWoFHKuwgtrfvyd0Bs
 nUueOh8w==;
Received: from [2601:1c0:6280:3f0::a6b3]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oQHRd-00GKuM-5M; Tue, 23 Aug 2022 00:07:09 +0000
Message-ID: <a5f03c19-faeb-9a64-a214-8f6a0552e8dc@infradead.org>
Date: Mon, 22 Aug 2022 17:06:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm: Move radeon and amdgpu Kconfig options into their
 directories
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220823000111.9765-1-afd@ti.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220823000111.9765-1-afd@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi--

On 8/22/22 17:01, Andrew Davis wrote:
> Most Kconfig options to enable a driver are in the Kconfig file
> inside the relevant directory, move these two to the same.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  drivers/gpu/drm/Kconfig            | 42 ------------------------------
>  drivers/gpu/drm/amd/amdgpu/Kconfig | 22 ++++++++++++++++
>  drivers/gpu/drm/radeon/Kconfig     | 22 ++++++++++++++++
>  3 files changed, 44 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 6c2256e8474b..24fa9ccd92a4 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -234,50 +234,8 @@ source "drivers/gpu/drm/i2c/Kconfig"
>  
>  source "drivers/gpu/drm/arm/Kconfig"
>  
> -config DRM_RADEON
> -	tristate "ATI Radeon"
> -	depends on DRM && PCI && MMU
> -	depends on AGP || !AGP
> -	select FW_LOADER
> -	select DRM_DISPLAY_DP_HELPER
> -	select DRM_DISPLAY_HELPER
> -        select DRM_KMS_HELPER
> -        select DRM_TTM
> -	select DRM_TTM_HELPER
> -	select POWER_SUPPLY
> -	select HWMON
> -	select BACKLIGHT_CLASS_DEVICE
> -	select INTERVAL_TREE
> -	help
> -	  Choose this option if you have an ATI Radeon graphics card.  There
> -	  are both PCI and AGP versions.  You don't need to choose this to
> -	  run the Radeon in plain VGA mode.
> -
> -	  If M is selected, the module will be called radeon.
> -
>  source "drivers/gpu/drm/radeon/Kconfig"
>  
> -config DRM_AMDGPU
> -	tristate "AMD GPU"
> -	depends on DRM && PCI && MMU
> -	select FW_LOADER
> -	select DRM_DISPLAY_DP_HELPER
> -	select DRM_DISPLAY_HDMI_HELPER
> -	select DRM_DISPLAY_HELPER
> -	select DRM_KMS_HELPER
> -	select DRM_SCHED
> -	select DRM_TTM
> -	select DRM_TTM_HELPER
> -	select POWER_SUPPLY
> -	select HWMON
> -	select BACKLIGHT_CLASS_DEVICE
> -	select INTERVAL_TREE
> -	select DRM_BUDDY
> -	help
> -	  Choose this option if you have a recent AMD Radeon graphics card.
> -
> -	  If M is selected, the module will be called amdgpu.
> -
>  source "drivers/gpu/drm/amd/amdgpu/Kconfig"
>  
>  source "drivers/gpu/drm/nouveau/Kconfig"
> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
> index 7777d55275de..36b1206124cf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> @@ -1,4 +1,26 @@
>  # SPDX-License-Identifier: MIT
> +
> +config DRM_AMDGPU
> +	tristate "AMD GPU"
> +	depends on DRM && PCI && MMU
> +	select FW_LOADER
> +	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_HDMI_HELPER
> +	select DRM_DISPLAY_HELPER
> +	select DRM_KMS_HELPER
> +	select DRM_SCHED
> +	select DRM_TTM
> +	select DRM_TTM_HELPER
> +	select POWER_SUPPLY
> +	select HWMON
> +	select BACKLIGHT_CLASS_DEVICE
> +	select INTERVAL_TREE
> +	select DRM_BUDDY
> +	help
> +	  Choose this option if you have a recent AMD Radeon graphics card.
> +
> +	  If M is selected, the module will be called amdgpu.
> +
>  config DRM_AMDGPU_SI
>  	bool "Enable amdgpu support for SI parts"
>  	depends on DRM_AMDGPU
> diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kconfig
> index 52819e7f1fca..3248d12c562d 100644
> --- a/drivers/gpu/drm/radeon/Kconfig
> +++ b/drivers/gpu/drm/radeon/Kconfig
> @@ -1,4 +1,26 @@
>  # SPDX-License-Identifier: MIT
> +
> +config DRM_RADEON
> +	tristate "ATI Radeon"
> +	depends on DRM && PCI && MMU
> +	depends on AGP || !AGP
> +	select FW_LOADER
> +	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_HELPER
> +        select DRM_KMS_HELPER
> +        select DRM_TTM

Would you change those 2 lines above to use one tab + 2 spaces
for indentation, please?

> +	select DRM_TTM_HELPER
> +	select POWER_SUPPLY
> +	select HWMON
> +	select BACKLIGHT_CLASS_DEVICE
> +	select INTERVAL_TREE
> +	help
> +	  Choose this option if you have an ATI Radeon graphics card.  There
> +	  are both PCI and AGP versions.  You don't need to choose this to
> +	  run the Radeon in plain VGA mode.
> +
> +	  If M is selected, the module will be called radeon.
> +
>  config DRM_RADEON_USERPTR
>  	bool "Always enable userptr support"
>  	depends on DRM_RADEON

-- 
~Randy
