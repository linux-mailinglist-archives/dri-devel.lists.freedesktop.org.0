Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C0D50207E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 04:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0E410E134;
	Fri, 15 Apr 2022 02:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F77010E134
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 02:30:29 +0000 (UTC)
X-UUID: 571226f6aebe411fba98ba5275c8e3aa-20220415
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:f9ce914d-1a6b-42f2-a217-8da554d8e5ad, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:50,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:52
X-CID-INFO: VERSION:1.1.4, REQID:f9ce914d-1a6b-42f2-a217-8da554d8e5ad, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:50,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:52
X-CID-META: VersionHash:faefae9, CLOUDID:8b9633a9-d103-4e36-82b9-b0e86991b3df,
 C
 OID:7efcf8f6af74,Recheck:0,SF:13|15|28|17|19|48,TC:nil,Content:4,EDM:-3,Fi
 le:nil,QS:0,BEC:nil
X-UUID: 571226f6aebe411fba98ba5275c8e3aa-20220415
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 42768924; Fri, 15 Apr 2022 10:30:22 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 15 Apr 2022 10:30:21 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Apr 2022 10:30:21 +0800
Message-ID: <be9807025772b68416c38800616d52d8bd06d746.camel@mediatek.com>
Subject: Re: [PATCH v4, 2/4] drm/mediatek: Separate poweron/poweroff from
 enable/disable and define new funcs
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>, <rex-bc.chen@mediatek.com>
Date: Fri, 15 Apr 2022 10:30:53 +0800
In-Reply-To: <b1edb995f5dba2f8e313192a79cfc0972b7c832f.camel@mediatek.com>
References: <1649644308-8455-1-git-send-email-xinlei.lee@mediatek.com>
 <1649644308-8455-3-git-send-email-xinlei.lee@mediatek.com>
 <b1edb995f5dba2f8e313192a79cfc0972b7c832f.camel@mediatek.com>
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

On Wed, 2022-04-13 at 15:31 +0800, CK Hu wrote:
> Hi, Xinlei:
> 
> On Mon, 2022-04-11 at 10:31 +0800, xinlei.lee@mediatek.com wrote:
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
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 51 +++++++++++++++++++-------
> > --
> > --
> >  1 file changed, 32 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index 262c027d8c2f..cf76c53a1af6 100644
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
> > @@ -762,13 +753,35 @@ static void mtk_dsi_bridge_enable(struct
> > drm_bridge *bridge)
> >  {
> >  	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> >  
> > +	if (dsi->refcount == 0)
> > +		return;
> > +
> >  	mtk_output_dsi_enable(dsi);
> >  }
> >  
> > +static void mtk_dsi_bridge_pre_enable(struct drm_bridge *bridge)
> > +{
> > +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> > +	int ret;
> > +
> > +	ret = mtk_dsi_poweron(dsi);
> > +	if (ret < 0)
> > +		DRM_ERROR("failed to power on dsi\n");
> > +}
> > +
> > +static void mtk_dsi_bridge_post_disable(struct drm_bridge *bridge)
> > +{
> > +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> > +
> > +	mtk_dsi_poweroff(dsi);
> > +}
> > +
> >  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
> >  	.attach = mtk_dsi_bridge_attach,
> >  	.disable = mtk_dsi_bridge_disable,
> >  	.enable = mtk_dsi_bridge_enable,
> > +	.pre_enable = mtk_dsi_bridge_pre_enable,
> 
> The flow looks good to me, but according to [1], pre_enable is
> deprecated. Use atomic_pre_enable instead.
> 
> [1] 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/drm/drm_bridge.h?h=v5.18-rc2#n235
> 
> 
> > +	.post_disable = mtk_dsi_bridge_post_disable,
> 
> Ditto.
> 
> Regards,
> CK
> 
> >  	.mode_set = mtk_dsi_bridge_mode_set,
> >  };
> >  
> 
> 

Hi CK:

Thanks for your suggestion.
I will revise it in the next version.

Best Regards!
xinlei

