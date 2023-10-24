Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 584817D4A76
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 10:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872BC10E2F9;
	Tue, 24 Oct 2023 08:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D104010E2F6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 08:37:47 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8962866072F1;
 Tue, 24 Oct 2023 09:37:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698136666;
 bh=WS4wMhjmoXB+4KzW8/mmKMaxnWopID7042hz0hzqCPI=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=eJ9le+nLZg9pbxpMxzRMNDH6/UrDCFWmuw2GXy0t7tkJ1eUQNOTsjN4wli1ugzVpF
 DbWdhtDLI3iDTuCtlWZf55OH5C4tqWY18DwcpUC5M9eb/eVL335V9yiDVCdwHZ1O1Z
 yCafNmjINX8hYF27U+DWGfqH2s1FMdPWvbOuxMSlIB29jhDG8M57VZl8b/VuD5hV1E
 yiwVXyrYdZe6hCODrmdVz8+5yuIS+vxeOlJwbHfYsx6YeXowWRqBUfViFqT9mu0ahR
 D/7OhmY3bzU44sdIbx4UHc5p49yXwv5f1qT5Z/vnuUScVk+SI5Z6jqKAhvS8Fa6aDO
 MLGXsXE9n1UiQ==
Message-ID: <0fa3bc67-baa4-4a7b-a2f2-43aee03ff77f@collabora.com>
Date: Tue, 24 Oct 2023 10:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 07/11] drm/mediatek: Add secure layer config support
 for ovl
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
 <20231023044549.21412-8-jason-jh.lin@mediatek.com>
Content-Language: en-US
In-Reply-To: <20231023044549.21412-8-jason-jh.lin@mediatek.com>
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
Cc: Jeffrey Kardatzke <jkardatzke@google.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/10/23 06:45, Jason-JH.Lin ha scritto:
> Add secure layer config support for ovl.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  3 ++
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 31 +++++++++++++++++--
>   .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 12 +++++++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  2 ++
>   4 files changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index 2254038519e1..dec937b183a8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -9,6 +9,7 @@
>   #include <linux/soc/mediatek/mtk-cmdq.h>
>   #include <linux/soc/mediatek/mtk-mmsys.h>
>   #include <linux/soc/mediatek/mtk-mutex.h>
> +#include "mtk_drm_ddp_comp.h"
>   #include "mtk_drm_plane.h"
>   #include "mtk_mdp_rdma.h"
>   
> @@ -79,6 +80,7 @@ void mtk_ovl_clk_disable(struct device *dev);
>   void mtk_ovl_config(struct device *dev, unsigned int w,
>   		    unsigned int h, unsigned int vrefresh,
>   		    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> +u64 mtk_ovl_get_sec_port(struct mtk_ddp_comp *comp, unsigned int idx);
>   int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
>   			struct mtk_plane_state *mtk_state);
>   void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
> @@ -112,6 +114,7 @@ void mtk_ovl_adaptor_clk_disable(struct device *dev);
>   void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
>   			    unsigned int h, unsigned int vrefresh,
>   			    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> +u64 mtk_ovl_adaptor_get_sec_port(struct mtk_ddp_comp *comp, unsigned int idx);
>   void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
>   				  struct mtk_plane_state *state,
>   				  struct cmdq_pkt *cmdq_pkt);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 2bffe4245466..76e832e4875a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -46,6 +46,7 @@
>   #define DISP_REG_OVL_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n))
>   #define DISP_REG_OVL_HDR_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n) + 0x04)
>   #define DISP_REG_OVL_HDR_PITCH(ovl, n)		((ovl)->data->addr + 0x20 * (n) + 0x08)
> +#define DISP_REG_OVL_SECURE			0x0fc0
>   
>   #define GMC_THRESHOLD_BITS	16
>   #define GMC_THRESHOLD_HIGH	((1 << GMC_THRESHOLD_BITS) / 4)
> @@ -126,8 +127,19 @@ struct mtk_disp_ovl {
>   	const struct mtk_disp_ovl_data	*data;
>   	void				(*vblank_cb)(void *data);
>   	void				*vblank_cb_data;
> +	resource_size_t			regs_pa;
>   };
>   
> +u64 mtk_ovl_get_sec_port(struct mtk_ddp_comp *comp, unsigned int idx)
> +{
> +	if (comp->id == DDP_COMPONENT_OVL0)
> +		return 1ULL << CMDQ_SEC_DISP_OVL0;

This is BIT_ULL():

return BIT_ULL(CMDQ_SEC_DISP_OVL0);

> +	else if (comp->id == DDP_COMPONENT_OVL1)
> +		return 1ULL << CMDQ_SEC_DISP_OVL1;
> +
> +	return 0;
> +}
> +
>   static irqreturn_t mtk_disp_ovl_irq_handler(int irq, void *dev_id)
>   {
>   	struct mtk_disp_ovl *priv = dev_id;
> @@ -449,8 +461,22 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
>   			      DISP_REG_OVL_SRC_SIZE(idx));
>   	mtk_ddp_write_relaxed(cmdq_pkt, offset, &ovl->cmdq_reg, ovl->regs,
>   			      DISP_REG_OVL_OFFSET(idx));
> -	mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
> -			      DISP_REG_OVL_ADDR(ovl, idx));
> +
> +	if (state->pending.is_sec) {
> +		const struct drm_format_info *fmt_info = drm_format_info(fmt);
> +		unsigned int buf_size = (pending->height - 1) * pending->pitch +
> +					pending->width * fmt_info->cpp[0];
> +
> +		mtk_ddp_write_mask(cmdq_pkt, BIT(idx), &ovl->cmdq_reg, ovl->regs,
> +				   DISP_REG_OVL_SECURE, BIT(idx));
> +		mtk_ddp_sec_write(cmdq_pkt, ovl->regs_pa + DISP_REG_OVL_ADDR(ovl, idx),
> +				  pending->addr, CMDQ_IWC_H_2_MVA, 0, buf_size, 0);
> +	} else {
> +		mtk_ddp_write_mask(cmdq_pkt, 0, &ovl->cmdq_reg, ovl->regs,
> +				   DISP_REG_OVL_SECURE, BIT(idx));
> +		mtk_ddp_write_relaxed(cmdq_pkt, addr, &ovl->cmdq_reg, ovl->regs,
> +				      DISP_REG_OVL_ADDR(ovl, idx));
> +	}
>   
>   	if (is_afbc) {
>   		mtk_ddp_write_relaxed(cmdq_pkt, hdr_addr, &ovl->cmdq_reg, ovl->regs,
> @@ -529,6 +555,7 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
>   	}
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	priv->regs_pa = res->start;
>   	priv->regs = devm_ioremap_resource(dev, res);
>   	if (IS_ERR(priv->regs)) {
>   		dev_err(dev, "failed to ioremap ovl\n");
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> index 6bf6367853fb..28a0bccfb0b9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> @@ -83,6 +83,18 @@ static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
>   	[OVL_ADAPTOR_ETHDR0]	= { OVL_ADAPTOR_TYPE_ETHDR, 0 },
>   };
>   
> +static const u64 ovl_adaptor_sec_port[] = {
> +	1ULL << CMDQ_SEC_VDO1_DISP_RDMA_L0,

BIT_ULL(CMDQ_SEC_VDO1_DISP_RDMA_L0),
BIT_ULL(......),


Regards,
Angelo

