Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 488856EA61F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 10:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEEF10E32D;
	Fri, 21 Apr 2023 08:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB1310E32D;
 Fri, 21 Apr 2023 08:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682066591; x=1713602591;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OzNzokxXk2uIXWHOejal7cK4aEA5gx/DTfkmP5gm95o=;
 b=EvxWNfxuAPAcWRScNbTiIsusNRAH8xg55SE+1T1IXCD0g85mUE2TgGtd
 ixJiqAPKNYOiflQBebEHOsRb5qrv4DdMAnxTt8KsSB/u97i56aw0cbmfw
 sdEo7ffRd52MtvG8wlHqfF/wfVf0iUicgZzwWiDO6muY/8rTb6POtyE6I
 Ktmt+UVZk73i1bVPVgKBiasV2RxT7BoQ5G/otB7TmvUE/W2Qf98cyWhzO
 b10zhhPA9DHkCaSNHeTEckotLGLOCrxFu5eX8iMk4zMukd9il6pgsH6Uj
 Xle8V7DT/vVVJIT2t90Sy4pJ+thsQCbwFZ2Sqkb67VtnGuJMH4IOFHRzD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="348741007"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="348741007"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 01:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="803659800"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="803659800"
Received: from vhavelx-mobl2.ger.corp.intel.com (HELO [10.213.192.37])
 ([10.213.192.37])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 01:43:08 -0700
Message-ID: <bb5ea77b-141b-56cf-2015-6c845c93248f@linux.intel.com>
Date: Fri, 21 Apr 2023 09:43:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 7/8] drm/i915: use pat_index instead of
 cache_level
To: fei.yang@intel.com, intel-gfx@lists.freedesktop.org
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-8-fei.yang@intel.com>
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230419230058.2659455-8-fei.yang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/04/2023 00:00, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Currently the KMD is using enum i915_cache_level to set caching policy for
> buffer objects. This is flaky because the PAT index which really controls
> the caching behavior in PTE has far more levels than what's defined in the
> enum. In addition, the PAT index is platform dependent, having to translate
> between i915_cache_level and PAT index is not reliable, and makes the code
> more complicated.
> 
>>From UMD's perspective there is also a necessity to set caching policy for
> performance fine tuning. It's much easier for the UMD to directly use PAT
> index because the behavior of each PAT index is clearly defined in Bspec.
> Having the abstracted i915_cache_level sitting in between would only cause
> more ambiguity.
> 
> For these reasons this patch replaces i915_cache_level with PAT index. Also
> note, the cache_level is not completely removed yet, because the KMD still
> has the need of creating buffer objects with simple cache settings such as
> cached, uncached, or writethrough. For such simple cases, using cache_level
> would help simplify the code.
> 
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

[snip]

> @@ -306,20 +304,13 @@ int i915_gem_get_caching_ioctl(struct drm_device *dev, void *data,
>   		goto out;
>   	}
>   
> -	switch (obj->cache_level) {
> -	case I915_CACHE_LLC:
> -	case I915_CACHE_L3_LLC:
> +	if (i915_gem_object_has_cache_level(obj, I915_CACHE_LLC) ||
> +	    i915_gem_object_has_cache_level(obj, I915_CACHE_L3_LLC))
>   		args->caching = I915_CACHING_CACHED;
> -		break;
> -
> -	case I915_CACHE_WT:
> +	else if (i915_gem_object_has_cache_level(obj, I915_CACHE_WT))
>   		args->caching = I915_CACHING_DISPLAY;
> -		break;
> -
> -	default:
> +	else
>   		args->caching = I915_CACHING_NONE;
> -		break;
> -	}
>   out:
>   	rcu_read_unlock();
>   	return err;

[snip]

> +bool i915_gem_object_has_cache_level(const struct drm_i915_gem_object *obj,
> +				     enum i915_cache_level lvl)
> +{
> +	/*
> +	 * cache_level == I915_CACHE_INVAL indicates the UMD's have set the
> +	 * caching policy through pat_index, in which case the KMD should
> +	 * leave the coherency to be managed by user space, simply return
> +	 * true here.
> +	 */
> +	if (obj->cache_level == I915_CACHE_INVAL)
> +		return true;
> +
> +	/*
> +	 * Otherwise the pat_index should have been converted from cache_level
> +	 * so that the following comparison is valid.
> +	 */
> +	return obj->pat_index == i915_gem_get_pat_index(obj_to_i915(obj), lvl);
> +}
> +

Isn't i915_gem_get_caching_ioctl always going to report 
I915_CACHING_CACHED if any PAT index has been set?

Not sure if that is okay or not, or if it only needs mentioning in the 
commit, I am still reading through it all.

Regards,

Tvrtko
