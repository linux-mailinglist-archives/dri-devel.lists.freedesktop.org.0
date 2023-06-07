Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8997253FF
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 08:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FA010E045;
	Wed,  7 Jun 2023 06:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5732310E045;
 Wed,  7 Jun 2023 06:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686118843; x=1717654843;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Kd4uRcsZjvstQMt33Vg/cN3si8iQuCD7nl+C8ekCxR4=;
 b=Ms+zmvd+tFnY4oLhCtDqemKuXqJxUU2OmZSZrcH49frXd7y4hud7uHQv
 cO4OncCihKzG1o5wccR28z30ALLCDD1QNcWpIHWDgZpzlgCSG80lY6Xfc
 /UrE8kP5gxByKyXXU2PRAaFyR3/J37Po/LLyIL/1bvj/tx46abDeuVT3o
 d2tZ/I29B9cXvM0kpI/ZGcQOfm0Bgvo5+At188yLAiu/Arf/s0t9SV5aK
 jYFvWNs7I7N2FnLUJEh9497snsFctxs3RaGsVMg7rStC70QcxQSCmrQ6w
 yWr0Q3F0FSQJEKsdB2tL356/0peLuMNQcFQIvhmiwIX6UcZUda4nhttZE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="359366651"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="359366651"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 23:20:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="1039471107"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="1039471107"
Received: from lwisniew-mobl.ger.corp.intel.com (HELO [10.213.20.254])
 ([10.213.20.254])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 23:20:39 -0700
Message-ID: <f125ef17-631f-17db-7b8f-b6e6f0a75429@intel.com>
Date: Wed, 7 Jun 2023 08:20:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [PATCH v2] drm/i915: Fix a VMA UAF for multi-gt platform
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230606202755.8719-1-nirmoy.das@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230606202755.8719-1-nirmoy.das@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 06.06.2023 22:27, Nirmoy Das wrote:
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
>      Fix the incorrect error path.
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
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 3aeede6aee4d..c2a67435acfa 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -2683,6 +2683,7 @@ static int
>   eb_select_engine(struct i915_execbuffer *eb)
>   {
>   	struct intel_context *ce, *child;
> +	struct intel_gt *gt;
>   	unsigned int idx;
>   	int err;
>   
> @@ -2706,10 +2707,16 @@ eb_select_engine(struct i915_execbuffer *eb)
>   		}
>   	}
>   	eb->num_batches = ce->parallel.number_children + 1;
> +	gt = ce->engine->gt;
>   
>   	for_each_child(ce, child)
>   		intel_context_get(child);
>   	intel_gt_pm_get(ce->engine->gt);

intel_gt_pm_get(gt)


> +	/* Keep GT0 active on MTL so that i915_vma_parked() doesn't
> +	 * free VMAs while execbuf ioctl is validating VMAs.
> +	 */
> +	if (gt->info.id)
> +		intel_gt_pm_get(to_gt(gt->i915));
>   
>   	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
>   		err = intel_context_alloc_state(ce);
> @@ -2748,6 +2755,9 @@ eb_select_engine(struct i915_execbuffer *eb)
>   	return err;
>   
>   err:
> +	if (gt->info.id)
> +		intel_gt_pm_put(to_gt(gt->i915));
> +
>   	intel_gt_pm_put(ce->engine->gt);

intel_gt_pm_put(gt)


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>   	for_each_child(ce, child)
>   		intel_context_put(child);
> @@ -2761,6 +2771,8 @@ eb_put_engine(struct i915_execbuffer *eb)
>   	struct intel_context *child;
>   
>   	i915_vm_put(eb->context->vm);
> +	if (eb->gt->info.id)
> +		intel_gt_pm_put(to_gt(eb->gt->i915));
>   	intel_gt_pm_put(eb->gt);
>   	for_each_child(eb->context, child)
>   		intel_context_put(child);

