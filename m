Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 203374E3C14
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 11:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7664810E0CD;
	Tue, 22 Mar 2022 10:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E135310E0CD
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 10:00:10 +0000 (UTC)
X-UUID: b5fe3251858a466aa4a657ced4731cfb-20220322
X-UUID: b5fe3251858a466aa4a657ced4731cfb-20220322
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1537663108; Tue, 22 Mar 2022 18:00:04 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 22 Mar 2022 18:00:04 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Mar 2022 18:00:03 +0800
Message-ID: <55eba6e4285ee6e4edb436f339b88730cc2c651c.camel@mediatek.com>
Subject: Re: [PATCH v3,4/4] drm/mediatek: Add pull-down MIPI operation in
 mtk_dsi_poweroff function
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
Date: Tue, 22 Mar 2022 18:00:24 +0800
In-Reply-To: <ebcf547ab6e4481e6c8e60db88eccf58fe7059ed.camel@mediatek.com>
References: <1647503611-13144-1-git-send-email-xinlei.lee@mediatek.com>
 <1647503611-13144-5-git-send-email-xinlei.lee@mediatek.com>
 <ebcf547ab6e4481e6c8e60db88eccf58fe7059ed.camel@mediatek.com>
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-03-17 at 20:20 +0800, Rex-BC Chen wrote:
> Hello Xinlei,
> 
> On Thu, 2022-03-17 at 15:53 +0800, xinlei.lee@mediatek.com wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > In the dsi_enable function, mtk_dsi_rxtx_control is to
> > pull up the MIPI signal operation. Before dsi_disable,
> > MIPI should also be pulled down by writing a register instead of
> > disabling dsi.
> > 
> 
> What will happen if you do not pulled down the mipi before disable
> dsi?
> What's differnet for this two setting?
> 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index b509d59235e2..1c6a75a46b67 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -676,6 +676,8 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> > *dsi)
> >  	mtk_dsi_reset_engine(dsi);
> >  	mtk_dsi_lane0_ulp_mode_enter(dsi);
> >  	mtk_dsi_clk_ulp_mode_enter(dsi);
> > +	/* set the lane number as 0 */
> > +	writel(0, dsi->regs + DSI_TXRX_CTRL);
> 
> So set lane num to 0 means pull down mipi?
> 
> BRs,
> Rex
> 
> >  
> >  	mtk_dsi_disable(dsi);
> >  
> 
> 

Hi rex:

1. 
If you disable dsi without pulling the mipi signal low, the value of
the register will still maintain the setting of the mipi signal being
pulled high. 
After resume, even if the mipi signal is not pulled high, it will still
be in the high state.

2.So set lane num to 0 means pull down mipi
=> yes

Do you have any suggestions on the next version?

Best Regards!
xinlei

