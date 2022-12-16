Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E23C64F56D
	for <lists+dri-devel@lfdr.de>; Sat, 17 Dec 2022 00:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B3810E644;
	Fri, 16 Dec 2022 23:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517A210E644
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 23:59:27 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id n20so9833094ejh.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 15:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oIKXv0RMSOh4Zj5JXJ0H7+d/0M4R06dAaYKh+BMHd2A=;
 b=juvIkT8vcatHsAuX5x/9pLyDEsPoOL7IqGfGxQxp6rjBVO4P/tlEBTqvfVLkkNKYGv
 3CEaP8RDEXyHYSAi+1pUD1n+RTt0ogvvYz3AYEtllQKtJPlB3YwxLqHkaVku92HXBPr5
 OJAS83LHruNjFBDASNQkVdRo7uNHrmFOhWWLJNlSn1UFXP6HSHn6iAHH76LFkysVK2iS
 NqEeUicB6AO8M/MZpRezry/sYvEu8rsW+19+sJCRjDx102ABSOlasQ4qnabMXUYHoueq
 xJH2tHVUZOY6KIs+JzPQxEWWZOgSkkHx0iBuZh4lZwrOjsA1gkyUurc0zHAWZaE7dmr9
 hJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oIKXv0RMSOh4Zj5JXJ0H7+d/0M4R06dAaYKh+BMHd2A=;
 b=xwn6kr970ln+d1BpYimDb9kwGWhMdM1lojCDCbgQnl8KupBahTszPqTOLE0xTYC/wA
 hRSp/7jjOYQne4BV+Vnna7tIxErDhpvPskwxP+AzHoDops8yYbG/ZWxBhvRtbj2Gu4/8
 95Cfeee4MgL188uHE77vygMCjAnDIvSEqdAdGaBqy21xHogoXh7UjnEf/RcguwHnfVO+
 B2/FgRtUtz9ph0o/UtaVUNnUluklOEoZIYBN0AwOdXH1XCEd6PwKbGe0W1SElaBDi8kS
 3/7ce8nry8CjhItrJ1iFi0h6MEqLFijkyBRYAIdiIKCffGYtF0UHkLuIdlfv33FvMWmy
 NdBA==
X-Gm-Message-State: ANoB5pmTjbFgG7UahEAln4AX8IaFd+Tq0u2aBDkak9XTurvoNY7ndEhY
 A2gBDPBGEwozUxEIkaBuwf2l3pwAhEwasVKyR4k=
X-Google-Smtp-Source: AA0mqf6wIOamTnfqwHnHk7jBVTZApRrd3OSb9bKxdGI5zvUlM4wOFJiCeCifrb0GpusvxsjJ/sAFf4y8ghxYFJLgfUM=
X-Received: by 2002:a17:906:840e:b0:7c0:d94c:7384 with SMTP id
 n14-20020a170906840e00b007c0d94c7384mr23051046ejx.109.1671235165720; Fri, 16
 Dec 2022 15:59:25 -0800 (PST)
MIME-Version: 1.0
References: <20221216233355.542197-1-robdclark@gmail.com>
In-Reply-To: <20221216233355.542197-1-robdclark@gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 16 Dec 2022 15:59:14 -0800
Message-ID: <CAPaKu7RP281inKJKNWWTnETCU+giwU2YajzwH6AUVeTDXQoWWg@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Fix GEM handle creation UAF
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 16, 2022 at 3:34 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Relying on an unreturned handle to hold a reference to an object we
> dereference is not safe.  Userspace can guess the handle and race us
> by closing the handle from another thread.  The _create_with_handle()
> that returns an object ptr is pretty much a pattern to avoid.  And
> ideally creating the handle would be done after any needed dererencing.
> But in this case creation of the mapping is tied to the handle creation.
> Fortunately the mapping is refcnt'd and holds a reference to the object,
> so we can drop the handle's reference once we hold a mapping reference.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c |  7 +++++++
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 10 +++++++---
>  2 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 2fa5afe21288..aa5848de647c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -98,6 +98,13 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
>                 return PTR_ERR(bo);
>
>         mapping = panfrost_gem_mapping_get(bo, priv);
> +
> +       /*
> +        * Now that the mapping holds a reference to the bo until we no longer
> +        * need it, we can safely drop the handle's reference.
> +        */
Not too familiar with panfrost, but I don't see
panfrost_gem_mapping_get hold a reference to the bo?

> +       drm_gem_object_put(&bo->base.base);
> +
>         if (!mapping) {
>                 drm_gem_object_put(&bo->base.base);
>                 return -EINVAL;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 293e799e2fe8..e3e21c500d24 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -234,6 +234,10 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
>         return &obj->base.base;
>  }
>
> +/*
> + * NOTE: if this succeeds, both the handle and the returned object have
> + * an outstanding reference.
> + */
I might suggest dropping the "_with_handle" suffix.

The naming convention is used in several drivers.  I think we should
make it the case that the _with_handle variants always return the
handle without the pointer.  (And with the change, it immediately
becomes clear that qxl and vmwgfx also have similar issues).

>  struct panfrost_gem_object *
>  panfrost_gem_create_with_handle(struct drm_file *file_priv,
>                                 struct drm_device *dev, size_t size,
> @@ -261,10 +265,10 @@ panfrost_gem_create_with_handle(struct drm_file *file_priv,
>          * and handle has the id what user can see.
>          */
>         ret = drm_gem_handle_create(file_priv, &shmem->base, handle);
> -       /* drop reference from allocate - handle holds it now. */
> -       drm_gem_object_put(&shmem->base);
> -       if (ret)
> +       if (ret) {
> +               drm_gem_object_put(&shmem->base);
>                 return ERR_PTR(ret);
> +       }
>
>         return bo;
>  }
> --
> 2.38.1
>
