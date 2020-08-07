Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C0E23F0B5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 18:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A649C6E114;
	Fri,  7 Aug 2020 16:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1085D6E114
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 16:11:02 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id o21so2339606oie.12
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 09:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8oRyUHGeA8eUBDm21Vb+5H3KxcBvkV/kMw4nuJd2wRY=;
 b=Rq7JHbhNJH9UQfdduMkxF9JBJUFH4yYqp94nqvYHQPVgG7nG6jQQO+68aO3iB2NJmF
 kYifvJbT761Pwi1v4iDn/81WwmL6BKgHmvhNJ8/4QkS6Z0FfSpV7uU8ThiwWcXio1UUw
 pys97n3AQ7geuyUCGx/QYleahlscI0H+rIzfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8oRyUHGeA8eUBDm21Vb+5H3KxcBvkV/kMw4nuJd2wRY=;
 b=fL6X4jV/4u1Gzn8idqyAQLtPfObkbzAoETZ+HRMuzrGxtKfNjz2hMDjxZhG47zVBAh
 STnjBtQu0CdoweIJwJQlfjn2WVFrYb9TNd2iEZzp6TTr0Isj+eiNNL6L9BorAsozpifS
 65BW2EP4QZg7YKfHI2HmSgQB7+Oa3UIinhsAiW+dA6AlOzMuhNUEx7OH13JdlTBAjCwq
 1ASze42e/hUR0hf+1ei3KZAUI1Xy2UYBtYV8TFaJxWxcLSHKA/4VT1JX3FuJuh4UwLhD
 nIU7VakMsPOsO148cQ53ArltHLtQ8xohuHaGdTXXA+RWhu8rtPGpA7a9AbTVI1LLc7vc
 kU4w==
X-Gm-Message-State: AOAM5317uhsosbV0UR2kIPgABABZ3f+anPcRZr8KFXuCqwrcIOMiErx0
 puNwea4koV7mWCbRWefhd8TEpne7nL1BIhEUYuwkog==
X-Google-Smtp-Source: ABdhPJyzCsWzwIwIuJ6RvZDDswUQiJ1WyV8/bZ1z3DSvYUkUtZPFAyVinVsf85qqGQh+Xokrjv/0qC57CLEOAs3xfno=
X-Received: by 2002:aca:da03:: with SMTP id r3mr11928715oig.14.1596816661297; 
 Fri, 07 Aug 2020 09:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200807111022.12117-1-tzimmermann@suse.de>
 <20200807131252.GG2352366@phenom.ffwll.local>
 <07a956c0-10ac-f6e2-73c5-3dd584c4d2d9@suse.de>
In-Reply-To: <07a956c0-10ac-f6e2-73c5-3dd584c4d2d9@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 7 Aug 2020 18:10:49 +0200
Message-ID: <CAKMK7uHsYqNYuQrbddU7Or6HxZmS8po=WfYvk5z6V5hFuee=wQ@mail.gmail.com>
Subject: Re: [PATCH] drm/malidp: Use struct drm_gem_object_funcs.get_sg_table
 internally
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 7, 2020 at 4:02 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 07.08.20 um 15:12 schrieb Daniel Vetter:
> > On Fri, Aug 07, 2020 at 01:10:22PM +0200, Thomas Zimmermann wrote:
> >> The malidp driver uses GEM object functions for callbacks. Fix it to
> >> use them internally as well.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Fixes: ecdd6474644f ("drm/malidp: Use GEM CMA object functions")
> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> Cc: Emil Velikov <emil.velikov@collabora.com>
> >> Cc: Liviu Dudau <liviu.dudau@arm.com>
> >> Cc: Brian Starkey <brian.starkey@arm.com>
> >> ---
> >>  drivers/gpu/drm/arm/malidp_planes.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
> >> index ab45ac445045..351a85088d0e 100644
> >> --- a/drivers/gpu/drm/arm/malidp_planes.c
> >> +++ b/drivers/gpu/drm/arm/malidp_planes.c
> >> @@ -346,7 +346,7 @@ static bool malidp_check_pages_threshold(struct malidp_plane_state *ms,
> >>              if (cma_obj->sgt)
> >>                      sgt = cma_obj->sgt;
> >>              else
> >> -                    sgt = obj->dev->driver->gem_prime_get_sg_table(obj);
> >> +                    sgt = obj->funcs->get_sg_table(obj);
> >
> > Uh if there's not a switch somewhere I'd just call the right function
> > directly. Or call the right wrapper for this, this feels a bit fishy ...
>
> The driver initializes the pointer via CMA helper macro to an
> CMA-internal default. Calling the actual function here is fragile if the
> CMA-internal default ever changes.
>
> But I have no strong feelings. I'll go with whatever the driver's
> maintainer prefers.

What I meant is: There should be an exported helper to get at the sgt.
Drivers using helpers shouldn't need to do this kind of stuff here.

Also the entire code is fairly suspect, getting at the sgt from
plane_check is a bit iffy. But that's a different kind of problem.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
