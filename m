Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEAA69E5EA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 18:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1BD10E353;
	Tue, 21 Feb 2023 17:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A59510E8C2;
 Tue, 21 Feb 2023 17:25:29 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 a14-20020a056830100e00b00690ed91749aso1052788otp.7; 
 Tue, 21 Feb 2023 09:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZUZKbSoFWnuwReSERsoV9Wdb3OjgxSIYogm4tO3N2Ec=;
 b=FCO2AKwabY6RQETfbchne5LUaaKUFyRuhWeic6UgWM9TYRUqdmEXDWg+YnkSIN7DqN
 bMKG7zZzrZKez6XUtW4wEgNCNZl+3aSaf1yCtULjfRatInCvE2hyCD+itjyosC7WL35I
 PYoS6iK/4lVpTnTvAfGqnSaMYCTE4bzGaDjAayRep3N+4fcYigCDz7PAWMSvedSpLR5u
 LOJyY3cxtECh4FEjdA0gioaCXtUdQUQQA3nkcooqSm5vJ8gqF4clD4ciZ9K4M/y2kmgD
 1IuhInRzNKKQ9C7cAYJVlvH+iHFHh+c4kNn7izoXjUiXWQ7ClQ7GWmGlziFPzGaxfCpA
 BMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZUZKbSoFWnuwReSERsoV9Wdb3OjgxSIYogm4tO3N2Ec=;
 b=eSCCAn0TpBE+FX503xU9Dkhrqh8k4NG1GPuBtLFXviobw29meHxvW0lgvHWMKfxFxL
 oEX8C/vzusukyAZ5gysg6lEhKwXw71UqKS2pIhpsFoXnNfPzScVKZWxApy513UbB3PJL
 JnpAn8SAU48F/02R42309cP/fUWBqkJmmB9z9nFWKQo/7qyxOi2xzhcwotT4XIkGac+Q
 b7w30ABHyZEycOP4BRW7BTUEBnC6F3rKadpPtGKDm12jgf9I5PdvbiIp7yjsg54z8BWi
 nRUloi4VlINw1IZWDAYAPqDRGOQD296nK9m8yQADJYn8GQlFJezkAmTdhom45i7BH2DU
 R+Pw==
X-Gm-Message-State: AO0yUKU/5DcOwi550wStUsMCnKGun9idpJDRjxVHEtbszkgHofQN0Fzx
 NKzlDCejn4f0IyjXmxUvYOXDVlVt6Erz/RWX3Ak=
X-Google-Smtp-Source: AK7set9vcYOSX5l6mgud8fgzE8JUqk4DUkzH+ZWi+U1jbIq+VbE9nC8KygmQ3cxtQtOiMsmzIWlPynFvftfoLc5ra3o=
X-Received: by 2002:a05:6830:1c69:b0:690:d1dd:f62a with SMTP id
 o41-20020a0568301c6900b00690d1ddf62amr292386otg.7.1677000328646; Tue, 21 Feb
 2023 09:25:28 -0800 (PST)
MIME-Version: 1.0
References: <20230220201916.1822214-1-robdclark@gmail.com>
 <20230220201916.1822214-10-robdclark@gmail.com>
 <20230221105307.7430c301@eldfell>
In-Reply-To: <20230221105307.7430c301@eldfell>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 21 Feb 2023 09:25:18 -0800
Message-ID: <CAF6AEGtd_9JYtPU-AGmZY0My_d48rSSWQiD-efbR2KFxD-+tTA@mail.gmail.com>
Subject: Re: [PATCH v5 09/14] drm/syncobj: Add deadline support for syncobj
 waits
To: Pekka Paalanen <ppaalanen@gmail.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 21, 2023 at 12:53 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Mon, 20 Feb 2023 12:18:56 -0800
> Rob Clark <robdclark@gmail.com> wrote:
>
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Add a new flag to let userspace provide a deadline as a hint for syncobj
> > and timeline waits.  This gives a hint to the driver signaling the
> > backing fences about how soon userspace needs it to compete work, so it
> > can addjust GPU frequency accordingly.  An immediate deadline can be
> > given to provide something equivalent to i915 "wait boost".
> >
> > v2: Use absolute u64 ns value for deadline hint, drop cap and driver
> >     feature flag in favor of allowing count_handles==0 as a way for
> >     userspace to probe kernel for support of new flag
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_syncobj.c | 59 +++++++++++++++++++++++++++--------
> >  include/uapi/drm/drm.h        |  5 +++
> >  2 files changed, 51 insertions(+), 13 deletions(-)
>
> ...
>
> > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > index 642808520d92..aefc8cc743e0 100644
> > --- a/include/uapi/drm/drm.h
> > +++ b/include/uapi/drm/drm.h
> > @@ -887,6 +887,7 @@ struct drm_syncobj_transfer {
> >  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL (1 << 0)
> >  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT (1 << 1)
> >  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE (1 << 2) /* wait for time point to become available */
> > +#define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE (1 << 3) /* set fence deadline based to deadline_nsec/sec */
>
> Hi,
>
> where is the UAPI documentation explaining what is a "fence deadline"
> and what setting it does here?

It's with the rest of the drm_syncobj UAPI docs ;-)

BR,
-R

> btw. no nsec/sec anymore.
>
>
> Thanks,
> pq
>
>
> >  struct drm_syncobj_wait {
> >       __u64 handles;
> >       /* absolute timeout */
> > @@ -895,6 +896,8 @@ struct drm_syncobj_wait {
> >       __u32 flags;
> >       __u32 first_signaled; /* only valid when not waiting all */
> >       __u32 pad;
> > +     /* Deadline hint to set on backing fence(s) in CLOCK_MONOTONIC: */
> > +     __u64 deadline_ns;
> >  };
> >
> >  struct drm_syncobj_timeline_wait {
> > @@ -907,6 +910,8 @@ struct drm_syncobj_timeline_wait {
> >       __u32 flags;
> >       __u32 first_signaled; /* only valid when not waiting all */
> >       __u32 pad;
> > +     /* Deadline hint to set on backing fence(s) in CLOCK_MONOTONIC: */
> > +     __u64 deadline_ns;
> >  };
> >
> >
>
