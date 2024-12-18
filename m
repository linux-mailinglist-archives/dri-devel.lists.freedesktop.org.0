Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A569F63CA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 11:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7B010EB5E;
	Wed, 18 Dec 2024 10:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MOR7AJOB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [IPv6:2a01:4f8:201:9162::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA75A10EB5E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 10:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734519019;
 bh=oGgC9oycAjxPPy/SBy9D/NSqW18Oioyb09NNhwqpJdw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MOR7AJOBZ98MiYL1dBZSzsTUv7nl9bV8vRzLbVsse3ryM42ry1YaYsQ9lZxOkKkyQ
 t1EouF0fCKhOtNbyJ6jDNEUqKM7ME+R3AydHRvASrQDjWBtJ6rIB7MfSzvF7+isKot
 MKHf/vfqSV92YFiLp9RyC2VogGSyb0uL+cT5E8Q/uGNXiCcSQ/PpEfbBjyV2yaWBul
 75jAIYxCwCQj7z3PK1yDD0WdPyXVvuBn+XX9QL2mTjnRYGKKfR6JscothrCnszcGvr
 JZUVIFPMLOqlYJG8wMZi/VMQwsxr6kZKftdzgcpgCfETHFv2znRymGIaAACuNwc2VG
 pUDlwnbn3tlvw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6920A17E3611;
 Wed, 18 Dec 2024 11:50:18 +0100 (CET)
Message-ID: <46f871e3-bb1e-4bee-95f3-2121c6a6eef7@collabora.com>
Date: Wed, 18 Dec 2024 11:50:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: stop selecting foreign drivers
To: Arnd Bergmann <arnd@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 CK Hu <ck.hu@mediatek.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Zimmermann <tzimmermann@suse.de>, Chen-Yu Tsai <wenst@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241218085837.2670434-1-arnd@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241218085837.2670434-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Il 18/12/24 09:58, Arnd Bergmann ha scritto:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The PHY portion of the mediatek hdmi driver was originally part of
> the driver it self and later split out into drivers/phy, which a
> 'select' to keep the prior behavior.
> 
> However, this leads to build failures when the PHY driver cannot
> be built:
> 
> WARNING: unmet direct dependencies detected for PHY_MTK_HDMI
>    Depends on [n]: (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK [=y] && OF [=y] && REGULATOR [=n]
>    Selected by [m]:
>    - DRM_MEDIATEK_HDMI [=m] && HAS_IOMEM [=y] && DRM [=m] && DRM_MEDIATEK [=m]
> ERROR: modpost: "devm_regulator_register" [drivers/phy/mediatek/phy-mtk-hdmi-drv.ko] undefined!
> ERROR: modpost: "rdev_get_drvdata" [drivers/phy/mediatek/phy-mtk-hdmi-drv.ko] undefined!
> 
> The best option here is to just not select the phy driver and leave that
> up to the defconfig. Do the same for the other PHY and memory drivers
> selected here as well for consistency.
> 
> Fixes: a481bf2f0ca4 ("drm/mediatek: Separate mtk_hdmi_phy to an independent module")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

The problem is - no PHY no party, it's not going to work without... but I get the
reasons behind this change.

Are we sure that we can't just add a `depends on PHY_MTK_xxxx` (or extend
depends on DRM_MEDIATEK && PHY_MTK_xxx)?

Cheers,
Angelo

> ---
>   drivers/gpu/drm/mediatek/Kconfig | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
> index 1c2f56b75716..1d4f20a4f265 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -15,9 +15,6 @@ config DRM_MEDIATEK
>   	select DRM_BRIDGE_CONNECTOR
>   	select DRM_MIPI_DSI
>   	select DRM_PANEL
> -	select MEMORY
> -	select MTK_SMI
> -	select PHY_MTK_MIPI_DSI
>   	select VIDEOMODE_HELPERS
>   	help
>   	  Choose this option if you have a Mediatek SoCs.
> @@ -28,7 +25,6 @@ config DRM_MEDIATEK
>   config DRM_MEDIATEK_DP
>   	tristate "DRM DPTX Support for MediaTek SoCs"
>   	depends on DRM_MEDIATEK
> -	select PHY_MTK_DP
>   	select DRM_DISPLAY_HELPER
>   	select DRM_DISPLAY_DP_HELPER
>   	select DRM_DISPLAY_DP_AUX_BUS
> @@ -39,6 +35,5 @@ config DRM_MEDIATEK_HDMI
>   	tristate "DRM HDMI Support for Mediatek SoCs"
>   	depends on DRM_MEDIATEK
>   	select SND_SOC_HDMI_CODEC if SND_SOC
> -	select PHY_MTK_HDMI
>   	help
>   	  DRM/KMS HDMI driver for Mediatek SoCs

