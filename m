Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 613FA401B0D
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 14:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC67A89998;
	Mon,  6 Sep 2021 12:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315DD8997E;
 Mon,  6 Sep 2021 12:19:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10098"; a="207180002"
X-IronPort-AV: E=Sophos;i="5.85,272,1624345200"; d="scan'208";a="207180002"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 05:19:41 -0700
X-IronPort-AV: E=Sophos;i="5.85,272,1624345200"; d="scan'208";a="691649845"
Received: from ljdobbs-mobl1.ger.corp.intel.com (HELO [10.213.197.10])
 ([10.213.197.10])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 05:19:40 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: fixup igt_shrink_thp
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210906091729.2093312-1-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <60a47a43-2443-1077-1510-34644c09d93b@linux.intel.com>
Date: Mon, 6 Sep 2021 13:19:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210906091729.2093312-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


On 06/09/2021 10:17, Matthew Auld wrote:
> Since the object might still be active here, the shrink_all will simply
> ignore it, which blows up in the test, since the pages will still be
> there. Currently THP is disabled which should result in the test being
> skipped, but if we ever re-enable THP we might start seeing the failure.
> Fix this by forcing I915_SHRINK_ACTIVE.
> 
> v2: Some machine in the shard runs doesn't seem to have any available
> swap when running this test. Try to handle this.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com> #v1
> ---
>   .../gpu/drm/i915/gem/selftests/huge_pages.c   | 31 ++++++++++++++-----
>   1 file changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> index a094f3ce1a90..46ea1997c114 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> @@ -1519,6 +1519,7 @@ static int igt_shrink_thp(void *arg)
>   	struct i915_vma *vma;
>   	unsigned int flags = PIN_USER;
>   	unsigned int n;
> +	bool should_swap;
>   	int err = 0;
>   
>   	/*
> @@ -1567,23 +1568,39 @@ static int igt_shrink_thp(void *arg)
>   			break;
>   	}
>   	i915_gem_context_unlock_engines(ctx);
> +	/*
> +	 * Nuke everything *before* we unpin the pages so we can be reasonably
> +	 * sure that when later checking get_nr_swap_pages() that some random
> +	 * leftover object doesn't steal the remaining swap space.
> +	 */
> +	i915_gem_shrink(NULL, i915, -1UL, NULL,
> +			I915_SHRINK_BOUND |
> +			I915_SHRINK_UNBOUND |
> +			I915_SHRINK_ACTIVE);
>   	i915_vma_unpin(vma);
>   	if (err)
>   		goto out_put;
>   
> +
>   	/*
> -	 * Now that the pages are *unpinned* shrink-all should invoke
> -	 * shmem to truncate our pages.
> +	 * Now that the pages are *unpinned* shrinking should invoke
> +	 * shmem to truncate our pages, if we have available swap.
>   	 */
> -	i915_gem_shrink_all(i915);
> -	if (i915_gem_object_has_pages(obj)) {
> -		pr_err("shrink-all didn't truncate the pages\n");
> +	should_swap = get_nr_swap_pages() > 0;
> +	i915_gem_shrink(NULL, i915, -1UL, NULL,
> +			I915_SHRINK_BOUND |
> +			I915_SHRINK_UNBOUND |
> +			I915_SHRINK_ACTIVE);
> +	if (should_swap == i915_gem_object_has_pages(obj)) {

Hmm is there any value running the test if no swap (given objects used 
by the test are "willneed"), or you could simplify and just do early skip?

Regards,

Tvrtko

> +		pr_err("unexpected pages mismatch, should_swap=%s\n",
> +		       yesno(should_swap));
>   		err = -EINVAL;
>   		goto out_put;
>   	}
>   
> -	if (obj->mm.page_sizes.sg || obj->mm.page_sizes.phys) {
> -		pr_err("residual page-size bits left\n");
> +	if (should_swap == (obj->mm.page_sizes.sg || obj->mm.page_sizes.phys)) {
> +		pr_err("unexpected residual page-size bits, should_swap=%s\n",
> +		       yesno(should_swap));
>   		err = -EINVAL;
>   		goto out_put;
>   	}
> 
