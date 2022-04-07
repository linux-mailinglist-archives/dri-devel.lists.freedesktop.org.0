Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A88C94F7861
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 09:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E13E10E548;
	Thu,  7 Apr 2022 07:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF76410E548
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 07:57:23 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ncN17-0002sx-VQ; Thu, 07 Apr 2022 09:57:22 +0200
Message-ID: <2d0493d54f629608f014f6ffed4428fccde7a6a5.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/7] drm: mxsfb: Simplify LCDIF clock handling
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Thu, 07 Apr 2022 09:57:19 +0200
In-Reply-To: <893aa689-d6f3-234f-693d-d31872697d92@denx.de>
References: <20220311170601.50995-1-marex@denx.de>
 <fe732f785a4c58f6225f72f5c420d4abc611553c.camel@pengutronix.de>
 <893aa689-d6f3-234f-693d-d31872697d92@denx.de>
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, dem 06.04.2022 um 23:45 +0200 schrieb Marek Vasut:
> On 4/6/22 21:32, Lucas Stach wrote:
> > Hi Marek,
> 
> Hi,
> 
> > Am Freitag, dem 11.03.2022 um 18:05 +0100 schrieb Marek Vasut:
> > > The current clock handling in the LCDIF driver is a convoluted mess.
> > 
> > Here we agree...
> > 
> > > Implement runtime PM ops which turn the clock ON and OFF and let the
> > > pm_runtime_get_sync()/pm_runtime_put_sync() calls in .atomic_enable
> > > and .atomic_disable callbacks turn the clock ON and OFF at the right
> > > time.
> > > 
> > > This requires slight reordering in mxsfb_crtc_atomic_enable() and
> > > mxsfb_crtc_atomic_disable(), since all the register accesses must
> > > happen only with clock enabled and clock frequency configuration
> > > must happen with clock disabled.
> > > 
> > ... on that one I don't. Please don't move the pixel clock into the RPM
> > calls. We have a very well defined point between atomic enable/disable
> > where the pixel clock is actually needed. All the other configuration
> > accesses don't need the pixel clock to be active.
> 
> On the other hand, "all the other" configuration happens during probe, 
> at which point all the clock are enabled anyway. And then during 
> runtime, the pixel clock of this IP are either enabled or this IP is 
> completely shut down.
> 
> So, where exactly does this patch make the clock handling any worse than 
> it currently is ?
> 
There is an even stronger argument: runtime PM does not guarantee that
the runtime_suspend is actually called after you put your last
reference. A simple "echo on > /sys/your-device/power/control" will
prevent the device from ever entering runtime suspend. So if you have a
clock like the pixel clock that _needs_ to be disabled for
configuration purposes you _must_ not handle this clock via RPM, but
via explicit clock handling in the driver.

> [...]
> 
> > > @@ -274,44 +256,37 @@ static int mxsfb_load(struct drm_device *drm,
> > >   
> > >   	ret = platform_get_irq(pdev, 0);
> > >   	if (ret < 0)
> > > -		goto err_vblank;
> > > +		return ret;
> > >   	mxsfb->irq = ret;
> > >   
> > > -	pm_runtime_get_sync(drm->dev);
> > >   	ret = mxsfb_irq_install(drm, mxsfb->irq);
> > > -	pm_runtime_put_sync(drm->dev);
> > > -
> > Here you do a bunch of stuff resulting in register access without
> > enabling the clocks. I don't really see how this works, maybe because
> > the clocks are still on when you run the probe?
> 
> Right
> 
> > Better enable the register access clocks here and then tell RPM about
> > the fact that the device is running by calling pm_runtime_set_active
> > before pm_runtime_enable. This way theoretically allows to build a
> > kernel without CONFIG_PM and things still work, even if the RPM calls
> > are stubs.
> 
> I would much rather move this driver to RPM and have RPM handle the 
> clock altogether in one place.
> 
See above. Same argument applies. The driver should work without RPM
support.

> [...]
> 
> > > @@ -411,9 +405,6 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
> > >   	}
> > >   	spin_unlock_irq(&drm->event_lock);
> > >   
> > > -	drm_crtc_vblank_off(crtc);
> > > -
> > > -	mxsfb_disable_axi_clk(mxsfb);
> > >   	pm_runtime_put_sync(drm->dev);
> > > 
> > Not the fault of your patch, but why is this a _sync call?
> 
> See 4201f4e848450 ("drm/mxsfb: Add pm_runtime calls to 
> pipe_enable/disable"), likely the intention was for this call to 
> complete before existing the atomic_disable.

Hm, still don't see why this would be necessary. But as this was just a
passing comment, we should revisit this later, not in the context of
this patch.

Regards,
Lucas

