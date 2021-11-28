Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1299E46074C
	for <lists+dri-devel@lfdr.de>; Sun, 28 Nov 2021 16:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7A06F50F;
	Sun, 28 Nov 2021 15:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FCA6F50F
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Nov 2021 15:53:56 +0000 (UTC)
X-UUID: 03d88eb426184f58abd998b5af1e9bd0-20211128
X-UUID: 03d88eb426184f58abd998b5af1e9bd0-20211128
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2074660873; Sun, 28 Nov 2021 23:53:52 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Nov 2021 23:53:50 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 28 Nov 2021 23:53:50 +0800
Message-ID: <1d23de3828bf921d00079f0962c9736e3e671ee2.camel@mediatek.com>
Subject: Re: FW: [PATCH 3/3] drm/mediatek: add devlink to cmdq dev
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>
Date: Sun, 28 Nov 2021 23:53:50 +0800
In-Reply-To: <ae29424d8121f8951cfb5fece114b6fcba90d351.camel@mediatek.com>
References: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
 <20211117064158.27451-4-jason-jh.lin@mediatek.com>
 <YZXqz6XDChwscDC0@google.com>
 <PU1PR03MB306252A252139515F7EA9ABCB8659@PU1PR03MB3062.apcprd03.prod.outlook.com>
 <ae29424d8121f8951cfb5fece114b6fcba90d351.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi Tzung-Bi,

Thanks for the reviews.

> From: Linux-mediatek <linux-mediatek-bounces@lists.infradead.org> On
> Behalf Of Tzung-Bi Shih
> Sent: Thursday, November 18, 2021 1:55 PM
> To: Jason-JH Lin (林睿祥) <Jason-JH.Lin@mediatek.com>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>; Philipp Zabel <
> p.zabel@pengutronix.de>; Matthias Brugger <matthias.bgg@gmail.com>;
> Jassi Brar <jassisinghbrar@gmail.com>; David Airlie <airlied@linux.ie
> linux-mediatek@lists.infradead.org; 
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; 
> hsinyi@chromium.org; fshao@chromium.org; Nancy Lin (林欣螢) <
> Nancy.Lin@mediatek.com>; Singo Chang (張興國)Singo.Chang@mediatek.com>
> Subject: Re: [PATCH 3/3] drm/mediatek: add devlink to cmdq dev
> 
> On Wed, Nov 17, 2021 at 02:41:58PM +0800, jason-jh.lin wrote:
> > @@ -158,6 +159,7 @@ static void mtk_drm_crtc_destroy(struct
> > drm_crtc *crtc)
> >  	mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
> >  
> >  	if (mtk_crtc->cmdq_client.chan) {
> > +		device_link_remove(mtk_crtc->drm_dev, mtk_crtc->
> > cmdq_client.chan->mbox->dev);
> > 
> >  		mbox_free_channel(mtk_crtc->cmdq_client.chan);
> >  		mtk_crtc->cmdq_client.chan = NULL;
> >  	}
> 
> [...]
> > @@ -956,6 +959,16 @@ int mtk_drm_crtc_create(struct drm_device
> > *drm_dev,
> >  	}
> >  
> >  	if (mtk_crtc->cmdq_client.chan) {
> > +		struct device_link *link;
> > +
> > +		/* add devlink to cmdq dev to make sure suspend/resume
> > order is correct */
> > +		link = device_link_add(dev, mtk_crtc->cmdq_client.chan-
> > > mbox->dev,
> > 
> > +				       DL_FLAG_PM_RUNTIME |
> > DL_FLAG_STATELESS);
> > +		if (!link) {
> > +			dev_err(dev, "Unable to link dev=%s\n",
> > +				dev_name(mtk_crtc->cmdq_client.chan-
> > > mbox->dev));
> > 
> > +		}
> > +
> 
> If device_link_add() failed, doesn't mtk_drm_crtc_create() need to
> return an error and exit?

OK, I'll add the return error at the next verion.
> 
> OTOH, if device_link_add() failed, won't it bring any side effects to
> call device_link_remove()?
> 

Because device_link_remove() will find the device_link of supplier and
consumer, then delete the device_link between them.
If device_link_add() failed, supplier and consumer won't create the
device_link.
So calling device_link_remove() won't do anything without deive_link
and won't bring any side effects.

Regards,
Jason-JH.Lin
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> 
> 
> 
> 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!125dmOZ7xCLkwbIrzZf1VqVLQBbdT4RFHoMjR38U1GeCxaTM6xvvB-mSr7sTc6BuY5IH$
> 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!125dmOZ7xCLkwbIrzZf1VqVLQBbdT4RFHoMjR38U1GeCxaTM6xvvB-mSr7sTc6BuY5IH$
> 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!125dmOZ7xCLkwbIrzZf1VqVLQBbdT4RFHoMjR38U1GeCxaTM6xvvB-mSr7sTc6BuY5IH$
> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

