Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA3642DB1A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 16:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF276E0C5;
	Thu, 14 Oct 2021 14:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633D96E0C5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 14:05:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id DA2C51F44CD7
Subject: Re: [PATCH v11 09/16] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, hsinyi@chromium.org,
 fshao@chromium.org, moudy.ho@mediatek.com, roy-cw.yeh@mediatek.com,
 Fabien Parent <fparent@baylibre.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, nancy.lin@mediatek.com,
 singo.chang@mediatek.com, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
 <20210921155218.10387-10-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <8b509551-7cfa-f55c-fc0f-db7d0a3886eb@collabora.com>
Date: Thu, 14 Oct 2021 16:05:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921155218.10387-10-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

> Add mt8195 vdosys0 clock driver name and routing table to
> the driver data of mtk-mmsys.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
> This patch is base on [1]
> [1] soc: mediatek: mmsys: add mt8192 mmsys support
> - https://patchwork.kernel.org/project/linux-mediatek/list/?series=524857
> 
> The vdosys1 impelmentation patch [2]
> [2] soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
> - https://patchwork.kernel.org/project/linux-mediatek/patch/20210906071539.12953-7-nancy.lin@mediatek.com/
> ---

Hello Jason,
thanks for the patch! However, there are a few things to improve:


>   drivers/soc/mediatek/mt8195-mmsys.h    | 114 +++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c       |  11 +++
>   include/linux/soc/mediatek/mtk-mmsys.h |   9 ++
>   3 files changed, 134 insertions(+)
>   create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> 
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
> new file mode 100644
> index 000000000000..0c97a5f016c1
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -0,0 +1,114 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_MEDIATEK_MT8195_MMSYS_H
> +#define __SOC_MEDIATEK_MT8195_MMSYS_H
> +
> +#define MT8195_VDO0_OVL_MOUT_EN					0xf14
> +#define MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0			BIT(0)
> +#define MT8195_MOUT_DISP_OVL0_TO_DISP_WDMA0			BIT(1)
> +#define MT8195_MOUT_DISP_OVL0_TO_DISP_OVL1			BIT(2)
> +#define MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1			BIT(4)
> +#define MT8195_MOUT_DISP_OVL1_TO_DISP_WDMA1			BIT(5)
> +#define MT8195_MOUT_DISP_OVL1_TO_DISP_OVL0			BIT(6)
> +
> +#define MT8195_VDO0_SEL_IN					0xf34
> +#define MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT		(0 << 0)

Bitshifting 0 by 0 bits == 0, so this is simply 0.

> +#define MT8195_SEL_IN_VPP_MERGE_FROM_DISP_DITHER1		(1 << 0)

I would write 0x1 here

> +#define MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0		(2 << 0)

....and 0x2 here: bitshifting of 0 bits makes little sense.

> +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0		(0 << 4)

Bitshifting 0 by 4 bits is still 0, so this is again 0.
This is repeated too many times, so I will not list it for all of the occurrences.

> +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE		(1 << 4)

This is BIT(4).

> +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1		(0 << 5) > +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE		(1 << 5)

...and this is BIT(5)

> +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE		(0 << 8)
> +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT		(1 << 8)

BIT(8)

> +#define MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT		(0 << 9)
> +#define MT8195_SEL_IN_DP_INTF0_FROM_DSC_WRAP1_OUT		(0 << 12)
> +#define MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE			(1 << 12)

BIT(12)

> +#define MT8195_SEL_IN_DP_INTF0_FROM_VDO1_VIRTUAL0		(2 << 12)

BIT(13)

... and please, use the BIT(nr) macro for all these bit definitions, it's way more
readable like that.

Regards,
- Angelo
