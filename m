Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE39A281B33
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 20:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5EA4897D0;
	Fri,  2 Oct 2020 18:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684D8891DD
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 18:54:13 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c18so2861674wrm.9
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 11:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5/L4wS1Rj/Pq+Rew1QXili0QIt0+toZW3mLlElIlkj8=;
 b=QhmM0SzrQ2OdlVYp6zAEMXScSUpg9JIWgC7MKge7VaWpOmO6h/ma2fXWsLOfk8QgSx
 /RaJas5cSxczC4VFx92fLeJqEvdKhxWJu0yZQ555mW5KDzSf1sbMgFHD5aFWS0pkFItv
 onQIL/ey+b8cD31ZFz51Z40kVrlS51BBIubss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5/L4wS1Rj/Pq+Rew1QXili0QIt0+toZW3mLlElIlkj8=;
 b=jLkt8se0+WGOKuJmv6e4Uv6xSu0tGkp8Ng8IeDJeJnFS+aBIKt+xGI9wCXHVaWO6q8
 jiw0siXEmRw5HgBrUolZQzRM2przRUUI7sBU8etKyuW+RY0zdRs5Li/Chc8Fyz71TK9/
 K3kqoSSlL+yudqUOCmHTLFF749OU6EpdPmi7IG30XYNtehbAlPpsTZVhjmNH3CQJaJsC
 9vbSAUNfSNeIhO0NjbQp/0Hnj9pjBH1Yl7VC0imHG91WSl9bx8YUbduYxMsOZ4+NT2WC
 ycbleffgwLeByRHs3WPpm+tu61zbIiSRlp6gLDbih0zCIMAuNUaYaFWBiyVi5o52YJiN
 iJbg==
X-Gm-Message-State: AOAM5319Gg4XBwzPO4TcZafMqx7k2N8qWTCksKUtm/L9ipiuqEw8cXKN
 8QmfgRxke0HZjyYZy3EDrEhFjw==
X-Google-Smtp-Source: ABdhPJwDJ6YGJDCtumMsQ9IWYMRhq5GW5RxG6ub7l55tD2outC4gJqj3MIzgwqqYEan3pzDIPT8a/Q==
X-Received: by 2002:a05:6000:1184:: with SMTP id
 g4mr4550569wrx.20.1601664851888; 
 Fri, 02 Oct 2020 11:54:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n2sm2959768wma.29.2020.10.02.11.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 11:54:10 -0700 (PDT)
Date: Fri, 2 Oct 2020 20:54:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [RFC PATCH] drm: add support for taking drm atomic state snapshot
Message-ID: <20201002185409.GO438822@phenom.ffwll.local>
References: <20201002014700.32085-1-abhinavk@codeaurora.org>
 <CAKMK7uHVSrATW=y2=UXHqRek97yvTiXHfDbRex25mRN36y1hSA@mail.gmail.com>
 <CAF6AEGupO7OyeUC8FqZpRmfw+=JXkk8jRzHF79DX+p5PnPyMtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGupO7OyeUC8FqZpRmfw+=JXkk8jRzHF79DX+p5PnPyMtQ@mail.gmail.com>
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
Cc: Tanmay Shah <tanmay@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, khsieh@codeaurora.org,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 aravindh@codeaurora.org, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 02, 2020 at 10:22:42AM -0700, Rob Clark wrote:
> On Fri, Oct 2, 2020 at 12:36 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Oct 2, 2020 at 3:47 AM Abhinav Kumar <abhinavk@codeaurora.org> wrote:
> > >
> > > Add support to capture the drm atomic state snapshot which
> > > can then be wired up with the devcoredump of the relevant display
> > > errors to give useful information to debug the issues.
> > >
> > > Since the devcoredump is read by usermode and it is allowed
> > > upto 5 minutes to read the coredump, capturing the snapshot that
> > > time will not result in an accurate result.
> > >
> > > Rather we should capture the snapshot right after the error
> > > happened. Hence add support for capturing this snapshot by
> > > re-using the drm_atomic_helper_duplicate_state() API to support
> > > a non-context version.
> > >
> > > Also add nolock versions of the drm_atomic_get_***_state() APIs
> > > which can be used to get snapshot of the drm atomic state of
> > > display drivers.
> > >
> > > Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> >
> > I guess this needs an example driver to show how this is used.
> 
> fwiw, I suggested to Abhinav to send this early as an RFC, while he
> finishes the rest of the driver part, just to get feedback on the
> approach.
> 
> The other option is to dump the state to a string buffer, and save
> that until userspace reads out the devcoredump.  This approach seems
> less awkward, and lets us re-use drm_coredump_printer.

Hm, I guess duplicating state is somewhat reasonable. Just make sure you
take the locks.

> > Another idea in this space is from Sean to implement a crash recorder
> > of all the drm debug information. Which iirc already includes atomic
> > state in some cases, but maybe not. The idea there was that userspace
> > would dump that recording when something unexpected happens, since
> > very often the kernel has no idea when something bad has happened, but
> > the userspace compositor is a bit more in the loop on such things. I
> > think ideally we have something that all fits together.
> 
> We actually already have Sean's drm_trace stuff in CrOS kernel, and use it.
> 
> But at least in our case, the hw has error reporting (ie. things like
> underflow irq's).. we want to use this to trigger dumping the current
> state, plus a bunch of error related registers.  The crash recorder
> plays a role in this, but errors reported from the hw are the trigger,
> and devcoredump is the mechanism.

Uh if this is for production error interrupts then I really don't think
the lockless games are a good idea. Laucnh a work and do it there, usually
nothing really is happening anyway. Or have a threaded interrupt handler.

> > The much bigger issue I'm seeing here is not taking locks. Ime that
> > just crashes the kernel harder, and makes debugging harder. Somewhat
> > ok for developer stuff in some cases, but devcoredump is more a
> > production thing afaiui, so really doesn't sound like a good idea to
> > me.
> 
> I suppose *holding* the locks is a bigger issue than acquiring the
> locks.. although it does mean it is not something we can do directly
> from an irq context.  Perhaps the driver part could be structured to
> read hw state immediately, and then schedule work to snapshot the
> atomic state.

You can't, except if we do horrible stuff like make the pointer exchange
exclude local interrupts, and then release the old memory with some kind
of rcu. Really doesn't feel worth the trouble. You might think "hey it's
only reading, that must be safe", but we're following all kinds of
pointers and stuff, and I don't really want to make all that code
perfectly paranoid and safe for lockless irq context with stuff
disappearing underneath it at any moment.

And yeah the various irq callers of drm_state_dump aren't nice, but right
now you need to at least opt-in, so fairly clear it's for developers.

That's at least my experience from deleting way too much code where people
thought they're lucky, they don't need locking.
-Daniel

> 
> BR,
> -R
> 
> > -Daniel
> >
> > > ---
> > >  drivers/gpu/drm/drm_atomic.c        | 154 ++++++++++++++++++----------
> > >  drivers/gpu/drm/drm_atomic_helper.c |  28 ++++-
> > >  include/drm/drm_atomic.h            |  10 ++
> > >  include/drm/drm_atomic_helper.h     |   2 +
> > >  4 files changed, 136 insertions(+), 58 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > > index 9ccfbf213d72..4e805157100b 100644
> > > --- a/drivers/gpu/drm/drm_atomic.c
> > > +++ b/drivers/gpu/drm/drm_atomic.c
> > > @@ -272,37 +272,23 @@ void __drm_atomic_state_free(struct kref *ref)
> > >  }
> > >  EXPORT_SYMBOL(__drm_atomic_state_free);
> > >
> > > -/**
> > > - * drm_atomic_get_crtc_state - get CRTC state
> > > - * @state: global atomic state object
> > > - * @crtc: CRTC to get state object for
> > > - *
> > > - * This function returns the CRTC state for the given CRTC, allocating it if
> > > - * needed. It will also grab the relevant CRTC lock to make sure that the state
> > > - * is consistent.
> > > - *
> > > - * Returns:
> > > - *
> > > - * Either the allocated state or the error code encoded into the pointer. When
> > > - * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
> > > - * entire atomic sequence must be restarted. All other errors are fatal.
> > > - */
> > > -struct drm_crtc_state *
> > > -drm_atomic_get_crtc_state(struct drm_atomic_state *state,
> > > -                         struct drm_crtc *crtc)
> > > +static struct drm_crtc_state *
> > > +__drm_atomic_get_crtc_state(struct drm_atomic_state *state,
> > > +               struct drm_crtc *crtc, bool take_lock)
> > >  {
> > >         int ret, index = drm_crtc_index(crtc);
> > >         struct drm_crtc_state *crtc_state;
> > >
> > > -       WARN_ON(!state->acquire_ctx);
> > > -
> > >         crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
> > >         if (crtc_state)
> > >                 return crtc_state;
> > >
> > > -       ret = drm_modeset_lock(&crtc->mutex, state->acquire_ctx);
> > > -       if (ret)
> > > -               return ERR_PTR(ret);
> > > +       if (take_lock) {
> > > +               WARN_ON(!state->acquire_ctx);
> > > +               ret = drm_modeset_lock(&crtc->mutex, state->acquire_ctx);
> > > +               if (ret)
> > > +                       return ERR_PTR(ret);
> > > +       }
> > >
> > >         crtc_state = crtc->funcs->atomic_duplicate_state(crtc);
> > >         if (!crtc_state)
> > > @@ -319,8 +305,37 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
> > >
> > >         return crtc_state;
> > >  }
> > > +
> > > +/**
> > > + * drm_atomic_get_crtc_state - get CRTC state
> > > + * @state: global atomic state object
> > > + * @crtc: CRTC to get state object for
> > > + *
> > > + * This function returns the CRTC state for the given CRTC, allocating it if
> > > + * needed. It will also grab the relevant CRTC lock to make sure that the state
> > > + * is consistent.
> > > + *
> > > + * Returns:
> > > + *
> > > + * Either the allocated state or the error code encoded into the pointer. When
> > > + * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
> > > + * entire atomic sequence must be restarted. All other errors are fatal.
> > > + */
> > > +struct drm_crtc_state *
> > > +drm_atomic_get_crtc_state(struct drm_atomic_state *state,
> > > +               struct drm_crtc *crtc)
> > > +{
> > > +       return __drm_atomic_get_crtc_state(state, crtc, true);
> > > +}
> > >  EXPORT_SYMBOL(drm_atomic_get_crtc_state);
> > >
> > > +struct drm_crtc_state *
> > > +drm_atomic_get_crtc_state_nl(struct drm_atomic_state *state,
> > > +               struct drm_crtc *crtc)
> > > +{
> > > +       return __drm_atomic_get_crtc_state(state, crtc, false);
> > > +}
> > > +
> > >  static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
> > >                                  const struct drm_crtc_state *new_crtc_state)
> > >  {
> > > @@ -445,30 +460,13 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
> > >         return 0;
> > >  }
> > >
> > > -/**
> > > - * drm_atomic_get_plane_state - get plane state
> > > - * @state: global atomic state object
> > > - * @plane: plane to get state object for
> > > - *
> > > - * This function returns the plane state for the given plane, allocating it if
> > > - * needed. It will also grab the relevant plane lock to make sure that the state
> > > - * is consistent.
> > > - *
> > > - * Returns:
> > > - *
> > > - * Either the allocated state or the error code encoded into the pointer. When
> > > - * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
> > > - * entire atomic sequence must be restarted. All other errors are fatal.
> > > - */
> > > -struct drm_plane_state *
> > > -drm_atomic_get_plane_state(struct drm_atomic_state *state,
> > > -                         struct drm_plane *plane)
> > > +static struct drm_plane_state *
> > > +__drm_atomic_get_plane_state(struct drm_atomic_state *state,
> > > +               struct drm_plane *plane, bool take_lock)
> > >  {
> > >         int ret, index = drm_plane_index(plane);
> > >         struct drm_plane_state *plane_state;
> > >
> > > -       WARN_ON(!state->acquire_ctx);
> > > -
> > >         /* the legacy pointers should never be set */
> > >         WARN_ON(plane->fb);
> > >         WARN_ON(plane->old_fb);
> > > @@ -478,9 +476,12 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
> > >         if (plane_state)
> > >                 return plane_state;
> > >
> > > -       ret = drm_modeset_lock(&plane->mutex, state->acquire_ctx);
> > > -       if (ret)
> > > -               return ERR_PTR(ret);
> > > +       if (take_lock) {
> > > +               WARN_ON(!state->acquire_ctx);
> > > +               ret = drm_modeset_lock(&plane->mutex, state->acquire_ctx);
> > > +               if (ret)
> > > +                       return ERR_PTR(ret);
> > > +       }
> > >
> > >         plane_state = plane->funcs->atomic_duplicate_state(plane);
> > >         if (!plane_state)
> > > @@ -506,8 +507,37 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
> > >
> > >         return plane_state;
> > >  }
> > > +
> > > +/**
> > > + * drm_atomic_get_plane_state - get plane state
> > > + * @state: global atomic state object
> > > + * @plane: plane to get state object for
> > > + *
> > > + * This function returns the plane state for the given plane, allocating it if
> > > + * needed. It will also grab the relevant plane lock to make sure that the state
> > > + * is consistent.
> > > + *
> > > + * Returns:
> > > + *
> > > + * Either the allocated state or the error code encoded into the pointer. When
> > > + * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
> > > + * entire atomic sequence must be restarted. All other errors are fatal.
> > > + */
> > > +struct drm_plane_state *
> > > +drm_atomic_get_plane_state(struct drm_atomic_state *state,
> > > +               struct drm_plane *plane)
> > > +{
> > > +       return __drm_atomic_get_plane_state(state, plane, true);
> > > +}
> > >  EXPORT_SYMBOL(drm_atomic_get_plane_state);
> > >
> > > +struct drm_plane_state *
> > > +drm_atomic_get_plane_state_nl(struct drm_atomic_state *state,
> > > +               struct drm_plane *plane)
> > > +{
> > > +       return __drm_atomic_get_plane_state(state, plane, false);
> > > +}
> > > +
> > >  static bool
> > >  plane_switching_crtc(const struct drm_plane_state *old_plane_state,
> > >                      const struct drm_plane_state *new_plane_state)
> > > @@ -939,19 +969,21 @@ EXPORT_SYMBOL(drm_atomic_get_new_connector_for_encoder);
> > >   * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
> > >   * entire atomic sequence must be restarted. All other errors are fatal.
> > >   */
> > > -struct drm_connector_state *
> > > -drm_atomic_get_connector_state(struct drm_atomic_state *state,
> > > -                         struct drm_connector *connector)
> > > +static struct drm_connector_state *
> > > +__drm_atomic_get_connector_state(struct drm_atomic_state *state,
> > > +struct drm_connector *connector, bool take_lock)
> > >  {
> > >         int ret, index;
> > >         struct drm_mode_config *config = &connector->dev->mode_config;
> > >         struct drm_connector_state *connector_state;
> > >
> > > -       WARN_ON(!state->acquire_ctx);
> > > -
> > > -       ret = drm_modeset_lock(&config->connection_mutex, state->acquire_ctx);
> > > -       if (ret)
> > > -               return ERR_PTR(ret);
> > > +       if (take_lock) {
> > > +               WARN_ON(!state->acquire_ctx);
> > > +               ret = drm_modeset_lock(&config->connection_mutex,
> > > +                               state->acquire_ctx);
> > > +               if (ret)
> > > +                       return ERR_PTR(ret);
> > > +       }
> > >
> > >         index = drm_connector_index(connector);
> > >
> > > @@ -999,8 +1031,22 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
> > >
> > >         return connector_state;
> > >  }
> > > +
> > > +struct drm_connector_state *
> > > +drm_atomic_get_connector_state(struct drm_atomic_state *state,
> > > +struct drm_connector *connector)
> > > +{
> > > +       return __drm_atomic_get_connector_state(state, connector, true);
> > > +}
> > >  EXPORT_SYMBOL(drm_atomic_get_connector_state);
> > >
> > > +struct drm_connector_state *
> > > +drm_atomic_get_connector_state_nl(struct drm_atomic_state *state,
> > > +               struct drm_connector *connector)
> > > +{
> > > +       return __drm_atomic_get_connector_state(state, connector, false);
> > > +}
> > > +
> > >  static void drm_atomic_connector_print_state(struct drm_printer *p,
> > >                 const struct drm_connector_state *state)
> > >  {
> > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > > index ea1926b5bb80..229dc41aedb9 100644
> > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > @@ -3140,13 +3140,18 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
> > >         if (!state)
> > >                 return ERR_PTR(-ENOMEM);
> > >
> > > -       state->acquire_ctx = ctx;
> > > +       if (ctx)
> > > +               state->acquire_ctx = ctx;
> > >         state->duplicated = true;
> > >
> > >         drm_for_each_crtc(crtc, dev) {
> > >                 struct drm_crtc_state *crtc_state;
> > >
> > > -               crtc_state = drm_atomic_get_crtc_state(state, crtc);
> > > +               if (ctx)
> > > +                       crtc_state = drm_atomic_get_crtc_state(state, crtc);
> > > +               else
> > > +                       crtc_state = drm_atomic_get_crtc_state_nl(state,
> > > +                                       crtc);
> > >                 if (IS_ERR(crtc_state)) {
> > >                         err = PTR_ERR(crtc_state);
> > >                         goto free;
> > > @@ -3156,7 +3161,11 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
> > >         drm_for_each_plane(plane, dev) {
> > >                 struct drm_plane_state *plane_state;
> > >
> > > -               plane_state = drm_atomic_get_plane_state(state, plane);
> > > +               if (ctx)
> > > +                       plane_state = drm_atomic_get_plane_state(state, plane);
> > > +               else
> > > +                       plane_state = drm_atomic_get_plane_state_nl(state,
> > > +                                       plane);
> > >                 if (IS_ERR(plane_state)) {
> > >                         err = PTR_ERR(plane_state);
> > >                         goto free;
> > > @@ -3167,7 +3176,12 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
> > >         drm_for_each_connector_iter(conn, &conn_iter) {
> > >                 struct drm_connector_state *conn_state;
> > >
> > > -               conn_state = drm_atomic_get_connector_state(state, conn);
> > > +               if (ctx)
> > > +                       conn_state = drm_atomic_get_connector_state(state,
> > > +                                       conn);
> > > +               else
> > > +                       conn_state = drm_atomic_get_connector_state_nl(state,
> > > +                                       conn);
> > >                 if (IS_ERR(conn_state)) {
> > >                         err = PTR_ERR(conn_state);
> > >                         drm_connector_list_iter_end(&conn_iter);
> > > @@ -3189,6 +3203,12 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
> > >  }
> > >  EXPORT_SYMBOL(drm_atomic_helper_duplicate_state);
> > >
> > > +struct drm_atomic_state *
> > > +drm_atomic_helper_snapshot_state(struct drm_device *dev)
> > > +{
> > > +       return drm_atomic_helper_duplicate_state(dev, NULL);
> > > +}
> > > +
> > >  /**
> > >   * drm_atomic_helper_suspend - subsystem-level suspend helper
> > >   * @dev: DRM device
> > > diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> > > index 1dc8af7671b7..85e43489e33d 100644
> > > --- a/include/drm/drm_atomic.h
> > > +++ b/include/drm/drm_atomic.h
> > > @@ -452,6 +452,16 @@ struct drm_connector_state * __must_check
> > >  drm_atomic_get_connector_state(struct drm_atomic_state *state,
> > >                                struct drm_connector *connector);
> > >
> > > +struct drm_crtc_state *
> > > +drm_atomic_get_crtc_state_nl(struct drm_atomic_state *state,
> > > +                         struct drm_crtc *crtc);
> > > +struct drm_plane_state *
> > > +drm_atomic_get_plane_state_nl(struct drm_atomic_state *state,
> > > +                          struct drm_plane *plane);
> > > +struct drm_connector_state *
> > > +drm_atomic_get_connector_state_nl(struct drm_atomic_state *state,
> > > +                              struct drm_connector *connector);
> > > +
> > >  void drm_atomic_private_obj_init(struct drm_device *dev,
> > >                                  struct drm_private_obj *obj,
> > >                                  struct drm_private_state *state,
> > > diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> > > index b268180c97eb..e6be47ba4834 100644
> > > --- a/include/drm/drm_atomic_helper.h
> > > +++ b/include/drm/drm_atomic_helper.h
> > > @@ -126,6 +126,8 @@ void drm_atomic_helper_shutdown(struct drm_device *dev);
> > >  struct drm_atomic_state *
> > >  drm_atomic_helper_duplicate_state(struct drm_device *dev,
> > >                                   struct drm_modeset_acquire_ctx *ctx);
> > > +struct drm_atomic_state *
> > > +drm_atomic_helper_snapshot_state(struct drm_device *dev);
> > >  struct drm_atomic_state *drm_atomic_helper_suspend(struct drm_device *dev);
> > >  int drm_atomic_helper_commit_duplicated_state(struct drm_atomic_state *state,
> > >                                               struct drm_modeset_acquire_ctx *ctx);
> > > --
> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > > a Linux Foundation Collaborative Project
> > >
> >
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
