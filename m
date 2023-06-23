Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ACD73B412
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 11:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570F110E0F3;
	Fri, 23 Jun 2023 09:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2934910E0F3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 09:47:55 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 22F9F6607136;
 Fri, 23 Jun 2023 10:47:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687513672;
 bh=5xfPdsey5YOHDH601pEU4evj7XFemgGX/KLObcTGv3E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lGqHEpbBH6VBPV3ynNgTXGNqTtYiwGBNsQq2oQNUL9tFmx70p+4g3IagL5Gv9PDQ2
 eRe2Htb0+bNAK95I8SFIkBYMay3Zaj7h65ZINYCy0ppsmfuLUVOwR3nA/Nb+VMHDxV
 Dx94Jnoh0zP/HtS7NwLopph0UDXQQ8+r1bBZQsMKC9P5gETWCn5MmsWgJ3YDz3ioyJ
 PH6EcNI+jR3BmD2DDFpvSl/b8jjyEu5e6TNwUV/qLiVeqwpVUPzfqG1B08gH8OJccS
 ZzZe8nAyvUS47Yn5Mx49yD0q2AwptEogsIRKc3DX3ynWVg5s5isgdU1Z6GaCZa5ljZ
 U5nkCdp/FHumQ==
Message-ID: <735623c5-3eeb-bda3-db87-2b33d9ad3446@collabora.com>
Date: Fri, 23 Jun 2023 11:47:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET
 settings/handling
Content-Language: en-US
To: chunkuang.hu@kernel.org
References: <20230523104234.7849-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230523104234.7849-1-angelogioacchino.delregno@collabora.com>
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, shaoming.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/05/23 12:42, AngeloGioacchino Del Regno ha scritto:
> Due to the initial confusion about MIPI_DSI_MODE_EOT_PACKET, properly
> renamed to MIPI_DSI_MODE_NO_EOT_PACKET, reflecting its actual meaning,
> both the DSI_TXRX_CON register setting for bit (HSTX_)DIS_EOT and the
> later calculation for horizontal sync-active (HSA), back (HBP) and
> front (HFP) porches got incorrect due to the logic being inverted.
> 
> This means that a number of settings were wrong because....:
>   - DSI_TXRX_CON register setting: bit (HSTX_)DIS_EOT should be
>     set in order to disable the End of Transmission packet;
>   - Horizontal Sync and Back/Front porches: The delta used to
>     calculate all of HSA, HBP and HFP should account for the
>     additional EOT packet.
> 
> Before this change...
>   - Bit (HSTX_)DIS_EOT was being set when EOT packet was enabled;
>   - For HSA/HBP/HFP delta... all three were wrong, as words were
>     added when EOT disabled, instead of when EOT packet enabled!
> 
> Invert the logic around flag MIPI_DSI_MODE_NO_EOT_PACKET in the
> MediaTek DSI driver to fix the aforementioned issues.
> 
> Fixes: 8b2b99fd7931 ("drm/mediatek: dsi: Fine tune the line time caused by EOTp")
> Fixes: 2d52bfba09d1 ("drm/mediatek: add non-continuous clock mode and EOT packet control")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Gentle ping for an important fix.

Regards,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 7d5250351193..b0ab38e59db9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -407,7 +407,7 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
>   	if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
>   		tmp_reg |= HSTX_CKLP_EN;
>   
> -	if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
> +	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>   		tmp_reg |= DIS_EOT;
>   
>   	writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
> @@ -484,7 +484,7 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
>   			  timing->da_hs_zero + timing->da_hs_exit + 3;
>   
>   	delta = dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST ? 18 : 12;
> -	delta += dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET ? 2 : 0;
> +	delta += dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET ? 0 : 2;
>   
>   	horizontal_frontporch_byte = vm->hfront_porch * dsi_tmp_buf_bpp;
>   	horizontal_front_back_byte = horizontal_frontporch_byte + horizontal_backporch_byte;


