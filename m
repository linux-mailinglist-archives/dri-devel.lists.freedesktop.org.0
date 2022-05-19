Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C63552CC0B
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 08:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED8211A788;
	Thu, 19 May 2022 06:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C8711A788
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 06:38:48 +0000 (UTC)
X-UUID: 0f64a89dab1e403ab23af00573886e1d-20220519
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:4f3a2203-8700-43f8-ae63-337e06283777, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:2
X-CID-META: VersionHash:2a19b09, CLOUDID:55a8c2e2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 0f64a89dab1e403ab23af00573886e1d-20220519
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1890067890; Thu, 19 May 2022 14:38:45 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 19 May 2022 14:38:44 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 May 2022 14:38:43 +0800
Message-ID: <c84c9392c048e6108c22f3ab3e1f635acea659bb.camel@mediatek.com>
Subject: Re: [PATCH v6, 2/4] drm/mediatek: Separate poweron/poweroff from
 enable/disable and define new funcs
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
Date: Thu, 19 May 2022 14:39:29 +0800
In-Reply-To: <1bad78e79feb40a2e1e5b09e70438b15aff379ab.camel@mediatek.com>
References: <1652337012-9053-1-git-send-email-xinlei.lee@mediatek.com>
 <1652337012-9053-3-git-send-email-xinlei.lee@mediatek.com>
 <1bad78e79feb40a2e1e5b09e70438b15aff379ab.camel@mediatek.com>
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
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-05-18 at 11:39 +0800, CK Hu wrote:
> Hi, Xinlei:
> 
> On Thu, 2022-05-12 at 14:30 +0800, xinlei.lee@mediatek.com wrote:
> > From: Jitao Shi <jitao.shi@mediatek.com>
> > 
> > In order to match the changes of "Use the drm_panel_bridge API",
> > the poweron/poweroff of dsi is extracted from enable/disable and
> > defined as new funcs (atomic_pre_enable/atomic_post_disable).
> > 
> > Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the
> > drm_panel_bridge
> > API")
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 53 +++++++++++++++++++-------
> > --
> > --
> >  1 file changed, 34 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index f880136cec09..d9a6b928dba8 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -691,16 +691,6 @@ static void mtk_dsi_poweroff(struct mtk_dsi
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
> > @@ -715,17 +705,9 @@ static void mtk_dsi_poweroff(struct mtk_dsi
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
> > @@ -739,7 +721,16 @@ static void mtk_output_dsi_disable(struct
> > mtk_dsi *dsi)
> >  	if (!dsi->enabled)
> >  		return;
> >  
> > -	mtk_dsi_poweroff(dsi);
> > +	/*
> > +	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
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
> > @@ -776,13 +767,37 @@ static void
> > mtk_dsi_bridge_atomic_enable(struct
> > drm_bridge *bridge,
> >  {
> >  	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> >  
> > +	if (dsi->refcount == 0)
> > +		return;
> 
> This seems not related to pre_enable()/post_disable(). So separate
> this
> to another patch.
> 
> Regards,
> CK
> 
> > +
> >  	mtk_output_dsi_enable(dsi);
> >  }
> >  
> > +static void mtk_dsi_bridge_atomic_pre_enable(struct drm_bridge
> > *bridge,
> > +					     struct drm_bridge_state
> > *old_bridge_state)
> > +{
> > +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> > +	int ret;
> > +
> > +	ret = mtk_dsi_poweron(dsi);
> > +	if (ret < 0)
> > +		DRM_ERROR("failed to power on dsi\n");
> > +}
> > +
> > +static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge
> > *bridge,
> > +					       struct drm_bridge_state
> > *old_bridge_state)
> > +{
> > +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> > +
> > +	mtk_dsi_poweroff(dsi);
> > +}
> > +
> >  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
> >  	.attach = mtk_dsi_bridge_attach,
> >  	.atomic_disable = mtk_dsi_bridge_atomic_disable,
> >  	.atomic_enable = mtk_dsi_bridge_atomic_enable,
> > +	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
> > +	.atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
> >  	.mode_set = mtk_dsi_bridge_mode_set,
> >  };
> >  
> 
> 

Hi CK:
Thanks for your review.

The modification here is related to pre_enable()/post_disable().
Because in the previous dsi_enable function, dsi_poweron will be
executed first and then the dsi register will be operated.
But the current modification will move dsi_poweron to the pre_enable
function, and the pre_enable is of void type, when dsi_poweron fails,
an error log will be printed, but the dsi register will be operated in
dsi_enable later , it may cause bus hang.

Therefore, dsi_poweron is judged in the dsi_enable function to avoid
the above situation.
I'll add that description in the comments on the next edition.

Best Regards!
xinlei

