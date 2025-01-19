Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DFDA16173
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jan 2025 12:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A452710E07C;
	Sun, 19 Jan 2025 11:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="V6J9IOss";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1555710E07C
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2025 11:50:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1737287415; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bi7Y0DJIuxhsfuxA8Nj8+4gXie9/EDv6whpLe5Ul7JHG8aEwuiWJAGwsOdZojWpI56TXjwi0yDuJD7/Gn6xPXv1C0ZhAnQW2exNjl4rERvV5jOwzzftDTbGETSlzG2BkaXg7zLzuQNrxV1KZMvEo/jUcWhvHOhNo3zKMIgFOF60=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1737287415;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=NX14ZjnOfcW9Ml3QJ940u0wzQc8hfZoz4ZMPmB9xgXE=; 
 b=aH/PZ4Y5t4blNxCSbDkPvWdVWizsFbDgpVkzYicl+11EGaUOIwFUgssQpNQzi8ktWkOkCEM/SvuYvcXR+vXMrO76SpfFv+f2Vej9HSqpxbwpr3bHWQiNbHiqpXFdelTb6NCKdRqrdUwWHdAHm0UVKhym6/U3V8fQi1vP3+TXC8Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737287414; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=NX14ZjnOfcW9Ml3QJ940u0wzQc8hfZoz4ZMPmB9xgXE=;
 b=V6J9IOssEG5THySGrmk8fOdw89rfPVO18SSRRwZy4PhQvuyUM3vWuX0EuDQVWNis
 M6dlnTw7Qn0YQf+zabBGyXPHq+d+LAae+5LXFsio6qiEjyKjk7Q4AB6swjy35BQdUZt
 J04ixhgXVka0HOzwtkzuvUCtcCZomqfdGpks3CY8=
Received: by mx.zohomail.com with SMTPS id 1737287411991335.1037660613164;
 Sun, 19 Jan 2025 03:50:11 -0800 (PST)
Message-ID: <2f51584c-0590-432b-a4db-7a2af99cde15@collabora.com>
Date: Sun, 19 Jan 2025 14:50:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: Support partial maps of GEM objects
To: fnkl.kernel@gmail.com, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
References: <20250109-virtgpu-gem-partial-map-v1-1-a914b48776bd@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20250109-virtgpu-gem-partial-map-v1-1-a914b48776bd@gmail.com>
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

Hi,

On 1/10/25 00:45, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Those are useful to implement coherent cross-vm mmap.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_vram.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virtio/virtgpu_vram.c
> index 25df81c027837c248a746e41856b5aa7e216b8d5..64e2c6dbdd678ac4c0da89fdd4c9dbf937c2c335 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vram.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
> @@ -56,12 +56,11 @@ static int virtio_gpu_vram_mmap(struct drm_gem_object *obj,
>  	else if (vram->map_info == VIRTIO_GPU_MAP_CACHE_UNCACHED)
>  		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
>  
> -	/* Partial mappings of GEM buffers don't happen much in practice. */
> -	if (vm_size != vram->vram_node.size)
> +	if (vm_size > vram->vram_node.size)
>  		return -EINVAL;
>  
>  	ret = io_remap_pfn_range(vma, vma->vm_start,
> -				 vram->vram_node.start >> PAGE_SHIFT,
> +				 (vram->vram_node.start >> PAGE_SHIFT) + vma->vm_pgoff,
>  				 vm_size, vma->vm_page_prot);
>  	return ret;
>  }

The vma->vm_pgoff is fake in DRM, it's used for looking up DRM GEM
object based on the vma->vm_pgoff value when mmap is invoked. The
vma->vm_pgoff should be treated as zero here. Hence we can map a part of
GEM, but only from its start. See drm_gem_mmap().

BTW, partial mapping is wanted by Intel native context that I work on.
The intent of this patch is correct. There are practical uses for
partial mappings.

Please correct vma->vm_pgoff in v2.

-- 
Best regards,
Dmitry

