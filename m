Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B965C2A0069
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77296E045;
	Fri, 30 Oct 2020 08:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627B66E045
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 08:50:52 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EE20B1F459F1;
 Fri, 30 Oct 2020 08:50:50 +0000 (GMT)
Date: Fri, 30 Oct 2020 09:50:48 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 3/5] drm: bridge: Propagate the bus flags from
 bridge->timings
Message-ID: <20201030095048.2026d1d1@collabora.com>
In-Reply-To: <def32047-de38-d50f-8fd9-31e4dcfe56b9@ti.com>
References: <20201016103917.26838-1-nikhil.nd@ti.com>
 <20201016103917.26838-4-nikhil.nd@ti.com>
 <fd65aa92-bc89-2420-bbc1-e131db1f6c25@ti.com>
 <20201028143453.njt3lak542wwx6jb@NiksLab>
 <20201029224817.GH15024@pendragon.ideasonboard.com>
 <dfb643a6-cb73-c915-21ff-387faa177c94@ti.com>
 <20201030090815.7133637b@collabora.com>
 <def32047-de38-d50f-8fd9-31e4dcfe56b9@ti.com>
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

On Fri, 30 Oct 2020 10:40:46 +0200
Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:

> Hi Boris,
> 
> On 30/10/2020 10:08, Boris Brezillon wrote:
> > The "propagate output flags" and soon to be added "use
> > timing->input_flags if present" logic should only be used as a fallback
> > for bridges that do not support dynamic bus format/flags negotiation
> > IMHO. Ideally we'd want to convert all bridges to do this dynamic bus
> > format/flags negotiation and get rid of timings->input_bus_flags once
> > this is done, but that's likely to take time. So, if your driver
> > implements the ->atomic_check() hook and needs specific input flags,
> > I'd recommend setting the input flags there instead of specifying it
> > through timings->input_bus_flags.  
> 
> What is bus flags negotiation? Don't we have negotiation only for bus formats? Bus flags are just
> set, and the previous bridge in the chain has to use those flags.

Well, there's currently no such negotiation, but I don't see why there
wouldn't be one at some point if bridges can configure it dynamically
(in you A -> B example, A output flags must match B input flags, and if
both A and B can configure those dynamically, they need to negotiate
that part too).

> 
> Or do you just refer to setting the bus flags dynamically in atomic_check, versus static in
> input_bus_flags?

Yes, that's what I suggest, even if those flags are static right now.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
