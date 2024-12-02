Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037459E04F6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 15:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D828810E765;
	Mon,  2 Dec 2024 14:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="QgpXgil8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59D010E764;
 Mon,  2 Dec 2024 14:30:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1733149838; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KAYJ+SVldCKeFbNKK5my8RDHpbsYSjygxFmX+ZtQnxzFoypxjZRJ0/vG62Fdd15fIEN+dT5G7jTE+BzfweAoUr8jqfSQaELQPuAGuGHK5j1whvLtsvrQluufP1H3nvAsAj16aPCf2aIjRj8M60Cnm1ps6kYShPirVbZE2Ld5EC4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1733149838;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Gurws+fL4kEYTQO93cSI4aYvOGLDtpvlUfKwFkPIM3Y=; 
 b=gzTgrAfc67S/jbf4VWZrLvVQ3WOuDp98nYroK+At/ZwY4+5Rphk66VWa3K8NXrA9ne3NWc7L/MVReLF3ku4rWXA635hVU3C9WNvmN9FIi/x9dliU1drFrXjIMgyzQ/A5QSEnOBM3gpQ9IqVOInzZXGzr65H1Q//2e2hW538MMoY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733149838; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Gurws+fL4kEYTQO93cSI4aYvOGLDtpvlUfKwFkPIM3Y=;
 b=QgpXgil8+lczGYWgdKRNH4Y8MhkES3bEPK9VjAAdbva9a8WlAVkjkIqIwyLkzeCN
 kLewsF89IReNkLIL+5sVdwCULCGIESLOJl4/6ZLK5F1bC7St11pqiaQG/52TOUcak+v
 eZ9li+CzozbGtmV3YPQ+Ean/pvdeQGkgLppGTeyI=
Received: by mx.zohomail.com with SMTPS id 1733149751274486.1128506514832;
 Mon, 2 Dec 2024 06:29:11 -0800 (PST)
Message-ID: <be01d2f7-8423-4e10-b65b-a84a7bc7c99e@collabora.com>
Date: Mon, 2 Dec 2024 17:29:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/virtio: Add drm_panic support
To: Ryosuke Yasuoka <ryasuoka@redhat.com>, airlied@redhat.com,
 kraxel@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, daniel@ffwll.ch, jfalempe@redhat.com,
 christophe.jaillet@wanadoo.fr
Cc: virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20241129122408.4167150-1-ryasuoka@redhat.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20241129122408.4167150-1-ryasuoka@redhat.com>
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

On 11/29/24 15:24, Ryosuke Yasuoka wrote:
....
> +static int virtio_drm_get_scanout_buffer(struct drm_plane *plane,
> +					 struct drm_scanout_buffer *sb)
> +{
> +	struct virtio_gpu_object *bo;
> +
> +	if (!plane->state || !plane->state->fb || !plane->state->visible)
> +		return -ENODEV;
> +
> +	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
> +	if (virtio_gpu_is_vram(bo))
> +		return -ENODEV;

VirtIO-GPU now supports importing external dmabufs, we should reject
bo->base.base.import_attach here now too.

> +
> +	/* try to vmap it if possible */
> +	if (!bo->base.vaddr) {
> +		int ret;
> +
> +		ret = drm_gem_shmem_vmap(&bo->base, &sb->map[0]);
> +		if (ret)
> +			return ret;

I've now noticed that drm_gem_shmem_vmap() expects BO reservation lock
to be held and we can't take lock it at a panic time.

https://elixir.bootlin.com/linux/v6.12.1/source/drivers/gpu/drm/drm_gem_shmem_helper.c#L330

This resv warning isn't triggered because bo->base.vaddr is set for VT
framebufffer BO when panic happens.

We actually should reject all BOs that don't have bo->base.vaddr set at
the panic time. Please correct it in v6 and rebase on top of a recent
drm-next tree.

> +	} else {
> +		iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
> +	}
> +
> +	sb->format = plane->state->fb->format;
> +	sb->height = plane->state->fb->height;
> +	sb->width = plane->state->fb->width;
> +	sb->pitch[0] = plane->state->fb->pitches[0];
> +	return 0;
> +}
...
> +static void virtio_panic_flush(struct drm_plane *plane)
> +{
> +	struct virtio_gpu_object *bo;
> +	struct drm_device *dev = plane->dev;
> +	struct virtio_gpu_device *vgdev = dev->dev_private;
> +	struct drm_rect rect;
> +	void *p_vbuf = vgdev->panic_vbuf;
> +	struct virtio_gpu_vbuffer *vbuf_dumb_bo = p_vbuf;
> +	struct virtio_gpu_vbuffer *vbuf_resource_flush = p_vbuf + VBUFFER_SIZE;

This p_vbuf + VBUFFER_SIZE looks suspicious. The VBUFFER_SIZE macro
isn't guarded with parentheses (), hence this vbuf_resource_flush is
pointing at the CMD part of the vbuf_dumb_bo?

Won't be using kmem_cache_zalloc(vgdev->vbufs, GFP_ATOMIC) to
dynamically allocate both buffers make everything cleaner?

...
> -#define MAX_INLINE_CMD_SIZE   96
> -#define MAX_INLINE_RESP_SIZE  24
> -#define VBUFFER_SIZE          (sizeof(struct virtio_gpu_vbuffer) \
> -			       + MAX_INLINE_CMD_SIZE		 \
> -			       + MAX_INLINE_RESP_SIZE)...

-- 
Best regards,
Dmitry
