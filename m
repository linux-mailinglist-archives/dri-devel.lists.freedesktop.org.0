Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04A8178BD8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0570E6EAEB;
	Wed,  4 Mar 2020 07:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id C80F96EA8E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 15:44:24 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id A551480EE;
 Tue,  3 Mar 2020 15:45:08 +0000 (UTC)
Date: Tue, 3 Mar 2020 07:44:20 -0800
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 3/3] bus: ti-sysc: Implement display subsystem reset quirk
Message-ID: <20200303154420.GS37466@atomide.com>
References: <20200224191230.30972-1-tony@atomide.com>
 <20200224191230.30972-4-tony@atomide.com>
 <7d4af3b5-5dd7-76b3-4d3f-4698bfde288c@ti.com>
 <20200303151349.GQ37466@atomide.com>
 <8cadd536-668a-4309-1878-7db2362717d2@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8cadd536-668a-4309-1878-7db2362717d2@ti.com>
X-Mailman-Approved-At: Wed, 04 Mar 2020 07:47:28 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
 Suman Anna <s-anna@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
 Keerthy <j-keerthy@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
 "Andrew F . Davis" <afd@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Faiz Abbas <faiz_abbas@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Tomi Valkeinen <tomi.valkeinen@ti.com> [200303 15:36]:
> On 03/03/2020 17:13, Tony Lindgren wrote:
> > Hi,
> > 
> > * Tomi Valkeinen <tomi.valkeinen@ti.com> [200303 06:03]:
> > > On 24/02/2020 21:12, Tony Lindgren wrote:
> > > > +	/* Remap the whole module range to be able to reset dispc outputs */
> > > > +	devm_iounmap(ddata->dev, ddata->module_va);
> > > > +	ddata->module_va = devm_ioremap(ddata->dev,
> > > > +					ddata->module_pa,
> > > > +					ddata->module_size);
> > > 
> > > Why is this needed? The range is not mapped when sysc_pre_reset_quirk_dss()
> > > is called? This will unmap and remap twice, as this function is called
> > > twice. And then left mapped.
> > 
> > That's because by default we only ioremap the module revision, sysconfig
> > and sysstatus register are and provide the rest as a range for the child
> > nodes.
> > 
> > In the dss quirk case we need to tinker with registers also in the dispc
> > range, and at the parent dss probe time dispc has not probed yet.
> > 
> > We may be able to eventually move the reset quirk to dispc, but then
> > it won't happen in the current setup until after dss top level driver
> > has loaded.
> > 
> > We leave the module range ioremapped as we still need to access
> > sysconfig related registers for PM runtime.
> 
> Ok, makes sense. I guess a minor improvement would be to unmap & remap once
> in sysc_pre_reset_quirk_dss before calling sysc_quirk_dispc.

Yeah well we'd have to sprawl the module specific quirk checks
there too then.

I thought about using the whole module range for modules with a large
IO range, but so far DSS is the only one needing a quirk hadling
covering also child modules like this.

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
