Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D37004FF594
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 13:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DAD10E16A;
	Wed, 13 Apr 2022 11:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7A310E16A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 11:20:24 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id 12so1667789oix.12
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 04:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oaJrzGPO1GX7Ryh9J+X/0vfZtsSoS8AX8wv4/fV+eEw=;
 b=lU4zgWC33AIg1ske3AzDQD6jQibsoWUDcQRSUADWglX+TY4VpqKx0lNsXAPSDGy0uN
 ZKWsf5yuRZXZ9/hPXybaMCizKZfreetxwvUoDrnewIxjMA/Q8JE95Zf8Pmdb6AeBlz4O
 wD03IEA7XiHPLsYo1NNaklDMAcEN4BkwG+xBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oaJrzGPO1GX7Ryh9J+X/0vfZtsSoS8AX8wv4/fV+eEw=;
 b=FSieO2/wB7vnDJRP343fi4SCejjKWQn7T3et8617adUDKoZhyFO6RhWvwaxzafYafz
 I+yp+UUY2hfFW14XSpY9wETBOVx7TXIGx4repH1ZlPdWF/Ndws0c7nRTwhF8JRBKvNTh
 hQIjvmgGgvNISegMDf95E7EACr7vg0Swv1k04Pqp+xTw4Up6vVVV0GHOSILulNHGD0R2
 lXCBEkzxDiPoBHDaq3qyarxli5qqXrAK5gRPKmw2dgI+wmxvvE9f2+La/pAEr8hL1nHz
 cJIl2DGHLOnQm8nUs5r2rsMVmYIpG+zjADMd7qWZAipu6oyk7dkUWdCojCJ2yTF4u7qr
 Lz3w==
X-Gm-Message-State: AOAM5310k9GjfXNej7W75atsqv7uNp7/Io+5n+reXZv/Faxbavlei7lA
 6MxTxondsaGMsyUrpzBWJ7kMuftFEGiDRUDdMelrcg==
X-Google-Smtp-Source: ABdhPJy9cRLDQ8wa8GVnM+GfnDp+PWt/KQOyEu0hqJQhl7iMZrpIGGgE96Vo0xpiW7zgIDwcap6wJNWYJibRqzzAxZ0=
X-Received: by 2002:a05:6808:1596:b0:2f7:5d89:eec7 with SMTP id
 t22-20020a056808159600b002f75d89eec7mr3968833oiw.228.1649848823368; Wed, 13
 Apr 2022 04:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220331152021.2671937-1-daniel.vetter@ffwll.ch>
 <823b3f2c-b624-f7a3-8bdc-4c069571c810@quicinc.com>
 <CAF6AEGvLY-+v0ZCvtoZDsW-0z5a8UH8suN9cp22m_ec=Ggb9Mw@mail.gmail.com>
 <ec74f2f6-488f-bc34-3d9a-3e1cec68aedc@quicinc.com>
 <CAF6AEGsoXYRB_sTMAp92ph_DetGfSaHwv+2xMS-CT3rgixN4fg@mail.gmail.com>
 <0e957a37-87ad-4981-01c5-287c4b06afa3@quicinc.com>
 <03186a69-0ade-7f8d-4b8b-46f525bc0cb4@quicinc.com>
In-Reply-To: <03186a69-0ade-7f8d-4b8b-46f525bc0cb4@quicinc.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 13 Apr 2022 13:20:11 +0200
Message-ID: <CAKMK7uE2APz6ow+qSZ4xfLTmZdHZJe06X1_4SqWXdMOWByckyA@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Clark <robdclark@chromium.org>, Kalyan Thota <quic_kalyant@quicinc.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 DRI Development <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, Maxime Ripard <maxime@cerno.tech>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Apr 2022 at 01:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wro=
te:
>
> Hi Daniel
>
> On 4/8/2022 9:04 PM, Abhinav Kumar wrote:
> >
> >
> > On 4/7/2022 4:12 PM, Rob Clark wrote:
> >> On Thu, Apr 7, 2022 at 3:59 PM Abhinav Kumar
> >> <quic_abhinavk@quicinc.com> wrote:
> >>>
> >>> Hi Rob and Daniel
> >>>
> >>> On 4/7/2022 3:51 PM, Rob Clark wrote:
> >>>> On Wed, Apr 6, 2022 at 6:27 PM Jessica Zhang
> >>>> <quic_jesszhan@quicinc.com> wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 3/31/2022 8:20 AM, Daniel Vetter wrote:
> >>>>>> The stuff never really worked, and leads to lots of fun because it
> >>>>>> out-of-order frees atomic states. Which upsets KASAN, among other
> >>>>>> things.
> >>>>>>
> >>>>>> For async updates we now have a more solid solution with the
> >>>>>> ->atomic_async_check and ->atomic_async_commit hooks. Support for
> >>>>>> that
> >>>>>> for msm and vc4 landed. nouveau and i915 have their own commit
> >>>>>> routines, doing something similar.
> >>>>>>
> >>>>>> For everyone else it's probably better to remove the use-after-fre=
e
> >>>>>> bug, and encourage folks to use the async support instead. The
> >>>>>> affected drivers which register a legacy cursor plane and don't
> >>>>>> either
> >>>>>> use the new async stuff or their own commit routine are: amdgpu,
> >>>>>> atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and
> >>>>>> vmwgfx.
> >>>>>>
> >>>>>> Inspired by an amdgpu bug report.
> >>>>>>
> >>>>>> v2: Drop RFC, I think with amdgpu converted over to use
> >>>>>> atomic_async_check/commit done in
> >>>>>>
> >>>>>> commit 674e78acae0dfb4beb56132e41cbae5b60f7d662
> >>>>>> Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> >>>>>> Date:   Wed Dec 5 14:59:07 2018 -0500
> >>>>>>
> >>>>>>        drm/amd/display: Add fast path for cursor plane updates
> >>>>>>
> >>>>>> we don't have any driver anymore where we have userspace expecting
> >>>>>> solid legacy cursor support _and_ they are using the atomic
> >>>>>> helpers in
> >>>>>> their fully glory. So we can retire this.
> >>>>>>
> >>>>>> v3: Paper over msm and i915 regression. The complete_all is the on=
ly
> >>>>>> thing missing afaict.
> >>>>>>
> >>>>>> v4: Fixup i915 fixup ...
> >>>>>>
> >>>>>> References: https://bugzilla.kernel.org/show_bug.cgi?id=3D199425
> >>>>>> References:
> >>>>>> https://lore.kernel.org/all/20220221134155.125447-9-maxime@cerno.t=
ech/
> >>>>>>
> >>>>>> References: https://bugzilla.kernel.org/show_bug.cgi?id=3D199425
> >>>>>> Cc: Maxime Ripard <maxime@cerno.tech>
> >>>>>> Tested-by: Maxime Ripard <maxime@cerno.tech>
> >>>>>> Cc: mikita.lipski@amd.com
> >>>>>> Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> >>>>>> Cc: harry.wentland@amd.com
> >>>>>> Cc: Rob Clark <robdclark@gmail.com>
> >>>>>
> >>>>> Hey Rob,
> >>>>>
> >>>>> I saw your tested-by and reviewed-by tags on Patchwork. Just curiou=
s,
> >>>>> what device did you test on?
> >>>>
> >>>> I was testing on strongbad.. v5.18-rc1 + patches (notably, revert
> >>>> 80253168dbfd ("drm: of: Lookup if child node has panel or bridge")
> >>>>
> >>>> I think the display setup shouldn't be significantly different than
> >>>> limozeen (ie. it's an eDP panel).  But I didn't do much start/stop
> >>>> ui.. I was mostly looking to make sure cursor movements weren't
> >>>> causing fps drops ;-)
> >>>>
> >>>> BR,
> >>>> -R
> >>>
> >>> start ui/ stop ui is a basic operation for us to use IGT on msm-next.
> >>> So we cannot let that break.
> >>>
> >>> I think we need to check whats causing this splat.
> >>>
> >>> Can we hold back this change till then?
> >>
> >> Can you reproduce on v5.18-rc1 (plus 80253168dbfd)?  I'm running a
> >> loop of stop ui / start ui and hasn't triggered a splat yet.
> >>
> >>   Otherwise maybe you can addr2line to figure out where it crashed?
> >>
> >> BR,
> >> -R
> >
> > So this is not a crash. Its a warning splat coming from
> >
> > https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/=
msm/disp/dpu1/dpu_crtc.c#L785
> >
> >
> > Looks like the complete_commit() which should signal the event has not
> > happened before the next cursor commit.
> >
> > Somehow this change is affecting the flow to miss the event signaling
> > that the event is done.
> >
> > We tried a couple of approaches but couldnt still fix the warning.
> >
> > Will continue to check further next week.
> >
> >>
> >>> Thanks
> >>>
> >>> Abhinav
>
> After checking this more this week, I think the current patch needs to
> be changed a bit.
>
> So, here you are removing the complete_all part and leaving that to the
> individual drivers, which is fine.
>
> But, you are also removing the continue part which I think seems
> incorrect and causing these warnings for MSM driver.
>
> @@ -2135,12 +2128,6 @@  int drm_atomic_helper_setup_commit(struct
> drm_atomic_state *state,
>                         continue;
>                 }
>
> -               /* Legacy cursor updates are fully unsynced. */
> -               if (state->legacy_cursor_update) {
> -                       complete_all(&commit->flip_done);
> -                       continue;
> -               }
> -
>
> Thats because MSM driver thinks that if the previous crtc_state->event
> was not consumed, then something went wrong and throws a warning.
>
>         if (!new_crtc_state->event) {
>              commit->event =3D kzalloc(sizeof(*commit->event),
>                          GFP_KERNEL);
>              if (!commit->event)
>                  return -ENOMEM;
>
>              new_crtc_state->event =3D commit->event;
>          }
>
> But for a cursor update, we should not or need not populate the event at
> all because it is async.
>
> So i think we should still keep the continue, rest of the patch is fine.
>
> @@ -2128,6 +2128,9 @@ int drm_atomic_helper_setup_commit(struct
> drm_atomic_state *state,
> continue;
> }
>
> + if (state->legacy_cursor_update)
> +      continue;
> +
>
> Let me know your comments.

Thanks a lot for your excellent analysis. I need to think this through
some more and figure out what exactly we should be doing.
-Daniel

> Thanks
>
> Abhinav
> >>>>
> >>>>> I'm hitting several instances of this error when doing a start/stop=
 ui
> >>>>> on Lazor Chromebook with this patch:
> >>>>>
> >>>>> [ 3092.608322] CPU: 2 PID: 18579 Comm: DrmThread Tainted: G        =
W
> >>>>>         5.17.0-rc2-lockdep-00089-g7f17ab7bf567 #155
> >>>>> e5912cd286513b064a82a38938b3fdef86b079aa
> >>>>> [ 3092.622880] Hardware name: Google Lazor Limozeen without
> >>>>> Touchscreen
> >>>>> (rev4) (DT)
> >>>>> [ 3092.630492] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSB=
S
> >>>>> BTYPE=3D--)
> >>>>> [ 3092.637664] pc : dpu_crtc_atomic_flush+0x9c/0x144
> >>>>> [ 3092.642523] lr : dpu_crtc_atomic_flush+0x60/0x144
> >>>>> [ 3092.647379] sp : ffffffc00c1e3760
> >>>>> [ 3092.650805] x29: ffffffc00c1e3760 x28: ffffff80985dd800 x27:
> >>>>> 0000000000000425
> >>>>> [ 3092.658164] x26: ffffff80985dc500 x25: ffffff80985ddc00 x24:
> >>>>> ffffffdf8ae3b6f0
> >>>>> [ 3092.665522] x23: 0000000000000000 x22: 0000000000000000 x21:
> >>>>> ffffff809b82da00
> >>>>> [ 3092.672890] x20: ffffff80840e1000 x19: ffffff80840e2000 x18:
> >>>>> 0000000000001000
> >>>>> [ 3092.680255] x17: 0000000000000400 x16: 0000000000000100 x15:
> >>>>> 000000000000003b
> >>>>> [ 3092.687622] x14: 0000000000000000 x13: 0000000000000002 x12:
> >>>>> 0000000000000003
> >>>>> [ 3092.694979] x11: ffffff8084009000 x10: 0000000000000040 x9 :
> >>>>> 0000000000000040
> >>>>> [ 3092.702340] x8 : 0000000000000300 x7 : 000000000000000c x6 :
> >>>>> 0000000000000004
> >>>>> [ 3092.709698] x5 : 0000000000000320 x4 : 0000000000000018 x3 :
> >>>>> 0000000000000000
> >>>>> [ 3092.717056] x2 : 0000000000000000 x1 : 7bfb38b2a3a89800 x0 :
> >>>>> ffffff809a1eb300
> >>>>> [ 3092.724424] Call trace:
> >>>>> [ 3092.726958]  dpu_crtc_atomic_flush+0x9c/0x144
> >>>>> [ 3092.731463]  drm_atomic_helper_commit_planes+0x1bc/0x1c4
> >>>>> [ 3092.736944]  msm_atomic_commit_tail+0x23c/0x3e0
> >>>>> [ 3092.741627]  commit_tail+0x7c/0xfc
> >>>>> [ 3092.745145]  drm_atomic_helper_commit+0x158/0x15c
> >>>>> [ 3092.749998]  drm_atomic_commit+0x60/0x74
> >>>>> [ 3092.754055]  drm_atomic_helper_update_plane+0x100/0x110
> >>>>> [ 3092.759449]  __setplane_atomic+0x11c/0x120
> >>>>> [ 3092.763685]  drm_mode_cursor_universal+0x188/0x22c
> >>>>> [ 3092.768633]  drm_mode_cursor_common+0x120/0x1f8
> >>>>> [ 3092.773310]  drm_mode_cursor_ioctl+0x68/0x8c
> >>>>> [ 3092.777721]  drm_ioctl_kernel+0xe8/0x168
> >>>>> [ 3092.781770]  drm_ioctl+0x320/0x370
> >>>>> [ 3092.785289]  drm_compat_ioctl+0x40/0xdc
> >>>>> [ 3092.789257]  __arm64_compat_sys_ioctl+0xe0/0x150
> >>>>> [ 3092.794030]  invoke_syscall+0x80/0x114
> >>>>> [ 3092.797905]  el0_svc_common.constprop.3+0xc4/0xf8
> >>>>> [ 3092.802765]  do_el0_svc_compat+0x2c/0x54
> >>>>> [ 3092.806811]  el0_svc_compat+0x4c/0xe4
> >>>>> [ 3092.810598]  el0t_32_sync_handler+0xc4/0xf4
> >>>>> [ 3092.814914]  el0t_32_sync+0x174/0x178
> >>>>> [ 3092.818701] irq event stamp: 55940
> >>>>> [ 3092.822217] hardirqs last  enabled at (55939): [<ffffffdf8ad617a=
4>]
> >>>>> exit_to_kernel_mode+0x10c/0x11c
> >>>>> [ 3092.831523] hardirqs last disabled at (55940): [<ffffffdf8ad6272=
8>]
> >>>>> el1_dbg+0x28/0x70
> >>>>> [ 3092.839577] softirqs last  enabled at (55938): [<ffffffdf8a2103a=
8>]
> >>>>> __do_softirq+0x1e8/0x480
> >>>>> [ 3092.848256] softirqs last disabled at (55923): [<ffffffdf8a28d66=
8>]
> >>>>> __irq_exit_rcu+0xdc/0x140
> >>>>> [ 3092.857022] ---[ end trace 0000000000000000 ]---
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>> Thanks,
> >>>>>
> >>>>> Jessica Zhang
> >>>>>
> >>>>>> Cc: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
> >>>>>> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/drm_atomic_helper.c          | 13 ------------=
-
> >>>>>>     drivers/gpu/drm/i915/display/intel_display.c | 14 ++++++++++++=
++
> >>>>>>     drivers/gpu/drm/msm/msm_atomic.c             |  2 ++
> >>>>>>     3 files changed, 16 insertions(+), 13 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c
> >>>>>> b/drivers/gpu/drm/drm_atomic_helper.c
> >>>>>> index 9603193d2fa1..a2899af82b4a 100644
> >>>>>> --- a/drivers/gpu/drm/drm_atomic_helper.c
> >>>>>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> >>>>>> @@ -1498,13 +1498,6 @@ drm_atomic_helper_wait_for_vblanks(struct
> >>>>>> drm_device *dev,
> >>>>>>         int i, ret;
> >>>>>>         unsigned int crtc_mask =3D 0;
> >>>>>>
> >>>>>> -      /*
> >>>>>> -       * Legacy cursor ioctls are completely unsynced, and usersp=
ace
> >>>>>> -       * relies on that (by doing tons of cursor updates).
> >>>>>> -       */
> >>>>>> -     if (old_state->legacy_cursor_update)
> >>>>>> -             return;
> >>>>>> -
> >>>>>>         for_each_oldnew_crtc_in_state(old_state, crtc,
> >>>>>> old_crtc_state, new_crtc_state, i) {
> >>>>>>                 if (!new_crtc_state->active)
> >>>>>>                         continue;
> >>>>>> @@ -2135,12 +2128,6 @@ int drm_atomic_helper_setup_commit(struct
> >>>>>> drm_atomic_state *state,
> >>>>>>                         continue;
> >>>>>>                 }
> >>>>>>
> >>>>>> -             /* Legacy cursor updates are fully unsynced. */
> >>>>>> -             if (state->legacy_cursor_update) {
> >>>>>> -                     complete_all(&commit->flip_done);
> >>>>>> -                     continue;
> >>>>>> -             }
> >>>>>> -
> >>>>>>                 if (!new_crtc_state->event) {
> >>>>>>                         commit->event =3D
> >>>>>> kzalloc(sizeof(*commit->event),
> >>>>>>                                                 GFP_KERNEL);
> >>>>>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> >>>>>> b/drivers/gpu/drm/i915/display/intel_display.c
> >>>>>> index d2abe0e430bf..6ca5a6e7703b 100644
> >>>>>> --- a/drivers/gpu/drm/i915/display/intel_display.c
> >>>>>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> >>>>>> @@ -8799,6 +8799,20 @@ static int intel_atomic_commit(struct
> >>>>>> drm_device *dev,
> >>>>>>                 intel_runtime_pm_put(&dev_priv->runtime_pm,
> >>>>>> state->wakeref);
> >>>>>>                 return ret;
> >>>>>>         }
> >>>>>> +
> >>>>>> +     /*
> >>>>>> +      * FIXME: Cut over to (async) commit helpers instead of
> >>>>>> hand-rolling
> >>>>>> +      * everything.
> >>>>>> +      */
> >>>>>> +     if (state->base.legacy_cursor_update) {
> >>>>>> +             struct intel_crtc_state *new_crtc_state;
> >>>>>> +             struct intel_crtc *crtc;
> >>>>>> +             int i;
> >>>>>> +
> >>>>>> +             for_each_new_intel_crtc_in_state(state, crtc,
> >>>>>> new_crtc_state, i)
> >>>>>> +
> >>>>>> complete_all(&new_crtc_state->uapi.commit->flip_done);
> >>>>>> +     }
> >>>>>> +
> >>>>>>         intel_shared_dpll_swap_state(state);
> >>>>>>         intel_atomic_track_fbs(state);
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/msm/msm_atomic.c
> >>>>>> b/drivers/gpu/drm/msm/msm_atomic.c
> >>>>>> index 1686fbb611fd..b3cfabebe5d6 100644
> >>>>>> --- a/drivers/gpu/drm/msm/msm_atomic.c
> >>>>>> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> >>>>>> @@ -222,6 +222,8 @@ void msm_atomic_commit_tail(struct
> >>>>>> drm_atomic_state *state)
> >>>>>>                 /* async updates are limited to single-crtc
> >>>>>> updates: */
> >>>>>>                 WARN_ON(crtc_mask !=3D drm_crtc_mask(async_crtc));
> >>>>>>
> >>>>>> +             complete_all(&async_crtc->state->commit->flip_done);
> >>>>>> +
> >>>>>>                 /*
> >>>>>>                  * Start timer if we don't already have an update
> >>>>>> pending
> >>>>>>                  * on this crtc:
> >>>>>> --
> >>>>>> 2.34.1
> >>>>>>



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
