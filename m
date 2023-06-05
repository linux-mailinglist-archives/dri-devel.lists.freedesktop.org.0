Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 521E4722ADC
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 17:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4946910E2DD;
	Mon,  5 Jun 2023 15:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3DA10E2DC;
 Mon,  5 Jun 2023 15:22:10 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-39aa8256db7so1146969b6e.0; 
 Mon, 05 Jun 2023 08:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685978529; x=1688570529;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ownFhAOJ49PkdCY/ElX6rAxTLNeHPzeq4mznvKgyoCM=;
 b=PmI2vPsng+rdUr3wY1rs4RCuBu6dzmI7/2gJjL9H+RgWI+JJhWKnCseHxLxsGLSYt+
 VI5l2Oyo3052z/uTfpJi3wPv674gduL/0ctQmP1cnvXkIneLoi/k8xqBkCH6+wQ1p/nh
 2z/9JOBkiVHtKHskN+Ph40moVJhs+PEWR5AOhRNN7VV5UkCHv1bxRqjJ9D036msS6Ji/
 evOHJ8N/U1op0XQt6YMHnorGrSSOWBNwZD12hH8JnyJFowUh3ed77YHLxHoDWDaZlXgF
 a1K5icKxJjEptcjjelAProwntmsYZ4Eym7hd+BC4GHy5U4gwuNLv91PyMFtkpCGjL9Ij
 4bGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685978529; x=1688570529;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ownFhAOJ49PkdCY/ElX6rAxTLNeHPzeq4mznvKgyoCM=;
 b=PovBL4/I2fA2g8jUsSeSzIbxwUCdoBehIN7mTP5S/fOob82YUsLoDR70P1fj9t+tCx
 5ZJC9FcaUt2jOSWovGTQU7RjoYTAWIAKZf1HCJBe5uSXvko1q+/XqqpxxZlfn5qK++49
 yVUz2BLJgeETM3IMhK1J+1ZdCXBOcCBEwxdD3gPJ0V8JC5ps63W2pQYVMsG//qyZCXfy
 +FkT32FrZ4Sadk7b33JhF8O+zglcHuHc+tJNp3HCeZ7YiBtljEKAj8m4+0NUH7lM48zC
 IiFVeDyekjUE34MPny5Re0TtvUztfUWBRE7WjSZaMri4wSDCtniuURv23Pb7b8VTVBui
 Z/QA==
X-Gm-Message-State: AC+VfDzZFlk1kbk+c+cHIlEYof7u7vMPsXXWGnimnMJe7+zSsB+7o7+y
 m5KtYQno6CJdsEIq0dWmU86JJNuqNQ28QbZhuXQ=
X-Google-Smtp-Source: ACHHUZ6UGZNvBqYMQ3/CqE2fGvsTmTRJM2EW2RZ/4t9luyD1O0fKQABDsXBaz/nEdC+C/lqa8j6+9PDMqZEFFXOnXHE=
X-Received: by 2002:a54:4598:0:b0:39a:bc50:db96 with SMTP id
 z24-20020a544598000000b0039abc50db96mr2647242oib.41.1685978529045; Mon, 05
 Jun 2023 08:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230603074345.17907-1-lm0963hack@gmail.com>
 <e337dec6-0b0e-7e53-e38d-ae1791b98418@amd.com>
In-Reply-To: <e337dec6-0b0e-7e53-e38d-ae1791b98418@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 5 Jun 2023 11:21:58 -0400
Message-ID: <CADnq5_N=enSchma5R7d8q9t8SkJ_Z7oFxDFHp3a+ypqenO=DYA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/radeon: fix race condition UAF in
 radeon_gem_set_domain_ioctl
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Min Li <lm0963hack@gmail.com>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Jun 5, 2023 at 4:13=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Am 03.06.23 um 09:43 schrieb Min Li:
> > Userspace can race to free the gobj(robj converted from), robj should n=
ot
> > be accessed again after drm_gem_object_put, otherwith it will result in
> > use-after-free.
> >
> > Signed-off-by: Min Li <lm0963hack@gmail.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> > Changes in v2:
> > - Remove unused robj, avoid compile complain
> >
> >   drivers/gpu/drm/radeon/radeon_gem.c | 4 +---
> >   1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/rade=
on/radeon_gem.c
> > index bdc5af23f005..d3f5ddbc1704 100644
> > --- a/drivers/gpu/drm/radeon/radeon_gem.c
> > +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> > @@ -459,7 +459,6 @@ int radeon_gem_set_domain_ioctl(struct drm_device *=
dev, void *data,
> >       struct radeon_device *rdev =3D dev->dev_private;
> >       struct drm_radeon_gem_set_domain *args =3D data;
> >       struct drm_gem_object *gobj;
> > -     struct radeon_bo *robj;
> >       int r;
> >
> >       /* for now if someone requests domain CPU -
> > @@ -472,13 +471,12 @@ int radeon_gem_set_domain_ioctl(struct drm_device=
 *dev, void *data,
> >               up_read(&rdev->exclusive_lock);
> >               return -ENOENT;
> >       }
> > -     robj =3D gem_to_radeon_bo(gobj);
> >
> >       r =3D radeon_gem_set_domain(gobj, args->read_domains, args->write=
_domain);
> >
> >       drm_gem_object_put(gobj);
> >       up_read(&rdev->exclusive_lock);
> > -     r =3D radeon_gem_handle_lockup(robj->rdev, r);
> > +     r =3D radeon_gem_handle_lockup(rdev, r);
> >       return r;
> >   }
> >
>
