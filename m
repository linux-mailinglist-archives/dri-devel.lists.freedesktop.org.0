Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D077163D775
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 15:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6A010E464;
	Wed, 30 Nov 2022 14:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B278210E464
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 14:03:27 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id f3so16155011pgc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 06:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EEv8biCW1DAZ/y5wqGNt797D01bRASY/trErFq6uAMs=;
 b=UOZL9aovBLP3IRsFLyhdKW/pGGv4eOjZaSaB4Y8Ym4ei8ZwypxvOO/uQBS2EZNdZt2
 elUAGrkEtiieGjb0WBfHTFKVLzsC54NVHYRP+rNoBdnNbqT83EK4U73nPT3NwZJ1F5Bx
 NXrw/QoUKUHxH1psiJAry1SfhT2kCu7mcQKIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EEv8biCW1DAZ/y5wqGNt797D01bRASY/trErFq6uAMs=;
 b=mUAnN6Vr6/Q1Goo4bZc7T+PznzJiexuoFrGa0CMechtdUEcJcd5a2TRezYdvRKfMEv
 1yr2xAQIazQZ0m+TI7G1NBwuLqEBIBtutuDRf+QHmt9L4dinXn1NgfCPYMbfTEbWhvtn
 ZXiCEQvtobD/wa8BZbPc9cdf8G8olVcHDVlFvvTPUYNqduQ0yafl1mFW4cY7QU90sNHn
 Yi7nFnja4FBs8nniRMVOcH9zsnMfBj+/62pFGEZSliUy92G+S0jlADS+0AOn7WzGyChY
 +zQ2nD0R/q2nTWolBJe68aSEStpO+Cy+/uJHNBQEGJy5N/EkRXcc8IvgaDm169XIUWw/
 aAmQ==
X-Gm-Message-State: ANoB5pnye1UlLmhCQj0+N1+gw5hl3c7homEUrfRvfznyLNlWRGjAtrhA
 f4p+RJVh2qfiPYdRiA+IpOxYXuXtQJKTqyFBSO1TVQ==
X-Google-Smtp-Source: AA0mqf6KeHcENbmOiG7T2E55IFNkSKIPRSOlOP/bSDKNZdIZ7zLoslnx9jPJwCKyZsvAoB4iS0MvnmTEvpKENKWR1xo=
X-Received: by 2002:a63:ff5f:0:b0:46f:b6df:3107 with SMTP id
 s31-20020a63ff5f000000b0046fb6df3107mr36521260pgk.454.1669817003750; Wed, 30
 Nov 2022 06:03:23 -0800 (PST)
MIME-Version: 1.0
References: <20221129200242.298120-1-robdclark@gmail.com>
 <20221129200242.298120-3-robdclark@gmail.com>
In-Reply-To: <20221129200242.298120-3-robdclark@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 30 Nov 2022 15:03:10 +0100
Message-ID: <CAKMK7uGi7fDC2=3-H5h0e4a0FUOOy_rLB22-DXRoJ2kQEkPeMQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/shmem-helper: Avoid vm_open error paths
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Eric Anholt <eric@anholt.net>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 29, 2022 at 12:02:42PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> vm_open() is not allowed to fail.  Fortunately we are guaranteed that
> the pages are already pinned, and only need to increment the refcnt.  So
> just increment it directly.

Please mention hare that the only issue is the mutex_lock_interruptible,
and the only way we've found to hit this is if you send a signal to the
original process in a fork() at _just_ the right time.

With that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>
> Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
> Cc: stable@vger.kernel.org
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 110a9eac2af8..9885ba64127f 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -571,12 +571,20 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
>  {
>       struct drm_gem_object *obj = vma->vm_private_data;
>       struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> -     int ret;
>
>       WARN_ON(shmem->base.import_attach);
>
> -     ret = drm_gem_shmem_get_pages(shmem);
> -     WARN_ON_ONCE(ret != 0);
> +     mutex_lock(&shmem->pages_lock);
> +
> +     /*
> +      * We should have already pinned the pages, vm_open() just grabs
> +      * an additional reference for the new mm the vma is getting
> +      * copied into.
> +      */
> +     WARN_ON_ONCE(!shmem->pages_use_count);
> +
> +     shmem->pages_use_count++;
> +     mutex_unlock(&shmem->pages_lock);
>
>       drm_gem_vm_open(vma);
>  }
> --
> 2.38.1
>

--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
