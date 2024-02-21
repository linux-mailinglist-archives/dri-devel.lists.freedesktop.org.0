Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D7485D3DA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4414410E68D;
	Wed, 21 Feb 2024 09:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UNRPbhjT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB8310E67D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708508425;
 bh=v5pG0UUUE/LoBnEvASxYM5p6sqdzBp802B5VBTcG/qg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UNRPbhjTQ+sbeuVe7B4KQAmiuK4dMtRlSeTddzOJVLYk4u5TK3IdxE3q1hNh8bvF2
 Z10OJWvcXdOuQ7Fa38o03ZHhB3cizSNuM/K8scDKPU6xdBHWmCNb+sm98aW6SW2U/x
 xfckvfnbRti9ajjsooGXkrR0Qxet9jKQ0iY41ngRa5oW7MsDd1hEFvpZKTzACAi4Js
 L1JB0POBH4XRkTN30TIjnrBRxqIDTaBXRzFjU2JAlWElczm10avgUY7k25VTjqp5xP
 WJEM9sddmIRwuwnrstsehDTTF7Utgt7LRept6/q7NnE/tQKeEkgdUElyb3W6eoFi2D
 myQYMKkb+8H3w==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 83D2D378107C;
 Wed, 21 Feb 2024 09:40:25 +0000 (UTC)
Date: Wed, 21 Feb 2024 09:40:24 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Steven Price <steven.price@arm.com>, 
 Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/1] Always record job cycle and timestamp information
Message-ID: <jvohxwzrgwqmzhwws3tzn53ii6eyexkutwl7pdj5buk6k6wx7c@ucxoohk5e3iw>
References: <20240214121435.3813983-1-adrian.larumbe@collabora.com>
 <ba987da3-b4aa-410c-95ae-434e94793d85@arm.com>
 <CAKMK7uH=QKSyMgsOYCHMwE7iv6jQZRwUMcKq=HiXsBXBCv5BCQ@mail.gmail.com>
 <cfe1870f-16ff-45b4-8966-6bb536d3cae7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cfe1870f-16ff-45b4-8966-6bb536d3cae7@linux.intel.com>
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

Hi,

I just wanted to make sure we're on the same page on this matter. So in
Panfrost, and I guess in almost every other single driver out there, HW perf
counters and their uapi interface are orthogonal to fdinfo's reporting on drm
engine utilisation.

At the moment it seems like HW perfcounters and the way they're exposed to UM
are very idiosincratic and any attempt to unify their interface into a common
set of ioctl's sounds like a gargantuan task I wouldn't like to be faced with.

As for fdinfo, I guess there's more room for coming up with common helpers that
could handle the toggling of HW support for drm engine calculations, but I'd at
least have to see how things are being done in let's say, Freedreno or Intel.

Right now there's a pressing need to get rid of the debugfs knob for fdinfo's
drm engine profiling sources in Panfrost, after which I could perhaps draw up an
RFC for how to generalise this onto other drivers.

Adrian

On 16.02.2024 17:43, Tvrtko Ursulin wrote:
> 
> On 16/02/2024 16:57, Daniel Vetter wrote:
> > On Wed, Feb 14, 2024 at 01:52:05PM +0000, Steven Price wrote:
> > > Hi Adrián,
> > > 
> > > On 14/02/2024 12:14, Adrián Larumbe wrote:
> > > > A driver user expressed interest in being able to access engine usage stats
> > > > through fdinfo when debugfs is not built into their kernel. In the current
> > > > implementation, this wasn't possible, because it was assumed even for
> > > > inflight jobs enabling the cycle counter and timestamp registers would
> > > > incur in additional power consumption, so both were kept disabled until
> > > > toggled through debugfs.
> > > > 
> > > > A second read of the TRM made me think otherwise, but this is something
> > > > that would be best clarified by someone from ARM's side.
> > > 
> > > I'm afraid I can't give a definitive answer. This will probably vary
> > > depending on implementation. The command register enables/disables
> > > "propagation" of the cycle/timestamp values. This propagation will cost
> > > some power (gates are getting toggled) but whether that power is
> > > completely in the noise of the GPU as a whole I can't say.
> > > 
> > > The out-of-tree kbase driver only enables the counters for jobs
> > > explicitly marked (BASE_JD_REQ_PERMON) or due to an explicit connection
> > > from a profiler.
> > > 
> > > I'd be happier moving the debugfs file to sysfs rather than assuming
> > > that the power consumption is small enough for all platforms.
> > > 
> > > Ideally we'd have some sort of kernel interface for a profiler to inform
> > > the kernel what it is interested in, but I can't immediately see how to
> > > make that useful across different drivers. kbase's profiling support is
> > > great with our profiling tools, but there's a very strong connection
> > > between the two.
> > 
> > Yeah I'm not sure whether a magic (worse probably per-driver massively
> > different) file in sysfs is needed to enable gpu perf monitoring stats in
> > fdinfo.
> > 
> > I get that we do have a bit a gap because the linux perf pmu stuff is
> > global, and you want per-process, and there's kinda no per-process support
> > for perf stats for devices. But that's probably the direction we want to
> > go, not so much fdinfo. At least for hardware performance counters and
> > things like that.
> > 
> > Iirc the i915 pmu support had some integration for per-process support,
> > you might want to chat with Tvrtko for kernel side and Lionel for more
> > userspace side. At least if I'm not making a complete mess and my memory
> > is vaguely related to reality. Adding them both.
> 
> Yeah there are two separate things, i915 PMU and i915 Perf/OA.
> 
> If my memory serves me right I indeed did have a per-process support for i915
> PMU implemented as an RFC (or at least a branch somewhere) some years back.
> IIRC it only exposed the per engine GPU utilisation and did not find it very
> useful versus the complexity. (I think it at least required maintaining a map
> of drm clients per task.)
> 
> Our more useful profiling is using a custom Perf/OA interface (Observation
> Architecture) which is possibly similar to kbase mentioned above. Why it is a
> custom interface is explained in a large comment on top of i915_perf.c. Not
> sure if all of them still hold but on the overall perf does not sound like the
> right fit for detailed GPU profiling.
> 
> Also PMU drivers are very challenging to get the implementation right, since
> locking model and atomicity requirements are quite demanding.
> 
> From my point of view, at least it is my initial thinking, if custom per
> driver solutions are strongly not desired, it could be interesting to look
> into whether there is enough commonality, in at least concepts, to see if a
> new DRM level common but extensible API would be doable. Even then it may be
> tricky to "extract" enough common code to justify it.
> 
> Regards,
> 
> Tvrtko
> 
> > 
> > Cheers, Sima
> > 
> > 
> > > 
> > > Steve
> > > 
> > > > Adrián Larumbe (1):
> > > >    drm/panfrost: Always record job cycle and timestamp information
> > > > 
> > > >   drivers/gpu/drm/panfrost/Makefile           |  2 --
> > > >   drivers/gpu/drm/panfrost/panfrost_debugfs.c | 21 ------------------
> > > >   drivers/gpu/drm/panfrost/panfrost_debugfs.h | 14 ------------
> > > >   drivers/gpu/drm/panfrost/panfrost_device.h  |  1 -
> > > >   drivers/gpu/drm/panfrost/panfrost_drv.c     |  5 -----
> > > >   drivers/gpu/drm/panfrost/panfrost_job.c     | 24 ++++++++-------------
> > > >   drivers/gpu/drm/panfrost/panfrost_job.h     |  1 -
> > > >   7 files changed, 9 insertions(+), 59 deletions(-)
> > > >   delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
> > > >   delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h
> > > > 
> > > > 
> > > > base-commit: 6b1f93ea345947c94bf3a7a6e668a2acfd310918
> > > 
> > 
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

