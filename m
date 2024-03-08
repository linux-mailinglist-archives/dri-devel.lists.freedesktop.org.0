Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30410876922
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 18:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5291A113915;
	Fri,  8 Mar 2024 17:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6109E113915
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 17:02:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 379481474
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 09:03:05 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5B7013F73F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 09:02:28 -0800 (PST)
Date: Fri, 8 Mar 2024 17:02:15 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH] drm/panthor: Add support for performance counters
Message-ID: <ZetEl5h40pcB73t7@e110455-lin.cambridge.arm.com>
References: <20240305165820.585245-1-adrian.larumbe@collabora.com>
 <ZesYErFVdqLyjblW@e110455-lin.cambridge.arm.com>
 <20240308161515.1d74fd55@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240308161515.1d74fd55@collabora.com>
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

On Fri, Mar 08, 2024 at 04:15:15PM +0100, Boris Brezillon wrote:
> On Fri, 8 Mar 2024 13:52:18 +0000
> Liviu Dudau <liviu.dudau@arm.com> wrote:
> 
> > Hi Adrián,
> > 
> > Thanks for the patch and appologies for taking a bit longer to respond,
> > I was trying to gather some internal Arm feedback before replying.
> > 
> > On Tue, Mar 05, 2024 at 04:58:16PM +0000, Adrián Larumbe wrote:
> > > This brings in support for Panthor's HW performance counters and querying
> > > them from UM through a specific ioctl(). The code is inspired by existing
> > > functionality for the Panfrost driver, with some noteworthy differences:
> > > 
> > >  - Sample size is now reported by the firmware rather than having to reckon
> > >  it by hand
> > >  - Counter samples are chained in a ring buffer that can be accessed
> > >  concurrently, but only from threads within a single context (this is
> > >  because of a HW limitation).
> > >  - List of enabled counters must be explicitly told from UM
> > >  - Rather than allocating the BO that will contain the perfcounter values
> > >  in the render context's address space, the samples ring buffer is mapped
> > >  onto the MCU's VM.
> > >  - If more than one thread within the same context tries to dump a sample,
> > >  then the kernel will copy the same frame to every single thread that was
> > >  able to join the dump queue right before the FW finished processing the
> > >  sample request.
> > >  - UM must provide a BO handle for retrieval of perfcnt values rather
> > >  than passing a user virtual address.
> > > 
> > > The reason multicontext access to the driver's perfcnt ioctl interface
> > > isn't tolerated is because toggling a different set of counters than the
> > > current one implies a counter reset, which also messes up with the ring
> > > buffer's extraction and insertion pointers. This is an unfortunate
> > > hardware limitation.  
> > 
> > There are a few issues that we would like to improve with this patch.
> > 
> > I'm not sure what user space app has been used for testing this (I'm guessing
> > gputop from igt?) but whatever is used it needs to understand the counters
> > being exposed.
> 
> We are using perfetto to expose perfcounters.
> 
> > In your patch there is no information given to the user space
> > about the layout of the counters and / or their order. Where is this being
> > planned to be defined?
> 
> That's done on purpose. We want to keep the kernel side as dumb as
> possible so we don't have to maintain a perfcounter database there. All
> the kernel needs to know is how much data it should transfer pass to
> userspace, and that's pretty much it.

I was not thinking about a perfcounter database but hints about counter value
size. In the future we might have 64bits counters and you will not be able to
tell only from the sample size if you're talking with an old firmware or not.
(Read: future GPUs are likely to go bigger on number of perf counters before
they gain higher definition).

> 
> > Long term, I think it would be good to have details
> > about the counters available.
> 
> The perfcounter definitions are currently declared in mesa (see the G57
> perfcounter definitions for instance [1]). Mesa also contains a perfetto
> datasource for Panfrost [2].

Sorry, I've missed that perfetto got updated.

> 
> > 
> > The other issue we can see is with the perfcnt_process_sample() and its
> > handling of threshold event and overflows. If the userspace doesn't sample
> > quick enough and we cross the threshold we are going to lose samples and
> > there is no mechanism to communicate to user space that the values they
> > are getting have gaps. I believe the default mode for the firmware is to
> > give you counter values relative to the last read value, so if you drop
> > samples you're not going to make any sense of the data.
> 
> If we get relative values, that's indeed a problem. I thought we were
> getting absolute values though, in which case, if you miss two 32-bit
> wraparounds, either your sampling rate is very slow, or events occur at
> a high rate.

First CSF GPUs have some erratas around perf counters that firmware tries to
hide. I need to dig a bit deeper into what firmware does for each GPU before
confirming the counting mode.

The main issue with the code is that we should not be dropping samples at
all, even if they are absolute values, as there will be gaps in the analysis.
Looking at perfcnt_process_sample(), it does not increase the sampling rate
if we reach the threshold, nor does it tell the user space to do so. From our
DDK experience, if you've reached the threshold with the app sampling
then you're likely to overflow as well, missing samples.

> 
> > 
> > The third topic that is worth discussing is the runtime PM. Currently your
> > patch will increment the runtime PM usage count when the performance
> > counter dump is enabled, which means you will not be able to instrument
> > your power saving modes. It might not be a concern for the current users
> > of the driver, but it is worth discussing how to enable that workflow
> > for future.
> 
> I guess we could add a flags field to drm_panthor_perfcnt_config and
> declare a DRM_PANTHOR_PERFCNT_CFG_ALLOW_GPU_SUSPEND flag to support this
> use case.

Yes, sounds like a good plan. Doesn't have to be included in this patch.

Best regards,
Liviu

> 
> [1]https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/panfrost/perf/G57.xml?ref_type=heads
> [2]https://gitlab.freedesktop.org/mesa/mesa/-/tree/main/src/panfrost/ds?ref_type=heads

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
