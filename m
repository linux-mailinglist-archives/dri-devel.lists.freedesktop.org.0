Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B09437571
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 12:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99316ECFC;
	Fri, 22 Oct 2021 10:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDDC6ECFC
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 10:30:42 +0000 (UTC)
X-UUID: 5ee641a17dd94a58aa7a494abd9ee8fe-20211022
X-UUID: 5ee641a17dd94a58aa7a494abd9ee8fe-20211022
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1778794933; Fri, 22 Oct 2021 18:30:37 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Oct 2021 18:30:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Oct 2021 18:30:36 +0800
Message-ID: <c15cc3f5e507e03c15be14c929430ce5bf313139.camel@mediatek.com>
Subject: Re: [PATCH v11 15/16] drm/mediatek: add MERGE support for mediatek-drm
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <moudy.ho@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, Fabien Parent <fparent@baylibre.com>, "Yongqiang
 Niu" <yongqiang.niu@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Date: Fri, 22 Oct 2021 18:30:36 +0800
In-Reply-To: <3e72dd1e-edf2-6d42-40e7-0c1c72749a20@collabora.com>
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
 <20210921155218.10387-16-jason-jh.lin@mediatek.com>
 <3e72dd1e-edf2-6d42-40e7-0c1c72749a20@collabora.com>
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

thanks for the review.

On Thu, 2021-10-14 at 16:27 +0200, AngeloGioacchino Del Regno wrote:
> Il 21/09/21 17:52, jason-jh.lin ha scritto:
> > Add MERGE engine file:

[snip]

> > +int mtk_merge_clk_enable(struct device *dev)
> > +{
> > +	int ret = 0;
> > +	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> > +
> > +	ret = clk_prepare_enable(priv->clk);
> > +	if (ret)
> > +		pr_err("merge clk prepare enable failed\n");
> 
> If you failed to enable this clock, I take it as the hardware won't
> work or
> won't work as expected, hence you should return a failure before
> trying to
> call prepare_enable for async_clk.
> 
OK I'll fix it.

> > +	ret = clk_prepare_enable(priv->async_clk);
> > +	if (ret)
> > +		pr_err("async clk prepare enable failed\n");
> > +
> 
> You should also return a failure here but, before that, you should
> clean up
> the state by calling clk_disable_unprepare(priv->clk), or you will
> leave it
> enabled, eventually getting a hardware fault later on (which may or
> may not
> result in a board reboot), or other sorts of unexpected states.
> 
> At least, you will get issues with the refcount for "clk" and/or
> "async_clk".
> 
> Please fix that.
> 
> Also, please use dev_err or, more appropriately, DRM_ERROR instead or
> pr_err.
> 

OK I'll fix it .

> > +	return ret;
> > +}
> > +
> > +void mtk_merge_clk_disable(struct device *dev)
> > +{
> > +	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> > +
> > +	clk_disable_unprepare(priv->async_clk); > +	clk_disable_unprepa
> > re(priv->clk);
> > +}
> > +
> > +static int mtk_disp_merge_bind(struct device *dev, struct device
> > *master,
> > +			       void *data)
> > +{
> > +	return 0;
> > +}
> > +
> > +static void mtk_disp_merge_unbind(struct device *dev, struct
> > device *master,
> > +				  void *data)
> > +{
> > +}
> > +
> > +static const struct component_ops mtk_disp_merge_component_ops = {
> > +	.bind	= mtk_disp_merge_bind,
> > +	.unbind = mtk_disp_merge_unbind,
> > +};
> > +
> > +static int mtk_disp_merge_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct resource *res;
> > +	struct mtk_disp_merge *priv;
> > +	int ret;
> > +
> > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	priv->regs = devm_ioremap_resource(dev, res);
> > +	if (IS_ERR(priv->regs)) {
> > +		dev_err(dev, "failed to ioremap merge\n");
> > +		return PTR_ERR(priv->regs);
> > +	}
> > +
> > +	priv->clk = devm_clk_get(dev, NULL);
> > +	if (IS_ERR(priv->clk)) {
> > +		dev_err(dev, "failed to get merge clk\n");
> > +		return PTR_ERR(priv->clk);
> > +	}
> > +
> > +	priv->async_clk = of_clk_get(dev->of_node, 1);
> > +	if (IS_ERR(priv->async_clk)) {
> > +		ret = PTR_ERR(priv->async_clk);
> > +		dev_dbg(dev, "No merge async clock: %d\n", ret);
> > +		priv->async_clk = NULL;
> > +	}
> > +
> 
> You are using devm_clk_get for the first clock, of_clk_get for the
> second one:
> what's the reason for that?
> 
> Also, async_clk seems to be optional... and there's the right API for
> you!
> If you use devm_clk_get_optional(), you won't have to manually assign
> NULL
> to priv->async_clk, as that's API handled... and you'll get a failure
> if
> the return value is an error that's not -ENOENT (so, it'll fail if
> the clock
> was declared in DT, but there was an error acquiring it).
> 
> Please use devm_clk_get_optional() here.
> 

Yes, async_clk is optional.
Thanks for your suggestion.
I'll try it.

> Regards,
> - Angelo
-- 
Regards,
Jason-JH Lin <jason-jh.lin@mediatek.com>

