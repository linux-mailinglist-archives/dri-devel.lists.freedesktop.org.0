Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 384E846CA52
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 02:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E789A6E02F;
	Wed,  8 Dec 2021 01:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDAA6E02F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 01:53:33 +0000 (UTC)
X-UUID: 761c66d9ec334adb9b35c7327700163e-20211208
X-UUID: 761c66d9ec334adb9b35c7327700163e-20211208
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1156120109; Wed, 08 Dec 2021 09:53:28 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 8 Dec 2021 09:53:25 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Dec 2021 09:53:25 +0800
Message-ID: <8a126638578e5437ae2b210e2e4076a29aa52907.camel@mediatek.com>
Subject: Re: [PATCH v9 16/22] drm/mediatek: add ETHDR support for MT8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>
Date: Wed, 8 Dec 2021 09:53:25 +0800
In-Reply-To: <ea057e8b080a7f553ee45f282459090dca4fb4c6.camel@pengutronix.de>
References: <20211130033519.26086-1-nancy.lin@mediatek.com>
 <20211130033519.26086-17-nancy.lin@mediatek.com>
 <ea057e8b080a7f553ee45f282459090dca4fb4c6.camel@pengutronix.de>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias
 Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

Thanks for the review.

On Tue, 2021-11-30 at 10:46 +0100, Philipp Zabel wrote:
> Hi Nancy,
> 
> On Tue, 2021-11-30 at 11:35 +0800, Nancy.Lin wrote:
> [...]
> > +void mtk_ethdr_stop(struct device *dev)
> > +{
> > +	struct mtk_ethdr *priv = dev_get_drvdata(dev);
> > +	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
> > +
> > +	writel(0, mixer->regs + MIX_EN);
> > +	writel(1, mixer->regs + MIX_RST);
> > +	reset_control_reset(devm_reset_control_array_get(dev, true,
> > true));
> 
> Are these reset lines really shared with other hardware units, and
> more
> specifically, are there other drivers that also try to control them?
> 
> If so, please use devm_reset_control_array_get_optional_shared().
> 
> Otherwise use devm_reset_control_array_get_optional_exclusive()
> instead.
> 
> If you really need to share the reset line with other hardware and
> have
> to trigger it more than once, the only use case supported by the
> reset
> framework is to use reset_control_reset() before starting the
> hardware
> for each user and then reset_control_rearm() after stopping it for
> all
> users (see [1]). That would both stop the reset from being triggered
> while the hardware is active (before last _rearm) and allow another
> reset once after all hardware is stopped.
> 
> [1] 
> https://urldefense.com/v3/__https://www.kernel.org/doc/html/latest/driver-api/reset.htm*triggering__;Iw!!CTRNKA9wMg0ARbw!zETfuA55cH_3uiTFEknFoWXKkApsSKFbemms9qLwluMdylp-FVK3jn5E9Ld1ZCwv$
>  
> 
> Also, request the reset control once in the probe function, not every
> time ETHDR is stopped. Otherwise you'll end up leaking devres memory
> 
> regards
> Philipp

These reset lines doesn't share with other hardware units. I will use
devm_reset_control_array_get_optional_exclusive instead and and reqest
reset control in the probe function.

Regards,
Nancy


