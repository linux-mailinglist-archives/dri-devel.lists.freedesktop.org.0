Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AE73F1536
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 10:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040BF6E823;
	Thu, 19 Aug 2021 08:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E106E4AE;
 Thu, 19 Aug 2021 08:30:24 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id g11so3927220qtk.5;
 Thu, 19 Aug 2021 01:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=14TEGaf7v2akM/oSePTDqU/GYp2Ra9U8wukgz4qzh5M=;
 b=hvjW3W2QZxIbI30sazySzBmEx79ls9rzxQnFF1rpq37Ha77W9hmEUPalTir3L7b7Yv
 6lwL/IXBKpdZ85OcN84SpPfXxLgJo5/AS+N2WdyqKHrVWxKJv57FCme49YZP/fH5C8HT
 nMzxKDwxTDvvrE3aCWwahmCl+/P4kA2gv6u1CZxXRrgjQDVdr4WL7HGS9/dyA/guwM8S
 ux1X9WkhH5Ah5edA5jtH6o+wsgKnhUtJVh5CRxJlSe3yLrBwAg3PAZ1D8jiwbo8nG6QF
 9S+YYKbsKDJ8hk2dlSMDQK9XrARZJoVAf52ebcNjvLa5zdzbIUSiAUdUTPwc7j8vTeGK
 zvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=14TEGaf7v2akM/oSePTDqU/GYp2Ra9U8wukgz4qzh5M=;
 b=nOO1dbU1CjkfmK6SvxIqtCzBwjDzIBplhQGQM5XwaYbT4a41IX1PCltT0rqwoi6QCD
 LtkoZKZl+EjQNvKC2pyrmZlpTWp6SsagBXxXoItoLSZBpWR88XXm3VMxRjsFu5ZtCgR0
 M2eqVhC2WKQIU2cwE7L0UbGv5E3Wf1xzo4tQQYsT9tSEv52apLjOX49nnY2Ao4guP0iB
 FftwynQGT/9GXVfB9Wf1CvxLHE7s4nZ0YxYVQ6r+Vl2+5sIkFg5M4sGWuRwgOTk2Ccjw
 JZvMBkMQMkMFQW7aG1W88+VWslTJN9RtA0Lb0NqcES2nn6ksBiUro3p9TxexmhtOhxA/
 t82A==
X-Gm-Message-State: AOAM5330omgOoXJSWnSnOYiPd6uP2reZhCksvTGDUtNrAek70ZRiGFm9
 vH0iaK+a1+g94cDRL3pjB6HpD7lbAK/RkdONs+8=
X-Google-Smtp-Source: ABdhPJzRAtnC31QRZMvCsBfBGvIGGhtMagUx80zSJ/kk2ZmrZuiPfrKmdfCH62DsVimM6u/dht22ZMmYNlfHJmHuRaQ=
X-Received: by 2002:a05:622a:2:: with SMTP id
 x2mr11819487qtw.223.1629361823768; 
 Thu, 19 Aug 2021 01:30:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210818171203.237687-1-matthew.auld@intel.com>
 <532a00f09d17f2e95ef970a9f5b9d273c0384d39.camel@linux.intel.com>
In-Reply-To: <532a00f09d17f2e95ef970a9f5b9d273c0384d39.camel@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 19 Aug 2021 09:29:56 +0100
Message-ID: <CAM0jSHOO+hvofLYzv0qPoC8HOpUQqp=e715cbBvergYa=8PJEw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ttm: ensure we release the
 intel_memory_region
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 Aug 2021 at 08:25, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> On Wed, 2021-08-18 at 18:12 +0100, Matthew Auld wrote:
> > If the ttm_bo_init_reserved() call fails ensure we also release the
> > region, otherwise we leak the reference, or worse hit some uaf, when
> > we
> > start using the objects.list. Also remove the make_unshrinkable call
> > here, which doesn't do anything.
> >
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > index 771eb2963123..2e8cdcd5e4f7 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > @@ -909,7 +909,6 @@ int __i915_gem_ttm_object_init(struct
> > intel_memory_region *mem,
> >         drm_gem_private_object_init(&i915->drm, &obj->base, size);
> >         i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class,
> > flags);
> >         i915_gem_object_init_memory_region(obj, mem);
> > -       i915_gem_object_make_unshrinkable(obj);
> >         INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL |
> > __GFP_NOWARN);
> >         mutex_init(&obj->ttm.get_io_page.lock);
> >         bo_type =3D (obj->flags & I915_BO_ALLOC_USER) ?
> > ttm_bo_type_device :
> > @@ -932,7 +931,7 @@ int __i915_gem_ttm_object_init(struct
> > intel_memory_region *mem,
> >                                    page_size >> PAGE_SHIFT,
> >                                    &ctx, NULL, NULL,
> > i915_ttm_bo_destroy);
> >         if (ret)
> > -               return i915_ttm_err_to_gem(ret);
> > +               goto err_release_mr;
>
> IIRC when ttm_object_init_reserved fails, it will call ttm_bo_put()
> which will eventually end up in i915_ttm_bo_destroy() which will do the
> right thing?

Ah right, missed that.

>
> /Thomas
>
>
