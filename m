Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB44A72E20
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 11:48:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CFD10E89F;
	Thu, 27 Mar 2025 10:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="UsFoh7Sb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964D310E89F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 10:48:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743072480; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GWn1Fp0B3qE6pqkQb014UeHC+jHIsCyPTwINQfNm6mnmU5J7RtyS7I4HN9G16O00UQURDhv8cDRJyVG0zqSSJUhi3HOnuISO7xdQLp5uHBBX9Rz6WCFyJkmMDTf72HDZPm9edHworNtFLhaoUT8rBrR//KyrMhnN0R6u+WNgHJA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743072480;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=rKxwQ+22FcQ6BKcswBCuTnkH+nug+Kl9H3+rd52sx+k=; 
 b=Ny02VaEBz+spKY6kCvprOQ4cmNFRT1lvfogcMvoyvJt2klcDx+q0INdG8ayCPKmDUb0/c3k5PafmBEzBcGY1LmqGV2eQTf+fS2AwmQgIRyo3H8UGJlv0aJAQf5LcSfNxlKvTs/VSifANObzWkVMAeNUzGZQeMmzjfPEtikOYuGg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743072480; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=rKxwQ+22FcQ6BKcswBCuTnkH+nug+Kl9H3+rd52sx+k=;
 b=UsFoh7Sbsp3174HvPQRMXLAkVQ0wYphuvJ8tv4ssUWrLL7plTFRAIJghkWA6it3H
 QrTtggkJX2Rmtu+mZCuptghAYE+6nYR8kI7dCK+0+QqA/ojyoIbpTRhklDUW3Wc7iL7
 S72TCmMlq3AnRYf+OjVg6iDrDXOj8rVS6jIu8sdQ=
Received: by mx.zohomail.com with SMTPS id 1743072478767291.3636419139931;
 Thu, 27 Mar 2025 03:47:58 -0700 (PDT)
Message-ID: <55a739b3-c73f-4073-81a9-7dddd7370bba@collabora.com>
Date: Thu, 27 Mar 2025 13:47:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] accel/ivpu:
 s/drm_gem_shmem_v[un]map/drm_gem_shmem_v[un]map_locked/
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel@collabora.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
References: <20250327104300.1982058-1-boris.brezillon@collabora.com>
 <20250327104300.1982058-2-boris.brezillon@collabora.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20250327104300.1982058-2-boris.brezillon@collabora.com>
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

On 3/27/25 13:42, Boris Brezillon wrote:
> Commit 954907f7147d ("drm/shmem-helper: Refactor locked/unlocked
> functions") suffixed drm_gem_shmem_v[un]map with _locked to reflect
> the fact these functions must be called with the GEM resv lock held,
> but accel drivers were left behind.
> 
> Fixes: 954907f7147d ("drm/shmem-helper: Refactor locked/unlocked functions")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Cc: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/accel/ivpu/ivpu_gem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index 09c9c5256af5..212d21ad2bbd 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -362,7 +362,7 @@ ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
>  
>  	if (flags & DRM_IVPU_BO_MAPPABLE) {
>  		dma_resv_lock(bo->base.base.resv, NULL);
> -		ret = drm_gem_shmem_vmap(&bo->base, &map);
> +		ret = drm_gem_shmem_vmap_locked(&bo->base, &map);
>  		dma_resv_unlock(bo->base.base.resv);
>  
>  		if (ret)
> @@ -387,7 +387,7 @@ void ivpu_bo_free(struct ivpu_bo *bo)
>  
>  	if (bo->flags & DRM_IVPU_BO_MAPPABLE) {
>  		dma_resv_lock(bo->base.base.resv, NULL);
> -		drm_gem_shmem_vunmap(&bo->base, &map);
> +		drm_gem_shmem_vunmap_locked(&bo->base, &map);
>  		dma_resv_unlock(bo->base.base.resv);
>  	}
>  

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
