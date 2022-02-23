Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9244C14C2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 14:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6319610F192;
	Wed, 23 Feb 2022 13:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C898010F1B3;
 Wed, 23 Feb 2022 09:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645606933; x=1677142933;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LLvpCq+7fG3J9AGNKvPE4VAWP+l26vU4J7ZZXgjEz4U=;
 b=W/pYoADEVPgl5vMnIT5+kn3ciYmpGgIy2wRsSFA9IKP0lDfHj9PHbJIg
 nWX7TVkGdRSRV2mWahd1YDWggTvzYeATGXzHznHu4YIRrTaJFOzh1Lbdm
 abKscLVup+QOflJ/Rd+VKRQfOZLXYNac9exOyDXHnFc5FpRY67eVyBK66
 IOVr4bbE6KPXbE6UhQIZAUVCbFeydlHfheLCCy91fhbaj4umtN58P/Lq2
 uqvGB3POqXJy+NqZw10CwXcaXO/SHOGsKHsDPgwAtuX0+jlUF/I+gKrfY
 qcl7hk23fVgW7rcSvz/0VwcfkjbYZgRpza4Yv4e0r3jNPAazM15Pqzz1S Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="315146388"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="315146388"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 01:02:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="532596779"
Received: from kmatamox-mobl.amr.corp.intel.com (HELO [10.252.63.194])
 ([10.252.63.194])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 01:02:10 -0800
Message-ID: <02d3850b-5481-d142-f1d4-b408ea2b2431@linux.intel.com>
Date: Wed, 23 Feb 2022 10:02:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 0/7] drm/i915: Use the memcpy_from_wc function
 from drm
Content-Language: en-US
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 23 Feb 2022 13:51:45 +0000
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
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>,
 michael.cheng@intel.com, Jani Nikula <jani.nikula@intel.com>,
 lucas.demarchi@intel.com, Chris Wilson <chris.p.wilson@intel.com>,
 siva.mullati@intel.com, David Airlie <airlied@linux.ie>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/02/2022 15:51, Balasubramani Vivekanandan wrote:
> drm_memcpy_from_wc() performs fast copy from WC memory type using
> non-temporal instructions. Now there are two similar implementations of
> this function. One exists in drm_cache.c as drm_memcpy_from_wc() and
> another implementation in i915/i915_memcpy.c as i915_memcpy_from_wc().
> drm_memcpy_from_wc() was the recent addition through the series
> https://patchwork.freedesktop.org/patch/436276/?series=90681&rev=6
>
> The goal of this patch series is to change all users of
> i915_memcpy_from_wc() to drm_memcpy_from_wc() and a have common
> implementation in drm and eventually remove the copy from i915.
>
> Another benefit of using memcpy functions from drm is that
> drm_memcpy_from_wc() is available for non-x86 architectures.
> i915_memcpy_from_wc() is implemented only for x86 and prevents building
> i915 for ARM64.
> drm_memcpy_from_wc() does fast copy using non-temporal instructions for
> x86 and for other architectures makes use of memcpy() family of
> functions as fallback.
>
> Another major difference is unlike i915_memcpy_from_wc(),
> drm_memcpy_from_wc() will not fail if the passed address argument is not
> alignment to be used with non-temporal load instructions or if the
> platform lacks support for those instructions (non-temporal load
> instructions are provided through SSE4.1 instruction set extension).
> Instead drm_memcpy_from_wc() continues with fallback functions to
> complete the copy.
> This relieves the caller from checking the return value of
> i915_memcpy_from_wc() and explicitly using a fallback.
>
> Follow up series will be created to remove the memcpy_from_wc functions
> from i915 once the dependency is completely removed.

Overall the series looks good to me but I think you can add another 
patch to remove

i915_memcpy_from_wc() as I don't see any other usages left after this series, may be I
am missing something?

Regards,
Nirmoy

>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>
> Balasubramani Vivekanandan (7):
>    drm: Relax alignment constraint for destination address
>    drm: Add drm_memcpy_from_wc() variant which accepts destination
>      address
>    drm/i915: use the memcpy_from_wc call from the drm
>    drm/i915/guc: use the memcpy_from_wc call from the drm
>    drm/i915/selftests: use the memcpy_from_wc call from the drm
>    drm/i915/gt: Avoid direct dereferencing of io memory
>    drm/i915: Avoid dereferencing io mapped memory
>
>   drivers/gpu/drm/drm_cache.c                   | 98 +++++++++++++++++--
>   drivers/gpu/drm/i915/gem/i915_gem_object.c    |  8 +-
>   drivers/gpu/drm/i915/gt/selftest_reset.c      | 21 ++--
>   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 11 ++-
>   drivers/gpu/drm/i915/i915_gpu_error.c         | 45 +++++----
>   .../drm/i915/selftests/intel_memory_region.c  |  8 +-
>   include/drm/drm_cache.h                       |  3 +
>   7 files changed, 148 insertions(+), 46 deletions(-)
>
