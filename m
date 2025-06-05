Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 249D6ACEF89
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 14:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5D110E969;
	Thu,  5 Jun 2025 12:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KEXf3ZLq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C36E10E961
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 12:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749127856; x=1780663856;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uoNDoEBv6wIhnMNTyam9ugb9mMupLqQdWlZrz/S85J8=;
 b=KEXf3ZLqTE7dNTn+L7C+LP4zCd5oQRUN3XtzSXJvMrAkh9LjhQiGFrd7
 cuIeHMnoJwi6oE3W8Lgu+HS75RjIXyWTj4drvx4VAOq49Yr1P8uEzJ94o
 POiNiYc6aM1g6kIV7eaIIRK9Pq8xVFw07GVFRxY5a7oxTa744kXXUabaa
 RZ8FTELLNrGXyoKg/V5Rr6reS6hEjNeWsjGMgDWxTwBABRaqeBtDUSbF0
 Y3DLjGT3nZ42igX1htUqaiVgdVEOTpoggiYm5z26voAWIhFa1qgYGpKEw
 9kH01n7WKqY8vlkzJLSqZUVdaFrbBN86e0ruEHcRglEJ+pKZYi04J7Sbn g==;
X-CSE-ConnectionGUID: Yht6wjtTRTqv4jv/a3kt0g==
X-CSE-MsgGUID: a7xrSM+2Sra4OJwlvfuHGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61510932"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="61510932"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 05:50:56 -0700
X-CSE-ConnectionGUID: a627yGbOSj24PNiji6efKg==
X-CSE-MsgGUID: h4GpRwYJSQulwP8/qRPKJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="149342486"
Received: from unknown (HELO [10.217.160.151]) ([10.217.160.151])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 05:50:55 -0700
Message-ID: <04c421f0-5628-4eac-9bb7-46a18f2fefae@linux.intel.com>
Date: Thu, 5 Jun 2025 14:50:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Fix warning in ivpu_gem_bo_free()
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com, stable@vger.kernel.org
References: <20250528171220.513225-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250528171220.513225-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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

Applied to drm-misc-fixes

On 5/28/2025 7:12 PM, Jacek Lawrynowicz wrote:
> Don't WARN if imported buffers are in use in ivpu_gem_bo_free() as they
> can be indeed used in the original context/driver.
> 
> Fixes: 647371a6609d ("accel/ivpu: Add GEM buffer object management")
> Cc: stable@vger.kernel.org # v6.3
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
> v2: Use drm_gem_is_imported() to check if the buffer is imported.
> ---
>  drivers/accel/ivpu/ivpu_gem.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index c193a80241f5f..5ff0bac739fc9 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -278,7 +278,8 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
>  	list_del(&bo->bo_list_node);
>  	mutex_unlock(&vdev->bo_list_lock);
>  
> -	drm_WARN_ON(&vdev->drm, !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
> +	drm_WARN_ON(&vdev->drm, !drm_gem_is_imported(&bo->base.base) &&
> +		    !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
>  	drm_WARN_ON(&vdev->drm, ivpu_bo_size(bo) == 0);
>  	drm_WARN_ON(&vdev->drm, bo->base.vaddr);
>  

