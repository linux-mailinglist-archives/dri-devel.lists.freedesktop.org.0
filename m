Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72837554CCD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D150112512;
	Wed, 22 Jun 2022 14:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBF6112421;
 Wed, 22 Jun 2022 14:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655907809; x=1687443809;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h8xhzYA9+h2CmjIZTJtikagEFDSumfTJ4HTfpvBZBkc=;
 b=kz1dkjUh+2Cgi4G2H1P7PG0qB0iY44hQNlBv7VhSTbszpGu5VQlfJ2AS
 0fzCUh6htJ7o/hvPR+rDARIpdlEjqB26gAaADruJbBJJdn3O0VAhlPVR+
 EgxWOo2xOOOnjY8pDxM7ql9W0jzng/WQSqi/8BtxY3NSZ7H0qLkcQYB4U
 PM1KLV+XWQ5QATC2gt6vaJh1Slt+0TkEmvUNvC10zfAN2nofBIzZ4KJjQ
 WUEEQSMo/HPVnUJpGywnxqM6XbT1AGf50/r2N1On8hWduSJwwjDX1ain+
 lqC5U73WmQxxuQT+smwoV35G/FinDouC2vcZ067XBNQdQ18XnhwC0oXz8 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="280475035"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="280475035"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 07:23:26 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="730368377"
Received: from gperry-mobl.ger.corp.intel.com (HELO [10.249.254.144])
 ([10.249.254.144])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 07:23:23 -0700
Message-ID: <a7cedbd6ca56034712768b37a169202e3912adeb.camel@linux.intel.com>
Subject: Re: [PATCH v2 09/12] drm/i915/selftests: ensure we reserve a fence
 slot
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Wed, 22 Jun 2022 16:23:21 +0200
In-Reply-To: <20220621104434.190962-10-matthew.auld@intel.com>
References: <20220621104434.190962-1-matthew.auld@intel.com>
 <20220621104434.190962-10-matthew.auld@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-5.fc34) 
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-06-21 at 11:44 +0100, Matthew Auld wrote:
> We should always be explicit and allocate a fence slot before adding
> a
> new fence.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> index 5bc93a1ce3e3..7c95b6768610 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> @@ -1221,8 +1221,10 @@ static int __igt_mmap_migrate(struct
> intel_memory_region **placements,
>                                           expand32(POISON_INUSE),
> &rq);
>         i915_gem_object_unpin_pages(obj);
>         if (rq) {
> -               dma_resv_add_fence(obj->base.resv, &rq->fence,
> -                                  DMA_RESV_USAGE_KERNEL);
> +               err = dma_resv_reserve_fences(obj->base.resv, 1);
> +               if (!err)
> +                       dma_resv_add_fence(obj->base.resv, &rq-
> >fence,
> +                                          DMA_RESV_USAGE_KERNEL);
>                 i915_request_put(rq);
>         }
>         i915_gem_object_unlock(obj);


