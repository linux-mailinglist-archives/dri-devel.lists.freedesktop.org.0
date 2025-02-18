Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29842A3947C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 09:07:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6723110E625;
	Tue, 18 Feb 2025 08:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JYtwZ3rw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E9810E64D;
 Tue, 18 Feb 2025 08:07:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A25F35C4CC7;
 Tue, 18 Feb 2025 08:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E3AC4CEE6;
 Tue, 18 Feb 2025 08:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1739866038;
 bh=0nJNYoHEPY55ekPjs2MDTQbDYT48weyBXJTKQum9lYM=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=JYtwZ3rwsLQu4WBaDduY/mEVvInOMPJ16YmXZDER0bYrEWJ7sdc7ZYLPmZh3GGD9r
 ESqOX2EZjua0kKcrx9D+Lgm3sRAiIBYUth0/RuncbJL/eXmaEYJ+CB9msS8pozxVDE
 1J+N56X+jVbr+Qg7Di4W4B8vCuSz8MTDnZTlbyp4=
Date: Tue, 18 Feb 2025 09:07:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <2025021830-segment-boil-5ff7@gregkh>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7NaPYvuRF11uxnM@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7NaPYvuRF11uxnM@phenom.ffwll.local>
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

On Mon, Feb 17, 2025 at 04:48:13PM +0100, Simona Vetter wrote:
> On Mon, Feb 17, 2025 at 11:04:45PM +0900, Alexandre Courbot wrote:
> > Hi everyone,
> > 
> > This short RFC is based on top of Danilo's initial driver stub series
> > [1] and has for goal to initiate discussions and hopefully some design
> > decisions using the simplest subdevice of the GPU (the timer) as an
> > example, before implementing more devices allowing the GPU
> > initialization sequence to progress (Falcon being the logical next step
> > so we can get the GSP rolling).
> > 
> > It is kept simple and short for that purpose, and to avoid bumping into
> > a wall with much more device code because my assumptions were incorrect.
> > 
> > This is my first time trying to write Rust kernel code, and some of my
> > questions below are probably due to me not understanding yet how to use
> > the core kernel interfaces. So before going further I thought it would
> > make sense to raise the most obvious questions that came to my mind
> > while writing this draft:
> > 
> > - Where and how to store subdevices. The timer device is currently a
> >   direct member of the GPU structure. It might work for GSP devices
> >   which are IIUC supposed to have at least a few fixed devices required
> >   to bring the GSP up ; but as a general rule this probably won't scale
> >   as not all subdevices are present on all GPU variants, or in the same
> >   numbers. So we will probably need to find an equivalent to the
> >   `subdev` linked list in Nouveau.
> > 
> > - BAR sharing between subdevices. Right now each subdevice gets access
> >   to the full BAR range. I am wondering whether we could not split it
> >   into the relevant slices for each-subdevice, and transfer ownership of
> >   each slice to the device that is supposed to use it. That way each
> >   register would have a single owner, which is arguably safer - but
> >   maybe not as flexible as we will need down the road?
> > 
> > - On a related note, since the BAR is behind a Devres its availability
> >   must first be secured before any hardware access using try_access().
> >   Doing this on a per-register or per-operation basis looks overkill, so
> >   all methods that access the BAR take a reference to it, allowing to
> >   call try_access() from the highest-level caller and thus reducing the
> >   number of times this needs to be performed. Doing so comes at the cost
> >   of an extra argument to most subdevice methods ; but also with the
> >   benefit that we don't need to put the BAR behind another Arc and share
> >   it across all subdevices. I don't know which design is better here,
> >   and input would be very welcome.
> > 
> > - We will probably need sometime like a `Subdevice` trait or something
> >   down the road, but I'll wait until we have more than one subdevice to
> >   think about it.
> 
> It might make sense to go with a full-blown aux bus. Gives you a lot of
> structures and answers to these questions, but also might be way too much.

No, it's not too much, that's exactly what the auxbus code is for
(splitting a real device into child ones where they all share the same
physical resources.)  So good suggestion.

thanks,

greg k-h
