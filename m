Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A19A4372CC
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 09:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368796E8EC;
	Fri, 22 Oct 2021 07:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D6A6E8EC
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 07:33:22 +0000 (UTC)
X-UUID: 68c4324bb5d747abbdadf043ab15cb56-20211022
X-UUID: 68c4324bb5d747abbdadf043ab15cb56-20211022
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 271003882; Fri, 22 Oct 2021 15:33:19 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 22 Oct 2021 15:33:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Oct 2021 15:33:17 +0800
Message-ID: <8e66debdbba43680391b02116cbdf5af85710565.camel@mediatek.com>
Subject: Re: [PATCH v6 10/16] soc: mediatek: add mtk-mutex support for
 mt8195 vdosys1
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
Date: Fri, 22 Oct 2021 15:33:17 +0800
In-Reply-To: <ccbaff29-808a-4c7b-51d4-764cf283fbbc@collabora.com>
References: <20211004062140.29803-1-nancy.lin@mediatek.com>
 <20211004062140.29803-11-nancy.lin@mediatek.com>
 <ccbaff29-808a-4c7b-51d4-764cf283fbbc@collabora.com>
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

On Thu, 2021-10-14 at 17:01 +0200, AngeloGioacchino Del Regno wrote:
> > Add mtk-mutex support for mt8195 vdosys1.
> > The vdosys1 path component contains ovl_adaptor, merge5,
> > and dp_intf1. Ovl_adaptor is composed of several sub-elements,
> > so change it to support multi-bit control.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mtk-mutex.c | 296 ++++++++++++++++++------
> > -------
> >   1 file changed, 175 insertions(+), 121 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mutex.c
> > b/drivers/soc/mediatek/mtk-mutex.c
> > index 36502b27fe20..7767fedbd14f 100644
> > --- a/drivers/soc/mediatek/mtk-mutex.c
> > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > @@ -29,113 +29,142 @@
> >   
> >   #define INT_MUTEX				BIT(1)
> >   
> > -#define MT8167_MUTEX_MOD_DISP_PWM		1
> 
> This patch doesn't only add support for MT8195 vdosys1, but also
> changes
> all definitions to a different "format", and also changes the type
> for
> "mutex_mod" from int to long.
> In reality, the actual functional change is minimal, compared to the
> size of
> this entire patch.
> 
> Please, split this patch in two parts: one patch changing the defines
> and
> the mutex_mod type (specifying that it's a preparation for adding
> support for
> mt8195 vdosys1 mutex) and one patch adding such support.
> 
> Thanks!
> 
> Regards,
> - Angelo

OK, I will separate it into two patches.

Regards,
Nancy
> 
> 

