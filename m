Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF0041433C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 10:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57DC6EAC6;
	Wed, 22 Sep 2021 08:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1406EAC0;
 Wed, 22 Sep 2021 08:08:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="245981120"
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="245981120"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 01:08:29 -0700
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="512874257"
Received: from bbrowne-mobl.ger.corp.intel.com (HELO [10.213.200.151])
 ([10.213.200.151])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 01:08:28 -0700
Subject: Re: [PATCH] drm/i915/selftests: exercise shmem_writeback with THP
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20210921142116.3807946-1-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <f7f428ce-5b54-f8fc-1d93-968a94c57131@linux.intel.com>
Date: Wed, 22 Sep 2021 09:08:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921142116.3807946-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


On 21/09/2021 15:21, Matthew Auld wrote:
> In commit:
> 
> commit 1e6decf30af5c5c75445ed6ad4e65a26de578a03
> Author: Hugh Dickins <hughd@google.com>
> Date:   Thu Sep 2 14:54:43 2021 -0700
> 
>      shmem: shmem_writepage() split unlikely i915 THP
> 
> it looks THP + shmem_writeback was an unexpected combination, and ends up
> hitting some BUG_ON, but it also looks like that is now fixed.
> 
> While the IGTs did eventually hit this(although not during pre-merge it
> seems), it's likely worthwhile adding some explicit coverage for this
> scenario in the shrink_thp selftest.
> 
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/4166
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> index 0827634c842c..8260a533d43f 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> @@ -1589,7 +1589,8 @@ static int igt_shrink_thp(void *arg)
>   	i915_gem_shrink(NULL, i915, -1UL, NULL,
>   			I915_SHRINK_BOUND |
>   			I915_SHRINK_UNBOUND |
> -			I915_SHRINK_ACTIVE);
> +			I915_SHRINK_ACTIVE |
> +			I915_SHRINK_WRITEBACK);
>   	if (should_swap == i915_gem_object_has_pages(obj)) {
>   		pr_err("unexpected pages mismatch, should_swap=%s\n",
>   		       yesno(should_swap));
> 

Good idea I think.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
