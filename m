Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05473726A9
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 09:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E587892FF;
	Tue,  4 May 2021 07:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA40892FF
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 07:40:28 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id gx5so11639769ejb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 00:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SQ4Da2oSeNO7r0/nN0ILDqvVRWXwQz6GQfvKLHeVA1c=;
 b=dQIPYxN/zQ7lJWZAj3UoTz6UjXK1/me642nVWiSqwMba9pgfK6jFZA/6C47z5+76Ry
 gyHs02Ld/3bq07a8jV+35wCdR9D8G6ffaZEKuuL91jEIDui+IlfBmi6g+WywV19enim2
 QlwfxLVg2IM69giwYbb/mDkYZCMoxkgqMIJwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SQ4Da2oSeNO7r0/nN0ILDqvVRWXwQz6GQfvKLHeVA1c=;
 b=B9Mwwow6S95dqCClpCnNoMk3GfcoshrSOUOKkf77uYDTk3cF8knHxc4BmFJwDu7aHp
 ZehLyFVeUHDSVmBnZrGmsAHKU39VWk2fuQbOtpVdLul65sDSB9N5Y7FZWPy1gwy5UnPZ
 SBPhgwpgqmzDiXh62eKb1GYziVW/gLX83aPTYPdiDB6HEW+ifF1lNjLkQ+OWSKUmnDqy
 GSyvwFK1fjIGIxvSwOQm0E0qzB8DG5tVQVQwoKoPhktV7ip8e1RwRVAqnGaBqYJUKa3E
 dTP0lNkvCOVV8asrXGo7+CPDmv1hW/zGtFYzguHzY5xug8OUjmG5kSVdr5g27o6+EmCQ
 kVBg==
X-Gm-Message-State: AOAM533plKjKEOD+PMVxDny3agtot6opdsh5C+6q2q1CvoTpwpvLy7hA
 VG6ULvuYTXgYU+bR04KZaPg7JA==
X-Google-Smtp-Source: ABdhPJyW5WMzjcq4PMkqvGkJGt1+y+1TEVO6a9Wia9FiZJLmJ358AJfd+AElC4KCiI6kRonSf2/lKg==
X-Received: by 2002:a17:907:10c6:: with SMTP id
 rv6mr6014666ejb.526.1620114026972; 
 Tue, 04 May 2021 00:40:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j20sm942243ejc.110.2021.05.04.00.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 00:40:26 -0700 (PDT)
Date: Tue, 4 May 2021 09:40:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v3 10/11] drm: Use state helper instead of the plane
 state pointer
Message-ID: <YJD6aFbn/vwQkq+5@phenom.ffwll.local>
References: <20210219120032.260676-1-maxime@cerno.tech>
 <20210219120032.260676-10-maxime@cerno.tech>
 <161706912161.3012082.17313817257247946143@swboyd.mtv.corp.google.com>
 <20210330153527.gw33t4o2b35wwzbg@gilmour>
 <161713057558.2260335.5422873422021430866@swboyd.mtv.corp.google.com>
 <20210408132048.gifhgtkmoeuplhcz@gilmour>
 <CAF6AEGt8t78WLt=GQ1PFANtOC2thoYiTj7kCrh4cTr+CVH68eQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGt8t78WLt=GQ1PFANtOC2thoYiTj7kCrh4cTr+CVH68eQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, abhinavk@codeaurora.org,
 Stephen Boyd <swboyd@chromium.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 30, 2021 at 09:44:42AM -0700, Rob Clark wrote:
> On Thu, Apr 8, 2021 at 6:20 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi Stephen,
> >
> > On Tue, Mar 30, 2021 at 11:56:15AM -0700, Stephen Boyd wrote:
> > > Quoting Maxime Ripard (2021-03-30 08:35:27)
> > > > Hi Stephen,
> > > >
> > > > On Mon, Mar 29, 2021 at 06:52:01PM -0700, Stephen Boyd wrote:
> > > > > Trimming Cc list way down, sorry if that's too much.
> > > > >
> > > > > Quoting Maxime Ripard (2021-02-19 04:00:30)
> > > > > > Many drivers reference the plane->state pointer in order to get the
> > > > > > current plane state in their atomic_update or atomic_disable hooks,
> > > > > > which would be the new plane state in the global atomic state since
> > > > > > _swap_state happened when those hooks are run.
> > > > >
> > > > > Does this mean drm_atomic_helper_swap_state()?
> > > >
> > > > Yep. Previous to that call in drm_atomic_helper_commit, plane->state is
> > > > the state currently programmed in the hardware, so the old state (that's
> > > > the case you have with atomic_check for example)
> > > >
> > > > Once drm_atomic_helper_swap_state has run, plane->state is now the state
> > > > that needs to be programmed into the hardware, so the new state.
> > >
> > > Ok, and I suppose that is called by drm_atomic_helper_commit()?
> >
> > Yep :)
> >
> > > So presumably a modeset is causing this? I get the NULL pointer around
> > > the time we switch from the splash screen to the login screen. I think
> > > there's a modeset during that transition.
> >
> > It's very likely yeah. I really don't get how that pointer could be null
> > though :/
> 
> So I think I see what is going on.. the issue is the CRTC has changed,
> but not the plane, so there is no new-state for the plane.

Yeah you're not allowed to touch an object's hw state in ->atomic_commit
without acquiring it's state in atomic_check. Otherwise the
synchronization across commits that atomic helpers provides goes boom.

> But dpu_crtc_atomic_flush() iterates over all the attached planes,
> calling dpu_plane_restore() which leads into
> dpu_plane_atomic_update().. this is kinda dpu breaking the rules..

You're probably missing a drm_atomic_add_affected_planes() somewhere.
Without looking at the code at least, it might be that if you just blindly
do that you take too many states by default and oversynchronize across
multiple crtc, which isn't great. But better than getting the rules wrong
:-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
