Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7613614FFD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 18:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0046C10E0D4;
	Tue,  1 Nov 2022 17:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB33E10E0D4
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 17:06:55 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1opuj0-0008L6-7N; Tue, 01 Nov 2022 18:06:54 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1opuix-0006sQ-Tg; Tue, 01 Nov 2022 18:06:51 +0100
Date: Tue, 1 Nov 2022 18:06:51 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm: lcdif: Set and enable FIFO Panic threshold
Message-ID: <20221101170651.kuio52ocksumpeqz@pengutronix.de>
References: <e15680d8-3790-4907-0efa-a597b70ed0d0@denx.de>
 <20221101160648.yhujgbay3nvm5pto@pengutronix.de>
 <adfa959a-cf94-d815-a5b2-9de157f0a6ca@denx.de>
 <20221101165128.s7d3eqtjd6wbbhc5@pengutronix.de>
 <85973f6d-2f58-8893-716f-633f6d34f016@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85973f6d-2f58-8893-716f-633f6d34f016@denx.de>
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
> On 11/1/22 17:51, Marco Felsch wrote:
> > On 22-11-01, Marek Vasut wrote:
> > > On 11/1/22 17:06, Marco Felsch wrote:
> > > 
> > > Hi,
> > > 
> > > > > > Also I understood the thresholds in such a way, that the FIFO watermark
> > > > > > must be higher but there is no place left when it is set to 3/3. In such
> > > > > > case this means that the PANIC will never left once it was entered.
> > > > > 
> > > > > I think this part is wrong.
> > > > > 
> > > > > Consider that the FIFO fill drops below 2/3 so PANIC signal asserts.
> > > > 
> > > > ? I thought the PANIC is triggered if the FIFO drops below the 1/3
> > > > threshold and is active till the 2/3 threshold.
> > > 
> > > Yes, although I think the ASSERT/DEASSERT are one-way switches.
> > > 
> > > > > After a bit of time, the FIFO fill reaches full 3/3 (maybe during
> > > > > blanking period, where the data can be read in quickly without being
> > > > > scanned out again), and the PANIC signal de-asserts.
> > > > > 
> > > > > So the LCDIF won't be in constant PANIC asserted, but it will be there for
> > > > > quite a bit longer.
> > > > > 
> > > > > > > > It also seems to me that tuning these thresholds might be related to
> > > > > > > > some special use-case of the SoC, and it is most likely not just the
> > > > > > > > LCDIF thresholds which have been adjusted in such case, I would
> > > > > > > > expect
> > > > > > > > the NOC and GPV NIC priorities to be adjusted at that point too.
> > > > > > 
> > > > > > As far as I understood, the PANIC signal triggers the NOC to use the
> > > > > > PANIC signal priorities instead of the normal ones. I found a patch
> > > > > > laying in our downstream [1] repo which configures the threshold. This
> > > > > > raises the question which PANIC prio do you use? Do you have a patch for
> > > > > > this? If I remember correctly some TF-A's like the NXP downstream one
> > > > > > configure this but the upstream TF-A don't. Which TF-A do you use?
> > > > > 
> > > > > Upstream 2.6 or 2.7 , so this tuning does not apply.
> > > > 
> > > > So your panic priority is what?
> > > 
> > > If you tell me which register (physical address) to read, I will do that on
> > > this board right now.
> > 
> > According our patch it is:
> > 
> > #define HDMI_TX_CONTROL0       0x200
> > #define HDMI_LCDIF_NOC_HURRY_PRIO_MASK GENMASK(14, 12)
> > #define HDMI_LCDIF_NOC_HURRY_PRIO(p)   (((p) << 12) & HDMI_LCDIF_NOC_HURRY_PRIO_MASK)
> > 
> > and we set it within imx8mp_hdmi_blk_ctrl_power_on() by:
> > 
> > regmap_set_bits(bc->regmap, HDMI_TX_CONTROL0,
> >                  HDMI_LCDIF_NOC_HURRY_PRIO(7));
> > 
> > imx8mp_hdmi_blk_ctrl_power_off():
> > 
> > regmap_clear_bits(bc->regmap, HDMI_TX_CONTROL0,
> >                  HDMI_LCDIF_NOC_HURRY_PRIO(7));
> 
> Hmmm, bc->regmap does not exist in either upstream or downstream ATF
> versions per git grep, maybe you can give me the exact physical address of
> the register you would like me to read?

Arg.. sorry if I confused you. This is the code we are using within
Linux. We don't wanna use the TF-A to configure these bits.

Regards,
  Marco
