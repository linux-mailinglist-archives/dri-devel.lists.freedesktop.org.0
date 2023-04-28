Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B106E6F12C7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 09:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F74510EC6F;
	Fri, 28 Apr 2023 07:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B9F10E20E;
 Fri, 28 Apr 2023 00:45:52 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5068e99960fso15984347a12.1; 
 Thu, 27 Apr 2023 17:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682642749; x=1685234749;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kl96LCCkpjgD23grkbS1yyST45SlEkE3SGRzL04YVVA=;
 b=RJAufDGR1WE8/kTpjEXn/SvE1akzytsLkLMSFAJuQmkq+aQ8VH3RyUdR1ZfgYEC01H
 dmeIFGhI24rxqIiby9nWCw+j8K0i3X9sQbFmN75plsAoXnd9Zj8Q6o2R6qjte3BuY417
 hUaAJ6cnQ30c2uNMkqx3cFnGaRy1ap/Rj1eGCPQ/w/mi24OP2rRGsSjBcondz35Q+U8g
 nqYb0c1YNnlph2ix5Sq0pZm4FK1G8TCXFubpXMmi0pHzzxZPy5Xf4JLqT1mavNSfSUoh
 l3q1uIo1B1tNbnDB1xi7cAl8jrXPKyYBmAKg76zKhV4tinMQXyTUkdWTeHBOHS0KjO7j
 KWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682642749; x=1685234749;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kl96LCCkpjgD23grkbS1yyST45SlEkE3SGRzL04YVVA=;
 b=CGxoDSEQCoX6auPQqdkUSf7aLzo0hLq+2aCUJTQCNx0B0WBiy6b6mA5wqBEzk9gmIM
 ah+G8aSXgXTZRXoNk65D2sZp8oQuRVNpMqunMYZ6JCIXY5ri9rDlG+G3hlwJSGgcmjjk
 3DrB+53lO/6eRdvSGNqQV/HTLA9HZx9SZLpIMqr0laKrbxAWNMIkxt/+mBPviIjjKjmd
 qD4FLQXnYgud7JlTBwJ0Qoo0ZOOV0gstdHhiYohmCYc8xAAtQuQ2eWPJo7qRM2LyLVTa
 /ff29QCiy6PNByANvdWnErUndHY+Lvraqd5L0yer6x155hYJXzApSLTTcUOxyigtUJdZ
 /RVw==
X-Gm-Message-State: AC+VfDzEV3JxVbIXxY1/Hej43NDkfFLZQ6e81KMvsKmey//JkdZLAPKI
 Lf6qXFtLHzF36PFgbOrSjjOrJKGEzMDho+YZlHs=
X-Google-Smtp-Source: ACHHUZ7B0b4msmyMH8xuBKiO++UE2DzmKb86fdqinlxALx425ntv5PITQowYd8G9Wnbi1TbWybLGz4JLLXngOlOJbf8=
X-Received: by 2002:a17:906:dc93:b0:94e:5708:1564 with SMTP id
 cs19-20020a170906dc9300b0094e57081564mr4377799ejc.22.1682642749260; Thu, 27
 Apr 2023 17:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230419122233.3440-1-hackyzh002@gmail.com>
 <CAF6NKda1Jy_wfxaVqWt-o75f1BO-o4JXHY9HS9_JtJ2FHztMmQ@mail.gmail.com>
 <CADnq5_MfynMAPU8c-Lq1X_dcDOdRpjW6i=m-Qo8zsZZ=dO-62w@mail.gmail.com>
In-Reply-To: <CADnq5_MfynMAPU8c-Lq1X_dcDOdRpjW6i=m-Qo8zsZZ=dO-62w@mail.gmail.com>
From: whitehat002 whitehat002 <hackyzh002@gmail.com>
Date: Fri, 28 Apr 2023 08:45:36 +0800
Message-ID: <CAF6NKdaxK_ZRkKRyWtm9Cj-8fNE9RptW3FjW-V39rmaHaCGHTw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/amdgpu: Fix integer overflow in amdgpu_cs_pass1
To: Alex Deucher <alexdeucher@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 28 Apr 2023 07:47:34 +0000
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

Alex,I have a question, why I don't see it on the
https://patchwork.freedesktop.org/

Alex Deucher <alexdeucher@gmail.com> =E4=BA=8E2023=E5=B9=B44=E6=9C=8827=E6=
=97=A5=E5=91=A8=E5=9B=9B 20:40=E5=86=99=E9=81=93=EF=BC=9A
>
> As per my prior reply, it has been applied.
>
> Thanks,
>
> Alex
>
> On Thu, Apr 27, 2023 at 8:39=E2=80=AFAM whitehat002 whitehat002
> <hackyzh002@gmail.com> wrote:
> >
> > hello
> > What is the current status of this patch, has it been applied?
> >
> >
> > hackyzh002 <hackyzh002@gmail.com> =E4=BA=8E2023=E5=B9=B44=E6=9C=8819=E6=
=97=A5=E5=91=A8=E4=B8=89 20:23=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > The type of size is unsigned int, if size is 0x40000000, there will
> > > be an integer overflow, size will be zero after size *=3D sizeof(uint=
32_t),
> > > will cause uninitialized memory to be referenced later.
> > >
> > > Signed-off-by: hackyzh002 <hackyzh002@gmail.com>
> > > ---
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_cs.c
> > > index 08eced097..89bcacc65 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > > @@ -192,7 +192,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parse=
r *p,
> > >         uint64_t *chunk_array_user;
> > >         uint64_t *chunk_array;
> > >         uint32_t uf_offset =3D 0;
> > > -       unsigned int size;
> > > +       size_t size;
> > >         int ret;
> > >         int i;
> > >
> > > --
> > > 2.34.1
> > >
