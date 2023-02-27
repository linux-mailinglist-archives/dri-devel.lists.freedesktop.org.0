Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0446A4A59
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 19:55:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E59C10E2D7;
	Mon, 27 Feb 2023 18:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5879410E2D7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 18:55:33 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 91B6D855BA;
 Mon, 27 Feb 2023 19:55:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1677524130;
 bh=E861D54LC89IWgWGotPbhsLkIG/NE6uWTRBN78eGiQk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CXrx7+qWmpXzhcYyJ7Vcurt0zY1maLILyMiJGH/ubDIYcv48MazNJB3cv4M6u0fL0
 SqW06gWa+RsZSiUlf0U/SYBGCxnPw2ZW60qg1vAf23bd0Xl0xOmBeN4ch7aOgIRO/U
 qN0SHvRb23Sk6BoZYoZMwukif59XCeROJc2/zLDKYToT0kossAHHfmxGKm4bm/aZIC
 6QbVuyx7PHsOQrNbjJn8V3Fy1oTnzRN/vtYxFntb5Wv1zgKynFp/rKH2OVNrfHEVsd
 7DphXB0kg8YkLv++AY0MNW7kY649ZEvSgJdhnkyVdIRWS8zxVH6JUHnNx6QuNaClVL
 MGGeXMJ8p6H8g==
Message-ID: <3c2f91d3-0406-7730-d4e4-c94868f23c91@denx.de>
Date: Mon, 27 Feb 2023 19:55:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge
 find helper
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-5-jagan@amarulasolutions.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230227113925.875425-5-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/27/23 12:39, Jagan Teki wrote:
> drm_of_dsi_find_panel_or_bridge is capable of looking up the
> downstream DSI bridge and panel and trying to add a panel bridge
> if the panel is found.
> 
> Replace explicit finding calls with drm_of_dsi_find_panel_or_bridge
> followed with drmm_panel_bridge_add.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v13, v12, v11:
> - none
> Changes for v10:
> - new patch
> 
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 +++++++++++++------------
>   1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index df15501b1075..12a6dd987e8f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -25,6 +25,7 @@
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_bridge.h>
>   #include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
>   #include <drm/drm_panel.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_probe_helper.h>
> @@ -1470,24 +1471,26 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>   	struct device *dev = dsi->dev;
>   	struct drm_encoder *encoder = &dsi->encoder;
>   	struct drm_device *drm = encoder->dev;
> +	struct drm_bridge *bridge;
>   	struct drm_panel *panel;
>   	int ret;
>   
> -	panel = of_drm_find_panel(device->dev.of_node);
> -	if (!IS_ERR(panel)) {
> -		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> -	} else {
> -		dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
> -		if (!dsi->out_bridge)
> -			dsi->out_bridge = ERR_PTR(-EINVAL);
> -	}

As far as I understand this from my conversation with Maxime (please put 
him on CC of V15), the change here should instead perform the panel look 
up NOT in exynos_dsi_host_attach() , but in exynos_dsi_bind() , i.e. in 
the component_ops .bind callback . Here is an example of correct 
implementation:

https://cgit.freedesktop.org/drm-misc/tree/drivers/gpu/drm/vc4/vc4_dsi.c#n1805

In 14/18 patch, the same should be added to generic_dsim_register_host() 
, which is called from the driver .probe() callback, but that is OK.

With that implemented, you shouldn't need patches 1,2,3/18 anymore , so 
they can be dropped . And with this fixed, I think the driver should be 
good to be picked.

Please correct me if I'm wrong here.
