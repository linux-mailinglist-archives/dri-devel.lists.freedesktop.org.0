Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC999704FAB
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 15:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D7110E219;
	Tue, 16 May 2023 13:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6B010E21B;
 Tue, 16 May 2023 13:43:40 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-54f812f77a7so5286284eaf.2; 
 Tue, 16 May 2023 06:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684244619; x=1686836619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MNDS3X2rHZf3sL9RvpDtqqqmEvoK2Fx0XI17YW4oQ6Y=;
 b=iC9Hof1RuzRecyJIDDdI0yOsOfQOhQRq2EBkhJMutXKM7rlWPTStfNC4LHCyafK9q0
 wYeIaINHKL3e3ZuSM2QrpNyRy448cwLou2QWUrZCCzjY7A8FY6TdKTVdnuYWhDjgL57h
 NDgJQyXPhScY7l8/wVM6gE6J9Qu0FUspuH6vm6oD+8tWyUsrDJxTypSRQng0NdL10L/9
 Sccwhf7uqcPiDI0UXYmvNlj50vZ6NRKOFdekSSi1TFwNzkQhDTO2abd4OnI7/qDWYPXF
 IhapqCoZV1J6uWInZH2cIXPuRGAHHnvWo2y54oTG2OVV/XOHLK3mQPcDW1/8fa3sQ8jP
 AYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684244619; x=1686836619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MNDS3X2rHZf3sL9RvpDtqqqmEvoK2Fx0XI17YW4oQ6Y=;
 b=XVUHzbyj7Pal6KLjGx44kv3QsMjBkGAgsUKGnOjYd9tBNgOc8IucEUxM7QoWoI9sWG
 vYYakSvBtRzyy+Ky6Ubq6KdinhaXmyCsv1vRX1IC+pw+uDUQ28SxQEAcmfbXAG8Zq4nm
 fXM8MKkz3/5BJDiSrcpXyIIRn3PQMCiCJ5R6IeaU/5QvWEM+5FbsPx9hRJCjylKczrey
 Aj5PzQLGe1WfhzogJ+bF3ygWKeKLAEock4/34yrdUOMXMTv2OFwUEf6ue9qvyXrlvdn7
 ZKXPh/MGNT3YSHcmCwwGBN7dzSUbwlwROfm0TcMr6aDs8Zb3pGRkDxGoakFcb5N/Iy2z
 m/OA==
X-Gm-Message-State: AC+VfDwwWgSB7f8Gg+HGpIYOfyjwDEdeEm3b2UqW7G1mIe6htBG9gQnM
 reTCUPVkFpvrOkVR+ut3ZuHCuf+HVlJ3pMZBaow=
X-Google-Smtp-Source: ACHHUZ6RKrjDlM0Mb/+pcQN0RJSb4OCFLp9HAkUXJmi8j2zCPLht+6LlrLPl7FWnxnxj/+fMIY+zfqxmrIfzS39ZbXY=
X-Received: by 2002:a4a:6c54:0:b0:54f:53f5:b1ea with SMTP id
 u20-20020a4a6c54000000b0054f53f5b1eamr11100353oof.8.1684244619385; Tue, 16
 May 2023 06:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230503231507.279172-1-sukrut.bellary@linux.com>
 <0df418ad-3492-4241-1837-55ed89b77e10@linux.com>
In-Reply-To: <0df418ad-3492-4241-1837-55ed89b77e10@linux.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 May 2023 09:43:28 -0400
Message-ID: <CADnq5_NVEZ5cC3JMtJu5MFWSL+3rApgKyC0XJKVEHvKSeDrB0w@mail.gmail.com>
Subject: Re: [PATCH] drm:amd:amdgpu: Fix missing buffer object unlock in
 failure path
To: Sukrut Bellary <sukrut.bellary@linux.com>
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
Cc: Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org, ray.huang@amd.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 Hawking.Zhang@amd.com, Jiadong.Zhu@amd.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, May 15, 2023 at 6:27=E2=80=AFPM Sukrut Bellary <sukrut.bellary@linu=
x.com> wrote:
>
>
> On 5/3/23 16:15, Sukrut Bellary wrote:
> > smatch warning -
> > 1) drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:3615 gfx_v9_0_kiq_resume()
> > warn: inconsistent returns 'ring->mqd_obj->tbo.base.resv'.
> >
> > 2) drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6901 gfx_v10_0_kiq_resume()
> > warn: inconsistent returns 'ring->mqd_obj->tbo.base.resv'.
> >
> > Signed-off-by: Sukrut Bellary <sukrut.bellary@linux.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 4 +++-
> >  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c  | 4 +++-
> >  2 files changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/a=
md/amdgpu/gfx_v10_0.c
> > index 8bd07ff59671..66d5c5d68454 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> > @@ -6891,8 +6891,10 @@ static int gfx_v10_0_kiq_resume(struct amdgpu_de=
vice *adev)
> >               return r;
> >
> >       r =3D amdgpu_bo_kmap(ring->mqd_obj, (void **)&ring->mqd_ptr);
> > -     if (unlikely(r !=3D 0))
> > +     if (unlikely(r !=3D 0)) {
> > +             amdgpu_bo_unreserve(ring->mqd_obj);
> >               return r;
> > +     }
> >
> >       gfx_v10_0_kiq_init_queue(ring);
> >       amdgpu_bo_kunmap(ring->mqd_obj);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/am=
d/amdgpu/gfx_v9_0.c
> > index bce6919d666a..d5715d8a4128 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > @@ -3617,8 +3617,10 @@ static int gfx_v9_0_kiq_resume(struct amdgpu_dev=
ice *adev)
> >               return r;
> >
> >       r =3D amdgpu_bo_kmap(ring->mqd_obj, (void **)&ring->mqd_ptr);
> > -     if (unlikely(r !=3D 0))
> > +     if (unlikely(r !=3D 0)) {
> > +             amdgpu_bo_unreserve(ring->mqd_obj);
> >               return r;
> > +     }
> >
> >       gfx_v9_0_kiq_init_queue(ring);
> >       amdgpu_bo_kunmap(ring->mqd_obj);
>
> Follow-up.
> Could you please review this patch?
>
>
> --
> Regards,
> Sukrut
