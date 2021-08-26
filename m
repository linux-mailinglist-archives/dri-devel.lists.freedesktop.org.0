Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29413F8AD4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 17:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70196E877;
	Thu, 26 Aug 2021 15:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EBA6E876
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 15:17:20 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1mJH80-0000dH-7o; Thu, 26 Aug 2021 17:17:16 +0200
Message-ID: <b8e3f7c6bec4d01ba05861de6a25c0b7fd432d0a.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] drm/etnaviv: fix dma configuration of the virtual
 device
From: Lucas Stach <l.stach@pengutronix.de>
To: Robin Murphy <robin.murphy@arm.com>, Michael Walle <michael@walle.cc>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Cc: "Lukas F . Hartmann" <lukas@mntre.com>, Marek Vasut
 <marek.vasut@gmail.com>,  Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 26 Aug 2021 17:17:13 +0200
In-Reply-To: <df806090-8a21-33e8-1e01-bd03b6ed64cf@arm.com>
References: <20210826121006.685257-1-michael@walle.cc>
 <20210826121006.685257-3-michael@walle.cc>
 <df806090-8a21-33e8-1e01-bd03b6ed64cf@arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Am Donnerstag, dem 26.08.2021 um 16:00 +0100 schrieb Robin Murphy:
> On 2021-08-26 13:10, Michael Walle wrote:
> > The DMA configuration of the virtual device is inherited from the first
> > actual etnaviv device. Unfortunately, this doesn't work with an IOMMU:
> > 
> > [    5.191008] Failed to set up IOMMU for device (null); retaining platform DMA ops
> > 
> > This is because there is no associated iommu_group with the device. The
> > group is set in iommu_group_add_device() which is eventually called by
> > device_add() via the platform bus:
> >    device_add()
> >      blocking_notifier_call_chain()
> >        iommu_bus_notifier()
> >          iommu_probe_device()
> >            __iommu_probe_device()
> >              iommu_group_get_for_dev()
> >                iommu_group_add_device()
> > 
> > Move of_dma_configure() into the probe function, which is called after
> > device_add(). Normally, the platform code will already call it itself
> > if .of_node is set. Unfortunately, this isn't the case here.
> > 
> > Also move the dma mask assignemnts to probe() to keep all DMA related
> > settings together.
> 
> I assume the driver must already keep track of the real GPU platform 
> device in order to map registers, request interrupts, etc. correctly - 
> can't it also correctly use that device for DMA API calls and avoid the 
> need for these shenanigans altogether?
> 
Not without a bigger rework. There's still quite a bit of midlayer
issues in DRM, where dma-buf imports are dma-mapped and cached via the
virtual DRM device instead of the real GPU device. Also etnaviv is able
to coalesce multiple Vivante GPUs in a single system under one virtual
DRM device, which is used on i.MX6 where the 2D and 3D GPUs are
separate peripherals, but have the same DMA constraints.

Effectively we would need to handle N devices for the dma-mapping in a
lot of places instead of only dealing with the one virtual DRM device.
It would probably be the right thing to anyways, but it's not something
that can be changed short-term. I'm also not yet sure about the
performance implications, as we might run into some cache maintenance
bottlenecks if we dma synchronize buffers to multiple real device
instead of doing it a single time with the virtual DRM device. I know,
I know, this has a lot of assumptions baked in that could fall apart if
someone builds a SoC with multiple Vivante GPUs that have differing DMA
constraints, but up until now hardware designers have not been *that*
crazy, fortunately.

Regards,
Lucas

> FYI, IOMMU configuration is really supposed to *only* run at 
> add_device() time as above - the fact that it's currently hooked in to 
> be retriggered by of_dma_configure() on DT platforms actually turns out 
> to lead to various issues within the IOMMU API, and the plan to change 
> that is slowly climbing up my to-do list.
> 
> Robin.
> 
> > Signed-off-by: Michael Walle <michael@walle.cc>
> > ---
> >   drivers/gpu/drm/etnaviv/etnaviv_drv.c | 24 +++++++++++++++---------
> >   1 file changed, 15 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > index 2509b3e85709..ff6425f6ebad 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > @@ -589,6 +589,7 @@ static int compare_str(struct device *dev, void *data)
> >   static int etnaviv_pdev_probe(struct platform_device *pdev)
> >   {
> >   	struct device *dev = &pdev->dev;
> > +	struct device_node *first_node = NULL;
> >   	struct component_match *match = NULL;
> >   
> >   	if (!dev->platform_data) {
> > @@ -598,6 +599,9 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
> >   			if (!of_device_is_available(core_node))
> >   				continue;
> >   
> > +			if (!first_node)
> > +				first_node = core_node;
> > +
> >   			drm_of_component_match_add(&pdev->dev, &match,
> >   						   compare_of, core_node);
> >   		}
> > @@ -609,6 +613,17 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
> >   			component_match_add(dev, &match, compare_str, names[i]);
> >   	}
> >   
> > +	pdev->dev.coherent_dma_mask = DMA_BIT_MASK(40);
> > +	pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
> > +
> > +	/*
> > +	 * Apply the same DMA configuration to the virtual etnaviv
> > +	 * device as the GPU we found. This assumes that all Vivante
> > +	 * GPUs in the system share the same DMA constraints.
> > +	 */
> > +	if (first_node)
> > +		of_dma_configure(&pdev->dev, first_node, true);
> > +
> >   	return component_master_add_with_match(dev, &etnaviv_master_ops, match);
> >   }
> >   
> > @@ -659,15 +674,6 @@ static int __init etnaviv_init(void)
> >   			of_node_put(np);
> >   			goto unregister_platform_driver;
> >   		}
> > -		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(40);
> > -		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
> > -
> > -		/*
> > -		 * Apply the same DMA configuration to the virtual etnaviv
> > -		 * device as the GPU we found. This assumes that all Vivante
> > -		 * GPUs in the system share the same DMA constraints.
> > -		 */
> > -		of_dma_configure(&pdev->dev, np, true);
> >   
> >   		ret = platform_device_add(pdev);
> >   		if (ret) {
> > 


