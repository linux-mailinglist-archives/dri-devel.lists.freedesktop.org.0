Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B984178BD7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F006EADB;
	Wed,  4 Mar 2020 07:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id D0866895F5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 15:49:57 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 7847080EE;
 Tue,  3 Mar 2020 15:50:41 +0000 (UTC)
Date: Tue, 3 Mar 2020 07:49:53 -0800
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 3/3] bus: ti-sysc: Implement display subsystem reset quirk
Message-ID: <20200303154953.GT37466@atomide.com>
References: <20200224191230.30972-1-tony@atomide.com>
 <20200224191230.30972-4-tony@atomide.com>
 <7d4af3b5-5dd7-76b3-4d3f-4698bfde288c@ti.com>
 <20200303151349.GQ37466@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303151349.GQ37466@atomide.com>
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

* Tony Lindgren <tony@atomide.com> [200303 15:14]:
> * Tomi Valkeinen <tomi.valkeinen@ti.com> [200303 06:03]:
> > On 24/02/2020 21:12, Tony Lindgren wrote:
> > > +	if (sysc_soc->soc == SOC_3430) {
> > > +		/* Clear DSS_SDI_CONTROL */
> > > +		sysc_write(ddata, dispc_offset + 0x44, 0);
> > > +
> > > +		/* Clear DSS_PLL_CONTROL */
> > > +		sysc_write(ddata, dispc_offset + 0x48, 0);
> > 
> > These are not dispc registers, but dss registers.
> 
> Ouch. Thanks for catching this, will include in the fix.
> 
> > > +	}
> > > +
> > > +	/* Clear DSS_CONTROL to switch DSS clock sources to PRCM if not */
> > > +	sysc_write(ddata, dispc_offset + 0x40, 0);
> > 
> > Same here.

Below is a fix using dispc offset for dss registers.

Regards,

Tony

8< ----------------------
From tony Mon Sep 17 00:00:00 2001
From: Tony Lindgren <tony@atomide.com>
Date: Tue, 3 Mar 2020 07:17:43 -0800
Subject: [PATCH] bus: ti-sysc: Fix wrong offset for display subsystem
 reset quirk

Commit 7324a7a0d5e2 ("bus: ti-sysc: Implement display subsystem reset
quirk") added support for DSS reset, but is using dispc offset also for
DSS also registers as reported by Tomi Valkeinen <tomi.valkeinen@ti.com>.
Also, we're not using dispc_offset for dispc IRQSTATUS register so let's
fix that too.

Fixes: 7324a7a0d5e2 ("bus: ti-sysc: Implement display subsystem reset quirk")
Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1566,7 +1566,7 @@ static void sysc_pre_reset_quirk_dss(struct sysc *ddata)
 		return;
 
 	/* Clear IRQSTATUS */
-	sysc_write(ddata, 0x1000 + 0x18, irq_mask);
+	sysc_write(ddata, dispc_offset + 0x18, irq_mask);
 
 	/* Disable outputs */
 	val = sysc_quirk_dispc(ddata, dispc_offset, true);
@@ -1580,14 +1580,14 @@ static void sysc_pre_reset_quirk_dss(struct sysc *ddata)
 
 	if (sysc_soc->soc == SOC_3430) {
 		/* Clear DSS_SDI_CONTROL */
-		sysc_write(ddata, dispc_offset + 0x44, 0);
+		sysc_write(ddata, 0x44, 0);
 
 		/* Clear DSS_PLL_CONTROL */
-		sysc_write(ddata, dispc_offset + 0x48, 0);
+		sysc_write(ddata, 0x48, 0);
 	}
 
 	/* Clear DSS_CONTROL to switch DSS clock sources to PRCM if not */
-	sysc_write(ddata, dispc_offset + 0x40, 0);
+	sysc_write(ddata, 0x40, 0);
 }
 
 /* 1-wire needs module's internal clocks enabled for reset */
-- 
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
