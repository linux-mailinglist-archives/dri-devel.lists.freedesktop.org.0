Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FE83CB81D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 15:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4406E989;
	Fri, 16 Jul 2021 13:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479766E989;
 Fri, 16 Jul 2021 13:54:36 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id f3so4593114qvm.2;
 Fri, 16 Jul 2021 06:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yYjwCI5bKDMbYefTBdJbOoEUPrf75E8PlGLY6ZxxMts=;
 b=Jb6pGIZrI/StAzOO02+eOAf+8vGsNMKfgjXFzZVOFofoJiAmQib08sFRWYj4vWP4B6
 KbojJ4Vn5abcFzXwJOitWzju41SuK1uan1ln2AW/WdTQjBTCpd88XlSwaezY260iq0lQ
 YcZuvGYX2Cd/T342rmdgbQzAGGQttuufFBo4S880F9FvLZ2njWEQSJrrjY2GceAbIGpm
 4C/S1SId5jWwo2YcH4z4o2fD2LFBsSXBmFQOp4nMAU9DsJpPODwBjgwy8IhPN8Z7Pgur
 zwJy76jzySb3FNpPZv/1nDkNCJKyisxhLAcjPcMFZbeNm6l58gJs/PVGpm1ZQ1+PQpb+
 CxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yYjwCI5bKDMbYefTBdJbOoEUPrf75E8PlGLY6ZxxMts=;
 b=YPVbx/m44yrb4cisPSEMihoyyPETTLi3zj+MQe4NGRC2/fM+7h0QarY995AZZB3w53
 GeIC7v4lj4dFfTbXcuOpwMSL0kIGfkvA8nxwecBh8utLTjn839V7VZG/5VLGDZbffiqX
 N2d+Pka+7sWah6bKZxqleuGNCeBqmSjGxdKQO6TwGweVEsz5UeVFl10IDzP9LqinqWHx
 lDuWGhkk/B7w1T8+hxPG61yqUznyGENgL7hP6HCP51Uruir1X96Loq+FISI1PBI7i85Y
 ACxaiM2mqbv17T5JNcHGrXo3R1tyWLWhJu9bqjF3EX5edCBxR15unLSyCK8SxHzHY4Y8
 EarA==
X-Gm-Message-State: AOAM530AcQl/OWO1+ut6FR+jO/QSKWMGvbIpHsEqIlH2zbNi2GxFx7xK
 BmyjTar504fNErSttTvpbmNHSoJ4WK2UREXB/PQ=
X-Google-Smtp-Source: ABdhPJzxPq4G48jM8jElp3fVPpY1fyIreaqc4vFmBD6PBtsX1D4h3oCgM4EI2r82AW1OQ7fZAyrd1VoMZh1tKxv1g7Q=
X-Received: by 2002:ad4:456d:: with SMTP id o13mr10339305qvu.48.1626443675478; 
 Fri, 16 Jul 2021 06:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210715223900.1840576-1-jason@jlekstrand.net>
 <20210715223900.1840576-6-jason@jlekstrand.net>
In-Reply-To: <20210715223900.1840576-6-jason@jlekstrand.net>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 16 Jul 2021 14:54:06 +0100
Message-ID: <CAM0jSHPu1EBfnAJ06Dp51a1Qbg+9QnmP=EyUfYXS0fZnJzxR8g@mail.gmail.com>
Subject: Re: [PATCH 5/7] drm/i915/gem/ttm: Respect the objection region in
 placement_from_obj
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 15 Jul 2021 at 23:39, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> Whenever we had a user object (n_placements > 0), we were ignoring
> obj->mm.region and always putting obj->placements[0] as the requested
> region.  For LMEM+SMEM objects, this was causing them to get shoved into
> LMEM on every i915_ttm_get_pages() even when SMEM was requested by, say,
> i915_gem_object_migrate().

i915_ttm_migrate calls i915_ttm_place_from_region() directly with the
requested region, so there shouldn't be an issue with migration right?
Do you have some more details?

>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index d30f274c329c7..5985e994d56cf 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -150,8 +150,7 @@ i915_ttm_placement_from_obj(const struct drm_i915_gem=
_object *obj,
>         unsigned int i;
>
>         placement->num_placement =3D 1;
> -       i915_ttm_place_from_region(num_allowed ? obj->mm.placements[0] :
> -                                  obj->mm.region, requested, flags);
> +       i915_ttm_place_from_region(obj->mm.region, requested, flags);
>
>         /* Cache this on object? */
>         placement->num_busy_placement =3D num_allowed;
> --
> 2.31.1
>
