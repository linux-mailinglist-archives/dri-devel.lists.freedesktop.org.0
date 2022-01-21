Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 324BB495820
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 03:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5EF910E928;
	Fri, 21 Jan 2022 02:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454DF10E921
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 02:08:54 +0000 (UTC)
X-UUID: d89c17bc827a4c38b6c8ef0c5ffc0d83-20220121
X-UUID: d89c17bc827a4c38b6c8ef0c5ffc0d83-20220121
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1408320461; Fri, 21 Jan 2022 10:08:49 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 21 Jan 2022 10:08:47 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 21 Jan 2022 10:08:47 +0800
Message-ID: <e4328a0fd2c97d073793532d238abd781797fe13.camel@mediatek.com>
Subject: Re: [PATCH v1, 1/1] soc: mediatek: cmdq: add cmdq_pkt_poll_addr
 function
From: CK Hu <ck.hu@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
Date: Fri, 21 Jan 2022 10:08:47 +0800
In-Reply-To: <20220120074311.2243-2-yongqiang.niu@mediatek.com>
References: <20220120074311.2243-1-yongqiang.niu@mediatek.com>
 <20220120074311.2243-2-yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, mtk18742 <moudy.ho@mediatek.com>,
 David Airlie <airlied@linux.ie>, Dennis YC
 Hsieh <dennis-yc.hsieh@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Yongqiang:

On Thu, 2022-01-20 at 15:43 +0800, Yongqiang Niu wrote:
> From: mtk18742 <moudy.ho@mediatek.com>
> 
> add cmdq_pkt_poll_addr function in cmdq helper functions
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c   | 39
> ++++++++++++++++++++++++
>  include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
>  include/linux/soc/mediatek/mtk-cmdq.h    |  2 ++
>  3 files changed, 42 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c
> b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 3c8e4212d941..6c5cfb284140 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -344,6 +344,45 @@ int cmdq_pkt_set_event(struct cmdq_pkt *pkt, u16
> event)
>  }
>  EXPORT_SYMBOL(cmdq_pkt_set_event);
>  
> +s32 cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, u32 value, u32 addr,
> u32 mask, u8 reg_gpr)
> +{
> +	struct cmdq_instruction inst = { {0} };
> +
> +	s32 err;
> +
> +	if (mask != 0xffffffff) {
> +		inst.op = CMDQ_CODE_MASK;
> +		inst.mask = ~mask;
> +		err = cmdq_pkt_append_command(pkt, inst);
> +		if (err != 0)
> +			return err;
> +
> +		addr = addr | 0x1;
> +	}
> +
> +	/* Move extra handle APB address to GPR */
> +	inst.op = CMDQ_CODE_MOVE;
> +	inst.value = addr;
> +	inst.sop = reg_gpr;
> +	inst.dst_t = 1;
> +	err = cmdq_pkt_append_command(pkt, inst);
> +	if (err != 0)
> +		pr_err("%s fail append command move addr to reg
> err:%d",
> +			__func__, err);

cmdq_pkt_assign() could assign a value to GPR, so remove this part.

> +
> +	inst.op = CMDQ_CODE_POLL;
> +	inst.value = value;
> +	inst.sop = reg_gpr;
> +	inst.dst_t = 1;
> +	err = cmdq_pkt_append_command(pkt, inst);
> +	if (err != 0)
> +		pr_err("%s fail append command poll err:%d",
> +			__func__, err);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL(cmdq_pkt_poll_addr);
> +
>  int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
>  		  u16 offset, u32 value)
>  {
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h
> b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index 44365aab043c..a27329fd7c7f 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -54,6 +54,7 @@
>   */
>  enum cmdq_code {
>  	CMDQ_CODE_MASK = 0x02,
> +	CMDQ_CODE_MOVE = 0x02,
>  	CMDQ_CODE_WRITE = 0x04,
>  	CMDQ_CODE_POLL = 0x08,
>  	CMDQ_CODE_JUMP = 0x10,
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h
> b/include/linux/soc/mediatek/mtk-cmdq.h
> index ac6b5f3cba95..28dc5ce0ff03 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -280,4 +280,6 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
>  int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb
> cb,
>  			 void *data);
>  

Add comment for this function, parameters, and return value like other
interface.

Regards,
CK

> +s32 cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, u32 value, u32 addr,
> u32 mask, u8 reg_gpr);
> +
>  #endif	/* __MTK_CMDQ_H__ */

