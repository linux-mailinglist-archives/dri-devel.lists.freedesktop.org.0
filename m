Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F474A8B21F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 09:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9436110E86A;
	Wed, 16 Apr 2025 07:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="HqrJaexa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C04810E86A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 07:29:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1744788555; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=APaSB62EEZIT1HWumU4kzfmkspUWrlnz/Awae+k8Pwgrd2dEIH9F+Uj43oDBfOql4neIKA7BADILAPF6xC7DsxrRtZFRSYvVj/01pR3FQNJfEx2sxMyCv5yPpWcSXXMdaVx70iUy3qDp5nY31xjeuUPrt2Nr66/t33S4pP4J1dE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1744788555;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=PUkANMCN8iIkMKObPT/LBcWsJXo1g4Bf7rqvaDJs4NM=; 
 b=L2DgJX8naGiCehpemZ0uL+giOd9jeHr4lpkwXSL0Vhnmt4jpeSi80Xk3+bdrwX/7jdCQ/CKkb/4uCwm5XF/qRatagfD2B65BJRIY9oDuVtXN0DsJrrSUf5b1TpmoVcsKX0JsBR3kbBVBsRWLUKgFXMIeaza1cvD6RtfzF78/wtM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744788555; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=PUkANMCN8iIkMKObPT/LBcWsJXo1g4Bf7rqvaDJs4NM=;
 b=HqrJaexa50S+DeYKYufChcDxobhDsrXp3jB6QQAugQjgXadgJALFjlZ06IF/Hl/0
 cyjnOLkhCdHle/vvFUyo+xx7nheWySK9tANgqaE6/NsZ5Q7yBzbdIcEHr3z76Z7MkYk
 atMbT3Bf7FIp1Bur5mceheeprcOtKXbPA22kP4Po=
Received: by mx.zohomail.com with SMTPS id 1744788552850792.253352752949;
 Wed, 16 Apr 2025 00:29:12 -0700 (PDT)
Message-ID: <d36c2ba7-52b6-4688-bb2b-70b8bd4d33c0@collabora.com>
Date: Wed, 16 Apr 2025 10:29:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: Support drm_panic with non-vmapped shmem BO
To: Ryosuke Yasuoka <ryasuoka@redhat.com>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 simona@ffwll.ch, jfalempe@redhat.com
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250412132012.291837-1-ryasuoka@redhat.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20250412132012.291837-1-ryasuoka@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 4/12/25 16:20, Ryosuke Yasuoka wrote:
> Pass array of pages of the scanout buffer [1] to shmem BO, allowing
> drm_panic to work even if the BO is not vmapped.
> 
> [1] https://lore.kernel.org/all/20250407140138.162383-3-jfalempe@redhat.com/
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index a6f5a78f436a..2ff57d559c86 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -500,11 +500,19 @@ static int virtio_drm_get_scanout_buffer(struct drm_plane *plane,
>  
>  	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
>  
> -	/* Only support mapped shmem bo */
> -	if (virtio_gpu_is_vram(bo) || bo->base.base.import_attach || !bo->base.vaddr)
> +	if (virtio_gpu_is_vram(bo) || bo->base.base.import_attach)
>  		return -ENODEV;
>  
> -	iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
> +	if (bo->base.vaddr)
> +		iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
> +	else {
> +		struct drm_gem_shmem_object *shmem = &bo->base;
> +
> +		if (!shmem->pages)
> +			return -ENODEV;
> +		/* map scanout buffer later */
> +		sb->pages = shmem->pages;
> +	}
>  
>  	sb->format = plane->state->fb->format;
>  	sb->height = plane->state->fb->height;
> 
> base-commit: e7bb7d44c3b97aea1f0e354c6499900154ac67f2

Rebased on top of [1], fixed checkpatch warning about braces and applied
to misc-next. Thanks!

[1] https://lore.kernel.org/all/20250414131507.566072-1-tzimmermann@suse.de/

-- 
Best regards,
Dmitry
