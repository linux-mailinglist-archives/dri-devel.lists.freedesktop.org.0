Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD69475DC1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 17:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B536B10E52C;
	Wed, 15 Dec 2021 16:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7B110E52C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 16:45:54 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1mxXPc-0003af-Vc; Wed, 15 Dec 2021 17:45:53 +0100
Message-ID: <c1bcea09976a6d10185b52fe6e29964fdd0a107a.camel@pengutronix.de>
Subject: Re: IMX6Q DRM - Framebuffer update rate with LVDS
From: Lucas Stach <l.stach@pengutronix.de>
To: Chris Pringle <Chris.Pringle@phabrix.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Date: Wed, 15 Dec 2021 17:45:51 +0100
In-Reply-To: <CWXP265MB2229746771FD019967F0BD42EB769@CWXP265MB2229.GBRP265.PROD.OUTLOOK.COM>
References: <CWXP265MB2229746771FD019967F0BD42EB769@CWXP265MB2229.GBRP265.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,

Am Mittwoch, dem 15.12.2021 um 16:33 +0000 schrieb Chris Pringle:
> Hi,
>  
> I’m looking for some advice/guidance on an issue I’ve run into with
> the IMX DRM implementation with LVDS. I’m using an imx6q with an
> 1080p LVDS display on kernel 5.10.73-rt. When running Qt applications
> (EGLFS) with this platform, I’ve run into a strange issue where the
> framebuffer flip rate (as observed in libdrm) seems to be fixed at
> either ~14fps or ~28fps. This changes from ~14fps to ~28fps when I
> increase the pixel clock rate for the display above ~75.5Mhz.
>  
> Our render times are well below 35mS – usually around 28-30mS. With a
> pixel clock of 74Mhz, the frame buffer refreshes every 70mS, blocking
> the app waiting for the next page flip. Increasing the pixel clock to
> 75.5Mhz causes the frame buffer to flip every 35mS. Increasing the
> pixel clock further to around 140MHz makes no difference – the frame
> buffer still flips every 35mS. It appears as if the clock governing
> the frame buffer is not scaling with the display pixel clock and is
> running asynchronously – I’m unclear if this is by design or if this
> is down to platform misconfiguration.
>  
> The pixel clock for the LVDS display is set in the DTS file and is
> being correctly picked up – I can see the display refresh rate
> reflected in the Qt library logs and the pixel clock rate reflected
> in the debug kernel logs for the imx-ipuv3 driver.
>  
> Does anyone have any thoughts on what might be causing this
> behaviour? I’d like to understand why the framebuffer refresh rate is
> not changing proportionally with the pixel clock rate, and why the
> duration between flips suddenly jumps from 35mS to 70mS when the
> pixel clock drops below ~75.5Mhz.

This sounds like the LDB is using a system clock source and thus can
not correctly match the rate of the display. Userspace gets to see what
the panel wants as a pixel clock, but the rate matching may be very
poor when not being sourced from the video PLL.

If you don't need to drive any other display on the system, the best
option is to use the video PLL as it can provide almost perfect rate
matching. See the clks node in arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi
for an example on how to switch the LDB to use the video PLL as its
clock source.

Regards,
Luacs

