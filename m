Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1575D01D1D
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FFF10E6CE;
	Thu,  8 Jan 2026 09:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="nOZjhSGv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F9110E6C9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 09:26:28 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20260108092626euoutp013d01ab574719ee5d1444640b4d931ea8~It0sJx7FI1585915859euoutp019
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 09:26:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20260108092626euoutp013d01ab574719ee5d1444640b4d931ea8~It0sJx7FI1585915859euoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1767864386;
 bh=io0xTwVt1oqlUEGWR6QSRVhCIuX7eetJ8xM4bSEezoQ=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=nOZjhSGv1YGPvHr2Zl/9q3doGkRmNn1kOdXWDHSasXIgoxcOPbcE/uu36cwS6kJlt
 GXbiCODlqjU4qXU1e8GXDz4jUwwkcLE+QU8RUt22ePOWK5UYAfHxKHiY0rz2X/2D/s
 Ys9Uro5lSKsJQtJjfFYLRTuVsbRSIKJF+NOvKqog=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20260108092625eucas1p11ea9ec4b425f965756e20ce868d978f5~It0rPVBLS1910219102eucas1p1U;
 Thu,  8 Jan 2026 09:26:25 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260108092623eusmtip237d8c787e2565d8b21a713976d5c8430~It0pFdj_i2540125401eusmtip2B;
 Thu,  8 Jan 2026 09:26:23 +0000 (GMT)
Message-ID: <be425ab8-1772-46fb-84ee-0c8840c3eef2@samsung.com>
Date: Thu, 8 Jan 2026 10:26:22 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 10/12] drm/bridge: samsung-dsim:
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
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-10-283d7bba061a@bootlin.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260108092625eucas1p11ea9ec4b425f965756e20ce868d978f5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260107131416eucas1p22557f62e9d6498e5fdda4e6280cfe793
X-EPHeader: CA
X-CMS-RootMailID: 20260107131416eucas1p22557f62e9d6498e5fdda4e6280cfe793
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
 <CGME20260107131416eucas1p22557f62e9d6498e5fdda4e6280cfe793@eucas1p2.samsung.com>
 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-10-283d7bba061a@bootlin.com>
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

On 07.01.2026 14:13, Luca Ceresoli wrote:
> In preparation to handle refcounting of the out_bridge, we need to ensure
> the out_bridge pointer contains either a valid bridge pointer or NULL, not
> an ERR_PTR. Otherwise calls such as drm_bridge_get/put() would try to
> redeference an ERR_PTR.
>
> As a preliminary cleanup, add a temporary local 'next_bridge' pointer and
> only copy it in dsi->out_bridge when returning successfully.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index eabc4c32f6ab..b3003aa49dc3 100644
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
> @@ -1967,6 +1968,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>   	dsi->lanes = device->lanes;
>   	dsi->format = device->format;
>   	dsi->mode_flags = device->mode_flags;
> +	dsi->out_bridge = next_bridge;
>   

This assignment is too late, dsi->out_bridge is used (indirectly, by 
samsung_dsim_attach() called from drm_bridge_attach()) by

ret = pdata->host_ops->attach(dsi, device);

a few lines before this assignment, so the following fix has to be added:

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c 
b/drivers/gpu/drm/bridge/samsung-dsim.c index b3003aa49dc3..f88aa8ab2879 
100644 --- a/drivers/gpu/drm/bridge/samsung-dsim.c +++ 
b/drivers/gpu/drm/bridge/samsung-dsim.c @@ -1959,6 +1959,7 @@ static int 
samsung_dsim_host_attach(struct mipi_dsi_host *host, return ret; } + 
dsi->out_bridge = next_bridge; if (pdata->host_ops && 
pdata->host_ops->attach) { ret = pdata->host_ops->attach(dsi, device); 
if (ret) @@ -1968,7 +1969,6 @@ static int 
samsung_dsim_host_attach(struct mipi_dsi_host *host, dsi->lanes = 
device->lanes; dsi->format = device->format; dsi->mode_flags = 
device->mode_flags; - dsi->out_bridge = next_bridge; return 0; }

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

