Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEA33B2E89
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 14:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474266EB6B;
	Thu, 24 Jun 2021 12:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429756EB6D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 12:04:44 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 x17-20020a05683000d1b029045fb1889a9eso4844521oto.5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 05:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SRZUzaogma2KSZfmisHDH0LYwRTQJaRPPiJFQQsihe0=;
 b=K7m6Xw7CFTpq4mCVggngNelDAIVOo2Nwg3JSlD4n3vQU8Tno91XAU7+o2XuusKv3GM
 fLiNYSWR216kMXs1LRJ78isZQBwGCJuzyqMu9wDQE9sSuX/i1r3WUq96SHRKMiPwwOOs
 3ilVyTLvqEQlYUHPakVH65M+NycWTHDkTpPHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SRZUzaogma2KSZfmisHDH0LYwRTQJaRPPiJFQQsihe0=;
 b=p/TdglcPDfyWc0aGn/teMuAeh/MMxLTKY+kWhW3KAIOrhViAIoTbfhQnrmR88cZyJp
 aXn+lWJ4eK1bvlWqEtOJ58+qqAb7ApBKpXmjRHNXuBYay6Q/ZbjCWzIIK/pXOyDr0aYB
 vdDJT68giPvGlTYHPSiTTXC/9SptBQPUgJqhRHMCTqCAEBkNCY4U18YmorMO9NKYEoA8
 FE+wJpKNjajpMW12TouIu+WVU99OySnwjkJKTHhQaqNb0ozJ75GIJbo4EG8hURbUGjzQ
 qT6jd9DJ796gx9ebghfWZn0tRdHyGP9sh5axpH2Oa5UF86dyidJADyz7YUCJuqLr+OVO
 NA4g==
X-Gm-Message-State: AOAM532TyYL33LR8sXVkTWKStpRsTtxQ8WoROpEKK0EUdIJMOwVA2/kH
 9iTy87vorzJlIumjPavm+gMR8Lw9kYQ+1RFbPNNdjA==
X-Google-Smtp-Source: ABdhPJxWjeXokMrQHGnfkYM1kXZ1nCTGW4RfMPr510MRVjRPqQyaHAbMMCZYOlXCFag3x+biBRw+xWG6wASJzxeNyVs=
X-Received: by 2002:a05:6830:2370:: with SMTP id
 r16mr4332451oth.188.1624536283558; 
 Thu, 24 Jun 2021 05:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210624112914.311984-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210624112914.311984-1-thomas.hellstrom@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 24 Jun 2021 14:04:32 +0200
Message-ID: <CAKMK7uEeV0nvf+4ae2rYQHMBQ2rm2NNKT+n8CvDU=gdaEXHHBw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915: Reinstate the mmap ioctl for some platforms
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 1:29 PM Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Reinstate the mmap ioctl for all current integrated platforms.
> The intention was really to have it disabled for discrete graphics
> where we enforce a single mmap mode.
>
> Fixes: 35cbd91eb541 ("drm/i915: Disable mmap ioctl for gen12+")
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
> v2:
> - Added a R-B.
> - Fixed up the code comment a bit.
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i=
915/gem/i915_gem_mman.c
> index 2fd155742bd2..4f50a508c7a0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -62,10 +62,11 @@ i915_gem_mmap_ioctl(struct drm_device *dev, void *dat=
a,
>         struct drm_i915_gem_object *obj;
>         unsigned long addr;
>
> -       /* mmap ioctl is disallowed for all platforms after TGL-LP.  This=
 also
> -        * covers all platforms with local memory.
> +       /*
> +        * mmap ioctl is disallowed for all discrete platforms,
> +        * and for all platforms with GRAPHICS_VER > 12.
>          */
> -       if (GRAPHICS_VER(i915) >=3D 12 && !IS_TIGERLAKE(i915))
> +       if (IS_DGFX(i915) || GRAPHICS_VER(i915) > 12)
>                 return -EOPNOTSUPP;
>
>         if (args->flags & ~(I915_MMAP_WC))
> --
> 2.31.1
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
