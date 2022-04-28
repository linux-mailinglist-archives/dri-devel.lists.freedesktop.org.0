Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9534851335C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 14:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B785610E842;
	Thu, 28 Apr 2022 12:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE63F10E6CE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 12:09:44 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id v12so6469427wrv.10
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 05:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ewe3XCn0uQN+m0GyMjjY/TybDp4bPBMB/rMFNdSNgZY=;
 b=TW2AZJaCLkCvnf4LgXzncRJNNP1t/pKRHHlafuiSHrzS5wu+RBm6G9iOR/s2yT4sxa
 yx48InwjLmvI0XsJne2QPZhz7ByhcDe5AzA60fnOhfIza4ZxbuAru9GSUMZVXC7Bvqof
 3JpIy39nrjEek7hXyAiMAA/vzrjljGoA1jlnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ewe3XCn0uQN+m0GyMjjY/TybDp4bPBMB/rMFNdSNgZY=;
 b=RJOPUj0+QQaxbHNn8NPoV/Pk9TonX5gUOtAirB16+zKspS+K5WN/G+gpHayrJmGuO3
 lh/GDPSocffkAJMNnntDmul9DuGdL7opkaFMC2ZLeqpw7IYA3APnzP9CR92JpGn7idTt
 s+86W4dihmapmx401EDOBDmoVlVCGPz0ZJW7Bxfyl/C9pbkdulzJqaDXGSw+s4Lflp6g
 Uj7tx4ORCdHZBNB1bne3ngjiJQ4G+ap/YO6tlHA0e6rhUXzGW4K9XaPxlu5Pak2x3Kdn
 ZKwOanvzl9L7fERk4nEHzb4FXQkC+HcLvyio095a3G2h0BHNQjgC80zI1RDgbhdt9UkV
 9XrA==
X-Gm-Message-State: AOAM530Rb1yv6cktsBRyP5W6khd3TyZYYV+wt6jWHAoU53hUNnp8ixkA
 2Ni9sz/AzupLSS3DyRzqT9mGLg==
X-Google-Smtp-Source: ABdhPJyaKmSEgZtM9s/LVhoSHCPLBiz0YYFjWKI5S3F/KLJ+HshtCu9RfWkZNH4vEWAG8GWuZpLr0g==
X-Received: by 2002:a05:6000:1f11:b0:20a:c899:a77a with SMTP id
 bv17-20020a0560001f1100b0020ac899a77amr24900018wrb.561.1651147783161; 
 Thu, 28 Apr 2022 05:09:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a05600c1d0b00b00393fbabdddfsm4089603wms.36.2022.04.28.05.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 05:09:42 -0700 (PDT)
Date: Thu, 28 Apr 2022 14:09:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Message-ID: <YmqEBB1m6W3XMwsR@phenom.ffwll.local>
References: <20220331152021.2671937-1-daniel.vetter@ffwll.ch>
 <823b3f2c-b624-f7a3-8bdc-4c069571c810@quicinc.com>
 <CAF6AEGvLY-+v0ZCvtoZDsW-0z5a8UH8suN9cp22m_ec=Ggb9Mw@mail.gmail.com>
 <ec74f2f6-488f-bc34-3d9a-3e1cec68aedc@quicinc.com>
 <CAF6AEGsoXYRB_sTMAp92ph_DetGfSaHwv+2xMS-CT3rgixN4fg@mail.gmail.com>
 <0e957a37-87ad-4981-01c5-287c4b06afa3@quicinc.com>
 <03186a69-0ade-7f8d-4b8b-46f525bc0cb4@quicinc.com>
 <CAKMK7uE2APz6ow+qSZ4xfLTmZdHZJe06X1_4SqWXdMOWByckyA@mail.gmail.com>
 <20220428080847.nbolnkxemblz5qer@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220428080847.nbolnkxemblz5qer@houat>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 28, 2022 at 10:08:47AM +0200, Maxime Ripard wrote:
> Hi Daniel,
> 
> On Wed, Apr 13, 2022 at 01:20:11PM +0200, Daniel Vetter wrote:
> > On Wed, 13 Apr 2022 at 01:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > On 4/8/2022 9:04 PM, Abhinav Kumar wrote:
> > > >
> > > >
> > > > On 4/7/2022 4:12 PM, Rob Clark wrote:
> > > >> On Thu, Apr 7, 2022 at 3:59 PM Abhinav Kumar
> > > >> <quic_abhinavk@quicinc.com> wrote:
> > > >>>
> > > >>> Hi Rob and Daniel
> > > >>>
> > > >>> On 4/7/2022 3:51 PM, Rob Clark wrote:
> > > >>>> On Wed, Apr 6, 2022 at 6:27 PM Jessica Zhang
> > > >>>> <quic_jesszhan@quicinc.com> wrote:
> > > >>>>>
> > > >>>>>
> > > >>>>>
> > > >>>>> On 3/31/2022 8:20 AM, Daniel Vetter wrote:
> > > >>>>>> The stuff never really worked, and leads to lots of fun because it
> > > >>>>>> out-of-order frees atomic states. Which upsets KASAN, among other
> > > >>>>>> things.
> > > >>>>>>
> > > >>>>>> For async updates we now have a more solid solution with the
> > > >>>>>> ->atomic_async_check and ->atomic_async_commit hooks. Support for
> > > >>>>>> that
> > > >>>>>> for msm and vc4 landed. nouveau and i915 have their own commit
> > > >>>>>> routines, doing something similar.
> > > >>>>>>
> > > >>>>>> For everyone else it's probably better to remove the use-after-free
> > > >>>>>> bug, and encourage folks to use the async support instead. The
> > > >>>>>> affected drivers which register a legacy cursor plane and don't
> > > >>>>>> either
> > > >>>>>> use the new async stuff or their own commit routine are: amdgpu,
> > > >>>>>> atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and
> > > >>>>>> vmwgfx.
> > > >>>>>>
> > > >>>>>> Inspired by an amdgpu bug report.
> > > >>>>>>
> > > >>>>>> v2: Drop RFC, I think with amdgpu converted over to use
> > > >>>>>> atomic_async_check/commit done in
> > > >>>>>>
> > > >>>>>> commit 674e78acae0dfb4beb56132e41cbae5b60f7d662
> > > >>>>>> Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > > >>>>>> Date:   Wed Dec 5 14:59:07 2018 -0500
> > > >>>>>>
> > > >>>>>>        drm/amd/display: Add fast path for cursor plane updates
> > > >>>>>>
> > > >>>>>> we don't have any driver anymore where we have userspace expecting
> > > >>>>>> solid legacy cursor support _and_ they are using the atomic
> > > >>>>>> helpers in
> > > >>>>>> their fully glory. So we can retire this.
> > > >>>>>>
> > > >>>>>> v3: Paper over msm and i915 regression. The complete_all is the only
> > > >>>>>> thing missing afaict.
> > > >>>>>>
> > > >>>>>> v4: Fixup i915 fixup ...
> > > >>>>>>
> > > >>>>>> References: https://bugzilla.kernel.org/show_bug.cgi?id=199425
> > > >>>>>> References:
> > > >>>>>> https://lore.kernel.org/all/20220221134155.125447-9-maxime@cerno.tech/
> > > >>>>>>
> > > >>>>>> References: https://bugzilla.kernel.org/show_bug.cgi?id=199425
> > > >>>>>> Cc: Maxime Ripard <maxime@cerno.tech>
> > > >>>>>> Tested-by: Maxime Ripard <maxime@cerno.tech>
> > > >>>>>> Cc: mikita.lipski@amd.com
> > > >>>>>> Cc: Michel Dänzer <michel@daenzer.net>
> > > >>>>>> Cc: harry.wentland@amd.com
> > > >>>>>> Cc: Rob Clark <robdclark@gmail.com>
> > > >>>>>
> > > >>>>> Hey Rob,
> > > >>>>>
> > > >>>>> I saw your tested-by and reviewed-by tags on Patchwork. Just curious,
> > > >>>>> what device did you test on?
> > > >>>>
> > > >>>> I was testing on strongbad.. v5.18-rc1 + patches (notably, revert
> > > >>>> 80253168dbfd ("drm: of: Lookup if child node has panel or bridge")
> > > >>>>
> > > >>>> I think the display setup shouldn't be significantly different than
> > > >>>> limozeen (ie. it's an eDP panel).  But I didn't do much start/stop
> > > >>>> ui.. I was mostly looking to make sure cursor movements weren't
> > > >>>> causing fps drops ;-)
> > > >>>>
> > > >>>> BR,
> > > >>>> -R
> > > >>>
> > > >>> start ui/ stop ui is a basic operation for us to use IGT on msm-next.
> > > >>> So we cannot let that break.
> > > >>>
> > > >>> I think we need to check whats causing this splat.
> > > >>>
> > > >>> Can we hold back this change till then?
> > > >>
> > > >> Can you reproduce on v5.18-rc1 (plus 80253168dbfd)?  I'm running a
> > > >> loop of stop ui / start ui and hasn't triggered a splat yet.
> > > >>
> > > >>   Otherwise maybe you can addr2line to figure out where it crashed?
> > > >>
> > > >> BR,
> > > >> -R
> > > >
> > > > So this is not a crash. Its a warning splat coming from
> > > >
> > > > https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c#L785
> > > >
> > > >
> > > > Looks like the complete_commit() which should signal the event has not
> > > > happened before the next cursor commit.
> > > >
> > > > Somehow this change is affecting the flow to miss the event signaling
> > > > that the event is done.
> > > >
> > > > We tried a couple of approaches but couldnt still fix the warning.
> > > >
> > > > Will continue to check further next week.
> > > >
> > > >>
> > > >>> Thanks
> > > >>>
> > > >>> Abhinav
> > >
> > > After checking this more this week, I think the current patch needs to
> > > be changed a bit.
> > >
> > > So, here you are removing the complete_all part and leaving that to the
> > > individual drivers, which is fine.
> > >
> > > But, you are also removing the continue part which I think seems
> > > incorrect and causing these warnings for MSM driver.
> > >
> > > @@ -2135,12 +2128,6 @@  int drm_atomic_helper_setup_commit(struct
> > > drm_atomic_state *state,
> > >                         continue;
> > >                 }
> > >
> > > -               /* Legacy cursor updates are fully unsynced. */
> > > -               if (state->legacy_cursor_update) {
> > > -                       complete_all(&commit->flip_done);
> > > -                       continue;
> > > -               }
> > > -
> > >
> > > Thats because MSM driver thinks that if the previous crtc_state->event
> > > was not consumed, then something went wrong and throws a warning.
> > >
> > >         if (!new_crtc_state->event) {
> > >              commit->event = kzalloc(sizeof(*commit->event),
> > >                          GFP_KERNEL);
> > >              if (!commit->event)
> > >                  return -ENOMEM;
> > >
> > >              new_crtc_state->event = commit->event;
> > >          }
> > >
> > > But for a cursor update, we should not or need not populate the event at
> > > all because it is async.
> > >
> > > So i think we should still keep the continue, rest of the patch is fine.
> > >
> > > @@ -2128,6 +2128,9 @@ int drm_atomic_helper_setup_commit(struct
> > > drm_atomic_state *state,
> > > continue;
> > > }
> > >
> > > + if (state->legacy_cursor_update)
> > > +      continue;
> > > +
> > >
> > > Let me know your comments.
> > 
> > Thanks a lot for your excellent analysis. I need to think this through
> > some more and figure out what exactly we should be doing.
> 
> We integrated this in the (downstream) RaspberryPi kernel, and it seems
> to trigger some weird regressions:
> 
>   - If we move the cursor under X, the primary plane update is stuck:
>     https://github.com/raspberrypi/linux/issues/4988
> 
>   - Switching back and forth between VT gets the kernel stuck (with a
>     locking issue in fb_release?)
>     https://github.com/raspberrypi/linux/issues/5011
> 
> I haven't been able to look into it at this point, I'll let you know if
> I find anything relevant

This sounds like we're dropping plane updates on the floor somehow when
you move the cursor?

I have honestly no idea how that's possible, can you try to figure this
out? It should be entirely unrelated to the msm issue, which is really
only about which one between helpers and msm is responsible for the even
handling and cleanup.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
