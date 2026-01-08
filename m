Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764F3D05B7C
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 20:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62BE10E7BD;
	Thu,  8 Jan 2026 19:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="OZcb6i7K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C381210E7B1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 19:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=0xTYPYEZSyUOR4owbPfE3fSToiJ/CPOSgdHTNpnvRAc=; b=OZcb6i7Kq0PC81CDhI9KMTImkq
 NobBuzSsnV6t0TfjHzeNm+x67CZVPP5uBcyHc0kSLopeR1utT7FGxlTDD8uG8NbSSAS7gWhAPWpKx
 FuJVPHFhrQQl/VUhczvxZkbK50oKF2E3eRdOwLyuyO/CxV8LEDjMGguYoFPbqVXKoPMdr2nMvf4U1
 JpJ2XUYL9staaJyK8EbqDYTfCkJereVgwZHMq7DZxumaGSv6K544FBd7EvrA9HrT+EVPOsWgK+1Hu
 lyOIpQI6HjfPQxhhqDk21aqx70ZH3dYd8SBa+K4F/fNkXDpCi5Dd3lQwE4IJ8xQZzxQZP5/furfah
 GZD4Zn4A==;
Received: from [192.76.154.230] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vdvIU-001XS9-BV; Thu, 08 Jan 2026 20:03:50 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Chaoyi Chen <kernel@airkyi.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH 8/9] drm/rockchip: Drop ROCKCHIP_IOMMU depend for
 DRM_ROCKCHIP
Date: Thu, 08 Jan 2026 20:03:50 +0100
Message-ID: <4072834.X9hSmTKtgW@phil>
In-Reply-To: <20251106020632.92-9-kernel@airkyi.com>
References: <20251106020632.92-1-kernel@airkyi.com>
 <20251106020632.92-9-kernel@airkyi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Am Donnerstag, 6. November 2025, 03:06:31 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Chaoyi Chen:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>=20
> On the RK3506 platform, there is no iommu hardware. And even on
> platform that have iommu hardware, it should be possible to use
> VOP without enabling iommu. In this case, a contiguous memory
> space like CMA should be used.
>=20
> So this patch removes the dependency on ROCKCHIP_IOMMU.
>=20
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  drivers/gpu/drm/rockchip/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/=
Kconfig
> index b7b025814e72..a056d419190c 100644
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig
> @@ -1,7 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_ROCKCHIP
>  	tristate "DRM Support for Rockchip"
> -	depends on DRM && ROCKCHIP_IOMMU
> +	depends on DRM
> +	depends on ROCKCHIP_IOMMU || !ROCKCHIP_IOMMU

I don't really understand this yes+no line :-)

Can't you just
=2D drop the dependency altogether
or
=2D do a depends on ROCKCHIP_IOMMU if ARM64


Heiko

>  	depends on OF
>  	select DRM_CLIENT_SELECTION
>  	select DRM_GEM_DMA_HELPER
>=20




