Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC79204BA1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 09:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B346E972;
	Tue, 23 Jun 2020 07:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1A08B6E83E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 15:40:04 +0000 (UTC)
X-UUID: a34d21fcf9f848ef86d638147d7f39eb-20200622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4oG//lsr7WdU0sHSnJkzG35AGLgyMUzysVPRVO5h3hw=; 
 b=f3XIaZMmkgBYWROQTozQj3+ZVsPfU/Yg5qS8MN672i/M4VXosArM/LwD6peLJNWuIODscHcjy+zMy+WmZcwtKE2WMEFZ/b0b0qc2LIYfkbLeV4hu/mrjuOjZbbb5sfjSBPsXvTEKiBeY6WzAT6am6AP6ZVJS816FYtVwUEWQ3Bw=;
X-UUID: a34d21fcf9f848ef86d638147d7f39eb-20200622
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 374711574; Mon, 22 Jun 2020 23:40:00 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Jun 2020 23:39:55 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Jun 2020 23:39:55 +0800
Message-ID: <1592840399.1307.15.camel@mtkswgap22>
Subject: Re: [PATCH v1 10/11] soc: mediatek: cmdq: add clear option in
 cmdq_pkt_wfe api
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 22 Jun 2020 23:39:59 +0800
In-Reply-To: <8b469701-2295-2cb5-1b60-8681322db678@gmail.com>
References: <1592749115-24158-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1592749115-24158-11-git-send-email-dennis-yc.hsieh@mediatek.com>
 <8b469701-2295-2cb5-1b60-8681322db678@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Tue, 23 Jun 2020 07:48:47 +0000
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
Cc: wsd_upstream@mediatek.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 HS Liao <hs.liao@mediatek.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthias,

thanks for your comment.

On Mon, 2020-06-22 at 13:19 +0200, Matthias Brugger wrote:
> 
> On 21/06/2020 16:18, Dennis YC Hsieh wrote:
> > Add clear parameter to let client decide if
> > event should be clear to 0 after GCE receive it.
> > 
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |    2 +-
> >  drivers/soc/mediatek/mtk-cmdq-helper.c   |    5 +++--
> >  include/linux/mailbox/mtk-cmdq-mailbox.h |    3 +--
> >  include/linux/soc/mediatek/mtk-cmdq.h    |    5 +++--
> >  4 files changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index 7daaabc26eb1..a065b3a412cf 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -488,7 +488,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
> >  	if (mtk_crtc->cmdq_client) {
> >  		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
> >  		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
> > -		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event);
> > +		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
> 
> This does not set CMDQ_WFE_UPDATE while the old code did. Is this a bug fix or a
> bug in the code?
> If it's a fix, please provide a fixes tag.

no need to to update again since event always clear before wait.
I'll provide a fix tag, thanks.


Regards,
Dennis

> 
> Thanks,
> Matthias
> 
> >  		mtk_crtc_ddp_config(crtc, cmdq_handle);
> >  		cmdq_pkt_finalize(cmdq_handle);
> >  		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index 009f86ae72c6..13f78c9b5901 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -315,15 +315,16 @@ int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
> >  }
> >  EXPORT_SYMBOL(cmdq_pkt_write_s_mask_value);
> >  
> > -int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
> > +int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear)
> >  {
> >  	struct cmdq_instruction inst = { {0} };
> > +	u32 clear_option = clear ? CMDQ_WFE_UPDATE : 0;
> >  
> >  	if (event >= CMDQ_MAX_EVENT)
> >  		return -EINVAL;
> >  
> >  	inst.op = CMDQ_CODE_WFE;
> > -	inst.value = CMDQ_WFE_OPTION;
> > +	inst.value = CMDQ_WFE_OPTION | clear_option;
> >  	inst.event = event;
> >  
> >  	return cmdq_pkt_append_command(pkt, inst);
> > diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > index 3f6bc0dfd5da..42d2a30e6a70 100644
> > --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> > +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > @@ -27,8 +27,7 @@
> >   * bit 16-27: update value
> >   * bit 31: 1 - update, 0 - no update
> >   */
> > -#define CMDQ_WFE_OPTION			(CMDQ_WFE_UPDATE | CMDQ_WFE_WAIT | \
> > -					CMDQ_WFE_WAIT_VALUE)
> > +#define CMDQ_WFE_OPTION			(CMDQ_WFE_WAIT | CMDQ_WFE_WAIT_VALUE)
> >  
> >  /** cmdq event maximum */
> >  #define CMDQ_MAX_EVENT			0x3ff
> > diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> > index 18364d81e8f7..4b5f5d154bad 100644
> > --- a/include/linux/soc/mediatek/mtk-cmdq.h
> > +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> > @@ -182,11 +182,12 @@ int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
> >  /**
> >   * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
> >   * @pkt:	the CMDQ packet
> > - * @event:	the desired event type to "wait and CLEAR"
> > + * @event:	the desired event type to wait
> > + * @clear:	clear event or not after event arrive
> >   *
> >   * Return: 0 for success; else the error code is returned
> >   */
> > -int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event);
> > +int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear);
> >  
> >  /**
> >   * cmdq_pkt_clear_event() - append clear event command to the CMDQ packet
> > 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
