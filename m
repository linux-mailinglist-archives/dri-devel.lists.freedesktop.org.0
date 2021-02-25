Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 190F1324E7A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 11:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0446C6EC90;
	Thu, 25 Feb 2021 10:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894386EC90
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 10:49:05 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id u14so4769779wri.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 02:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=yKCUExqgC5cIayWt71ALmEVPA78VtlZ751tLf031WUw=;
 b=PafvfQG3a7HHl9i2Q10kRCAWUE8ZHACo6l9wamdbXrvEj97jNgi1EbbnXtJy9tKjE9
 H7WV9m1xoDkP087+yF4UwbupXuO8EHfc8vmj4X9O5HBMf+MbYo7t9UWBmWdepZuOiJgO
 VOtytbNGyitIHTrcaaE0xOb64O4lGHemk8Vro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yKCUExqgC5cIayWt71ALmEVPA78VtlZ751tLf031WUw=;
 b=LVO8TqDJ+ahWqXGvvM5XrBhj7TRhlyVQ0BhbPW+MZJbn1F0KQ8gBUBbdv4m8HPmTPN
 w6lc34DKm+7V7OWEqvEiWexDHAPA0GVdxgcv98R0vbOZxw0kZjqHlJqviu6Q3Ewg/Z8j
 6Hge2V/GMd0hO5glHPZgNmcrD6mBohmv/SDDl6YI4UnlMYCC2vqn5rjKGwUYPBmzkEYF
 6CNd1sLGpPOAPlqvq76DwQEyW5PHJfdmV+qXfPAxXiG1fJH2cP8PTR4hUaBdPOhsDrRe
 j0n9LVSkv5idB91qX+7/ElG6iLMhs0IBFAiXxB2gn+WYdYzWYIYM8iks+UTUozWQHXmE
 rwhw==
X-Gm-Message-State: AOAM532VHPyFipOgsq6OUfsPXHB8WNl8hMoWdbN7RrTDc7c2E9z4UGiG
 K9NKhGcQAv45vxiheDB/WoJehg==
X-Google-Smtp-Source: ABdhPJxCiWL3WjE2VjRR96wX9QHVGYM1xN+ccKYn6Na9kEzA+okP5BpuVKt3P8UBpvV6ezcld2kSEg==
X-Received: by 2002:adf:e8c9:: with SMTP id k9mr2802316wrn.315.1614250144277; 
 Thu, 25 Feb 2021 02:49:04 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h18sm9271574wrm.54.2021.02.25.02.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 02:49:03 -0800 (PST)
Date: Thu, 25 Feb 2021 11:49:01 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/shmem-helpers: vunmap: Don't put pages for dma-buf
Message-ID: <YDeAnaM8GSInqCkv@phenom.ffwll.local>
References: <20210219122203.51130-1-noralf@tronnes.org>
 <2eb66df9-05bc-c52c-b6b7-793cac59f4d3@suse.de>
 <5169579f-04cf-230d-f9be-f3eb068b0e51@tronnes.org>
 <CAKMK7uH06XqRUWOuyZCG+6X9zVs6FGYWOFE0RggfY7Jx91AQjw@mail.gmail.com>
 <42d082fc-128e-9c98-1570-ffeb9e71f143@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42d082fc-128e-9c98-1570-ffeb9e71f143@suse.de>
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
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 25, 2021 at 10:52:14AM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 25.02.21 um 10:43 schrieb Daniel Vetter:
> > On Wed, Feb 24, 2021 at 6:14 PM Noralf Tr=F8nnes <noralf@tronnes.org> w=
rote:
> > > =

> > > =

> > > =

> > > Den 19.02.2021 14.54, skrev Thomas Zimmermann:
> > > > Hi
> > > > =

> > > > Am 19.02.21 um 13:22 schrieb Noralf Tr=F8nnes:
> > > > > dma-buf importing was reworked in commit 7d2cd72a9aa3
> > > > > ("drm/shmem-helpers: Simplify dma-buf importing"). Before that co=
mmit
> > > > > drm_gem_shmem_prime_import_sg_table() did set ->pages_use_count=
=3D1 and
> > > > > drm_gem_shmem_vunmap_locked() could call drm_gem_shmem_put_pages()
> > > > > unconditionally. Now without the use count set, put pages is call=
ed also
> > > > > on dma-bufs. Fix this by only putting pages if it's not imported.
> > > > > =

> > > > > Fixes: 7d2cd72a9aa3 ("drm/shmem-helpers: Simplify dma-buf importi=
ng")
> > > > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > Signed-off-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> > > > =

> > > > Just when I saw the error. Nice. :)
> > > > =

> > > > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > =

> > > =

> > > Should I apply this to drm-misc-fixes?
> > =

> > drm-misc-next-fixes because we're in the merge window.
> =

> Too late. Can/should I cherry-pick the patch from drm-misc-next?

Maarten just send the pull around, so pls coordinate with him. Maybe best
if Maarten cherry-picks onto drm-misc-fixes after -rc1 is out.
-Daniel

> =

> Best regards
> Thomas
> =

> > -Daniel
> > =

> > > =

> > > Noralf.
> > > =

> > > > For testing the GUD driver, you may also want to keep an eye at [1]
> > > > =

> > > > Best regards
> > > > Thomas
> > > > =

> > > > [1]
> > > > https://lore.kernel.org/dri-devel/02a45c11-fc73-1e5a-3839-30b080950=
af8@amd.com/T/#t
> > > > =

> > > > =

> > > > > ---
> > > > >    drivers/gpu/drm/drm_gem_shmem_helper.c | 7 ++++---
> > > > >    1 file changed, 4 insertions(+), 3 deletions(-)
> > > > > =

> > > > > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > > > > b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > > > > index 9825c378dfa6..c8a6547a1757 100644
> > > > > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > > > > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > > > > @@ -357,13 +357,14 @@ static void drm_gem_shmem_vunmap_locked(str=
uct
> > > > > drm_gem_shmem_object *shmem,
> > > > >        if (--shmem->vmap_use_count > 0)
> > > > >            return;
> > > > >    -    if (obj->import_attach)
> > > > > +    if (obj->import_attach) {
> > > > >            dma_buf_vunmap(obj->import_attach->dmabuf, map);
> > > > > -    else
> > > > > +    } else {
> > > > >            vunmap(shmem->vaddr);
> > > > > +        drm_gem_shmem_put_pages(shmem);
> > > > > +    }
> > > > >          shmem->vaddr =3D NULL;
> > > > > -    drm_gem_shmem_put_pages(shmem);
> > > > >    }
> > > > >      /*
> > > > > =

> > > > =

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
