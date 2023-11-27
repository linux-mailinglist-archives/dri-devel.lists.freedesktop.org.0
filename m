Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BDB7FAD5A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 23:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06AA10E0CF;
	Mon, 27 Nov 2023 22:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F6210E0CF;
 Mon, 27 Nov 2023 22:20:50 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1fa1c3755afso1183078fac.1; 
 Mon, 27 Nov 2023 14:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701123649; x=1701728449; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uOCoZok9ZC4QmtYsZ8TfeK+iIljTTrbyrnD/jz9we80=;
 b=Nx+O1DHoS3UgnDS+dDbVpQGWPpm+e//cr/cHEHIGsXVR3wEWzb9GO4X+qYFmkrcQJE
 YP1oP1x3BgRcfgLxkbMKIVRHI+6jMR1bj3sp5X2nUfR/HpJdQgn0IHH/NkyQc5smjx30
 pF7lBWLRfN1gXJ9g92l1e8x0IU1xCJu414YuV7o8kyvQF5Xko7nluFfLPBpWJIiVAdFA
 +E5m1eYVKfcDAnW/mQs0KmS4Fs0P01jEYJU/RtTuE6FASwAlOlAsw45dElpBlt9FBBpE
 AU0ihchpEoNvdHoz3cg/CMVh/NKAYz7qBX9m3lxbaQzikidHGBvFdWUDxZkVT4ChWcVc
 e8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701123649; x=1701728449;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uOCoZok9ZC4QmtYsZ8TfeK+iIljTTrbyrnD/jz9we80=;
 b=HKyDBoyriSu+P/A9FNttCcFdMh/DAx6sKzznsxe8Yk79NsGo2GypN1T/949vEHudv6
 lBRH7uwfkPRKU4OW4Md4mztu+hI6IhppTSlRMy4p7iEqFw3wc4AXsTTHFiVZ4uKLs2T/
 dqJDiMotohWDHuaNHlGTZ5EjNL8Zy9f+tEms1I3qFQB3lzNahghGBKsDgr5E10UKqF1w
 rr1bpWZ3cx8YABW9XK2Pe0qdgheUCOfyG4RxljMebSCTqsz13jbbVmCA9CZadl57o3Eq
 z9X2zvVsV2tHeCbxIgLpikd6NcPrSPdyMhuOc9rlUkIk2/jyGK304DhVpRVP58CARBxO
 1k6g==
X-Gm-Message-State: AOJu0YzLYAi3NkF0gCV24jKlAUoqlSk06lPGOtZJYqTUASI4CnO5B+hl
 KFlQu8em3CZgOEpaw8/PRvZOmPM6ZNqiYLKwu68=
X-Google-Smtp-Source: AGHT+IG606uGqVxVZUsnYhGnoio+vCyrTchzuHhHlW4YCPROWTyaN9UgJO6ZL1UuPP5MxYL7nL/3g2frkr9mEuro9o0=
X-Received: by 2002:a05:6870:1603:b0:1f9:eb7e:6621 with SMTP id
 b3-20020a056870160300b001f9eb7e6621mr6732690oae.18.1701123649584; Mon, 27 Nov
 2023 14:20:49 -0800 (PST)
MIME-Version: 1.0
References: <20231122093509.34302-1-yaolu@kylinos.cn>
 <20231123012234.5783-1-yaolu@kylinos.cn>
 <80ea6067-c531-4765-8576-265e565525fa@amd.com>
In-Reply-To: <80ea6067-c531-4765-8576-265e565525fa@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Nov 2023 17:20:38 -0500
Message-ID: <CADnq5_M7TjyM5n7X1mvxRzrckd4meVsvJMrMyt-BpciEPcqC-Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: Fix cat debugfs amdgpu_regs_didt causes
 kernel null pointer
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Lu Yao <yaolu@kylinos.cn>, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Nov 23, 2023 at 3:22=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 23.11.23 um 02:22 schrieb Lu Yao:
> > For 'AMDGPU_FAMILY_SI' family cards, in 'si_common_early_init' func, in=
it
> > 'didt_rreg' and 'didt_wreg' to 'NULL'. But in func
> > 'amdgpu_debugfs_regs_didt_read/write', using 'RREG32_DIDT' 'WREG32_DIDT=
'
> > lacks of relevant judgment. And other 'amdgpu_ip_block_version' that us=
e
> > these two definitions won't be added for 'AMDGPU_FAMILY_SI'.
> >
> > So, add null pointer judgment before calling.
> >
> > Signed-off-by: Lu Yao <yaolu@kylinos.cn>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> > Changes in v2:
> >    1. Drop dev_err message.
> >    2. Change error code from 'EPERM' to 'EOPNOTSUPP'
> > Link to v1: https://lore.kernel.org/all/20231122093509.34302-1-yaolu@ky=
linos.cn/
> > Thanks Christian for his comments.
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_debugfs.c
> > index a53f436fa9f1..e098cd66fa2a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > @@ -638,6 +638,9 @@ static ssize_t amdgpu_debugfs_regs_didt_read(struct=
 file *f, char __user *buf,
> >       if (size & 0x3 || *pos & 0x3)
> >               return -EINVAL;
> >
> > +     if (adev->didt_rreg =3D=3D NULL)
> > +             return -EOPNOTSUPP;
> > +
> >       r =3D pm_runtime_get_sync(adev_to_drm(adev)->dev);
> >       if (r < 0) {
> >               pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> > @@ -694,6 +697,9 @@ static ssize_t amdgpu_debugfs_regs_didt_write(struc=
t file *f, const char __user
> >       if (size & 0x3 || *pos & 0x3)
> >               return -EINVAL;
> >
> > +     if (adev->didt_wreg =3D=3D NULL)
> > +             return -EOPNOTSUPP;
> > +
> >       r =3D pm_runtime_get_sync(adev_to_drm(adev)->dev);
> >       if (r < 0) {
> >               pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>
