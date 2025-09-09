Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD2EB4FD5C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 15:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86DA10E737;
	Tue,  9 Sep 2025 13:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VmtMQXX4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC20E10E737
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 13:37:12 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-24ca270d700so13348815ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 06:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757425032; x=1758029832; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tObwF+Z08H79MDMKWC6zGt+hFazMP8SQpHHt/ZJ99zc=;
 b=VmtMQXX4qXGn134aInSfe4TdJ/khsOPs2piUgIcNYfQuMilR8yHAaJst6lEpsIJfff
 Xnp8dn//wdJfQfgECwzCCMqM0uFQ8jbNDQBbrYtcJDNS5HjoWxr0JaUZsSfcQ3vmzt8e
 gKs+ebJkNBdOBD/aKHZ630Cp38vZ8teKPJaITus00xhWVaccQ4jTLg9HrG1oWf1LM2Tz
 RaO4Fkt8vl0l1DTu+vvn0h8fO2EeXciwHuyESfFASTnewHkNvfKK06K8kmmMrU33BzYa
 2BvieKyD27a8vzGfnO4lL5vnGPfrgtSzXSlSVWeBhUR9ug9ltDvLiQjwOgN5UJjYzgc8
 owbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757425032; x=1758029832;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tObwF+Z08H79MDMKWC6zGt+hFazMP8SQpHHt/ZJ99zc=;
 b=gD8W50Au18LhwTtxqRcz6XbXGsg9/qIQE1w0+sUjjgoQIJcOVyKkwFLSuzqaGrPSj1
 zoiA92SEajzd50flPbF4ScxEqTGZHULZWUW/kiTXSeDQsI1YAl0lMyvahGILakRZ4tGU
 eZv4zJFG8o91xbSJqcEb9Mn7GOPw7VeKMvL3usnKNNO6aOmpH2j5vomV364XSxebSsP1
 5ZCDGaaE4zofk0OIhTA71F9t4RYAYUcVeHcuh3/dkNZWeGv3aGyUbxi5r7GHu+jy+zf2
 xt+YMQwyTRos+dZO2W1TBxz0x7NzlylnHdneAJhwdqxal1TpeIW6Rnp7zS34OePYQp/v
 ffEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3403DSmKM37+dVfYRMf3fqgaQRwfhK6Z8akIccDUIdQBkez1k6ZIZZPHiVUzPEeC91eXGn8917Kk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzvfl5oJJl6gFIKOSxN2Nn9r3oM+abCUMlirWKwXAc87B1RUWcJ
 fEHOVSyoOHjlzk6q1i62yikzWJcnznuKeL8cwpbDjwQ0ifNhFHHlDmGMYYFv/fNQg7IbmTYMWqA
 Mw3RTi/IVf56sj6/1lB81etGJL+ER/8o=
X-Gm-Gg: ASbGncvBkdGQXTfgcNAyhD48Tq8sB8/+Uc5XkXLC8e4L0fNrf3neCyYO/XGTX/e1OdS
 z/7V8sqf4JnUUYRidLoC7w9wq4nLH+T2/3ejSjh9OhERAVbcqOHhmQB8yXTYloxSWT7X+ERQwp0
 5zFV6LXfGIAKiLOvyrJWvLnHzbngHBT/TXh8bxKM/zZzRcoXH17driFq9PBW0woQDI50yG7wPU2
 GxOnv/63pz/R245fQ==
X-Google-Smtp-Source: AGHT+IHOvEUNBPtasBBqDVGrC3boG1QFPoLsPBUKZG/vU4sKHUOzXJ8cpzdtz7sFr+UjNvP3nBS1m8FRoIPx0JfHBlk=
X-Received: by 2002:a17:902:f682:b0:24c:b6b6:e54c with SMTP id
 d9443c01a7336-2516e4b07f1mr82434165ad.3.1757425032140; Tue, 09 Sep 2025
 06:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250908211559.519892-1-thorsten.blum@linux.dev>
 <4005498b-d866-4e41-a8a4-d8228b2062e7@ursulin.net>
In-Reply-To: <4005498b-d866-4e41-a8a4-d8228b2062e7@ursulin.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 9 Sep 2025 09:36:59 -0400
X-Gm-Features: Ac12FXw7muqg4kVuUdM_LumdYu1y5udy9p_-qPeA0dWyuOGO6hI58DbsamVKYbk
Message-ID: <CADnq5_NDrq_S7rcpr6_MY-USfVGr8-QcJ2hqnai7VEm5D_OyxQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Replace kzalloc + copy_from_user with
 memdup_user
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Tue, Sep 9, 2025 at 4:17=E2=80=AFAM Tvrtko Ursulin <tursulin@ursulin.net=
> wrote:
>
>
> On 08/09/2025 22:15, Thorsten Blum wrote:
> > Replace kzalloc() followed by copy_from_user() with memdup_user() to
> > improve and simplify ta_if_load_debugfs_write() and
> > ta_if_invoke_debugfs_write().
> >
> > No functional changes intended.
> >
> > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c | 20 ++++++--------------
> >   1 file changed, 6 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_psp_ta.c
> > index 38face981c3e..6e8aad91bcd3 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
> > @@ -171,13 +171,9 @@ static ssize_t ta_if_load_debugfs_write(struct fil=
e *fp, const char *buf, size_t
> >
> >       copy_pos +=3D sizeof(uint32_t);
> >
> > -     ta_bin =3D kzalloc(ta_bin_len, GFP_KERNEL);
> > -     if (!ta_bin)
> > -             return -ENOMEM;
> > -     if (copy_from_user((void *)ta_bin, &buf[copy_pos], ta_bin_len)) {
> > -             ret =3D -EFAULT;
> > -             goto err_free_bin;
> > -     }
> > +     ta_bin =3D memdup_user(&buf[copy_pos], ta_bin_len);
> > +     if (IS_ERR(ta_bin))
> > +             return PTR_ERR(ta_bin);
> >
> >       /* Set TA context and functions */
> >       set_ta_context_funcs(psp, ta_type, &context);
> > @@ -327,13 +323,9 @@ static ssize_t ta_if_invoke_debugfs_write(struct f=
ile *fp, const char *buf, size
> >               return -EFAULT;
> >       copy_pos +=3D sizeof(uint32_t);
> >
> > -     shared_buf =3D kzalloc(shared_buf_len, GFP_KERNEL);
> > -     if (!shared_buf)
> > -             return -ENOMEM;
> > -     if (copy_from_user((void *)shared_buf, &buf[copy_pos], shared_buf=
_len)) {
> > -             ret =3D -EFAULT;
> > -             goto err_free_shared_buf;
> > -     }
> > +     shared_buf =3D memdup_user(&buf[copy_pos], shared_buf_len);
> > +     if (IS_ERR(shared_buf))
> > +             return PTR_ERR(shared_buf);
> >
> >       set_ta_context_funcs(psp, ta_type, &context);
> >
>
> More complete than the one I sent in June^1.

I never received this series.  I didn't see it in patchwork either.
Seems it never made it to amd-gfx.  Sorry I missed it. I've applied
the applicable patches now.

>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Applied.  Thanks!

Alex

>
> I had some other in that series, not sure if you caught those.
>
> Regards,
>
> Tvrtko
>
> 1)
> https://lore.kernel.org/amd-gfx/20250612104430.41169-1-tvrtko.ursulin@iga=
lia.com/
>
