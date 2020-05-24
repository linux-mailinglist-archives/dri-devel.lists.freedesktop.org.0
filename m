Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C291E07BD
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C4A89D5C;
	Mon, 25 May 2020 07:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Sun, 24 May 2020 17:06:42 UTC
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9B09789BFD
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 17:06:42 +0000 (UTC)
X-UUID: c1861f6630564397b9c51b0e36a43069-20200525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VWg9xLHl1hZCSOAWL6vw6qKUNe5aIY7KvlZ9nTgIkD0=; 
 b=PtnRGiXHGb9NjV39BtEj1gEVvO0QO4zL0yD9hrYcKyZi2pXyb/GoETvF3vJA+kOuJAR8hXMrqQEGDM15Ky/xJm8ZHF065bRAkPVIVOPyT+C7D7yK5SbTJBmqwXb2v3jVMAtuO1W7+Q9PKuCFS2EsPd/TXdq/usJAifzL/OKdxHw=;
X-UUID: c1861f6630564397b9c51b0e36a43069-20200525
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1331326202; Mon, 25 May 2020 01:01:37 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 May 2020 01:01:32 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 May 2020 01:01:31 +0800
Message-ID: <1590339695.31286.4.camel@mtkswgap22>
Subject: Re: [PATCH v5 06/13] soc: mediatek: cmdq: add assign function
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 25 May 2020 01:01:35 +0800
In-Reply-To: <c671ea8a-07fa-a050-4679-c7aa15d19a9d@gmail.com>
References: <1583664775-19382-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583664775-19382-7-git-send-email-dennis-yc.hsieh@mediatek.com>
 <c671ea8a-07fa-a050-4679-c7aa15d19a9d@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2DF60E4E6D76568CECD68ACA0056E41726E257DA51C8FFE651A6CBAA28A26BFD2000:8
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

On Sat, 2020-05-16 at 19:59 +0200, Matthias Brugger wrote:
> 
> On 08/03/2020 11:52, Dennis YC Hsieh wrote:
> > Add assign function in cmdq helper which assign constant value into
> > internal register by index.
> > 
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-cmdq-helper.c   | 24 +++++++++++++++++++++++-
> >  include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
> >  include/linux/soc/mediatek/mtk-cmdq.h    | 14 ++++++++++++++
> >  3 files changed, 38 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index 98f23ba3ba47..33153d17c9d9 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -12,6 +12,7 @@
> >  #define CMDQ_WRITE_ENABLE_MASK	BIT(0)
> >  #define CMDQ_POLL_ENABLE_MASK	BIT(0)
> >  #define CMDQ_EOC_IRQ_EN		BIT(0)
> > +#define CMDQ_REG_TYPE		1
> >  
> >  struct cmdq_instruction {
> >  	union {
> > @@ -21,8 +22,17 @@ struct cmdq_instruction {
> >  	union {
> >  		u16 offset;
> >  		u16 event;
> > +		u16 reg_dst;
> > +	};
> > +	union {
> > +		u8 subsys;
> > +		struct {
> > +			u8 sop:5;
> > +			u8 arg_c_t:1;
> > +			u8 arg_b_t:1;
> > +			u8 dst_t:1;
> > +		};
> 
> This union seems without context in this patch. Please drop.
> 

The dst_t use in cmdq_pkt_assign function so how about merge other
variables to reserved and leave dst_t ?

struct {
	u8 reserved_t:7;
	u8 dst_t:1;
};


Regards,
Dennis


> Regards,
> Matthias
> 
> >  	};
> > -	u8 subsys;
> >  	u8 op;
> >  };
> >  
> > @@ -277,6 +287,18 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
> >  }
> >  EXPORT_SYMBOL(cmdq_pkt_poll_mask);
> >  
> > +int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
> > +{
> > +	struct cmdq_instruction inst = { {0} };
> > +
> > +	inst.op = CMDQ_CODE_LOGIC;
> > +	inst.dst_t = CMDQ_REG_TYPE;
> > +	inst.reg_dst = reg_idx;
> > +	inst.value = value;
> > +	return cmdq_pkt_append_command(pkt, inst);
> > +}
> > +EXPORT_SYMBOL(cmdq_pkt_assign);
> > +
> >  static int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
> >  {
> >  	struct cmdq_instruction inst = { {0} };
> > diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > index dfe5b2eb85cc..121c3bb6d3de 100644
> > --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> > +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > @@ -59,6 +59,7 @@ enum cmdq_code {
> >  	CMDQ_CODE_JUMP = 0x10,
> >  	CMDQ_CODE_WFE = 0x20,
> >  	CMDQ_CODE_EOC = 0x40,
> > +	CMDQ_CODE_LOGIC = 0xa0,
> >  };
> >  
> >  enum cmdq_cb_status {
> > diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> > index a74c1d5acdf3..83340211e1d3 100644
> > --- a/include/linux/soc/mediatek/mtk-cmdq.h
> > +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> > @@ -152,6 +152,20 @@ int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
> >   */
> >  int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
> >  		       u16 offset, u32 value, u32 mask);
> > +
> > +/**
> > + * cmdq_pkt_assign() - Append logic assign command to the CMDQ packet, ask GCE
> > + *		       to execute an instruction that set a constant value into
> > + *		       internal register and use as value, mask or address in
> > + *		       read/write instruction.
> > + * @pkt:	the CMDQ packet
> > + * @reg_idx:	the CMDQ internal register ID
> > + * @value:	the specified value
> > + *
> > + * Return: 0 for success; else the error code is returned
> > + */
> > +int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
> > +
> >  /**
> >   * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute the CMDQ
> >   *                          packet and call back at the end of done packet
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
