Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D74C5F5234
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 12:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C99E10E053;
	Wed,  5 Oct 2022 10:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCEF10E053
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 10:06:26 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1og1IE-0005IR-FF; Wed, 05 Oct 2022 12:06:22 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1og1IB-0001eW-12; Wed, 05 Oct 2022 12:06:19 +0200
Date: Wed, 5 Oct 2022 12:06:18 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Dan Johansen <strit@manjaro.org>
Subject: Re: [PATCH v2 0/2] drm/rockchip: dw_hdmi: Add 4k@30 support
Message-ID: <20221005100618.GS12909@pengutronix.de>
References: <20220926080435.259617-1-s.hauer@pengutronix.de>
 <cf2285dc-d732-0c6d-83bc-022f23f29524@wolfvision.net>
 <2430a203-f8e7-7d78-3e9e-9e1d9c6826c9@manjaro.org>
 <20220928083755.GU986@pengutronix.de>
 <2f341aa8-b960-26d1-8073-737f828a8805@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f341aa8-b960-26d1-8073-737f828a8805@manjaro.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
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
Cc: Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 28, 2022 at 10:39:27AM +0200, Dan Johansen wrote:
> 
> Den 28.09.2022 kl. 10.37 skrev Sascha Hauer:
> > On Tue, Sep 27, 2022 at 07:53:54PM +0200, Dan Johansen wrote:
> > > Den 26.09.2022 kl. 12.30 skrev Michael Riesch:
> > > > Hi Sascha,
> > > > 
> > > > On 9/26/22 10:04, Sascha Hauer wrote:
> > > > > This series adds support for 4k@30 to the rockchip HDMI controller. This
> > > > > has been tested on a rk3568 rock3a board. It should be possible to add
> > > > > 4k@60 support the same way, but it doesn't work for me, so let's add
> > > > > 4k@30 as a first step.
> > > > > 														     Sascha
> > > > > 
> > > > > Changes since v1:
> > > > > - Allow non standard clock rates only on Synopsys phy as suggested by
> > > > >     Robin Murphy
> > > > > 
> > > > > Sascha Hauer (2):
> > > > >     drm/rockchip: dw_hdmi: relax mode_valid hook
> > > > >     drm/rockchip: dw_hdmi: Add support for 4k@30 resolution
> > > > > 
> > > > >    drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 34 ++++++++++++++++-----
> > > > >    1 file changed, 27 insertions(+), 7 deletions(-)
> > > > Thanks for the v2! On a RK3568 EVB1 with a HP 27f 4k monitor
> > > > 
> > > > Tested-by: Michael Riesch <michael.riesch@wolfvision.net>
> > > Sadly this still doesn't give my display out on my 2k monitor. Not even just
> > > 1080p picture like the old current implementation does.
> > By "like the old current implementation" you mean that this patchset
> > introduces a regression for you?
> Yes. What currently in the kernel at least shows as 1080p on my 2K monitor,
> while this patchset turns off the screen.

Which SoC are you testing this on? I assume RK3568, right? Which patch
introduces that regression, the first or the second one?

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
