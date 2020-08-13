Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F053243883
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 12:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BE46E9A1;
	Thu, 13 Aug 2020 10:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6416E9A1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 10:31:30 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id x5so4247443wmi.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 03:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=TefHU925kq0O57l+T0DrcRKmalNzFZ3uMnFdbUrTGCQ=;
 b=E2PgRBDH9TtM7kRE8qE8p7W23CqaWSmKBFmVitzDY9bk6XBvBlerFTWwmBaUOslaAp
 9IsA7M9l/55Fy+f0TLAqBLe01VQT7br3SQgLPtJaod/OQ8xzpNv/K84QTbwTYaq4yVfW
 hHKdm8yqxkpB88FIEIFBoEvkQhrhhOc90DJJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TefHU925kq0O57l+T0DrcRKmalNzFZ3uMnFdbUrTGCQ=;
 b=hJou+8inOno2sVl1LQqSFo7UZJSLp9H9m8Nsa53U7YV98QmL+ic3SegvOv5wjBpNLF
 g/WNNVYInoeOxPbfGwt/PiHOzlP8OGJMVJA5iLijm45E+Y90aSKMaqFRIxOrJwPrmnyI
 o17IQwc6rrIGa5VRYBHNIp5ekLGB8miBAx0NXeYWN6ejXVm75USQS2zNtM1OatfLXPdM
 vfuWuysHVsULVlpCc14oCquqhAjRJGVWcZ7/FcsNassX9C3j44pkjK6x5pm51O4uBWF4
 cWaoij8W51UqFKkeXmuWUGkkAOm2sWgBo+3I45TWVxIizzhc+ENPkOaT75jb9rcv41l0
 7hAQ==
X-Gm-Message-State: AOAM533vwrJE8AMaP535vB3LEzHouevr53ICWyPbY5mTTpUWlAL9N8pS
 CMyzccH2RkOAj+08vpcyrXtpIg==
X-Google-Smtp-Source: ABdhPJxVHt3n0zbYIxz/RFvEhzG8uBXrDPPqtQNqnk9IYTLo/NH8dpY4uURdhLw5kjL6YJZAtsG93Q==
X-Received: by 2002:a7b:cf08:: with SMTP id l8mr3534708wmg.183.1597314689304; 
 Thu, 13 Aug 2020 03:31:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 31sm9317528wrj.94.2020.08.13.03.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 03:31:28 -0700 (PDT)
Date: Thu, 13 Aug 2020 12:31:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/malidp: Use struct drm_gem_object_funcs.get_sg_table
 internally
Message-ID: <20200813103126.GM2352366@phenom.ffwll.local>
References: <20200807111022.12117-1-tzimmermann@suse.de>
 <20200807131252.GG2352366@phenom.ffwll.local>
 <07a956c0-10ac-f6e2-73c5-3dd584c4d2d9@suse.de>
 <CAKMK7uHsYqNYuQrbddU7Or6HxZmS8po=WfYvk5z6V5hFuee=wQ@mail.gmail.com>
 <fa21a421-9527-046e-a703-09f4f7f79d16@suse.de>
 <20200813094817.GI2352366@phenom.ffwll.local>
 <3e142611-26be-ebf4-8a9b-37920e27fa7d@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e142611-26be-ebf4-8a9b-37920e27fa7d@suse.de>
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
Cc: Dave Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 13, 2020 at 12:28:55PM +0200, Thomas Zimmermann wrote:
> =

> =

> Am 13.08.20 um 11:48 schrieb Daniel Vetter:
> > On Thu, Aug 13, 2020 at 11:19:31AM +0200, Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 07.08.20 um 18:10 schrieb Daniel Vetter:
> >>> On Fri, Aug 7, 2020 at 4:02 PM Thomas Zimmermann <tzimmermann@suse.de=
> wrote:
> >>>>
> >>>> Hi
> >>>>
> >>>> Am 07.08.20 um 15:12 schrieb Daniel Vetter:
> >>>>> On Fri, Aug 07, 2020 at 01:10:22PM +0200, Thomas Zimmermann wrote:
> >>>>>> The malidp driver uses GEM object functions for callbacks. Fix it =
to
> >>>>>> use them internally as well.
> >>>>>>
> >>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>>> Fixes: ecdd6474644f ("drm/malidp: Use GEM CMA object functions")
> >>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>>> Cc: Emil Velikov <emil.velikov@collabora.com>
> >>>>>> Cc: Liviu Dudau <liviu.dudau@arm.com>
> >>>>>> Cc: Brian Starkey <brian.starkey@arm.com>
> >>>>>> ---
> >>>>>>  drivers/gpu/drm/arm/malidp_planes.c | 2 +-
> >>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm=
/arm/malidp_planes.c
> >>>>>> index ab45ac445045..351a85088d0e 100644
> >>>>>> --- a/drivers/gpu/drm/arm/malidp_planes.c
> >>>>>> +++ b/drivers/gpu/drm/arm/malidp_planes.c
> >>>>>> @@ -346,7 +346,7 @@ static bool malidp_check_pages_threshold(struc=
t malidp_plane_state *ms,
> >>>>>>              if (cma_obj->sgt)
> >>>>>>                      sgt =3D cma_obj->sgt;
> >>>>>>              else
> >>>>>> -                    sgt =3D obj->dev->driver->gem_prime_get_sg_ta=
ble(obj);
> >>>>>> +                    sgt =3D obj->funcs->get_sg_table(obj);
> >>>>>
> >>>>> Uh if there's not a switch somewhere I'd just call the right functi=
on
> >>>>> directly. Or call the right wrapper for this, this feels a bit fish=
y ...
> >>>>
> >>>> The driver initializes the pointer via CMA helper macro to an
> >>>> CMA-internal default. Calling the actual function here is fragile if=
 the
> >>>> CMA-internal default ever changes.
> >>>>
> >>>> But I have no strong feelings. I'll go with whatever the driver's
> >>>> maintainer prefers.
> >>>
> >>> What I meant is: There should be an exported helper to get at the sgt.
> >>> Drivers using helpers shouldn't need to do this kind of stuff here.
> >>>
> >>> Also the entire code is fairly suspect, getting at the sgt from
> >>> plane_check is a bit iffy. But that's a different kind of problem.
> >>
> >> I tried to somehow move the code to CMA, but it's not easy. There's no
> >> good place to put the look-up code of sgt. And sgt is later being freed
> >> iff it came from the callback (and not freed if it was stored in the
> >> object). AFIACT the best options are to either keep the code here or
> >> move the entire function to CMA helpers.
> > =

> > Ok I read some code ... I'm confused. From the control flow it looks li=
ke
> > malidp is using cma helpers. Otherwise why does the upcasting not blow =
up
> > sometimes.
> > =

> > But cma helpers already check at import time that any imported dma-buf =
is
> > contiguous, and they guarantee to fill out the cma_obj->sgt.
> > =

> > So really no idea what this code is doing here.
> > =

> > It's also not correct, since it doesn't coalesce sgt entries, since a
> > range might be split up, but still mapped into a contiguous dma_addr_t
> > range when you take it all together. The code in
> > drm_gem_cma_prime_import_sg_table() gets this more right.
> > =

> > So maybe right fix is to just ditch this all, and use cma helpers fully?
> =

> The driver already does use CMA, including
> drm_gem_cma_prime_import_sg_table().
> =

> The patched code is not about importing/exporting sg tables. It
> configures the MMU's prefetching pattern by looking at some of the page
> sizes. I don't feel confident enough with this code to alter it. I'd
> expect to break the heuristics.

Hm ok, no idea either.

But then we can just assume that cma_obj->sgt is always set, and we don't
have to call anything. If a driver uses cma helpers, and cma doesn't set
->sgt over the lifetime of the buffer, that breaks a cma helper assumption
since cma doens't support swap-out.

So converting the if to a WARN_ON and failing with an error, and then
remove the else should work.
-Daniel

> =

> Best regards
> Thomas
> =

> > -Daniel
> > =

> >>
> >> Best regards
> >> Thomas
> >>
> >>> -Daniel
> >>>
> >>
> >> -- =

> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> >> (HRB 36809, AG N=FCrnberg)
> >> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> >>
> > =

> > =

> > =

> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
