Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 510AD58A71C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 09:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F17B14AC;
	Fri,  5 Aug 2022 07:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C988DB329F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 07:11:05 +0000 (UTC)
X-UUID: edbf0bb746ee424298d601a3ac16ac96-20220805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=KItryM5rJCMELCueh9zyNBcyx34Z/KHfpqfgCOXw9Oc=; 
 b=eWG4Rbp9aBLk88zV5dwt62PSJ+ylbzgti5IGonvDjRj0uZSTsLRfc3yJ5IqJhZ0i7/dRUMd3xpajvM7lKNv5xZbNgqclMSQkW/O9lUfJZ0TmZ6eFaAJYycpBaf+FokLAbyJnGiTnuSCuR1uf9CWwpTTjn0ftLrjOaFwcaYNsNys=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:40b86431-2295-40ca-af88-5ba7e68b0a8a, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:0f94e32, CLOUDID:d5abce48-f57f-4088-93dd-066979cdb4e6,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: edbf0bb746ee424298d601a3ac16ac96-20220805
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1894121297; Fri, 05 Aug 2022 15:11:00 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 5 Aug 2022 15:10:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 5 Aug 2022 15:10:59 +0800
Message-ID: <9617939ab04741daaf7d1f966bf8dd02fe3a114d.camel@mediatek.com>
Subject: Re: [PATCH v15 07/11] drm/mediatek: Add retry to prevent
 misjudgment for sink devices
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <deller@gmx.de>, <airlied@linux.ie>
Date: Fri, 5 Aug 2022 15:10:59 +0800
In-Reply-To: <22cd8a6807385941c55e75b390d31424936ae8c4.camel@mediatek.com>
References: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
 <20220727045035.32225-8-rex-bc.chen@mediatek.com>
 <ce46e9b2-8e34-b6cd-d802-35b3ae66e02d@collabora.com>
 <22cd8a6807385941c55e75b390d31424936ae8c4.camel@mediatek.com>
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

Hello all,

I will drop this modification becaus after we testing current drivers,
the issue described in commit message does not occur.

BRs,
Bo-Chen

On Thu, 2022-07-28 at 17:40 +0800, Rex-BC Chen wrote:
> On Wed, 2022-07-27 at 11:40 +0200, AngeloGioacchino Del Regno wrote:
> > Il 27/07/22 06:50, Bo-Chen Chen ha scritto:
> > > For some DP dungles, we need to train more than onece to confirm
> > > that we
> > > don't misjudge the status of sink device.
> > 
> > Please fix the typos in your commit title and description.
> > title: misjudgment -> misjudgement
> > desc: dungles->dongles; onece->once
> > 
> > > 
> > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > ---
> > >   drivers/gpu/drm/mediatek/mtk_dp.c | 21 ++++++++++++++++++---
> > >   1 file changed, 18 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> > > b/drivers/gpu/drm/mediatek/mtk_dp.c
> > > index ce817cb59445..80d7d6488105 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> > > @@ -42,6 +42,7 @@
> > >   #define MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT 3
> > >   #define MTK_DP_TBC_BUF_READ_START_ADDR 0x08
> > >   #define MTK_DP_TRAIN_DOWNSCALE_RETRY 8
> > > +#define MTK_DP_TRAIN_CLEAR_RETRY 50
> > >   
> > >   struct mtk_dp_train_info {
> > >   	bool tps3;
> > > @@ -1431,11 +1432,25 @@ static int mtk_dp_video_config(struct
> > > mtk_dp *mtk_dp)
> > >   
> > >   static int mtk_dp_training(struct mtk_dp *mtk_dp)
> > >   {
> > > +	short max_retry = MTK_DP_TRAIN_CLEAR_RETRY;
> > >   	int ret;
> > >   
> > > -	ret = mtk_dp_train_start(mtk_dp);
> > > -	if (ret)
> > > -		return ret;
> > > +	/*
> > > +	 * We do retry to confirm that we don't misjudge the sink
> > > status.
> > > +	 * If it is still failed, we can confirm there are some issues
> > > for the
> > > +	 * sink device.
> > > +	 */
> > > +	do {
> > > +		ret = mtk_dp_train_start(mtk_dp);
> > > +		if (!ret)
> > > +			break;
> > > +	} while (--max_retry);
> > > +
> > > +	dev_info(mtk_dp->dev, "dp training clear retry times: %d\n",
> > > +		 MTK_DP_TRAIN_CLEAR_RETRY - max_retry);
> > 
> > dev_dbg() here.
> > 
> > ...after which,
> > 
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > 
> 
> Hello Angelo,
> 
> Thanks for your review.
> I will modify these in next version.
> 
> BRs,
> Bo-Chen
> 
> > > +
> > > +	if (!max_retry)
> > > +		return -ETIMEDOUT;
> > >   
> > >   	ret = mtk_dp_video_config(mtk_dp);
> > >   	if (ret)
> > 
> > 
> 
> 

