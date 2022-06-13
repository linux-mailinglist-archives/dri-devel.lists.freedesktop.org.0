Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 617135484A3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 12:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2787E10E3CB;
	Mon, 13 Jun 2022 10:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1C310E3CB
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 10:55:52 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 956946601674;
 Mon, 13 Jun 2022 11:55:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655117750;
 bh=AYCMDXpnrnlhea7/vMZzgZlR6eZJdympQCVtx5OxpTM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=a9CdHFRNL1cXCAvRh3XboG6jOiwZc4fzSdgrsQOHaYR4U5YU91vlz5msxD2p5T685
 lrRe0P/w83HJGc/dmA+zxPrEaVOblxEPEL0usxx2u0eC9sul7icX7gHrUJTO3im7AJ
 9lOGwrKI80poQ9yvcbLTRhmP4tFA5tfCyrQM7DHFPvr/s4Dftv1ZxlgnUcTZ0EKc4F
 x2b7lXzuSt9Cke9UIztn45OivAJewKp5eRJqWd0GqVINKHCq6zQOteErj3iFsO9fTw
 ZoMeIxiT4MBZK49qKgdXbIBC4tpTk6P+2KtV9C+l8PSenJ4oIOBMiR1L7XB4fJ1QAK
 fRb9Z8IS6IG4w==
Message-ID: <7d2a1d75-e400-71aa-7127-144e257f408d@collabora.com>
Date: Mon, 13 Jun 2022 12:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v11 10/12] drm/mediatek: dpi: Add dpintf support
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, airlied@linux.ie
References: <20220613064841.10481-1-rex-bc.chen@mediatek.com>
 <20220613064841.10481-11-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220613064841.10481-11-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 13/06/22 08:48, Bo-Chen Chen ha scritto:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> dpintf is the displayport interface hardware unit. This unit is similar
> to dpi and can reuse most of the code.
> 
> This patch adds support for mt8195-dpintf to this dpi driver. Main
> differences are:
>   - Some features/functional components are not available for dpintf
>     which are now excluded from code execution once is_dpintf is set
>   - dpintf can and needs to choose between different clockdividers based
>     on the clockspeed. This is done by choosing a different clock parent.
>   - There are two additional clocks that need to be managed. These are
>     only set for dpintf and will be set to NULL if not supplied. The
>     clk_* calls handle these as normal clocks then.
>   - Some register contents differ slightly between the two components. To
>     work around this I added register bits/masks with a DPINTF_ prefix
>     and use them where different.
> 
> Based on a separate driver for dpintf created by
> Jitao shi <jitao.shi@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Modify reviewers' comments.]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c          | 115 ++++++++++++++++++--
>   drivers/gpu/drm/mediatek/mtk_dpi_regs.h     |  13 +++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   4 +
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   3 +
>   5 files changed, 126 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 6b8cf648a5b5..08c8f21b4421 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -71,6 +71,7 @@ struct mtk_dpi {
>   	void __iomem *regs;
>   	struct device *dev;
>   	struct clk *engine_clk;
> +	struct clk *pll_gate_clk;

You don't need this clock in this driver, at all.

`pll_gate` would be CLK_VDO0_DP_INTF0_DP_INTF (parent = CLK_TOP_EDP);

Currently, you're assigning CLK_TOP_EDP to "pixel", but you can, at this point,
simply assign CLK_VDO0_DP_INTF0_DP_INTF to "pixel" instead... as when you call
clk_prepare_enable() on it, that'll also take care of enabling its CLK_TOP_EDP
parent for you.

You're not doing anything special if not taking care of enabling/disabling it.

Regards,
Angelo

