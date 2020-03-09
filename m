Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB4017D7ED
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 02:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC2F89F38;
	Mon,  9 Mar 2020 01:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id CE07789F38
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 01:48:21 +0000 (UTC)
X-UUID: ed99637e9f564bcc8bc0e65f8c9787cb-20200309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lji2RDfjYiKO0JLX1yRMYaI2Rm6gbe1z5aG0az/wNdo=; 
 b=gjOLEitIurGZfl1wvPLfp7ggzS59GLiZHk8RZuNQKQ0b0GULsvKPS4CeSnIBsDS5m9nYxFfohwwNVy3C84Fmceo94BXePwla9bt6naF1eMNBKVJ9nZP1VSm7Afw4vRQA+UjzMtW9oOHda/LZkn1y+0/WuIMOUY5v7O9HwPWxxgo=;
X-UUID: ed99637e9f564bcc8bc0e65f8c9787cb-20200309
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1109298110; Mon, 09 Mar 2020 09:48:18 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Mar 2020 09:47:20 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 9 Mar 2020 09:48:35 +0800
Message-ID: <1583718497.28331.0.camel@mtksdaap41>
Subject: Re: [PATCH v5 11/13] soc: mediatek: cmdq: add jump function
From: CK Hu <ck.hu@mediatek.com>
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Date: Mon, 9 Mar 2020 09:48:17 +0800
In-Reply-To: <1583664775-19382-12-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1583664775-19382-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583664775-19382-12-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, David
 Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 HS Liao <hs.liao@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dennis:

On Sun, 2020-03-08 at 18:52 +0800, Dennis YC Hsieh wrote:
> Add jump function so that client can jump to any address which
> contains instruction.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c | 13 +++++++++++++
>  include/linux/soc/mediatek/mtk-cmdq.h  | 11 +++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 59bc1164b411..bb5be20fc70a 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -13,6 +13,7 @@
>  #define CMDQ_POLL_ENABLE_MASK	BIT(0)
>  #define CMDQ_EOC_IRQ_EN		BIT(0)
>  #define CMDQ_REG_TYPE		1
> +#define CMDQ_JUMP_RELATIVE	1
>  
>  struct cmdq_instruction {
>  	union {
> @@ -372,6 +373,18 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
>  }
>  EXPORT_SYMBOL(cmdq_pkt_assign);
>  
> +int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
> +{
> +	struct cmdq_instruction inst = { {0} };
> +
> +	inst.op = CMDQ_CODE_JUMP;
> +	inst.offset = CMDQ_JUMP_RELATIVE;
> +	inst.value = addr >>
> +		cmdq_mbox_shift(((struct cmdq_client *)pkt->cl)->chan);
> +	return cmdq_pkt_append_command(pkt, inst);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_jump);
> +
>  int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>  {
>  	struct cmdq_instruction inst = { {0} };
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 99e77155f967..1a6c56f3bec1 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -213,6 +213,17 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
>   */
>  int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
>  
> +/**
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
>  /**
>   * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
>   * @pkt:	the CMDQ packet

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
