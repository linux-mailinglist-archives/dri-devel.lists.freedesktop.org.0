Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A23BC8E8E
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 13:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E047710E9D7;
	Thu,  9 Oct 2025 11:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="q2uXQM5Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDA410E9DF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 11:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760010871;
 bh=B/o080jiuYuwYnKuOkoaAn5+mc0G3zApBcZNRGwdUfE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=q2uXQM5Qory6uBVrxpZujNoEUOWY144usrDsAU5OLYJ8WE5QiljfYsbogXwMoaY5Z
 h2gFjgKTvmh7J0bIdg74aGnY1eayEdn2YhkF2PAzgz7LQCGosYlr2ItiWVepLh5WCO
 BW9JaJCvMlChK38CmZQnQdqfaQA7KxDKwfPgal8NfmsqDzrDDrkT6rvbCL/v4L/dc9
 3zzSsU3Eysjp81192joNSfLy57T6fgV6ibYrloPoV8lgOJSqPkNT6B8+R9ISIjUTWi
 t3nhTX1cJprc7RwTRPforX5FHWQtLDDfNdUJ6t4N5sxzsPxxLXKJUggadtwC0ylVJ3
 4T88QYdNXST8g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A649817E1060;
 Thu,  9 Oct 2025 13:54:30 +0200 (CEST)
Message-ID: <6690e20f-f88e-4c5a-8188-4d2a941fc6b1@collabora.com>
Date: Thu, 9 Oct 2025 13:54:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/20] drm/mediatek: Add programming flow for
 unsupported subsys ID hardware
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-14-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-14-jason-jh.lin@mediatek.com>
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

Il 27/08/25 13:37, Jason-JH Lin ha scritto:
> To support hardware without subsys IDs on new SoCs, add a programming
> flow that checks whether the subsys ID is valid.
> 
> If the subsys ID is valid, the flow will call cmdq_pkt_write_subsys()
> instead of the original cmdq_pkt_write().
> 
> If the subsys ID is invalid, the flow will call cmdq_pkt_write_mask_pa()
> to achieve the same functionality.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

In mediatek-drm and in mtk-mdp3 the performance of mtk_ddp_write is important: in
both, there are ways to know whether a platform is expected to always use the
cmdq_pkt_write_mask_pa() or the subsys() one.

Please check what platform is this driver running on - based on the platform, you
can assign a function pointer, so that you always call it like

priv->write_cmdq_pkt(cmdq_pkt, cmdq_reg, ofst, val, mask);

write_cmdq_pkt() could point to, either:
1. A function that checks if subsys != CMDQ_SUBSYS_INVALID, for platforms that
    are expected to have mixed PA *and* SUBSYS (hopefully none!!!); or
2. The cmdq_pkt_write_mask_subsys() function; or
3. The cmdq_pkt_write_mask_pa() function.

This removes lots and lots of branches at every call.

I want to remind you that CMDQ packets are being generated in many cases in the
mediatek-drm driver, one of which is upon VBLANK; Think of the case in which we
are driving a high refresh rate display (>=120Hz): not just in DSI Video mode
for which we manage just only vblanks and data pumping (which still needs quite
a bit of GCE writes).. but something like DSI CMD mode would probably generate
*a myriad* of GCE calls.... and that is only one of the cases, there are more
that don't involve specifically DSI.

Of course, for mtk-mdp3 there's a different story - but I guess it's useless to
add a specific example for that, I'm sure you got the point here.

Cheers,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 24 ++++++++++++++++++------
>   1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> index ac6620e10262..d902a65e1232 100644
> --- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> @@ -66,14 +66,28 @@ struct mtk_ddp_comp_dev {
>   	struct cmdq_client_reg cmdq_reg;
>   };
>   
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +static int mtk_ddp_write_cmdq_pkt(struct cmdq_pkt *cmdq_pkt, struct cmdq_client_reg *cmdq_reg,
> +				  unsigned int offset, unsigned int value, unsigned int mask)
> +{
> +	offset += cmdq_reg->offset;
> +
> +	if (cmdq_reg->subsys != CMDQ_SUBSYS_INVALID)
> +		return cmdq_pkt_write_mask_subsys(cmdq_pkt, cmdq_reg->subsys, cmdq_reg->pa_base,
> +						  offset, value, mask);
> +	else /* only MMIO access, no need to check mminfro_offset */
> +		return cmdq_pkt_write_mask_pa(cmdq_pkt, cmdq_reg->subsys, cmdq_reg->pa_base,
> +					      offset, value, mask);
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
> @@ -85,8 +99,7 @@ void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
>   {
>   #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>   	if (cmdq_pkt)
> -		cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys,
> -			       cmdq_reg->offset + offset, value);
> +		mtk_ddp_write_cmdq_pkt(cmdq_pkt, cmdq_reg, offset, value, GENMASK(31, 0));
>   	else
>   #endif
>   		writel_relaxed(value, regs + offset);
> @@ -98,8 +111,7 @@ void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
>   {
>   #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>   	if (cmdq_pkt) {
> -		cmdq_pkt_write_mask(cmdq_pkt, cmdq_reg->subsys,
> -				    cmdq_reg->offset + offset, value, mask);
> +		mtk_ddp_write_cmdq_pkt(cmdq_pkt, cmdq_reg, offset, value, mask);
>   	} else {
>   #endif
>   		u32 tmp = readl(regs + offset);


