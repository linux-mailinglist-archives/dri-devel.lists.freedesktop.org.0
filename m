Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EFFBC8D64
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 13:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC9E10E9C4;
	Thu,  9 Oct 2025 11:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FqNEEpMA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4433610E9C4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 11:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760009751;
 bh=Z0E5Ui2XxRD/RtSI3wRkIkjJDJlHxUBHJsvJwXR2IHc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FqNEEpMAGBk0Mc1/tb6CS85/YBxMY+XW72k7bSSh7lUpqvu2Fh3zIkzgg9LKe7Unj
 BXPXZAX6Kv8WfI5J6Qn7hw0pQHwHiGZHVODQxK2jmqh2vNoj2nY9HyhBMQNk54wsgL
 sRVV7EzEFq47OSde/2j/vhSyWyv8OJaFm6Sah9DzpXb2CPlA+JzES4SaXK1sXWU+Nq
 X2Qp+VnafoXkIRT/ZEYsZvGGASt0kljvMsgWjAKfTgAvyfi/JrFHOFJBaLTGX/Uee9
 88mwX+isXesAIfHJjalyi+7jsBW7zVgmTKJhh4snxm0TnkoPMLZZzQj4UR1PY1w/uZ
 IY0y0TMYh05iA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C891117E0125;
 Thu,  9 Oct 2025 13:35:50 +0200 (CEST)
Message-ID: <e18a0772-3031-4fff-a625-b1d4e1aab605@collabora.com>
Date: Thu, 9 Oct 2025 13:35:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/20] soc: mediatek: mtk-cmdq: Add pa_base parsing for
 hardware without subsys ID support
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
 <20250827114006.3310175-10-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-10-jason-jh.lin@mediatek.com>
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
> When GCE executes instructions, it typically locates the corresponding
> hardware register using the subsys ID. For hardware that does not
> support subsys ID, the subsys ID is set to an invalid value, and the
> physical address must be used to generate GCE instructions.
> 
> The main advantage of using subsys ID is to reduce the number of
> instructions. Without subsys ID, an additional `ASSIGN` instruction
> is needed to assign the high bytes of the physical address, which can
> impact performance if too many instructions are required. However, if
> the hardware does not support subsys ID, using the physical address
> is the only option to achieve the same functionality.
> 
> This commit adds a pa_base parsing flow to the cmdq_client_reg structure
> to handle hardware without subsys ID support.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 15 +++++++++++++--
>   include/linux/soc/mediatek/mtk-cmdq.h  |  3 +++
>   2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 4b1591e5b1ae..41e1997cdd53 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -8,6 +8,7 @@
>   #include <linux/module.h>
>   #include <linux/mailbox_controller.h>
>   #include <linux/of.h>
> +#include <linux/of_address.h>
>   #include <linux/soc/mediatek/mtk-cmdq.h>
>   
>   #define CMDQ_WRITE_ENABLE_MASK	BIT(0)
> @@ -60,20 +61,30 @@ int cmdq_dev_get_client_reg(struct device *dev,
>   			    struct cmdq_client_reg *client_reg, int idx)
>   {
>   	struct of_phandle_args spec;
> +	struct resource res;
>   	int err;
>   
>   	if (!client_reg)
>   		return -ENOENT;
>   

	err = of_address_to_resource( ... )
	if (err) {
		dev_err(....)
		return;
	}

after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +	if (of_address_to_resource(dev->of_node, 0, &res) != 0) {
> +		dev_err(dev, "Missing reg in %s node\n", dev->of_node->full_name);
> +		return -EINVAL;
> +	}
> +	client_reg->pa_base = res.start;
> +
>   	err = of_parse_phandle_with_fixed_args(dev->of_node,
>   					       "mediatek,gce-client-reg",
>   					       3, idx, &spec);
>   	if (err < 0) {
> -		dev_warn(dev,
> +		dev_dbg(dev,
>   			"error %d can't parse gce-client-reg property (%d)",
>   			err, idx);
>   
> -		return err;
> +		/* make subsys invalid */
> +		client_reg->subsys = CMDQ_SUBSYS_INVALID;
> +
> +		return 0;
>   	}
>   
>   	client_reg->subsys = (u8)spec.args[0];
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 5e3a0e807980..3699229a7375 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -23,6 +23,8 @@
>   #define CMDQ_THR_SPR_IDX2	(2)
>   #define CMDQ_THR_SPR_IDX3	(3)
>   
> +#define CMDQ_SUBSYS_INVALID	(U8_MAX)
> +
>   struct cmdq_pkt;
>   
>   enum cmdq_logic_op {
> @@ -52,6 +54,7 @@ struct cmdq_operand {
>   
>   struct cmdq_client_reg {
>   	u8 subsys;
> +	phys_addr_t pa_base;
>   	u16 offset;
>   	u16 size;
>   };

