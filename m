Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4A443C86D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 13:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADA06E883;
	Wed, 27 Oct 2021 11:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3716E883;
 Wed, 27 Oct 2021 11:21:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="210219859"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="210219859"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 04:21:18 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="529590996"
Received: from djustese-mobl.ger.corp.intel.com (HELO [10.249.254.205])
 ([10.249.254.205])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 04:21:17 -0700
Message-ID: <46183835-ace2-90d1-dc06-72dd94edce3a@linux.intel.com>
Date: Wed, 27 Oct 2021 13:21:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/4] drm/i915/clflush: fixup handling of cache_dirty
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20211021114410.2437099-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211021114410.2437099-1-matthew.auld@intel.com>
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


On 10/21/21 13:44, Matthew Auld wrote:
> In theory if clflush_work_create() somehow fails here, and we don't yet
> have mm.pages populated then we end up resetting cache_dirty, which is
> likely wrong, since that will potentially skip the flush-on-acquire, if
> it was needed.
>
> It looks like intel_user_framebuffer_dirty() can arrive here before the
> pages are populated.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_clflush.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> index f0435c6feb68..d09365b5eb29 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> @@ -20,6 +20,7 @@ static void __do_clflush(struct drm_i915_gem_object *obj)
>   {
>   	GEM_BUG_ON(!i915_gem_object_has_pages(obj));
>   	drm_clflush_sg(obj->mm.pages);
> +	obj->cache_dirty = false;
>   

I think the guidelines are to avoid updating state in async work if at 
all possible, so we need to add this after __do_clflush() in the sync 
path and after dma_fence_work_commit() in the async path.

Will that work?

/Thomas


