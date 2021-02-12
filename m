Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D7D31A255
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 17:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450EE6E12C;
	Fri, 12 Feb 2021 16:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5B46E12C;
 Fri, 12 Feb 2021 16:07:36 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23851777-1500050 for multiple; Fri, 12 Feb 2021 16:07:31 +0000
MIME-Version: 1.0
In-Reply-To: <CACvgo50CUgQbBb2=Y4BXyUyoP0x+mwAzT35Oc-kQm+sJyESzcg@mail.gmail.com>
References: <20210204121121.2660-1-chris@chris-wilson.co.uk>
 <20210204121121.2660-3-chris@chris-wilson.co.uk>
 <CACvgo51auuU-AR5nPPo-7Q8Ho84cqOYXuTjgjGDzmPjXRtjZ0w@mail.gmail.com>
 <161314296740.4581.15495829753022855916@build.alporthouse.com>
 <CACvgo50CUgQbBb2=Y4BXyUyoP0x+mwAzT35Oc-kQm+sJyESzcg@mail.gmail.com>
Subject: Re: [RFC 3/3] drm/i915/gt: Export device and per-process runtimes via
 procfs
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 12 Feb 2021 16:07:30 +0000
Message-ID: <161314605098.4581.3932403848428974421@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Emil Velikov (2021-02-12 15:45:04)
> On Fri, 12 Feb 2021 at 15:16, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> >
> > Quoting Emil Velikov (2021-02-12 14:57:56)
> > > Hi Chris,
> > >
> > > On Thu, 4 Feb 2021 at 12:11, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > >
> > > > Register with /proc/gpu to provide the client runtimes for generic
> > > > top-like overview, e.g. gnome-system-monitor can use this information to
> > > > show the per-process multi-GPU usage.
> > > >
> > > Exposing this information to userspace sounds great IMHO and like the
> > > proposed "channels" for the device engines.
> > > If it were me, I would have the channel names a) exposed to userspace
> > > and b) be a "fixed set".
> >
> > - Total
> > - Graphics
> > - Compute
> > - Unified
> > - Video
> > - Copy
> > - Display
> > - Other
> >
> > Enough versatility for the foreseeable future?
> > But plan for extension.
> >
> With a bit of documentation about "unified" (is it a metric also
> counted towards any of the rest) it would be perfect.

With unified I was trying to find a place to things that are neither
wholly graphics nor compute, as some may prefer not to categorise
themselves as one or the other. Also whether or not some cores are more
compute than others (so should there be an AI/RT/ALU?)

> For future extension one might consider splitting video into
> encoder/decoder/post-processing.

Ok, I wasn't sure how commonly those functions were split on different
HW.

> > The other aspect then is the capacity of each channel. We can keep it
> > simple as the union/average (whichever the driver has to hand) runtime in
> > nanoseconds over all IP blocks within a channel.
> 
> Not sure what you mean with capacity. Are you referring to having
> multiple instances of the same engine (say 3 separate copy engines)?
> Personally I'm inclined to keep these separate entries, since some
> hardware can have multiple ones.
> 
> For example - before the latest changes nouveau had 8 copy engines,
> 3+3 video 'generic' video (enc,dec)oder engines, amongst others.

Yes, most HW have multiple engines within a family. Trying to keep it
simple, I thought presenting just one runtime metric for the whole
channel. Especially for the single-line per device format I had picked :)

If we switch to a more extensible format,

	-'$device0' : 
		-$channel0 : {
			Total : $total # avg/union over all engines
			Engines : [ $0, $1, ... ]
		}
		...

	-'$device1' : 
		...

Using the same fixed channel names, and dev_name(), pesky concerns such
as keeping it as a simple scanf can be forgotten.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
