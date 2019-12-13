Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3129811DF22
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 09:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2276E28B;
	Fri, 13 Dec 2019 08:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 21DFD89F85
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 08:09:39 +0000 (UTC)
X-UUID: 5094750f1ed44e73a785cb32d4d15499-20191213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=XJhy5g+NHFwDI5f0gUqZjPngJbGRrCHM6x7omxpoGFE=; 
 b=g8UefY2Re5OdU14Qhf+YcoxakJaAws8LfCr2CQkQyIL69QLqcKisebsyij0qXPqbbLk2zwVAwAOJ4bpq2ahH2Aqqty+n8NQIMMUzw2dxp50etsDpGAN4DBt+sg2SlqpO5MN5GdBE7aYxBoMCst1/r8jA5Ogq8KXUdqrJ3Im/xCE=;
X-UUID: 5094750f1ed44e73a785cb32d4d15499-20191213
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 981649545; Fri, 13 Dec 2019 16:09:37 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 16:09:23 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 13 Dec 2019 16:09:34 +0800
Message-ID: <1576224575.13335.1.camel@mtksdaap41>
Subject: Re: [PATCH v2, 1/2] drm/mediatek: Fix gamma correction issue
From: CK Hu <ck.hu@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Date: Fri, 13 Dec 2019 16:09:35 +0800
In-Reply-To: <1576224191.31822.2.camel@mhfsdcap03>
References: <1576222132-31586-1-git-send-email-yongqiang.niu@mediatek.com>
 <1576222132-31586-2-git-send-email-yongqiang.niu@mediatek.com>
 <1576223336.9817.3.camel@mtksdaap41> <1576224191.31822.2.camel@mhfsdcap03>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E0C81D5B10B64C1A208C0F2484C5E394387DD294A1723E0D5353D5CFEA9397FD2000:8
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Yongqiang:

On Fri, 2019-12-13 at 16:03 +0800, Yongqiang Niu wrote:
> On Fri, 2019-12-13 at 15:48 +0800, CK Hu wrote:
> > Hi, Yongqiang:
> > 
> > The title is too rough. Any bug of gamma would be this title. I would
> > like the title show explicitly what it does.
> > 
> > On Fri, 2019-12-13 at 15:28 +0800, Yongqiang Niu wrote:
> > > if there is no gamma function in the crtc
> > > display path, don't add gamma property
> > > for crtc
> > > 
> > > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 10 ++++++++--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > index ca4fc47..9a8e1d4 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > @@ -734,6 +734,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
> > >  	int pipe = priv->num_pipes;
> > >  	int ret;
> > >  	int i;
> > > +	uint gamma_lut_size = 0;
> > >  
> > >  	if (!path)
> > >  		return 0;
> > > @@ -785,6 +786,9 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
> > >  		}
> > >  
> > >  		mtk_crtc->ddp_comp[i] = comp;
> > > +
> > > +		if (comp->funcs->gamma_set)
> > > +			gamma_lut_size = MTK_LUT_SIZE;
> > >  	}
> > >  
> > >  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
> > > @@ -805,8 +809,10 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
> > >  				NULL, pipe);
> > >  	if (ret < 0)
> > >  		return ret;
> > > -	drm_mode_crtc_set_gamma_size(&mtk_crtc->base, MTK_LUT_SIZE);
> > > -	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, false, MTK_LUT_SIZE);
> > > +
> > > +	if (gamma_lut_size)
> > > +		drm_mode_crtc_set_gamma_size(&mtk_crtc->base, gamma_lut_size);
> > > +	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, false, gamma_lut_size);
> > 
> > If there is no gamma, shall we enable color management?
> > 
> > Regards,
> > CK
> 
> drm_crtc_enable_color_mgmt will check the gamma_lut_size parameter,
> if no gamma, gamma_lut_size will be 0, and gamma_lut_size will not attch
> gamma property for the crtc

OK, you're right. So

Reviewed-by: CK Hu <ck.hu@mediatek.com>

and what title would you like?
I could modify it when I apply this patch.

Regards,
CK

> > 
> > >  	priv->num_pipes++;
> > >  	mutex_init(&mtk_crtc->hw_lock);
> > >  
> > 
> > 
> 
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
