Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 158A8438DA8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 05:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B026589D30;
	Mon, 25 Oct 2021 03:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930A589D30
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 03:08:53 +0000 (UTC)
X-UUID: b39ba7ae4a6c4a78935992f15791241d-20211025
X-UUID: b39ba7ae4a6c4a78935992f15791241d-20211025
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1749334644; Mon, 25 Oct 2021 11:08:47 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 25 Oct 2021 11:08:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Oct 2021 11:08:46 +0800
Message-ID: <4b22df368dc3c8b93eb458c94b20f1138900ffa0.camel@mediatek.com>
Subject: Re: [PATCH] mailbox: remove the error message when gce clk is defer
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Jassi
 Brar" <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Date: Mon, 25 Oct 2021 11:08:46 +0800
In-Reply-To: <YXXBVTEbjPiBm1un@shell.armlinux.org.uk>
References: <20211023164831.25690-1-jason-jh.lin@mediatek.com>
 <YXXBVTEbjPiBm1un@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Russell,

Thanks for the reviews.


On Sun, 2021-10-24 at 21:25 +0100, Russell King (Oracle) wrote:
> On Sun, Oct 24, 2021 at 12:48:31AM +0800, jason-jh.lin wrote:
> > Remove the error message when gce clk is defer.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> >  drivers/mailbox/mtk-cmdq-mailbox.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
> > b/drivers/mailbox/mtk-cmdq-mailbox.c
> > index fd5576a9f8b4..684b8aa1e445 100644
> > --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> > @@ -577,7 +577,8 @@ static int cmdq_probe(struct platform_device
> > *pdev)
> >  				snprintf(clk_id, sizeof(clk_id),
> > "%s%d", clk_name, alias_id);
> >  				cmdq->clocks[alias_id].id = clk_id;
> >  				cmdq->clocks[alias_id].clk =
> > of_clk_get(node, 0);
> > -				if (IS_ERR(cmdq->clocks[alias_id].clk)) 
> > {
> > +				if (IS_ERR(cmdq->clocks[alias_id].clk)
> > &&
> > +				    PTR_ERR(cmdq->clocks[alias_id].clk) 
> > != -EPROBE_DEFER) {
> >  					dev_err(dev, "failed to get gce
> > clk: %d\n", alias_id);
> >  					return PTR_ERR(cmdq-
> > >clocks[alias_id].clk);
> >  				}
> 
> So when you get -EPROBE_DEFER, you omit the error message _and_
> ignore
> the -EPROBE_DEFER. Is that really what you want to do?
> 

Oh, you're right. I should return the -EPROBE_DEFER.

I just want to ignore the error msg because gce clk may not ready while
gce probing.

I'll update this patch at next version.

-- 
Regrads,
Jason-JH Lin <jason-jh.lin@mediatek.com>

