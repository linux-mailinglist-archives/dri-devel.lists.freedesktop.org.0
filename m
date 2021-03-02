Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A83832A92C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 19:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752956E1BE;
	Tue,  2 Mar 2021 18:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAF46E1BE;
 Tue,  2 Mar 2021 18:21:03 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id e17so5026877oow.4;
 Tue, 02 Mar 2021 10:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WTuda4cww8tml1MB6X/xO2/IsUQlBASCIf/IkrbCDHQ=;
 b=E656MkJ7dNXMWvEy0/TfCxALUB/i/MlbAE+mvFPdLtWoHhxl4vqjkezNuLjjdkJqxx
 TYB36T1eFCNg5fjZXqI11kJb6/42MjEdYbTKUnemTCOWse/3hp666NzO9jCG6sT9pUfo
 xowNRbOB9+kuv9NcHxhAOAop55C7DNvnzLf02Ky1L/WXoN55la08FwOhxUWeMIlcqqnI
 BtqdYMeUHvfGvUZkebbW/ExZ7zYkt049k2f4xve2m9cJTKYJGAo03hBh+NcX5i4RrTnQ
 9iKLm/uKCdGzqJw8g1UK+rg7deZ8awTt1I5/ilHeDP3nnuwowbB5JzV/aSuZGBU5kVLY
 Tp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WTuda4cww8tml1MB6X/xO2/IsUQlBASCIf/IkrbCDHQ=;
 b=d5r+c7AkT6tD1kPFISk0mTHTzzCVwLG8/ihRecx0sbKXdSsCEht7+GFsBYtdcLf0Em
 YV95d4d/sp8UKFLeybxJ2nMne17yRBA4j0xa2rIVbrXCPN4+JL7ufssSDdDf1ONpAget
 FHJOvC0ZhMGxUtexeOHzh+o48H6hhLzRu1mpa1HjrLE5hgVqfPQUw9EK7o67G/eBP1s3
 Zwp3Z5rLLJqUWaA0KrjcclUHp+LYAml1C6cZAbRJreomthRGclFpF6ZTmxfDJF7YdRJu
 /rofB0CqYJikkHt4MYi6LOJ90hwDUiJFpicB08m0OfEHcvzPThlP0ON6NmKjHuu7Zb3B
 s1/A==
X-Gm-Message-State: AOAM531LXWDEHjbJJfavZrrysAxya6746d+Vi2eE3tfJ9LnwFjIpSXWl
 1ZMVF2BQVuoDI0CdHOVX8LrIhl51ji61poWKIeQ=
X-Google-Smtp-Source: ABdhPJyiY/2Z0BZd7Q3YvTDN4YnMNm6xi8Q/vjUyw2isTyjjnJu9aaigvTP09PCo3eME58Pe8EyzNZGoYELBe4LhNBs=
X-Received: by 2002:a4a:88ee:: with SMTP id q43mr17934000ooh.61.1614709262614; 
 Tue, 02 Mar 2021 10:21:02 -0800 (PST)
MIME-Version: 1.0
References: <20210301165908.3846489-1-markyacoub@chromium.org>
In-Reply-To: <20210301165908.3846489-1-markyacoub@chromium.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 2 Mar 2021 13:20:51 -0500
Message-ID: <CADnq5_NZFBE9U1BfQ6=zVWB5-GvhEqfU_w7bAmjBVKRr_uM=SA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Verify bo size can fit framebuffer size
To: Mark Yacoub <markyacoub@chromium.org>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Sean Paul <seanpaul@chromium.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 1, 2021 at 12:11 PM Mark Yacoub <markyacoub@chromium.org> wrote:
>
> When creating a new framebuffer, verify that the bo size associated with
> it can handle the fb size.
> drm_gem_fb_init_with_funcs implements this check by calculating the
> minimum expected size of each plane. amdgpu now uses this function to
> initialize its fb as it performs the required checks.
>
> The bug was caught using igt-gpu-tools test: kms_addfb_basic.too-high
> and kms_addfb_basic.bo-too-small
>
> Suggested-by: Sean Paul <seanpaul@chromium.org>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Mark Yacoub <markyacoub@google.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 8 +++++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c      | 3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h    | 1 +
>  3 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 48cb33e5b3826..61684d543b8ef 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -872,13 +872,14 @@ static int amdgpu_display_get_fb_info(const struct amdgpu_framebuffer *amdgpu_fb
>
>  int amdgpu_display_framebuffer_init(struct drm_device *dev,
>                                     struct amdgpu_framebuffer *rfb,
> +                                   struct drm_file *file,
>                                     const struct drm_mode_fb_cmd2 *mode_cmd,
>                                     struct drm_gem_object *obj)
>  {
>         int ret, i;
>         rfb->base.obj[0] = obj;
> -       drm_helper_mode_fill_fb_struct(dev, &rfb->base, mode_cmd);
> -       ret = drm_framebuffer_init(dev, &rfb->base, &amdgpu_fb_funcs);
> +       ret = drm_gem_fb_init_with_funcs(dev, &rfb->base, file, mode_cmd,
> +                                        &amdgpu_fb_funcs);
>         if (ret)
>                 goto fail;
>
> @@ -953,7 +954,8 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
>                 return ERR_PTR(-ENOMEM);
>         }
>
> -       ret = amdgpu_display_framebuffer_init(dev, amdgpu_fb, mode_cmd, obj);
> +       ret = amdgpu_display_framebuffer_init(dev, amdgpu_fb, file_priv,
> +                                             mode_cmd, obj);
>         if (ret) {
>                 kfree(amdgpu_fb);
>                 drm_gem_object_put(obj);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> index 0bf7d36c6686d..2b9c9a621c437 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> @@ -233,7 +233,8 @@ static int amdgpufb_create(struct drm_fb_helper *helper,
>         }
>
>         ret = amdgpu_display_framebuffer_init(adev_to_drm(adev), &rfbdev->rfb,
> -                                             &mode_cmd, gobj);
> +                                             helper->client.file, &mode_cmd,
> +                                             gobj);
>         if (ret) {
>                 DRM_ERROR("failed to initialize framebuffer %d\n", ret);
>                 goto out;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index 319cb19e1b99f..997b93674955e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -604,6 +604,7 @@ int amdgpu_display_get_crtc_scanoutpos(struct drm_device *dev,
>
>  int amdgpu_display_framebuffer_init(struct drm_device *dev,
>                                     struct amdgpu_framebuffer *rfb,
> +                                   struct drm_file *file,
>                                     const struct drm_mode_fb_cmd2 *mode_cmd,
>                                     struct drm_gem_object *obj);
>
> --
> 2.30.1.766.gb4fecdf3b7-goog
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
