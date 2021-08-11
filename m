Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B14B73E8D3B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 11:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3A86E0EE;
	Wed, 11 Aug 2021 09:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF4C6E0EE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 09:27:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CA5360F55
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 09:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628674047;
 bh=tuvddNBNvoHJ5bBz78nfvkY+HnC5kb/RTz6/xvxTlBM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tWQ57BL360wpbVFNJHwth5OLCCal0D8256xNmq86TsklMFv2RN4NNpWbg2OIn9Tmw
 KMRcYEM34/I3fBL3raVJ8XuYebhaH3TdFuQwlR7Wc4NGnzKMHlRiEH5+6YUSVWocNy
 wTSxyRJN24O76V0bMfEbMyxEdgNmXKpz1XRHLkHZ50Wn69czYrvQdgZl6Pkh9tO0NR
 ZTG8pcluCA2NGn3C7DIx3kNKAYpyr+p65ne/5nVziBX9OrQNU793LdnyQJmQj1MH0j
 IZ7V+g9e/1X+xgR3pPQJ64chGb9uNlSTaL4ETocpdpDZWIHdodKqdeKYu1dQFfDn3F
 MpzdbPILyioTA==
Received: by mail-il1-f181.google.com with SMTP id r6so1077292ilt.13
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 02:27:27 -0700 (PDT)
X-Gm-Message-State: AOAM533fI3oHyujaoEqG9fhzqFnnt3BVWnU+e0ZeXlKpdTPK94IU5dJq
 TD33CtgMCy4hmdfOjZxyp+Oz9ufoVExSk1eli1o=
X-Google-Smtp-Source: ABdhPJxkGhkvKZ9QYl0F2FacPSRF/zugCW9rfrkdBmcFx+4fh+iGvNaClEIQj3WVis0UTHj1Iv36bkgpGgNZ+XeYQs8=
X-Received: by 2002:a05:6e02:13a1:: with SMTP id
 h1mr235074ilo.126.1628674046732; 
 Wed, 11 Aug 2021 02:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210810195906.22220-1-dmoulding@me.com>
 <20210810195906.22220-2-dmoulding@me.com>
In-Reply-To: <20210810195906.22220-2-dmoulding@me.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 11 Aug 2021 17:27:15 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6h1f==zLF+dcdigx-ttAEuar3=uSvJAtDJLm5LSN54+A@mail.gmail.com>
Message-ID: <CAAhV-H6h1f==zLF+dcdigx-ttAEuar3=uSvJAtDJLm5LSN54+A@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm: ttm: Don't bail from ttm_global_init if
 debugfs_create_dir fails
To: Dan Moulding <dmoulding@me.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 ray.huang@amd.com, jason@jlekstrand.net
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tested-by: Huacai Chen <chenhuacai@loongson.cn>

On Wed, Aug 11, 2021 at 6:42 AM Dan Moulding <dmoulding@me.com> wrote:
>
> In 69de4421bb4c ("drm/ttm: Initialize debugfs from
> ttm_global_init()"), ttm_global_init was changed so that if creation
> of the debugfs global root directory fails, ttm_global_init will bail
> out early and return an error, leading to initialization failure of
> DRM drivers. However, not every system will be using debugfs. On such
> a system, debugfs directory creation can be expected to fail, but DRM
> drivers must still be usable. This changes it so that if creation of
> TTM's debugfs root directory fails, then no biggie: keep calm and
> carry on.
>
> Fixes: 69de4421bb4c ("drm/ttm: Initialize debugfs from ttm_global_init()")
> Signed-off-by: Dan Moulding <dmoulding@me.com>
> ---
>  drivers/gpu/drm/ttm/ttm_device.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 74e3b460132b..2df59b3c2ea1 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -78,9 +78,7 @@ static int ttm_global_init(void)
>
>         ttm_debugfs_root = debugfs_create_dir("ttm", NULL);
>         if (IS_ERR(ttm_debugfs_root)) {
> -               ret = PTR_ERR(ttm_debugfs_root);
>                 ttm_debugfs_root = NULL;
> -               goto out;
>         }
>
>         /* Limit the number of pages in the pool to about 50% of the total
> --
> 2.31.1
>
