Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7A020B2D9
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 15:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8DE6EC9E;
	Fri, 26 Jun 2020 13:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BAF6EC9D
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 13:46:46 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f18so1511558wrs.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JnmhWsqMZmydU3bW6sByEonvR0pfK7HW3y6U5yzw87o=;
 b=P8oPqY82WyqVX4drM174PT9q8EYMgvfFsEcgrnbSkPSsjS4A1uTOQnXNZ0wPkUYW7Z
 SbuCD8Ytoati0GJgSyewKCHbi/Asf8aMVvDj/jFVkBWclubWfm0lJ5mZaV/kld8u63c3
 Q079OUbf8XWVmBD32Y/m1wfn34ijzuFUE8f6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JnmhWsqMZmydU3bW6sByEonvR0pfK7HW3y6U5yzw87o=;
 b=MpNBvYq2iOXKF2p+RNlEK4OhJxHIwkNTcTE+4AdW4Ba3Ris/FmGXavtzluZ3JK9/Ag
 f5GZEjhIOZJVRJOAZ5PuC+eUIy4sXtoRiKBBcOB6vKbqDs5+p4m7EcY7fXXrhYBGmUTg
 4kI+X7RtIh7504/aBoaqrJGz34YfuFTJ4/+B38wVvgPuEiDoWp9oH14KhoFzwy0Ysrzs
 DbThcqPBVoe4JZSMhcQKe5Np5pylQEIjcRMrgbn9WZvNmY48cMXRKY1HXB4W2xsht14q
 FYZLU4jghyYr6+xADF6LtHANb9XMfmcXbTJSlhhma+SeqDYjUBm2aTx9qpT3H31hMZSM
 +6Kg==
X-Gm-Message-State: AOAM533S13W6x9RBNK8Pvf+PXvmi5PK8wOSQ8tK/7EuWGZuC025MTlz5
 jTH4krRnhuXI7630tLVLLWbilg==
X-Google-Smtp-Source: ABdhPJwJBLS5pL1KkwPxrFNboOb9nNtI6xLi+Us82bFi4xx0WAH2BkYpcbfMQDYRGoIQodviPe3mWw==
X-Received: by 2002:a5d:6846:: with SMTP id o6mr3844132wrw.370.1593179204812; 
 Fri, 26 Jun 2020 06:46:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g3sm41403548wrb.46.2020.06.26.06.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 06:46:44 -0700 (PDT)
Date: Fri, 26 Jun 2020 15:46:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/atomic_helper: duplicate state for drm_private_obj
Message-ID: <20200626134642.GF3278063@phenom.ffwll.local>
References: <20200625115746.13396-1-shawnguo@kernel.org>
 <CAKMK7uGoDnizoE4t47houeyK2y5sLQbvCM3LDMWcEeV3oB5rPA@mail.gmail.com>
 <CAF6AEGuaFFxWSqYDXE0XukeQHOS7H5s6E8WfjVS7EfotWfZmQA@mail.gmail.com>
 <CAKMK7uHDYSZBBKByxgaAhQMEs0gFmKe_QUCZsqt5wcgYZFYcOQ@mail.gmail.com>
 <CAF6AEGs8vyFrNoGYTDaf81f28CkFqQsaqhAHrW3nBuHBzRCf7g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGs8vyFrNoGYTDaf81f28CkFqQsaqhAHrW3nBuHBzRCf7g@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 25, 2020 at 09:24:38AM -0700, Rob Clark wrote:
> On Thu, Jun 25, 2020 at 8:55 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > On Thu, Jun 25, 2020 at 4:17 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Thu, Jun 25, 2020 at 5:35 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > >
> > > > On Thu, Jun 25, 2020 at 1:58 PM Shawn Guo <shawnguo@kernel.org> wrote:
> > > > >
> > > > > From: Shawn Guo <shawn.guo@linaro.org>
> > > > >
> > > > > The msm/mdp5 driver uses drm_private_obj as its global atomic state,
> > > > > which keeps the assignment of hwpipe to plane.  With drm_private_obj
> > > > > missing from duplicate state call, mdp5 suspend works with no problem
> > > > > only for the very first time.  Any subsequent suspend will hit the
> > > > > following warning, because hwpipe assignment doesn't get duplicated for
> > > > > suspend state.  Adding drm_private_obj handling for duplicate state call
> > > > > fixes the problem.
> > > >
> > > > If the driver needs a private state, it's supposed to duplicate that
> > > > in its atomic_check functionality. This isn't the helper's job.
> > > >
> > > > If this is a bug in msm code, then pretty sure if you try hard enough,
> > > > you can hit the exact same bug from userspace too. Maybe good idea to
> > > > try and reproduce this with igt or something.
> > >
> > > The problem is how duplicate_state is used by the atomic
> > > suspend/resume helpers.  They duplicate the running state on suspend,
> > > forgetting to duplicate the global state.  Then everything is
> > > disabled, the driver correctly duplicates and updates it's global
> > > atomic state releasing the hwpipe.
> > >
> > > But then on resume, we are re-applying plane state that thinks it
> > > already has a hwpipe assigned (because that is part of the plane state
> > > that was duplicated), without reapplying the matching global state.
> > >
> > > On a normal atomic commit, we would duplicate the plane state that has
> > > the hwpipe disabled, which would be in sync with the drivers global
> > > state.  But since that is not what the atomic resume helper does, we
> > > hit the situation where the plane state and the global state are out
> > > of sync.
> > >
> > > So the driver is dtrt, the problem really is with the helpers.  I
> > > think this patch is the right thing to do.  It is incorrect for the
> > > suspend/resume helpers to assume that they can re-apply duplicated
> > > state without including the global state.
> >
> > Hm, this is a bit awkward. Generally the assumption is that you should
> > be recomputing the derived state (like hwpipe) no matter what. If your
> > driver doesn't do that, then all kinds of things can leak from the
> > pre-resume to the post-resume side of things, that's kinda why I'm not
> > thrilled with this patch, I think it has good potential to open up a
> > can of worms. Iirc this patch has come up in the past, and in those
> > cases it was a driver bug.
> >
> > For this case, why is msm reusing a hw pipe assignment of a disabled plane?
> 
> Because it is part of the plane state that is being restored.
> 
> Since resume uses the old state saved before the
> drm_atomic_helper_disable_all(), rather than duplicating the current
> state, we end up with this mismatch between global and plane state.  I
> think stashing away the old state is probably ok, but we can't just do
> it piecemeal without including the global state.
> 
> I suppose part of the problem is the hwpipe (and other such
> dynamically assigned resources) touch both private and plane (and
> crtc) state.  The global state object knows which resources are
> assigned to which plane/crtc.  But the plane/crtc state knows which of
> the (potentially) two hwpipe/mixers is "left" (primary) and "right"
> (secondary).

Yeah I get all that, what I meant is: Why don't you just blindly recompute
the hwpipe assignment every time a full modeset is done? Caching it for
pure plane flips makes sense, but drm_crtc_needs_modset == true and just
throw it all overboard and assign new ones I think would also solve this
problem. Since the hwpipe global state would indicate that all pipes are
unallocated that should work (I hope).

Imo just recomputing state is a good atomic pattern, it avoids drivers
getting stuck in a corner somewhere you can't reset them out of anymore.

My question here was, why can't you do that?

> > Unfortunately we can't copy the drm state into the overall structure
> > to solve this, since that would miss driver-private properties. So
> > unfortunately we can't make this match a real atomic commit from
> > userspace perfectly.
> 
> I'm not sure I understand this?  The driver private properties
> would/should be part of one of the state objs (plane/crtc/global)?  If
> the atomic state (including global) represents the entirety of the hw
> state, you should be able to stash off N different versions of them
> and re-apply them in any order you want because they are all
> self-consistent.

So for normal atomic commit we have:

1. duplicate current state
2. set properties

But for resume helpers it's some random older state, so the expectations
break a bit. We could approximate that using something like:

1. duplicate current state into curr_state
2. set properties using a memcpy of the drm core state structure, leaving
the driver private stuff as-is.

But a) there's also some non-property state in drm state structures and b)
properties which are driver extensions and set into the driver part of the
state would get lost.

So also not great.

> > Another option would be if msm just copies the private state it needs
> > to not go boom.
> >
> > Doing this unconditionally might break other drivers that rely on
> > private state not being duplicated, but I guess that would also be
> > somewhat of a driver bug.
> 
> I guess we could duplicate our own version of
> drm_atomic_helper_suspend().. or maybe add a 'duplicate_global' param
> to drm_atomic_helper_suspend().
> 
> I'm not too sure how many drivers these days are using global atomic
> state, so not sure how many would be potentially broken, but opting in
> to duplicating global state seems reasonable if necessary.

dp mst uses it to track it's stuff at least, and I think it's spreading
quite a bit into drivers using them to track all kinds of things, not just
a single global state.
-Daniel

> 
> BR,
> -R
> 
> > -Daniel
> >
> > >
> > > BR,
> > > -R
> > >
> > > > -Daniel
> > > >
> > > >
> > > > > $ echo mem > /sys/power/state
> > > > > [   38.111144] PM: suspend entry (deep)
> > > > > [   38.111185] PM: Syncing filesystems ... done.
> > > > > [   38.114630] Freezing user space processes ... (elapsed 0.001 seconds) done.
> > > > > [   38.115912] OOM killer disabled.
> > > > > [   38.115914] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> > > > > [   38.122170] ------------[ cut here ]------------
> > > > > [   38.122212] WARNING: CPU: 0 PID: 1747 at drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c:145 mdp5_pipe_release+0x90/0xc0
> > > > > [   38.122215] Modules linked in:
> > > > > [   38.122222] CPU: 0 PID: 1747 Comm: sh Not tainted 4.19.107-00515-g9d5e4d7a33ed-dirty #323
> > > > > [   38.122224] Hardware name: Square, Inc. T2 Devkit (DT)
> > > > > [   38.122228] pstate: 40000005 (nZcv daif -PAN -UAO)
> > > > > [   38.122230] pc : mdp5_pipe_release+0x90/0xc0
> > > > > [   38.122233] lr : mdp5_pipe_release+0x90/0xc0
> > > > > [   38.122235] sp : ffff00000d13b7f0
> > > > > [   38.122236] x29: ffff00000d13b7f0 x28: 0000000000000000
> > > > > [   38.122240] x27: 0000000000000002 x26: ffff800079adce00
> > > > > [   38.122243] x25: ffff800079405200 x24: 0000000000000000
> > > > > [   38.122246] x23: ffff80007a78cc08 x22: ffff80007b1cc018
> > > > > [   38.122249] x21: ffff80007b1cc000 x20: ffff80007b317080
> > > > > [   38.122252] x19: ffff80007a78ce80 x18: 0000000000020000
> > > > > [   38.122255] x17: 0000000000000000 x16: 0000000000000000
> > > > > [   38.122258] x15: 00000000fffffff0 x14: ffff000008c3fb48
> > > > > [   38.122261] x13: ffff000008cdac4a x12: ffff000008c3f000
> > > > > [   38.122264] x11: 0000000000000000 x10: ffff000008cda000
> > > > > [   38.122267] x9 : 0000000000000000 x8 : ffff000008ce4a40
> > > > > [   38.122269] x7 : 0000000000000000 x6 : 0000000039ea41a9
> > > > > [   38.122272] x5 : 0000000000000000 x4 : 0000000000000000
> > > > > [   38.122275] x3 : ffffffffffffffff x2 : c7580c109cae4500
> > > > > [   38.122278] x1 : 0000000000000000 x0 : 0000000000000024
> > > > > [   38.122281] Call trace:
> > > > > [   38.122285]  mdp5_pipe_release+0x90/0xc0
> > > > > [   38.122288]  mdp5_plane_atomic_check+0x2c0/0x448
> > > > > [   38.122294]  drm_atomic_helper_check_planes+0xd0/0x208
> > > > > [   38.122298]  drm_atomic_helper_check+0x38/0xa8
> > > > > [   38.122302]  drm_atomic_check_only+0x3e8/0x630
> > > > > [   38.122305]  drm_atomic_commit+0x18/0x58
> > > > > [   38.122309]  __drm_atomic_helper_disable_all.isra.12+0x15c/0x1a8
> > > > > [   38.122312]  drm_atomic_helper_suspend+0x80/0xf0
> > > > > [   38.122316]  msm_pm_suspend+0x4c/0x70
> > > > > [   38.122320]  dpm_run_callback.isra.6+0x20/0x68
> > > > > [   38.122323]  __device_suspend+0x110/0x308
> > > > > [   38.122326]  dpm_suspend+0x100/0x1f0
> > > > > [   38.122329]  dpm_suspend_start+0x64/0x70
> > > > > [   38.122334]  suspend_devices_and_enter+0x110/0x500
> > > > > [   38.122336]  pm_suspend+0x268/0x2c0
> > > > > [   38.122339]  state_store+0x88/0x110
> > > > > [   38.122345]  kobj_attr_store+0x14/0x28
> > > > > [   38.122352]  sysfs_kf_write+0x3c/0x50
> > > > > [   38.122355]  kernfs_fop_write+0x118/0x1e0
> > > > > [   38.122360]  __vfs_write+0x30/0x168
> > > > > [   38.122363]  vfs_write+0xa4/0x1a8
> > > > > [   38.122366]  ksys_write+0x64/0xe8
> > > > > [   38.122368]  __arm64_sys_write+0x18/0x20
> > > > > [   38.122374]  el0_svc_common+0x6c/0x178
> > > > > [   38.122377]  el0_svc_compat_handler+0x1c/0x28
> > > > > [   38.122381]  el0_svc_compat+0x8/0x18
> > > > > [   38.122383] ---[ end trace 24145b7d8545345b ]---
> > > > > [   38.491552] Disabling non-boot CPUs ...
> > > > >
> > > > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_atomic_helper.c | 16 ++++++++++++++++
> > > > >  1 file changed, 16 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > > > > index 85d163f16801..024985a92156 100644
> > > > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > > > @@ -3140,6 +3140,7 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
> > > > >         struct drm_atomic_state *state;
> > > > >         struct drm_connector *conn;
> > > > >         struct drm_connector_list_iter conn_iter;
> > > > > +       struct drm_private_obj *priv_obj;
> > > > >         struct drm_plane *plane;
> > > > >         struct drm_crtc *crtc;
> > > > >         int err = 0;
> > > > > @@ -3184,6 +3185,16 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
> > > > >         }
> > > > >         drm_connector_list_iter_end(&conn_iter);
> > > > >
> > > > > +       drm_for_each_privobj(priv_obj, dev) {
> > > > > +               struct drm_private_state *priv_state;
> > > > > +
> > > > > +               priv_state = drm_atomic_get_private_obj_state(state, priv_obj);
> > > > > +               if (IS_ERR(priv_state)) {
> > > > > +                       err = PTR_ERR(priv_state);
> > > > > +                       goto free;
> > > > > +               }
> > > > > +       }
> > > > > +
> > > > >         /* clear the acquire context so that it isn't accidentally reused */
> > > > >         state->acquire_ctx = NULL;
> > > > >
> > > > > @@ -3278,6 +3289,8 @@ int drm_atomic_helper_commit_duplicated_state(struct drm_atomic_state *state,
> > > > >         struct drm_connector_state *new_conn_state;
> > > > >         struct drm_crtc *crtc;
> > > > >         struct drm_crtc_state *new_crtc_state;
> > > > > +       struct drm_private_state *new_priv_state;
> > > > > +       struct drm_private_obj *priv_obj;
> > > > >
> > > > >         state->acquire_ctx = ctx;
> > > > >
> > > > > @@ -3290,6 +3303,9 @@ int drm_atomic_helper_commit_duplicated_state(struct drm_atomic_state *state,
> > > > >         for_each_new_connector_in_state(state, connector, new_conn_state, i)
> > > > >                 state->connectors[i].old_state = connector->state;
> > > > >
> > > > > +       for_each_new_private_obj_in_state(state, priv_obj, new_priv_state, i)
> > > > > +               state->private_objs[i].old_state = priv_obj->state;
> > > > > +
> > > > >         ret = drm_atomic_commit(state);
> > > > >
> > > > >         state->acquire_ctx = NULL;
> > > > > --
> > > > > 2.17.1
> > > > >
> > > >
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> >
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
