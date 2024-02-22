Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BB585F343
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 09:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046BB10E8CA;
	Thu, 22 Feb 2024 08:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="0gnn0brf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C199010E8C4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 08:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708591372;
 bh=IlWMpflOFQxVolb8BXrh83pIlZC28esiOhVlOKompcM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=0gnn0brfDNAz8+NazsOsMmfBjoG0Vc/JX2rRI/7PXRGXtgR9R2Q7K9sgqIW2owBms
 IelW6tIAFLFXElsSNwGflW94vsS6GalJENUJ3ztMHwbZibdIalvwmoTm+cWIAexUQr
 8V+y/zFFG/TL/6BY1xaefdKWlu08WwC2pRSiMcv7X5I3NIu4fV2g8JHN32+AnjknIl
 oO7XNzjPZbGzoRBAQYMw+8UOzq7fpEEOd1UxIkkOGETTnyrxes5UYfrmROCEpdbmOe
 ciDeKbBxXRtJwDjPlI6v1TWHvEjFUWMzyZ9vuOAPBhLiltDzqGHxckyQfODg5RpJqv
 V+Fcn72I2JyYg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id B91B337813DF;
 Thu, 22 Feb 2024 08:42:51 +0000 (UTC)
Message-ID: <c7d6259b-90e7-41a3-998f-a12edf7c1554@collabora.com>
Date: Thu, 22 Feb 2024 09:42:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Add MT8188 Overlay Driver Data
To: Justin Green <greenjustin@chromium.org>, linux-mediatek@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, chunkuang.hu@kernel.org
References: <20240221165643.1679073-1-greenjustin@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240221165643.1679073-1-greenjustin@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 21/02/24 17:56, Justin Green ha scritto:
> Add MT8188 overlay driver configuration data. This change consequently
> enables 10-bit overlay support on MT8188 devices.
> 
> Tested by running ChromeOS UI on MT8188 and using modetest -P. AR30 and
> BA30 overlays are confirmed to work from modetest.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>
> Tested-by: Justin Green <greenjustin@chromium.org>

Hello Justin,

I'm 99.9% sure that you don't need this, you can just use compatibles

compatible = "mediatek,mt8188-disp-ovl", "mediatek,mt8195-disp-ovl";

as they *are* indeed compatible, and MT8188 does support AFBC as well.

Cheers,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 2bffe4245466..696aabe124c2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -635,6 +635,17 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
>   	.supports_clrfmt_ext = true,
>   };
>   
> +static const struct mtk_disp_ovl_data mt8188_ovl_driver_data = {
> +	.addr = DISP_REG_OVL_ADDR_MT8173,
> +	.gmc_bits = 10,
> +	.layer_nr = 4,
> +	.fmt_rgb565_is_0 = true,
> +	.smi_id_en = true,
> +	.formats = mt8195_formats,
> +	.num_formats = ARRAY_SIZE(mt8195_formats),
> +	.supports_clrfmt_ext = true,
> +};
> +
>   static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
>   	{ .compatible = "mediatek,mt2701-disp-ovl",
>   	  .data = &mt2701_ovl_driver_data},
> @@ -650,6 +661,8 @@ static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
>   	  .data = &mt8192_ovl_2l_driver_data},
>   	{ .compatible = "mediatek,mt8195-disp-ovl",
>   	  .data = &mt8195_ovl_driver_data},
> +	{ .compatible = "mediatek,mt8188-disp-ovl",
> +	  .data = &mt8188_ovl_driver_data},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mtk_disp_ovl_driver_dt_match);

