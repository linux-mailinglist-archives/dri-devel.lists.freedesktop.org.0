Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A310F54DC46
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 09:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C51C10F1CF;
	Thu, 16 Jun 2022 07:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FC210F1CF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 07:57:25 +0000 (UTC)
X-UUID: caba227ec0a84f6b94ab525aa3a8a738-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:d60c8226-3f71-4dd3-b520-54f946dd5cce, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:b14ad71, CLOUDID:766075f6-e099-41ba-a32c-13b8bfe63214,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: caba227ec0a84f6b94ab525aa3a8a738-20220616
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 995734179; Thu, 16 Jun 2022 15:57:18 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 16 Jun 2022 15:57:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 16 Jun 2022 15:57:17 +0800
Message-ID: <54879555b101b709ee7edd1adf346ba00c8996ef.camel@mediatek.com>
Subject: Re: [PATCH v11 10/12] drm/mediatek: dpi: Add dpintf support
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <matthias.bgg@gmail.com>, <airlied@linux.ie>
Date: Thu, 16 Jun 2022 15:57:17 +0800
In-Reply-To: <7d2a1d75-e400-71aa-7127-144e257f408d@collabora.com>
References: <20220613064841.10481-1-rex-bc.chen@mediatek.com>
 <20220613064841.10481-11-rex-bc.chen@mediatek.com>
 <7d2a1d75-e400-71aa-7127-144e257f408d@collabora.com>
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
Cc: devicetree@vger.kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-06-13 at 12:55 +0200, AngeloGioacchino Del Regno wrote:
> Il 13/06/22 08:48, Bo-Chen Chen ha scritto:
> > From: Guillaume Ranquet <granquet@baylibre.com>
> > 
> > dpintf is the displayport interface hardware unit. This unit is
> > similar
> > to dpi and can reuse most of the code.
> > 
> > This patch adds support for mt8195-dpintf to this dpi driver. Main
> > differences are:
> >   - Some features/functional components are not available for
> > dpintf
> >     which are now excluded from code execution once is_dpintf is
> > set
> >   - dpintf can and needs to choose between different clockdividers
> > based
> >     on the clockspeed. This is done by choosing a different clock
> > parent.
> >   - There are two additional clocks that need to be managed. These
> > are
> >     only set for dpintf and will be set to NULL if not supplied.
> > The
> >     clk_* calls handle these as normal clocks then.
> >   - Some register contents differ slightly between the two
> > components. To
> >     work around this I added register bits/masks with a DPINTF_
> > prefix
> >     and use them where different.
> > 
> > Based on a separate driver for dpintf created by
> > Jitao shi <jitao.shi@mediatek.com>.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > [Bo-Chen: Modify reviewers' comments.]
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_dpi.c          | 115
> > ++++++++++++++++++--
> >   drivers/gpu/drm/mediatek/mtk_dpi_regs.h     |  13 +++
> >   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   4 +
> >   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
> >   drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   3 +
> >   5 files changed, 126 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 6b8cf648a5b5..08c8f21b4421 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -71,6 +71,7 @@ struct mtk_dpi {
> >   	void __iomem *regs;
> >   	struct device *dev;
> >   	struct clk *engine_clk;
> > +	struct clk *pll_gate_clk;
> 
> You don't need this clock in this driver, at all.
> 
> `pll_gate` would be CLK_VDO0_DP_INTF0_DP_INTF (parent = CLK_TOP_EDP);
> 
> Currently, you're assigning CLK_TOP_EDP to "pixel", but you can, at
> this point,
> simply assign CLK_VDO0_DP_INTF0_DP_INTF to "pixel" instead... as when
> you call
> clk_prepare_enable() on it, that'll also take care of enabling its
> CLK_TOP_EDP
> parent for you.
> 
> You're not doing anything special if not taking care of
> enabling/disabling it.
> 
> Regards,
> Angelo
> 

Hello Angelo,

Thanks for advice. I can use your patch[1] to do this and verify ok.
I will remove pll_gate_clk in next version.

[1]: 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220614091020.21472-1-angelogioacchino.delregno@collabora.com/

BRs,
Bo-Chen

