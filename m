Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7050236FEC9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 18:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FB06F56C;
	Fri, 30 Apr 2021 16:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFD56F56B;
 Fri, 30 Apr 2021 16:41:10 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 i21-20020a05600c3555b029012eae2af5d4so2020002wmq.4; 
 Fri, 30 Apr 2021 09:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h+66Oy7mxBKGptVihwlH/Hzh5J+HBgYn12rtWa1Ht0A=;
 b=PqCRxE4z2J6Gxe2o5wLtD7XsGXFIDrhrwG8QUMG+W65O4kyQS/QL+O/am+Slg30EdP
 SITspIKf39zHcrHs2SrXZo/rLD0JuH/ER683QRe8u0wKXXmKPJfrkvpiIOP0yhyxF1Rq
 KDOcYDFioJfC24JiJZnixKcd6RQU3GG/PrRttmTMjkUYo7spD8YHTF8rtQx7Zb5GdOTI
 F8M608bqJ+Lry8RiXzekwiFlictmLwEPULWF6/7HfwX66xnvF5aqCJqVOaxXt8OsiYsa
 KUIbb2gu5gDIGrpDkWzX9yZdb6HBiO0OUV1ghjudRpkf9zEl3rYrmGRRnlunYzrDXALm
 QOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h+66Oy7mxBKGptVihwlH/Hzh5J+HBgYn12rtWa1Ht0A=;
 b=SPLTPL7mBrrgUPWjEWtuOQsvhuTkFOInb3Xh09d9GNB5BLMP6QN1jRG0+UfzY7UF1E
 Ye0sjHRdd9uQe5nBRmwKI3yBt9zaWqNPBpvERO3LIaJ1zHbOWMNaIAWOBH06lvjcgpUm
 5zD7QCGwfzG1mk8yLggvY2zv/iHhyac9vZ2L+z4UKTJ+H4McONGn1+aJFnLfanml8gtu
 BLZCATtsUEGEg8asxsld3tfy8zJnhi3YqUC4k6PfSYP/Bts46hAHBkAQfWEu9/H+bl66
 eUmi4h0ZFGWPP4JNLSHZ8tvGnG3QBasfx7EBd0mOgnnkp8LS/llS5TvCQxTYPhzKqk4A
 ev+g==
X-Gm-Message-State: AOAM532XQ00x96rhU6bQGiwE/W9uWHJMno6L3HbjOT2tGrdopGud+kEe
 X/XCRacFIfFRkF027O3CUQxWtfmxYtaM8fQWrK0Aa4qv1a8=
X-Google-Smtp-Source: ABdhPJzuM15/s48Jb4zLa/ps0CebYG1fOZQlAO51W1eewyuyKGBWzav8rGTilyAHFuRfwqs1tZN2m9sfK7cECRBS+a0=
X-Received: by 2002:a05:600c:4e8c:: with SMTP id
 f12mr17505549wmq.123.1619800869137; 
 Fri, 30 Apr 2021 09:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210219120032.260676-1-maxime@cerno.tech>
 <20210219120032.260676-10-maxime@cerno.tech>
 <161706912161.3012082.17313817257247946143@swboyd.mtv.corp.google.com>
 <20210330153527.gw33t4o2b35wwzbg@gilmour>
 <161713057558.2260335.5422873422021430866@swboyd.mtv.corp.google.com>
 <20210408132048.gifhgtkmoeuplhcz@gilmour>
In-Reply-To: <20210408132048.gifhgtkmoeuplhcz@gilmour>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 30 Apr 2021 09:44:42 -0700
Message-ID: <CAF6AEGt8t78WLt=GQ1PFANtOC2thoYiTj7kCrh4cTr+CVH68eQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/11] drm: Use state helper instead of the plane state
 pointer
To: Maxime Ripard <maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 abhinavk@codeaurora.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 8, 2021 at 6:20 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Stephen,
>
> On Tue, Mar 30, 2021 at 11:56:15AM -0700, Stephen Boyd wrote:
> > Quoting Maxime Ripard (2021-03-30 08:35:27)
> > > Hi Stephen,
> > >
> > > On Mon, Mar 29, 2021 at 06:52:01PM -0700, Stephen Boyd wrote:
> > > > Trimming Cc list way down, sorry if that's too much.
> > > >
> > > > Quoting Maxime Ripard (2021-02-19 04:00:30)
> > > > > Many drivers reference the plane->state pointer in order to get the
> > > > > current plane state in their atomic_update or atomic_disable hooks,
> > > > > which would be the new plane state in the global atomic state since
> > > > > _swap_state happened when those hooks are run.
> > > >
> > > > Does this mean drm_atomic_helper_swap_state()?
> > >
> > > Yep. Previous to that call in drm_atomic_helper_commit, plane->state is
> > > the state currently programmed in the hardware, so the old state (that's
> > > the case you have with atomic_check for example)
> > >
> > > Once drm_atomic_helper_swap_state has run, plane->state is now the state
> > > that needs to be programmed into the hardware, so the new state.
> >
> > Ok, and I suppose that is called by drm_atomic_helper_commit()?
>
> Yep :)
>
> > So presumably a modeset is causing this? I get the NULL pointer around
> > the time we switch from the splash screen to the login screen. I think
> > there's a modeset during that transition.
>
> It's very likely yeah. I really don't get how that pointer could be null
> though :/

So I think I see what is going on.. the issue is the CRTC has changed,
but not the plane, so there is no new-state for the plane.

But dpu_crtc_atomic_flush() iterates over all the attached planes,
calling dpu_plane_restore() which leads into
dpu_plane_atomic_update().. this is kinda dpu breaking the rules..

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
