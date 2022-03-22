Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A14F4E38BF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 07:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A12510E80C;
	Tue, 22 Mar 2022 06:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B3110E801
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 06:16:16 +0000 (UTC)
X-UUID: e958da4fe17a40d4aa796916fc92d45f-20220322
X-UUID: e958da4fe17a40d4aa796916fc92d45f-20220322
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 8147115; Tue, 22 Mar 2022 14:16:11 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 22 Mar 2022 14:16:09 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Mar 2022 14:16:09 +0800
Message-ID: <5318b54772ed03744cd6265d3b65679b86ec0532.camel@mediatek.com>
Subject: Re: [PATCH v3, 1/4] drm/mediatek: Adjust the timing of mipi signal
 from LP00 to LP11
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
Date: Tue, 22 Mar 2022 14:16:29 +0800
In-Reply-To: <0e4344e084e3306cd265580883c0093c7cb40d45.camel@mediatek.com>
References: <1647503611-13144-1-git-send-email-xinlei.lee@mediatek.com>
 <1647503611-13144-2-git-send-email-xinlei.lee@mediatek.com>
 <0e4344e084e3306cd265580883c0093c7cb40d45.camel@mediatek.com>
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

On Mon, 2022-03-21 at 17:36 +0800, CK Hu wrote:
> Hi, Xinlei:
> 
> On Thu, 2022-03-17 at 15:53 +0800, xinlei.lee@mediatek.com wrote:
> > From: Jitao Shi <jitao.shi@mediatek.com>
> > 
> > Old sequence:
> > 1. Pull the MIPI signal high
> > 2. Delay & Dsi_reset
> > 3. Set the dsi timing register
> > 4. dsi clk & lanes leave ulp mode and enter hs mode
> > 
> > New sequence:
> > 1. Set the dsi timing register
> > 2. Pull the MIPI signal high
> > 3. Delay & Dsi_reset
> > 4. dsi clk & lanes leave ulp mode and enter hs mode
> > 
> > In the new sequence 2 & 3 & 4 will be moved to dsi_enbale in later
> > patch.
> 
> I think there would be one patch in 5.9 make the wrong sequence, so
> add
> 'Fixes' tag to indicate which patch make the wrong sequence. Use the
> term correct/wrong instead old/new sequence.
> 
> I still do not understand what is the sequence after apply this
> patch?
> 
> Does the sequence is this after apply this patch?
> 1. Set the dsi timing register
> 2. Pull the MIPI signal high
> 3. Delay & Dsi_reset
> 4. dsi clk & lanes leave ulp mode and enter hs mode
> 
> Regards,
> CK
> 
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index ccb0511b9cd5..262c027d8c2f 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -649,14 +649,14 @@ static int mtk_dsi_poweron(struct mtk_dsi
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
> > +	mtk_dsi_rxtx_control(dsi);
> > +	usleep_range(30, 100);
> > +	mtk_dsi_reset_dphy(dsi);
> >  	mtk_dsi_clk_ulp_mode_leave(dsi);
> >  	mtk_dsi_lane0_ulp_mode_leave(dsi);
> >  	mtk_dsi_clk_hs_mode(dsi, 0);
> 
> 

Hi CK:

Thanks for your review!

You are right, the sequence after patching is:
1. Set the dsi timing register
2. Pull the MIPI signal high
3. Delay & Dsi_reset
4. dsi clk & lanes leave ulp mode and enter hs mode

This modification will not affect the dsi function, just to put the
operation of pulling up the mipi signal in poweron together to
facilitate the separation from the poweron function later.

I will add the "Fixes" tag here as well.

BR!
xinlei

