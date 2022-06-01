Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A8A539FD1
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E9610E042;
	Wed,  1 Jun 2022 08:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189FD10E042
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:49:22 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id p13so1731369ybm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 01:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=twyQpYkLzDtTksIi+fqqpTWAsHeL0BdUZqIZPaQc3rU=;
 b=CWCWAv+0K/4frBtytvKDbDvPqIqnFgUK+U8Cg6Ezymzf6wyuIV+ICvHkpUmyPqp6hz
 HA+kumChdJMrvPbrVSRfciprhxBS9C5iiYCJXCrIMXiYFDFL+uwXGAnH5ET9vJEuUBma
 FvqCyMbGisu0hNm6XgY18TjsiSQB/aqqLdUYoCQDRwqZLWxJ1PZuUKpxzE146zvnH6tP
 OeMv8SfhSGbQwxNhJNV4UsaBQPCRBii1BWyH87WRlLbPxdc7Op03ojJO7Ay6YX0odoAf
 51kJGkJcBlpYZ+CMWPNImtkOtEBIq+07Uprjd0vyo+YIEnojGV96UB4xp4Ayq2qPcj3E
 bpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=twyQpYkLzDtTksIi+fqqpTWAsHeL0BdUZqIZPaQc3rU=;
 b=p89YcTmnM8vi6PC2uobugIMQAwFFUiZtQUottOBD4NnEi7t8arzAhZAhFmMEL2QRtt
 Yve6QDtjyW1/+LA8sOoKCS1T+3R+nEang+b5YIsXGKWudbT31CeHrv6ICExEQ82MPina
 5437rTNcS0wr50ylIN+noFAQYh9Na75DSCWptrVtetd3EGfHUev3DYy83ZwvYkFtfi21
 oMU5FVm0lwa6/I3QragnklcIP/1RokW8uxQI+hgvbRSq83aaIaYDMfK0z0voimVrLQ/+
 JsQOhZ5HJxqttoAOfVhfJDqOH1aKcrKe/JSdbJKoF0ez5jRjWA2OQdgrH4WrzJ6OZNXT
 eo0w==
X-Gm-Message-State: AOAM532JGDCfIkB8QlHk6AHt5tKs9n3ao/EvPCcdpplpWupOUig7GkSz
 6t+IOqmlKDG63f4qpR6fTfJF+y+LQ2DYYDNgidlWwQ==
X-Google-Smtp-Source: ABdhPJyBrAdMdzoy8FQYuUJ1VdPPYaem4g7Gzgs0FDeWLry4/9fp86NbFABW/e8o7Cu7ClcQcM7h8LHfR2n9o469g38=
X-Received: by 2002:a05:6902:124a:b0:65d:3798:202f with SMTP id
 t10-20020a056902124a00b0065d3798202fmr8461477ybu.368.1654073361296; Wed, 01
 Jun 2022 01:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
 <20220601004014.158247-4-bas@basnieuwenhuizen.nl>
 <e4d8ea99-ceb5-b0dc-362f-94e37b9ddc6b@amd.com>
 <CAP+8YyEy8R3nbJVFkqHnh=3VsmfWKsQyY45tcWTQhm3hujBRbg@mail.gmail.com>
 <e502a4b7-e927-2abf-9014-0b23d15d401b@amd.com>
In-Reply-To: <e502a4b7-e927-2abf-9014-0b23d15d401b@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Wed, 1 Jun 2022 10:48:06 +0200
Message-ID: <CAP+8YyHdbrvA-sJ=VZccmLkyZ9WCO7CnOp5K0pMoXA=MrHLCsw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 1, 2022 at 10:40 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 01.06.22 um 10:16 schrieb Bas Nieuwenhuizen:
> > On Wed, Jun 1, 2022 at 10:03 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 01.06.22 um 02:40 schrieb Bas Nieuwenhuizen:
> >>> This should be okay because moves themselves use KERNEL usage and
> >>> hence still sync with BOOKKEEP usage. Then any later submits still
> >>> wait on any pending VM operations.
> >>>
> >>> (i.e. we only made VM ops not wait on BOOKKEEP submits, not the other
> >>>    way around)
> >> Well NAK again. This allows access to freed up memory and is a complet=
e
> >> no-go.
> > How does this allow access to freed memory? Worst I can see is that
> > the unmap happens earlier if the app/drivers gets the waits wrong,
> > which wouldn't give access after the underlying BO is freed?
>
> To free up memory we need to update the PTEs and then flush those out by
> invalidating the TLB.
>
> On gfx6, gfx7 and gfx8 and some broken gfx10 hw invalidating the TLB can
> only be done while the VMID is idle.
>
> Only gfx9 can reliable invalidate the TLB while it is in use and even
> there it comes with quite some performance penalty (at TLB invalidation
> can take multiple seconds).
>
> Because of this what we do in the kernel driver is to sync to everything
> when we unmap entries:
>
>          if (!(flags & AMDGPU_PTE_VALID))
>                  sync_mode =3D AMDGPU_SYNC_EQ_OWNER;
>          else
>                  sync_mode =3D AMDGPU_SYNC_EXPLICIT;
>
> This acts as a barrier for freeing the memory. In other words we
> intentionally add a bubble which syncs everything.
>
> I'm working for month on a concept how to do all this without causing
> the stalls you observer, but so far didn't came to much of a conclusion.

That might cause an unmap operation too early, but for freeing up the
actual backing memory we still wait for all fences on the BO to finish
first, no? In that case, since BOOKKEEP fences are still added for
explicit sync, that should not be a problem, no?

(If not, that sounds like the obvious fix for making this work?)
>
> Regards,
> Christian.
>
> >
> >> Regards,
> >> Christian.
> >>
> >>> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> >>> ---
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c  | 2 +-
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 2 +-
> >>>    2 files changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_vm_cpu.c
> >>> index f10332e1c6c0..31bc73fd1fae 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> >>> @@ -51,7 +51,7 @@ static int amdgpu_vm_cpu_prepare(struct amdgpu_vm_u=
pdate_params *p,
> >>>        if (!resv)
> >>>                return 0;
> >>>
> >>> -     return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode, sync_=
mode, p->vm, true);
> >>> +     return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode, AMDGP=
U_SYNC_EXPLICIT, p->vm, true);
> >>>    }
> >>>
> >>>    /**
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_vm_sdma.c
> >>> index 63b484dc76c5..c8d5898bea11 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> >>> @@ -75,7 +75,7 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_=
update_params *p,
> >>>        if (!resv)
> >>>                return 0;
> >>>
> >>> -     return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode=
, sync_mode, p->vm);
> >>> +     return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode=
, AMDGPU_SYNC_EXPLICIT, p->vm);
> >>>    }
> >>>
> >>>    /**
>
