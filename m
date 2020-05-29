Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EBC1E7625
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 08:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549C26E863;
	Fri, 29 May 2020 06:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E5FA6E84B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 00:53:34 +0000 (UTC)
X-UUID: a68046c16bb149f5892918719c8b01ff-20200529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/lOPSyCSRH8SaRh0UrYmb2qBLU0m25A26vWSjOAhAzw=; 
 b=Awvs9rJtUKRmaW223hgHgyROhiX52oAfmrGmw3ZpYy6TYQpmtDDq+SX9c35JGpO7btn9XMChany4W56FhL+V1w5rzroUwt0HDnhFxfEmBTnEyhoy3fIb2Sybs8nzhX6aEMoM7dUieZUwHol5yEuJVSSQiokfnezy2lneosR4RuI=;
X-UUID: a68046c16bb149f5892918719c8b01ff-20200529
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1393919277; Fri, 29 May 2020 08:53:31 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 May 2020 08:53:25 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 May 2020 08:53:24 +0800
Message-ID: <1590713609.1313.1.camel@mtkswgap22>
Subject: Re: [PATCH v6 08/16] soc: mediatek: cmdq: add write_s function
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Fri, 29 May 2020 08:53:29 +0800
In-Reply-To: <086cd50f-1cf5-a87d-9547-7a826e6b6252@gmail.com>
References: <1590685491-17107-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1590685491-17107-9-git-send-email-dennis-yc.hsieh@mediatek.com>
 <086cd50f-1cf5-a87d-9547-7a826e6b6252@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BADAF1CEB1FE522F0D19D2C0252EAD855B25F39E7E640634BA704236E5DB5E2F2000:8
X-MTK: N
X-Mailman-Approved-At: Fri, 29 May 2020 06:46:56 +0000
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

On Thu, 2020-05-28 at 23:08 +0200, Matthias Brugger wrote:
> 
> On 28/05/2020 19:04, Dennis YC Hsieh wrote:
> > add write_s function in cmdq helper functions which
> > writes value contains in internal register to address
> > with large dma access support.
> > 
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-cmdq-helper.c   | 21 ++++++++++++++++++++-
> >  include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
> >  include/linux/soc/mediatek/mtk-cmdq.h    | 20 ++++++++++++++++++++
> >  3 files changed, 41 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index 33153d17c9d9..ee24c0ec0a24 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -18,6 +18,10 @@ struct cmdq_instruction {
> >  	union {
> >  		u32 value;
> >  		u32 mask;
> > +		struct {
> > +			u16 arg_c;
> > +			u16 src_reg;
> > +		};
> >  	};
> >  	union {
> >  		u16 offset;
> > @@ -29,7 +33,7 @@ struct cmdq_instruction {
> >  		struct {
> >  			u8 sop:5;
> >  			u8 arg_c_t:1;
> > -			u8 arg_b_t:1;
> > +			u8 src_t:1;
> 
> This should be part of 7/16.

ok, I'll move it

> 
> >  			u8 dst_t:1;
> >  		};
> >  	};
> > @@ -222,6 +226,21 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
> >  }
> >  EXPORT_SYMBOL(cmdq_pkt_write_mask);
> >  
> > +int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> > +		     u16 addr_low, u16 src_reg_idx)
> > +{
> > +	struct cmdq_instruction inst = { {0} };
> 
> If you want an empty struct on the stack, I think {}; should be enough, right?

Yes, I'll change the style, thanks


Regards,
Dennis

> 
> Regards,
> Matthias
> 
> > +
> > +	inst.op = CMDQ_CODE_WRITE_S;
> > +	inst.src_t = CMDQ_REG_TYPE;
> > +	inst.sop = high_addr_reg_idx;
> > +	inst.offset = addr_low;
> > +	inst.src_reg = src_reg_idx;
> > +
> > +	return cmdq_pkt_append_command(pkt, inst);
> > +}
> > +EXPORT_SYMBOL(cmdq_pkt_write_s);
> > +
> >  int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
> >  {
> >  	struct cmdq_instruction inst = { {0} };
> > diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > index 121c3bb6d3de..ee67dd3b86f5 100644
> > --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> > +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > @@ -59,6 +59,7 @@ enum cmdq_code {
> >  	CMDQ_CODE_JUMP = 0x10,
> >  	CMDQ_CODE_WFE = 0x20,
> >  	CMDQ_CODE_EOC = 0x40,
> > +	CMDQ_CODE_WRITE_S = 0x90,
> >  	CMDQ_CODE_LOGIC = 0xa0,
> >  };
> >  
> > diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> > index 83340211e1d3..d623f1aa7814 100644
> > --- a/include/linux/soc/mediatek/mtk-cmdq.h
> > +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> > @@ -12,6 +12,8 @@
> >  #include <linux/timer.h>
> >  
> >  #define CMDQ_NO_TIMEOUT		0xffffffffu
> > +#define CMDQ_ADDR_HIGH(addr)	((u32)(((addr) >> 16) & GENMASK(31, 0)))
> > +#define CMDQ_ADDR_LOW(addr)	((u16)(addr) | BIT(1))
> >  
> >  struct cmdq_pkt;
> >  
> > @@ -102,6 +104,24 @@ int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value);
> >  int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
> >  			u16 offset, u32 value, u32 mask);
> >  
> > +/**
> > + * cmdq_pkt_write_s() - append write_s command to the CMDQ packet
> > + * @pkt:	the CMDQ packet
> > + * @high_addr_reg_idx:	internal register ID which contains high address of pa
> > + * @addr_low:	low address of pa
> > + * @src_reg_idx:	the CMDQ internal register ID which cache source value
> > + * @mask:	the specified target address mask, use U32_MAX if no need
> > + *
> > + * Return: 0 for success; else the error code is returned
> > + *
> > + * Support write value to physical address without subsys. Use CMDQ_ADDR_HIGH()
> > + * to get high address and call cmdq_pkt_assign() to assign value into internal
> > + * reg. Also use CMDQ_ADDR_LOW() to get low address for addr_low parameter when
> > + * call to this function.
> > + */
> > +int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> > +		     u16 addr_low, u16 src_reg_idx);
> > +
> >  /**
> >   * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
> >   * @pkt:	the CMDQ packet
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
