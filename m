Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CECDD443A51
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 01:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D1D6E0E6;
	Wed,  3 Nov 2021 00:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F536E0E6
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 00:12:38 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id i9so801645ilu.8
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 17:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1hFdIa5+UMPz4ryPHs3ofaiooiYhjKx88rmchvIn5NY=;
 b=gLfoJHd6ZKlzlQhbePQy2aggmQknUF8BWz65ttk38CoFAqmVayRCvKORjOJCI2iCLA
 HlpNX5x1DH2gk4M0muenjcV9BlGiLmYKWAQIQRKddJSE4yGxk9jiEiTIOs/U9IVYDX6J
 K9JMyXZBoaR6gCjYikPXnz5PYkLuXE1ilj0RtejIyCndyCwqiU2divrDhP4xR2Dsfhq3
 9TNZINabHz+E/gvPNo1dNKIf92uVNzHMdVOLFHgjK4QU+PMkYZjVKGHS4x8Z9TnfbYiH
 H8741WpUobi3T8CFLP6PsQUNNMj+Y7HkO7MFVVfx4uQjUyIo1UqVmTzrmiRwrlHUduVv
 hd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1hFdIa5+UMPz4ryPHs3ofaiooiYhjKx88rmchvIn5NY=;
 b=7RAYK2Io5tQvZDobQ3PgSdLj9DRUUMyze4MY7xuZGaYwtB2+ScPqosCR+hlapWbiAo
 iJp4oRnHoULs0g0mARifImHEpAk8QsvMftkGA+QmrE9JERQ9qvdPRJsX4KOhWjp3ME2v
 B5y+AoVayM49UOqeKUXzTv3DvCvZDrzdFGRNfJ3BKLpaNlgozkAq8RiR93jgB7PjYdIj
 ReHW1vxK7txBLu1nshdWBcn0r9XGP1bTnr+ntAiZQ21HYTfWVAzJ6xhXuG3POhK6RPXO
 TekQnMNsdohrMbTSLQrpYbgU1cvMd/AhY1J+bwEEkP3MtBvxd1XuXdvEOFzMcBxBrA2p
 gNVw==
X-Gm-Message-State: AOAM530B5TzTm5rDwL7k3yHVET31H5qwFF8x2M5z3+88yzhzQZ0klNtd
 WP1DqX0HPa9mxGLid6al6Q1BdMex9NajAbu0jksDAA==
X-Google-Smtp-Source: ABdhPJyWD/JegcYFIIcy6BVOaSs6qyyeXkZkN5Cqniw7bm4x87PzruFAJR2UPC6iPqTJYKGsDlgM11UKmwiqgW0e39Q=
X-Received: by 2002:a92:7f0e:: with SMTP id a14mr26683165ild.215.1635898357612; 
 Tue, 02 Nov 2021 17:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210930085932.1.I8043d61cc238e0168e2f4ca5f4783223434aa587@changeid>
 <17d63b06-d1bd-85ab-92d3-71fa236b9493@suse.de>
In-Reply-To: <17d63b06-d1bd-85ab-92d3-71fa236b9493@suse.de>
From: "Anand K. Mistry" <amistry@google.com>
Date: Wed, 3 Nov 2021 11:12:25 +1100
Message-ID: <CAATStaMSFu=27LdxNOabtARGaRq7rm_k2BHSsZ9+M-fF+nnk7Q@mail.gmail.com>
Subject: Re: [PATCH] drm/prime: Fix use after free in mmap with
 drm_gem_ttm_mmap
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nartemiev@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Any movement on merging this patch? Not urgent on my end (we have this
patch in our tree), but I think other amd users might run into this
UAF.

On Thu, 30 Sept 2021 at 17:21, Thomas Zimmermann <tzimmermann@suse.de> wrot=
e:
>
> Hi
>
> Am 30.09.21 um 01:00 schrieb Anand K Mistry:
> > drm_gem_ttm_mmap() drops a reference to the gem object on success. If
> > the gem object's refcount =3D=3D 1 on entry to drm_gem_prime_mmap(), th=
at
> > drop will free the gem object, and the subsequent drm_gem_object_get()
> > will be a UAF. Fix by grabbing a reference before calling the mmap
> > helper.
> >
> > This issue was forseen when the reference dropping was adding in
> > commit 9786b65bc61ac ("drm/ttm: fix mmap refcounting"):
> >    "For that to work properly the drm_gem_object_get() call in
> >    drm_gem_ttm_mmap() must be moved so it happens before calling
> >    obj->funcs->mmap(), otherwise the gem refcount would go down
> >    to zero."
> >
> > Signed-off-by: Anand K Mistry <amistry@google.com>
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> This looks fine to me, but it affects many drivers. Let's maybe wait a
> bit if more reviews come it.
>
> Best regards
> Thomas
>
> > ---
> >
> >   drivers/gpu/drm/drm_prime.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> > index 2a54f86856af..e1854fd24bb0 100644
> > --- a/drivers/gpu/drm/drm_prime.c
> > +++ b/drivers/gpu/drm/drm_prime.c
> > @@ -719,11 +719,13 @@ int drm_gem_prime_mmap(struct drm_gem_object *obj=
, struct vm_area_struct *vma)
> >       if (obj->funcs && obj->funcs->mmap) {
> >               vma->vm_ops =3D obj->funcs->vm_ops;
> >
> > +             drm_gem_object_get(obj);
> >               ret =3D obj->funcs->mmap(obj, vma);
> > -             if (ret)
> > +             if (ret) {
> > +                     drm_gem_object_put(obj);
> >                       return ret;
> > +             }
> >               vma->vm_private_data =3D obj;
> > -             drm_gem_object_get(obj);
> >               return 0;
> >       }
> >
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--=20
Anand K. Mistry
Software Engineer
Google Australia
