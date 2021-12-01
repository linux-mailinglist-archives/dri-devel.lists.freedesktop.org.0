Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F849464EF3
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 14:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954E66FDD8;
	Wed,  1 Dec 2021 13:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E414A6FDC9
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 13:41:36 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1msPrY-0001Ro-IG; Wed, 01 Dec 2021 14:41:32 +0100
Message-ID: <d0266804325c6dd35aab5b82a552506892c546d1.camel@pengutronix.de>
Subject: Re: [PATCH v2 3/3] drm/etnaviv: use a 32 bit mask as coherent DMA mask
From: Lucas Stach <l.stach@pengutronix.de>
To: Robin Murphy <robin.murphy@arm.com>, Michael Walle <michael@walle.cc>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Wed, 01 Dec 2021 14:41:30 +0100
In-Reply-To: <25915a21-57f2-adbd-cfc2-1a2bc2a1a5e7@arm.com>
References: <20210907164945.2309815-1-michael@walle.cc>
 <20210907164945.2309815-4-michael@walle.cc>
 <25915a21-57f2-adbd-cfc2-1a2bc2a1a5e7@arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
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
Cc: David Airlie <airlied@linux.ie>, Marek Vasut <marek.vasut@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "Lukas F . Hartmann" <lukas@mntre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robin,

Am Mittwoch, dem 01.12.2021 um 12:50 +0000 schrieb Robin Murphy:
> Sorry I missed this earlier...
> 
> On 2021-09-07 17:49, Michael Walle wrote:
> > The STLB and the first command buffer (which is used to set up the TLBs)
> > has a 32 bit size restriction in hardware. There seems to be no way to
> > specify addresses larger than 32 bit. Keep it simple and restict the
> > addresses to the lower 4 GiB range for all coherent DMA memory
> > allocations.
> > 
> > Please note, that platform_device_alloc() will initialize dev->dma_mask
> > to point to pdev->platform_dma_mask, thus dma_set_mask() will work as
> > expected.
> > 
> > While at it, move the dma_mask setup code to the of_dma_configure() to
> > keep all the DMA setup code next to each other.
> > 
> > Suggested-by: Lucas Stach <l.stach@pengutronix.de>
> > Signed-off-by: Michael Walle <michael@walle.cc>
> > ---
> >   drivers/gpu/drm/etnaviv/etnaviv_drv.c | 20 ++++++++++++++++++--
> >   1 file changed, 18 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > index 54eb653ca295..0b756ecb1bc2 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > @@ -613,6 +613,24 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
> >   			component_match_add(dev, &match, compare_str, names[i]);
> >   	}
> >   
> > +	/*
> > +	 * PTA and MTLB can have 40 bit base addresses, but
> > +	 * unfortunately, an entry in the MTLB can only point to a
> > +	 * 32 bit base address of a STLB. Moreover, to initialize the
> > +	 * MMU we need a command buffer with a 32 bit address because
> > +	 * without an MMU there is only an indentity mapping between
> > +	 * the internal 32 bit addresses and the bus addresses.
> > +	 *
> > +	 * To make things easy, we set the dma_coherent_mask to 32
> > +	 * bit to make sure we are allocating the command buffers and
> > +	 * TLBs in the lower 4 GiB address space.
> > +	 */
> > +	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(40)) ||
> > +	    dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32))) {
> 
> Since AFAICS you're not changing the default dma_mask pointer to point 
> to some storage other than the coherent mask, the dma_set_mask() call 
> effectively does nothing and both masks will end up reading back as 32 bits.
> 
From what I can see the dma_mask has allocated storage in the platform
device and does not point to the coherent dma mask, see
setup_pdev_dma_masks().

Regards,
Lucas

> Robin.
> 
> > +		dev_dbg(&pdev->dev, "No suitable DMA available\n");
> > +		return -ENODEV;
> > +	}
> > +
> >   	/*
> >   	 * Apply the same DMA configuration to the virtual etnaviv
> >   	 * device as the GPU we found. This assumes that all Vivante
> > @@ -671,8 +689,6 @@ static int __init etnaviv_init(void)
> >   			of_node_put(np);
> >   			goto unregister_platform_driver;
> >   		}
> > -		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(40);
> > -		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
> >   
> >   		ret = platform_device_add(pdev);
> >   		if (ret) {
> > 


