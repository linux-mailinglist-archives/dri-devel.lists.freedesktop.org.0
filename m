Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6C3437282
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 09:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17736E827;
	Fri, 22 Oct 2021 07:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0209C6E827
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 07:05:58 +0000 (UTC)
X-UUID: 91939d923e6244d3ae6a510ec1277ff6-20211022
X-UUID: 91939d923e6244d3ae6a510ec1277ff6-20211022
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 795248656; Fri, 22 Oct 2021 15:05:54 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 22 Oct 2021 15:05:52 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Oct 2021 15:05:52 +0800
Message-ID: <42cb7e2bd62eed7284ee6806442cd89db4355df7.camel@mediatek.com>
Subject: Re: [PATCH v6 09/16] soc: mediatek: mmsys: modify reset controller
 for MT8195 vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Fri, 22 Oct 2021 15:05:52 +0800
In-Reply-To: <1249012e-4069-429d-654d-7698bcaf5153@collabora.com>
References: <20211004062140.29803-1-nancy.lin@mediatek.com>
 <20211004062140.29803-10-nancy.lin@mediatek.com>
 <1249012e-4069-429d-654d-7698bcaf5153@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

Thanks for the review.

On Thu, 2021-10-14 at 16:56 +0200, AngeloGioacchino Del Regno wrote:
> Il 04/10/21 08:21, Nancy.Lin ha scritto:
> > MT8195 vdosys1 has more than 32 reset bits and a different reset
> > base
> > than other chips. Modify mmsys for support 64 bit and different
> > reset
> > base.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mt8195-mmsys.h |  1 +
> >   drivers/soc/mediatek/mtk-mmsys.c    | 21 ++++++++++++++++-----
> >   drivers/soc/mediatek/mtk-mmsys.h    |  2 ++
> >   3 files changed, 19 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> > b/drivers/soc/mediatek/mt8195-mmsys.h
> > index 648baaec112b..f67801c42fd9 100644
> > --- a/drivers/soc/mediatek/mt8195-mmsys.h
> > +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> > @@ -123,6 +123,7 @@
> >   #define MT8195_VDO1_MIXER_SOUT_SEL_IN				
> > 0xf68
> >   #define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER		(0 <<
> > 0)
> >   
> > +#define MT8195_VDO1_SW0_RST_B           0x1d0
> 
> All other definitions are indented with tabulations, but these are
> spaces here.
> Please, do not mix formatting.
> 
> Regards,
> - Angelo

OK, I will fix it.

Regards,
Nancy

