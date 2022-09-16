Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2151E5BA7B9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 10:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7196010ECD4;
	Fri, 16 Sep 2022 08:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB2C10ECCD
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 08:03:35 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oZ6Jw-0007mn-84; Fri, 16 Sep 2022 10:03:32 +0200
Message-ID: <22d3a4d54fbc0a527315f25c0a97441f3102c0bd.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: don't truncate physical page address
From: Lucas Stach <l.stach@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, etnaviv@lists.freedesktop.org
Date: Fri, 16 Sep 2022 10:03:31 +0200
In-Reply-To: <b3377fc111a704e8666cd6a71e2762dff63a6b75.camel@pengutronix.de>
References: <20220915141941.3408991-1-l.stach@pengutronix.de>
 <b3377fc111a704e8666cd6a71e2762dff63a6b75.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

Am Donnerstag, dem 15.09.2022 um 16:40 +0200 schrieb Philipp Zabel:
> Hi Lucas,
> 
> On Do, 2022-09-15 at 16:19 +0200, Lucas Stach wrote:
> > While the interface for the MMU mapping takes phys_addr_t to hold a
> > full 64bit address when necessary and MMUv2 is able to map physical
> > addresses with up to 40bit, etnaviv_iommu_map() truncates the address
> > to 32bits. Fix this by using the correct type.
> > 
> > Fixes: 931e97f3afd8 ("drm/etnaviv: mmuv2: support 40 bit phys address")
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> > index dc1aa738c4f1..2ff80d5ccf07 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> > @@ -80,7 +80,7 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
> >  		return -EINVAL;
> >  
> > 
> >  	for_each_sgtable_dma_sg(sgt, sg, i) {
> > -		u32 pa = sg_dma_address(sg) - sg->offset;
> > +		phys_addr_t pa = sg_dma_address(sg) - sg->offset;
> >  		size_t bytes = sg_dma_len(sg) + sg->offset;
> >  
> > 
> >  		VERB("map[%d]: %08x %08x(%zx)", i, iova, pa, bytes);
>                                     ^^^^                 ^^
> Use %pap, &pa here?
> 
Yep, I actually thought about this when writing the patch, but then got
distracted and forgot to add this change. :/

Regards,
Lucas


