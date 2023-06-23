Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ECA73B8CC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 15:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716BA10E11D;
	Fri, 23 Jun 2023 13:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBCF10E084
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 13:29:29 +0000 (UTC)
Received: from notapiano (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 38A836607135;
 Fri, 23 Jun 2023 14:29:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687526966;
 bh=f25KcXi6OI+LncvpOIXHkVRpkniDYC2VeUuLYp3b3hU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GLoJELngos//bZbPLg0c9rK5fE1moLGbuBfaJuukcPv1OZHhXtJXzQnO0p0SuSOSF
 YflGSif3EVcWaJZPQ/Ss7JdCihtzPiVnNyq+OC26k7ddMYw7tZ/MUbSoetTk0UXqhi
 z+e892o09ky/Aokfifx2YsCjZetTknHB+KY/NQHuba0upMz6yD0oqxMFENcShbyNNj
 UchGt5ZzYuaboFhGI7oKokhZLWtUqkYXbOoQn6aUl3MWWSBvTi2iTX7LAkNT35qi7e
 Dv6a5IT46JGNvrCfhXDp5b0Hk/i5kngBTBrhUXKw8vNCSoKG7FWEah0ylUhmSVxIhc
 CWsdwwA/U3w5w==
Date: Fri, 23 Jun 2023 09:29:21 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 9/9] drm/mediatek: dp: Add support for embedded
 DisplayPort aux-bus
Message-ID: <d7d8db9c-a646-46f7-ab88-d41184b51f26@notapiano>
References: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com>
 <20230404104800.301150-10-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230404104800.301150-10-angelogioacchino.delregno@collabora.com>
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 04, 2023 at 12:48:00PM +0200, AngeloGioacchino Del Regno wrote:
> For the eDP case we can support using aux-bus on MediaTek DP: this
> gives us the possibility to declare our panel as generic "panel-edp"
> which will automatically configure the timings and available modes
> via the EDID that we read from it.
> 
> To do this, move the panel parsing at the end of the probe function
> so that the hardware is initialized beforehand and also initialize
> the DPTX AUX block and power both on as, when we populate the
> aux-bus, the panel driver will trigger an EDID read to perform
> panel detection.
> 
> Last but not least, since now the AUX transfers can happen in the
> separated aux-bus, it was necessary to add an exclusion for the
> cable_plugged_in check in `mtk_dp_aux_transfer()` and the easiest
> way to do this is to simply ignore checking that when the bridge
> type is eDP.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 61 ++++++++++++++++++++++++++-----
>  1 file changed, 51 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index a67143c22024..8109f5b4392b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
[..]
> @@ -2571,6 +2585,33 @@ static int mtk_dp_probe(struct platform_device *pdev)
>  	mtk_dp->need_debounce = true;
>  	timer_setup(&mtk_dp->debounce_timer, mtk_dp_debounce_timer, 0);
>  
> +	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP) {
> +		/* Initialize, reset and poweron the DPTX AUX block */
> +		mtk_dp_initialize_aux_settings(mtk_dp);
> +		mtk_dp_power_enable(mtk_dp);
> +
> +		/* Power on the panel to allow EDID read from aux-bus */
> +		mtk_dp_aux_panel_poweron(mtk_dp, true);
> +
> +		ret = devm_of_dp_aux_populate_bus(&mtk_dp->aux, NULL);

This patch causes

.../bin/aarch64-none-linux-gnu-ld: Unexpected GOT/PLT entries detected!
.../bin/aarch64-none-linux-gnu-ld: Unexpected run-time procedure linkages detected!
.../bin/aarch64-none-linux-gnu-ld: drivers/gpu/drm/mediatek/mtk_dp.o: in function `mtk_dp_probe':
.../drivers/gpu/drm/mediatek/mtk_dp.c:2595: undefined reference to `devm_of_dp_aux_populate_bus'

You need

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index b451dee64d34..76cab28e010c 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -26,6 +26,7 @@ config DRM_MEDIATEK_DP
        select PHY_MTK_DP
        select DRM_DISPLAY_HELPER
        select DRM_DISPLAY_DP_HELPER
+       select DRM_DP_AUX_BUS
        help
          DRM/KMS Display Port driver for MediaTek SoCs.

Thanks,
Nícolas
