Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD694B5866
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 18:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A47A10E26A;
	Mon, 14 Feb 2022 17:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CF110E26A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 17:24:06 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nJf51-0008Qe-HH; Mon, 14 Feb 2022 18:24:03 +0100
Message-ID: <65a7fdadc60d0c76138a8979a0c6fe1d6cdeb85d.camel@pengutronix.de>
Subject: Re: [PATCH] gpu: ipu-v3: Fix dev_dbg frequency output
From: Lucas Stach <l.stach@pengutronix.de>
To: "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>
Date: Mon, 14 Feb 2022 18:24:01 +0100
In-Reply-To: <PAXPR10MB540528C7049118472B4F190EAD339@PAXPR10MB5405.EURPRD10.PROD.OUTLOOK.COM>
References: <20220207151411.5009-1-mark.jonas@de.bosch.com>
 <PAXPR10MB540528C7049118472B4F190EAD339@PAXPR10MB5405.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
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
Cc: "RUAN Tingquan \(BT-FIR/ENG1-Zhu\)" <Tingquan.Ruan@cn.bosch.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, dem 14.02.2022 um 16:44 +0000 schrieb Jonas Mark (BT-FIR/ENG1-Grb):
> Hi,
> 
> > From: Leo Ruan <tingquan.ruan@cn.bosch.com>
> > 
> > This commit corrects the printing of the IPU clock error percentage if it is
> > between -0.1% to -0.9%. For example, if the pixel clock requested is 27.2
> > MHz but only 27.0 MHz can be achieved the deviation is -0.8%.
> > But the fixed point math had a flaw and calculated error of 0.2%.
> > 
> > Before:
> >   Clocks: IPU 270000000Hz DI 24716667Hz Needed 27200000Hz
> >   IPU clock can give 27000000 with divider 10, error 0.2%
> >   Want 27200000Hz IPU 270000000Hz DI 24716667Hz using IPU,
> > 27000000Hz
> > 
> > After:
> >   Clocks: IPU 270000000Hz DI 24716667Hz Needed 27200000Hz
> >   IPU clock can give 27000000 with divider 10, error -0.8%
> >   Want 27200000Hz IPU 270000000Hz DI 24716667Hz using IPU,
> > 27000000Hz
> > 
> > Signed-off-by: Leo Ruan <tingquan.ruan@cn.bosch.com>
> > Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> > ---
> >  drivers/gpu/ipu-v3/ipu-di.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/ipu-v3/ipu-di.c b/drivers/gpu/ipu-v3/ipu-di.c index
> > b4a31d506fcc..74eca68891ad 100644
> > --- a/drivers/gpu/ipu-v3/ipu-di.c
> > +++ b/drivers/gpu/ipu-v3/ipu-di.c
> > @@ -451,8 +451,9 @@ static void ipu_di_config_clock(struct ipu_di *di,
> > 
> >  		error = rate / (sig->mode.pixelclock / 1000);
> > 
> > -		dev_dbg(di->ipu->dev, "  IPU clock can give %lu with divider
> > %u, error %d.%u%%\n",
> > -			rate, div, (signed)(error - 1000) / 10, error % 10);
> > +		dev_dbg(di->ipu->dev, "  IPU clock can give %lu with divider
> > %u, error %c%d.%d%%\n",
> > +			rate, div, error < 1000 ? '-' : '+',
> > +			abs(error - 1000) / 10, abs(error - 1000) % 10);
> > 
> >  		/* Allow a 1% error */
> >  		if (error < 1010 && error >= 990) {
> 
> Is there anything I can do to help getting this patch mainline?

Philipp is still on vacation, but will be back in a few days. I guess
he will take a look at those patches then.

Regards,
Lucas

