Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED27B11DC29
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 03:35:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC6889DC1;
	Fri, 13 Dec 2019 02:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id B67E889DC1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 02:35:01 +0000 (UTC)
X-UUID: 61b4b6e151aa4d04ba8ea5854a2a561f-20191213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yhFMIzdACTJWG8hG2F5mM6oLY9KIsSirpu7dj4pmzWo=; 
 b=OQv/fxiQsfz4cvuh5JCsWQWp2JRkjT1QaFhtXzcgEfYxmmzin8CsOw79fhtWlphFO76eLW+07eYB+O8zKugRMO8JivvHFUMbzH2x63ELE60uieaRK2swT6thOuy/iTJDEyiI2n0pCYqHYmvGhNwdHcr1o+h6XYOghd9Suw+u0MY=;
X-UUID: 61b4b6e151aa4d04ba8ea5854a2a561f-20191213
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 302673164; Fri, 13 Dec 2019 10:34:53 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 10:34:36 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 13 Dec 2019 10:34:51 +0800
Message-ID: <1576204492.26694.0.camel@mtksdaap41>
Subject: Re: [PATCH 1/2] Return from mtk_ovl_layer_config after
 mtk_ovl_layer_off
From: CK Hu <ck.hu@mediatek.com>
To: Sean Paul <sean@poorly.run>
Date: Fri, 13 Dec 2019 10:34:52 +0800
In-Reply-To: <CAMavQKKOtYKVnCs3RCi3iYiX-2rLHoaDBTsEHyQmvWGoYj4M0g@mail.gmail.com>
References: <20191211154901.176256-1-markyacoub@google.com>
 <1576125900.29693.0.camel@mtksdaap41>
 <CAMavQKKOtYKVnCs3RCi3iYiX-2rLHoaDBTsEHyQmvWGoYj4M0g@mail.gmail.com>
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
Cc: Daniele Castagna <dcastagna@chromium.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Sean:

On Thu, 2019-12-12 at 09:13 -0500, Sean Paul wrote:
> On Wed, Dec 11, 2019 at 11:45 PM CK Hu <ck.hu@mediatek.com> wrote:
> >
> > Hi, Mark:
> >
> > On Wed, 2019-12-11 at 10:49 -0500, Mark Yacoub wrote:
> > > drm/mediatek: return if plane pending state is disabled.
> > >
> > > If the plane pending state is disabled, call mtk_ovl_layer_off then
> > > return.
> > > This guarantees that that the state is valid for all operations when the
> > > pending state is enabled.
> >
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> >
> 
> Thanks for reviewing these patches, CK. When you apply them to your
> tree, could you please fixup the subjects with the correct prefixes?

Thanks for your notice. I've already planed to do so.

Regards,
CK

> 
> Both patches are also
> 
> Reviewed-by: Sean Paul <seanpaul@chromium.org>
> 
> Sean
> 
> > >
> > > Suggested-by: Sean Paul <seanpaul@chromium.org>
> > > To: CK Hu <ck.hu@mediatek.com>
> > > To: dri-devel@lists.freedesktop.org
> > > Cc: Daniele Castagna <dcastagna@chromium.org>
> > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-mediatek@lists.infradead.org
> > > Signed-off-by: Mark Yacoub <markyacoub@google.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > > index 4a55bb6e2213..526b595eeff9 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > > @@ -260,8 +260,10 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
> > >       unsigned int src_size = (pending->height << 16) | pending->width;
> > >       unsigned int con;
> > >
> > > -     if (!pending->enable)
> > > +     if (!pending->enable) {
> > >               mtk_ovl_layer_off(comp, idx);
> > > +             return;
> > > +     }
> > >
> > >       con = ovl_fmt_convert(ovl, fmt);
> > >       if (idx != 0)
> > > @@ -283,8 +285,7 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
> > >       writel_relaxed(offset, comp->regs + DISP_REG_OVL_OFFSET(idx));
> > >       writel_relaxed(addr, comp->regs + DISP_REG_OVL_ADDR(ovl, idx));
> > >
> > > -     if (pending->enable)
> > > -             mtk_ovl_layer_on(comp, idx);
> > > +     mtk_ovl_layer_on(comp, idx);
> > >  }
> > >
> > >  static void mtk_ovl_bgclr_in_on(struct mtk_ddp_comp *comp)
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
