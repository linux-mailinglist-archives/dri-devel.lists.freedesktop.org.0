Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4402ED652
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 19:04:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAEF6E4BA;
	Thu,  7 Jan 2021 18:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6F46E48C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 18:04:45 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id r9so7071169otk.11
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 10:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eLyXgWRSoofUa0NPDgI7e+KGuRahccA9SYiCL0diGDk=;
 b=Acadoadnt0+KY/VfHGcq4rNimtnM+p4qL3Tt4iYSXXxt19uNfZ+GMGxVDpoCSSMBoe
 OH0HosmiEeFt1ppD+v9R8e3UUja1ZoO+VUMw9Ig3PyBQsXK64SlAaCSNI6AkUcZFgQN7
 Wp5zq7h2x6icnXruoVDteB71AoElVa99MX31M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eLyXgWRSoofUa0NPDgI7e+KGuRahccA9SYiCL0diGDk=;
 b=Xjzh4xxId0ZWUHQt0ReAz+Ho+SS7h7Uk/8IhkzR/mPyQwmhRIOjf7XwRaAQfO/abgE
 NSXkhNqmaUYWcdm6d2SMLFkYTAKfPFk55nJfFY+IoN580XdgFDsJvvdOIPkk+nEjJMks
 PUstEBEC+7/bkWjKRgynzlvxlWLe7TmjdjiY3/GVqPH8GmnA25ymnIVQ5v1uAz1Z5ISJ
 k4idS05tAPJy0Os3o+7lHe3Vz2v+pp9ubwxHBU7EOxCyhljpTi21wDWiKBVw4Sz76WzK
 xFntaUPG9J9Er2sCn9N31E4kJdyeM6facxoj5jUTAj1Ft+82a1kIYZotAFVcOwrt4DDs
 +yBg==
X-Gm-Message-State: AOAM531x91Ufh44UWHVuEu/6qtOvB3LCnAOO4LwtLTabynj5U0W4Jg+2
 kAeFXnrI7LUzUkBjvyzNdwSFFQv6DmAza+vDsrNnOg==
X-Google-Smtp-Source: ABdhPJwUTSITES/u+cYmw2eICdz5U6SGiNVjYorsZbLttMZamIOwEw/GAk0xiAtq3nCaMQffGe80pPReyb/x4XmBDfI=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr7548910otb.281.1610042684372; 
 Thu, 07 Jan 2021 10:04:44 -0800 (PST)
MIME-Version: 1.0
References: <20210102140235.514039-1-bas@basnieuwenhuizen.nl>
 <CAEsyxyheUd-jyd7X=7HJcOWqcrHgwsTAFyVhW9rJhutEdb=6MQ@mail.gmail.com>
 <X/dLdN1z6/Viqy9v@phenom.ffwll.local>
 <CAEsyxyjaYkBzp_nPifhUpUJ=7vJO7MbeimeZM5H13Cta7bj9Ew@mail.gmail.com>
In-Reply-To: <CAEsyxyjaYkBzp_nPifhUpUJ=7vJO7MbeimeZM5H13Cta7bj9Ew@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 7 Jan 2021 19:04:33 +0100
Message-ID: <CAKMK7uFBrkQhV=-Hqr3EfqAPn2Vu+hM9PVKh290fw2jQJ5TPCA@mail.gmail.com>
Subject: Re: [PATCH] drm: Check actual format for legacy pageflip.
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
Cc: zhan.liu@amd.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 7, 2021 at 7:00 PM Mario Kleiner <mario.kleiner.de@gmail.com> wrote:
>
> On Thu, Jan 7, 2021 at 6:57 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> On Sat, Jan 02, 2021 at 04:31:36PM +0100, Mario Kleiner wrote:
>> > On Sat, Jan 2, 2021 at 3:02 PM Bas Nieuwenhuizen
>> > <bas@basnieuwenhuizen.nl> wrote:
>> > >
>> > > With modifiers one can actually have different format_info structs
>> > > for the same format, which now matters for AMDGPU since we convert
>> > > implicit modifiers to explicit modifiers with multiple planes.
>> > >
>> > > I checked other drivers and it doesn't look like they end up triggering
>> > > this case so I think this is safe to relax.
>> > >
>> > > Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>> > > Fixes: 816853f9dc40 ("drm/amd/display: Set new format info for converted metadata.")
>> > > ---
>> > >  drivers/gpu/drm/drm_plane.c | 2 +-
>> > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
>> > > index e6231947f987..f5085990cfac 100644
>> > > --- a/drivers/gpu/drm/drm_plane.c
>> > > +++ b/drivers/gpu/drm/drm_plane.c
>> > > @@ -1163,7 +1163,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
>> > >         if (ret)
>> > >                 goto out;
>> > >
>> > > -       if (old_fb->format != fb->format) {
>> > > +       if (old_fb->format->format != fb->format->format) {
>> >
>> > This was btw. the original way before Ville made it more strict about
>> > 4 years ago, to catch issues related to tiling, and more complex
>> > layouts, like the dcc tiling/retiling introduced by your modifier
>> > patches. That's why I hope my alternative patch is a good solution for
>> > atomic drivers while keeping the strictness for potential legacy
>> > drivers.
>>
>> Yeah this doesn't work in full generality, because hw might need to do a
>> full modeset to do a full modeset to reallocate resources (like scanout
>> fifo space) if the format changes.
>>
>> But for atomic drivers that should be caught in ->atomic_check, which
>> should result in -EINVAL, so should do the right thing. So it should be
>> all good, but imo needs a comment to explain what's going on:
>>
>>         /*
>>          * Only check the FOURCC format code, excluding modifiers. This is
>>          * enough for all legacy drivers. Atomic drivers have their own
>>          * checks in their ->atomic_check implementation, which will
>>          * return -EINVAL if any hw or driver constraint is violated due
>>          * to modifier changes.
>>          */
>>
>> Also can you pls cc: intel-gfx to get this vetted by the intel-gfx ci?
>>
>> With that:
>>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>
> Ah, my "atomic expert", posting simultaneously with myself :). Happy new year. Opinions on my variant, just replied a minute ago?

Full disclosure, Ville wanted to do something similar since forever
I'm not a huge fan of removing limitations of legacy ioctls. Worst
case we break something, best case no gain in features since why don't
you just use atomic. Since this (amdgpu modifiers) broke something we
have to fix it, hence I'd go with the more minimal version from Bas
here.

But in general your patch should be correct too.
-Daniel

>
> thanks,
> -mario
>
>> >
>> > -mario
>> >
>> > >                 DRM_DEBUG_KMS("Page flip is not allowed to change frame buffer format.\n");
>> > >                 ret = -EINVAL;
>> > >                 goto out;
>> > > --
>> > > 2.29.2
>> > >
>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
