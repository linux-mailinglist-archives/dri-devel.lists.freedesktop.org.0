Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4469A42A9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 17:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B9C10E0E1;
	Fri, 18 Oct 2024 15:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QPkph3RR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5B210E0E1;
 Fri, 18 Oct 2024 15:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uAKgg0PK3Ns1x2j047c/B6AdWZAjNNefT0K3xPP74cw=; b=QPkph3RRLqyDXrExJ2lSKpUEvE
 rogiffyMTz+OK4bPc2OtBBLfWegHAJ+uSD7QoDsPizthMzgSTIeqWivBZlRug9GYov5Zsb37lgXIE
 pC1ioyo9emSBwDHbFYOHPdioYM6ykp2QfMuEOx2sInmVdpyNz04SE6WFsUhozXU0FfRL11c5HGfJP
 HyZoJn6UEXw+kFJB9f3AKqLh5ztPPHR+ozktDvkW2mk5wWpW9r2Kvp/KvKC881m+OkUzXKhocog/W
 K+yINRF7SLGSZeXNAe1ol0w6I3vYloujWg6jx68j5wTQvNA1z9Wz5EU8u5SnWhOXCwoEqSKYHZ+Y7
 p5S2zZHg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t1p4v-00C8S4-Sz; Fri, 18 Oct 2024 17:39:49 +0200
Message-ID: <4d281aa4-1271-40bb-aa11-adc68b588a55@igalia.com>
Date: Fri, 18 Oct 2024 16:39:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] drm/amdgpu: make drm-memory-* report resident
 memory
To: Yunxiang Li <Yunxiang.Li@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alexander.Deucher@amd.com, christian.koenig@amd.com
References: <20241018133308.889-1-Yunxiang.Li@amd.com>
 <20241018133308.889-3-Yunxiang.Li@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20241018133308.889-3-Yunxiang.Li@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 18/10/2024 14:33, Yunxiang Li wrote:
> The old behavior reports the resident memory usage for this key and the
> documentation say so as well. However this was accidentally changed to
> include buffers that was evicted.
> 
> Fixes: a2529f67e2ed ("drm/amdgpu: Use drm_print_memory_stats helper from fdinfo")
> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c | 7 ++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 1 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h | 1 -
>   3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> index 00a4ab082459f..8281dd45faaa0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> @@ -33,6 +33,7 @@
>   #include <drm/amdgpu_drm.h>
>   #include <drm/drm_debugfs.h>
>   #include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
>   
>   #include "amdgpu.h"
>   #include "amdgpu_vm.h"
> @@ -95,11 +96,11 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   
>   	/* Legacy amdgpu keys, alias to drm-resident-memory-: */
>   	drm_printf(p, "drm-memory-vram:\t%llu KiB\n",
> -		   stats[TTM_PL_VRAM].total/1024UL);
> +		   stats[TTM_PL_VRAM].drm.resident/1024UL);
>   	drm_printf(p, "drm-memory-gtt: \t%llu KiB\n",
> -		   stats[TTM_PL_TT].total/1024UL);
> +		   stats[TTM_PL_TT].drm.resident/1024UL);
>   	drm_printf(p, "drm-memory-cpu: \t%llu KiB\n",
> -		   stats[TTM_PL_SYSTEM].total/1024UL);
> +		   stats[TTM_PL_SYSTEM].drm.resident/1024UL);
>   
>   	/* Amdgpu specific memory accounting keys: */
>   	drm_printf(p, "amd-memory-visible-vram:\t%llu KiB\n",
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 045222b6bd049..2a53e72f3964f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1223,7 +1223,6 @@ void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
>   
>   	/* DRM stats common fields: */
>   
> -	stats[type].total += size;
>   	if (drm_gem_object_is_shared_for_memory_stats(obj))
>   		stats[type].drm.shared += size;
>   	else
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> index 7260349917ef0..a5653f474f85c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -142,7 +142,6 @@ struct amdgpu_bo_vm {
>   struct amdgpu_mem_stats {
>   	struct drm_memory_stats drm;
>   
> -	uint64_t total;
>   	uint64_t visible;
>   	uint64_t evicted;
>   	uint64_t evicted_visible;

LGTM, thanks for fixing it!

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko
