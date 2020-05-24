Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 720601E07B8
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B66889D61;
	Mon, 25 May 2020 07:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 64C3089DCF
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 17:31:11 +0000 (UTC)
X-UUID: 973c9456470544e9914d24d4dfde948a-20200525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4ZqV79H8kGJw9jKHV///buqGRMGB7UkABgH45B0mwEU=; 
 b=IFOC0kdUWv+Q7vv18nDp5/HQTmtE5SnyY3Y7I4c2SNPNYkAY8jXh3mTkMNvZJl/uHKbiJRJHTQ56h+gSNmhaoUOvd/sl4gd9UZJ8xUMf3HpRMPpPOxDf1NKYJvD3SCX3CxUArosRQKgLtpSjNpfBbKFjPtoc1r5x/SLzdr2xaco=;
X-UUID: 973c9456470544e9914d24d4dfde948a-20200525
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1623128748; Mon, 25 May 2020 01:31:10 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 May 2020 01:30:58 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 May 2020 01:30:58 +0800
Message-ID: <1590341462.31286.19.camel@mtkswgap22>
Subject: Re: [PATCH v5 09/13] soc: mediatek: cmdq: add write_s value function
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 25 May 2020 01:31:02 +0800
In-Reply-To: <f9fd9ea8-f706-ed4a-4c83-c53ad092035c@gmail.com>
References: <1583664775-19382-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583664775-19382-10-git-send-email-dennis-yc.hsieh@mediatek.com>
 <f9fd9ea8-f706-ed4a-4c83-c53ad092035c@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B6B32E7834C0775BF207157EDF3D12E23C8F2F2B886FA00EB0AE01EEBDB016C52000:8
X-MTK: N
X-Mailman-Approved-At: Mon, 25 May 2020 07:21:04 +0000
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
 wsd_upstream@mediatek.com, David Airlie <airlied@linux.ie>,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Houlong Wei <houlong.wei@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthias,

Thanks for your comment.

On Sat, 2020-05-16 at 20:20 +0200, Matthias Brugger wrote:
> 
> On 08/03/2020 11:52, Dennis YC Hsieh wrote:
> > add write_s function in cmdq helper functions which
> > writes a constant value to address with large dma
> > access support.
> > 
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-cmdq-helper.c | 26 ++++++++++++++++++++++++++
> >  include/linux/soc/mediatek/mtk-cmdq.h  | 14 ++++++++++++++
> >  2 files changed, 40 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index 03c129230cd7..a9ebbabb7439 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -269,6 +269,32 @@ int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> >  }
> >  EXPORT_SYMBOL(cmdq_pkt_write_s);
> >  
> > +int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> > +			   u16 addr_low, u32 value, u32 mask)
> > +{
> > +	struct cmdq_instruction inst = { {0} };
> > +	int err;
> > +
> > +	if (mask != U32_MAX) {
> > +		inst.op = CMDQ_CODE_MASK;
> > +		inst.mask = ~mask;
> > +		err = cmdq_pkt_append_command(pkt, inst);
> > +		if (err < 0)
> > +			return err;
> > +
> > +		inst.op = CMDQ_CODE_WRITE_S_MASK;
> > +	} else {
> > +		inst.op = CMDQ_CODE_WRITE_S;
> > +	}
> > +
> > +	inst.sop = high_addr_reg_idx;
> 
> Writing u16 value in a 5 bit wide variable?

We need only 5 bits in this case. I'll change high_addr_reg_idx
parameter to u8.

> 
> > +	inst.offset = addr_low;
> > +	inst.value = value;
> > +
> > +	return cmdq_pkt_append_command(pkt, inst);
> > +}
> > +EXPORT_SYMBOL(cmdq_pkt_write_s_value);
> > +
> >  int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
> >  {
> >  	struct cmdq_instruction inst = { {0} };
> > diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> > index 01b4184af310..fec292aac83c 100644
> > --- a/include/linux/soc/mediatek/mtk-cmdq.h
> > +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> > @@ -135,6 +135,20 @@ int cmdq_pkt_read_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx, u16 addr_low,
> >  int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> >  		     u16 addr_low, u16 src_reg_idx, u32 mask);
> >  
> > +/**
> > + * cmdq_pkt_write_s_value() - append write_s command with mask to the CMDQ
> > + *			      packet which write value to a physical address
> > + * @pkt:	the CMDQ packet
> > + * @high_addr_reg_idx:	internal regisger ID which contains high address of pa
> 
> register

will fix


Regards,
Dennis

> 
> > + * @addr_low:	low address of pa
> > + * @value:	the specified target value
> > + * @mask:	the specified target mask
> > + *
> > + * Return: 0 for success; else the error code is returned
> > + */
> > +int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> > +			   u16 addr_low, u32 value, u32 mask);
> > +
> >  /**
> >   * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
> >   * @pkt:	the CMDQ packet
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
