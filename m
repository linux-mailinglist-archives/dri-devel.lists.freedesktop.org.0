Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288462AD149
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3B2898BF;
	Tue, 10 Nov 2020 08:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F04C898BF
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 08:28:17 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1kcP0h-0002KR-T5; Tue, 10 Nov 2020 09:28:15 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1kcP0f-0001KH-Tn; Tue, 10 Nov 2020 09:28:13 +0100
Date: Tue, 10 Nov 2020 09:28:13 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 06/16] drm/exynos: shift register values to fields on
 write
Message-ID: <20201110082813.GC13669@pengutronix.de>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
 <20200911135413.3654800-7-m.tretter@pengutronix.de>
 <20201107223930.GE1052534@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201107223930.GE1052534@ravnborg.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:19:04 up 264 days, 15:49, 88 users,  load average: 0.18, 0.17,
 0.18
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
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
Cc: linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 narmstrong@baylibre.com, Adrian Ratiu <adrian.ratiu@collabora.com>,
 b.zolnierkie@samsung.com, sw0312.kim@samsung.com,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com, krzk@kernel.org,
 kernel@pengutronix.de, sylvester.nawrocki@gmail.com,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 07 Nov 2020 23:39:30 +0100, Sam Ravnborg wrote:
> On Fri, Sep 11, 2020 at 03:54:03PM +0200, Michael Tretter wrote:
> > The phy timings are already shifted to the field position. If the driver
> > is reused on multiple platforms, this exposes the field positions to the
> > platform code.
> > 
> > Store only the timing values in the platform data and shift the value to
> > the field when writing the fields to the registers.
> > 
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> 
> This and the following patch smells like the regmap functionality is
> partly open coded. regmaps supports defining different register layouts
> and select the correct layout at runtime.
> 
> See for example:
> https://www.collabora.com/news-and-blog/blog/2020/05/27/using-regmaps-to-make-linux-drivers-more-generic/
> or
> https://www.youtube.com/watch?v=0RPDGANArFc
> 
> Some parts is not a perfect fit - but using regmaps will make it better
> as a general and well-known solution is used.

I considered using regmaps, but there was something that didn't work out.
Unfortunately, I don't remember, what it actually was. Therefore, it is
probably best to use regmaps here.

Michael

> 
> @Adrian - see https://lore.kernel.org/dri-devel/20200911135413.3654800-1-m.tretter@pengutronix.de/T/#m8e211c8cce915168cf2b8c4eef1c7ec9b8447af8
> for the original patch.
> 
> 	Sam
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
