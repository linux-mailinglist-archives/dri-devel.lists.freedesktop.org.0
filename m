Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D99F4E51AA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 12:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D3010E6B9;
	Wed, 23 Mar 2022 11:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B8710E6B9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 11:54:29 +0000 (UTC)
X-UUID: a76f702edeb84a329c2951fcf7303a76-20220323
X-UUID: a76f702edeb84a329c2951fcf7303a76-20220323
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 39257572; Wed, 23 Mar 2022 19:54:22 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 19:54:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Mar 2022 19:54:20 +0800
Message-ID: <53f433cc2de187096534d522dc19d301a1c0500f.camel@mediatek.com>
Subject: Re: [PATCH v3,4/4] drm/mediatek: Add pull-down MIPI operation in
 mtk_dsi_poweroff function
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: xinlei.lee <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
Date: Wed, 23 Mar 2022 19:54:20 +0800
In-Reply-To: <55eba6e4285ee6e4edb436f339b88730cc2c651c.camel@mediatek.com>
References: <1647503611-13144-1-git-send-email-xinlei.lee@mediatek.com>
 <1647503611-13144-5-git-send-email-xinlei.lee@mediatek.com>
 <ebcf547ab6e4481e6c8e60db88eccf58fe7059ed.camel@mediatek.com>
 <55eba6e4285ee6e4edb436f339b88730cc2c651c.camel@mediatek.com>
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

On Tue, 2022-03-22 at 18:00 +0800, xinlei.lee wrote:
> On Thu, 2022-03-17 at 20:20 +0800, Rex-BC Chen wrote:
> > Hello Xinlei,
> > 
> > On Thu, 2022-03-17 at 15:53 +0800, xinlei.lee@mediatek.com wrote:
> > > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > > 
> > > In the dsi_enable function, mtk_dsi_rxtx_control is to
> > > pull up the MIPI signal operation. Before dsi_disable,
> > > MIPI should also be pulled down by writing a register instead of
> > > disabling dsi.
> > > 
> > 
> > What will happen if you do not pulled down the mipi before disable
> > dsi?
> > What's differnet for this two setting?
> > 
> > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > index b509d59235e2..1c6a75a46b67 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > @@ -676,6 +676,8 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> > > *dsi)
> > >  	mtk_dsi_reset_engine(dsi);
> > >  	mtk_dsi_lane0_ulp_mode_enter(dsi);
> > >  	mtk_dsi_clk_ulp_mode_enter(dsi);
> > > +	/* set the lane number as 0 */

Hello Xinlei,

I think you can write this comment more detailed, like
"/* set the lane number as 0 to pull down mipi */"

> > > +	writel(0, dsi->regs + DSI_TXRX_CTRL);
> > 
> > So set lane num to 0 means pull down mipi?
> > 
> > BRs,
> > Rex
> > 
> > >  
> > >  	mtk_dsi_disable(dsi);
> > >  
> > 
> > 
> 
> Hi rex:
> 
> 1. 
> If you disable dsi without pulling the mipi signal low, the value of
> the register will still maintain the setting of the mipi signal being
> pulled high. 
> After resume, even if the mipi signal is not pulled high, it will
> still
> be in the high state.
> 

I think you can describe this in commit message


BRs,
Rex

> 2.So set lane num to 0 means pull down mipi
> => yes
> 
> Do you have any suggestions on the next version?
> 
> Best Regards!
> xinlei
> 

