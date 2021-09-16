Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6CF40E1C3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 19:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD606EBA6;
	Thu, 16 Sep 2021 17:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1116EBA6;
 Thu, 16 Sep 2021 17:07:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="202771699"
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; d="scan'208";a="202771699"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 10:07:57 -0700
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; d="scan'208";a="610718577"
Received: from mkrygin-mobl1.ccr.corp.intel.com (HELO [10.249.254.218])
 ([10.249.254.218])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 10:07:53 -0700
Message-ID: <54f6ab70d568dc33214c07c9ad9fc7d5952132e8.camel@linux.intel.com>
Subject: Re: [PATCH 5/5] drm/i915: Take pinning into account in
 __i915_gem_object_is_lmem
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: john.c.harrison@intel.com
Date: Thu, 16 Sep 2021 19:07:50 +0200
In-Reply-To: <20210916162819.27848-6-matthew.brost@intel.com>
References: <20210916162819.27848-1-matthew.brost@intel.com>
 <20210916162819.27848-6-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2021-09-16 at 09:28 -0700, Matthew Brost wrote:
> Don't blow up on a GEM_WARN_ON in __i915_gem_object_is_lmem if the
> object is pinned (not evictable).
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_lmem.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> index 034226c5d4d0..d659239fcbcc 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> @@ -56,8 +56,8 @@ bool i915_gem_object_is_lmem(struct
> drm_i915_gem_object *obj)
>   * @obj: The object to check.
>   *
>   * This function is intended to be called from within the fence
> signaling
> - * path where the fence keeps the object from being migrated. For
> example
> - * during gpu reset or similar.
> + * path where the fence, or a pin, keeps the object from being
> migrated. For
> + * example during gpu reset or similar.
>   *
>   * Return: Whether the object is resident in lmem.
>   */
> @@ -66,7 +66,8 @@ bool __i915_gem_object_is_lmem(struct
> drm_i915_gem_object *obj)
>         struct intel_memory_region *mr = READ_ONCE(obj->mm.region);
>  
>  #ifdef CONFIG_LOCKDEP
> -       GEM_WARN_ON(dma_resv_test_signaled(obj->base.resv, true));
> +       GEM_WARN_ON(dma_resv_test_signaled(obj->base.resv, true) &&
> +                   !i915_gem_object_evictable(obj));
>  #endif
>         return mr && (mr->type == INTEL_MEMORY_LOCAL ||
>                       mr->type == INTEL_MEMORY_STOLEN_LOCAL);


