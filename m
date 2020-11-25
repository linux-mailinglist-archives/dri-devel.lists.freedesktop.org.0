Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1270F2C4529
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 17:28:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C39E6EA27;
	Wed, 25 Nov 2020 16:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8766EA20
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 16:28:44 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id h3so3428681oie.8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 08:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dRACjaFJh4AZpkepxixl78ErKCZI3elRJ+hcGP1uvRc=;
 b=K4nmwFzet4CmWQbz4zwRTZ6CI5hxzbxZ25gbBnhWnCJH8Q8rKXsL79Ql5rlCpu29Lr
 bPggFh1VtIOTIpQaTQqFAtXfwAgUPiNMU07nzL7WEAwSqk0xgspIBThT1z03Zvfxcs3b
 aqQEsY9KeNryZDXQ07y5HihJ9KhEL6DoeL6A8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dRACjaFJh4AZpkepxixl78ErKCZI3elRJ+hcGP1uvRc=;
 b=r0xML2EVfcGU1uB3JofgtN6JVFEzhb5aRi5pzk5n3e8Csd7oPDCRhWWMd/3dAovyv5
 epTBhKCL2sWxerQafeNsqH0mdvtyW54zt2HCIzh3/0SWtUeg1dEYAJQt9cF+qjlsE6mD
 1VGZNznmJFED+iy06M5rRtqHbZJ8EQ4tk/IDeex1GQO8BFh9unxCs5o32dv0lf/iUTds
 18d/jgSGgKOcN5UL8yxsYp/12aZLzKSWzoxLZ3wMQFF3AMPX9vQHx2KpiiV+iwM7OZ2Y
 ppF1VBAfI/qEAPk88j4+c5r6hg2XFDsDtFXS3CyFqi4tXSLghkWXW3x2Ghak5yRfTxCK
 XZ1Q==
X-Gm-Message-State: AOAM533hZ4IGV5CvcdReGcKfx7GIIcyG4vENf7R/2AwAeZTNZYJEh2Z7
 QtA+HXb6cQCORmwUNtgtUxHKZpLkNsRlbZOucZ/g5IUWn8M=
X-Google-Smtp-Source: ABdhPJxFp4HuSi30fm1PHbzKdfrYvQxr8zUWpRKb+OichQq/lnbRaStrtSKPxiYo68cqfG34JDlvPm/6dqfZjcK5iGw=
X-Received: by 2002:aca:7506:: with SMTP id q6mr2814868oic.128.1606321723817; 
 Wed, 25 Nov 2020 08:28:43 -0800 (PST)
MIME-Version: 1.0
References: <20201125162532.1299794-1-daniel.vetter@ffwll.ch>
 <20201125162532.1299794-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20201125162532.1299794-5-daniel.vetter@ffwll.ch>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 25 Nov 2020 17:28:32 +0100
Message-ID: <CAKMK7uGXfqaPUtnX=VgA3tFn3S+Gt9GV+kPguakZ6FF_n8LKuA@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: don't set page->mapping
To: DRI Development <dri-devel@lists.freedesktop.org>
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 Linux MM <linux-mm@kvack.org>, Huang Rui <ray.huang@amd.com>,
 Brian Paul <brianp@vmware.com>, linux-fsdevel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 25, 2020 at 5:25 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Random observation while trying to review Christian's patch series to
> stop looking at struct page for dma-buf imports.
>
> This was originally added in
>
> commit 58aa6622d32af7d2c08d45085f44c54554a16ed7
> Author: Thomas Hellstrom <thellstrom@vmware.com>
> Date:   Fri Jan 3 11:47:23 2014 +0100
>
>     drm/ttm: Correctly set page mapping and -index members
>
>     Needed for some vm operations; most notably unmap_mapping_range() with
>     even_cows = 0.
>
>     Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
>     Reviewed-by: Brian Paul <brianp@vmware.com>
>
> but we do not have a single caller of unmap_mapping_range with
> even_cows == 0. And all the gem drivers don't do this, so another
> small thing we could standardize between drm and ttm drivers.
>
> Plus I don't really see a need for unamp_mapping_range where we don't
> want to indiscriminately shoot down all ptes.
>
> Cc: Thomas Hellstrom <thellstrom@vmware.com>
> Cc: Brian Paul <brianp@vmware.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>

Apologies again, this shouldn't have been included. But at least I
have an idea now why this patch somehow was included in the git
send-email. Lovely interface :-/
-Daniel

> ---
>  drivers/gpu/drm/ttm/ttm_tt.c | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index da9eeffe0c6d..5b2eb6d58bb7 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -284,17 +284,6 @@ int ttm_tt_swapout(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
>         return ret;
>  }
>
> -static void ttm_tt_add_mapping(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
> -{
> -       pgoff_t i;
> -
> -       if (ttm->page_flags & TTM_PAGE_FLAG_SG)
> -               return;
> -
> -       for (i = 0; i < ttm->num_pages; ++i)
> -               ttm->pages[i]->mapping = bdev->dev_mapping;
> -}
> -
>  int ttm_tt_populate(struct ttm_bo_device *bdev,
>                     struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
>  {
> @@ -313,7 +302,6 @@ int ttm_tt_populate(struct ttm_bo_device *bdev,
>         if (ret)
>                 return ret;
>
> -       ttm_tt_add_mapping(bdev, ttm);
>         ttm->page_flags |= TTM_PAGE_FLAG_PRIV_POPULATED;
>         if (unlikely(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
>                 ret = ttm_tt_swapin(ttm);
> --
> 2.29.2
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
