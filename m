Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B08773BC78
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 18:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C7410E049;
	Fri, 23 Jun 2023 16:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8428410E049
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 16:22:35 +0000 (UTC)
Received: from notapiano (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0F11E6606FAE;
 Fri, 23 Jun 2023 17:22:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687537353;
 bh=7ufh3QSQZelZlqE69nvYEFnEQlmgPF5ndR8aBdUl7RA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zm83n3TmlG6sdOLSGE2tstkFReGP+gabya/uv7ySYx6QCRUKEeqFAHNrrewZbJB2M
 6RnU3WnaBJgqimnGRHudjaSsJ9SK/0kOkdBTyP8j1UZHe+IaoMPexshrDBXwIeWyCK
 ytj8n5/eQLckiazFKkg3ATnTEMQj1HWiKpxlFLUTRR3oKNbg+ya9g2wyU8dt+xyuch
 SVxj9jC9u4gCJErPDKAdGavlALWaykQDnX6ohEecE5VemfyDx21aIHyXaTdeP4MUIl
 BaE4mii3r/svmXRTAML7XtGZWcExsrvfSdwxnZ7Z0u6VHRziDGrkswxj7xt3jcG5V/
 ew/+sYJZcGeyg==
Date: Fri, 23 Jun 2023 12:22:27 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 9/9] drm/mediatek: dp: Add support for embedded
 DisplayPort aux-bus
Message-ID: <e9f5d773-0099-4ba7-a7f2-bfc1102f4340@notapiano>
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
> +
> +		/* If the panel is present, detection is done: power off! */
> +		mtk_dp_aux_panel_poweron(mtk_dp, false);
> +		mtk_dp_power_disable(mtk_dp);
> +
> +		/* We ignore -ENODEV error, as the panel may not be on aux-bus */
> +		if (ret && ret != -ENODEV)
> +			return ret;
> +
> +		/*
> +		 * Here we don't ignore any error, as if there's no panel to
> +		 * link, eDP is not configured correctly and will be unusable.
> +		 */
> +		ret = mtk_dp_edp_link_panel(&mtk_dp->aux);

This call might return EDEFER_PROBE if the panel hasn't probed yet. That's a
problem, because during this probe you register a device for the dp-phy, so
you'll be retriggering defer probes every time you probe until the panel probes.
But if this driver was builtin and the panel a module, then this loop will go on
forever.

You should make use of the done_probing callback in
devm_of_dp_aux_populate_bus() and do the panel linking there. This way you can
exit successfully from this probe and avoid the loop. I had to do the same thing
for anx7625.c [1].

Thanks,
Nícolas

[1] https://lore.kernel.org/all/20230518193902.891121-1-nfraprado@collabora.com/
