Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED953583B67
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 11:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B6718A388;
	Thu, 28 Jul 2022 09:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBD98DF7E
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 09:40:47 +0000 (UTC)
X-UUID: ec76a3fca1e7485c9046b5b537d5a4e7-20220728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:f6e62fc7-c20c-4bd7-83d4-42ab672c27cc, OB:20,
 L
 OB:10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:45
X-CID-INFO: VERSION:1.1.8, REQID:f6e62fc7-c20c-4bd7-83d4-42ab672c27cc, OB:20,
 LOB
 :10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-META: VersionHash:0f94e32, CLOUDID:1a5993d0-841b-4e95-ad42-8f86e18f54fc,
 C
 OID:f0ccf6249fe2,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: ec76a3fca1e7485c9046b5b537d5a4e7-20220728
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1802726423; Thu, 28 Jul 2022 17:40:42 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 28 Jul 2022 17:40:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 28 Jul 2022 17:40:41 +0800
Message-ID: <22cd8a6807385941c55e75b390d31424936ae8c4.camel@mediatek.com>
Subject: Re: [PATCH v15 07/11] drm/mediatek: Add retry to prevent
 misjudgment for sink devices
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <deller@gmx.de>, <airlied@linux.ie>
Date: Thu, 28 Jul 2022 17:40:41 +0800
In-Reply-To: <ce46e9b2-8e34-b6cd-d802-35b3ae66e02d@collabora.com>
References: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
 <20220727045035.32225-8-rex-bc.chen@mediatek.com>
 <ce46e9b2-8e34-b6cd-d802-35b3ae66e02d@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-07-27 at 11:40 +0200, AngeloGioacchino Del Regno wrote:
> Il 27/07/22 06:50, Bo-Chen Chen ha scritto:
> > For some DP dungles, we need to train more than onece to confirm
> > that we
> > don't misjudge the status of sink device.
> 
> Please fix the typos in your commit title and description.
> title: misjudgment -> misjudgement
> desc: dungles->dongles; onece->once
> 
> > 
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_dp.c | 21 ++++++++++++++++++---
> >   1 file changed, 18 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> > b/drivers/gpu/drm/mediatek/mtk_dp.c
> > index ce817cb59445..80d7d6488105 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> > @@ -42,6 +42,7 @@
> >   #define MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT 3
> >   #define MTK_DP_TBC_BUF_READ_START_ADDR 0x08
> >   #define MTK_DP_TRAIN_DOWNSCALE_RETRY 8
> > +#define MTK_DP_TRAIN_CLEAR_RETRY 50
> >   
> >   struct mtk_dp_train_info {
> >   	bool tps3;
> > @@ -1431,11 +1432,25 @@ static int mtk_dp_video_config(struct
> > mtk_dp *mtk_dp)
> >   
> >   static int mtk_dp_training(struct mtk_dp *mtk_dp)
> >   {
> > +	short max_retry = MTK_DP_TRAIN_CLEAR_RETRY;
> >   	int ret;
> >   
> > -	ret = mtk_dp_train_start(mtk_dp);
> > -	if (ret)
> > -		return ret;
> > +	/*
> > +	 * We do retry to confirm that we don't misjudge the sink
> > status.
> > +	 * If it is still failed, we can confirm there are some issues
> > for the
> > +	 * sink device.
> > +	 */
> > +	do {
> > +		ret = mtk_dp_train_start(mtk_dp);
> > +		if (!ret)
> > +			break;
> > +	} while (--max_retry);
> > +
> > +	dev_info(mtk_dp->dev, "dp training clear retry times: %d\n",
> > +		 MTK_DP_TRAIN_CLEAR_RETRY - max_retry);
> 
> dev_dbg() here.
> 
> ...after which,
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 

Hello Angelo,

Thanks for your review.
I will modify these in next version.

BRs,
Bo-Chen

> > +
> > +	if (!max_retry)
> > +		return -ETIMEDOUT;
> >   
> >   	ret = mtk_dp_video_config(mtk_dp);
> >   	if (ret)
> 
> 

