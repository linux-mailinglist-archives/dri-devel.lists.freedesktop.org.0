Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4727F9EA2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 12:34:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE3210E246;
	Mon, 27 Nov 2023 11:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CEDCA10E246
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 11:33:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2FA22F4;
 Mon, 27 Nov 2023 03:34:41 -0800 (PST)
Received: from [10.57.72.179] (unknown [10.57.72.179])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 094993F73F;
 Mon, 27 Nov 2023 03:33:51 -0800 (PST)
Message-ID: <4a519708-6b5c-4947-b6ca-3fdd503392ed@arm.com>
Date: Mon, 27 Nov 2023 11:33:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panfrost: Consider dma-buf imported objects as
 resident
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20231125205438.375407-1-adrian.larumbe@collabora.com>
 <20231125205438.375407-2-adrian.larumbe@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231125205438.375407-2-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/11/2023 20:52, Adrián Larumbe wrote:
> A GEM object constructed from a dma-buf imported sgtable should be regarded
> as being memory resident, because the dma-buf API mandates backing storage
> to be allocated when attachment succeeds.

This obviously can cause a bit of double-counting system wide (both the
exporter and importer could show the memory usage). But I think we're
better off over-counting rather than under-counting.

Reviewed-by: Steven Price <steven.price@arm.com>

> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Fixes: 9ccdac7aa822 ("drm/panfrost: Add fdinfo support for memory stats")
> Reported-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 0cf64456e29a..d47b40b82b0b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -200,7 +200,7 @@ static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_object *obj
>  	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
>  	enum drm_gem_object_status res = 0;
>  
> -	if (bo->base.pages)
> +	if (bo->base.base.import_attach || bo->base.pages)
>  		res |= DRM_GEM_OBJECT_RESIDENT;
>  
>  	if (bo->base.madv == PANFROST_MADV_DONTNEED)

