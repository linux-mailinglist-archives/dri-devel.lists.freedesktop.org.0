Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4554FE1C6
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 15:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE5B10E98D;
	Tue, 12 Apr 2022 13:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A9510E6AE
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 13:08:52 +0000 (UTC)
X-UUID: 54e81d8355d245b7ba711898eba48042-20220412
X-UUID: 54e81d8355d245b7ba711898eba48042-20220412
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1954385545; Tue, 12 Apr 2022 21:08:46 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 12 Apr 2022 21:08:44 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 12 Apr 2022 21:08:44 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Apr 2022 21:08:43 +0800
Message-ID: <340df66f9f541cc90cd954bd6c555d2bcb384e9a.camel@mediatek.com>
Subject: Re: [PATCH v4, 3/4] drm/mediatek: keep dsi as LP00 before dcs cmds
 transfer
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
Date: Tue, 12 Apr 2022 21:09:14 +0800
In-Reply-To: <3c9140fbba123550b5532f9917dae4ef10ed5611.camel@mediatek.com>
References: <1649644308-8455-1-git-send-email-xinlei.lee@mediatek.com>
 <1649644308-8455-4-git-send-email-xinlei.lee@mediatek.com>
 <7a4e5afb-6947-ed7f-8555-c7402aaa3a29@collabora.com>
 <3c9140fbba123550b5532f9917dae4ef10ed5611.camel@mediatek.com>
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

On Tue, 2022-04-12 at 15:43 +0800, Rex-BC Chen wrote:
> On Mon, 2022-04-11 at 11:07 +0200, AngeloGioacchino Del Regno wrote:
> > Il 11/04/22 04:31, xinlei.lee@mediatek.com ha scritto:
> > > From: Jitao Shi <jitao.shi@mediatek.com>
> > > 
> > > To comply with the panel sequence, hold the mipi signal to LP00
> > > before the dcs cmds transmission,
> > > and pull the mipi signal high from LP00 to LP11 until the start
> > > of
> > > the dcs cmds transmission.
> > > The normal panel timing is :
> > > (1) pp1800 DC pull up
> > > (2) avdd & avee AC pull high
> > > (3) lcm_reset pull high -> pull low -> pull high
> > > (4) Pull MIPI signal high (LP11) -> initial code -> send video
> > > data(HS mode)
> > > The power-off sequence is reversed.
> > > If dsi is not in cmd mode, then dsi will pull the mipi signal
> > > high
> > > in the mtk_output_dsi_enable function.
> > > 
> > > Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the
> > > drm_panel_bridge API")
> > > 
> > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > > ---
> > >   drivers/gpu/drm/mediatek/mtk_dsi.c | 28 +++++++++++++++++++++--
> > > -----
> > >   1 file changed, 21 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > index cf76c53a1af6..9ad6f08c8bfe 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > @@ -203,6 +203,7 @@ struct mtk_dsi {
> > >   	struct mtk_phy_timing phy_timing;
> > >   	int refcount;
> > >   	bool enabled;
> > > +	bool lanes_ready;
> > >   	u32 irq_data;
> > >   	wait_queue_head_t irq_wait_queue;
> > >   	const struct mtk_dsi_driver_data *driver_data;
> > > @@ -654,13 +655,6 @@ static int mtk_dsi_poweron(struct mtk_dsi
> > > *dsi)
> > >   	mtk_dsi_config_vdo_timing(dsi);
> > >   	mtk_dsi_set_interrupt_enable(dsi);
> > >   
> > > -	mtk_dsi_rxtx_control(dsi);
> > > -	usleep_range(30, 100);
> > > -	mtk_dsi_reset_dphy(dsi);
> > > -	mtk_dsi_clk_ulp_mode_leave(dsi);
> > > -	mtk_dsi_lane0_ulp_mode_leave(dsi);
> > > -	mtk_dsi_clk_hs_mode(dsi, 0);
> > > -
> > >   	return 0;
> > >   err_disable_engine_clk:
> > >   	clk_disable_unprepare(dsi->engine_clk);
> > > @@ -689,6 +683,23 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> > > *dsi)
> > >   	clk_disable_unprepare(dsi->digital_clk);
> > >   
> > >   	phy_power_off(dsi->phy);
> > > +
> > > +	dsi->lanes_ready = false;
> > > +}
> > > +
> > > +static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
> > > +{
> > > +	if (!dsi->lanes_ready) {
> > > +		dsi->lanes_ready = true;
> > > +		mtk_dsi_rxtx_control(dsi);
> > > +		usleep_range(30, 100);
> > > +		mtk_dsi_reset_dphy(dsi);
> > > +		mtk_dsi_clk_ulp_mode_leave(dsi);
> > > +		mtk_dsi_lane0_ulp_mode_leave(dsi);
> > > +		mtk_dsi_clk_hs_mode(dsi, 0);
> > > +		msleep(20);
> > 
> > This is a very long sleep, which wasn't present before this change.
> > Please document the reasons why we need this 20ms sleep with a
> > comment
> > in the code.
> > 
> > Regards,
> > Angelo
> > 
> > 
> 
> Hello Xinlei,
> 
> As Angelo mentioned.
> I think you should add this in commit message and driver comments.
> (Your reply in v3.)
> "The 20ms delay in mtk_dsi_lane_ready() is because dsi needs to give
> dsi_rx(panel) a reaction time after pulling up the mipi signal."
> 
> BRs,
> Rex
> 

Hey Rex:

Thanks for your review and reminder.
I will add this explanation in the next edition of code & comments.

Best Regards!
xinlei

