Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA8A546A06
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 18:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005D0112253;
	Fri, 10 Jun 2022 16:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF6210EA8E;
 Fri, 10 Jun 2022 16:00:46 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id h187so22980591oif.4;
 Fri, 10 Jun 2022 09:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xTaP75rEEOCgzDrru39XYNtodN5gIuoAFqXs5KWje9A=;
 b=mWD4TFocKJWvg6wRvCjHbilNC4Xe5Dooig19VsKxKhJdtQBfeIstWHMhdhdf9Tb8M+
 Uia6L23Cz8Rd+xrBhkn/aIb8nuY5Yg454G3XjM/I0/fGb5kntNFUapcEFMi9UG4re1SV
 6MGViP/X0nmJsu2wgMkZqEFhJlQQaCyscFXJGW4zJ/49a3C3JMoY0ZjeniYU5jcanxin
 6S035wiL7S/RIT/VB6nNecTg0wneijpxZN7ye6I84sf5EH9N1nYF8yXQ1bSbsyIHyKmA
 MeiXNu+Biiac5BYXcv9TXT7XTnvcOQN5g8Q5gzAyu+SgYA4SpjXYglwvqzMNyZoxqzIQ
 U/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xTaP75rEEOCgzDrru39XYNtodN5gIuoAFqXs5KWje9A=;
 b=hhmbmxEH9V9UcG98i1orjPdaLq7VuuNc+ieJSh1Dr10DnbRBeiw5IC6ALMEBKwh6cQ
 r7mmkdBxk+3laeD3xAfqJcVMdnjsrwnFAuzf9MFnUHrqIgAUOqFDgNcwDTY8/WwQ7jgp
 8WoJrDiZK90NRzXopEDbUPxhizpt0UO4w3KgRKU0o0fywSAOoHqC7pCTLy0l1KvHZ4zT
 zAldgbrA3EiVZY916+U5htw33Y3Q9WWWWeskS1nPojoJRTShV8LCSgVt54k5kutfQjuE
 4nkN7mHHReCXR+tD6qXaliJCFdX2OrD/I0HJuD3WgmAL9UyzfIlGCmtJZsCt7gBnGovk
 4+9g==
X-Gm-Message-State: AOAM531QJ4YWjOvpDdVmDZRe8295TQ7ZQLanYUyaGndDuVLJ5/SVa0Zo
 xGeQtrhhoXpANtqLgXx4wpg0iMfid+YsGZjX2e4=
X-Google-Smtp-Source: ABdhPJzp2bufZPOpt3z0DYKTW5sZiyFfVIRrHXwCCNUgHR2nUcUN0Mo41zswRwLyvmRtpFsPDwe80PJjIPqZ3MlLv/4=
X-Received: by 2002:a54:4f01:0:b0:32e:726c:bced with SMTP id
 e1-20020a544f01000000b0032e726cbcedmr250347oiy.253.1654876845780; Fri, 10 Jun
 2022 09:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220610135426.670120-1-michel@daenzer.net>
In-Reply-To: <20220610135426.670120-1-michel@daenzer.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Jun 2022 12:00:34 -0400
Message-ID: <CADnq5_P-OLS_nAA738V4tuqXFKGMm-=sZVE_FoWSEAVnkk7sFw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix GTT size reporting in amdgpu_ioctl
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Jun 10, 2022 at 10:01 AM Michel D=C3=A4nzer <michel@daenzer.net> wr=
ote:
>
> From: Michel D=C3=A4nzer <mdaenzer@redhat.com>
>
> The commit below changed the TTM manager size unit from pages to
> bytes, but failed to adjust the corresponding calculations in
> amdgpu_ioctl.
>
> Fixes: dfa714b88eb0 ("drm/amdgpu: remove GTT accounting v2")
> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1930
> Bug: https://gitlab.freedesktop.org/mesa/mesa/-/issues/6642
> Signed-off-by: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_kms.c
> index 801f6fa692e9..6de63ea6687e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -642,7 +642,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *d=
ata, struct drm_file *filp)
>                             atomic64_read(&adev->visible_pin_size),
>                             vram_gtt.vram_size);
>                 vram_gtt.gtt_size =3D ttm_manager_type(&adev->mman.bdev, =
TTM_PL_TT)->size;
> -               vram_gtt.gtt_size *=3D PAGE_SIZE;
>                 vram_gtt.gtt_size -=3D atomic64_read(&adev->gart_pin_size=
);
>                 return copy_to_user(out, &vram_gtt,
>                                     min((size_t)size, sizeof(vram_gtt))) =
? -EFAULT : 0;
> @@ -675,7 +674,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *d=
ata, struct drm_file *filp)
>                         mem.cpu_accessible_vram.usable_heap_size * 3 / 4;
>
>                 mem.gtt.total_heap_size =3D gtt_man->size;
> -               mem.gtt.total_heap_size *=3D PAGE_SIZE;
>                 mem.gtt.usable_heap_size =3D mem.gtt.total_heap_size -
>                         atomic64_read(&adev->gart_pin_size);
>                 mem.gtt.heap_usage =3D ttm_resource_manager_usage(gtt_man=
);
> --
> 2.36.1
>
