Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620B6D07F37
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:49:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AA910E30A;
	Fri,  9 Jan 2026 08:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="Mqvi6VnS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDE410E30A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 08:49:26 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20260109084924euoutp023ec869c3927ea8d9fce54d12de9f6335~JA9o3t4qV2815928159euoutp02y
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 08:49:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20260109084924euoutp023ec869c3927ea8d9fce54d12de9f6335~JA9o3t4qV2815928159euoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1767948564;
 bh=c/SwZOTAWGRjC/jOsnr+JcML73MY8MIOtSVDjsJsr/A=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=Mqvi6VnSI+CqaxNhSov0BFfWfW+NPRCSr1KW/RSAFYA+1Gf5MHNWUTkWA5+dY08NO
 m5CIBzPkCWZtBAdfRdTe2inPqn7yJPtVIdr2GNdToUf9Iuvq3SQZ3bcyMPo2SH9YbV
 yxqsWKXsar1KHHVBKWzgrPmCi0k1q2Ailkga0CYM=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20260109084923eucas1p1f8f659a0971bb13f38e8358bdec8a393~JA9oVbnXV2402824028eucas1p1U;
 Fri,  9 Jan 2026 08:49:23 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260109084922eusmtip2df18ddfed878c3c954ee6deb52bb639c~JA9m9Osqh0432004320eusmtip2H;
 Fri,  9 Jan 2026 08:49:22 +0000 (GMT)
Message-ID: <11d08a53-44b2-48c0-8fc4-8b633e72b1ba@samsung.com>
Date: Fri, 9 Jan 2026 09:49:21 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 10/12] drm/bridge: samsung-dsim:
 samsung_dsim_host_attach: use a temporary variable for the next bridge
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
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-10-8bad3ef90b9f@bootlin.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260109084923eucas1p1f8f659a0971bb13f38e8358bdec8a393
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260109074009eucas1p21117b6a8a2eba825ebad7b77bd19efd4
X-EPHeader: CA
X-CMS-RootMailID: 20260109074009eucas1p21117b6a8a2eba825ebad7b77bd19efd4
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
 <CGME20260109074009eucas1p21117b6a8a2eba825ebad7b77bd19efd4@eucas1p2.samsung.com>
 <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-10-8bad3ef90b9f@bootlin.com>
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
> In preparation to handle refcounting of the out_bridge, we need to ensure
> the out_bridge pointer contains either a valid bridge pointer or NULL, not
> an ERR_PTR. Otherwise calls such as drm_bridge_get/put() would try to
> redeference an ERR_PTR.
>
> As a preliminary cleanup, add a temporary local 'next_bridge' pointer and
> only copy it in dsi->out_bridge as late as possible, i.e. just before
> calling pdata->host_ops->attach() which uses it (only in the exynos
> driver).
>
> Not strictly needed, but for symmetry move the clearing of dsi->out_bridge
> in samsung_dsim_host_detach() to after pdata->host_ops->detach().
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>
> Changes in v2:
> - fix "pointer set too late" bug (NULL pointer deref in the exynos case)
> - *not* add Acked-by: Maxime as the patch has changed
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 26 +++++++++++++++++---------
>   1 file changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index eabc4c32f6ab..8dd058124e93 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1886,6 +1886,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>   {
>   	struct samsung_dsim *dsi = host_to_dsi(host);
>   	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
> +	struct drm_bridge *next_bridge;
>   	struct device *dev = dsi->dev;
>   	struct device_node *np = dev->of_node;
>   	struct device_node *remote;
> @@ -1924,17 +1925,17 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>   
>   	panel = of_drm_find_panel(remote);
>   	if (!IS_ERR(panel)) {
> -		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> +		next_bridge = devm_drm_panel_bridge_add(dev, panel);
>   	} else {
> -		dsi->out_bridge = of_drm_find_bridge(remote);
> -		if (!dsi->out_bridge)
> -			dsi->out_bridge = ERR_PTR(-EINVAL);
> +		next_bridge = of_drm_find_bridge(remote);
> +		if (!next_bridge)
> +			next_bridge = ERR_PTR(-EINVAL);
>   	}
>   
>   	of_node_put(remote);
>   
> -	if (IS_ERR(dsi->out_bridge)) {
> -		ret = PTR_ERR(dsi->out_bridge);
> +	if (IS_ERR(next_bridge)) {
> +		ret = PTR_ERR(next_bridge);
>   		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
>   		return ret;
>   	}
> @@ -1958,10 +1959,13 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>   			return ret;
>   	}
>   
> +	// The next bridge can be used by host_ops->attach
> +	dsi->out_bridge = next_bridge;
> +
>   	if (pdata->host_ops && pdata->host_ops->attach) {
>   		ret = pdata->host_ops->attach(dsi, device);
>   		if (ret)
> -			return ret;
> +			goto err_release_next_bridge;
>   	}
>   
>   	dsi->lanes = device->lanes;
> @@ -1969,6 +1973,10 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>   	dsi->mode_flags = device->mode_flags;
>   
>   	return 0;
> +
> +err_release_next_bridge:
> +	dsi->out_bridge = NULL;
> +	return ret;
>   }
>   
>   static void samsung_dsim_unregister_te_irq(struct samsung_dsim *dsi)
> @@ -1985,11 +1993,11 @@ static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
>   	struct samsung_dsim *dsi = host_to_dsi(host);
>   	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
>   
> -	dsi->out_bridge = NULL;
> -
>   	if (pdata->host_ops && pdata->host_ops->detach)
>   		pdata->host_ops->detach(dsi, device);
>   
> +	dsi->out_bridge = NULL;
> +
>   	samsung_dsim_unregister_te_irq(dsi);
>   
>   	drm_bridge_remove(&dsi->bridge);
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

