Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB673C203F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 09:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A895A6E9CF;
	Fri,  9 Jul 2021 07:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9916E9CB
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 07:52:27 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 x139-20020a4a41910000b0290257bad81ed5so2067727ooa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 00:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NOW4iU40ZcJNgMOEyt9J2OVtJD6l2MDiLIlc7Opm92I=;
 b=lFPkv5/5O5F32ZCgN9nBu4XOIUICSVrU9hxK2QpZk+1vjWau4urywJVJdF3F17nXhg
 N7sjPhQ7LvnkoowJT7aE7g0spMbwjU8jVDJPs/o8tIujAbKbWi6qYtOZyLivWE4BYOcv
 bZ6s/qpm72ViM/c4L4GPdjeiL49dGBpXWFLSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NOW4iU40ZcJNgMOEyt9J2OVtJD6l2MDiLIlc7Opm92I=;
 b=idoDldAQx/KawUG3ZO7x05cgPvHZlyjgURQxsJDNycjp4CfdSdXtCbVF1Rg+VTJR9r
 PNG0KmRnp+HKvgbFXeeogyZdcHjiPI/3opMGSK3sUOsg+uvaTQrCeKgoG/UhGaBxLhyL
 9KjNs9O68KlAUUOHMUnrIPd9xMXm6SB9xQ2RmmiRy84th2CSoX6o5OvQ3cLZolPDvWnR
 pYIuO85miN78kYvZH819rAHpECWIpeTRiWWEzeYN/LFC/dEqnnTrBvmynuUtjp1cXAXZ
 pq3wVriAHA4VPIfzRw3Pz+aas1u6DQrEs/BhTYYG6H8wUjFmz3Fy11EHsfZcE50GzfLB
 dljg==
X-Gm-Message-State: AOAM533f4s0yfqrb66LvGGtUG2V7k4B811y/2NOG+BFxl5VmW5A2naYO
 h/PssZY2xLr3uM49hO5oRTWep/JESXt/qhuuqeWEOw==
X-Google-Smtp-Source: ABdhPJxU4fOisZTk0DY5uSvQ1Q2A9BfOlCOBy7QZFIXMmPR8Wx7ec0t3iOKhqmXK6Q/OfvY8LSi22H1pISgr02ZTcME=
X-Received: by 2002:a4a:9b99:: with SMTP id x25mr26014011ooj.85.1625817146990; 
 Fri, 09 Jul 2021 00:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210708193621.2198733-1-alexander.deucher@amd.com>
 <20210708193621.2198733-2-alexander.deucher@amd.com>
 <a25f93e7-8c03-542c-f594-64a7c1fba292@gmail.com>
In-Reply-To: <a25f93e7-8c03-542c-f594-64a7c1fba292@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 9 Jul 2021 09:52:16 +0200
Message-ID: <CAKMK7uHp8vysDL2DBc-ut_3cYSubsGtgONb1BXhRPwB7oOKbUQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/ttm: Fix COW check
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 9, 2021 at 8:38 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
>
>
> Am 08.07.21 um 21:36 schrieb Alex Deucher:
> > From: Felix Kuehling <Felix.Kuehling@amd.com>
> >
> > KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
> > is_cow_mapping returns true for these mappings. Add a check for
> > vm_flags & VM_WRITE to avoid mmap failures on private read-only or
> > PROT_NONE mappings.
>
> I'm pretty sure that this is not working as expected.
>
> >
> > Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
> > Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > ---
> > drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_=
bo_vm.c
> > index f56be5bc0861..a75e90c7d4aa 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > @@ -552,7 +552,7 @@ static const struct vm_operations_struct ttm_bo_vm_=
ops =3D {
> >   int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_obj=
ect *bo)
> >   {
> >       /* Enforce no COW since would have really strange behavior with i=
t. */
> > -     if (is_cow_mapping(vma->vm_flags))
> > +     if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
>
> is_cow_mapping() already checks for VM_MAYWRITE, so this here shouldn't
> be necessary.

MAYWRITE !=3D WRITE

But then you need to make sure you do catch mprotect() calls to catch
the cow, and I'm not sure that's even possible. Otherwise it'll go
boom again on the page refcount.
-Daniel

>
> Christian.
>
> >               return -EINVAL;
> >
> >       ttm_bo_get(bo);
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
