Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAF492D12B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 13:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3E310E768;
	Wed, 10 Jul 2024 11:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="fpLMKteY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE3910E767
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 11:59:00 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-3d92b2775caso350374b6e.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 04:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720612740; x=1721217540; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8YwSacl49HZikhh7TpAVL5zSZM2Ig9YohILbbUy5PtM=;
 b=fpLMKteY6RxZH1rFEl6KcgC2Kq0Im+bIrVsNtGsuMUkTVS4jkYkf49DdButUdKnsDu
 DPwXjZ6mCxOzT39/fR+CJ5FOZkmasASHKl6KAVwPjT8FVH+WnceRaUgHhilgDGP+LXIe
 +FpeQ7hVxibREY7XVrlTdmnHgMHAQFt5/2Lkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720612740; x=1721217540;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8YwSacl49HZikhh7TpAVL5zSZM2Ig9YohILbbUy5PtM=;
 b=MZC+3gEKAfy8EKT2k/zH92ob64yRLV4oqi87ROdCgA2oNGgyGjPUg9x5fchEjp1zSO
 3ASdiV2OqyOmsXUfjq7EQHxcuz548F4E0fEj/048Fx7PKD9h6mTKp7L6UhLBnmXwR5u1
 0Mq5DHYJ0mSnd19kPIzMWt+25COKyu9U+sLc7JtiysAHK1GHV4O+yMBocoPAtICXHP1f
 w2jUAtQFptUU1AxUNv/gdEwHXeE7FQY0xpBX20HtPDncql//11Koyd45AYnDHHynhCh4
 bYtT8HxB6aZX8UDa9igDc2ImYUoROKvStBlSz0MF5J4HOZ8Aafg9u6fxV9BD9qiozg5L
 SpPA==
X-Gm-Message-State: AOJu0Yxcn7hDK+o29E/yVVzQDGxvmOb7inD04l3XtqKWpimMqlciM9oQ
 c5OxQOaUmtAXak6L1NoYIPqfQ4aR3KWNgUqjQhqOzLUHTUjt6RkKeMv1/9hv9ls7OcrT065CYUr
 cktHUi8EhKckXviWYLhSs9cNKzONIXttC0598iw==
X-Google-Smtp-Source: AGHT+IEDb4E4R4JLvPaGkcDd2e1PnOfOAi8hfE4Q9IQEkktLnUcIxOmoAJGlW/KgY1cJtU5AbP/Am5hiG+biuNY4XSw=
X-Received: by 2002:a05:6870:82a4:b0:25e:14d9:da27 with SMTP id
 586e51a60fabf-25eae2f200fmr5688757fac.0.1720612739640; Wed, 10 Jul 2024
 04:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240710093120.732208-1-daniel.vetter@ffwll.ch>
 <03f7e2ad-fd5c-4da7-a14c-34c2c158c513@amd.com>
In-Reply-To: <03f7e2ad-fd5c-4da7-a14c-34c2c158c513@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 10 Jul 2024 13:58:48 +0200
Message-ID: <CAKMK7uFvCr2qcHun06LC-ON3GBqj8=mCpPGHuAOh9BEyr60fiQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: Add might_fault to drm_modeset_lock priming
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
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

On Wed, 10 Jul 2024 at 13:39, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Am 10.07.24 um 11:31 schrieb Daniel Vetter:
> > We already teach lockdep that dma_resv nests within drm_modeset_lock,
> > but there's a lot more: All drm kms ioctl rely on being able to
> > put/get_user while holding modeset locks, so we really need a
> > might_fault in there too to complete the picture. Add it.
>
> Mhm, lockdep should be able to deduce that when there might be faults
> under the dma_resv lock there might also be faults under the
> drm_modeset_lock.

You're not allowed to take a fault under dma_resv, because drivers
might need to take that lock to handle faults. So unfortunately in our
combined lockdep priming, there really seems to be no chain yet that
teaches about faults possibly happening while holding
drm_modeset_lock.
-Sima

>
> >
> > Motivated by a syzbot report that blew up on bcachefs doing an
> > unconditional console_lock way deep in the locking hierarchy, and
> > lockdep only noticing the depency loop in a drm ioctl instead of much
> > earlier. This annotation will make sure such issues have a much harder
> > time escaping.
> >
> > References: https://lore.kernel.org/dri-devel/00000000000073db8b061cd43=
496@google.com/
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
>
> On the other hand pointing it out explicitly doesn't hurts us at all, so
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>.
>
> Regards,
> Christian.
>
> > ---
> >   drivers/gpu/drm/drm_mode_config.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mo=
de_config.c
> > index 568972258222..37d2e0a4ef4b 100644
> > --- a/drivers/gpu/drm/drm_mode_config.c
> > +++ b/drivers/gpu/drm/drm_mode_config.c
> > @@ -456,6 +456,8 @@ int drmm_mode_config_init(struct drm_device *dev)
> >               if (ret =3D=3D -EDEADLK)
> >                       ret =3D drm_modeset_backoff(&modeset_ctx);
> >
> > +             might_fault();
> > +
> >               ww_acquire_init(&resv_ctx, &reservation_ww_class);
> >               ret =3D dma_resv_lock(&resv, &resv_ctx);
> >               if (ret =3D=3D -EDEADLK)
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
