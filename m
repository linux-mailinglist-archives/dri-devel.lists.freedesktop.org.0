Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E211335F6FB
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 17:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663F36E923;
	Wed, 14 Apr 2021 15:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526826E922;
 Wed, 14 Apr 2021 15:09:03 +0000 (UTC)
IronPort-SDR: bWn26HcKWwcrKFW6KbGUcqPXKYMBaEiZq20E+RMXxeyI82OaacxRTmom12q4/8pO9ieAheBnfY
 61LRB9AcMgaw==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="191471952"
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; d="scan'208";a="191471952"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 08:06:24 -0700
IronPort-SDR: 6EB5k3Ux2Jd8ACK6Ehb0tZbjVLUNc6Ys9QccufD6NjMrZ8DlCG9qWIMuBgsO8l6nw50Zoa3BHU
 Uc7N4nHIQz5g==
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; d="scan'208";a="418355952"
Received: from bdebhal-mobl.ger.corp.intel.com (HELO [10.213.205.119])
 ([10.213.205.119])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 08:06:23 -0700
Subject: Re: [Intel-gfx] [PATCH 04/19] drm/i915/stolen: treat stolen local as
 normal local memory
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210412090526.30547-1-matthew.auld@intel.com>
 <20210412090526.30547-5-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <16d84f35-5950-cadb-aed0-85af28a51037@linux.intel.com>
Date: Wed, 14 Apr 2021 16:06:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210412090526.30547-5-matthew.auld@intel.com>
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/04/2021 10:05, Matthew Auld wrote:
> Underneath it's the same stuff, so things like the PTE_LM bits for the
> GTT should just keep working as-is.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_lmem.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> index ce1c83c13d05..017db8f71130 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> @@ -19,7 +19,10 @@ const struct drm_i915_gem_object_ops i915_gem_lmem_obj_ops = {
>   
>   bool i915_gem_object_is_lmem(struct drm_i915_gem_object *obj)
>   {
> -	return obj->ops == &i915_gem_lmem_obj_ops;
> +	struct intel_memory_region *mr = obj->mm.region;
> +
> +	return mr && (mr->type == INTEL_MEMORY_LOCAL ||
> +		      mr->type == INTEL_MEMORY_STOLEN_LOCAL);
>   }
>   
>   struct drm_i915_gem_object *
> 

Passable I guess. Although there is also i915_gem_object_is_stolen so it 
is not immediately clear what are the semantics of 
i915_gem_object_is_lmem vs that one. Almost like we need more 
"hierarchy" in region types, or flags of some sort, but I haven't looked 
at the callers to have a good idea what would work best.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
