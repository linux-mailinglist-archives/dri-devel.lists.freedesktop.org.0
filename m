Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A96504B67
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 05:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517DA10ED5A;
	Mon, 18 Apr 2022 03:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A7D10ED5A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 03:52:57 +0000 (UTC)
X-UUID: e6254cd210fd445cab5263b81add8c69-20220418
X-UUID: e6254cd210fd445cab5263b81add8c69-20220418
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 336577110; Mon, 18 Apr 2022 11:52:50 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 18 Apr 2022 11:52:48 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 18 Apr 2022 11:52:48 +0800
Message-ID: <3bc291ef3b087ff1d45aa5a8eaf95b927c803dd6.camel@mediatek.com>
Subject: Re: [PATCH v19 03/10] soc: mediatek: add mtk-mmsys support for
 mt8195 vdosys0
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
Date: Mon, 18 Apr 2022 11:52:48 +0800
In-Reply-To: <3a905d21-26a7-654f-4ab7-7ad1fa1376c6@collabora.com>
References: <20220415083911.5186-1-jason-jh.lin@mediatek.com>
 <20220415083911.5186-4-jason-jh.lin@mediatek.com>
 <3a905d21-26a7-654f-4ab7-7ad1fa1376c6@collabora.com>
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
Cc: devicetree@vger.kernel.org, Singo
 Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

Thanks for the reviews.

On Fri, 2022-04-15 at 12:18 +0200, AngeloGioacchino Del Regno wrote:
> Il 15/04/22 10:39, jason-jh.lin ha scritto:
> > 1. Add mt8195 mmsys compatible for 2 vdosys.
> > 2. Add io_start into each driver data of mt8195 vdosys.
> > 3. Add get match data function to identify mmsys by io_start.
> > 4. Add mt8195 routing table settings of vdosys0.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> 
> Unless anyone wants this commit to be split in two, one for the match
> data
> and one for the mt8195 addition, it looks almost good to me, apart
> one small
> change that has to be done, check below:
> 
> 
> > --- >   drivers/soc/mediatek/mt8195-mmsys.h    | 370
> > +++++++++++++++++++++++++
> >   drivers/soc/mediatek/mtk-mmsys.c       | 152 +++++++++-
> >   drivers/soc/mediatek/mtk-mmsys.h       |   6 +
> >   include/linux/soc/mediatek/mtk-mmsys.h |  11 +
> >   4 files changed, 528 insertions(+), 11 deletions(-)
> >   create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> > 
> 
> ..snip..
> 
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.h
> > b/drivers/soc/mediatek/mtk-mmsys.h
> > index 77f37f8c715b..21cf300ba864 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.h
> > +++ b/drivers/soc/mediatek/mtk-mmsys.h
> > @@ -87,12 +87,18 @@ struct mtk_mmsys_routes {
> >   };
> >   
> >   struct mtk_mmsys_driver_data {
> > +	const u32 io_start;
> 
> I agree with you that this iostart is in 32bits boundaries, and that
> this will
> practically never change... and I was in doubt whether this would be
> acceptable
> or not, because of saving some memory.
> 
> Even though I would really love to have the savings, in order to
> avoid having any
> "surprises" in the future (any future breakage for "reasons"), we
> shall comply
> with the kernel types, so, this has to be...
> 
> 	const resource_size_t io_start;
> 
> ...and this is the same for both this file and mtk_drm_drv.h, which
> you modify in
> patch 07/10.
> 
> After fixing that:
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> 
> Cheers,
> Angelo

OK, I'll fix them in the next version.
Thanks.

Regards,
Jason-JH.Lin
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

