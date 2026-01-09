Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64430D07F64
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF68710E873;
	Fri,  9 Jan 2026 08:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="jl8V1hyT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13E510E873
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 08:50:12 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20260109085011euoutp01ce0160d8047f8c8ce45a4ad39b8a8970~JA_U1P68H2011020110euoutp01X
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 08:50:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20260109085011euoutp01ce0160d8047f8c8ce45a4ad39b8a8970~JA_U1P68H2011020110euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1767948611;
 bh=9nrTgJ1fPRBZ5eKN3EFtjQRxmnL67+4GleGznV0Og94=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=jl8V1hyTmZgKkfA3qNbL0xn6zKIaV16Qve4X078BJ/FWPkD8UM3JPkuFx9cWPe6RK
 VN0SNlmoAcPoLck1PQaLdDyIfkXH7CIXc72uzylh0hgq1zq1MbdmAxoiNgypK4ykKs
 qB36XKFfyUeij0edb1kcpKIQB/4i9uE5pFebbDk4=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20260109085011eucas1p2825c7d44757c204152e65965f5864715~JA_UXFXip0983509835eucas1p2V;
 Fri,  9 Jan 2026 08:50:11 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260109085009eusmtip20e7d4ebf0b633fecfd09193091d0f534~JA_S04kDD0959909599eusmtip2F;
 Fri,  9 Jan 2026 08:50:09 +0000 (GMT)
Message-ID: <ff9abc0f-c934-44a9-88ba-75265699b384@samsung.com>
Date: Fri, 9 Jan 2026 09:50:09 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 12/12] drm/bridge: samsung-dsim:
 samsung_dsim_host_attach: convert to of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philippe Cornu <philippe.cornu@st.com>,
 benjamin.gaignard@linaro.org, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Adrien
 Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-12-8bad3ef90b9f@bootlin.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260109085011eucas1p2825c7d44757c204152e65965f5864715
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260109073236eucas1p27fab1926761fc4058cc2a127c117e219
X-EPHeader: CA
X-CMS-RootMailID: 20260109073236eucas1p27fab1926761fc4058cc2a127c117e219
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
 <CGME20260109073236eucas1p27fab1926761fc4058cc2a127c117e219@eucas1p2.samsung.com>
 <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-12-8bad3ef90b9f@bootlin.com>
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

On 09.01.2026 08:31, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done. Also switch to the drm_bridge::next_bridge pointer.
>
> This needs to handle both cases: when of_drm_find_panel() succeeds and when
> it fails.
>
> In the 'else' case (i.e. when of_drm_find_panel() fails), just switch to
> of_drm_find_and_get_bridge() to ensure the bridge is not freed while in use
> in the function tail, when it is stored in dsi->bridge.next_bridge.
>
> In the 'then' case (i.e. when of_drm_find_panel() succeeds),
> devm_drm_panel_bridge_add() already increments the refcount using devres
> which ties the bridge allocation lifetime to the device lifetime, so we
> would not need to do anything. However to have the same behaviour in both
> branches take an additional reference here, so that the bridge needs to be
> put whichever branch is taken without more complicated logic. Ensure to
> clear the bridge pointer however, to avoid calling drm_bridge_put() on an
> ERR_PTR.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>
> Changes in v2:
> - updated after "pointer set too late" fix inprevious patch
> - *not* add Acked-by: Maxime as the patch has changed
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 20 +++++++++++++-------
>   include/drm/bridge/samsung-dsim.h     |  1 -
>   2 files changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index afaa63c4d3f7..1d85e706c74b 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1828,7 +1828,7 @@ static int samsung_dsim_attach(struct drm_bridge *bridge,
>   {
>   	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
>   
> -	return drm_bridge_attach(encoder, dsi->out_bridge, bridge,
> +	return drm_bridge_attach(encoder, dsi->bridge.next_bridge, bridge,
>   				 flags);
>   }
>   
> @@ -1886,7 +1886,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>   {
>   	struct samsung_dsim *dsi = host_to_dsi(host);
>   	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
> -	struct drm_bridge *next_bridge;
> +	struct drm_bridge *next_bridge __free(drm_bridge_put) = NULL;
>   	struct device *dev = dsi->dev;
>   	struct device_node *np = dev->of_node;
>   	struct device_node *remote;
> @@ -1926,10 +1926,14 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>   	panel = of_drm_find_panel(remote);
>   	if (!IS_ERR(panel)) {
>   		next_bridge = devm_drm_panel_bridge_add(dev, panel);
> -		if (IS_ERR(next_bridge))
> +		if (IS_ERR(next_bridge)) {
>   			ret = PTR_ERR(next_bridge);
> +			next_bridge = NULL; // Inhibit the cleanup action on an ERR_PTR
> +		} else {
> +			drm_bridge_get(next_bridge);
> +		}
>   	} else {
> -		next_bridge = of_drm_find_bridge(remote);
> +		next_bridge = of_drm_find_and_get_bridge(remote);
>   		if (!next_bridge)
>   			ret = -EINVAL;
>   	}
> @@ -1961,7 +1965,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>   	}
>   
>   	// The next bridge can be used by host_ops->attach
> -	dsi->out_bridge = next_bridge;
> +	dsi->bridge.next_bridge = drm_bridge_get(next_bridge);
>   
>   	if (pdata->host_ops && pdata->host_ops->attach) {
>   		ret = pdata->host_ops->attach(dsi, device);
> @@ -1976,7 +1980,8 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>   	return 0;
>   
>   err_release_next_bridge:
> -	dsi->out_bridge = NULL;
> +	drm_bridge_put(dsi->bridge.next_bridge);
> +	dsi->bridge.next_bridge = NULL;
>   	return ret;
>   }
>   
> @@ -1997,7 +2002,8 @@ static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
>   	if (pdata->host_ops && pdata->host_ops->detach)
>   		pdata->host_ops->detach(dsi, device);
>   
> -	dsi->out_bridge = NULL;
> +	drm_bridge_put(dsi->bridge.next_bridge);
> +	dsi->bridge.next_bridge = NULL;
>   
>   	samsung_dsim_unregister_te_irq(dsi);
>   
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
> index 31d7ed589233..03005e474704 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -100,7 +100,6 @@ struct samsung_dsim_plat_data {
>   struct samsung_dsim {
>   	struct mipi_dsi_host dsi_host;
>   	struct drm_bridge bridge;
> -	struct drm_bridge *out_bridge;
>   	struct device *dev;
>   	struct drm_display_mode mode;
>   
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

