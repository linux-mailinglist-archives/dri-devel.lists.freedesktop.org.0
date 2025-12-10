Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0215CB309C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 14:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31E610E065;
	Wed, 10 Dec 2025 13:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cN1wbjaR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B7D10E065
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 13:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765373751;
 bh=afDKr2oSQk/FNHz73gMW9P45S4Q3t8BCMxgWTsGoIU4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cN1wbjaRP1hxXbfZIAN8m1TeSHkpU9GmH/IWusLu4abVCzkJSe1qUcOVtxs1GltWN
 FraS5JqEkpBQzd3HsrffNk40ReVyPHpV9MFSLGJbzuaYkVAjFFDyx3rgRwic2DtdUs
 VIGVD6Q6S3UJoHq3SFYchUDN4HnqgRIzsfBIqor1NeiscV5o980KUjRymbXKm+Ar+d
 e4qcpnQOWQBhBcZ5TQCQPqM/U1fbWQtTOvXHAM9ZTk1XER06Uki+flclWwXkWbIgMQ
 pDFcMMCl1VrStSVfULJNr6uH1KrEZpzAAUDJSQF8ySeCEfW6A6CITobfSk21o36ry9
 KsIMVxgF36k6Q==
Received: from [IPV6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa] (unknown
 [IPv6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9351017E1149;
 Wed, 10 Dec 2025 14:35:51 +0100 (CET)
Message-ID: <c35eb3b9-2f8c-429d-b177-16f2f0c65dda@collabora.com>
Date: Wed, 10 Dec 2025 14:35:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem: Fix builds with CONFIG_MMU=n
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com
References: <20251209171151.2449120-1-boris.brezillon@collabora.com>
Content-Language: fr
From: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>
Organization: Collabora Ltd
In-Reply-To: <20251209171151.2449120-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Boris,

I missed that one, thanks for the fix.

On 09/12/2025 18:11, Boris Brezillon wrote:
> drm_gem_get_unmapped_area() relies on mm_get_unmapped_area() which is
> only available if CONFIG_MMU=y.
> 
> Fixes: 99bda20d6d4c ("drm/gem: Introduce drm_gem_get_unmapped_area() fop")
> Cc: Loïc Molinari <loic.molinari@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Loïc Molinari <loic.molinari@collabora.com>

Regards,
Loïc

> ---
>   drivers/gpu/drm/drm_gem.c | 2 ++
>   include/drm/drm_gem.h     | 5 +++++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 6021c4087a08..ca1956608261 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1267,6 +1267,7 @@ drm_gem_object_lookup_at_offset(struct file *filp, unsigned long start,
>   	return obj;
>   }
>   
> +#ifdef CONFIG_MMU
>   /**
>    * drm_gem_get_unmapped_area - get memory mapping region routine for GEM objects
>    * @filp: DRM file pointer
> @@ -1309,6 +1310,7 @@ unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
>   	return ret;
>   }
>   EXPORT_SYMBOL_GPL(drm_gem_get_unmapped_area);
> +#endif
>   
>   /**
>    * drm_gem_mmap - memory map routine for GEM objects
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index cca815dc87f3..f4da8ed0d630 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -537,9 +537,14 @@ void drm_gem_vm_close(struct vm_area_struct *vma);
>   int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
>   		     struct vm_area_struct *vma);
>   int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
> +
> +#ifdef CONFIG_MMU
>   unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
>   					unsigned long len, unsigned long pgoff,
>   					unsigned long flags);
> +#else
> +#define drm_gem_get_unmapped_area NULL
> +#endif
>   
>   /**
>    * drm_gem_object_get - acquire a GEM buffer object reference

