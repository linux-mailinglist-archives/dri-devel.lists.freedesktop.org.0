Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40301178859
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 03:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9C86E115;
	Wed,  4 Mar 2020 02:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id D7D426E115
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 02:32:57 +0000 (UTC)
X-UUID: 9a1ed69c69c748128d7770e5bb1f5166-20200304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=mYLX3IiH72ajlTAiOtL8JHWaOes5nllQiW2Y7ugTO8A=; 
 b=Hb/slNjuHGxwAPkxv1ZQDDjR1MwVJpZTP2ajDZcBGUPN1lViR8MIM7PnyEduWkYR5eQ/qy0N00+1BIBwz6ppXq857XVJbc7PJ6JgdAZvJVVK5gRcOvW1sEHEdgzwBElQaw7CyJI5YsXtZn+h5HRwaQh9cy8YWpiJ4S7feK5WiyI=;
X-UUID: 9a1ed69c69c748128d7770e5bb1f5166-20200304
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1111508034; Wed, 04 Mar 2020 10:32:52 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Mar 2020 10:31:55 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Mar 2020 10:32:11 +0800
Message-ID: <1583289170.32049.1.camel@mtksdaap41>
Subject: Re: [PATCH v4 02/13] mailbox: cmdq: variablize address shift in
 platform
From: CK Hu <ck.hu@mediatek.com>
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Date: Wed, 4 Mar 2020 10:32:50 +0800
In-Reply-To: <1583233125-7827-3-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1583233125-7827-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583233125-7827-3-git-send-email-dennis-yc.hsieh@mediatek.com>
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

On Tue, 2020-03-03 at 18:58 +0800, Dennis YC Hsieh wrote:
> Some gce hardware shift pc and end address in register to support
> large dram addressing.
> Implement gce address shift when write or read pc and end register.
> And add shift bit in platform definition.
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c       | 61 ++++++++++++++++++------
>  drivers/soc/mediatek/mtk-cmdq-helper.c   |  3 +-
>  include/linux/mailbox/mtk-cmdq-mailbox.h |  2 +
>  3 files changed, 50 insertions(+), 16 deletions(-)
> 

[snip]

>  
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index de20e6cba83b..2e1bc513569b 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -291,7 +291,8 @@ static int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>  
>  	/* JUMP to end */
>  	inst.op = CMDQ_CODE_JUMP;
> -	inst.value = CMDQ_JUMP_PASS;
> +	inst.value = CMDQ_JUMP_PASS >>
> +		cmdq_mbox_shift(((struct cmdq_client *)pkt->cl)->chan);

Why not just cmdq_mbox_shift(pkt->cl->chan) ?

Regards,
CK

>  	err = cmdq_pkt_append_command(pkt, inst);
>  
>  	return err;
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index a4dc45fbec0a..dfe5b2eb85cc 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -88,4 +88,6 @@ struct cmdq_pkt {
>  	void			*cl;
>  };
>  
> +u8 cmdq_mbox_shift(struct mbox_chan *chan);
> +
>  #endif /* __MTK_CMDQ_MAILBOX_H__ */

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
