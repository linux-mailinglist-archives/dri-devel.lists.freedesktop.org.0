Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B26884E3BAE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 10:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E1710E539;
	Tue, 22 Mar 2022 09:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C309410E539
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 09:22:51 +0000 (UTC)
X-UUID: af1805b3a6994fea83b64c6f6d3a4e2c-20220322
X-UUID: af1805b3a6994fea83b64c6f6d3a4e2c-20220322
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 971921047; Tue, 22 Mar 2022 17:22:46 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Mar 2022 17:22:45 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Mar 2022 17:22:41 +0800
Message-ID: <4d022881d08ea1d4a222b3439510c6d6d26d7284.camel@mediatek.com>
Subject: Re: [PATCH v3,2/4] drm/mediatek: Separate poweron/poweroff from
 enable/disable and define new funcs
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
Date: Tue, 22 Mar 2022 17:23:02 +0800
In-Reply-To: <390025b57d3345c34071231c68350e9311af64c9.camel@mediatek.com>
References: <1647503611-13144-1-git-send-email-xinlei.lee@mediatek.com>
 <1647503611-13144-3-git-send-email-xinlei.lee@mediatek.com>
 <390025b57d3345c34071231c68350e9311af64c9.camel@mediatek.com>
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

On Thu, 2022-03-17 at 20:02 +0800, Rex-BC Chen wrote:
> Hello Xinlei,
> 
> On Thu, 2022-03-17 at 15:53 +0800, xinlei.lee@mediatek.com wrote:
> > From: Jitao Shi <jitao.shi@mediatek.com>
> > 
> > In order to match the changes of "Use the drm_panel_bridge API",
> > the poweron/poweroff of dsi is extracted from enable/disable and
> > defined as new funcs (pre_enable/post_disable).
> > 
> > Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the
> > drm_panel_bridge
> > API")
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 45 +++++++++++++++++---------
> > --
> > --
> >  1 file changed, 26 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index 262c027d8c2f..e33caaca11a7 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -679,16 +679,6 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> > *dsi)
> >  	if (--dsi->refcount != 0)
> >  		return;
> >  
> > -	/*
> > -	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
> > -	 * mtk_dsi_stop() should be called after
> > mtk_drm_crtc_atomic_disable(),
> > -	 * which needs irq for vblank, and mtk_dsi_stop() will disable
> > irq.
> > -	 * mtk_dsi_start() needs to be called in
> > mtk_output_dsi_enable(),
> > -	 * after dsi is fully set.
> > -	 */
> > -	mtk_dsi_stop(dsi);
> > -
> > -	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
> >  	mtk_dsi_reset_engine(dsi);
> >  	mtk_dsi_lane0_ulp_mode_enter(dsi);
> >  	mtk_dsi_clk_ulp_mode_enter(dsi);
> > @@ -703,17 +693,9 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> > *dsi)
> >  
> >  static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
> >  {
> > -	int ret;
> > -
> >  	if (dsi->enabled)
> >  		return;
> >  
> > -	ret = mtk_dsi_poweron(dsi);
> > -	if (ret < 0) {
> > -		DRM_ERROR("failed to power on dsi\n");
> > -		return;
> > -	}
> > -
> >  	mtk_dsi_set_mode(dsi);
> >  	mtk_dsi_clk_hs_mode(dsi, 1);
> >  
> > @@ -727,7 +709,16 @@ static void mtk_output_dsi_disable(struct
> > mtk_dsi *dsi)
> >  	if (!dsi->enabled)
> >  		return;
> >  
> > -	mtk_dsi_poweroff(dsi);
> > +	/*
> > +	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
> 
> Why they are asymmetric?
> 
> > +	 * mtk_dsi_stop() should be called after
> > mtk_drm_crtc_atomic_disable(),
> > +	 * which needs irq for vblank, and mtk_dsi_stop() will disable
> > irq.
> > +	 * mtk_dsi_start() needs to be called in
> > mtk_output_dsi_enable(),
> > +	 * after dsi is fully set.
> > +	 */
> > +	mtk_dsi_stop(dsi);
> > +
> > +	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
> >  
> >  	dsi->enabled = false;
> >  }
> > @@ -765,10 +756,26 @@ static void mtk_dsi_bridge_enable(struct
> > drm_bridge *bridge)
> >  	mtk_output_dsi_enable(dsi);
> >  }
> >  
> > +static void mtk_dsi_bridge_pre_enable(struct drm_bridge *bridge)
> > +{
> > +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> > +
> > +	mtk_dsi_poweron(dsi);
> 
> Should you handle the error of mtk_dsi_poweron?
> If you failed to mtk_dsi_bridge_pre_enable and do
> mtk_dsi_bridge_enable,
> what will happend?
> 
> > +}
> > +
> > +static void mtk_dsi_bridge_post_disable(struct drm_bridge *bridge)
> > +{
> > +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> > +
> > +	mtk_dsi_poweroff(dsi);
> 
> If you failed to mtk_dsi_bridge_disable and you do
> mtk_dsi_bridge_post_disable,
> what will happend?
> Do you need to handle this?
> 
> BRs,
> Rex
> 
> > +}
> > +
> >  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
> >  	.attach = mtk_dsi_bridge_attach,
> >  	.disable = mtk_dsi_bridge_disable,
> >  	.enable = mtk_dsi_bridge_enable,
> > +	.pre_enable = mtk_dsi_bridge_pre_enable,
> > +	.post_disable = mtk_dsi_bridge_post_disable,
> >  	.mode_set = mtk_dsi_bridge_mode_set,
> >  };
> >  
> 
> 

Hi Rex:

Thanks for your review!

1.Why they are asymmetric?
=>My understanding mtk_dsi_stop() and mtk_dsi_start() is to make dsi
switch from LP11 and HS mode.DSI has two working modes:
If it is cmd mode, the data sent is sent by LP11, and dsi_start is just
a signal. In this mode, dsi_stop is not required after sending cmd.
If it is video mode, because the data needs to be sent in HS mode,
dsi_start is required to make dsi enter HS mode from LP11. After
suspend, drm will call dsi_disable, and call dsi_stop to make dsi
return from HS mode to LP11 state.
Therefore mtk_dsi_stop() and mtk_dsi_start() are asymmetric.
For example, in the dsi_host_transfer function, only dsi_stop has no
dsi_start operation.

2.
Because the return type of pre_enable & post_disable in common code is
void type. If there is an error, it will be processed in
poweron/poweroff, and the error message will be printed.
Do you mean that pre_enable & post_disable needs to accept the
poweron/poweroff error return value and then print the error log?

3.
If pre_enable fails, there is only a problem with the dsi module, and
it does not affect the execution of other modules and enable funcs
under drm. 
Same goes for post_disable & disable.

Best Regrds!
xinlei

