Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A846D4A3219
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jan 2022 22:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E60A10E147;
	Sat, 29 Jan 2022 21:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1A110E147
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 21:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=Y6GP8wuCVrMbh1L90jUb2V1yBKObZZXodauMSz2sdnY=; b=N0fJp10Cdyb2JHaUfPeXLwA/7y
 GUrK03zc35hx2x40Zde5A/7SOy4RFaDIIVaI1/FLAObVod0sZAEhKy3DQaDrMDJCSorq+9SoC8AyL
 974UM/8BiwU+uHEh8vYXPuQK7JbCV648cGCNWZ5e/U21KdjMw7EBhqI7Qy7OswkO2QYkDBasnqocK
 Hytdm1sFv/r2MBBrUQ4XswJgMOwjJlXAyN5JjFIKZLrOTroH4Vo5lSSkkLdKOaB4XYcGQhjurhT/T
 rnvkFaeEM5tEHNBQsBVndj1EHveSCu/NMx+qNBSufeBkOh5mBwWExm2o0PG4SliPOc9bMRAvw79D8
 q7g+2jnQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDvZT-004yRY-UH; Sat, 29 Jan 2022 21:47:50 +0000
Message-ID: <606c84f4-cad0-7223-da7f-4ec48e93360e@infradead.org>
Date: Sat, 29 Jan 2022 13:47:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/1] drm/lsdc: add drm driver for loongson display
 controller
Content-Language: en-US
To: suijingfeng <suijingfeng@loongson.cn>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Roland Scheidegger <sroland@vmware.com>,
 Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20220129203357.1613654-1-suijingfeng@loongson.cn>
 <20220129203357.1613654-2-suijingfeng@loongson.cn>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220129203357.1613654-2-suijingfeng@loongson.cn>
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
Cc: Sui Jingfeng <15330273260@189.cn>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi--

On 1/29/22 12:33, suijingfeng wrote:
> diff --git a/drivers/gpu/drm/lsdc/Kconfig b/drivers/gpu/drm/lsdc/Kconfig
> new file mode 100644
> index 000000000000..744009dfcdde
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/Kconfig
> @@ -0,0 +1,32 @@
> +config DRM_LSDC
> +	tristate "DRM Support for loongson's display controller"
> +	depends on DRM && PCI
> +	depends on MACH_LOONGSON64 || LOONGARCH || MIPS || COMPILE_TEST
> +	select OF
> +	select CMA if HAVE_DMA_CONTIGUOUS
> +	select DMA_CMA if HAVE_DMA_CONTIGUOUS
> +	select DRM_KMS_HELPER
> +	select DRM_KMS_FB_HELPER
> +	select DRM_GEM_CMA_HELPER
> +	select VIDEOMODE_HELPERS
> +	select BACKLIGHT_PWM if CPU_LOONGSON2K
> +	select I2C_GPIO if CPU_LOONGSON2K
> +	select I2C_LS2X if CPU_LOONGSON2K
> +	default m
> +	help
> +	  This is a KMS driver for the display controller in the LS7A1000
> +	  bridge chip and LS2K1000 SoC. The display controller have two

	                                                       has two

> +	  display pipes and it is a pci device.

	                            PCI device.

> +	  When using it on LS2K1000/LS2K0500 SoC, its framebuffer is
> +	  located at system memory.
> +	  If "M" is selected, the module will be called lsdc.
> +
> +	  If in doubt, say "Y".
> +
> +config DRM_LSDC_VRAM_DRIVER
> +	bool "vram helpper based device driver support"

	           helper

> +	depends on DRM_LSDC
> +	select DRM_VRAM_HELPER
> +	default y
> +	help
> +	  If in doubt, say "n".

-- 
~Randy
