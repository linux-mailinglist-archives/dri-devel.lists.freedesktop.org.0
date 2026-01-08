Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A04D01F0E
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10ED10E6E3;
	Thu,  8 Jan 2026 09:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="UTRxRKAk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C481C10E6E3
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 09:51:20 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20260108095119euoutp012e7ad1462b8b6546e4cff164dba8ea55~IuKaJVawL1372713727euoutp01r;
 Thu,  8 Jan 2026 09:51:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20260108095119euoutp012e7ad1462b8b6546e4cff164dba8ea55~IuKaJVawL1372713727euoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1767865879;
 bh=qIhgIeQrfxHoSwY6/8Qg78ZyXWur/EQhKlbMMeWRoFE=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=UTRxRKAkfvHrYXb9uuCmebd05iS7yvKrvvnJwRrRGhnYTQOLlD9QO1+EdwnMJ+ehI
 u+g5bCtH0fF1cWkIawNRR2L1XBWHErXWwnjERy/ax6OfO/jSXefKZQPQG4zziy4O0D
 g+iU8AvXlmt/VOaAS6kHTAjcr9t0XASl+sQYc+ow=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20260108095118eucas1p1a2ae95ae60fa870c35c955b087ba4649~IuKZz7bdM1725517255eucas1p1B;
 Thu,  8 Jan 2026 09:51:18 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260108095116eusmtip22f2b99fa0f4ed0d118e1c4afbe18750f~IuKXrldR10240202402eusmtip2j;
 Thu,  8 Jan 2026 09:51:16 +0000 (GMT)
Message-ID: <af154ebb-53b9-40eb-8ff9-089ed8bc3f04@samsung.com>
Date: Thu, 8 Jan 2026 10:51:15 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 5/6] drm/exynos: hdmi: convert to
 of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-5-ef48a517828e@bootlin.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260108095118eucas1p1a2ae95ae60fa870c35c955b087ba4649
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260107164213eucas1p21ed81372d4acebdf02a825b66b0e75de
X-EPHeader: CA
X-CMS-RootMailID: 20260107164213eucas1p21ed81372d4acebdf02a825b66b0e75de
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com>
 <CGME20260107164213eucas1p21ed81372d4acebdf02a825b66b0e75de@eucas1p2.samsung.com>
 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-5-ef48a517828e@bootlin.com>
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

On 07.01.2026 17:22, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   drivers/gpu/drm/exynos/exynos_hdmi.c | 4 +++-

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 01813e11e6c6..bfcf2fa62fe1 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -1779,7 +1779,7 @@ static int hdmi_bridge_init(struct hdmi_context *hdata)
>   		return -EINVAL;
>   	}
>   
> -	hdata->bridge = of_drm_find_bridge(np);
> +	hdata->bridge = of_drm_find_and_get_bridge(np);
>   	of_node_put(np);
>   
>   	if (!hdata->bridge)
> @@ -2096,6 +2096,8 @@ static void hdmi_remove(struct platform_device *pdev)
>   
>   	put_device(&hdata->ddc_adpt->dev);
>   
> +	drm_bridge_put(hdata->bridge);
> +
>   	mutex_destroy(&hdata->mutex);
>   }
>   
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

