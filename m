Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AD61788CC
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 03:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94FF6EAA7;
	Wed,  4 Mar 2020 02:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 875766EAA7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 02:59:36 +0000 (UTC)
X-UUID: f2a679150a7f40e995fb03d8fe2b5cc1-20200304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Z1qeUZgtAaMPORZUPtFp+pNwtaKiDa0SS964FcwgJfA=; 
 b=GwQ6SaJ2wI2zLVOyHdna+OCeQrRKOqVRo7nsEYEQmGgHNSpANp+n6Qr191kgiycEGrZNgjv4V33/E9MBvtgScY/PZA2KfLhoTnR8lOx8r8iFKUcSb2Abj5fhd8v2eX/g3ppaVHXk10l/V0VdLUzhWTQSfDKrKgcYg9/FxwD5asg=;
X-UUID: f2a679150a7f40e995fb03d8fe2b5cc1-20200304
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 666378015; Wed, 04 Mar 2020 10:59:30 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Mar 2020 11:00:52 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Mar 2020 10:56:57 +0800
Message-ID: <1583290769.1062.4.camel@mtksdaap41>
Subject: Re: [PATCH v4 02/13] mailbox: cmdq: variablize address shift in
 platform
From: CK Hu <ck.hu@mediatek.com>
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Date: Wed, 4 Mar 2020 10:59:29 +0800
In-Reply-To: <1583289170.32049.1.camel@mtksdaap41>
References: <1583233125-7827-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583233125-7827-3-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583289170.32049.1.camel@mtksdaap41>
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

On Wed, 2020-03-04 at 10:32 +0800, CK Hu wrote:
> Hi, Dennis:
> 
> On Tue, 2020-03-03 at 18:58 +0800, Dennis YC Hsieh wrote:
> > Some gce hardware shift pc and end address in register to support
> > large dram addressing.
> > Implement gce address shift when write or read pc and end register.
> > And add shift bit in platform definition.
> > 
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > ---
> >  drivers/mailbox/mtk-cmdq-mailbox.c       | 61 ++++++++++++++++++------
> >  drivers/soc/mediatek/mtk-cmdq-helper.c   |  3 +-
> >  include/linux/mailbox/mtk-cmdq-mailbox.h |  2 +
> >  3 files changed, 50 insertions(+), 16 deletions(-)
> > 
> 
> [snip]
> 
> >  
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index de20e6cba83b..2e1bc513569b 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -291,7 +291,8 @@ static int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
> >  
> >  	/* JUMP to end */
> >  	inst.op = CMDQ_CODE_JUMP;
> > -	inst.value = CMDQ_JUMP_PASS;
> > +	inst.value = CMDQ_JUMP_PASS >>
> > +		cmdq_mbox_shift(((struct cmdq_client *)pkt->cl)->chan);
> 
> Why not just cmdq_mbox_shift(pkt->cl->chan) ?

Sorry, the type of pkt->cl is 'void *', so you need to cast it.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Regards,
> CK
> 
> >  	err = cmdq_pkt_append_command(pkt, inst);
> >  
> >  	return err;
> > diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > index a4dc45fbec0a..dfe5b2eb85cc 100644
> > --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> > +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > @@ -88,4 +88,6 @@ struct cmdq_pkt {
> >  	void			*cl;
> >  };
> >  
> > +u8 cmdq_mbox_shift(struct mbox_chan *chan);
> > +
> >  #endif /* __MTK_CMDQ_MAILBOX_H__ */
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
