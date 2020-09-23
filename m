Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EE7275480
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 11:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3846E12B;
	Wed, 23 Sep 2020 09:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784066E908
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 09:26:51 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id o8so18321867otl.4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 02:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fwy9i1khoLax7Hq0RUO99NG0b7ul7bbEQzOnfJCcIbQ=;
 b=UlyZU+HgWiO3UIcvpWl2oSGsC4e/ksDINGbPAM8WHyY3Kgho5zZluah6DwgzKjpKcQ
 FBlK7yWi6S6i+PZB5zHXUIRIHDX6AkrtBbI/GPzmGxpf9CmyEZDKy7bNoj51D68ca3oo
 PujGzLpArRKhpACmxQZgfBQkehApCAckq1KVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fwy9i1khoLax7Hq0RUO99NG0b7ul7bbEQzOnfJCcIbQ=;
 b=VQ8+fSGY5sfHL+JhUEK9aamDSKojihNFRjOBtdKx1mg1JH6ZvYGGCo9aXwnIfvhXML
 Zf7n8ZG8O4JQexePQ42iC2RwjJp27gKLewE1nnYhDWYK9tW40X0YZCW8TsJ3AHrfwUPM
 UCYB6KanL74H0PhHxHGqXzHTklGTqQaz+Iw7OevwC9Xy4LM2XBNC8ovUGKmDeUix7CEA
 dTPaZdHpjOteOJKDUlj2OlotBHJWPAagsSXgrZlJh04PJ8lNEfwzYh1D5zvfFJkuLpVg
 2WxjVnw+madrZGh2CDVJjXAZQquhCe5L7PC8mKFX+U7nKruzUyzWC/OiZqaNnbLxviTp
 srIw==
X-Gm-Message-State: AOAM53201OgiOBYeDBFt8A0PgdO9Gmuf1e+lzjsc+UROf+0oRM2Wt0ei
 xI3n4SBPjH4WrN9DYnMocpzIglshtwxcExSnGyyc8A==
X-Google-Smtp-Source: ABdhPJyJf/2ipzjDzTUbuzwUwjZNd9XcNNVSN3n3xKYP5sa9e1YgkcwA+GZU9AA4OeLZBswlQE31AGllTFWvEjpMF4A=
X-Received: by 2002:a05:6830:14d9:: with SMTP id
 t25mr5804565otq.188.1600853210764; 
 Wed, 23 Sep 2020 02:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200922181834.2913552-1-daniel.vetter@ffwll.ch>
 <20200923111717.68d9eb51@eldfell>
In-Reply-To: <20200923111717.68d9eb51@eldfell>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 23 Sep 2020 11:26:39 +0200
Message-ID: <CAKMK7uFvaMRK3Zh-s21OG=V3sPQZjn7Z_WQaNMcL=_R36enR2g@mail.gmail.com>
Subject: Re: [PATCH] drm: document and enforce rules around "spurious" EBUSY
 from atomic_commit
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable <stable@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm really not awake yet ...

On Wed, Sep 23, 2020 at 10:17 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Tue, 22 Sep 2020 20:18:34 +0200
> Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> > When doing an atomic modeset with ALLOW_MODESET drivers are allowed to
> > pull in arbitrary other resources, including CRTCs (e.g. when
> > reconfiguring global resources).
> >
> > But in nonblocking mode userspace has then no idea this happened,
> > which can lead to spurious EBUSY calls, both:
> > - when that other CRTC is currently busy doing a page_flip the
> >   ALLOW_MODESET commit can fail with an EBUSY
> > - on the other CRTC a normal atomic flip can fail with EBUSY because
> >   of the additional commit inserted by the kernel without userspace's
> >   knowledge
> >
> > For blocking commits this isn't a problem, because everyone else will
> > just block until all the CRTC are reconfigured. Only thing userspace
> > can notice is the dropped frames without any reason for why frames got
> > dropped.
> >
> > Consensus is that we need new uapi to handle this properly, but no one
> > has any idea what exactly the new uapi should look like. Since this
> > has been shipping for years already compositors need to deal no matter
> > what, so as a first step just try to enforce this across drivers
> > better with some checks.
> >
> > v2: Add comments and a WARN_ON to enforce this only when allowed - we
> > don't want to silently convert page flips into blocking plane updates
> > just because the driver is buggy.
> >
> > v3: Fix inverted WARN_ON (Pekka).
> >
> > v4: Drop the uapi changes, only add a WARN_ON for now to enforce some
> > rules for drivers.
>
> Dropped all addresses, because gmail refused to send this email
> otherwise.
>
> > ---
> >  drivers/gpu/drm/drm_atomic.c | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > index 58527f151984..ef106e7153a6 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -281,6 +281,10 @@ EXPORT_SYMBOL(__drm_atomic_state_free);
> >   * needed. It will also grab the relevant CRTC lock to make sure that the state
> >   * is consistent.
> >   *
> > + * WARNING: Drivers may only add new CRTC states to a @state if
> > + * drm_atomic_state.allow_modeset is set, or if it's a driver-internal commit
> > + * not created by userspace through an IOCTL call.
> > + *
> >   * Returns:
> >   *
> >   * Either the allocated state or the error code encoded into the pointer. When
> > @@ -1262,10 +1266,15 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
> >       struct drm_crtc_state *new_crtc_state;
> >       struct drm_connector *conn;
> >       struct drm_connector_state *conn_state;
> > +     unsigned requested_crtc = 0;
> > +     unsigned affected_crtc = 0;
> >       int i, ret = 0;
> >
> >       DRM_DEBUG_ATOMIC("checking %p\n", state);
> >
> > +     for_each_new_crtc_in_state(state, crtc, old_crtc_state, i)
> > +             requested_crtc |= drm_crtc_mask(crtc);
> > +
> >       for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
> >               ret = drm_atomic_plane_check(old_plane_state, new_plane_state);
> >               if (ret) {
> > @@ -1313,6 +1322,24 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
> >               }
> >       }
> >
> > +     for_each_new_crtc_in_state(state, crtc, old_crtc_state, i)
> > +             affected_crtc |= drm_crtc_mask(crtc);
> > +
> > +     /*
> > +      * For commits that allow modesets drivers can add other CRTCs to the
> > +      * atomic commit, e.g. when they need to reallocate global resources.
> > +      * This can cause spurious EBUSY, which robs compositors of a very
> > +      * effective sanity check for their drawing loop. Therefor only allow
> > +      * this for modeset commits.
> > +      *
> > +      * FIXME: Should add affected_crtc mask to the ATOMIC IOCTL as an output
> > +      * so compositors know what's going on.
>
> Hi,
>
> I think telling userspace the affected_crtc mask would only solve half
> of the problem: it would allow userspace to avoid attempting flips on
> the other affected CRTCs until this modeset is done, but it doesn't
> stop this non-blocking modeset from EBUSY'ing because other affected
> CRTCs are busy flipping.
>
> If the aim is to indicate userspace bugs with EBUSY, then EBUSY because
> of other CRTCs needs to be differentiable from EBUSY due to a mistake
> on this CRTC. Maybe the CRTC mask should instead be "conflicting/busy
> CRTCs", not simply "affected CRTCS"?
>
> Userspace might also be designed to always avoid modesets while any
> CRTC is busy flipping. In that case any EBUSY would be an indication of
> a (userspace) bug and a "busy CRTCs" mask could help pinpoint the issue.
>
> If userspace does a TEST_ONLY commit with a modeset on one CRTC and the
> driver pulls in another CRTC that is currently busy, will the test
> commit return with EBUSY?
>
> If yes, and *if* userspace is single-threaded wrt. to KMS updates,
> that might offer a way to work around it in userspace. But if userspace
> is flipping other CRTCs from other threads, TEST_ONLY commit does not
> help because another thread may cut in and make a CRTC busy.

This is not a legit programming model for atomic. An atomic commit is
always relative to the current state. If that state changes, then you
need to re-run your TEST_ONLY commit. So multiple threads changing
state in parallel isn't really a good idea anyway. Minimally we'd need
some kind of TEST_ONLY pile-up, so you can validate a change assuming
another commit has already happened. That's even harder than deep
queues on the commit side, we'd probably need full rollback of
commits.
-Daniel

>
>
> Thanks,
> pq
>
> > +      */
> > +     if (affected_crtc != requested_crtc) {
> > +             /* adding other CRTC is only allowed for modeset commits */
> > +             WARN_ON(!state->allow_modeset);
> > +     }
> > +
> >       return 0;
> >  }
> >  EXPORT_SYMBOL(drm_atomic_check_only);
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
