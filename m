Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D724C273C7B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650056E804;
	Tue, 22 Sep 2020 07:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99076E39C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 16:18:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600705136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pqOJVf49CUVVxcz8kEiVqivoHMj3m8RD+N1BRvW+DgU=;
 b=G3YQ4qbryrlPa84ws3fLjF9qOAcMppOY6InukLyCoPgytd6pRmzIpgEBlei/bLk7TMcbMc
 TxQDU7dd/hc+AYNgY6A6L/l25AeIVBpOQkGXNQLZEj7UNRDwLXSXwqWifLpbnxeDwy6WmJ
 Hlvik19sHEe2VhWJSSozAd+ntterhOI=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 78C23B2C3;
 Mon, 21 Sep 2020 16:19:32 +0000 (UTC)
Subject: Re: [PATCH v3 7/9] soc: mediatek: cmdq: add jump function
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-8-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Matthias Brugger <mbrugger@suse.com>
Message-ID: <1b66c203-e0ea-79f9-6856-a9be3e410dd2@suse.com>
Date: Mon, 21 Sep 2020 18:18:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1594136714-11650-8-git-send-email-dennis-yc.hsieh@mediatek.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:37 +0000
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/07/2020 17:45, Dennis YC Hsieh wrote:
> Add jump function so that client can jump to any address which
> contains instruction.
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>

Now pushed to v5.9-next/soc

Thanks!

> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c |   13 +++++++++++++
>   include/linux/soc/mediatek/mtk-cmdq.h  |   11 +++++++++++
>   2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index b6e25f216605..d55dc3296105 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -13,6 +13,7 @@
>   #define CMDQ_POLL_ENABLE_MASK	BIT(0)
>   #define CMDQ_EOC_IRQ_EN		BIT(0)
>   #define CMDQ_REG_TYPE		1
> +#define CMDQ_JUMP_RELATIVE	1
>   
>   struct cmdq_instruction {
>   	union {
> @@ -407,6 +408,18 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
>   }
>   EXPORT_SYMBOL(cmdq_pkt_assign);
>   
> +int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
> +{
> +	struct cmdq_instruction inst = {};
> +
> +	inst.op = CMDQ_CODE_JUMP;
> +	inst.offset = CMDQ_JUMP_RELATIVE;
> +	inst.value = addr >>
> +		cmdq_get_shift_pa(((struct cmdq_client *)pkt->cl)->chan);
> +	return cmdq_pkt_append_command(pkt, inst);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_jump);
> +
>   int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>   {
>   	struct cmdq_instruction inst = { {0} };
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index d9390d76ee14..34354e952f60 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -253,6 +253,17 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
>   int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
>   
>   /**
> + * cmdq_pkt_jump() - Append jump command to the CMDQ packet, ask GCE
> + *		     to execute an instruction that change current thread PC to
> + *		     a physical address which should contains more instruction.
> + * @pkt:        the CMDQ packet
> + * @addr:       physical address of target instruction buffer
> + *
> + * Return: 0 for success; else the error code is returned
> + */
> +int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr);
> +
> +/**
>    * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
>    * @pkt:	the CMDQ packet
>    *
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
