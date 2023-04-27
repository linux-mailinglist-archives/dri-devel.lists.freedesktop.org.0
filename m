Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9A66F05F4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 14:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA7710EB30;
	Thu, 27 Apr 2023 12:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7F810EB44;
 Thu, 27 Apr 2023 12:40:04 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-547303fccefso5989258eaf.3; 
 Thu, 27 Apr 2023 05:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682599203; x=1685191203;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J6ET9XLS5jM/TyHq4+UE6o4i1yy/wsCl/8+/RTLOHqY=;
 b=msyOC8BBuy7I5069cJ9Fs6UeK9SnEiNiykDGApouWwIVmp6W+w4i7EI0BD6bwq45Te
 Mv8ooCvRm5eCzKziAc0k3FmoE9HbIC5yDZUY+pqJzuVCHk7IWnWr9+mXvwTTuj9l0Ncz
 CMRlMc3859WHiODGKv/+0U7vSrJpu/RWfAH+SyiwNgsOLmX1BVdKgnoAV2YMsITtsmPL
 iFdrpSLUmvyTf8WJnrfeTYpIh//v5KGODvIhdeuaNW1lM1XD3gmrZ34un2ub2iJvj1wM
 LXVyWM9yoKcEjEPrVn+zY9Fu3t3uKe4w/r4/5m/2yU76S0mRQPAZCd3XfuQMVJwWXUBL
 bGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682599203; x=1685191203;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J6ET9XLS5jM/TyHq4+UE6o4i1yy/wsCl/8+/RTLOHqY=;
 b=Yz1Ddq70Lq77aJFIDwhT+ssCyGtSpAd3Uy2PQO31h4gXdhuV9odZ2aoF0C1ct6tJQh
 Gmus6Szb2CgI6t+8bzUGaMF7QthTZuKlEjxXirCkOxfYg4f0uv5bTlY64jiEL/7+YY/+
 UGeqdnzvIYjoqNIYBvEOd8HYFMDgck52ZtPdaOJA8fisw5tIowr+bgUrpOC4qnAwgaj0
 62MvrSCwazibHDW58uxuNIUkGYOc0mCaJbzNRl2DENFs+8WnRFzT0mY0KjwJ7IBUtsfF
 3qFmF5Znh73UIpGIU0/Zw+a2clmA+3d3ALrOdK9umWPs+y0JNKq/W/5iTdIq2+jb378a
 ViTQ==
X-Gm-Message-State: AC+VfDymsXYhV8lxd4Ypcp6RxqdOW+Sx2bNhHfk2c3XIz87Tp4+z/7Xx
 caoKnyLwY+h5WQcgXN/zyRYUd767uHGIG9Wq8b0=
X-Google-Smtp-Source: ACHHUZ5+5nq8G0fdCC1+vwj+KmJkfoWFgNBUEKtOzD2dq9+mpvse2ZJ72PF955P7xK8j8473xqe+Z9K5Jz67W2iX7LQ=
X-Received: by 2002:aca:1307:0:b0:38e:2879:735b with SMTP id
 e7-20020aca1307000000b0038e2879735bmr563675oii.34.1682599203057; Thu, 27 Apr
 2023 05:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230419122233.3440-1-hackyzh002@gmail.com>
 <CAF6NKda1Jy_wfxaVqWt-o75f1BO-o4JXHY9HS9_JtJ2FHztMmQ@mail.gmail.com>
In-Reply-To: <CAF6NKda1Jy_wfxaVqWt-o75f1BO-o4JXHY9HS9_JtJ2FHztMmQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 Apr 2023 08:39:51 -0400
Message-ID: <CADnq5_MfynMAPU8c-Lq1X_dcDOdRpjW6i=m-Qo8zsZZ=dO-62w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/amdgpu: Fix integer overflow in amdgpu_cs_pass1
To: whitehat002 whitehat002 <hackyzh002@gmail.com>
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As per my prior reply, it has been applied.

Thanks,

Alex

On Thu, Apr 27, 2023 at 8:39=E2=80=AFAM whitehat002 whitehat002
<hackyzh002@gmail.com> wrote:
>
> hello
> What is the current status of this patch, has it been applied?
>
>
> hackyzh002 <hackyzh002@gmail.com> =E4=BA=8E2023=E5=B9=B44=E6=9C=8819=E6=
=97=A5=E5=91=A8=E4=B8=89 20:23=E5=86=99=E9=81=93=EF=BC=9A
> >
> > The type of size is unsigned int, if size is 0x40000000, there will
> > be an integer overflow, size will be zero after size *=3D sizeof(uint32=
_t),
> > will cause uninitialized memory to be referenced later.
> >
> > Signed-off-by: hackyzh002 <hackyzh002@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_cs.c
> > index 08eced097..89bcacc65 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > @@ -192,7 +192,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser =
*p,
> >         uint64_t *chunk_array_user;
> >         uint64_t *chunk_array;
> >         uint32_t uf_offset =3D 0;
> > -       unsigned int size;
> > +       size_t size;
> >         int ret;
> >         int i;
> >
> > --
> > 2.34.1
> >
