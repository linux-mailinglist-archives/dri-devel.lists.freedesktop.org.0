Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A06983A7A69
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 11:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7332E89BAB;
	Tue, 15 Jun 2021 09:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 398 seconds by postgrey-1.36 at gabe;
 Tue, 15 Jun 2021 09:24:34 UTC
Received: from foo.stuge.se (foo.stuge.se [212.116.89.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB81489BAB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 09:24:34 +0000 (UTC)
Received: (qmail 27368 invoked by uid 1000); 15 Jun 2021 09:17:51 -0000
Message-ID: <20210615091751.27367.qmail@stuge.se>
Date: Tue, 15 Jun 2021 09:17:51 +0000
From: Peter Stuge <peter@stuge.se>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 2/2] drm/gud: Use scatter-gather USB bulk transfer
References: <20210329180120.27380-1-noralf@tronnes.org>
 <20210329180120.27380-2-noralf@tronnes.org>
 <CACRpkda6K59aVCDwKmy1AJ2z+nq2-pjvCWFFn8Yd1aUFAGfsgg@mail.gmail.com>
 <0c688720-08d5-452a-31d1-db5020075d23@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c688720-08d5-452a-31d1-db5020075d23@tronnes.org>
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Noralf,

Noralf Trønnes wrote:
> >> +static int gud_usb_bulk(struct gud_device *gdrm, size_t len)
..
> >> +       timer_setup_on_stack(&ctx.timer, gud_usb_bulk_timeout, 0);
> >> +       mod_timer(&ctx.timer, jiffies + msecs_to_jiffies(3000));
> >> +
> >> +       usb_sg_wait(&ctx.sgr);
> >> +
> >> +       if (!del_timer_sync(&ctx.timer))
> >> +               ret = -ETIMEDOUT;
..
> > Mention in the commit message that sending USB bulk transfers with
> > an sglist could be unstable

Can you explain a bit about /how/ it is unstable?

As you write, usb_bulk_msg() (as used before) has a timeout which is
passed to the host controller hardware and implemented there.

I haven't used SG with kernel USB but I would expect such a timeout
to still be available with SG?


> usb_bulk_msg() has builtin timeout handling and during development of
> a microcontroller gadget implementation I've triggered this timeout
> several times when the uC usb interrupts stopped firing.

The device not responding to bulk packets scheduled and sent by the host
is a real error /in the device/ and thus not neccessarily something the
kernel must handle gracefully.. I think it's quite nice to do so, but
one can argue that it's not strictly required.

But more importantly: Remember that bulk transfer has no delivery time
guarantee. It can take indefinitely long until a bulk transfer is
scheduled by the host on a busy bus which is starved with more
important things (control, interrupt, iso transfers) - that's not
an error at all, and may be indistinguishable from the device not
responding to packets actually sent by the host.

Having a timeout is important, I just expect the USB SG interface to
support it since it is the hardware that times out in the non-SG case.


And since this is essentially real time data maybe a shorter timeout
is better? 3 seconds seems really long.

The timeout must include all latency for a frame, so e.g. 16ms (60 Hz)
is too short for sure. But maybe something like 500ms?


//Peter
