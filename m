Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C9879A781
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 13:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1449110E2BA;
	Mon, 11 Sep 2023 11:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA17710E2B9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 11:03:29 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BFB6066072FC;
 Mon, 11 Sep 2023 12:03:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694430208;
 bh=toQiYutVle+i27Bqgs6ZEGNKjIE11r2s6PXTNuIUBLU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BOsOOsKe7nx8QyxFFqapO85pc3cpScbG26NcaLQ+4pM/bVHwXKA3N8HzuoVKPCbd+
 qVz7WdDbO+JRhSvqM8QYxZccZffeHPIDSe08gnLdvpzVmBzl2CN/DeIKZeeZGX3MNX
 FN6ZoqqBva5HC8zvidePc1HKeaSU7w8Eip7Cv+ojCZq6x9UHyRvO2j+/oiZWNXJ4XM
 1VRLeuPL5fh3EcEgVN2S5CVWiIY4e8+mHRm3D0nzhxgZ1RkB0+3vQtzyRZaoD5lAxN
 XLgQsqhVgu2BHVAXJy2yjrwmlrzz6Iql/i18Q0596zJjA6hhXfebejW3hIeBteMnL2
 1LsZ/nmyWfFFg==
Message-ID: <14e03873-3723-8293-0190-445a71828b25@collabora.com>
Date: Mon, 11 Sep 2023 13:03:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3, 2/3] drm/mediatek: dsi: Add dsi cmdq_ctl to send panel
 initial code
Content-Language: en-US
To: Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
References: <20230911105736.11752-1-shuijing.li@mediatek.com>
 <20230911105736.11752-3-shuijing.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230911105736.11752-3-shuijing.li@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 11/09/23 12:57, Shuijing Li ha scritto:
> For mt8188, add dsi cmdq reg control to send long packets to panel
> initialization. MT8188 hardware has been changed to automatically
> set the cmdq_size value by default when sending long packets.
> In this patch, the cmdq_size value is set manually instead.
> Remain consistent with previous IC.
> 
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> ---
> Changes in v3:
> reorder patch 2/3 and 3/3, and describe more about why mt8188 need this
> patch,
> per suggestion from the previous thread:
> https://lore.kernel.org/lkml/411ddbf95e2c2298b84899065691d478069ec273.camel@mediatek.com/
> Changes in v2:
> use mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE_SEL, CMDQ_SIZE_SEL); directly,
> per suggestion from the previous thread:
> https://lore.kernel.org/lkml/015f4c60-ed77-9e1f-8a6b-cda6e4f6ac93@gmail.com/
> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index d8bfc2cce54d..e83705394ada 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -86,6 +86,7 @@
>   
>   #define DSI_CMDQ_SIZE		0x60
>   #define CMDQ_SIZE			0x3f
> +#define CMDQ_SIZE_SEL		BIT(15)
>   
>   #define DSI_HSTX_CKL_WC		0x64
>   
> @@ -178,6 +179,7 @@ struct mtk_dsi_driver_data {
>   	const u32 reg_cmdq_off;
>   	bool has_shadow_ctl;
>   	bool has_size_ctl;
> +	bool cmdq_long_packet_ctl;
>   };
>   
>   struct mtk_dsi {
> @@ -996,6 +998,8 @@ static void mtk_dsi_cmdq(struct mtk_dsi *dsi, const struct mipi_dsi_msg *msg)
>   
>   	mtk_dsi_mask(dsi, reg_cmdq_off, cmdq_mask, reg_val);
>   	mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE, cmdq_size);
> +	if (dsi->driver_data->cmdq_long_packet_ctl)

Please add a comment here, like:

		/* Disable setting cmdq_size automatically for long packets */

after which
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +		mtk_dsi_mask(dsi, DSI_CMDQ_SIZE, CMDQ_SIZE_SEL, CMDQ_SIZE_SEL);
>   }
>   
>   static ssize_t mtk_dsi_host_send_cmd(struct mtk_dsi *dsi,

