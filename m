Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 304F72F2AFC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 10:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B073F6E188;
	Tue, 12 Jan 2021 09:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98246E196
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 09:18:31 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id y17so1638385wrr.10
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 01:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=f87gsBH+2KVPSXH+nJ57D/wr8V36ShZYd9Y32P2PsAI=;
 b=L9PD95tk5asxdssK6FkNUeFcgsqydu6mtFz7vR4nbPey+cT4DVDf1WOKiZnUpp9ZmD
 KSR1HLU8hPuhCV2Tu/oae5ICSkF66dtiOQoloary4PJs7XVuY+mJlt+AkwWC0AMBO2yj
 Vv5NWY4NyUzYbwzc2w+TXriscEZFAYX3fd0OQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=f87gsBH+2KVPSXH+nJ57D/wr8V36ShZYd9Y32P2PsAI=;
 b=cz+rHtR8tUW+0mWyyjDo6O39QI1rpuzDKLgP/z+VVIXXiSCWxXiNXI5jrhosakTygG
 bhcjksMluPt/FMKpcGCKQkL1S9TCLCJtjUlQJQ0v8mqR3xwP3+Tw8uYlBukh+O+FMfgM
 bnLTTEEjxMBBZtmmT61O8nCNUyUD9W+WZT6F/C+Nf3AVO7PWVHA8tdlCT7pkx9HOab8I
 9S2pv4TGHL0WoyYKhvFK5OOrdHCawn0QHi0LLZgB7pQlos8sdgnYV4TVIhKJmen/UYQW
 CTvSUEAu/MUc+SwkZ9UjkFbEI07Q2dT4Z6uGESZv8Wo9qpomx/ocR+Hr8y5+WuMP6+/j
 g0xw==
X-Gm-Message-State: AOAM531GHVseI4lvMtXLmG4RvuUPKQ0rlAWrdm/LvujHeqBxdebYgRUq
 XChjuJjGaCkG0jGPFFHipOlkyw==
X-Google-Smtp-Source: ABdhPJyjVF9IanPechzGYbhoKCcezn8CSCB/pz1NPBPsHDY7evJDL6obrdoAtEpS5Tk7EHgD8iE+Qw==
X-Received: by 2002:a5d:528a:: with SMTP id c10mr3189848wrv.117.1610443110667; 
 Tue, 12 Jan 2021 01:18:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g191sm3121403wmg.39.2021.01.12.01.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:18:29 -0800 (PST)
Date: Tue, 12 Jan 2021 10:18:28 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v2] drm: Check actual format for legacy pageflip.
Message-ID: <X/1pZISyZm6xfQ+6@phenom.ffwll.local>
References: <20210110021142.28221-1-bas@basnieuwenhuizen.nl>
 <CADnq5_OVtCubsGP=-=q-hYJ3e6a3=pozi7ZhDiqdUkUKLCiwMg@mail.gmail.com>
 <CAP+8YyGAuYW+qOCDmQR+_X0y-jC5sKoxm+k7V8YrAEaTM942dA@mail.gmail.com>
 <CADnq5_PZ_yE-K6BzgcSUhOZ_b9nhWpbj7nau2ZopxMLa7igpQA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_PZ_yE-K6BzgcSUhOZ_b9nhWpbj7nau2ZopxMLa7igpQA@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Zhan Liu <zhan.liu@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 11, 2021 at 04:28:31PM -0500, Alex Deucher wrote:
> On Mon, Jan 11, 2021 at 11:39 AM Bas Nieuwenhuizen
> <bas@basnieuwenhuizen.nl> wrote:
> >
> > On Mon, Jan 11, 2021 at 4:02 PM Alex Deucher <alexdeucher@gmail.com> wr=
ote:
> > >
> > > On Sat, Jan 9, 2021 at 9:11 PM Bas Nieuwenhuizen
> > > <bas@basnieuwenhuizen.nl> wrote:
> > > >
> > > > With modifiers one can actually have different format_info structs
> > > > for the same format, which now matters for AMDGPU since we convert
> > > > implicit modifiers to explicit modifiers with multiple planes.
> > > >
> > > > I checked other drivers and it doesn't look like they end up trigge=
ring
> > > > this case so I think this is safe to relax.
> > > >
> > > > Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > Reviewed-by: Zhan Liu <zhan.liu@amd.com>
> > > > Acked-by: Christian K=F6nig <christian.koenig@amd.com>
> > > > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> > > > Fixes: 816853f9dc40 ("drm/amd/display: Set new format info for conv=
erted metadata.")
> > >
> > > Do you have commit rights to drm-misc or do you need someone to commit
> > > this for you?
> >
> > I don't have commit rights so if the patch could be committed for me
> > that would be appreciated!
> =

> Pushed to drm-misc-fixes.  Thanks!
> =

> If you want access to drm-misc, I don't see any reason you shouldn't have=
 it.

There's some old-school bash tooling involved since we're (not yet, I can
hope) doing gitlab MR:

https://drm.pages.freedesktop.org/maintainer-tools/getting-started.html

Otherwise makes sense imo.
-Daniel

> =

> Alex
> =

> =

> > >
> > > Thanks!
> > >
> > > Alex
> > >
> > > > ---
> > > >  drivers/gpu/drm/drm_plane.c | 9 ++++++++-
> > > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plan=
e.c
> > > > index e6231947f987..a0cb746bcb0a 100644
> > > > --- a/drivers/gpu/drm/drm_plane.c
> > > > +++ b/drivers/gpu/drm/drm_plane.c
> > > > @@ -1163,7 +1163,14 @@ int drm_mode_page_flip_ioctl(struct drm_devi=
ce *dev,
> > > >         if (ret)
> > > >                 goto out;
> > > >
> > > > -       if (old_fb->format !=3D fb->format) {
> > > > +       /*
> > > > +        * Only check the FOURCC format code, excluding modifiers. =
This is
> > > > +        * enough for all legacy drivers. Atomic drivers have their=
 own
> > > > +        * checks in their ->atomic_check implementation, which will
> > > > +        * return -EINVAL if any hw or driver constraint is violate=
d due
> > > > +        * to modifier changes.
> > > > +        */
> > > > +       if (old_fb->format->format !=3D fb->format->format) {
> > > >                 DRM_DEBUG_KMS("Page flip is not allowed to change f=
rame buffer format.\n");
> > > >                 ret =3D -EINVAL;
> > > >                 goto out;
> > > > --
> > > > 2.29.2
> > > >
> > > > _______________________________________________
> > > > amd-gfx mailing list
> > > > amd-gfx@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/amd-gfx

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
