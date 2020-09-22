Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D28A2742C4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 15:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0D86E101;
	Tue, 22 Sep 2020 13:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD95A6E101
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 13:18:17 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c18so17033434wrm.9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 06:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ulDXZe62cg9q0pWHvj25dMr9OefSQ2Lms8zz3fQsI8U=;
 b=U/9Qx3fjuwOeRopvo8mwBcOn7Uh9HK8xQz4PXypyHS9JILaivkcnO4MpfbR6TJOsEz
 irSTrtlfFtn1qfheG02tf6JKQ0RPzluPHYpGVP2xPpsq/q6tmxJXo6BCcL1yyGzm6RyT
 iuyO5dXyp/CMyWaRVDK/2LxiZ635Vkru4nHM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ulDXZe62cg9q0pWHvj25dMr9OefSQ2Lms8zz3fQsI8U=;
 b=aw41jzt9afIxd4ZchzNqPD5lVq5Bqq6wv8u1nYvQGmd5vJi1pz/p+IUUNJ3KphJcjH
 3ZNLwHZAaF+zg6yFKkoUtcDkQeLDlVqJyBBuw5fXuRSr9cGSSu8QA/y2KEG+sy5vqE1H
 HdSl3PXzECdk28BxYofIXDhUM60orSVGtb9E/81yos+s3iECCizXkw8BopsNu9WZotCQ
 nB4MPdNB1/j8k8ZJlaeYSGV6C6cC79BN17Ntr584To6wlIt9PtnJZ8itSGIw9PfRvcQX
 7/skKLWSBVQYTx0jS0WLP74VN6OcB22Wj/MHJh1ktqgayJWGRS6ws2vlpck9uT4IBEY6
 cA8Q==
X-Gm-Message-State: AOAM532aZf2sGKwO4E4OihQ1KeKYbYkHw0Ew8jZ3NOOdtDLi7L+A0tNe
 OfYx4LlgEqYpzPQ5gceFrVwGew==
X-Google-Smtp-Source: ABdhPJzLA0IJMNKNnPSjgdq+u8OKkX1pYrMrE0tYnSM5AzqPX9ycb4zFPC1OTcILhTxqMXMPMcgFhA==
X-Received: by 2002:adf:e7ce:: with SMTP id e14mr5188236wrn.43.1600780696311; 
 Tue, 22 Sep 2020 06:18:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c205sm4688134wmd.33.2020.09.22.06.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 06:18:15 -0700 (PDT)
Date: Tue, 22 Sep 2020 15:18:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 2/3] drm/atomic: Use kthread worker for nonblocking commits
Message-ID: <20200922131813.GL438822@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
 timmurray@google.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
References: <20200919193727.2093945-1-robdclark@gmail.com>
 <20200919193727.2093945-3-robdclark@gmail.com>
 <20200921092322.GK438822@phenom.ffwll.local>
 <CAF6AEGu9b_6NOk-PcZnpv3UCi_muYdrayCaA83me1RTGoU+jHw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGu9b_6NOk-PcZnpv3UCi_muYdrayCaA83me1RTGoU+jHw@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, timmurray@google.com,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 21, 2020 at 07:55:42AM -0700, Rob Clark wrote:
> On Mon, Sep 21, 2020 at 2:23 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Sat, Sep 19, 2020 at 12:37:25PM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > This will allow us to more easily switch scheduling rules based on what
> > > userspace wants.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> >
> > I still think switching to the highpriority systemwq as a start (like i915
> > already does) would be a good first step no matter what we end up doing
> > for the android thing.
> 
> highpri wq is probably better than the current state, but it doesn't
> really address the problem.  You'll still end up with surfaceflinger
> preempting commit_work..
> 
> And with non-RT priority, you'll still occasionally get lower priority
> threads which haven't had a chance to run for a while preempting you.

Sure the priority inversion is still there and needs a different fix. But
maybe it'll make everyone else at least a bit happier.

Plus it's really hard to make kms drivers rt, it's not really been part of
the design (nor are gpus really rt friendly, if they even can preempt it
generally takes forever compared to the deadline you might want for some
present work).
-Daniel
> 
> BR,
> -R
> 
> 
> > -Daniel
> >
> > > ---
> > >  drivers/gpu/drm/drm_atomic_helper.c | 13 ++++++++----
> > >  include/drm/drm_atomic.h            | 31 +++++++++++++++++++++++++++++
> > >  2 files changed, 40 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > > index 9e1ad493e689..75eeec5e7b10 100644
> > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > @@ -1659,11 +1659,11 @@ static void commit_tail(struct drm_atomic_state *old_state)
> > >       drm_atomic_state_put(old_state);
> > >  }
> > >
> > > -static void commit_work(struct work_struct *work)
> > > +static void commit_work(struct kthread_work *work)
> > >  {
> > >       struct drm_atomic_state *state = container_of(work,
> > >                                                     struct drm_atomic_state,
> > > -                                                   commit_work);
> > > +                                                   commit_kwork);
> > >       commit_tail(state);
> > >  }
> > >
> > > @@ -1797,6 +1797,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
> > >                            struct drm_atomic_state *state,
> > >                            bool nonblock)
> > >  {
> > > +     struct kthread_worker *worker = NULL;
> > >       int ret;
> > >
> > >       if (state->async_update) {
> > > @@ -1814,7 +1815,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
> > >       if (ret)
> > >               return ret;
> > >
> > > -     INIT_WORK(&state->commit_work, commit_work);
> > > +     kthread_init_work(&state->commit_kwork, commit_work);
> > >
> > >       ret = drm_atomic_helper_prepare_planes(dev, state);
> > >       if (ret)
> > > @@ -1857,8 +1858,12 @@ int drm_atomic_helper_commit(struct drm_device *dev,
> > >        */
> > >
> > >       drm_atomic_state_get(state);
> > > +
> > >       if (nonblock)
> > > -             queue_work(system_unbound_wq, &state->commit_work);
> > > +             worker = drm_atomic_pick_worker(state);
> > > +
> > > +     if (worker)
> > > +             kthread_queue_work(worker, &state->commit_kwork);
> > >       else
> > >               commit_tail(state);
> > >
> > > diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> > > index d07c851d255b..8d0ee19953df 100644
> > > --- a/include/drm/drm_atomic.h
> > > +++ b/include/drm/drm_atomic.h
> > > @@ -373,8 +373,18 @@ struct drm_atomic_state {
> > >        *
> > >        * Work item which can be used by the driver or helpers to execute the
> > >        * commit without blocking.
> > > +      *
> > > +      * This is deprecated, use commit_kwork.
> > >        */
> > >       struct work_struct commit_work;
> > > +
> > > +     /**
> > > +      * @commit_kwork:
> > > +      *
> > > +      * Work item which can be used by the driver or helpers to execute the
> > > +      * commit without blocking.
> > > +      */
> > > +     struct kthread_work commit_kwork;
> > >  };
> > >
> > >  void __drm_crtc_commit_free(struct kref *kref);
> > > @@ -954,6 +964,27 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
> > >                     (new_obj_state) = (__state)->private_objs[__i].new_state, 1); \
> > >            (__i)++)
> > >
> > > +/**
> > > + * drm_atomic_pick_worker - helper to get kworker to use for nonblocking commit
> > > + * @state: the &drm_atomic_state for the commit
> > > + *
> > > + * Pick an appropriate worker for a given atomic update.  The first CRTC
> > > + * invovled in the atomic update is used to pick the worker, to prevent
> > > + * serializing multiple pageflips / atomic-updates on indenpendent CRTCs.
> > > + */
> > > +static inline struct kthread_worker *
> > > +drm_atomic_pick_worker(const struct drm_atomic_state *state)
> > > +{
> > > +     struct drm_crtc_state *crtc_state;
> > > +     struct drm_crtc *crtc;
> > > +     unsigned i;
> > > +
> > > +     for_each_new_crtc_in_state(state, crtc, crtc_state, i)
> > > +             return crtc->worker;
> > > +
> > > +     return NULL;
> > > +}
> > > +
> > >  /**
> > >   * drm_atomic_crtc_needs_modeset - compute combined modeset need
> > >   * @state: &drm_crtc_state for the CRTC
> > > --
> > > 2.26.2
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
