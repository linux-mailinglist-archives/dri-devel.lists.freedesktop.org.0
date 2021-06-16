Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B088C3A9804
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 12:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD856E2B4;
	Wed, 16 Jun 2021 10:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FB06E2B4;
 Wed, 16 Jun 2021 10:45:56 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id e18so1261145qvm.10;
 Wed, 16 Jun 2021 03:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pi9Pblcxp2S3wGNqZkE9BNrbkmJEMm2DtOg5yXb50w8=;
 b=j3slzsJ+M/s7Ch/GohxyTdmTrVo692Y/OQq7H6jjnoXxvtAedbC2SwTM8xvESEXOos
 qU1eb3bENMKrSDiGGBMVrxWA79oRkSi7PA+2BEB+MwRObUK09o4TI5RGZeYx2n2qobyC
 YkS+crHR7f26DCxIw19RPxpX483JUAPDq7jKM7uJFOgjVXkEw+Q2aXEPZ+YD+3FbZRbU
 74hfGFwxBHtXj0ng2/znCa5HXJOw7y0E8Bb3CtejBRZShMEYTEQiia7v/z8K6XIjqEFg
 XbEuhLHeMgu+8wLEpiZ2hx1myqtJ1DkhcFvC40ROlpiKKyYm4R1GSNyh+CiuZfCIx+eK
 v7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pi9Pblcxp2S3wGNqZkE9BNrbkmJEMm2DtOg5yXb50w8=;
 b=ZqBTGVSjNzsK4zBzUzCBHlGjcGgvNmO5dr/jEe2KpR5yzdMqUsrRMWxTkyAlNcsZ8+
 FEqOrliFNfpR+Yy89P72ZGF/P2aowrXzCFzSJvkEwmDIzub0eTEcTEaHcKkOGGLE8Psz
 cGlqueV1dBQya3AmoOtBP7mtqzoBGQ8kaXcplqPVmGfxZ69FltzS658DD3ysw+MZJxzc
 zQWwDC9jrOF1IgA0GY2zZP7MpZdiqAHQ8v7K0MttPH2NP7nbxp8LOzc5JjJG7V+O4S3W
 L6Bv1LOEkPhJ3ezfHBMGvQk6o4BN7/wPCz3YAIvFTHYjmvedpPROt/uBQNcK3KOjuMhJ
 XWNA==
X-Gm-Message-State: AOAM531YT9WdYtNRtPCuyLAXYciIk8YQI6nbpSBrMwA5YKaIFcZL4KJq
 61CMKWcklvdmJ+PHjHniuqelSzdDbFt5mokD7Yg=
X-Google-Smtp-Source: ABdhPJziIIVIbbz7snqmY6ReBnvrSR1XI1Gu3bt92yGIYUfORUtpRwkAUZFZ3VvUEmjUcNfpiMNfEtyLPI+eWo0IUTI=
X-Received: by 2002:a05:6214:764:: with SMTP id
 f4mr10319109qvz.60.1623840355364; 
 Wed, 16 Jun 2021 03:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210616090350.828696-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210616090350.828696-1-daniel.vetter@ffwll.ch>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 16 Jun 2021 11:45:28 +0100
Message-ID: <CAM0jSHMTc6o5M=xbYJDoR0NWpEthOcHMSB=Pb4dHnV9gdDj9eA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Remove duplicated call to
 ops->pread
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Jun 2021 at 10:04, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Between
>
> commit ae30af84edb5b7cc95485922e43afd909a892e1b
> Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Date:   Tue Mar 23 16:50:00 2021 +0100
>
>     drm/i915: Disable userptr pread/pwrite support.
>
> and
>
> commit 0049b688459b846f819b6e51c24cd0781fcfde41
> Author: Matthew Auld <matthew.auld@intel.com>
> Date:   Thu Nov 5 15:49:33 2020 +0000
>
>     drm/i915/gem: Allow backends to override pread implementation
>
> this accidentally landed twice.
>
> Cc: Matthew Auld <matthew.auld@intel.com
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com

> ---
>  drivers/gpu/drm/i915/i915_gem.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_=
gem.c
> index 6a0a3f0e36e1..07aa80773a02 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -469,12 +469,6 @@ i915_gem_pread_ioctl(struct drm_device *dev, void *d=
ata,
>         if (ret !=3D -ENODEV)
>                 goto out;
>
> -       ret =3D -ENODEV;
> -       if (obj->ops->pread)
> -               ret =3D obj->ops->pread(obj, args);
> -       if (ret !=3D -ENODEV)
> -               goto out;
> -
>         ret =3D i915_gem_object_wait(obj,
>                                    I915_WAIT_INTERRUPTIBLE,
>                                    MAX_SCHEDULE_TIMEOUT);
> --
> 2.32.0.rc2
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
