Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E762437EC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 11:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8E86E117;
	Thu, 13 Aug 2020 09:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78EC6E117
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 09:48:21 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a15so4654397wrh.10
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 02:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Z3IjPpx6mEKwnfMait5LYfxWHsdRJPQyRQXhX3ch0pc=;
 b=iIdIKDj7KjGgqG4nnARSKaAe0en3asxATvzzW6XUvZpSMHPCTwE6ZBle5yhbB9p3Ma
 zYHaj3DWxTcIr1aUOIpxyQQ7n98fj4J/1Ti4Kfamwp+ORpsOnFLpWZjm4P/OJjBN6bNG
 3ve3hMgY0iMlHgeTNLj15esS9o2XN1AwZQxNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Z3IjPpx6mEKwnfMait5LYfxWHsdRJPQyRQXhX3ch0pc=;
 b=Tq89SqoJ6FVwXAN3+HKWFCL0qnEUTBbLzaSl9CTqyfmG8pdj9J7nHr+ZdHwmUT88jR
 8LFyD3iCaiHFeN69LiQysOrfkVH+Ffgf7veU7BqPk73WvduQrJBXHbmbjvyUTHqSRlR0
 VK+NVsAcZ/HzCzxyZwoSPVQQIBr/P2GTNMS6mnihN9i756fSmmEvYOVd+ZXAN3mi2BR9
 hanTD/LYwFJBhhis/Fk1EWoJoNgEWE9DYJCuQGFMMvEcRQgHzeYtz/rhfzOsWvxCkpyo
 T9nHeXRs41qFbe7EaSMkX7uHRS40IAzV8pEKskURD60YoiAxRrWwSqRKI5k1d2LjZJKT
 hzZA==
X-Gm-Message-State: AOAM530fr/M3THT1y3wn6FJ7O1n7ig+Imqddkh1C4uklJhqvPaKEGG36
 RQxHJ9DNRL5vclG1eNNU70EZFw==
X-Google-Smtp-Source: ABdhPJzJNM6YhZIQXpmpapIAu5++Shaa8MIpQfTAiGscip0lwm03QuoSfWMdt0HYYYi7fSVIOMgrTg==
X-Received: by 2002:adf:a45d:: with SMTP id e29mr3246753wra.107.1597312100285; 
 Thu, 13 Aug 2020 02:48:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n12sm9493089wrq.63.2020.08.13.02.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 02:48:19 -0700 (PDT)
Date: Thu, 13 Aug 2020 11:48:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/malidp: Use struct drm_gem_object_funcs.get_sg_table
 internally
Message-ID: <20200813094817.GI2352366@phenom.ffwll.local>
References: <20200807111022.12117-1-tzimmermann@suse.de>
 <20200807131252.GG2352366@phenom.ffwll.local>
 <07a956c0-10ac-f6e2-73c5-3dd584c4d2d9@suse.de>
 <CAKMK7uHsYqNYuQrbddU7Or6HxZmS8po=WfYvk5z6V5hFuee=wQ@mail.gmail.com>
 <fa21a421-9527-046e-a703-09f4f7f79d16@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fa21a421-9527-046e-a703-09f4f7f79d16@suse.de>
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

On Thu, Aug 13, 2020 at 11:19:31AM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 07.08.20 um 18:10 schrieb Daniel Vetter:
> > On Fri, Aug 7, 2020 at 4:02 PM Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
> >>
> >> Hi
> >>
> >> Am 07.08.20 um 15:12 schrieb Daniel Vetter:
> >>> On Fri, Aug 07, 2020 at 01:10:22PM +0200, Thomas Zimmermann wrote:
> >>>> The malidp driver uses GEM object functions for callbacks. Fix it to
> >>>> use them internally as well.
> >>>>
> >>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>> Fixes: ecdd6474644f ("drm/malidp: Use GEM CMA object functions")
> >>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>>> Cc: Emil Velikov <emil.velikov@collabora.com>
> >>>> Cc: Liviu Dudau <liviu.dudau@arm.com>
> >>>> Cc: Brian Starkey <brian.starkey@arm.com>
> >>>> ---
> >>>>  drivers/gpu/drm/arm/malidp_planes.c | 2 +-
> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/a=
rm/malidp_planes.c
> >>>> index ab45ac445045..351a85088d0e 100644
> >>>> --- a/drivers/gpu/drm/arm/malidp_planes.c
> >>>> +++ b/drivers/gpu/drm/arm/malidp_planes.c
> >>>> @@ -346,7 +346,7 @@ static bool malidp_check_pages_threshold(struct =
malidp_plane_state *ms,
> >>>>              if (cma_obj->sgt)
> >>>>                      sgt =3D cma_obj->sgt;
> >>>>              else
> >>>> -                    sgt =3D obj->dev->driver->gem_prime_get_sg_tabl=
e(obj);
> >>>> +                    sgt =3D obj->funcs->get_sg_table(obj);
> >>>
> >>> Uh if there's not a switch somewhere I'd just call the right function
> >>> directly. Or call the right wrapper for this, this feels a bit fishy =
...
> >>
> >> The driver initializes the pointer via CMA helper macro to an
> >> CMA-internal default. Calling the actual function here is fragile if t=
he
> >> CMA-internal default ever changes.
> >>
> >> But I have no strong feelings. I'll go with whatever the driver's
> >> maintainer prefers.
> > =

> > What I meant is: There should be an exported helper to get at the sgt.
> > Drivers using helpers shouldn't need to do this kind of stuff here.
> > =

> > Also the entire code is fairly suspect, getting at the sgt from
> > plane_check is a bit iffy. But that's a different kind of problem.
> =

> I tried to somehow move the code to CMA, but it's not easy. There's no
> good place to put the look-up code of sgt. And sgt is later being freed
> iff it came from the callback (and not freed if it was stored in the
> object). AFIACT the best options are to either keep the code here or
> move the entire function to CMA helpers.

Ok I read some code ... I'm confused. From the control flow it looks like
malidp is using cma helpers. Otherwise why does the upcasting not blow up
sometimes.

But cma helpers already check at import time that any imported dma-buf is
contiguous, and they guarantee to fill out the cma_obj->sgt.

So really no idea what this code is doing here.

It's also not correct, since it doesn't coalesce sgt entries, since a
range might be split up, but still mapped into a contiguous dma_addr_t
range when you take it all together. The code in
drm_gem_cma_prime_import_sg_table() gets this more right.

So maybe right fix is to just ditch this all, and use cma helpers fully?
-Daniel

> =

> Best regards
> Thomas
> =

> > -Daniel
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
