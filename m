Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C79E82EEED5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 09:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA8B6E7EA;
	Fri,  8 Jan 2021 08:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3156E6E5C1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 01:48:14 +0000 (UTC)
X-UUID: 729c725f5e6242db9551a4ee653bd7bd-20210108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=NPP5jpMnteAgsJpkoNqsMUTLM/8AlhOp/XPWd4WayzM=; 
 b=aupKRcA3tCWLDs1A4m1gsP2wep+Lkr9qQ7DtVqvjgrg+uMwDFXNFg+0K28SyvrMW5FgFJXfFsi2Aiw04lRp13IxGKiPTbyvTQRKDuZp7kJf9jtCoJSF6OKJc71au9cChr/0wMNUZRkaeJuJuoO65wq68p5JE9MXTisQoLz6H2OA=;
X-UUID: 729c725f5e6242db9551a4ee653bd7bd-20210108
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 488800082; Fri, 08 Jan 2021 09:48:09 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs08n2.mediatek.inc
 (172.21.101.56) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 8 Jan 2021 09:48:06 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jan 2021 09:48:05 +0800
Message-ID: <1610070485.1574.10.camel@mhfsdcap03>
Subject: Re: [PATCH v2] soc: mediatek: cmdq: add address shift in jump
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 8 Jan 2021 09:48:05 +0800
In-Reply-To: <1608712499-24956-2-git-send-email-yongqiang.niu@mediatek.com>
References: <1608712499-24956-1-git-send-email-yongqiang.niu@mediatek.com>
 <1608712499-24956-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 68847612D0C798759DAC2DE39BDF7DDFAD4EDA6D3284292B08F310D98A8DC2A62000:8
X-MTK: N
X-Mailman-Approved-At: Fri, 08 Jan 2021 08:55:35 +0000
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 dennis-yc.hsieh@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, damon.chu@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-12-23 at 16:34 +0800, Yongqiang Niu wrote:
> Add address shift when compose jump instruction
> to compatible with 35bit format.
> 
> Fixes: 0858fde496f8 ("mailbox: cmdq: variablize address shift in platform")
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 5665b6e..75378e3 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -168,7 +168,8 @@ static void cmdq_task_insert_into_thread(struct cmdq_task *task)
>  	dma_sync_single_for_cpu(dev, prev_task->pa_base,
>  				prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
>  	prev_task_base[CMDQ_NUM_CMD(prev_task->pkt) - 1] =
> -		(u64)CMDQ_JUMP_BY_PA << 32 | task->pa_base;
> +		(u64)CMDQ_JUMP_BY_PA << 32 |
> +		(task->pa_base >> task->cmdq->shift_pa);
>  	dma_sync_single_for_device(dev, prev_task->pa_base,
>  				   prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
>  

hi jassi

please confirm is there any question about this patch.
if not, please apply this into next version, tks
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
