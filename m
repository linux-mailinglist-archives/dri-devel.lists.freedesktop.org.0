Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E9829FF6B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCF26E969;
	Fri, 30 Oct 2020 08:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FBF6E969
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 08:08:27 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CA8191F4595B;
 Fri, 30 Oct 2020 08:08:25 +0000 (GMT)
Date: Fri, 30 Oct 2020 09:08:15 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 3/5] drm: bridge: Propagate the bus flags from
 bridge->timings
Message-ID: <20201030090815.7133637b@collabora.com>
In-Reply-To: <dfb643a6-cb73-c915-21ff-387faa177c94@ti.com>
References: <20201016103917.26838-1-nikhil.nd@ti.com>
 <20201016103917.26838-4-nikhil.nd@ti.com>
 <fd65aa92-bc89-2420-bbc1-e131db1f6c25@ti.com>
 <20201028143453.njt3lak542wwx6jb@NiksLab>
 <20201029224817.GH15024@pendragon.ideasonboard.com>
 <dfb643a6-cb73-c915-21ff-387faa177c94@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Swapnil Jakhade <sjakhade@cadence.com>, Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 30 Oct 2020 09:30:01 +0200
Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:

> On 30/10/2020 00:48, Laurent Pinchart wrote:
> 
> >>> And, hmm... It's too easy to get confused with these, but... If the bridge defines timings, and
> >>> timings->input_bus_flags != 0, should we always pick that, even if we got something via
> >>> output_flags? Logic being, if this bridge defines timings->input_bus_flags, it probably wants that
> >>> to be used regardless whether we got something from the next bridge.  
> > 
> > timings->input_bus_flags is an API that predates format and flags
> > propagation along the pipeline. I would assume that drivers that
> > implement propagation should do so in a way that prioritize that API,
> > and either not report flags in the timings (in which case giving
> > priority to one or another wouldn't make a difference as both would
> > never be provided together), or would report flags in the timings as a
> > best effort fallback for display controller drivers that would look at
> > them exclusively without supporting the new API. I would thus think that
> > the flags obtained through format negotiation should be prioritized.  
> 
> What do you mean "drivers that implement propagation"? Doesn't that come from the framework, not
> from the drivers?
> 
> Say, we have two bridges, A -> B. A has timings->input_bus_flags.
> 
> When propagating the flags, we get something as B's input flags. Should A use B's input flags as A's
> input flags, or should A use its timings->input_bus_flags? I was suggesting the latter. Nikhil's
> patch does the latter, but only if B's input flags was 0.

A should definitely use timings->input_bus_flags in that case.

> 
> A can override its input flags manually in atomic_check, but if the timings->input_bus_flags exists,
> isn't it a sane choice to just pick that by default?

The "propagate output flags" and soon to be added "use
timing->input_flags if present" logic should only be used as a fallback
for bridges that do not support dynamic bus format/flags negotiation
IMHO. Ideally we'd want to convert all bridges to do this dynamic bus
format/flags negotiation and get rid of timings->input_bus_flags once
this is done, but that's likely to take time. So, if your driver
implements the ->atomic_check() hook and needs specific input flags,
I'd recommend setting the input flags there instead of specifying it
through timings->input_bus_flags.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
