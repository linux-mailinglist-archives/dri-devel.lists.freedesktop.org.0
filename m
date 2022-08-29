Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515F95A4686
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 11:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935A710F12B;
	Mon, 29 Aug 2022 09:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664BA10F12B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 09:53:03 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 96ED166016BE;
 Mon, 29 Aug 2022 10:53:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661766782;
 bh=tyHVP8TVsJx7dsp4RoCLCe9+RAOLMn7P+Kx5RBRj4vk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LGbv0gfi1N/Vte34r6F56RHV1wAfbo207qYXVmTbX0COv5wDShGObyvRyS94XCdqE
 PjGPoUn/p0qNc+yorYkQm/3xgtr7RIhqpRVnQ+jZz3kwh6lOju6z4JcXqPVj5sKHsb
 DYXoqtrTnge7+/082g90s3IqH24Q8aAkXlu38qo/2FnlY1+b2t3L7KcnK6Bqr5nSwJ
 QZTTmT5u79TdvTzgg46MbUalFaSv3pP06uM0nueQcSCaMzrBQKzoX4PfjTHn/P5eI5
 nh7tNeBRkO28ab7+G/26wFFze5w3UBIDsCnvFsopmmUyGKGOqqQrAenijG9VBxX3Kn
 tPghf7FU/eSYw==
Message-ID: <8ccf007b-e411-3a56-e5aa-629264cdafee@collabora.com>
Date: Mon, 29 Aug 2022 11:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4,2/2] drm: mediatek: Adjust the dpi output format to
 MT8186
Content-Language: en-US
To: xinlei.lee@mediatek.com, matthias.bgg@gmail.com,
 rex-bc.chen@mediatek.com, jason-jh.lin@mediatek.com,
 yongqiang.niu@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch
References: <1661743308-29120-1-git-send-email-xinlei.lee@mediatek.com>
 <1661743308-29120-3-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1661743308-29120-3-git-send-email-xinlei.lee@mediatek.com>
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
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 29/08/22 05:21, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Dpi output needs to adjust the output format to dual edge for MT8186.
> 
> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c      | 32 +++++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  5 ++++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  2 ++
>   3 files changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index fb0b79704636..c23ef7deef26 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -14,6 +14,7 @@
>   #include <linux/of_graph.h>
>   #include <linux/pinctrl/consumer.h>
>   #include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
>   #include <linux/types.h>
>   
>   #include <video/videomode.h>
> @@ -28,6 +29,7 @@
>   #include "mtk_disp_drv.h"
>   #include "mtk_dpi_regs.h"
>   #include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_drv.h"
>   
>   enum mtk_dpi_out_bit_num {
>   	MTK_DPI_OUT_BIT_NUM_8BITS,
> @@ -80,6 +82,7 @@ struct mtk_dpi {
>   	struct pinctrl_state *pins_dpi;
>   	u32 output_fmt;
>   	int refcount;
> +	struct device *mmsys_dev;
>   };
>   
>   static inline struct mtk_dpi *bridge_to_dpi(struct drm_bridge *b)
> @@ -133,6 +136,8 @@ struct mtk_dpi_yc_limit {
>    * @yuv422_en_bit: Enable bit of yuv422.
>    * @csc_enable_bit: Enable bit of CSC.
>    * @pixels_per_iter: Quantity of transferred pixels per iteration.
> + * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be
> + *		       set in MMSYS.

  * @edge_cfg_in_mmsys: Edge configuration for DPI output has to be set in MMSYS.

fits in one line and it's more immediate to read.

After which...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

