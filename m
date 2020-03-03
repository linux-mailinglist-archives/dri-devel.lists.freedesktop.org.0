Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B619178BC2
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9F36EAD6;
	Wed,  4 Mar 2020 07:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E6956EA8C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 15:36:27 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 43BEA80EE;
 Tue,  3 Mar 2020 15:37:11 +0000 (UTC)
Date: Tue, 3 Mar 2020 07:36:22 -0800
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 1/3] drm/omap: Prepare DSS for probing without legacy
 platform data
Message-ID: <20200303153622.GR37466@atomide.com>
References: <20200224191230.30972-1-tony@atomide.com>
 <20200224191230.30972-2-tony@atomide.com>
 <d5ce999e-3b26-334e-fc62-adee4753a3ed@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d5ce999e-3b26-334e-fc62-adee4753a3ed@ti.com>
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
 Suman Anna <s-anna@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Gerlach <d-gerlach@ti.com>, Keerthy <j-keerthy@ti.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Andrew F . Davis" <afd@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Faiz Abbas <faiz_abbas@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Tomi Valkeinen <tomi.valkeinen@ti.com> [200303 09:19]:
> On 24/02/2020 21:12, Tony Lindgren wrote:
> > In order to probe display subsystem (DSS) components with ti-sysc
> > interconnect target module without legacy platform data and using
> > devicetree, we need to update dss probing a bit.
> > 
> > In the device tree, we will be defining the data also for the interconnect
> > target modules as DSS really is a private interconnect. There is some
> > information about that in 4460 TRM in "Figure 10-3. DSS Integration" for
> > example where it mentions "32-bit interconnect (SLX)".
> > 
> > The changes we need to make are:
> > 
> > 1. Parse also device tree subnodes for the compatible property fixup
> > 
> > 2. Update the component code to consider device tree subnodes
> > 
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: Jyri Sarha <jsarha@ti.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> > 
> > This is needed for dropping DSS platform data that I'll be posting
> > seprately. If this looks OK, can you guys please test and ack?
> > 
> > ---
> >   drivers/gpu/drm/omapdrm/dss/dss.c             | 25 ++++++++++++++++---
> >   .../gpu/drm/omapdrm/dss/omapdss-boot-init.c   | 25 +++++++++++++------
> >   2 files changed, 39 insertions(+), 11 deletions(-)
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 
> This doesn't conflict with drm-next (with Laurent's recent patches), so it
> should be fine for you to have this in your branch.

OK thank you. I've pushed out omap-for-v5.7/dss-probe which has just
this commit against v5.6-rc1 [0][1]. Let's consider commit cef766300353
("drm/omap: Prepare DSS for probing without legacy platform data")
immutable so we can both merge it in as needed.

I have not added any tag yet as it seems that we could add also
apply Sebastian's few preparatory dts changes to this branch when
ready.

> And not a biggie, but I wonder if the changes to these two files should be
> in separate patches, due to omapdss-boot-init going away. Well, probably
> doesn't matter.

Hmm yeah good reason to put every change into a seprate patch
for future. I really did not expect this to conflict with anything
after years of no changes :)

Regards,

Tony

[0] git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git omap-for-v5.7/dss-probe
[1] https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git/commit/?h=omap-for-v5.7/dss-probe&id=cef766300353613aa273791f70b3125d1f0420ae
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
