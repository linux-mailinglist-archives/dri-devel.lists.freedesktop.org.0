Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD080A546C8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 10:47:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D820D10E926;
	Thu,  6 Mar 2025 09:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KjwCjN2B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889D010E926
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 09:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741254469;
 bh=eirDffSZXQnuWFuuk3LO+GhR4ye9aHsev/7ZgRDFsZE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KjwCjN2BJjbtWfG9AsHIp0aneWHpiAVyB05RKDW866qB9fy0lUTbpdMIZawilrQVa
 lIykk/y3I1JQbrvpDP8+p1lJC9Lqvx6hApqU/ARpDNPT6JWrA1Jilb37YUArx7w16o
 jhYGi5LlUZa5Dis19/YUcGWvdoNW9sHa2PowipRhkq0NtnBGXR7OcYy5d13OktL0nq
 Lm+HvvyzWbGAHvzBNiQLSHcT+hDjl7U2Pk2nL+uw0Y/dxiqoDJf8z788RXWdv3aRwH
 oivqfb7tJnYw7a1AKyZEHiblWWXaCbnBIFAmMCFsdh7OHbIWJaZ0YANcTX1B4r3QrN
 gk861/ltW+1qA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D6FD317E088C;
 Thu,  6 Mar 2025 10:47:47 +0100 (CET)
Message-ID: <d1c2dfa8-c7e0-40b2-8b39-c04854e3ee24@collabora.com>
Date: Thu, 6 Mar 2025 10:47:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] drm/mediatek: Add programming flow for unsupported
 subsys ID hardware
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Moudy Ho <moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 CK Hu <ck.hu@mediatek.com>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
 <20250218054405.2017918-8-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250218054405.2017918-8-jason-jh.lin@mediatek.com>
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

Il 18/02/25 06:41, Jason-JH Lin ha scritto:
> To support hardware without subsys IDs on new SoCs, add a programming
> flow that checks whether the subsys ID is valid. If the subsys ID is
> invalid, the flow will call 2 alternative CMDQ APIs:
> cmdq_pkt_assign() and cmdq_pkt_write_s_value() to achieve the same
> functionality.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 33 ++++++++++++++++++++-----
>   1 file changed, 27 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> index edc6417639e6..219d67735a54 100644
> --- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> @@ -66,14 +66,37 @@ struct mtk_ddp_comp_dev {
>   	struct cmdq_client_reg cmdq_reg;
>   };
>   
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +static void mtk_ddp_write_cmdq_pkt(struct cmdq_pkt *cmdq_pkt, struct cmdq_client_reg *cmdq_reg,
> +				   unsigned int offset, unsigned int value, unsigned int mask)
> +{
> +	offset += cmdq_reg->offset;
> +
> +	if (cmdq_reg->subsys != CMDQ_SUBSYS_INVALID) {
> +		if (mask == GENMASK(31, 0))
> +			cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys, offset, value);
> +		else
> +			cmdq_pkt_write_mask(cmdq_pkt, cmdq_reg->subsys, offset, value, mask);

Sorry but this is pointless, really...

Function cmdq_pkt_write_mask() in mtk-cmdq-helper is doing:

	if (mask != GENMASK(31, 0)) {
		err = cmdq_pkt_mask(pkt, mask);
		if (err < 0)
			return err;

		offset_mask |= CMDQ_WRITE_ENABLE_MASK;
	}
	return cmdq_pkt_write(pkt, subsys, offset_mask, value);

here you're doing the exact inverse check.

At this point you can just do:

static int mtk_ddp_write_cmdq_pkt(struct cmdq_pkt *cmdq_pkt, struct cmdq_client_reg 
*cmdq_reg,
				  u16 offset, u32 value, u32 mask)
{
	u16 gce_offset = cmdq_reg->offset + offset;

	if (cmdq_reg->subsys != CMDQ_SUBSYS_INVALID)
		return cmdq_pkt_write_mask(pkt, cmdq_reg->subsys, gce_offset, value, mask);

	return cmdq_pkt_write_mask_pa(cmdq_pkt, cmdq_reg->pa_base, gce_offset, value, mask);
}

Cheers,
Angelo

> +	} else {
> +		/* only MMIO access, no need to check mminfro_offset */
> +		cmdq_pkt_assign(cmdq_pkt, 0, CMDQ_ADDR_HIGH(cmdq_reg->pa_base));
> +		if (mask == GENMASK(31, 0))
> +			cmdq_pkt_write_s_value(cmdq_pkt, CMDQ_THR_SPR_IDX0,
> +					       CMDQ_ADDR_LOW(offset), value);
> +		else
> +			cmdq_pkt_write_s_mask_value(cmdq_pkt, CMDQ_THR_SPR_IDX0,
> +						    CMDQ_ADDR_LOW(offset), value, mask);
> +	}
> +}
> +#endif
> +
>   void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
>   		   struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
>   		   unsigned int offset)
>   {
>   #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>   	if (cmdq_pkt)
> -		cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys,
> -			       cmdq_reg->offset + offset, value);
> +		mtk_ddp_write_cmdq_pkt(cmdq_pkt, cmdq_reg, offset, value, GENMASK(31, 0));
>   	else
>   #endif
>   		writel(value, regs + offset);
> @@ -85,8 +108,7 @@ void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
>   {
>   #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>   	if (cmdq_pkt)
> -		cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys,
> -			       cmdq_reg->offset + offset, value);
> +		mtk_ddp_write_cmdq_pkt(cmdq_pkt, cmdq_reg, offset, value, GENMASK(31, 0));
>   	else
>   #endif
>   		writel_relaxed(value, regs + offset);
> @@ -98,8 +120,7 @@ void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
>   {
>   #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>   	if (cmdq_pkt) {
> -		cmdq_pkt_write_mask(cmdq_pkt, cmdq_reg->subsys,
> -				    cmdq_reg->offset + offset, value, mask);
> +		mtk_ddp_write_cmdq_pkt(cmdq_pkt, cmdq_reg, offset, value, mask);
>   	} else {
>   #endif
>   		u32 tmp = readl(regs + offset);

