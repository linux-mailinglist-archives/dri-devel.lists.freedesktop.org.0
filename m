Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C77823AFDEA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 09:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005F36E3DB;
	Tue, 22 Jun 2021 07:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69E76E3DB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 07:30:56 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lvas3-00041D-Cs; Tue, 22 Jun 2021 09:30:55 +0200
Message-ID: <c0bafcc7d583e2270d8417d07faf2970ae74df63.camel@pengutronix.de>
Subject: Re: [PATCH] drm: mxsfb: Increase number of outstanding requests on
 V4 and newer HW
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Tue, 22 Jun 2021 09:30:54 +0200
In-Reply-To: <30887d0b-9d32-1d91-542f-12f3312cb854@denx.de>
References: <20210620224759.189351-1-marex@denx.de>
 <71e8d748b8dff1ecbf9e8905213a5b15e1019c4c.camel@pengutronix.de>
 <30887d0b-9d32-1d91-542f-12f3312cb854@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
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
Cc: Daniel Abrecht <public@danielabrecht.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>, ch@denx.de,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, dem 21.06.2021 um 18:45 +0200 schrieb Marek Vasut:
> On 6/21/21 2:08 PM, Lucas Stach wrote:
> > Am Montag, dem 21.06.2021 um 00:47 +0200 schrieb Marek Vasut:
> > > In case the DRAM is under high load, the MXSFB FIFO might underflow
> > > and that causes visible artifacts. This could be triggered on i.MX8MM
> > > using e.g. "$ memtester 128M" on a device with 1920x1080 panel. The
> > > first "Stuck Address" test of the memtester will completely corrupt
> > > the image on the panel and leave the MXSFB FIFO in odd state.
> > > 
> > > To avoid this underflow, increase number of outstanding requests to
> > > DRAM from 2 to 16, which is the maximum. This mitigates the issue
> > > and it can no longer be triggered.
> > > 
> > I see the obvious benefit of this change, but I'm not sure if enabling
> > this on older SoCs is without any drawbacks. The newer SoCs have a good
> > transaction scheduling on the NOC (i.MX8M) or at least a somewhat okay
> > one in the DRAM controller (i.MX6). I'm not so sure about the older
> > SoCs, where I could imagine too many outstanding transactions to delay
> > memory traffic for other masters on the SoC.
> > 
> > You don't happen to have any experience with this on the older SoCs, do
> > you?
> 
> The only older SoC which would be affected by this, except for the ones 
> you already listed, is MX28. And the MX28 has rather decent DRAM 
> controller, so I wouldn't expect problems there either.
> 
> You can look at it the other way around too however, if the DRAM gets 
> saturated, the LCDIF controller suffers from FIFO underflows and that 
> completely messes up the FIFO state, at which point the image on the 
> display is distorted, shifted, wrapped around, or any other such odd 
> effect. The underflow auto-recovery bit helps with it, but with this 
> patch in place you are unlikely to run into those effects at all.

Yea, I just wanted to have this thought considered. If you think the
probability of introducing regressions on MX28 is low, that's fine with
me. I guess MX28 systems likely don't have a big enough screen attached
to drown the memory controller in read requests.

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>


