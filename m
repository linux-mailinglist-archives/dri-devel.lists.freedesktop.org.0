Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB33D1ACEA6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 19:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5886E83E;
	Thu, 16 Apr 2020 17:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3DE6E83E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 17:24:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1F8B97D;
 Thu, 16 Apr 2020 19:24:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1587057888;
 bh=n96mzpZtECYxDWfSDMueCKOeosR0PhwZDxdep4i2jmI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JFrpxmOXiWHzXnwDoyiRONCycIkNUzJYgNmk635T7FlC9y2jc/AlXdflLh+I/WI+s
 rFk4kGJdsGPl0HQEAP8Id2du0KeHQn3uIN6nEo6+fX0ijONqcCJOgGXH/zoBXkwaHN
 Y0NErElmPG3LoFsHaCFdRq+/Buhl9BCJ71y7rcoM=
Date: Thu, 16 Apr 2020 20:24:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v2 3/7] drm/mediatek: mtk_dsi: Rename bridge to next_bridge
Message-ID: <20200416172435.GM4796@pendragon.ideasonboard.com>
References: <20200416155720.2360443-1-enric.balletbo@collabora.com>
 <20200416155720.2360443-4-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416155720.2360443-4-enric.balletbo@collabora.com>
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Enric,

Thank you for the patch.

On Thu, Apr 16, 2020 at 05:57:15PM +0200, Enric Balletbo i Serra wrote:
> This is really a cosmetic change just to make a bit more readable the
> code after convert the driver to drm_bridge. The bridge variable name
> will be used by the encoder drm_bridge, and the chained bridge will be
> named next_bridge.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v2: None
> 
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index cfa45d6abd74..44ee884cc31c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -182,7 +182,7 @@ struct mtk_dsi {
>  	struct drm_encoder encoder;
>  	struct drm_connector conn;
>  	struct drm_panel *panel;
> -	struct drm_bridge *bridge;
> +	struct drm_bridge *next_bridge;
>  	struct phy *phy;
>  
>  	void __iomem *regs;
> @@ -903,8 +903,9 @@ static int mtk_dsi_create_conn_enc(struct drm_device *drm, struct mtk_dsi *dsi)
>  	dsi->encoder.possible_crtcs = 1;
>  
>  	/* If there's a bridge, attach to it and let it create the connector */

Maybe s/bridge/next bridge/ here ? I expect this comment to go away
though, as there will always be a next bridge when the driver switches
to the DRM panel bridge helper.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> -	if (dsi->bridge) {
> -		ret = drm_bridge_attach(&dsi->encoder, dsi->bridge, NULL, 0);
> +	if (dsi->next_bridge) {
> +		ret = drm_bridge_attach(&dsi->encoder, dsi->next_bridge, NULL,
> +					0);
>  		if (ret) {
>  			DRM_ERROR("Failed to attach bridge to drm\n");
>  			goto err_encoder_cleanup;
> @@ -1185,7 +1186,7 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
> -					  &dsi->panel, &dsi->bridge);
> +					  &dsi->panel, &dsi->next_bridge);
>  	if (ret)
>  		goto err_unregister_host;
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
