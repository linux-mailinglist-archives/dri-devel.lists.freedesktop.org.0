Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DAA6EFDB4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 00:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C7510EA8B;
	Wed, 26 Apr 2023 22:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A509910EA89;
 Wed, 26 Apr 2023 22:56:57 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-94f161ee14fso215629266b.0; 
 Wed, 26 Apr 2023 15:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682549814; x=1685141814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pBhzFCZdf4Jbh75KGo5B89HqNoWDSV7R2Pmerxt+rW4=;
 b=LpFODiDkSIVixvf9ouvk5M5aDm3WcymrtGE3vm8471N4AcSI9tm1U5ZXWuCPGfW6BY
 qUUC0mHcFet7NxnuEq5UkQFyhgS1S9hahB0X3eo9H7i7FW2j3SIACVCqD0HqnboYZO7E
 zVV4g4oI4ze94vW/qf1jppK3Yn3JcRbC2ijNHaSuuhNFDzwUDbjhF/hd47xdI5v24Dm3
 dmrsytRYsC4y9m3bWzQ28vPnI5V8kN1hZIUV25g9dZTE1+aicbpm0GhbhZdCarg6D/ZI
 MO9LxSUs3zpN/rDqyedRbaYx8UdnDxwz3cDTm4tJjTK4xmAOE13wSHDRNKgCRvSPNWKv
 Be4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682549814; x=1685141814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pBhzFCZdf4Jbh75KGo5B89HqNoWDSV7R2Pmerxt+rW4=;
 b=XS8/maFvg/H2PSYab+PDEzImipVL0YaIc3N2qLbsCsCw92DYmiN2VxJHEk5Q6M+LRU
 fW/mpXjnLnZX0Bhi4i3eVRz0YxpRZyvLTYzryP4iga66nw7xzQJ1dXX8dhyFg6pBcLgV
 6PQtPDV1g0G85PyWcukZyNAt2P3/G2EBuQrVYQqAGLj7IjErAv/7k9ChE6J3qCPmNObO
 9XVkaeUhCHfV3bs7VDU//kzWNpCYKdtnZczYtyji+O/Ct85Nupj8FSBcHN8ssGLPI7qa
 ipJK3Ixsrnx9ur2usqd94F1ZSsZ6R/FcJte0iXbZ26NbxaKiOZZgmbxjN+ye93oNCxgn
 cU+g==
X-Gm-Message-State: AC+VfDyAfw2lgAY78hghI7JTlTRu3TjjSU0Nh8KFeW5vRAUUgqtA8xgY
 Ey+fGqL9MvwU0C5ut3V0tYzVphgsWc571mRAoOI=
X-Google-Smtp-Source: ACHHUZ4xqgwrReuBkZDAs5+0gPDVQxHaweWWSJ7AxZ4/23kxSn87zsupxtl5omjyhVUXgXjTCaWuePzfE3NXB0sR7kI=
X-Received: by 2002:a17:906:51d4:b0:92f:27c2:13c0 with SMTP id
 v20-20020a17090651d400b0092f27c213c0mr281218ejk.6.1682549813740; Wed, 26 Apr
 2023 15:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230426061718.755586-1-olvaffe@gmail.com>
 <f889f994-d2cd-fedc-8c95-9c8501037809@amd.com>
In-Reply-To: <f889f994-d2cd-fedc-8c95-9c8501037809@amd.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 26 Apr 2023 15:56:42 -0700
Message-ID: <CAPaKu7SNWERgdeg7uvSFfJV_PSndbPwy1VCjEyLk3bkXCepq-g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: add a missing lock for AMDGPU_SCHED
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
Cc: amd-gfx@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 4:05=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 26.04.23 um 08:17 schrieb Chia-I Wu:
> > mgr->ctx_handles should be protected by mgr->lock.
> >
> > v2: improve commit message
> >
> > Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> > Cc: stable@vger.kernel.org
>
> Please don't manually CC stable@vger.kernel.org while sending patches
> out, let us maintainers push that upstream with the appropriate tag and
> Greg picking it up from there.
>
> A Fixes tag and figuring out to which stable versions this needs to be
> backported are nice to have as well, but Alex and I can take care of
> that as well.
>
> Apart from that the technical side of the patch is Reviewed-by:
> Christian K=C3=B6nig <christian.koenig@amd.com>.
All done.  Thanks for clarifying the process and sorry for getting it
wrong in the first place :(
>
> Regards,
> Christian.
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_sched.c
> > index e9b45089a28a6..863b2a34b2d64 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
> > @@ -38,6 +38,7 @@ static int amdgpu_sched_process_priority_override(str=
uct amdgpu_device *adev,
> >   {
> >       struct fd f =3D fdget(fd);
> >       struct amdgpu_fpriv *fpriv;
> > +     struct amdgpu_ctx_mgr *mgr;
> >       struct amdgpu_ctx *ctx;
> >       uint32_t id;
> >       int r;
> > @@ -51,8 +52,11 @@ static int amdgpu_sched_process_priority_override(st=
ruct amdgpu_device *adev,
> >               return r;
> >       }
> >
> > -     idr_for_each_entry(&fpriv->ctx_mgr.ctx_handles, ctx, id)
> > +     mgr =3D &fpriv->ctx_mgr;
> > +     mutex_lock(&mgr->lock);
> > +     idr_for_each_entry(&mgr->ctx_handles, ctx, id)
> >               amdgpu_ctx_priority_override(ctx, priority);
> > +     mutex_unlock(&mgr->lock);
> >
> >       fdput(f);
> >       return 0;
>
