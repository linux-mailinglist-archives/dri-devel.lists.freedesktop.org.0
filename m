Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E732417CE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 10:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06D289DE3;
	Tue, 11 Aug 2020 08:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A959289DE3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 08:02:22 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id v22so8368543edy.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 01:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=n6VRx93UP7SVJ3en7iZoi4oZyf8lmnAm3OUl4YLhako=;
 b=pMZWzX3LFBY0UvXbRpGZr17MiaVulx8wyyDzpUfKck9ZVO36biPsFD1zhFBnIJqQ+6
 W7TMwkCn/DX3Idf7He0RviCGcUxOGS6w3s5GJmO6xnPq59GTFvm3Y1ifwTcM+hV7bEGD
 tYVR1k35TSeBfNYwUETsMT8DwuTT8cvyC2YWNgxf69p0VPwacNp8RYhxP/XXuCy+fKrF
 PusQoszmV912FagftJFBAisE/Oa4srGGW1sT5J5CUyPML5ThSM8LvJ6K/0YfHJ3AY++6
 C3Bpv9gTKKFALxMzCeTlekGKIRNjcXkZZmzMrVvtNW1L74zNV0SdNbnZcV0CqFfT557v
 yCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=n6VRx93UP7SVJ3en7iZoi4oZyf8lmnAm3OUl4YLhako=;
 b=Lx8OvKSf6N2ntaDIZWtksBOOztkyFIfPLCM1NW2Hucvm05ZSMIHSdiBBzTNNjP07Ha
 JRVS12h+zG7Ff2K4sqh3YW/Oe+l6QA8ZOr53MIGP2/Ak1Qnc8amQ5uYkopBkXl04GYzi
 6bM0QfZAQwfXa4a9bxnDlh3TkRONKTYIbT6NDjIvIXFTjpYsfuA8CAX6rY9Hbit6NMJq
 QMDp5znO+smOcADyUPjwTZEywp8FguPp3PyqYszjU40zivrZEHKsbf+cDqJg6PeEvFhz
 vgL4aR7Km5+/re0xhGXiYgDMFZPYdiuYjeAL0kGCGHwLBBhaHHTki1SFrcRg/fgHzkjX
 L3KA==
X-Gm-Message-State: AOAM530WWO+wSqLU7xIu16uidKSOgcuOTAL59GBvpcVspwOZZ/dzuntd
 NWvzJU+UssfIbskZg0JOzW8olyNuUgY/eWeB3x2c3Q==
X-Google-Smtp-Source: ABdhPJzFTF8MIhlJxlEaw1NXdm5kWcfhKTtgee1uiajIXTzP7VDFc0mI5PxOG9XecBKjToKEpUN6nCS7Qhy8OLAMjJA=
X-Received: by 2002:aa7:c246:: with SMTP id y6mr25807932edo.78.1597132941099; 
 Tue, 11 Aug 2020 01:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200811074658.58309-1-airlied@gmail.com>
In-Reply-To: <20200811074658.58309-1-airlied@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 11 Aug 2020 18:02:09 +1000
Message-ID: <CAPM=9tw2nZB569FUw_KGhhP07m0n8ZugcFNrAsa0kn+9xtndsg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/ttm: init mem->bus in common code.
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(cc'ing Christian, just in case he misses them). 2 small cleanups.

On Tue, 11 Aug 2020 at 17:47, Dave Airlie <airlied@gmail.com> wrote:
>
> From: Dave Airlie <airlied@redhat.com>
>
> The drivers all do the same thing here.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 6 ------
>  drivers/gpu/drm/drm_gem_vram_helper.c      | 6 ------
>  drivers/gpu/drm/nouveau/nouveau_bo.c       | 6 ------
>  drivers/gpu/drm/qxl/qxl_ttm.c              | 6 ------
>  drivers/gpu/drm/radeon/radeon_ttm.c        | 6 ------
>  drivers/gpu/drm/ttm/ttm_bo_util.c          | 5 +++++
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 6 ------
>  7 files changed, 5 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 67d2eef2f9eb..324abf7a3cba 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -751,12 +751,6 @@ static int amdgpu_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_reso
>         struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
>         struct drm_mm_node *mm_node = mem->mm_node;
>
> -       mem->bus.addr = NULL;
> -       mem->bus.offset = 0;
> -       mem->bus.size = mem->num_pages << PAGE_SHIFT;
> -       mem->bus.base = 0;
> -       mem->bus.is_iomem = false;
> -
>         switch (mem->mem_type) {
>         case TTM_PL_SYSTEM:
>                 /* system memory */
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index b410930d94a0..545a877406f4 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1038,14 +1038,8 @@ static int bo_driver_io_mem_reserve(struct ttm_bo_device *bdev,
>  {
>         struct drm_vram_mm *vmm = drm_vram_mm_of_bdev(bdev);
>
> -       mem->bus.addr = NULL;
> -       mem->bus.size = mem->num_pages << PAGE_SHIFT;
> -
>         switch (mem->mem_type) {
>         case TTM_PL_SYSTEM:     /* nothing to do */
> -               mem->bus.offset = 0;
> -               mem->bus.base = 0;
> -               mem->bus.is_iomem = false;
>                 break;
>         case TTM_PL_VRAM:
>                 mem->bus.offset = mem->start << PAGE_SHIFT;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 604a74323696..7cfe3898ce62 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1380,12 +1380,6 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_resource *reg)
>         struct nvkm_device *device = nvxx_device(&drm->client.device);
>         struct nouveau_mem *mem = nouveau_mem(reg);
>
> -       reg->bus.addr = NULL;
> -       reg->bus.offset = 0;
> -       reg->bus.size = reg->num_pages << PAGE_SHIFT;
> -       reg->bus.base = 0;
> -       reg->bus.is_iomem = false;
> -
>         switch (reg->mem_type) {
>         case TTM_PL_SYSTEM:
>                 /* System memory */
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index b1ea984f143a..c55ac31f5476 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -75,12 +75,6 @@ int qxl_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
>  {
>         struct qxl_device *qdev = qxl_get_qdev(bdev);
>
> -       mem->bus.addr = NULL;
> -       mem->bus.offset = 0;
> -       mem->bus.size = mem->num_pages << PAGE_SHIFT;
> -       mem->bus.base = 0;
> -       mem->bus.is_iomem = false;
> -
>         switch (mem->mem_type) {
>         case TTM_PL_SYSTEM:
>                 /* system memory */
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 3355b69b13d1..1f1e025b9f06 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -380,12 +380,6 @@ static int radeon_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_reso
>  {
>         struct radeon_device *rdev = radeon_get_rdev(bdev);
>
> -       mem->bus.addr = NULL;
> -       mem->bus.offset = 0;
> -       mem->bus.size = mem->num_pages << PAGE_SHIFT;
> -       mem->bus.base = 0;
> -       mem->bus.is_iomem = false;
> -
>         switch (mem->mem_type) {
>         case TTM_PL_SYSTEM:
>                 /* system memory */
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 496158acd5b9..023f0a2d07c9 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -138,6 +138,11 @@ int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
>         if (!bdev->driver->io_mem_reserve)
>                 return 0;
>
> +       mem->bus.addr = NULL;
> +       mem->bus.offset = 0;
> +       mem->bus.size = mem->num_pages << PAGE_SHIFT;
> +       mem->bus.base = 0;
> +       mem->bus.is_iomem = false;
>  retry:
>         ret = bdev->driver->io_mem_reserve(bdev, mem);
>         if (ret == -ENOSPC) {
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index 69e7e7fe2a4c..6ae4a856241b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -717,12 +717,6 @@ static int vmw_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_resourc
>  {
>         struct vmw_private *dev_priv = container_of(bdev, struct vmw_private, bdev);
>
> -       mem->bus.addr = NULL;
> -       mem->bus.is_iomem = false;
> -       mem->bus.offset = 0;
> -       mem->bus.size = mem->num_pages << PAGE_SHIFT;
> -       mem->bus.base = 0;
> -
>         switch (mem->mem_type) {
>         case TTM_PL_SYSTEM:
>         case VMW_PL_GMR:
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
