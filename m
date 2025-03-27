Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBD5A72F54
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 12:30:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FEB10E8AD;
	Thu, 27 Mar 2025 11:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9JjrSIv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C154110E8AD
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 11:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743075037; x=1774611037;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Qc/3JRNQJZPBUGMXBMeweJVuwNQCbZyCZGpCnOH/KwQ=;
 b=V9JjrSIvHk8dSSsfVEdRp0yL2klzr13x/XtYt8Hh7s+QW7uOUI3WjAiF
 LLX+As+B7LLpyap/3QLlxtrxQ4IHs2Qmz48+UGHGnqVtB5g8T1qmguohI
 cZdm1hrKA+UZGporcskSWFwT+iZUrkVxlXexy2i0TPkpusTIbDZIuVohb
 jx0SV37hGk6kA8HmghgK0TBzV8wVkiCnzum63291iWjYH1XCVOGo8OIqN
 NS04njmYOsRehL5dfI92nfjx3HC6GIEXuMpw4/GMwWgAj5k6OJ4Uo1Qqp
 ELy51bjccvKSc1XhI/MZHuTKCMq2ihUytnFBvtvk4VH6WTCZy1Q5u5u83 Q==;
X-CSE-ConnectionGUID: DzNwu7hkTfSAVUP0KCuL2g==
X-CSE-MsgGUID: ra/OOfaMTpKdOT9j33VsrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44319496"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="44319496"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 04:30:37 -0700
X-CSE-ConnectionGUID: GPi8BeiwRza7ifQ7HSdZ4g==
X-CSE-MsgGUID: N1Pn7sK6SHmb15gV7Wys2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="125326710"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 04:30:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Jacek Lawrynowicz
 <jacek.lawrynowicz@linux.intel.com>, Maciej Falkowski
 <maciej.falkowski@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 1/3] accel/ivpu: pages_use_count is now a refcount_t
In-Reply-To: <20250327104300.1982058-1-boris.brezillon@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250327104300.1982058-1-boris.brezillon@collabora.com>
Date: Thu, 27 Mar 2025 13:30:30 +0200
Message-ID: <878qoq678p.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 27 Mar 2025, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> Commit 051b6646d36d ("drm/shmem-helper: Use refcount_t for
> pages_use_count") changed the type of
> drm_gem_shmem_object::pages_use_count but accel drivers were left
> behind.
>
> Fixes: 051b6646d36d ("drm/shmem-helper: Use refcount_t for pages_use_count")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Cc: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: dri-devel@lists.freedesktop.org

Just for build, on the series,

Tested-by: Jani Nikula <jani.nikula@intel.com>

Please merge.

> ---
>  drivers/accel/ivpu/ivpu_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index 8741c73b92ce..09c9c5256af5 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -282,7 +282,7 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
>  	ivpu_bo_unbind_locked(bo);
>  	mutex_destroy(&bo->lock);
>  
> -	drm_WARN_ON(obj->dev, bo->base.pages_use_count > 1);
> +	drm_WARN_ON(obj->dev, refcount_read(&bo->base.pages_use_count) > 1);
>  	drm_gem_shmem_free(&bo->base);
>  }

-- 
Jani Nikula, Intel
