Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B363CBC6A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 21:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5DC6E9D1;
	Fri, 16 Jul 2021 19:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D28A6E9CF;
 Fri, 16 Jul 2021 19:24:18 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id i4so5111297qvq.10;
 Fri, 16 Jul 2021 12:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8Tlcfwlh61VvBfUuFwx0JAkGhthlhwqsds2zjxw3FFc=;
 b=nyCHzGNzvyIOfv/0FnBGg2DfPyQdxi/zLxb5Pr85zPf25qE6ER/dCG0Lx3RloP9lbZ
 F1loKvZHTgFw3KWOy0nEoPT+gMnMKsxTTFT7zD2CB7g9nFaM9O+WZoaGAaKQkUM5CSFF
 RrMhHgoHEYJapxHOcrxwItpPs6LMLEj1m8Tro4wTT3DlNj3jJ/ix4umOgzl4VxO8CG/e
 ZutPBOQkuV91Qb2YIChP/mX5DNAPddgNjnWu9duOjTjqBY5FgkM2hG/tP+ViB6EMIBSW
 tjibZXcUqRqMuxh617i/gP/elp7xt7TZbm+GOlHbWLq7oQo+mgWBfxaO2QVLVoDRFpJQ
 u+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8Tlcfwlh61VvBfUuFwx0JAkGhthlhwqsds2zjxw3FFc=;
 b=NgAAUPvBdSLdV7VVea1WWL7Jqdv/fXViMNpxyHHSYmVOeeifEH5Dau1m+AMP0M66zA
 qjbTh5m4DrOv8jWihPLxuJobsyhuwCPPdTjRb4AGuNIWFwi0J678SRLUAlOXZngc0Ypt
 4DQywBiISQrlJwYOCg5UZRfTXkxISeHitapiK2zH5sRjVerwrlpvEdbApkYfLLFxLTm8
 P15f8frK2WR4wAxCDJzijj1EWMaQlz4ufM2DsNMBN0beAgLFvODZ47ft+4q54mIZ3/iN
 Rdmv071kkBlYS+R3zpyqa8n4NLLrzA4ePVd60wDBAD0qukdmh9/jnzRMwOJKzok4clpi
 FWyQ==
X-Gm-Message-State: AOAM530IaL59h4Im9ADMGaqUzFLjbdqEslgvbP+3UVgsSpuf+zT1W3UX
 SL5jSLSVGqjM1vWBQUxXlJHFAWD22XdSCVGe1/o=
X-Google-Smtp-Source: ABdhPJzR39No7NPmXgI1WMgWZlGXlv0Mfvg3s23OIIdqdq0v8oksApsGB/29vPHAU51Hvr6VjC4l/IytetqtYG4Tjkw=
X-Received: by 2002:a0c:f6c6:: with SMTP id d6mr11898323qvo.30.1626463457392; 
 Fri, 16 Jul 2021 12:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210716141426.1904528-1-jason@jlekstrand.net>
 <20210716141426.1904528-6-jason@jlekstrand.net>
In-Reply-To: <20210716141426.1904528-6-jason@jlekstrand.net>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 16 Jul 2021 20:23:51 +0100
Message-ID: <CAM0jSHP2oNbsvqp__njc7yuK7j-HE7pO4p5G=-UkUEnHZjXSFw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 5/7] drm/i915/gem/ttm: Respect the objection
 region in placement_from_obj
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

On Fri, 16 Jul 2021 at 15:14, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> Whenever we had a user object (n_placements > 0), we were ignoring
> obj->mm.region and always putting obj->placements[0] as the requested
> region.  For LMEM+SMEM objects, this was causing them to get shoved into
> LMEM on every i915_ttm_get_pages() even when SMEM was requested by, say,
> i915_gem_object_migrate().
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

AFAIK makes sense, just a question of properly understanding that
weird migration issue first.

Assuming CI is happy,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index 6589411396d3f..8eeb73c7c401c 100644
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
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
