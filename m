Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1D24B0783
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 08:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C824910E734;
	Thu, 10 Feb 2022 07:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34B210E731
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 07:50:50 +0000 (UTC)
X-UUID: 4423695620764abcbe26e3c483f34dfd-20220210
X-UUID: 4423695620764abcbe26e3c483f34dfd-20220210
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1585935810; Thu, 10 Feb 2022 15:50:49 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Feb 2022 15:50:44 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 10 Feb 2022 15:50:44 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Feb 2022 15:50:42 +0800
Message-ID: <ebb92c1c8c584464245da68e42bcafac2170558c.camel@mediatek.com>
Subject: Re: [RFC PATCH] component: Add common helpers for compare/release
 functions
From: Yong Wu <yong.wu@mediatek.com>
To: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 10 Feb 2022 15:50:43 +0800
In-Reply-To: <YfRtGF3v+BwH5RkG@phenom.ffwll.local>
References: <20220128081101.27837-1-yong.wu@mediatek.com>
 <YfRtGF3v+BwH5RkG@phenom.ffwll.local>
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Joerg
 Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org, James
 Wang <james.qian.wang@arm.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Stephen
 Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-01-28 at 23:24 +0100, Daniel Vetter wrote:
> On Fri, Jan 28, 2022 at 04:11:01PM +0800, Yong Wu wrote:
> > The component requires the compare/release functions, there are so
> > many
> > copy in current kernel. Just define three common helpers for them.
> > No functional change.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> > Base on v5.17-rc1
> > ---
> >  .../gpu/drm/arm/display/komeda/komeda_drv.c    |  5 -----
> >  drivers/gpu/drm/arm/hdlcd_drv.c                |  7 +------
> >  drivers/gpu/drm/armada/armada_drv.c            |  5 -----
> >  drivers/gpu/drm/drm_of.c                       |  8 +-------
> >  drivers/gpu/drm/etnaviv/etnaviv_drv.c          |  7 -------
> >  drivers/gpu/drm/exynos/exynos_drm_drv.c        |  5 -----
> >  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |  5 -----
> >  drivers/gpu/drm/imx/imx-drm-core.c             |  4 ++--
> >  drivers/gpu/drm/ingenic/ingenic-drm-drv.c      |  5 -----
> >  drivers/gpu/drm/mcde/mcde_drv.c                |  7 +------
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c         |  5 -----
> >  drivers/gpu/drm/meson/meson_drv.c              |  8 --------
> >  drivers/gpu/drm/msm/msm_drv.c                  |  9 ---------
> >  drivers/gpu/drm/omapdrm/dss/dss.c              |  8 +-------
> >  drivers/gpu/drm/rockchip/rockchip_drm_drv.c    |  5 -----
> >  drivers/gpu/drm/sti/sti_drv.c                  |  5 -----
> >  drivers/gpu/drm/sun4i/sun4i_drv.c              |  9 ---------
> >  drivers/gpu/drm/vc4/vc4_drv.c                  |  5 -----
> >  drivers/iommu/mtk_iommu.h                      | 10 ----------
> >  drivers/power/supply/ab8500_charger.c          |  8 +-------
> >  drivers/video/fbdev/omap2/omapfb/dss/dss.c     |  8 +-------
> >  include/linux/component.h                      | 18
> > ++++++++++++++++++
> >  sound/soc/codecs/wcd938x.c                     | 16 ++----------
> > ----
> 
> Seems like a neat idea. Please add kerneldoc for the new functions
> you're
> adding (bonus point for an example in there) and make sure it all
> renders
> correctly in

OK, I will add it.

> 
> $ make htmldoc

sorry, I still need some time to run this in my environment.

> 
> Also please split up the patch series per-driver and add the
> maintainers
> to each patches' Cc: list. With that I think this should be ready for
> merging.

In the orignal idea, I thought the name compare_of/release_of was
enough, thus I squashed them into one patch, otherwise, it may cause
build fail due to redefinition when bisecting.

From Jani, It's better to add a namespace for the function name,
something like comp_ or component_?

If the function name is changed, then I could split them. A question:
The biggest change are in DRM, and all of these patches will go
together. Maybe all the DRM parts could be in one patch, to avoid so
many small patches, is this ok? or We'd better create a patch per a drm
driver.

In the end, then the code should be something like:

--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -287,6 +287,24 @@ static void take_down_master(struct master
*master)
        }
 }

+int component_compare_of(struct device *dev, void *data)
+{
+       return device_match_of_node(dev, data);
+}
+EXPORT_SYMBOL_GPL(component_compare_of);
+
+void component_release_of(struct device *dev, void *data)
+{
+       of_node_put(data);
+}
+EXPORT_SYMBOL_GPL(component_release_of);

> 
> Cheers, Daniel
> 
> >  23 files changed, 28 insertions(+), 144 deletions(-)

> > diff --git a/include/linux/component.h b/include/linux/component.h
> > index 16de18f473d7..5a7468ea827c 100644
> > --- a/include/linux/component.h
> > +++ b/include/linux/component.h
> > @@ -2,6 +2,8 @@
> >  #ifndef COMPONENT_H
> >  #define COMPONENT_H
> >  
> > +#include <linux/device.h>
> > +#include <linux/of.h>
> >  #include <linux/stddef.h>
> >  
> >  
> > @@ -82,6 +84,22 @@ struct component_master_ops {
> >  	void (*unbind)(struct device *master);
> >  };
> >  
> > +/* A set common helpers for compare/release functions */
> > +static inline int compare_of(struct device *dev, void *data)
> > +{
> > +	return dev->of_node == data;
> > +}
> > +
> > +static inline void release_of(struct device *dev, void *data)
> > +{
> > +	of_node_put(data);
> > +}
> > +
> > +static inline int compare_dev(struct device *dev, void *data)
> > +{
> > +	return dev == data;
> > +}
> > +
> >  void component_master_del(struct device *,
> >  	const struct component_master_ops *);
> 
> 

