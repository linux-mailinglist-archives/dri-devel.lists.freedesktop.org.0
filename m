Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EACA866CF1E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 19:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B5410E495;
	Mon, 16 Jan 2023 18:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBB710E494;
 Mon, 16 Jan 2023 18:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673894965; x=1705430965;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Za0FwJWioIncEGLZgDJ6uyI89SXz79vv+zYD1PVU62I=;
 b=DXrFVO9wAge/pN8XP1aMrRTbhxLVRIUMVL9RAqA381fMAqR+OBnYoCh/
 uWFcN/wHdrjsoxredcORxym7FHhPbFVZlC/14UYyvzU8vXTf/KkLriI9p
 7CoHuDm8C41NOxRZ6LT9R2BlEUuH2ziMbf0HzO6fZY2dYHlu1qTkVSgL7
 FXyga8fIpFUIar/Rc+IzEhvV/Uv8DfbrEHtgPwzGsBdVVEMwKAY4Siuld
 LhSQRQrRwhTiB5yb5YIeVTYOJl7/+YpBqQSU1hclDHPXal7bOQTpUNm2A
 YMvC1a8eySlkZoj9c5D4gMhtHxvDVfEGbPhGo25nIpcOAXd0vFiWnK158 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="312391889"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="312391889"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 10:49:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="767008144"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="767008144"
Received: from rhormila-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.251.222.100])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 10:49:21 -0800
Date: Mon, 16 Jan 2023 19:49:18 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Unwind hugepages to drop wakeref on
 error
Message-ID: <Y8WcLtKY3/cSMjgw@ashyti-mobl2.lan>
References: <20230113120053.29618-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113120053.29618-1-nirmoy.das@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, matthew.auld@intel.com, andi.shyti@linux.intel.com,
 chris.p.wilson@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Fri, Jan 13, 2023 at 01:00:53PM +0100, Nirmoy Das wrote:
> From: Chris Wilson <chris.p.wilson@linux.intel.com>
> 
> Make sure that upon error after we have acquired the wakeref we do
> release it again.
> 
> Fixes: 027c38b4121e ("drm/i915/selftests: Grab the runtime pm in shrink_thp")
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Cc: <stable@vger.kernel.org> # v6.0+
> ---
>  drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> index c281b0ec9e05..295d6f2cc4ff 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> @@ -1855,7 +1855,7 @@ static int igt_shrink_thp(void *arg)
>  			I915_SHRINK_ACTIVE);
>  	i915_vma_unpin(vma);
>  	if (err)
> -		goto out_put;
> +		goto out_wf;
>  
>  	/*
>  	 * Now that the pages are *unpinned* shrinking should invoke
> @@ -1871,7 +1871,7 @@ static int igt_shrink_thp(void *arg)
>  		pr_err("unexpected pages mismatch, should_swap=%s\n",
>  		       str_yes_no(should_swap));
>  		err = -EINVAL;
> -		goto out_put;
> +		goto out_wf;
>  	}

aren't we missing here one out_put -> out_wf change?

This one:

@@ -1878,7 +1878,7 @@ static int igt_shrink_thp(void *arg)
                pr_err("unexpected residual page-size bits, should_swap=%s\n",
                       str_yes_no(should_swap));
                err = -EINVAL;
-               goto out_put;
+               goto out_wf;
        }
 
        err = i915_vma_pin(vma, 0, 0, flags);

Andi

>  
>  	if (should_swap == (obj->mm.page_sizes.sg || obj->mm.page_sizes.phys)) {
> @@ -1883,7 +1883,7 @@ static int igt_shrink_thp(void *arg)
>  
>  	err = i915_vma_pin(vma, 0, 0, flags);
>  	if (err)
> -		goto out_put;
> +		goto out_wf;
>  
>  	while (n--) {
>  		err = cpu_check(obj, n, 0xdeadbeaf);
> -- 
> 2.39.0
