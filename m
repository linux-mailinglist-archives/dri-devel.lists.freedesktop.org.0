Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25C752CBE8
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 08:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000C911A97A;
	Thu, 19 May 2022 06:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DD411A97A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 06:28:12 +0000 (UTC)
X-UUID: 28cdf1cd604e4171ba01530ba5530c76-20220519
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:422ac9c0-fbe6-4438-86eb-0dfa4c6d775f, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:2
X-CID-META: VersionHash:2a19b09, CLOUDID:7104d279-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 28cdf1cd604e4171ba01530ba5530c76-20220519
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1612375784; Thu, 19 May 2022 14:27:55 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 19 May 2022 14:27:54 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 May 2022 14:27:53 +0800
Message-ID: <8b40430e1a2996a04554ee6679e0ac2e1adf0220.camel@mediatek.com>
Subject: Re: [PATCH v6, 3/4] drm/mediatek: keep dsi as LP00 before dcs cmds
 transfer
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
Date: Thu, 19 May 2022 14:28:39 +0800
In-Reply-To: <cfa87a23495fe5d72c7deed49162b026466cb68a.camel@mediatek.com>
References: <1652337012-9053-1-git-send-email-xinlei.lee@mediatek.com>
 <1652337012-9053-4-git-send-email-xinlei.lee@mediatek.com>
 <cfa87a23495fe5d72c7deed49162b026466cb68a.camel@mediatek.com>
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
 "# 6 . 6 . x : b255d51e3967 : sched :
 Modify dsi funcs to atomic	 	  operations" <stable@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 rex-bc.chen@mediatek.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-05-18 at 11:55 +0800, CK Hu wrote:
> Hi, Xinlei:
> 
> On Thu, 2022-05-12 at 14:30 +0800, xinlei.lee@mediatek.com wrote:
> > From: Jitao Shi <jitao.shi@mediatek.com>
> > 
> > To comply with the panel sequence, hold the mipi signal to LP00
> > before the dcs cmds transmission,
> > and pull the mipi signal high from LP00 to LP11 until the start of
> > the dcs cmds transmission.
> > The normal panel timing is :
> > (1) pp1800 DC pull up
> > (2) avdd & avee AC pull high
> > (3) lcm_reset pull high -> pull low -> pull high
> > (4) Pull MIPI signal high (LP11) -> initial code -> send video
> > data(HS mode)
> > The power-off sequence is reversed.
> > If dsi is not in cmd mode, then dsi will pull the mipi signal high
> > in
> > the mtk_output_dsi_enable function.
> > The delay in lane_ready func is the reaction time of dsi_rx after
> > pulling up the mipi signal.
> > 
> > Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the
> > drm_panel_bridge
> > API")
> > 
> > Cc: <stable@vger.kernel.org> # 6.6.x: b255d51e3967: sched: Modify
> > dsi
> > funcs to atomic operations
> > Cc: <stable@vger.kernel.org> # 6.6.x: 72c69c977502: sched: Separate
> > poweron/poweroff from enable/disable and define new funcs
> > Cc: <stable@vger.kernel.org> # 6.6.x
> 
> This patch looks good to me, but do you want to 'back' port this
> patch
> to Linux version 6.6?
> 
> Regards,
> CK
> 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 28 +++++++++++++++++++++-----
> > --
> >  1 file changed, 21 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index d9a6b928dba8..25e84d9426bf 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -203,6 +203,7 @@ struct mtk_dsi {
> >  	struct mtk_phy_timing phy_timing;
> >  	int refcount;
> >  	bool enabled;
> > +	bool lanes_ready;
> >  	u32 irq_data;
> >  	wait_queue_head_t irq_wait_queue;
> >  	const struct mtk_dsi_driver_data *driver_data;
> > @@ -661,18 +662,11 @@ static int mtk_dsi_poweron(struct mtk_dsi
> > *dsi)
> >  	mtk_dsi_reset_engine(dsi);
> >  	mtk_dsi_phy_timconfig(dsi);
> >  
> > -	mtk_dsi_rxtx_control(dsi);
> > -	usleep_range(30, 100);
> > -	mtk_dsi_reset_dphy(dsi);
> >  	mtk_dsi_ps_control_vact(dsi);
> >  	mtk_dsi_set_vm_cmd(dsi);
> >  	mtk_dsi_config_vdo_timing(dsi);
> >  	mtk_dsi_set_interrupt_enable(dsi);
> >  
> > -	mtk_dsi_clk_ulp_mode_leave(dsi);
> > -	mtk_dsi_lane0_ulp_mode_leave(dsi);
> > -	mtk_dsi_clk_hs_mode(dsi, 0);
> > -
> >  	return 0;
> >  err_disable_engine_clk:
> >  	clk_disable_unprepare(dsi->engine_clk);
> > @@ -701,6 +695,23 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> > *dsi)
> >  	clk_disable_unprepare(dsi->digital_clk);
> >  
> >  	phy_power_off(dsi->phy);
> > +
> > +	dsi->lanes_ready = false;
> > +}
> > +
> > +static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
> > +{
> > +	if (!dsi->lanes_ready) {
> > +		dsi->lanes_ready = true;
> > +		mtk_dsi_rxtx_control(dsi);
> > +		usleep_range(30, 100);
> > +		mtk_dsi_reset_dphy(dsi);
> > +		mtk_dsi_clk_ulp_mode_leave(dsi);
> > +		mtk_dsi_lane0_ulp_mode_leave(dsi);
> > +		mtk_dsi_clk_hs_mode(dsi, 0);
> > +		msleep(20);
> > +		/* The reaction time after pulling up the mipi signal
> > for dsi_rx */
> > +	}
> >  }
> >  
> >  static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
> > @@ -708,6 +719,7 @@ static void mtk_output_dsi_enable(struct
> > mtk_dsi
> > *dsi)
> >  	if (dsi->enabled)
> >  		return;
> >  
> > +	mtk_dsi_lane_ready(dsi);
> >  	mtk_dsi_set_mode(dsi);
> >  	mtk_dsi_clk_hs_mode(dsi, 1);
> >  
> > @@ -1017,6 +1029,8 @@ static ssize_t mtk_dsi_host_transfer(struct
> > mipi_dsi_host *host,
> >  	if (MTK_DSI_HOST_IS_READ(msg->type))
> >  		irq_flag |= LPRX_RD_RDY_INT_FLAG;
> >  
> > +	mtk_dsi_lane_ready(dsi);
> > +
> >  	ret = mtk_dsi_host_send_cmd(dsi, msg, irq_flag);
> >  	if (ret)
> >  		goto restore_dsi_mode;
> 
> 

Hi CK:

Thanks for your review.
I had some misunderstandings before, and I will modify the back version
to 5.10.x in the next version.

Best Regards!
xinlei

