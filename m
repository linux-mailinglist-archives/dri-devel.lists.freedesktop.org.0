Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C372392BD0
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 12:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E8616EE61;
	Thu, 27 May 2021 10:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285EC6EE61
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 10:28:02 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id l3so1303713ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 03:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=12c+/0i66ckNCCVePgN7YChrfgK+0bIHQeWAUYEBXU8=;
 b=BJ1H0e4OTKYFD8xgnnlGh8i7prZa8f8tvVcaIQtXlRoiuHTvbXKqMBgcU9a5QXBXug
 N4BPIs7KvGMy+VxM0PlEGB0gzzFt5xw6pqK5widehU4nRfyuyZZuLw2ZfEB/3kNvCwJV
 swf4yx1CJ7GtNFAEAWMBdlCUckmkIWG1H13jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=12c+/0i66ckNCCVePgN7YChrfgK+0bIHQeWAUYEBXU8=;
 b=URrafofM/X+LbNUWbtkrC5RtSiXJdEnues/8oGNoqXWvaexNPcs+HG2tk18KflmI6t
 d0JkKnNJkeyprucXJ4Sbkq0I7kQJ2HZ6MLimRgY6C4mzsNJ+mpjYgJIp7t5OOTOHxtuG
 YwKgzixTemttfNV+BLCZ5MgEQYLYpw0p4q1sX87n/V7tcVRWzU4n4XGypZRYoTKvS7+d
 MKF/tOd2W7mpeGJvdkKBQEp8DRavyEKFyx8nHOElTgz13z/YazzbT+hl5F16C8jtrK1F
 GDYGWcVCKXLgwTi5t69YbOufOa/GxC2OJrX6e8E5/jAR8xhSgNorOJmZCEY+kD/XQW5c
 VXRg==
X-Gm-Message-State: AOAM531QmohHfnTXkbgaFUzXvsz3IBuoxxmzjV/thP2KWnEru1WG04Sg
 uf+YlAf4WQtlBDfTuEki/ULleQ==
X-Google-Smtp-Source: ABdhPJwhxMJx6JlVYu9Uyv0rIol0pfnk6d3cN0IzqLJxG6vcIbcxfzUmSP6HH9Ka2oVO3q4IRB3T4A==
X-Received: by 2002:a17:906:794:: with SMTP id
 l20mr3162944ejc.192.1622111280828; 
 Thu, 27 May 2021 03:28:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id bh3sm780805ejb.19.2021.05.27.03.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 03:28:00 -0700 (PDT)
Date: Thu, 27 May 2021 12:27:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] Let userspace know if they can trust
 timeslicing by including it as part of the
 I915_PARAM_HAS_SCHEDULER::I915_SCHEDULER_CAP_TIMESLICING
Message-ID: <YK90LkRrMXTC/hF3@phenom.ffwll.local>
References: <20210525135508.244659-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20210525135508.244659-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <b9ae1daa-6add-1c67-58b4-16491f2e1431@linux.intel.com>
 <YK0OHJcSwWY1mm7v@phenom.ffwll.local>
 <8cf2c5f4-87a3-ce6b-150c-65fa054586a4@linux.intel.com>
 <YK9wrCayUwSDzMWG@phenom.ffwll.local>
 <59d2eee9-35c1-01fc-c226-50ad98aadb99@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59d2eee9-35c1-01fc-c226-50ad98aadb99@linux.intel.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: intel-gfx@lists.freedesktop.org,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, mahesh.meena@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 27, 2021 at 11:22:16AM +0100, Tvrtko Ursulin wrote:
> 
> On 27/05/2021 11:13, Daniel Vetter wrote:
> > On Wed, May 26, 2021 at 11:20:13AM +0100, Tvrtko Ursulin wrote:
> > > 
> > > On 25/05/2021 15:47, Daniel Vetter wrote:
> > > > On Tue, May 25, 2021 at 03:19:47PM +0100, Tvrtko Ursulin wrote:
> > > > > 
> > > > > + dri-devel as per process
> > > > > 
> > > > > On 25/05/2021 14:55, Tejas Upadhyay wrote:
> > > > > > v2: Only declare timeslicing if we can safely preempt userspace.
> > > > > 
> > > > > Commit message got butchered up somehow so you'll need to fix that at some
> > > > > point.
> > > > > 
> > > > > Regards,
> > > > > 
> > > > > Tvrtko
> > > > > 
> > > > > > Fixes: 8ee36e048c98 ("drm/i915/execlists: Minimalistic timeslicing")
> > > > > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > > > > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > > > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > > > ---
> > > > > >     drivers/gpu/drm/i915/gt/intel_engine_user.c | 1 +
> > > > > >     include/uapi/drm/i915_drm.h                 | 1 +
> > > > > >     2 files changed, 2 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > > > > > index 3cca7ea2d6ea..12d165566ed2 100644
> > > > > > --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > > > > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > > > > > @@ -98,6 +98,7 @@ static void set_scheduler_caps(struct drm_i915_private *i915)
> > > > > >     		MAP(HAS_PREEMPTION, PREEMPTION),
> > > > > >     		MAP(HAS_SEMAPHORES, SEMAPHORES),
> > > > > >     		MAP(SUPPORTS_STATS, ENGINE_BUSY_STATS),
> > > > > > +		MAP(TIMESLICE_BIT, TIMESLICING),
> > > > > >     #undef MAP
> > > > > >     	};
> > > > > >     	struct intel_engine_cs *engine;
> > > > > > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > > > > > index c2c7759b7d2e..af2212d6113c 100644
> > > > > > --- a/include/uapi/drm/i915_drm.h
> > > > > > +++ b/include/uapi/drm/i915_drm.h
> > > > > > @@ -572,6 +572,7 @@ typedef struct drm_i915_irq_wait {
> > > > > >     #define   I915_SCHEDULER_CAP_PREEMPTION	(1ul << 2)
> > > > > >     #define   I915_SCHEDULER_CAP_SEMAPHORES	(1ul << 3)
> > > > > >     #define   I915_SCHEDULER_CAP_ENGINE_BUSY_STATS	(1ul << 4)
> > > > > > +#define   I915_SCHEDULER_CAP_TIMESLICING	(1ul << 5)
> > > > 
> > > > Since this is uapi I think we should at least have some nice kerneldoc
> > > > that explains what exactly this is, what for (link to userspace) and all
> > > > that. Ideally also minimally filing in the gaps in our uapi docs for stuff
> > > > this references.
> > > 
> > > IIUC there is no userspace apart from IGT needing it not to fail scheduling
> > > tests on ADL.
> > > 
> > > Current tests use "has preemption + has semaphores" as a proxy to answer the
> > > "does the kernel support timeslicing" question. This stops working with the
> > > Guc backend because GuC decided not to support semaphores (for reasons yet
> > > unknown, see other thread), so explicit "has timeslicing" flag is needed in
> > > order for tests to know that GuC is supposed to support timeslicing, even if
> > > it doesn't use semaphores for inter-ring synchronisation.
> > 
> > Since this if for igt only: Cant we do just extend the check in igt with
> > an || GEN >= 12? I really hope that our future hw will continue to support
> > timeslicing ...
> 
> Not the gen 12 check, but possible I think. Explicit feature test would be better, but if definitely not allowed then along the lines of:
> 
> has_timeslicing =
> 	(has_preemption && has_semaphores) || uses_guc_submission;

That works too. Otoh what exactly is the "uses guc submission" flag and
why do we have that? I've seen media use it as a stand-in for "does the
kernel want bonded or parallel ctx?". Maybe another thing to check.

Another option, if you really think the feature flag is the best approach
(because future hw will drop timeslicing for some reason), then debugfs is
the place of igt-only api.
-Daniel

> 
> Regards,
> 
> Tvrtko
> > Also if it's not there yet, a shared helper to check for that (like we're
> > adding for relocations and stuff like that right now).
> > -Daniel
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
