Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BF4282272
	for <lists+dri-devel@lfdr.de>; Sat,  3 Oct 2020 10:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56C86E0D5;
	Sat,  3 Oct 2020 08:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E686E0D5
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Oct 2020 08:26:22 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B92C8206CA;
 Sat,  3 Oct 2020 08:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601713582;
 bh=qY1uDVpidDLHdL3/prCqreUy10orTSXfQcRuJfqVI4M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mIeCU+CpdIFebXV8YssNi/b/q4CPtbfqLrc6n4zAXpeRA8A2vbMlUFAF0Pw4Qt1+Y
 jUdh7kxKRZytRxGPkPQmpVIhMmcOCDM4tBrKoErUEspAKKuhrVvgXinc8pb3tNVJaU
 zC+E3iwwpkJhk4QcB9EW86+SFg1836SLXrTc7jxU=
Date: Sat, 3 Oct 2020 10:26:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v3 2/2] tty/sysrq: Add configurable handler to execute a
 compound action
Message-ID: <20201003082618.GA113835@kroah.com>
References: <20200818112825.6445-1-andrzej.p@collabora.com>
 <20200818112825.6445-3-andrzej.p@collabora.com>
 <20201002125429.GA3350322@kroah.com>
 <db7fe4ed-19a4-3303-a544-eb789badb8a1@collabora.com>
 <20201002140233.GB3475053@kroah.com>
 <2031d74a-41df-d556-d5de-37f4b63ee30f@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2031d74a-41df-d556-d5de-37f4b63ee30f@collabora.com>
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
Cc: linux-input@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jiri Slaby <jslaby@suse.com>, kernel@collabora.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 02, 2020 at 05:06:54PM +0200, Andrzej Pietrasiewicz wrote:
> Hi,
> =

> W dniu 02.10.2020 o=A016:02, Greg Kroah-Hartman pisze:
> > On Fri, Oct 02, 2020 at 03:42:52PM +0200, Andrzej Pietrasiewicz wrote:
> > > Hi,
> > > =

> > > W dniu 02.10.2020 o=A014:54, Greg Kroah-Hartman pisze:
> > > > On Tue, Aug 18, 2020 at 01:28:25PM +0200, Andrzej Pietrasiewicz wro=
te:
> > > > > Userland might want to execute e.g. 'w' (show blocked tasks), fol=
lowed
> > > > > by 's' (sync), followed by 1000 ms delay and then followed by 'c'=
 (crash)
> > > > > upon a single magic SysRq. Or one might want to execute the famou=
s "Raising
> > > > > Elephants Is So Utterly Boring" action. This patch adds a configu=
rable
> > > > > handler, triggered with 'C', for this exact purpose. The user spe=
cifies the
> > > > > composition of the compound action using syntax similar to getopt=
, where
> > > > > each letter corresponds to an individual action and a colon follo=
wed by a
> > > > > number corresponds to a delay of that many milliseconds, e.g.:
> > > > > =

> > > > > ws:1000c
> > > > > =

> > > > > or
> > > > > =

> > > > > r:100eis:1000ub
> > > > =

> > > > A macro language for sysrq commands, who would have thought...
> > > > =

> > > > Anyway, _why_ would userland want to do something so crazy as this?
> > > > What is the use-case here?
> > > > =

> > > =

> > > A use-case is Chromebooks which do want to execute 'w', 's',
> > > wait 1000ms and then 'c' under one key combination. Having that suppo=
rted
> > > upstream brings us one little step closer to those machines running
> > > upstream kernel.
> > =

> > Who is causing that to "execute"?  Some daemon/program?
> =

> No, as far as I know they patch the kernel to change the behavior
> of Sysrq-x combination, so the "execution" is triggered by the user.

So this isn't coming from the chromeos team, so there is no guarantee
that they will switch to this if it is merged?

> > > Another argument for such a "macro language" is when a machine's syst=
em
> > > keeps degrading over time, possibly degrading (relatively) fast.
> > > "Raising Elephants Is So Utterly Boring" consists of 6 actions, each
> > > of which requires pressing several keys. The user might be unable
> > > to complete all the 6 steps, while a "macro" requires user's involvem=
ent
> > > for carrying out just one step.
> > =

> > So you want to "preload" some commands ahead of time, for when you get
> > in trouble
> It can be said this way, yes.
> =

> > =

> > These should just be debugging / last resort types of things, how
> > regular are they being used in your systems?
> > =

> =

> The "REISUB" itself is a kind of a last resort thing.
> =

> It is true that it's not a very frequent situation, but does its being ra=
re
> preclude having such a function in the kernel?
> =

> While preparing this patch I wanted it to be flexible, but perhaps it is
> too flexible for some reason? If the permissions of the module_param's
> sysfs entry were changed to 0444 would it be better? Then the compound
> action would still be configurable but only at boot time rather than at
> boot time _and_ runtime.

I don't have an issue with it happening at runtime and boot time, just
that this is adding additional complexity to the kernel (parsers are
fun!) for no real-world user.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
