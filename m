Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9542E87FB
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jan 2021 16:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B94897E0;
	Sat,  2 Jan 2021 15:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283DD897E0
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jan 2021 15:49:37 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id u12so21368008ilv.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Jan 2021 07:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y4RMABFY4cam25pp++JHTzZi05jOgkYVGLfUEVbzTZo=;
 b=UsxY1mHAR6WzpNzE4vj0ZSzBveA5AtK70NXOrjCVnkNOp0pJ55xpTXbRN/yNmm+62q
 WQBus2Vu3a5lsz5o60opGK90q/YbHyAtonEV1gk9mCSLc5xtQ/wF5xXKE0rFjDX22avf
 fRm+sscSCgP8iaPjrIlZB1GZY0nOkGvF+IjaPqfUoVQOr6uusz1YaWqndiK52uKcDXif
 +JSY2ONfv1znAGCFPZIcgmdE4VSEBoqMNjZ0YW/lvnBXua7nqN5lklCv8musJfhz/XAL
 MUlbLmCnH3Bbi097zmdr5t0oF2y5r/nvF57kZHcDU/8QWo7HZyaL841QZLwIygWYnfYX
 YHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y4RMABFY4cam25pp++JHTzZi05jOgkYVGLfUEVbzTZo=;
 b=ZkKio/dCCURMz+OSSoR/5Iu1nMP+SFHrn5JeI9CBma7Qn3D5T9+BY8pH83HgZtkYMu
 M3A3ja/HA34f4UTLUdO/qQm4CFjJsWq2jY1hGTvPO/M6EVDQK5anv2EekBa3df5ohWLA
 c4LFEYGvnXtVGjLXTleQgzgpvXj9EspzT70XoRg6XhhJNxbACMkjPSg8/rUElgaaHvAi
 5fy8UJ5vPstqVhN6xuJOEoxTjs6Ik7qUal1UyhKdA1bFAAWzQkjqQMiuThcewXPJ/mFP
 ADF0OIdbwj/D1JxC9W/oZKBqQEg1iMT3arfxxwR89EncPQnbC7gGpKmE2i0QTir6eCzU
 Iocw==
X-Gm-Message-State: AOAM53046+cX45ABdOQT32nGFiDgqWlqM676cEnakwKjX1fmVgbosDFv
 KYU12S0oceCWr+ynXF43B32c/RVxnpDEqUGz6yThZxDru38=
X-Google-Smtp-Source: ABdhPJyJmI7hKjlFT1fI8Ky1YfYeHcb4007xcMaEm3MVdkqZvaJesWJkP92LITnm3hD37+dgRds6pNJ3JT4TakhcYQQ=
X-Received: by 2002:a05:6e02:ca5:: with SMTP id
 5mr62748369ilg.40.1609602576500; 
 Sat, 02 Jan 2021 07:49:36 -0800 (PST)
MIME-Version: 1.0
References: <20201231205136.11422-1-mario.kleiner.de@gmail.com>
 <CAP+8YyE4H5mL3uj-T4uG0nz75XmgaZ6etXX6YxxdtO4-rL=5qA@mail.gmail.com>
 <CAEsyxyiLrpB872LdAW8-HMVC-rxf7YF8K+B51Ae9nyEvGaG1Sw@mail.gmail.com>
In-Reply-To: <CAEsyxyiLrpB872LdAW8-HMVC-rxf7YF8K+B51Ae9nyEvGaG1Sw@mail.gmail.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Sat, 2 Jan 2021 16:49:47 +0100
Message-ID: <CAP+8YyHcUt0Rv_0ov5DCcm+wxeQFCqiW1vC_Pe4TdKzRzmu3fw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix pageflipping for XOrg in Linux 5.11+
To: Mario Kleiner <mario.kleiner.de@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 2, 2021 at 4:05 PM Mario Kleiner <mario.kleiner.de@gmail.com> wrote:
>
> On Sat, Jan 2, 2021 at 3:05 PM Bas Nieuwenhuizen
> <bas@basnieuwenhuizen.nl> wrote:
> >
> > I think the problem here is that application A can set the FB and then
> > application B can use getfb2 (say ffmpeg).
>
>
> Yes. That, and also the check for 'X' won't get us far, because if i
> use my own software Psychtoolbox under Vulkan in direct display mode
> (leased RandR outputs), e.g., under radv or amdvlk, then the ->comm
> name will be "PTB mainthread" and 'P' != 'X'. But the Vulkan drivers
> all use legacy pageflips as well in der WSI/drm, so if Vulkan gets
> framebuffers with DCC modifiers, it would just fail the same way.
>
> Neither would it work to check for atomic client, as they sometimes
> use atomic commit ioctl only for certain use cases, e.g., setting HDR
> metadata, but still use the legacy pageflip ioctl for flipping.
>
> So that patch of mine is not the proper solution for anything non-X.
>
> >
> > https://lists.freedesktop.org/archives/dri-devel/2021-January/292761.html
> > would be my alternative patch.
> >
>
> I also produced and tested hopefully better alternative to my original
> one yesterday, but was too tired to send it. I just sent it out to
> you:
> https://lists.freedesktop.org/archives/dri-devel/2021-January/292763.html
>
> This one keeps the format_info check as is for non-atomic drivers, but
> no longer rejects pageflip if the underlying kms driver is atomic. I
> checked, and current atomic drivers use the drm_atomic... helper for
> implementing legacy pageflips, and that helper just wraps the pageflip
> into a "set new fb on plane" + atomic check + atomic commit.
>
> My understanding is that one can do these format changes safely under
> atomic commit, so i hope this would be safe and future proof.

So I think the difference between your patch and mine seem to boil
down to whether we want any uabi extension, since AFAICT none of the
pre-atomic drivers support modifiers.

>
> > (I'm not good at detecting the effects of tearing  apparently but
> > tested this avoids the pageflip failure by debug-prints)
>
>
> XOrg log (e.g., ~/.local/share/xorg/XOrg0.log on current Ubuntu's) is
> a good place on native XOrg, where the amdgpu-ddx was flooding the log
> with present flip failures. Or drm.debug=4 for the kernel log.
>
> Piglit has the OML_sync_control tests for timing correctness, although
> they are mostly pointless if not run in fullscreen mode, which they
> are not by default.
>
> I can also highly recommend (sudo apt install octave-psychtoolbox-3)
> on Debian/Ubutu based systems for X11. It is used for neuroscience and
> medical research and critically depends on properly working pageflips
> and timestamping on native X11/GLX under OpenGL and recently also
> under Vulkan/WSI (radv,anv,amdvlk) in direct display mode. Working
> FOSS AMD and Intel are especially critical for this research, so far
> under X11+Mesa/OpenGL, but lately also under Vulkan direct display
> mode. It has many built-in correctness tests and will shout angrily if
> something software-detectable is broken wrt. pageflipping or timing.
> E.g., octave-cli --eval PerceptualVBLSyncTest
> PerceptualVBLSyncTest creates a flicker pattern that will tear like
> crazy under Mesa if pageflipping isn't used. Also good to test
> synchronization on dual-display setups, e.g., for udal-display stereo
> presentation.
>
> I was actually surprised that this patch made it through the various
> test suites and into drm-next. I thought page-flipping was covered
> well enough somewhere.

I don't think there are any tests using the AMDGPU implicit modifiers
(not in IGT for anything except linear at least)

>
> Happy new year!
> -mario
>
> >
> > On Thu, Dec 31, 2020 at 9:52 PM Mario Kleiner
> > <mario.kleiner.de@gmail.com> wrote:
> > >
> > > Commit 816853f9dc4057b6c7ee3c45ca9bd5905 ("drm/amd/display: Set new
> > > format info for converted metadata.") may fix the getfb2 ioctl, but
> > > in exchange it completely breaks all pageflipping for classic user
> > > space, e.g., XOrg, as tested with both amdgpu-ddx and modesetting-ddx.
> > > This leads to massive tearing, broken visual timing/timestamping etc.
> > >
> > > Reason is that the classic pageflip ioctl doesn't allow a fb format
> > > change during flip, and at least X uses classic pageflip ioctl and no
> > > atomic modesetting api at all.
> > >
> > > As one attempted workaround, only set the new format info for converted
> > > metadata if the calling client isn't X. Not sure if this is the best
> > > way, or if a better check would not be "not all atomic clients" or
> > > similar? In any case it works for XOrg X-Server. Checking the ddx
> > > code of intel-ddx/modesetting-ddx/amdgpu-ddx as well as grepping over
> > > Mesa doesn't show any users of the getfb2 ioctl(), so the need for this
> > > format info assignment seems to be more the exception than the rule?
> > >
> > > Fixes: 816853f9dc40 ("drm/amd/display: Set new format info for converted metadata.")
> > > Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> > > ---
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > > index f764803c53a4..cb414b3d327a 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > > @@ -828,7 +828,8 @@ static int convert_tiling_flags_to_modifier(struct amdgpu_framebuffer *afb)
> > >                         if (!format_info)
> > >                                 return -EINVAL;
> > >
> > > -                       afb->base.format = format_info;
> > > +                       if (afb->base.comm[0] != 'X')
> > > +                               afb->base.format = format_info;
> > >                 }
> > >         }
> > >
> > > --
> > > 2.25.1
> > >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
