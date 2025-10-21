Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AE3BF6E78
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 15:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB0B10E5F8;
	Tue, 21 Oct 2025 13:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bm/uGYTI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F3010E5FD
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 13:54:23 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-64e84414cfbso2479359eaf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 06:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761054862; x=1761659662; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7zRCoVsDUrAKkHnPzEPaybWLTpv8PSDVhOpYhyOZPuA=;
 b=Bm/uGYTIea1TxCtKGtp+y699qvdNuQHI5lfDZebz1zW96chxPbnGNALYq+n5q6s2/p
 AOLU2++maKKcDtuguieqav32Cb2w8Z+pV8/g0hFIly7lwfwURZ9hUktHIu0LyOVcbwHe
 2Z5/5pRVfzDV/IudXdUUH7G+mBHYc13ZbGeTPq7T9B0EFyXBhujsIy6MawGryGlt34JL
 nlgiFkhUVZzjEQCqG1nW/vktI+Wgya2uHfUKI9LkzSJUYlsszC9L3zozZmLStG2vwgIw
 kM8IelY8Tk4WhFR6No5kupGSlQAvnaWSKVSgXk2Q6+/UYs4KOe2X3GzUlrXBWoI0EApy
 D54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761054862; x=1761659662;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7zRCoVsDUrAKkHnPzEPaybWLTpv8PSDVhOpYhyOZPuA=;
 b=X9OMuvKwLnnuKEYGr39Th86xS/76IOFzElUiYor9MT+/cScp36XxKQ45sabAPlSUfm
 B01RgSAOPQZDkqlEdqoA4pZyw8giFQv57YqL65k4Mxcs6kMpG1toyBOHkd1QTDHjJe90
 eDLW4F9PvCcO5ZTHO5uzmLzNY4Gf4OyadiqcIKQA5UrOx7UPmeO0YxiZL4ypYLmCVv7Y
 65h0KU8QKYL1PpayrMchK6aTw+qdbplzRAF8u7ZiXOsujtvibuBAac/1rlI/5QQjcgnh
 zwj7rFu73StdbnjMGp7w1Xt4Ryv/frZ6ygOjq+FagPwbgYWw9Tqa9t4Wph5HDGHYAlE9
 yPdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr2sWonIhvx5pnehEPpONN+cDPxPyL+/wkOPhejwSE+u8nOOnafZpQvMXzbJ2Ar+wTs7JS3ib+ya0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHi+xWrP0lrTJgGIX0+japf371FGz8GKbn2P63I99qyOElHzVM
 KVCehS5cgLWvHjHH7gjhgVYNWxFo+1iO3/n0INEtq7O/vgP6/De5jhGsuM3ZSD9C84SlQuyzS6s
 Sq9/WrvxvyBpwat+hUmB2or6IKPqmP5M=
X-Gm-Gg: ASbGncsZxCpU9jbRuUCF5l4i5FvpN3ub4fHdW7F45qWZyelfbgxrHeUDfulplq/6IK/
 ipVroSjVjQbCQKUII7hAOEp1cXzSivvMEtzxs8LRVIlnyeh4QKJRhqIe1XU/ZuGIpXRgOmXQMbb
 LwmLVGc3bIwcjZCL9mWf5bWJc9pMkFy0n7bnmWaHPxc4msgPnQs5Z0FE5oWmT9fFn0zoQJ0xY5D
 aKSxnjV7gOEK/lH3sQaVd6ew1aY4Z59Ew7Mfqv3vWPmsh0f61h2tIHNBnxKvJq4qhv9r07cYhWO
 gNBl
X-Google-Smtp-Source: AGHT+IEEJhV+7HDnd1rLWzRKPuVeGqK0sxHNPjpMcz5TApDVHa18O8uA1yfTw5iWk/coCiGbH7jCRQhrN34RTrEXqCE=
X-Received: by 2002:a05:6808:1889:b0:43c:afd4:646d with SMTP id
 5614622812f47-443a2ed23f8mr6546477b6e.14.1761054862105; Tue, 21 Oct 2025
 06:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-2-tzimmermann@suse.de>
In-Reply-To: <20251009132006.45834-2-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 21 Oct 2025 15:54:11 +0200
X-Gm-Features: AS18NWD9WGUNOjZaiHNhwA1jJulHFlj-NuelchpaG-8PGVgNFP5jcKmCav4IxoA
Message-ID: <CAMeQTsbLQcUbFvDMgMoA2EZqO-f5j1fkjtBKWKQmKdMBeJ7Yzw@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/client: Add client free callback to unprepare
 fb_helper
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, javierm@redhat.com, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
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

On Thu, Oct 9, 2025 at 3:31=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Add free callback to struct drm_client_funcs. Invoke function to
> free the client memory as part of the release process. Implement
> free for fbdev emulation.
>
> Fbdev emulation allocates and prepares client memory in
> drm_fbdev_client_setup(). The release happens in fb_destroy from
> struct fb_ops. Multiple implementations of this callback exist in
> the various drivers that provide fbdev implementation. Each of them
> needs to follow the implementation details of the fbdev setup code.
>
> Adding a free callback for the client puts the unprepare and release
> of the fbdev client in a single place.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

For gma500:
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

> ---
>  drivers/gpu/drm/armada/armada_fbdev.c      |  2 --
>  drivers/gpu/drm/clients/drm_fbdev_client.c | 17 +++++++++++++++--
>  drivers/gpu/drm/drm_client.c               |  4 ++++
>  drivers/gpu/drm/drm_fbdev_dma.c            |  4 ----
>  drivers/gpu/drm/drm_fbdev_shmem.c          |  2 --
>  drivers/gpu/drm/drm_fbdev_ttm.c            |  2 --
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |  2 --
>  drivers/gpu/drm/gma500/fbdev.c             |  3 ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c |  2 --
>  drivers/gpu/drm/msm/msm_fbdev.c            |  2 --
>  drivers/gpu/drm/omapdrm/omap_fbdev.c       |  2 --
>  drivers/gpu/drm/radeon/radeon_fbdev.c      |  2 --
>  drivers/gpu/drm/tegra/fbdev.c              |  2 --
>  include/drm/drm_client.h                   | 10 ++++++++++
>  14 files changed, 29 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/arma=
da/armada_fbdev.c
> index cb53cc91bafb..22e2081bfa04 100644
> --- a/drivers/gpu/drm/armada/armada_fbdev.c
> +++ b/drivers/gpu/drm/armada/armada_fbdev.c
> @@ -28,8 +28,6 @@ static void armada_fbdev_fb_destroy(struct fb_info *inf=
o)
>         fbh->fb->funcs->destroy(fbh->fb);
>
>         drm_client_release(&fbh->client);
> -       drm_fb_helper_unprepare(fbh);
> -       kfree(fbh);
>  }
>
>  static const struct fb_ops armada_fb_ops =3D {
> diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c b/drivers/gpu/drm=
/clients/drm_fbdev_client.c
> index f894ba52bdb5..5336accab1b6 100644
> --- a/drivers/gpu/drm/clients/drm_fbdev_client.c
> +++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
> @@ -13,16 +13,28 @@
>   * struct drm_client_funcs
>   */
>
> +static void drm_fbdev_client_free(struct drm_client_dev *client)
> +{
> +       struct drm_fb_helper *fb_helper =3D drm_fb_helper_from_client(cli=
ent);
> +
> +       drm_fb_helper_unprepare(fb_helper);
> +       kfree(fb_helper);
> +}
> +
>  static void drm_fbdev_client_unregister(struct drm_client_dev *client)
>  {
>         struct drm_fb_helper *fb_helper =3D drm_fb_helper_from_client(cli=
ent);
>
>         if (fb_helper->info) {
> +               /*
> +                * Fully probed framebuffer device
> +                */
>                 drm_fb_helper_unregister_info(fb_helper);
>         } else {
> +               /*
> +                * Partially initialized client, no framebuffer device ye=
t
> +                */
>                 drm_client_release(&fb_helper->client);
> -               drm_fb_helper_unprepare(fb_helper);
> -               kfree(fb_helper);
>         }
>  }
>
> @@ -88,6 +100,7 @@ static int drm_fbdev_client_resume(struct drm_client_d=
ev *client, bool holds_con
>
>  static const struct drm_client_funcs drm_fbdev_client_funcs =3D {
>         .owner          =3D THIS_MODULE,
> +       .free           =3D drm_fbdev_client_free,
>         .unregister     =3D drm_fbdev_client_unregister,
>         .restore        =3D drm_fbdev_client_restore,
>         .hotplug        =3D drm_fbdev_client_hotplug,
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 3fa38d4ac70b..fe9c6d7083ea 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -168,6 +168,10 @@ void drm_client_release(struct drm_client_dev *clien=
t)
>
>         drm_client_modeset_free(client);
>         drm_client_close(client);
> +
> +       if (client->funcs && client->funcs->free)
> +               client->funcs->free(client);
> +
>         drm_dev_put(dev);
>  }
>  EXPORT_SYMBOL(drm_client_release);
> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_=
dma.c
> index 8bd626ef16c7..c6196293e424 100644
> --- a/drivers/gpu/drm/drm_fbdev_dma.c
> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
> @@ -57,8 +57,6 @@ static void drm_fbdev_dma_fb_destroy(struct fb_info *in=
fo)
>         drm_client_buffer_vunmap(fb_helper->buffer);
>         drm_client_framebuffer_delete(fb_helper->buffer);
>         drm_client_release(&fb_helper->client);
> -       drm_fb_helper_unprepare(fb_helper);
> -       kfree(fb_helper);
>  }
>
>  static const struct fb_ops drm_fbdev_dma_fb_ops =3D {
> @@ -92,8 +90,6 @@ static void drm_fbdev_dma_shadowed_fb_destroy(struct fb=
_info *info)
>         drm_client_buffer_vunmap(fb_helper->buffer);
>         drm_client_framebuffer_delete(fb_helper->buffer);
>         drm_client_release(&fb_helper->client);
> -       drm_fb_helper_unprepare(fb_helper);
> -       kfree(fb_helper);
>  }
>
>  static const struct fb_ops drm_fbdev_dma_shadowed_fb_ops =3D {
> diff --git a/drivers/gpu/drm/drm_fbdev_shmem.c b/drivers/gpu/drm/drm_fbde=
v_shmem.c
> index 1e827bf8b815..51573058df6f 100644
> --- a/drivers/gpu/drm/drm_fbdev_shmem.c
> +++ b/drivers/gpu/drm/drm_fbdev_shmem.c
> @@ -65,8 +65,6 @@ static void drm_fbdev_shmem_fb_destroy(struct fb_info *=
info)
>         drm_client_buffer_vunmap(fb_helper->buffer);
>         drm_client_framebuffer_delete(fb_helper->buffer);
>         drm_client_release(&fb_helper->client);
> -       drm_fb_helper_unprepare(fb_helper);
> -       kfree(fb_helper);
>  }
>
>  static const struct fb_ops drm_fbdev_shmem_fb_ops =3D {
> diff --git a/drivers/gpu/drm/drm_fbdev_ttm.c b/drivers/gpu/drm/drm_fbdev_=
ttm.c
> index 85feb55bba11..ccf460fbc1f0 100644
> --- a/drivers/gpu/drm/drm_fbdev_ttm.c
> +++ b/drivers/gpu/drm/drm_fbdev_ttm.c
> @@ -53,8 +53,6 @@ static void drm_fbdev_ttm_fb_destroy(struct fb_info *in=
fo)
>         drm_client_framebuffer_delete(fb_helper->buffer);
>
>         drm_client_release(&fb_helper->client);
> -       drm_fb_helper_unprepare(fb_helper);
> -       kfree(fb_helper);
>  }
>
>  static const struct fb_ops drm_fbdev_ttm_fb_ops =3D {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/=
exynos/exynos_drm_fbdev.c
> index 93de25b77e68..a3bd21a827ad 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -42,8 +42,6 @@ static void exynos_drm_fb_destroy(struct fb_info *info)
>         drm_framebuffer_remove(fb);
>
>         drm_client_release(&fb_helper->client);
> -       drm_fb_helper_unprepare(fb_helper);
> -       kfree(fb_helper);
>  }
>
>  static const struct fb_ops exynos_drm_fb_ops =3D {
> diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbde=
v.c
> index a6af21514cff..bc92fa24a1e2 100644
> --- a/drivers/gpu/drm/gma500/fbdev.c
> +++ b/drivers/gpu/drm/gma500/fbdev.c
> @@ -84,9 +84,6 @@ static void psb_fbdev_fb_destroy(struct fb_info *info)
>         drm_gem_object_put(obj);
>
>         drm_client_release(&fb_helper->client);
> -
> -       drm_fb_helper_unprepare(fb_helper);
> -       kfree(fb_helper);
>  }
>
>  static const struct fb_ops psb_fbdev_fb_ops =3D {
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm=
/i915/display/intel_fbdev.c
> index 3fbdf75415cc..d5f26c8bb102 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -146,8 +146,6 @@ static void intel_fbdev_fb_destroy(struct fb_info *in=
fo)
>         drm_framebuffer_remove(fb_helper->fb);
>
>         drm_client_release(&fb_helper->client);
> -       drm_fb_helper_unprepare(fb_helper);
> -       kfree(fb_helper);
>  }
>
>  __diag_push();
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fb=
dev.c
> index b5969374d53f..aad6fb77f0de 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -52,8 +52,6 @@ static void msm_fbdev_fb_destroy(struct fb_info *info)
>         drm_framebuffer_remove(fb);
>
>         drm_client_release(&helper->client);
> -       drm_fb_helper_unprepare(helper);
> -       kfree(helper);
>  }
>
>  static const struct fb_ops msm_fb_ops =3D {
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapd=
rm/omap_fbdev.c
> index 948af7ec1130..b5df2923d2a6 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -103,8 +103,6 @@ static void omap_fbdev_fb_destroy(struct fb_info *inf=
o)
>         drm_framebuffer_remove(fb);
>
>         drm_client_release(&helper->client);
> -       drm_fb_helper_unprepare(helper);
> -       kfree(helper);
>  }
>
>  /*
> diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/rade=
on/radeon_fbdev.c
> index dc81b0c2dbff..4df6c9167bf0 100644
> --- a/drivers/gpu/drm/radeon/radeon_fbdev.c
> +++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
> @@ -184,8 +184,6 @@ static void radeon_fbdev_fb_destroy(struct fb_info *i=
nfo)
>         radeon_fbdev_destroy_pinned_object(gobj);
>
>         drm_client_release(&fb_helper->client);
> -       drm_fb_helper_unprepare(fb_helper);
> -       kfree(fb_helper);
>  }
>
>  static const struct fb_ops radeon_fbdev_fb_ops =3D {
> diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.=
c
> index 1b70f5e164af..91aece6f34e0 100644
> --- a/drivers/gpu/drm/tegra/fbdev.c
> +++ b/drivers/gpu/drm/tegra/fbdev.c
> @@ -53,8 +53,6 @@ static void tegra_fbdev_fb_destroy(struct fb_info *info=
)
>         drm_framebuffer_remove(fb);
>
>         drm_client_release(&helper->client);
> -       drm_fb_helper_unprepare(helper);
> -       kfree(helper);
>  }
>
>  static const struct fb_ops tegra_fb_ops =3D {
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index bdd845e383ef..eecb8d6e15c7 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -28,6 +28,16 @@ struct drm_client_funcs {
>          */
>         struct module *owner;
>
> +       /**
> +        * @free:
> +        *
> +        * Called when the client gets unregistered. Implementations shou=
ld
> +        * release all client-specific data and free the memory.
> +        *
> +        * This callback is optional.
> +        */
> +       void (*free)(struct drm_client_dev *client);
> +
>         /**
>          * @unregister:
>          *
> --
> 2.51.0
>
