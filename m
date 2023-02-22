Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7567A69F7F6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 16:33:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C954A10EA19;
	Wed, 22 Feb 2023 15:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9E810EA11;
 Wed, 22 Feb 2023 15:33:49 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-17211366c6aso9759296fac.13; 
 Wed, 22 Feb 2023 07:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1nu6rCRx8BzPVvb2CWdzEElkPQah8+J88HELeld+YLA=;
 b=Wphc6qJobqFKX/R9hxLWSRqUYLqCIkBJ9BNT3j7BIJPCaqPpD5iqF5q7gBYESFDmuR
 P4KfGycReyfa77pDknmdWebo6pO0H7/1JnxEDMRkVyAPcoRzQeVfulTcTdKnSVkngPiD
 m0fUIhEw1wgJ0kPtkA7ciybkV8eLzNr06i+6SMV/vfhkGh8bvq2ScmkXqtinejdaywaa
 Exr121oKnAUI1x74ead9IgiWgAz8wXpubPB41OqBPLCWW6yxqb3qG/2J+1RK/Cd8hDEY
 D1w2Wow+hBkgqI5vsVbuC+ee/gAET+FqqAM6SFOl0Gl4EMDbQfQB3l/4POydv0aeQW5i
 utdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1nu6rCRx8BzPVvb2CWdzEElkPQah8+J88HELeld+YLA=;
 b=o4V5rjg+5iNn9WP0bvM3wsf2MscmW2GcEz0T8qb1xBrGdm0/eoKk9+8/PsNyZWiJ2c
 wYRAOypd1eiA/D8uav7kwJfHIvbxf0dJwDiYviHyM+o4tTx5PHOyAp0NqwWEVCzcDu2s
 anPxHQ7vkIkzWuNum5pWz4vhbGXocxq0jY/64Xy6f0tQ8mgtB5vyEKUbtJL2QbC45Jfi
 eU+YZmSQiEcUL6W1UXCPeNgedGB1qgnG7B9c0Z/HUfq9YK6A8clIukS/V8+drITIiABQ
 3FzbTMW6kx1iyG6qiX5PCISt5qS2ZpQckCm7Y6GNPADlBY3zKH+W6K4ZoHK88YiKOieB
 TGEg==
X-Gm-Message-State: AO0yUKXLSXEwDGF1bivm0QzNa+FDoavODbxF/xKzpB3JzJpRuh4iNeX2
 U/6SXB8rKXMLJ3VY1ReidI3UU+QnwBRSf4ABwHc=
X-Google-Smtp-Source: AK7set+gQuDbWafhDm7u6AliJCO35H5q1p5/4Hk9MdyuvDjF06gmwwiuIqwaHVjevQFkdWNAtpfBcKvLTxoDDkTiGfM=
X-Received: by 2002:a05:6870:808d:b0:16e:8a56:d0d2 with SMTP id
 q13-20020a056870808d00b0016e8a56d0d2mr1360092oab.38.1677080028314; Wed, 22
 Feb 2023 07:33:48 -0800 (PST)
MIME-Version: 1.0
References: <20230220201916.1822214-1-robdclark@gmail.com>
 <20230220201916.1822214-10-robdclark@gmail.com>
 <20230221105307.7430c301@eldfell>
 <CAF6AEGtd_9JYtPU-AGmZY0My_d48rSSWQiD-efbR2KFxD-+tTA@mail.gmail.com>
 <20230222120904.5c281652@eldfell> <Y/YhKiuOHiX2LcyL@intel.com>
In-Reply-To: <Y/YhKiuOHiX2LcyL@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 22 Feb 2023 07:33:37 -0800
Message-ID: <CAF6AEGsEVFPTfUWQtw1B=QgdusgdqhsU+neShgT5iQn-UrdwjA@mail.gmail.com>
Subject: Re: [PATCH v5 09/14] drm/syncobj: Add deadline support for syncobj
 waits
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 22, 2023 at 6:06 AM Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> On Wed, Feb 22, 2023 at 12:09:04PM +0200, Pekka Paalanen wrote:
> > On Tue, 21 Feb 2023 09:25:18 -0800
> > Rob Clark <robdclark@gmail.com> wrote:
> >
> > > On Tue, Feb 21, 2023 at 12:53 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > > >
> > > > On Mon, 20 Feb 2023 12:18:56 -0800
> > > > Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > Add a new flag to let userspace provide a deadline as a hint for syncobj
> > > > > and timeline waits.  This gives a hint to the driver signaling the
> > > > > backing fences about how soon userspace needs it to compete work, so it
> > > > > can addjust GPU frequency accordingly.  An immediate deadline can be
> > > > > given to provide something equivalent to i915 "wait boost".
> > > > >
> > > > > v2: Use absolute u64 ns value for deadline hint, drop cap and driver
> > > > >     feature flag in favor of allowing count_handles==0 as a way for
> > > > >     userspace to probe kernel for support of new flag
> > > > >
> > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_syncobj.c | 59 +++++++++++++++++++++++++++--------
> > > > >  include/uapi/drm/drm.h        |  5 +++
> > > > >  2 files changed, 51 insertions(+), 13 deletions(-)
> > > >
> > > > ...
> > > >
> > > > > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > > > > index 642808520d92..aefc8cc743e0 100644
> > > > > --- a/include/uapi/drm/drm.h
> > > > > +++ b/include/uapi/drm/drm.h
> > > > > @@ -887,6 +887,7 @@ struct drm_syncobj_transfer {
> > > > >  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL (1 << 0)
> > > > >  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT (1 << 1)
> > > > >  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE (1 << 2) /* wait for time point to become available */
> > > > > +#define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE (1 << 3) /* set fence deadline based to deadline_nsec/sec */
> > > >
> > > > Hi,
> > > >
> > > > where is the UAPI documentation explaining what is a "fence deadline"
> > > > and what setting it does here?
> > >
> > > It's with the rest of the drm_syncobj UAPI docs ;-)
> >
> > Is that https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#dma-fence-uabi-sync-file ?
> >
> > That whole page never mentions e.g. WAIT_AVAILABLE, so at least the
> > flags are not there. Does not mention syncobj_wait either.

Sorry, that was a snarky reference to thin UABI docs about syncobj.
The kernel side of it is better documented.

> probably this:
> https://docs.kernel.org/gpu/drm-mm.html
>
> the new one needs to be added there as well.
>
> >
> > I could ask where the real non-IGT userspace is or the plan for it,
> > too, since this is new DRM UAPI.
>
> yeap, it looks like we need to close on this...
> https://gitlab.freedesktop.org/drm/intel/-/issues/8014
>
> I confess I got lost on the many discussions and on how this will
> be used. Is mesa going to set the deadline based on the vk priority?
>
> Will this continue to be internal? I didn't get the broader picture
> I'm afraid...

Yes, the plan is to use it from mesa vk-common helpers (and elsewhere
in mesa if needed).  There is a separate discussion[1] about
limiting/allowing boost (perhaps based on ctx flag or cgroups) but
that is more about how drivers react to the deadline hint.  The
immediate goal of this patch is just to fix the regression mentioned
in that gitlab issue when using syncobj waits instead of
DRM_IOCTL_I915_GEM_WAIT

BR,
-R

[1] https://www.spinics.net/lists/dri-devel/msg383075.html

> >
> >
> > Thanks,
> > pq
> >
> > >
> > > BR,
> > > -R
> > >
> > > > btw. no nsec/sec anymore.
> > > >
> > > >
> > > > Thanks,
> > > > pq
> > > >
> > > >
> > > > >  struct drm_syncobj_wait {
> > > > >       __u64 handles;
> > > > >       /* absolute timeout */
> > > > > @@ -895,6 +896,8 @@ struct drm_syncobj_wait {
> > > > >       __u32 flags;
> > > > >       __u32 first_signaled; /* only valid when not waiting all */
> > > > >       __u32 pad;
> > > > > +     /* Deadline hint to set on backing fence(s) in CLOCK_MONOTONIC: */
> > > > > +     __u64 deadline_ns;
> > > > >  };
> > > > >
> > > > >  struct drm_syncobj_timeline_wait {
> > > > > @@ -907,6 +910,8 @@ struct drm_syncobj_timeline_wait {
> > > > >       __u32 flags;
> > > > >       __u32 first_signaled; /* only valid when not waiting all */
> > > > >       __u32 pad;
> > > > > +     /* Deadline hint to set on backing fence(s) in CLOCK_MONOTONIC: */
> > > > > +     __u64 deadline_ns;
> > > > >  };
> > > > >
> > > > >
> > > >
> >
>
>
