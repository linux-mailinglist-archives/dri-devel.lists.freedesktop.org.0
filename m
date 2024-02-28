Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1718E86B168
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 15:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4532010E0E7;
	Wed, 28 Feb 2024 14:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="BVkd0KS7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0088110E0E7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 14:13:59 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-33ad9ec3ec2so656539f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 06:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1709129638; x=1709734438; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tQ6S85ERjoMhiF/axIBWpRKICnSxTdLINo9QSace1cY=;
 b=BVkd0KS7FXyBdXBEAUIcxBnmvnHcUfaTP9A+IJ8bJPUUIA23kMzJC+kmyq79vmx/Bl
 a/ZJ/RN8AOtXgLWymwx65asJCVGkaPKAx29uZqB2YkxtYpe3LmjmqWzLx3sPueyDBV9o
 68aI7m8+iy3brxKZxIRZZrnIbyeuk9NT7Qoqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709129638; x=1709734438;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tQ6S85ERjoMhiF/axIBWpRKICnSxTdLINo9QSace1cY=;
 b=RwRh83swhQZesoCNOV7nLLo3glkVGWCcYOqg2UN0fCD+dGsbER7lh6xtU7+2Vym7bl
 k6y+xusBnjsAvXKSQR6/jRcKo7sPZ7Z9SDal09iWahJ2o520EXe0FM3weRsibrLYcVYf
 7W6knr7+8Njc0J4SzdWuzpIwPkkUj5qGmYZjZbjM5yEGIfpojInntamqsntetXdS3DEz
 MTqLSMNeV5q2JIb1cB+ETCAZ2NUrDmNii1KcwU77M8HGE0suK/O9RArxG7Pq/0GmdTGL
 q042N33SHKcGZMlIAa4HEktLW6Vmk7Z8DhB45LtiCHhlNYV4etpgcQieM3Cb6bDyoOFm
 f8Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhESkbN+RMnyoYovGjuvx+Jb9YN+ch8c8RS6l1EU63nzMI96F49k/Dk4pVMl73o3/Y84PvpPIIjlIyyao2lW7iRMf+gACih3B/B1llDv4t
X-Gm-Message-State: AOJu0YzaxUEOH43qB5n/9L4oAQXq2n5Q9IGJLo3P+M025pbRqRaoeOjO
 PmD4JOeqqIDEU1zlesTyA582pHALyh02srUsEjIm33W24JqaSeouygJ9sJmI+cIIqN//Gowg7b5
 6
X-Google-Smtp-Source: AGHT+IH8cQBqvdw+8dSfOcDh30ptsjj9xOAU729XZvKQLyKuMLauSt8LWlzhDf6WyRemlNHg72doFw==
X-Received: by 2002:a05:6512:3f20:b0:512:b3df:8a54 with SMTP id
 y32-20020a0565123f2000b00512b3df8a54mr8298761lfa.4.1709129617719; 
 Wed, 28 Feb 2024 06:13:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 jz6-20020a05600c580600b00412b843cd2esm52544wmb.0.2024.02.28.06.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 06:13:37 -0800 (PST)
Date: Wed, 28 Feb 2024 15:13:35 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 0/1] Always record job cycle and timestamp information
Message-ID: <Zd8_j7VHRWhKdO3B@phenom.ffwll.local>
Mail-Followup-To: =?iso-8859-1?Q?Adri=E1n?= Larumbe
 <adrian.larumbe@collabora.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Steven Price <steven.price@arm.com>,
 Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240214121435.3813983-1-adrian.larumbe@collabora.com>
 <ba987da3-b4aa-410c-95ae-434e94793d85@arm.com>
 <CAKMK7uH=QKSyMgsOYCHMwE7iv6jQZRwUMcKq=HiXsBXBCv5BCQ@mail.gmail.com>
 <cfe1870f-16ff-45b4-8966-6bb536d3cae7@linux.intel.com>
 <jvohxwzrgwqmzhwws3tzn53ii6eyexkutwl7pdj5buk6k6wx7c@ucxoohk5e3iw>
 <0c001651-0339-4872-bf4f-d1a3e4f2aa43@linux.intel.com>
 <63vgotmjzngc2u7f6egxxgol6wtepjev5ct43sozkrove7w4co@4tkgqawcscxb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63vgotmjzngc2u7f6egxxgol6wtepjev5ct43sozkrove7w4co@4tkgqawcscxb>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Wed, Feb 21, 2024 at 03:13:41PM +0000, Adrián Larumbe wrote:
> > On 21.02.2024 14:34, Tvrtko Ursulin wrote:
> > 
> > On 21/02/2024 09:40, Adrián Larumbe wrote:
> > > Hi,
> > > 
> > > I just wanted to make sure we're on the same page on this matter. So in
> > > Panfrost, and I guess in almost every other single driver out there, HW perf
> > > counters and their uapi interface are orthogonal to fdinfo's reporting on drm
> > > engine utilisation.
> > > 
> > > At the moment it seems like HW perfcounters and the way they're exposed to UM
> > > are very idiosincratic and any attempt to unify their interface into a common
> > > set of ioctl's sounds like a gargantuan task I wouldn't like to be faced with.
> > 
> > I share the same feeling on this sub-topic.
> > 
> > > As for fdinfo, I guess there's more room for coming up with common helpers that
> > > could handle the toggling of HW support for drm engine calculations, but I'd at
> > > least have to see how things are being done in let's say, Freedreno or Intel.
> > 
> > For Intel we don't need this ability, well at least for pre-GuC platforms.
> > Stat collection is super cheap and permanently enabled there.
> > 
> > But let me copy Umesh because something at the back of my mind is telling me
> > that perhaps there was something expensive about collecting these stats with
> > the GuC backend? If so maybe a toggle would be beneficial there.
> > 
> > > Right now there's a pressing need to get rid of the debugfs knob for fdinfo's
> > > drm engine profiling sources in Panfrost, after which I could perhaps draw up an
> > > RFC for how to generalise this onto other drivers.
> > 
> > There is a knob currently meaning fdinfo does not work by default? If that is
> > so, I would have at least expected someone had submitted a patch for gputop to
> > handle this toggle. It being kind of a common reference implementation I don't
> > think it is great if it does not work out of the box.
> 
> It does sound like I forgot to document this knob at the time I submited fdinfo
> support for Panforst.  I'll make a point of mentioning it in a new patch where I
> drop debugfs support and enable toggling from sysfs instead.
> 
> > The toggle as an idea sounds a bit annoying, but if there is no other
> > realistic way maybe it is not too bad. As long as it is documented in the
> > drm-usage-stats.rst, doesn't live in debugfs, and has some common plumbing
> > implemented both on the kernel side and for the aforementioned gputop /
> > igt_drm_fdinfo / igt_drm_clients. Where and how exactly TBD.
> 
> As soon as the new patch is merged, I'll go and reflect the driver uAPI changes
> in all three of these.

Would be good (and kinda proper per process rules) to implement the code
in at least e.g. gputop for this. To make sure it actually works for that
use-case, and there's not an oversight that breaks it all.
-Sima

> 
> > Regards,
> > 
> > Tvrtko
> > 
> 
> Cheers,
> Adrian
> 
> > > On 16.02.2024 17:43, Tvrtko Ursulin wrote:
> > > > 
> > > > On 16/02/2024 16:57, Daniel Vetter wrote:
> > > > > On Wed, Feb 14, 2024 at 01:52:05PM +0000, Steven Price wrote:
> > > > > > Hi Adrián,
> > > > > > 
> > > > > > On 14/02/2024 12:14, Adrián Larumbe wrote:
> > > > > > > A driver user expressed interest in being able to access engine usage stats
> > > > > > > through fdinfo when debugfs is not built into their kernel. In the current
> > > > > > > implementation, this wasn't possible, because it was assumed even for
> > > > > > > inflight jobs enabling the cycle counter and timestamp registers would
> > > > > > > incur in additional power consumption, so both were kept disabled until
> > > > > > > toggled through debugfs.
> > > > > > > 
> > > > > > > A second read of the TRM made me think otherwise, but this is something
> > > > > > > that would be best clarified by someone from ARM's side.
> > > > > > 
> > > > > > I'm afraid I can't give a definitive answer. This will probably vary
> > > > > > depending on implementation. The command register enables/disables
> > > > > > "propagation" of the cycle/timestamp values. This propagation will cost
> > > > > > some power (gates are getting toggled) but whether that power is
> > > > > > completely in the noise of the GPU as a whole I can't say.
> > > > > > 
> > > > > > The out-of-tree kbase driver only enables the counters for jobs
> > > > > > explicitly marked (BASE_JD_REQ_PERMON) or due to an explicit connection
> > > > > > from a profiler.
> > > > > > 
> > > > > > I'd be happier moving the debugfs file to sysfs rather than assuming
> > > > > > that the power consumption is small enough for all platforms.
> > > > > > 
> > > > > > Ideally we'd have some sort of kernel interface for a profiler to inform
> > > > > > the kernel what it is interested in, but I can't immediately see how to
> > > > > > make that useful across different drivers. kbase's profiling support is
> > > > > > great with our profiling tools, but there's a very strong connection
> > > > > > between the two.
> > > > > 
> > > > > Yeah I'm not sure whether a magic (worse probably per-driver massively
> > > > > different) file in sysfs is needed to enable gpu perf monitoring stats in
> > > > > fdinfo.
> > > > > 
> > > > > I get that we do have a bit a gap because the linux perf pmu stuff is
> > > > > global, and you want per-process, and there's kinda no per-process support
> > > > > for perf stats for devices. But that's probably the direction we want to
> > > > > go, not so much fdinfo. At least for hardware performance counters and
> > > > > things like that.
> > > > > 
> > > > > Iirc the i915 pmu support had some integration for per-process support,
> > > > > you might want to chat with Tvrtko for kernel side and Lionel for more
> > > > > userspace side. At least if I'm not making a complete mess and my memory
> > > > > is vaguely related to reality. Adding them both.
> > > > 
> > > > Yeah there are two separate things, i915 PMU and i915 Perf/OA.
> > > > 
> > > > If my memory serves me right I indeed did have a per-process support for i915
> > > > PMU implemented as an RFC (or at least a branch somewhere) some years back.
> > > > IIRC it only exposed the per engine GPU utilisation and did not find it very
> > > > useful versus the complexity. (I think it at least required maintaining a map
> > > > of drm clients per task.)
> > > > 
> > > > Our more useful profiling is using a custom Perf/OA interface (Observation
> > > > Architecture) which is possibly similar to kbase mentioned above. Why it is a
> > > > custom interface is explained in a large comment on top of i915_perf.c. Not
> > > > sure if all of them still hold but on the overall perf does not sound like the
> > > > right fit for detailed GPU profiling.
> > > > 
> > > > Also PMU drivers are very challenging to get the implementation right, since
> > > > locking model and atomicity requirements are quite demanding.
> > > > 
> > > >  From my point of view, at least it is my initial thinking, if custom per
> > > > driver solutions are strongly not desired, it could be interesting to look
> > > > into whether there is enough commonality, in at least concepts, to see if a
> > > > new DRM level common but extensible API would be doable. Even then it may be
> > > > tricky to "extract" enough common code to justify it.
> > > > 
> > > > Regards,
> > > > 
> > > > Tvrtko
> > > > 
> > > > > 
> > > > > Cheers, Sima
> > > > > 
> > > > > 
> > > > > > 
> > > > > > Steve
> > > > > > 
> > > > > > > Adrián Larumbe (1):
> > > > > > >     drm/panfrost: Always record job cycle and timestamp information
> > > > > > > 
> > > > > > >    drivers/gpu/drm/panfrost/Makefile           |  2 --
> > > > > > >    drivers/gpu/drm/panfrost/panfrost_debugfs.c | 21 ------------------
> > > > > > >    drivers/gpu/drm/panfrost/panfrost_debugfs.h | 14 ------------
> > > > > > >    drivers/gpu/drm/panfrost/panfrost_device.h  |  1 -
> > > > > > >    drivers/gpu/drm/panfrost/panfrost_drv.c     |  5 -----
> > > > > > >    drivers/gpu/drm/panfrost/panfrost_job.c     | 24 ++++++++-------------
> > > > > > >    drivers/gpu/drm/panfrost/panfrost_job.h     |  1 -
> > > > > > >    7 files changed, 9 insertions(+), 59 deletions(-)
> > > > > > >    delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
> > > > > > >    delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h
> > > > > > > 
> > > > > > > 
> > > > > > > base-commit: 6b1f93ea345947c94bf3a7a6e668a2acfd310918
> > > > > > 
> > > > > 
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
