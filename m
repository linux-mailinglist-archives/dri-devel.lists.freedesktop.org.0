Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DECE2AD942
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 15:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CE289263;
	Tue, 10 Nov 2020 14:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BC089263
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 14:50:21 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AAEoGtV062617;
 Tue, 10 Nov 2020 08:50:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605019816;
 bh=cU/NAQHlLr0yoHwLMJiGAsbBbcJpxDvROg3ZcuEmhRM=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=rdIVjRVzUjlUBfK/XFsYu2VESzF+JATxEe5c/h2cPMlJ06oUZ+e101jJllrWrbdNY
 Is3owjKMjuV+CPaybRb85dRYayk1/W2fO8lhfXqXx53MIaC/ZAgyxnWz1WSoSoNOck
 cq8pv80KSK/7HePD6DuoeIKMiwCgxTHxBEnWNA4s=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AAEoGV2105380
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 08:50:16 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 10
 Nov 2020 08:50:16 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 10 Nov 2020 08:50:16 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AAEoF3a094431;
 Tue, 10 Nov 2020 08:50:16 -0600
Date: Tue, 10 Nov 2020 20:20:14 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: Swapnil Kashinath Jakhade <sjakhade@cadence.com>
Subject: Re: [PATCH v2 6/6] drm/bridge: cdns-mhdp8546: Fix the interrupt
 enable/disable
Message-ID: <20201110145014.en5xrj6bmcuzgpn5@NiksLab>
References: <20201109170601.21557-1-nikhil.nd@ti.com>
 <20201109170601.21557-7-nikhil.nd@ti.com>
 <1e434bb5-c027-792a-0c4d-c3cf057a0ec6@ti.com>
 <20201110102723.mgtrq5gznvvbpop2@NiksLab>
 <9d23f838-a9bc-ba5d-adfe-9b3bfc26c223@ti.com>
 <20201110135315.53ehiqmwunmwzhod@NiksLab>
 <DM6PR07MB61546E25F8FFFC4EF640962EC5E90@DM6PR07MB6154.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM6PR07MB61546E25F8FFFC4EF640962EC5E90@DM6PR07MB6154.namprd07.prod.outlook.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yuti Suresh Amonkar <yamonkar@cadence.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14:32-20201110, Swapnil Jakhade wrote:
> 
> 
> > -----Original Message-----
> > From: Nikhil Devshatwar <nikhil.nd@ti.com>
> > Sent: Tuesday, November 10, 2020 7:23 PM
> > To: Tomi Valkeinen <tomi.valkeinen@ti.com>; Swapnil Kashinath Jakhade
> > <sjakhade@cadence.com>; Yuti Suresh Amonkar <yamonkar@cadence.com>
> > Cc: dri-devel@lists.freedesktop.org; Swapnil Kashinath Jakhade
> > <sjakhade@cadence.com>; Sekhar Nori <nsekhar@ti.com>; Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com>; Yuti Suresh Amonkar
> > <yamonkar@cadence.com>
> > Subject: Re: [PATCH v2 6/6] drm/bridge: cdns-mhdp8546: Fix the interrupt
> > enable/disable
> > 
> > EXTERNAL MAIL
> > 
> > 
> > On 14:27-20201110, Tomi Valkeinen wrote:
> > > On 10/11/2020 12:27, Nikhil Devshatwar wrote:
> > > > On 11:21-20201110, Tomi Valkeinen wrote:
> > > >> On 09/11/2020 19:06, Nikhil Devshatwar wrote:
> > > >>> When removing the tidss driver, there is a warning reported by
> > > >>> kernel about an unhandled interrupt for mhdp driver.
> > > >>>
> > > >>> [   43.238895] irq 31: nobody cared (try booting with the "irqpoll"
> > option)
> > > >>> ... [snipped backtrace]
> > > >>> [   43.330735] handlers:
> > > >>> [   43.333020] [<000000005367c4f9>] irq_default_primary_handler
> > threaded [<000000007e02b601>]
> > > >>> cdns_mhdp_irq_handler [cdns_mhdp8546]
> > > >>> [   43.344607] Disabling IRQ #31
> > > >>>
> > > >>> This happens because as part of cdns_mhdp_bridge_hpd_disable,
> > > >>> driver tries to disable the interrupts. While disabling the
> > > >>> SW_EVENT interrupts, it accidentally enables the MBOX interrupts,
> > > >>> which are not handled by the driver.
> > > >>>
> > > >>> Fix this with a read-modify-write to update only required bits.
> > > >>> Do the same for enabling interrupts as well.
> > > >>>
> > > >>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > > >>> ---
> > > >>>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 7 +++++--
> > > >>>  1 file changed, 5 insertions(+), 2 deletions(-)
> > > >>>
> > > >>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > > >>> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > > >>> index 2cd809eed827..6beccd2a408e 100644
> > > >>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > > >>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > > >>> @@ -2146,7 +2146,8 @@ static void
> > > >>> cdns_mhdp_bridge_hpd_enable(struct drm_bridge *bridge)
> > > >>>
> > > >>>  	/* Enable SW event interrupts */
> > > >>>  	if (mhdp->bridge_attached)
> > > >>> -		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
> > > >>> +		writel(readl(mhdp->regs + CDNS_APB_INT_MASK) &
> > > >>> +		       ~CDNS_APB_INT_MASK_SW_EVENT_INT,
> > > >>>  		       mhdp->regs + CDNS_APB_INT_MASK);  }
> > > >>>
> > > >>> @@ -2154,7 +2155,9 @@ static void
> > > >>> cdns_mhdp_bridge_hpd_disable(struct drm_bridge *bridge)  {
> > > >>>  	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
> > > >>>
> > > >>> -	writel(CDNS_APB_INT_MASK_SW_EVENT_INT, mhdp->regs +
> > CDNS_APB_INT_MASK);
> > > >>> +	writel(readl(mhdp->regs + CDNS_APB_INT_MASK) |
> > > >>> +	       CDNS_APB_INT_MASK_SW_EVENT_INT,
> > > >>> +	       mhdp->regs + CDNS_APB_INT_MASK);
> > > >>>  }
> > > >>>
> > > >>>  static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
> > > >>
> > > >> Good catch. I wonder why we need the above functions... We already
> > > >> enable and disable the interrupts when attaching/detaching the
> > > >> driver. And I think we want to get the interrupt even if we won't report
> > HPD (but I think we always do report it), as we need the interrupts to track
> > the link status.
> > > >>
> > > >
> > > > I read from the code that there is TODO for handling the mailbox
> > > > interrupts in the driver. Once that is supported, you will be able
> > > > to explictily enable/disable interrupts for SW_EVENTS (like hotplug)
> > > > as well as mailbox events. This enabling specific bits in the
> > > > interrupt status.
> > >
> > > But SW_EVENTS is not the same as HPD, at least in theory. If we
> > > disable SW_EVENT_INT in hpd_disable(), we lose all SW_EVENT interrupts.
> > 
> > I am not sure, what exactly is covered in the SW events apart from the
> > hotplug.
> > 
> > Swapnil, Yuti, Please fill in..
> 
> hpd_enable/hpd_disable callbacks were implemented as a part of supporting
> DRM_BRIDGE_OP_HPD bridge operation. The existing implementation could
> work with current features set supported by MHDP driver. But Tomi's point is
> valid, as there are some HDCP interrupts which are part of SW_EVENT interrupts
> and this might not be the control to just enable/disable HPD.

So do you think something should change now?
I assume that you will modify this part when supporting HDCP.
Also, please provide your ack if this patch is the right fix.


Nikhil D
> 
> Swapnil
> 
> > 
> > Nikhil D
> > >
> > >  Tomi
> > >
> > > --
> > > Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> > > Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
