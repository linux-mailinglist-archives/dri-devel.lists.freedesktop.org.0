Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C605B2E1B3E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABC86E8ED;
	Wed, 23 Dec 2020 10:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E02B6E249
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 01:23:55 +0000 (UTC)
X-UUID: cd6e133c2ca74fb19d15eb2175488ee9-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=xZSMGNycrUGCDcc+7tKfKZ1TjnIFUd/ecXWYJopv86Q=; 
 b=MuTzwgtTPxToCm+XYb+xNDDKmBwf6e6AcEaKd281ns+cFVWwPM+DZ5aNJ/VpSbpa+St5LwuoDMNFaLkcyTDj/aGf6oYI/Ye/uPAMqI6YUt56z2z0xu8ZGaKzahxVJhYgU5TFheDgDqk3DxRkBgmlDCYGsHtSApPpOVRqFo2ivtY=;
X-UUID: cd6e133c2ca74fb19d15eb2175488ee9-20201223
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2041247052; Wed, 23 Dec 2020 09:23:53 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Dec 2020 09:23:51 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 09:23:46 +0800
Message-ID: <1608686629.18252.8.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 07/17] drm/mediatek: add disp config and mm 26mhz
 clock into mutex device
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 23 Dec 2020 09:23:49 +0800
In-Reply-To: <CANMq1KCbmW4kbY5rbuogr9JJD5c5=-qatFs-EaWbuAxSzWmnLQ@mail.gmail.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-8-git-send-email-yongqiang.niu@mediatek.com>
 <CANMq1KCbmW4kbY5rbuogr9JJD5c5=-qatFs-EaWbuAxSzWmnLQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Wed, 23 Dec 2020 10:51:31 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-12-15 at 21:37 +0800, Nicolas Boichat wrote:
> On Sat, Dec 12, 2020 at 12:12 PM Yongqiang Niu
> <yongqiang.niu@mediatek.com> wrote:
> >
> > there are 2 more clock need enable for display.
> > parser these clock when mutex device probe,
> > enable and disable when mutex on/off
> >
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 49 ++++++++++++++++++++++++++++------
> >  1 file changed, 41 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > index 60788c1..de618a1 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > @@ -118,7 +118,7 @@ struct mtk_ddp_data {
> >
> >  struct mtk_ddp {
> >         struct device                   *dev;
> > -       struct clk                      *clk;
> > +       struct clk                      *clk[3];
> >         void __iomem                    *regs;
> >         struct mtk_disp_mutex           mutex[10];
> >         const struct mtk_ddp_data       *data;
> > @@ -257,14 +257,39 @@ int mtk_disp_mutex_prepare(struct mtk_disp_mutex *mutex)
> >  {
> >         struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
> >                                            mutex[mutex->id]);
> > -       return clk_prepare_enable(ddp->clk);
> > +       int ret;
> > +       int i;
> > +
> > +       for (i = 0; i < ARRAY_SIZE(ddp->clk); i++) {
> > +               if (IS_ERR(ddp->clk[i]))
> > +                       continue;
> > +               ret = clk_prepare_enable(ddp->clk[i]);
> > +               if (ret) {
> > +                       pr_err("failed to enable clock, err %d. i:%d\n",
> > +                               ret, i);
> > +                       goto err;
> > +               }
> > +       }
> > +
> > +       return 0;
> > +
> > +err:
> > +       while (--i >= 0)
> > +               clk_disable_unprepare(ddp->clk[i]);
> > +       return ret;
> >  }
> >
> >  void mtk_disp_mutex_unprepare(struct mtk_disp_mutex *mutex)
> >  {
> >         struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
> >                                            mutex[mutex->id]);
> > -       clk_disable_unprepare(ddp->clk);
> > +       int i;
> > +
> > +        for (i = 0; i < ARRAY_SIZE(ddp->clk); i++) {
> > +               if (IS_ERR(ddp->clk[i]))
> > +                       continue;
> > +               clk_disable_unprepare(ddp->clk[i]);
> > +       }
> >  }
> >
> >  void mtk_disp_mutex_add_comp(struct mtk_disp_mutex *mutex,
> > @@ -415,11 +440,19 @@ static int mtk_ddp_probe(struct platform_device *pdev)
> >         ddp->data = of_device_get_match_data(dev);
> >
> >         if (!ddp->data->no_clk) {
> > -               ddp->clk = devm_clk_get(dev, NULL);
> > -               if (IS_ERR(ddp->clk)) {
> > -                       if (PTR_ERR(ddp->clk) != -EPROBE_DEFER)
> > -                               dev_err(dev, "Failed to get clock\n");
> > -                       return PTR_ERR(ddp->clk);
> > +               int ret;
> > +
> > +               for (i = 0; i < ARRAY_SIZE(ddp->clk); i++) {
> > +                       ddp->clk[i] = of_clk_get(dev->of_node, i);
> > +
> > +                       if (IS_ERR(ddp->clk[i])) {
> > +                               ret = PTR_ERR(ddp->clk[i]);
> > +                               if (ret != EPROBE_DEFER)
> > +                                       dev_err(dev, "Failed to get clock %d\n",
> > +                                               ret);
> > +
> > +                               return ret;
> > +                       }
> 
> Use of_clk_bulk_get_all instead?
> 
> ddp->num_clks = of_clk_bulk_get_all(dev->of_node, &ddp->clks);
> ...
> 
> Then the calls above can be clk_bulk_enable/clk_bulk_disable using
> num_clks and clks.
> 

will be fixed in next version
> 
> >                 }
> >         }
> >
> > --
> > 1.8.1.1.dirty
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
