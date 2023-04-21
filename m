Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7CD6EA81B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 12:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2F210E0A4;
	Fri, 21 Apr 2023 10:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093EE10E04A;
 Fri, 21 Apr 2023 10:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682072249; x=1713608249;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ILNISb0swWY+HD27JowBpDMXpM0jD8AU38PbG66Diw0=;
 b=kq+XyUBmVS+xWrYF/ImGyiO7KXY3vnJm49Dco5en3urYo+fNHcJZ1WVj
 qcq//WCPYr8gSFOhWhQbYg9jlmRXQG9ughOOYl5PMDBVX8EMV5UFAuDbd
 GvI8BlYvecxBAB9yHTiLhwMZSs8XdrsnJnWR7T+JR5FwONLP0Pn9SDmRd
 GWA5vxfSPbtWyppqnqReXtVPhGOVex4dwbsVq7rQ5DsStaM5GGkAXAeiw
 cYvGgGsqnHMBpLARZnntLXe6a5/8IwrLxyktn10tAEhd16LqiNzsQ/Qw9
 +FJ+pEaE9QzW11Hd+ymKYH2GOA/9qhI4i8B0xRKzfKFHcgf/c/42/Vlii A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="408900668"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="408900668"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 03:17:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="685688556"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="685688556"
Received: from vhavelx-mobl2.ger.corp.intel.com (HELO [10.213.192.37])
 ([10.213.192.37])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 03:17:02 -0700
Message-ID: <705b5e5b-78cd-857f-ad26-80835217520c@linux.intel.com>
Date: Fri, 21 Apr 2023 11:17:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 7/8] drm/i915: use pat_index instead of
 cache_level
Content-Language: en-US
To: fei.yang@intel.com, intel-gfx@lists.freedesktop.org
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-8-fei.yang@intel.com>
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

>   
>   bool i915_gem_cpu_write_needs_clflush(struct drm_i915_gem_object *obj)
> @@ -267,7 +267,7 @@ int i915_gem_object_set_cache_level(struct drm_i915_gem_object *obj,
>   {
>   	int ret;
>   
> -	if (obj->cache_level == cache_level)
> +	if (i915_gem_object_has_cache_level(obj, cache_level))
>   		return 0;

When userspace calls i915_gem_set_caching_ioctl after having set the PAT index explicitly this will make it silently succeed regardless of the cache level passed in, no? Because of:

+bool i915_gem_object_has_cache_level(const struct drm_i915_gem_object *obj,
+				     enum i915_cache_level lvl)
+{
+	/*
+	 * cache_level == I915_CACHE_INVAL indicates the UMD's have set the
+	 * caching policy through pat_index, in which case the KMD should
+	 * leave the coherency to be managed by user space, simply return
+	 * true here.
+	 */
+	if (obj->cache_level == I915_CACHE_INVAL)
+		return true;

I think we need to let it know it is doing it wrong with an error.

Regards,

Tvrtko
