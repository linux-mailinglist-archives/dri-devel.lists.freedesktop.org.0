Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE16724E59
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B10310E3C6;
	Tue,  6 Jun 2023 20:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814D810E3C6;
 Tue,  6 Jun 2023 20:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686084972; x=1717620972;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KYUOnIJQnuEKIr0g00zoHbgpkceEv3o2sCZTrc1FSv4=;
 b=CE6u3UzQnOa4xqs+1/4I3FZ8J8lKDdEx//KRp6NlRYEJ8vD70J3Yphsj
 zoBHeo8WwiXA9RH6DmgwJwp5/F/8PL4sVsQtDjGPeAunwmkRYMmI6Vg45
 1mpFvwjN/kGIr6FhGyEAVRzDrMM0iGk+2PAOPBe6hqppWRk62Ul5mMm3f
 gQJqWkH9p2eHpuqmOMU9tdzs5+dyyGbZtQY56X7h8YMOLIM7eTihZcRyq
 Iu4DsrO7yHgRJxciRfqMm305N2zqDufZ4bUO9j8TX+OapMamVmY4/mdWA
 c6XOOajaU999xdRKzGQ98wCDaDasEUT7ED5fPuWcikopT9KcGzfi28HL3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="359261867"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="359261867"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 13:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="712339641"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="712339641"
Received: from yuguen-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.252.57.68])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 13:56:08 -0700
Date: Tue, 6 Jun 2023 22:56:02 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v2] drm/i915: Fix a VMA UAF for multi-gt platform
Message-ID: <ZH+dYpOpl5/11Eg4@ashyti-mobl2.lan>
References: <20230606202755.8719-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230606202755.8719-1-nirmoy.das@intel.com>
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
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Tue, Jun 06, 2023 at 10:27:55PM +0200, Nirmoy Das wrote:
> Ensure correct handling of closed VMAs on multi-gt platforms to prevent
> Use-After-Free. Currently, when GT0 goes idle, closed VMAs that are
> exclusively added to GT0's closed_vma link (gt->closed_vma) and
> subsequently freed by i915_vma_parked(), which assumes the entire GPU is
> idle. However, on platforms with multiple GTs, such as MTL, GT1 may
> remain active while GT0 is idle. This causes GT0 to mistakenly consider
> the closed VMAs in its closed_vma list as unnecessary, potentially
> leading to Use-After-Free issues if a job for GT1 attempts to access a
> freed VMA.
> 
> Although we do take a wakeref for GT0 but it happens later, after
> evaluating VMAs. To mitigate this, it is necessary to hold a GT0 wakeref
> early.
> 
> v2: Use gt id to detect multi-tile(Andi)
>     Fix the incorrect error path.
> 
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
> Tested-by: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

I wonder if we need any Fixes tag here, maybe this:

Fixes: d93939730347 ("drm/i915: Remove the vma refcount")

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 3aeede6aee4d..c2a67435acfa 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -2683,6 +2683,7 @@ static int
>  eb_select_engine(struct i915_execbuffer *eb)
>  {
>  	struct intel_context *ce, *child;
> +	struct intel_gt *gt;
>  	unsigned int idx;
>  	int err;
>  
> @@ -2706,10 +2707,16 @@ eb_select_engine(struct i915_execbuffer *eb)
>  		}
>  	}
>  	eb->num_batches = ce->parallel.number_children + 1;
> +	gt = ce->engine->gt;
>  
>  	for_each_child(ce, child)
>  		intel_context_get(child);
>  	intel_gt_pm_get(ce->engine->gt);
> +	/* Keep GT0 active on MTL so that i915_vma_parked() doesn't
> +	 * free VMAs while execbuf ioctl is validating VMAs.
> +	 */
> +	if (gt->info.id)
> +		intel_gt_pm_get(to_gt(gt->i915));
>  
>  	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
>  		err = intel_context_alloc_state(ce);
> @@ -2748,6 +2755,9 @@ eb_select_engine(struct i915_execbuffer *eb)
>  	return err;
>  
>  err:
> +	if (gt->info.id)
> +		intel_gt_pm_put(to_gt(gt->i915));
> +
>  	intel_gt_pm_put(ce->engine->gt);
>  	for_each_child(ce, child)
>  		intel_context_put(child);
> @@ -2761,6 +2771,8 @@ eb_put_engine(struct i915_execbuffer *eb)
>  	struct intel_context *child;
>  
>  	i915_vm_put(eb->context->vm);
> +	if (eb->gt->info.id)
> +		intel_gt_pm_put(to_gt(eb->gt->i915));
>  	intel_gt_pm_put(eb->gt);

I would add a comment up here, just not to scare people when they
see this.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi

>  	for_each_child(eb->context, child)
>  		intel_context_put(child);
> -- 
> 2.39.0
