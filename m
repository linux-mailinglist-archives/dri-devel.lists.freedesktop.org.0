Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3440817A101
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 09:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88CEA6EBA6;
	Thu,  5 Mar 2020 08:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id E34DC6E03C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 00:49:08 +0000 (UTC)
X-UUID: 6a35557ffad6498e860e9d885c29fc43-20200305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Dt+NjDKJnvFkl8R5AeUjlcgnglhu+f9HBOgNSX0bmEE=; 
 b=Xwj1loR4Nq+7Sw402bvRcCWVaxghwi193wHlRv+MIMIqTepRD0jaBRlF5spKuX1dfN/9eybs2Zq1+/B4xrizQ6FY0O+OqjuwxoBPWbgk3EMfUjbqM6NwzD1MNP/FICR1hPoVYC3lWMFV5jWpTsupB8G/AUN03rZz6F2+wxLuV70=;
X-UUID: 6a35557ffad6498e860e9d885c29fc43-20200305
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1851158184; Thu, 05 Mar 2020 08:49:04 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Mar 2020 08:47:54 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 5 Mar 2020 08:48:18 +0800
Message-ID: <1583369342.28558.0.camel@mtkswgap22>
Subject: Re: [PATCH v4 11/13] soc: mediatek: cmdq: add jump function
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Thu, 5 Mar 2020 08:49:02 +0800
In-Reply-To: <1583290652.1062.2.camel@mtksdaap41>
References: <1583233125-7827-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583233125-7827-12-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583290652.1062.2.camel@mtksdaap41>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 05 Mar 2020 08:14:30 +0000
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

Hi CK,

Thanks for your comment.

On Wed, 2020-03-04 at 10:57 +0800, CK Hu wrote:
> Hi, Dennis:
> 
> On Tue, 2020-03-03 at 18:58 +0800, Dennis YC Hsieh wrote:
> > Add jump function so that client can jump to any address which
> > contains instruction.
> > 
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-cmdq-helper.c | 12 ++++++++++++
> >  include/linux/soc/mediatek/mtk-cmdq.h  | 11 +++++++++++
> >  2 files changed, 23 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index 59bc1164b411..f27c67034880 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -372,6 +372,18 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
> >  }
> >  EXPORT_SYMBOL(cmdq_pkt_assign);
> >  
> > +int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
> > +{
> > +	struct cmdq_instruction inst = { {0} };
> > +
> > +	inst.op = CMDQ_CODE_JUMP;
> > +	inst.offset = 1;
> 
> Symbolize the value '1'.

miss in v4, will add in next version, thanks.


Regards,
Dennis


> 
> Regards,
> CK
> 
> > +	inst.value = addr >>
> > +		cmdq_mbox_shift(((struct cmdq_client *)pkt->cl)->chan);
> > +	return cmdq_pkt_append_command(pkt, inst);
> > +}
> > +EXPORT_SYMBOL(cmdq_pkt_jump);
> > +
> >  int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
> >  {
> >  	struct cmdq_instruction inst = { {0} };
> > diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> > index 99e77155f967..1a6c56f3bec1 100644
> > --- a/include/linux/soc/mediatek/mtk-cmdq.h
> > +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> > @@ -213,6 +213,17 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
> >   */
> >  int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
> >  
> > +/**
> > + * cmdq_pkt_jump() - Append jump command to the CMDQ packet, ask GCE
> > + *		     to execute an instruction that change current thread PC to
> > + *		     a physical address which should contains more instruction.
> > + * @pkt:        the CMDQ packet
> > + * @addr:       physical address of target instruction buffer
> > + *
> > + * Return: 0 for success; else the error code is returned
> > + */
> > +int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr);
> > +
> >  /**
> >   * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
> >   * @pkt:	the CMDQ packet
> 
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
