Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 382DA11C504
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 05:50:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E2E6EC53;
	Thu, 12 Dec 2019 04:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id CC40B6EC53
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 04:50:07 +0000 (UTC)
X-UUID: 0350d3d39d8d4823bb50c2421b97151f-20191212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=61QzL2uAhif1inmfHk4F3GpOWbSMt53a76nKAzVwLMU=; 
 b=f5bMNPM5X3vpibe0RnOnQWIHHLjNcUhruZoyv2kTE7kQMw2sq6n8oCiqECQvYoXylolEXoxlHHdzYCtPjixo5Mk4wplOpBb8wMOEzckUSh89XQ0ukV3N+v41y+IA9vePsWjQrTSMqTJAM1tHOscJaSAx8PQJYXxGxJA+hQ4XHSw=;
X-UUID: 0350d3d39d8d4823bb50c2421b97151f-20191212
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1765757622; Thu, 12 Dec 2019 12:49:59 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 12:49:45 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 12 Dec 2019 12:49:53 +0800
Message-ID: <1576126197.29693.3.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Fix can't get component for external
 display plane.
From: CK Hu <ck.hu@mediatek.com>
To: Pi-Hsun Shih <pihsun@chromium.org>
Date: Thu, 12 Dec 2019 12:49:57 +0800
In-Reply-To: <1575264270.16063.0.camel@mtksdaap41>
References: <20191127100419.130300-1-pihsun@chromium.org>
 <1575264270.16063.0.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A33FA4A393275F96C1D67CACE7875D97147C4BC54960F0F3AB9A8D502DF8916C2000:8
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
Cc: Sean Paul <seanpaul@chromium.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Pi-Hsun:

On Mon, 2019-12-02 at 13:24 +0800, CK Hu wrote:
> Hi, Pi-Hsun:
> 
> 
> On Wed, 2019-11-27 at 18:04 +0800, Pi-Hsun Shih wrote:
> > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > 
> > The original logic is ok for primary display, but will not find out
> > component for external display.
> > 
> > For example, plane->index is 6 for external display, but there are only
> > 2 layer nr in external display, and this condition will never happen:
> > if (plane->index < (count + mtk_ddp_comp_layer_nr(comp)))
> > 
> > Fix this by using the offset of the plane to mtk_crtc->planes as index,
> > instead of plane->index.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 

Applied to mediatek-drm-fixes-5.5 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-fixes-5.5


Regards,
CK

> Regards,
> CK
> 
> > 
> > Fixes: d6b53f68356f ("drm/mediatek: Add helper to get component for a plane")
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index f80a8ba75977..b34e7d70702a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -215,11 +215,12 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
> >  	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> >  	struct mtk_ddp_comp *comp;
> >  	int i, count = 0;
> > +	unsigned int local_index = plane - mtk_crtc->planes;
> >  
> >  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
> >  		comp = mtk_crtc->ddp_comp[i];
> > -		if (plane->index < (count + mtk_ddp_comp_layer_nr(comp))) {
> > -			*local_layer = plane->index - count;
> > +		if (local_index < (count + mtk_ddp_comp_layer_nr(comp))) {
> > +			*local_layer = local_index - count;
> >  			return comp;
> >  		}
> >  		count += mtk_ddp_comp_layer_nr(comp);
> > 
> > base-commit: 1875ff320f14afe21731a6e4c7b46dd33e45dfaa
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
