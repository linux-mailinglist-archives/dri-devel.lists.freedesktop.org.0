Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 200A566E81A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 22:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BF810E354;
	Tue, 17 Jan 2023 21:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F8F10E350;
 Tue, 17 Jan 2023 21:03:14 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id r205so27019871oib.9;
 Tue, 17 Jan 2023 13:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zfEqVK+RYVz2dN9ZOupR4yHgB7WZQv3MJYztxeL+5Xc=;
 b=LDfx9vc+Y38Mn1Rs0kcG0pXmB1UTfEU/iOvU7gmofIoKOya9iHq6VfoY1qU/kBB0k6
 vlxeI9awjroyWOiws1Kj+ylDPMGff9OYplninlS7bWj20s3Iqrz+VFqv9YDDOnkIUhAG
 pLyGgUT+2y+xCj6EAGD+Wosk/sh+sMqq1t0xOaZmikJsKMfxobPgIwPiPseY2nw5qXe+
 8Bn23e45g8OElQ6sBCbErDUAaoJSZKKiYg1XY+DmtfPO5NOHPk7bi1viLmweWPp8UX7T
 PLHsVxe45pZPQ1xtEhBX/6yscP8QfaXu5y206tNE7jxIGeqiWvtmA4/QTuYWZylZIU7f
 0leA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zfEqVK+RYVz2dN9ZOupR4yHgB7WZQv3MJYztxeL+5Xc=;
 b=dKpMjxaApCWZ15YmW9Gd9OPEmgLXYhnw50LPHfHorcO4mBW19+NBtS7ABkHLLSssVr
 TxuT5W0QhvgQCMT8ZZohngF9a+xYG5gpYrRegGnGf5V1pmfFS1X9QUPxkz2fglmQLRPt
 e71qJO9epfv7vQq30MpRxQgS0fo01qqiP/i6A13FHttiQRTD7B8nhWz+QvlO2yIx54Vp
 V644dZwr5o/0csmgN7DKTGIxAumb3YAFNASBiDD9HHzqivD5fkfVAffQwmKZk7ExZv7z
 HGuUf3pEVdxCi3AoBc58L/I+9Z45ixxAakrXK1MJLJG9ngq4hS8l+b70cs6J8yD299ZF
 O7AA==
X-Gm-Message-State: AFqh2kpYtAq5ZxEa66lnSXwx19TXa45qPUCcfiXEz0llCxRQZRXD/tKm
 94D5O0L0WQZ6+7u8VJIH3vpJOvV3LxxW8id7eMw=
X-Google-Smtp-Source: AMrXdXvDFWC8RH8P2THHJkEJ8U8eikLyA3GduhlkdGUC68h6pM+zXj1AXAk7a9ylP3xIx2YJx2ehvp/stRmWfBk9Uxs=
X-Received: by 2002:aca:2807:0:b0:35b:f5f7:3ed0 with SMTP id
 7-20020aca2807000000b0035bf5f73ed0mr299595oix.46.1673989393929; Tue, 17 Jan
 2023 13:03:13 -0800 (PST)
MIME-Version: 1.0
References: <20230117205452.195298-1-hamza.mahfooz@amd.com>
In-Reply-To: <20230117205452.195298-1-hamza.mahfooz@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Jan 2023 16:03:01 -0500
Message-ID: <CADnq5_Njw0uFYnB7--A=0Zv78ETLeXpNvH6Zc4znpTPLLQgwkA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix issues with driver unload
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Roman Li <roman.li@amd.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 17, 2023 at 3:55 PM Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>
> Currently, we run into a number of WARN()s when attempting to unload the
> amdgpu driver (e.g. using "modprobe -r amdgpu"). These all stem from
> calling drm_encoder_cleanup() too early. So, to fix this we can stop
> calling drm_encoder_cleanup() in amdgpu_dm_fini() and instead have it be
> called from amdgpu_dm_encoder_destroy(). Also, we don't need to free in
> amdgpu_dm_encoder_destroy() since mst_encoders[] isn't explicitly
> allocated by the slab allocater.
>
> Fixes: f74367e492ba ("drm/amdgpu/display: create fake mst encoders ahead of time (v4)")
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c           | 4 ----
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 1 -
>  2 files changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 9547037857b6..5cc14ed2e93e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1733,10 +1733,6 @@ static void amdgpu_dm_fini(struct amdgpu_device *adev)
>                 adev->dm.vblank_control_workqueue = NULL;
>         }
>
> -       for (i = 0; i < adev->dm.display_indexes_num; i++) {
> -               drm_encoder_cleanup(&adev->dm.mst_encoders[i].base);
> -       }
> -
>         amdgpu_dm_destroy_drm_device(&adev->dm);
>
>  #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index bbeeee7c5d7c..5fa9bab95038 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -492,7 +492,6 @@ static const struct drm_connector_helper_funcs dm_dp_mst_connector_helper_funcs
>  static void amdgpu_dm_encoder_destroy(struct drm_encoder *encoder)
>  {
>         drm_encoder_cleanup(encoder);
> -       kfree(encoder);
>  }
>
>  static const struct drm_encoder_funcs amdgpu_dm_encoder_funcs = {
> --
> 2.39.0
>
