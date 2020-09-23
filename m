Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E023F275432
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 11:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C801C6E11A;
	Wed, 23 Sep 2020 09:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7AC6E11A
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 09:16:22 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id o8so18299243otl.4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 02:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xx0elKkoqWt7m+sCqzFWJsTw/Aq7bHK/TIsEYQIB+Kw=;
 b=Kda1GqkfVMWLKwtHkGejsRapj3CscIBeM63GCgpNfbguApi3aJegx7lRDECtlhvtM6
 cpvdg4qCsObLab+1sj7k4OcgQ5VhQ3Uje5FAk/U66q9FlFGFDYo/+Zt8NlnHJ+tMLiCB
 hUO2r8x7vwtOzK80zcBtGdY12RAGRChzDFiGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xx0elKkoqWt7m+sCqzFWJsTw/Aq7bHK/TIsEYQIB+Kw=;
 b=twsG0CKiZY/moPyf7HCxCB/UeDXj+eqF8i9KZdd8t4mjOgOuomNf55pnfLxIDbwG+5
 Y+33H0AL8UF5L8YLRmKsf4l1otcmjtcS3c6ZIIDI+qO3sQpY47PEiqKqhXezyaVG/jss
 x/UWbjAKcoALlw3RqT9R1Oba8SP8DTZe4JJikFVkksfecVqLoRFL3toBL/1xIbwYLSlf
 MsWeLqpQcKu4NJL+WktzybKX5gea3GhZqkCHRMRf+9+lo/gkm7DAZ8idq6Ib6/qUAcmD
 BVd9LaDequENgpe7k8I50i4K/j76fkQtCwzaz882hLMEy44XlcrqTVRrx7V4A3Fm+JLh
 z/tA==
X-Gm-Message-State: AOAM531LwCgnBzTbzkEq9LZ5ES/M54p7GMP50Ev7F6F2LJUzKHgcJ3G5
 E17MQoVjdbpLKAAUwrUr5a5Ko9k9SzFHKiKJuGf5Fg==
X-Google-Smtp-Source: ABdhPJwCztWczfYQgjICqeAPa0u/oulXSCDaMET7lWOtt0q6htifXm+6w9u41E2ol9CyiZNqPJhaL5xEPPsNNGr5QWU=
X-Received: by 2002:a05:6830:14d9:: with SMTP id
 t25mr5782676otq.188.1600852582007; 
 Wed, 23 Sep 2020 02:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200922181834.2913552-1-daniel.vetter@ffwll.ch>
 <20200923111717.68d9eb51@eldfell>
In-Reply-To: <20200923111717.68d9eb51@eldfell>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 23 Sep 2020 11:16:11 +0200
Message-ID: <CAKMK7uF02DVRm9cEOnVbSQVXiOqk0_pFdDbX2igae1gfREK1GQ@mail.gmail.com>
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

You'd also get this from TEST_ONLY commit, so userspace can:
- wait for any affected crtc to complete out their pending updates,
which avoids the EBUSY
- do a blocking modeset (which avoids the EBUSY since it stalls either way)
- insert a note into it's per-crtc draw loop/tracking that there will
be another event inserted by the kernel that needs to be waited on

As long as this doesn't race with any other atomic commit or
processing the event queue, this should be race free. And allow you to
handle spurious EBUSY both here because of other pending flips, and in
the next atomic flips because of this commit here.

Also I don't think the kernel needs to tell you which of these crtc
are busy, since userspace knows that (by tracking outstanding events).
Plus that information is racy anyway, you'll just have to synchronize
with your drm event processing.
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
