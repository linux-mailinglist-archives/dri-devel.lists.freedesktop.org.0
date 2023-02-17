Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5062269AFA1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 16:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D1010E110;
	Fri, 17 Feb 2023 15:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A9E10E110;
 Fri, 17 Feb 2023 15:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676648294; x=1708184294;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=X26e8b0g6ZPM1b6qRKKlWoMgyn99l7tXNd6l77XcLs4=;
 b=O10YU4yrj6eyYgHVXTVW3cY2ZrRUIjZ+Zy5AwVOZaC7iFT74+Z9GkHMd
 Vg/SpYAP0C8ywZcMIl7m9gW7+4yTfkdWcjr/ctQtVBBOGEjIKmRbC90GD
 XAaRbgEIM9ZEzIbvnh6XK0n7zPKvmUsg504DOZnROCLvuJfO2sOQgLMlh
 2M/US1qKJMNmapoIQGEMPaS8XY5LbeSehzX60wkmN2+jKqEka0rvTR8qY
 o4ISpXMikDpPWt0ApbVOpCwh8dG4q8lCEWEsm7QZYk75KV6dBusaF930b
 dQYaVhaUp9cDA79Hmn/1yWl9ZSn2Cj3Ld/NvNgmS8qWSPq4Pvja7V1eyP g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="394486582"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="394486582"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 07:38:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="734350979"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="734350979"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.3.117])
 ([10.213.3.117])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 07:38:09 -0800
Message-ID: <c830e0c7-a483-aaf6-cd46-e26c8c414b6b@intel.com>
Date: Fri, 17 Feb 2023 16:38:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: avoid FIELD_PREP warning
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20230217124724.1324126-1-arnd@kernel.org>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230217124724.1324126-1-arnd@kernel.org>
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
Cc: intel-gfx@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.02.2023 13:46, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> With gcc-7 and earlier, there are lots of warnings like
> 
> In file included from <command-line>:0:0:
> In function '__guc_context_policy_add_priority.isra.66',
>      inlined from '__guc_context_set_prio.isra.67' at drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:3292:3,
>      inlined from 'guc_context_set_prio' at drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:3320:2:
> include/linux/compiler_types.h:399:38: error: call to '__compiletime_assert_631' declared with attribute error: FIELD_PREP: mask is not constant
>    _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                        ^
> ...
> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2422:3: note: in expansion of macro 'FIELD_PREP'
>     FIELD_PREP(GUC_KLV_0_KEY, GUC_CONTEXT_POLICIES_KLV_ID_##id) | \
>     ^~~~~~~~~~
> 
> Make sure that GUC_KLV_0_KEY is an unsigned value to avoid the warning.

Does it mean __builtin_constant_p in gcc7 returns 0 on signed constants?
I guess there should be more similar errors.

Regards
Andrzej


> 
> Fixes: 77b6f79df66e ("drm/i915/guc: Update to GuC version 69.0.3")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> index 58012edd4eb0..4f4f53c42a9c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> @@ -29,9 +29,9 @@
>    */
>   
>   #define GUC_KLV_LEN_MIN				1u
> -#define GUC_KLV_0_KEY				(0xffff << 16)
> -#define GUC_KLV_0_LEN				(0xffff << 0)
> -#define GUC_KLV_n_VALUE				(0xffffffff << 0)
> +#define GUC_KLV_0_KEY				(0xffffu << 16)
> +#define GUC_KLV_0_LEN				(0xffffu << 0)
> +#define GUC_KLV_n_VALUE				(0xffffffffu << 0)
>   
>   /**
>    * DOC: GuC Self Config KLVs

