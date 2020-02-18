Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE20162226
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 09:22:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104F86E194;
	Tue, 18 Feb 2020 08:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 854E26E194
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 08:22:45 +0000 (UTC)
X-UUID: 3923b5bdecd74763b460bd7dc9a86b7f-20200218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SfaeYyzD1vskIHsIX3CHP6DvU8UKTsX3PGwgpB+tsvc=; 
 b=mVf66q9caClDpvIVT7XpzG1PZLpTugIeklyrENikbbWCe88V8ZUSqYDnJ/FM65a8FTiEeBSkR4or2kQYIVUXA+Prp5pf4UZPj7CbYIdGy8MadR+o1djiyBN+N9gIAQDtxnqjhBb3VHIf4ziOQuT7HbYR114CQcRJ+LxH/ntw9y8=;
X-UUID: 3923b5bdecd74763b460bd7dc9a86b7f-20200218
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 369555937; Tue, 18 Feb 2020 16:22:43 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 18 Feb 2020 16:22:07 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 18 Feb 2020 16:22:24 +0800
Message-ID: <1582014162.20566.2.camel@mtksdaap41>
Subject: Re: [PATCH 2/3] drm/mediatek: make sure previous message done or be
 aborted before send
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Tue, 18 Feb 2020 16:22:42 +0800
In-Reply-To: <1581662912.17949.4.camel@mtksdaap41>
References: <20200214044954.16923-1-bibby.hsieh@mediatek.com>
 <20200214044954.16923-2-bibby.hsieh@mediatek.com>
 <1581662912.17949.4.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 971137264DABD4948DC8DF38BF36DD743309BA80C941579AAD6973CA1A1390162000:8
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
Cc: drinkcat@chromium.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tfiga@chromium.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bibby:

On Fri, 2020-02-14 at 14:48 +0800, CK Hu wrote:
> Hi, Bibby:
> 
> On Fri, 2020-02-14 at 12:49 +0800, Bibby Hsieh wrote:
> > Mediatek CMDQ driver removed atomic parameter and implementation
> > related to atomic. DRM driver need to make sure previous message
> > done or be aborted before we send next message.
> > 
> > If previous message is still waiting for event, it means the
> > setting hasn't been updated into display hardware register,
> > we can abort the message and send next message to update the
> > newest setting into display hardware.
> > If previous message already started, we have to wait it until
> > transmission has been completed.
> > 
> > So we flush mbox client before we send new message to controller
> > driver.
> > 
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
> > This patch depends on ptach:
> > [0/3] Remove atomic_exec
> > https://patchwork.kernel.org/cover/11381677/
> > 

This patch does not depend on any patch, so applied to
mediatek-drm-fixes-5.6 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-fixes-5.6

Regards,
CK

> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index 3c53ea22208c..e35b66c5ba0f 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -491,6 +491,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
> >  	}
> >  #if IS_ENABLED(CONFIG_MTK_CMDQ)
> >  	if (mtk_crtc->cmdq_client) {
> > +		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
> >  		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
> >  		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
> >  		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event);
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
