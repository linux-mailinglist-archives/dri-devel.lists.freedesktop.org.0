Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACE32ED626
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 18:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5746E4B1;
	Thu,  7 Jan 2021 17:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CED66E4B1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 17:57:12 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t30so6538370wrb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 09:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=epnDB6nk5qLto816ToRrp/gD18gbPhIUw9cBxkZJabc=;
 b=NDTJLW1b0HAeNP9uHINtjAlWUGBpm9q0ttV+zqJgT/9dlkI6olK9T4F5UFs6qmAjjr
 0Z3VgIGiDoVnNoG1YZGmhJBvBmoPPc8E4z0qA0RMark48CbfO9VET2+VByj6QXnqF8eG
 L6kmiCl8xrBdKzFAxWStOS6G+ZMxJVqGEFris=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=epnDB6nk5qLto816ToRrp/gD18gbPhIUw9cBxkZJabc=;
 b=TuPQKHvmyFsLJ3oa52ZyvP4UeBAPo66q7wVYJI8KxhrQIFO8l2zE41Vc4MTaSWjngm
 NGyxMqtr8RjvH8EUZd59OHupu88eYV9iZW28voRPjc5/eLA7wdsOeuo16yCsVyEmBDl2
 6iqPziXXw2HODIRh1LXbYC0WyO4FO2ROhh+I6ctb+JaLqvRiVn2T6RYX+OyhC1mJCOor
 /Mfl0qYVUP5ntv70IfSxBOWLVGVEhOUDhjrx5qa1mSO2wPMAMpZOaSkj2v6XIf20KFbt
 Qk0K/DZW18CNEn4uvLQT7+aimQ3+p0Vpd+dxwxPx4jaNw2Fd4MzlwMA5/aN4bzUugSaL
 fsbw==
X-Gm-Message-State: AOAM5304lZgqEDeKmR9yI3gku3wdCVi+TJaWNrm76vzmEV/5MVRSzVs1
 wQagBk9piFSbFDgmUjuRS0EEgg==
X-Google-Smtp-Source: ABdhPJzLvHs4BUy631eHKSoB2GxbOeOYOWJWFur9yMGlEwGTo0M3Z2GpbDMw9WwjhkRgstUKYitKMg==
X-Received: by 2002:a5d:560e:: with SMTP id l14mr10014595wrv.191.1610042231211; 
 Thu, 07 Jan 2021 09:57:11 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u6sm10222800wrm.90.2021.01.07.09.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 09:57:10 -0800 (PST)
Date: Thu, 7 Jan 2021 18:57:08 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Subject: Re: [PATCH] drm: Check actual format for legacy pageflip.
Message-ID: <X/dLdN1z6/Viqy9v@phenom.ffwll.local>
References: <20210102140235.514039-1-bas@basnieuwenhuizen.nl>
 <CAEsyxyheUd-jyd7X=7HJcOWqcrHgwsTAFyVhW9rJhutEdb=6MQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEsyxyheUd-jyd7X=7HJcOWqcrHgwsTAFyVhW9rJhutEdb=6MQ@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, zhan.liu@amd.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 02, 2021 at 04:31:36PM +0100, Mario Kleiner wrote:
> On Sat, Jan 2, 2021 at 3:02 PM Bas Nieuwenhuizen
> <bas@basnieuwenhuizen.nl> wrote:
> >
> > With modifiers one can actually have different format_info structs
> > for the same format, which now matters for AMDGPU since we convert
> > implicit modifiers to explicit modifiers with multiple planes.
> >
> > I checked other drivers and it doesn't look like they end up triggering
> > this case so I think this is safe to relax.
> >
> > Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > Fixes: 816853f9dc40 ("drm/amd/display: Set new format info for converted metadata.")
> > ---
> >  drivers/gpu/drm/drm_plane.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > index e6231947f987..f5085990cfac 100644
> > --- a/drivers/gpu/drm/drm_plane.c
> > +++ b/drivers/gpu/drm/drm_plane.c
> > @@ -1163,7 +1163,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
> >         if (ret)
> >                 goto out;
> >
> > -       if (old_fb->format != fb->format) {
> > +       if (old_fb->format->format != fb->format->format) {
> 
> This was btw. the original way before Ville made it more strict about
> 4 years ago, to catch issues related to tiling, and more complex
> layouts, like the dcc tiling/retiling introduced by your modifier
> patches. That's why I hope my alternative patch is a good solution for
> atomic drivers while keeping the strictness for potential legacy
> drivers.

Yeah this doesn't work in full generality, because hw might need to do a
full modeset to do a full modeset to reallocate resources (like scanout
fifo space) if the format changes.

But for atomic drivers that should be caught in ->atomic_check, which
should result in -EINVAL, so should do the right thing. So it should be
all good, but imo needs a comment to explain what's going on:

	/*
	 * Only check the FOURCC format code, excluding modifiers. This is
	 * enough for all legacy drivers. Atomic drivers have their own
	 * checks in their ->atomic_check implementation, which will
	 * return -EINVAL if any hw or driver constraint is violated due
	 * to modifier changes.
	 */

Also can you pls cc: intel-gfx to get this vetted by the intel-gfx ci?

With that:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> -mario
> 
> >                 DRM_DEBUG_KMS("Page flip is not allowed to change frame buffer format.\n");
> >                 ret = -EINVAL;
> >                 goto out;
> > --
> > 2.29.2
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
