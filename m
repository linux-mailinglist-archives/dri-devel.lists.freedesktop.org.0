Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39805447F90
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 13:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7056E120;
	Mon,  8 Nov 2021 12:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5746E06B;
 Mon,  8 Nov 2021 12:39:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10161"; a="318414808"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="318414808"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 04:39:22 -0800
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="587785607"
Received: from pmannion-mobl.ger.corp.intel.com (HELO [10.252.4.227])
 ([10.252.4.227])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 04:39:21 -0800
Message-ID: <7f53182e-71f9-f2d4-e744-75851707af67@intel.com>
Date: Mon, 8 Nov 2021 12:39:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] drm/i915/gem: Fix gem_madvise for ttm+shmem objects
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211108123637.929617-1-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211108123637.929617-1-thomas.hellstrom@linux.intel.com>
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

On 08/11/2021 12:36, Thomas Hellström wrote:
> Gem-TTM objects that are backed by shmem might have populated
> page-vectors without having the GEM pages set. Those objects
> aren't moved to the correct shrinker / purge list by gem_madvise.
> 
> For such objects, identified by having the
> _SELF_MANAGED_SHRINK_LIST set, make sure they end up on the
> correct list.
> 
> v2:
> - Revert a change that made swapped-out objects inaccessible for
>    truncating. (Matthew Auld)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/i915/i915_gem.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index d0e642c82064..527228d4da7e 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1005,7 +1005,8 @@ i915_gem_madvise_ioctl(struct drm_device *dev, void *data,
>   			obj->ops->adjust_lru(obj);
>   	}
>   
> -	if (i915_gem_object_has_pages(obj)) {
> +	if (i915_gem_object_has_pages(obj) ||
> +	    i915_gem_object_has_self_managed_shrink_list(obj)) {
>   		unsigned long flags;
>   
>   		spin_lock_irqsave(&i915->mm.obj_lock, flags);
> 
