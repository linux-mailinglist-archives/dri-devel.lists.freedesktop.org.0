Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B10509AE6
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 10:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A2D10F936;
	Thu, 21 Apr 2022 08:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F050F10F931;
 Thu, 21 Apr 2022 08:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650530717; x=1682066717;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=84RrIJwOpucPZaDpJ7CGLbB2/XxD1WWME2UV1ZZ18/4=;
 b=dJj0dgwAD22TnV5x15MAavxVya7BUSH0ovXdj+2lxLLvB104mROWbggm
 s/NxfqGSOjkJhx+HU3q8c+Dg3gNQQhmzhj+YUT+V+zr6d8HuafQK3lKTf
 8cAZTqTYhUq03T7lA6NyDKnWPxt3ya0oQSUUG+ZkTa4Jo+WzWl1Uxk4tQ
 Zx0VB+b9ocvwASLRAg9cUCb2oPbvjcT4y9k5QOViRm4+mIhIxt4ryXC2+
 yykEpb1JRJp7HcdaumNQZPl9nGoLlQyfbpsnZ+fbcoH+ueTtcD3l1ywCK
 T4Yvjay/qR5daydTbXtBlcI8oRgNDH9tojGVROfTWhqrFxNyIua3Nw7i3 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="327187076"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="327187076"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 01:45:17 -0700
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="670252675"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by orsmga004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 01:45:15 -0700
Date: Thu, 21 Apr 2022 14:16:10 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [CI 4/4] drm/i915/selftests: tweak the misaligned_case
Message-ID: <20220421084609.GD18679@intel.com>
References: <20220420181613.70033-1-matthew.auld@intel.com>
 <20220420181613.70033-4-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220420181613.70033-4-matthew.auld@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-04-20 at 19:16:13 +0100, Matthew Auld wrote:
> The compact-pt layout restrictions should only apply to the ppGTT. Also
> make this play nice on platforms that only have the 64K GTT restriction,
> and not the compact-pt thing.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
> Cc: Ramalingam C <ramalingam.c@intel.com>
Looks good to me.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

> ---
>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> index bccc49a8ab5e..8633bec18fa7 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> @@ -1112,10 +1112,16 @@ static int misaligned_case(struct i915_address_space *vm, struct intel_memory_re
>  	expected_vma_size = round_up(size, 1 << (ffs(vma->resource->page_sizes_gtt) - 1));
>  	expected_node_size = expected_vma_size;
>  
> -	if (NEEDS_COMPACT_PT(vm->i915) && i915_gem_object_is_lmem(obj)) {
> -		/* compact-pt should expand lmem node to 2MB */
> +	if (HAS_64K_PAGES(vm->i915) && i915_gem_object_is_lmem(obj)) {
> +		/*
> +		 * The compact-pt should expand lmem node to 2MB for the ppGTT,
> +		 * for all other cases we should only expect 64K.
> +		 */
>  		expected_vma_size = round_up(size, I915_GTT_PAGE_SIZE_64K);
> -		expected_node_size = round_up(size, I915_GTT_PAGE_SIZE_2M);
> +		if (NEEDS_COMPACT_PT(vm->i915) && !i915_is_ggtt(vm))
> +			expected_node_size = round_up(size, I915_GTT_PAGE_SIZE_2M);
> +		else
> +			expected_node_size = round_up(size, I915_GTT_PAGE_SIZE_64K);
>  	}
>  
>  	if (vma->size != expected_vma_size || vma->node.size != expected_node_size) {
> -- 
> 2.34.1
> 
