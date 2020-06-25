Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED47920A0B6
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 16:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7B16EB46;
	Thu, 25 Jun 2020 14:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B6C6EB46
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 14:17:14 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id cy7so4337151edb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 07:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cdctTPCjofPW/Ta/A9vkWBzY7n4XOH3deCFtDx9USSw=;
 b=Zu6dFeCGBgJVUya4NOJ79BFnuOqKW/MeF8Uq0OHHLi3UtLEeEN3ZacFpGETOvE50iy
 XrOMigqObeJyTLV42EdQPTU/zbg6nRKLoOWoHuiBXK8Qig4r2Z/2L9IUlULaVzbNsj+I
 Y6ByW9O6Pn0DE0BwO3YicPPgWFN6bWy4EeUFPYSXTYDRyd8oXt8BoUpXwYJbHOg2vjk6
 mAVNWyafGlJKgZIM5AySEjko7hgyezqE6ztfi5WSFntH3p24U+j8w9S2eVyvKWxCnL1T
 EtdBUohwd2qiif0c4L0PXLs+g4lFWlK2lRix4u3dEbCYM3PXXCwwVDbB61Ijs/Hro25G
 W8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cdctTPCjofPW/Ta/A9vkWBzY7n4XOH3deCFtDx9USSw=;
 b=kNKr1hJeHxaSb7C6tXXTEoZExhev6JSmQENsUN/omCrsqlARaOFkLskKWgUHvPMc/C
 FEB8jj0aF4hQL2isjhCVsMrc0w8E/ZGgMqMDSkJ2KPIsnKMXImVEVxEB1gT+7hQo1xhp
 WmVvMCq2H8Cr+lsso/5T+ZSmPYgQgxeyf3/Es6sVcsyC06G0jz8r4S/GU+P3kFpYB8xs
 tycl5VsOSiuf2e8VkHhLB3eHrBcPyMSIhlr07rHPukjgWj/1mrgQrflm/XGLihTUdVuT
 ZcQZx+/+FinL6g+JmW36/EZWLLS48j0yMD20HcUz8VbMmgAat1yaulATGPDJoOZWPaa3
 auyQ==
X-Gm-Message-State: AOAM532hNET30hArTO2jLzA6hqowcJBAN1NB5CrV2l7H/hVNEwWHp2LZ
 BqViZD4nTnj3RoKOPt66mZEI5v1RI2LbZgn+p4E=
X-Google-Smtp-Source: ABdhPJyFxoVEIoyWhGQnR3z/YgDaTwDfxr+poZm78l9xLER68fng5o4s3fI+HNgXsHARB76sl5L2YRxpiNHSOKaCrMQ=
X-Received: by 2002:a05:6402:1512:: with SMTP id
 f18mr32934277edw.101.1593094633460; 
 Thu, 25 Jun 2020 07:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200625115746.13396-1-shawnguo@kernel.org>
 <CAKMK7uGoDnizoE4t47houeyK2y5sLQbvCM3LDMWcEeV3oB5rPA@mail.gmail.com>
In-Reply-To: <CAKMK7uGoDnizoE4t47houeyK2y5sLQbvCM3LDMWcEeV3oB5rPA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 25 Jun 2020 07:17:42 -0700
Message-ID: <CAF6AEGuaFFxWSqYDXE0XukeQHOS7H5s6E8WfjVS7EfotWfZmQA@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic_helper: duplicate state for drm_private_obj
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 25, 2020 at 5:35 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Thu, Jun 25, 2020 at 1:58 PM Shawn Guo <shawnguo@kernel.org> wrote:
> >
> > From: Shawn Guo <shawn.guo@linaro.org>
> >
> > The msm/mdp5 driver uses drm_private_obj as its global atomic state,
> > which keeps the assignment of hwpipe to plane.  With drm_private_obj
> > missing from duplicate state call, mdp5 suspend works with no problem
> > only for the very first time.  Any subsequent suspend will hit the
> > following warning, because hwpipe assignment doesn't get duplicated for
> > suspend state.  Adding drm_private_obj handling for duplicate state call
> > fixes the problem.
>
> If the driver needs a private state, it's supposed to duplicate that
> in its atomic_check functionality. This isn't the helper's job.
>
> If this is a bug in msm code, then pretty sure if you try hard enough,
> you can hit the exact same bug from userspace too. Maybe good idea to
> try and reproduce this with igt or something.

The problem is how duplicate_state is used by the atomic
suspend/resume helpers.  They duplicate the running state on suspend,
forgetting to duplicate the global state.  Then everything is
disabled, the driver correctly duplicates and updates it's global
atomic state releasing the hwpipe.

But then on resume, we are re-applying plane state that thinks it
already has a hwpipe assigned (because that is part of the plane state
that was duplicated), without reapplying the matching global state.

On a normal atomic commit, we would duplicate the plane state that has
the hwpipe disabled, which would be in sync with the drivers global
state.  But since that is not what the atomic resume helper does, we
hit the situation where the plane state and the global state are out
of sync.

So the driver is dtrt, the problem really is with the helpers.  I
think this patch is the right thing to do.  It is incorrect for the
suspend/resume helpers to assume that they can re-apply duplicated
state without including the global state.

BR,
-R

> -Daniel
>
>
> > $ echo mem > /sys/power/state
> > [   38.111144] PM: suspend entry (deep)
> > [   38.111185] PM: Syncing filesystems ... done.
> > [   38.114630] Freezing user space processes ... (elapsed 0.001 seconds) done.
> > [   38.115912] OOM killer disabled.
> > [   38.115914] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> > [   38.122170] ------------[ cut here ]------------
> > [   38.122212] WARNING: CPU: 0 PID: 1747 at drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c:145 mdp5_pipe_release+0x90/0xc0
> > [   38.122215] Modules linked in:
> > [   38.122222] CPU: 0 PID: 1747 Comm: sh Not tainted 4.19.107-00515-g9d5e4d7a33ed-dirty #323
> > [   38.122224] Hardware name: Square, Inc. T2 Devkit (DT)
> > [   38.122228] pstate: 40000005 (nZcv daif -PAN -UAO)
> > [   38.122230] pc : mdp5_pipe_release+0x90/0xc0
> > [   38.122233] lr : mdp5_pipe_release+0x90/0xc0
> > [   38.122235] sp : ffff00000d13b7f0
> > [   38.122236] x29: ffff00000d13b7f0 x28: 0000000000000000
> > [   38.122240] x27: 0000000000000002 x26: ffff800079adce00
> > [   38.122243] x25: ffff800079405200 x24: 0000000000000000
> > [   38.122246] x23: ffff80007a78cc08 x22: ffff80007b1cc018
> > [   38.122249] x21: ffff80007b1cc000 x20: ffff80007b317080
> > [   38.122252] x19: ffff80007a78ce80 x18: 0000000000020000
> > [   38.122255] x17: 0000000000000000 x16: 0000000000000000
> > [   38.122258] x15: 00000000fffffff0 x14: ffff000008c3fb48
> > [   38.122261] x13: ffff000008cdac4a x12: ffff000008c3f000
> > [   38.122264] x11: 0000000000000000 x10: ffff000008cda000
> > [   38.122267] x9 : 0000000000000000 x8 : ffff000008ce4a40
> > [   38.122269] x7 : 0000000000000000 x6 : 0000000039ea41a9
> > [   38.122272] x5 : 0000000000000000 x4 : 0000000000000000
> > [   38.122275] x3 : ffffffffffffffff x2 : c7580c109cae4500
> > [   38.122278] x1 : 0000000000000000 x0 : 0000000000000024
> > [   38.122281] Call trace:
> > [   38.122285]  mdp5_pipe_release+0x90/0xc0
> > [   38.122288]  mdp5_plane_atomic_check+0x2c0/0x448
> > [   38.122294]  drm_atomic_helper_check_planes+0xd0/0x208
> > [   38.122298]  drm_atomic_helper_check+0x38/0xa8
> > [   38.122302]  drm_atomic_check_only+0x3e8/0x630
> > [   38.122305]  drm_atomic_commit+0x18/0x58
> > [   38.122309]  __drm_atomic_helper_disable_all.isra.12+0x15c/0x1a8
> > [   38.122312]  drm_atomic_helper_suspend+0x80/0xf0
> > [   38.122316]  msm_pm_suspend+0x4c/0x70
> > [   38.122320]  dpm_run_callback.isra.6+0x20/0x68
> > [   38.122323]  __device_suspend+0x110/0x308
> > [   38.122326]  dpm_suspend+0x100/0x1f0
> > [   38.122329]  dpm_suspend_start+0x64/0x70
> > [   38.122334]  suspend_devices_and_enter+0x110/0x500
> > [   38.122336]  pm_suspend+0x268/0x2c0
> > [   38.122339]  state_store+0x88/0x110
> > [   38.122345]  kobj_attr_store+0x14/0x28
> > [   38.122352]  sysfs_kf_write+0x3c/0x50
> > [   38.122355]  kernfs_fop_write+0x118/0x1e0
> > [   38.122360]  __vfs_write+0x30/0x168
> > [   38.122363]  vfs_write+0xa4/0x1a8
> > [   38.122366]  ksys_write+0x64/0xe8
> > [   38.122368]  __arm64_sys_write+0x18/0x20
> > [   38.122374]  el0_svc_common+0x6c/0x178
> > [   38.122377]  el0_svc_compat_handler+0x1c/0x28
> > [   38.122381]  el0_svc_compat+0x8/0x18
> > [   38.122383] ---[ end trace 24145b7d8545345b ]---
> > [   38.491552] Disabling non-boot CPUs ...
> >
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index 85d163f16801..024985a92156 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -3140,6 +3140,7 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
> >         struct drm_atomic_state *state;
> >         struct drm_connector *conn;
> >         struct drm_connector_list_iter conn_iter;
> > +       struct drm_private_obj *priv_obj;
> >         struct drm_plane *plane;
> >         struct drm_crtc *crtc;
> >         int err = 0;
> > @@ -3184,6 +3185,16 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
> >         }
> >         drm_connector_list_iter_end(&conn_iter);
> >
> > +       drm_for_each_privobj(priv_obj, dev) {
> > +               struct drm_private_state *priv_state;
> > +
> > +               priv_state = drm_atomic_get_private_obj_state(state, priv_obj);
> > +               if (IS_ERR(priv_state)) {
> > +                       err = PTR_ERR(priv_state);
> > +                       goto free;
> > +               }
> > +       }
> > +
> >         /* clear the acquire context so that it isn't accidentally reused */
> >         state->acquire_ctx = NULL;
> >
> > @@ -3278,6 +3289,8 @@ int drm_atomic_helper_commit_duplicated_state(struct drm_atomic_state *state,
> >         struct drm_connector_state *new_conn_state;
> >         struct drm_crtc *crtc;
> >         struct drm_crtc_state *new_crtc_state;
> > +       struct drm_private_state *new_priv_state;
> > +       struct drm_private_obj *priv_obj;
> >
> >         state->acquire_ctx = ctx;
> >
> > @@ -3290,6 +3303,9 @@ int drm_atomic_helper_commit_duplicated_state(struct drm_atomic_state *state,
> >         for_each_new_connector_in_state(state, connector, new_conn_state, i)
> >                 state->connectors[i].old_state = connector->state;
> >
> > +       for_each_new_private_obj_in_state(state, priv_obj, new_priv_state, i)
> > +               state->private_objs[i].old_state = priv_obj->state;
> > +
> >         ret = drm_atomic_commit(state);
> >
> >         state->acquire_ctx = NULL;
> > --
> > 2.17.1
> >
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
