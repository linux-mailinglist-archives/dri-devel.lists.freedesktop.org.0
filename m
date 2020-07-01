Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 434A1210A3B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 13:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715156E890;
	Wed,  1 Jul 2020 11:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F02D6E890
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 11:23:08 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3BBDA27DAFB;
 Wed,  1 Jul 2020 12:23:06 +0100 (BST)
Date: Wed, 1 Jul 2020 13:23:03 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [RESEND PATCH 1/3] drm/mediatek: mtk_dpi: Rename bridge to
 next_bridge
Message-ID: <20200701132303.047ea605@collabora.com>
In-Reply-To: <20200518173909.2259259-2-enric.balletbo@collabora.com>
References: <20200518173909.2259259-1-enric.balletbo@collabora.com>
 <20200518173909.2259259-2-enric.balletbo@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, drinkcat@chromium.org,
 narmstrong@baylibre.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, linux-mediatek@lists.infradead.org,
 laurent.pinchart@ideasonboard.com, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 May 2020 19:39:07 +0200
Enric Balletbo i Serra <enric.balletbo@collabora.com> wrote:

> This is really a cosmetic change just to make a bit more readable the
> code after convert the driver to drm_bridge. The bridge variable name
> will be used by the encoder drm_bridge, and the chained bridge will be
> named next_bridge.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
> 
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 7fbfa95bab09..7112125dc3d1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -61,7 +61,7 @@ enum mtk_dpi_out_color_format {
>  struct mtk_dpi {
>  	struct mtk_ddp_comp ddp_comp;
>  	struct drm_encoder encoder;
> -	struct drm_bridge *bridge;
> +	struct drm_bridge *next_bridge;

Did you consider moving the drm_of_find_panel_or_bridge() call to
mtk_dpi_bind() so you can get rid of this field?

This makes we realize there's no refcounting on bridges, which means
the bridge can vanish between the drm_of_find_panel_or_bridge() and
drm_bridge_attach() calls :-/.

>  	void __iomem *regs;
>  	struct device *dev;
>  	struct clk *engine_clk;
> @@ -607,7 +607,7 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
>  	/* Currently DPI0 is fixed to be driven by OVL1 */
>  	dpi->encoder.possible_crtcs = BIT(1);
>  
> -	ret = drm_bridge_attach(&dpi->encoder, dpi->bridge, NULL, 0);
> +	ret = drm_bridge_attach(&dpi->encoder, dpi->next_bridge, NULL, 0);
>  	if (ret) {
>  		dev_err(dev, "Failed to attach bridge: %d\n", ret);
>  		goto err_cleanup;
> @@ -747,11 +747,11 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
> -					  NULL, &dpi->bridge);
> +					  NULL, &dpi->next_bridge);
>  	if (ret)
>  		return ret;
>  
> -	dev_info(dev, "Found bridge node: %pOF\n", dpi->bridge->of_node);
> +	dev_info(dev, "Found bridge node: %pOF\n", dpi->next_bridge->of_node);
>  
>  	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DPI);
>  	if (comp_id < 0) {

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
