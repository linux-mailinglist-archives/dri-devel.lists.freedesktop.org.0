Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A2C614ECF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 17:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7AA10E076;
	Tue,  1 Nov 2022 16:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1EF10E076
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 16:06:52 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1optms-0000wb-Hg; Tue, 01 Nov 2022 17:06:50 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1optmr-0003Tm-0C; Tue, 01 Nov 2022 17:06:49 +0100
Date: Tue, 1 Nov 2022 17:06:48 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm: lcdif: Set and enable FIFO Panic threshold
Message-ID: <20221101160648.yhujgbay3nvm5pto@pengutronix.de>
References: <e15680d8-3790-4907-0efa-a597b70ed0d0@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e15680d8-3790-4907-0efa-a597b70ed0d0@denx.de>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
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
Cc: Peng Fan <peng.fan@nxp.com>, Liu Ying <victor.liu@nxp.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Martyn Welch <martyn.welch@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, "jian.li" <jian.li@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22-11-01, Marek Vasut wrote:
> On 11/1/22 15:04, Marco Felsch wrote:
> > Hi Marek, Liu,
> 
> Hi,
> 
> [...]
> 
> > > > > Also IMHO the threshold should be taken wisely to not enter panic
> > > > > mode
> > > > > to early to not block others from the bus e.g. the GPU.
> > > > 
> > > > As far as I understand the PANIC0_THRES, both thresholds are really
> > > > watermarks in the FIFO, 0=EMPTY, 1/3=LOW, 2/3=HIGH, 3/3=FULL. Under
> > > > normal conditions, the FIFO is filled above 1/3. When the FIFO fill
> > > > drops below LOW=1/3, the "PANIC" signal is asserted so the FIFO can
> > > > be
> > > > refilled faster. When the FIFO fill raises above HIGH=2/3, the
> > > > "PANIC"
> > > > signal is deasserted so the FIFO refills at normal rate again.
> > 
> > This matches exactly my picture of the hardware.
> > 
> > > > It seems to me the LOW=1/3 and HIGH=2/3 thresholds are the kind of
> > > > good
> > > > balance. The LOW=2/3 and HIGH=FULL=3/3 seems like it would keep the
> > > > "PANIC" signal asserted much longer, which could indeed block others
> > > > from the bus.
> > 
> > Also I understood the thresholds in such a way, that the FIFO watermark
> > must be higher but there is no place left when it is set to 3/3. In such
> > case this means that the PANIC will never left once it was entered.
> 
> I think this part is wrong.
> 
> Consider that the FIFO fill drops below 2/3 so PANIC signal asserts. 

? I thought the PANIC is triggered if the FIFO drops below the 1/3
threshold and is active till the 2/3 threshold.

> After a bit of time, the FIFO fill reaches full 3/3 (maybe during
> blanking period, where the data can be read in quickly without being
> scanned out again), and the PANIC signal de-asserts.
> 
> So the LCDIF won't be in constant PANIC asserted, but it will be there for
> quite a bit longer.
> 
> > > > It also seems to me that tuning these thresholds might be related to
> > > > some special use-case of the SoC, and it is most likely not just the
> > > > LCDIF thresholds which have been adjusted in such case, I would
> > > > expect
> > > > the NOC and GPV NIC priorities to be adjusted at that point too.
> > 
> > As far as I understood, the PANIC signal triggers the NOC to use the
> > PANIC signal priorities instead of the normal ones. I found a patch
> > laying in our downstream [1] repo which configures the threshold. This
> > raises the question which PANIC prio do you use? Do you have a patch for
> > this? If I remember correctly some TF-A's like the NXP downstream one
> > configure this but the upstream TF-A don't. Which TF-A do you use?
> 
> Upstream 2.6 or 2.7 , so this tuning does not apply.

So your panic priority is what?

> > > > So unless there are further details for that use-case which justify
> > > > making this somehow configurable, then maybe we should just stick to
> > > > 1/3 and 2/3 for now. And once there is a valid use-case which does
> > > > justify making this configurable, then we can add the DT properties
> > > > and all.
> > > > 
> > > > What do you think ?
> > > 
> > > No strong opinion from me on using LOW=1/3 and HIGH=2/3 thresholds for
> > > now if they satisfy all current users of the upstream kernel.  Tuning
> > > them in a certain way will be indeed needed once an usecase comes along
> > > and still suffers from the FIFO underflows with those thresholds.
> > 
> > I think that 1/3 and 2/3 should be fine for now too.
> 
> All right, lemme re-test this, send V2, and then we can go from there.

Okay :)

> btw. can you resend that [PATCH] drm: lcdif: change burst size to 256B with
> Fixes tag , so it can trickle into stable releases ?

Shure I will resend it with the tag added.

Regards,
  Marco
