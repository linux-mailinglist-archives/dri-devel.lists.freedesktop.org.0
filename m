Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FC25E76A1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 11:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B80610E7CB;
	Fri, 23 Sep 2022 09:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370AC10E7CB
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 09:16:39 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E438D6601BDF;
 Fri, 23 Sep 2022 10:16:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663924598;
 bh=COcbVBmwh8xUSsJeO6kEeMrbFW6tyt7j4/rcy5e8aTk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ifBr8/l2q7/LqvQpfV2K/U2NRx0B+a7wLFHep1xJ/4F+w9SovfhlhasDI8SugMkVq
 ZhpDjSAJEY2cXK1CJb+ivJcRpW1UL/IS0Ymg/IlzIoSw07gFdM0qv5iUKSoIX3G6vo
 Liq01thJUcoX4g7TU12sbvsPqC0yn4jk4VijGpIgQ+4c1+6OrOV0odFuE0ysi91v7u
 Pj/YIOnEn1hpnyMnw696McjHHTSRZMm5RODGCQ7zXKlj1+QhU0gy5eLkw1vtGVymeO
 yHOhEY34MmsnE0E5e2bo2S0IMf4Dmy6Y4wAGcIB2hVRzm4AtSIN1n1DvZjSuUgXmLZ
 f9XjR8vev2nXg==
Message-ID: <ad7e399f-9fd9-371e-48d1-4f590b6e8a68@collabora.com>
Date: Fri, 23 Sep 2022 11:16:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v8,2/3]drm: mediatek: Adjust the dpi output format to
 MT8186
Content-Language: en-US
To: xinlei.lee@mediatek.com, matthias.bgg@gmail.com,
 jason-jh.lin@mediatek.com, rex-bc.chen@mediatek.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch
References: <1663850702-26529-1-git-send-email-xinlei.lee@mediatek.com>
 <1663850702-26529-3-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1663850702-26529-3-git-send-email-xinlei.lee@mediatek.com>
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

Il 22/09/22 14:45, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Due to the mt8186  hardware changes, we need to modify the dpi output
> format corresponding to the mmsys register(mmsys_base+0x400).
> 
> Because different sink ICs may support other output formats.
> The current DRM architecture supports retrieving the output format of
> all bridges (eg dpi is implemented via DRM's .atomic_check and
> .atomic_get_output_bus_fmts and .atomic_get_input_bus_fmts).
> If no unified output format is found, the default soc format
> (MEDIA_BUS_FMT_RGB888_2X12_LE in mt8186) is used.
> 
> Therefore, if there are other format sink ICs (RGB888_DDR/RGB888_SDR) in
> the future, the sink IC needs to add the func implementation mentioned
> above needs to be added.
> And the drm architecture will select the appropriate format to change
> the dpi output.
> 
> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 630a4e301ef6..bd1870a8504a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -15,6 +15,7 @@
>   #include <linux/of_graph.h>
>   #include <linux/pinctrl/consumer.h>
>   #include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
>   #include <linux/types.h>
>   
>   #include <video/videomode.h>
> @@ -30,6 +31,7 @@
>   #include "mtk_disp_drv.h"
>   #include "mtk_dpi_regs.h"
>   #include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_drv.h"
>   
>   enum mtk_dpi_out_bit_num {
>   	MTK_DPI_OUT_BIT_NUM_8BITS,
> @@ -82,6 +84,7 @@ struct mtk_dpi {
>   	struct pinctrl_state *pins_dpi;
>   	u32 output_fmt;
>   	int refcount;
> +	struct device *mmsys_dev;

Please place this after `struct device *dev;` and not here at the end.

Thanks,
Angelo


