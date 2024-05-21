Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBE88CAEBC
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 14:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B645289EF7;
	Tue, 21 May 2024 12:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="jJC7Gapm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D1889EF7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 12:58:27 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52397dd31a0so705154e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 05:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1716296306; x=1716901106; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xL4sO2Du5udtePocStbPxV+46lZn+8qWvHd7QbGr4NQ=;
 b=jJC7GapmJY5dwLr8kdYO9QkfchHirASVDpf4jgjNpnhxgd5T5CUQjCZi+kKRK/Weah
 pYvRPzOt3+faCVwP9Tr36M3PhwIESqyQiHGEfoVg70HPWLE0OQKaVy/9Z0emH6dH661i
 gfD8/dRqV6PZPYFUG8g5IF3xOaFvuj1GK6M+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716296306; x=1716901106;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xL4sO2Du5udtePocStbPxV+46lZn+8qWvHd7QbGr4NQ=;
 b=ssL2DRkyddTTA3/OsiRyR5phs+kX97rcZx9XNG985aqIOpfybukPUurQMkseRaEtZM
 QZVwEX5Y0YKxgZ9nxdKf8XIIeEfo7IC/8LHRwOIQ2075G78/uSK4cVNTCpHMcnQGcusG
 sMin+7Fa8lLmUNOB2+P+LCcPk6c2NdekGPImWj6CjQJjFiG7LZoNTTbKabNOpgbiXbKb
 lHmjgPt2TpUTM+cc/evWiOKu7o6SC7BAgVKkDBLoQSC4qje9ogbS2QzgEu708yD/OSJ3
 vSCYaD4zCGtB9Gh8gx5lN/Dfc5Wr1OX1ddjF7bluhkT39RY4jFSTXZArSx16RbK5x10L
 UVJg==
X-Gm-Message-State: AOJu0Yx8hChAHwGOGO12gZ0gfWP2PgeYsziIo6QqdRltEQyERPM+lqn4
 ENd9J4X6GYGJkeGinyIq74c0Rv/6aXIF+gAe6gwPDWCtWtMDePeXazGULx+lWSATdfrCbQvEpQe
 qYwhQb7VAADjXasRd0lhrUwNXD/VjV2kcAvXkdw==
X-Google-Smtp-Source: AGHT+IGWEfy2X6cC8DVw9rDd+ZVNbuUXVS091grZksXxwgGTDkygIdCxsI9rrnx/WN/BzZz1nXWZnrZNUrRsdtx3HvM=
X-Received: by 2002:a05:6512:3c9e:b0:51f:3bc2:1ed2 with SMTP id
 2adb3069b0e04-52210478710mr22489408e87.4.1716296305878; Tue, 21 May 2024
 05:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240520100514.925681-1-jacek.lawrynowicz@linux.intel.com>
 <ZkyVyLVQn25taxCn@phenom.ffwll.local>
In-Reply-To: <ZkyVyLVQn25taxCn@phenom.ffwll.local>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 21 May 2024 14:58:12 +0200
Message-ID: <CAKMK7uFnOYJED0G2XJk4mf-dAD1VWrpVUvccFGz_g2sZSpTsVA@mail.gmail.com>
Subject: Re: [PATCH] drm/shmem-helper: Fix BUG_ON() on mmap(PROT_WRITE,
 MAP_PRIVATE)
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, 
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
 Eric Anholt <eric@anholt.net>, Rob Herring <robh@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 stable@vger.kernel.org
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

On Tue, 21 May 2024 at 14:38, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, May 20, 2024 at 12:05:14PM +0200, Jacek Lawrynowicz wrote:
> > From: "Wachowski, Karol" <karol.wachowski@intel.com>
> >
> > Lack of check for copy-on-write (COW) mapping in drm_gem_shmem_mmap
> > allows users to call mmap with PROT_WRITE and MAP_PRIVATE flag
> > causing a kernel panic due to BUG_ON in vmf_insert_pfn_prot:
> > BUG_ON((vma->vm_flags & VM_PFNMAP) && is_cow_mapping(vma->vm_flags));
> >
> > Return -EINVAL early if COW mapping is detected.
> >
> > This bug affects all drm drivers using default shmem helpers.
> > It can be reproduced by this simple example:
> > void *ptr =3D mmap(0, size, PROT_WRITE, MAP_PRIVATE, fd, mmap_offset);
> > ptr[0] =3D 0;
> >
> > Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
> > Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> > Cc: Eric Anholt <eric@anholt.net>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: <stable@vger.kernel.org> # v5.2+
> > Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
> > Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>
> Excellent catch!
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> I reviewed the other helpers, and ttm/vram helpers already block this wit=
h
> the check in ttm_bo_mmap_obj.
>
> But the dma helpers does not, because the remap_pfn_range that underlies
> the various dma_mmap* function (at least on most platforms) allows some
> limited use of cow. But it makes no sense at all to all that only for
> gpu buffer objects backed by specific allocators.
>
> Would you be up for the 2nd patch that also adds this check to
> drm_gem_dma_mmap, so that we have a consistent uapi?
>
> I'll go ahead and apply this one to drm-misc-fixes meanwhile.

Forgot to add: A testcase in igt would also be really lovely.

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#validating-changes-w=
ith-igt
-Sima


>
> Thanks, Sima
>
> > ---
> >  drivers/gpu/drm/drm_gem_shmem_helper.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> > index 177773bcdbfd..885a62c2e1be 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -611,6 +611,9 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object =
*shmem, struct vm_area_struct
> >               return ret;
> >       }
> >
> > +     if (is_cow_mapping(vma->vm_flags))
> > +             return -EINVAL;
> > +
> >       dma_resv_lock(shmem->base.resv, NULL);
> >       ret =3D drm_gem_shmem_get_pages(shmem);
> >       dma_resv_unlock(shmem->base.resv);
> > --
> > 2.45.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
