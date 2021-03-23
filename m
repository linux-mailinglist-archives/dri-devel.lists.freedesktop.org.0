Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 683E3346235
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6745F6E93A;
	Tue, 23 Mar 2021 15:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24713896B5;
 Tue, 23 Mar 2021 15:02:21 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 y19-20020a0568301d93b02901b9f88a238eso19716819oti.11; 
 Tue, 23 Mar 2021 08:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BLse80fSb2EKCejYaIzKDta7DbBSummSihQ6a3pSsIQ=;
 b=erI5+lU/++pxhxzeLQthoqbdt6OXURwMDnH0W3TLJTUtLu9VtbWQy9Mp4/YQ6RrHso
 GMYM4vh/ebORB7csopkzjLlY3k2YKJe89PbLOIMp4GUhZhcKBZa4Up5bV+dGfOsho3uP
 bm21nn9pZL5SOQ5WP7LEPewmdRoPoTo9IegpoP+ZZoLMvzpK+WJT/D/q4t4DxGG6jjic
 ETwlnLknr5e0rFMl3ZZRjo6bejj0lXtimcZnnv7j9blsNqw5jLnX9C5yoFK0sICkgfDB
 6qfFnT24BOw1QC1juuzErZKdPZwPVSYCjw7p9T4EUiMr9RlDW8K+rLehU7jy8ofA2045
 jxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BLse80fSb2EKCejYaIzKDta7DbBSummSihQ6a3pSsIQ=;
 b=XIBtuJF6sfPJH9RnB64CmlurZMrkg+Z+S9e/QaCtWfmt5jAxbjoakeNqqQoJm2H4Ej
 mjy7+mRxaBD52U6v/SIjNBKRlhDe/N6lri/EzFl4UjnFjV0wDV4Xn2+2xVOie4vMQmti
 DY54VHBt9awAroQC6mnw9Zj7WzKPIpTAJIbpuiVNCy4c1upkNnYh9pL7RkLVo6VsUR4Z
 /ZJ0GUbHNV8egeLMIaa6tECVY5QjEnS9fA7b4s2aRD8ajM5752hmHCzrKC4GxmfFaEyu
 LlOlAJ9qnYKOfafPwzq6ylLd+BsR04jAfxy0NseKF1wLwg2xu+v6LXt8OjqXpLu5ltiM
 K18Q==
X-Gm-Message-State: AOAM533l6JhjcqPt5jN17LqqVSDgT3bHgt9y38GErehtG6XPuWX8W4XH
 uTOE+5QlDJqmS4vNPZTbIAL9bNlu1CAX+ftdpJs=
X-Google-Smtp-Source: ABdhPJzov837IYv1pcN4oV1EdzlXtutGqJ2uO1wFujSftFH6TmEXsgrfFk6WiN3fyZPcNY2ZqHgC+bVJ20VUKIwmt/Y=
X-Received: by 2002:a9d:d89:: with SMTP id 9mr4794865ots.23.1616511740509;
 Tue, 23 Mar 2021 08:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210310161444.1015500-1-markyacoub@chromium.org>
In-Reply-To: <20210310161444.1015500-1-markyacoub@chromium.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Mar 2021 11:02:09 -0400
Message-ID: <CADnq5_P9aYcedOP2qduSz7VN1fCSnmQEtPa+FdjYu9Co7TwPog@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Ensure that the modifier requested is
 supported by plane.
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 10, 2021 at 11:15 AM Mark Yacoub <markyacoub@chromium.org> wrote:
>
> From: Mark Yacoub <markyacoub@google.com>
>
> On initializing the framebuffer, call drm_any_plane_has_format to do a
> check if the modifier is supported. drm_any_plane_has_format calls
> dm_plane_format_mod_supported which is extended to validate that the
> modifier is on the list of the plane's supported modifiers.
>
> The bug was caught using igt-gpu-tools test: kms_addfb_basic.addfb25-bad-modifier
>
> Tested on ChromeOS Zork by turning on the display, running an overlay
> test, and running a YT video.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Signed-off-by: default avatarMark Yacoub <markyacoub@chromium.org>

I'm not an expert with modifiers yet.  Will this break chips which
don't currently support modifiers?

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       | 13 +++++++++++++
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  9 +++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index afa5f8ad0f563..a947b5aa420d2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -908,6 +908,19 @@ int amdgpu_display_gem_fb_verify_and_init(
>                                          &amdgpu_fb_funcs);
>         if (ret)
>                 goto err;
> +       /* Verify that the modifier is supported. */
> +       if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
> +                                     mode_cmd->modifier[0])) {
> +               struct drm_format_name_buf format_name;
> +               drm_dbg_kms(dev,
> +                           "unsupported pixel format %s / modifier 0x%llx\n",
> +                           drm_get_format_name(mode_cmd->pixel_format,
> +                                               &format_name),
> +                           mode_cmd->modifier[0]);
> +
> +               ret = -EINVAL;
> +               goto err;
> +       }
>
>         ret = amdgpu_display_framebuffer_init(dev, rfb, mode_cmd, obj);
>         if (ret)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 961abf1cf040c..21314024a83ce 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3939,6 +3939,7 @@ static bool dm_plane_format_mod_supported(struct drm_plane *plane,
>  {
>         struct amdgpu_device *adev = drm_to_adev(plane->dev);
>         const struct drm_format_info *info = drm_format_info(format);
> +       int i;
>
>         enum dm_micro_swizzle microtile = modifier_gfx9_swizzle_mode(modifier) & 3;
>
> @@ -3952,6 +3953,14 @@ static bool dm_plane_format_mod_supported(struct drm_plane *plane,
>         if (modifier == DRM_FORMAT_MOD_LINEAR)
>                 return true;
>
> +       /* Check that the modifier is on the list of the plane's supported modifiers. */
> +       for (i = 0; i < plane->modifier_count; i++) {
> +               if (modifier == plane->modifiers[i])
> +                       break;
> +       }
> +       if (i == plane->modifier_count)
> +               return false;
> +
>         /*
>          * The arbitrary tiling support for multiplane formats has not been hooked
>          * up.
> --
> 2.30.1.766.gb4fecdf3b7-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
