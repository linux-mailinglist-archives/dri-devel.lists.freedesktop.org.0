Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDF669CB6A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 13:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB04610E678;
	Mon, 20 Feb 2023 12:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC03010E675;
 Mon, 20 Feb 2023 12:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676897497; x=1708433497;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=967pb3bxs0YkCizJHi05UwZ2dIQOSUkl3uF0lxY+PxU=;
 b=iKbiTlSAaSxHZlQZ1BqfvJ1FeJM+uAVm3Dh6Opawy9CPhg06gwuQInU5
 Ui2gK5h5wnUXz+0TinOUhy2Ay0MK4dJ/n0BIHzD+KGUy108frg1s/1Hvy
 XwAACOoKTwXQuzRmgM4jj1L94uDsv7BwX/eOTCK8unD+oPBclKvObw+ZO
 qhJT5Zqr7HO7werk0sJDapUjuvhMMMIxV1610tph5C47wh0wsu+BZ/GfP
 p40QR3ps81aa882Q+AkhE7LO2e84e6/IoUc4NXROddN5k9cL44WaRUIbI
 adkW12VKDTBXCdx/h9DiItS3dPInBCfgzsM5IgUC2ExvbWEUB7DYF+RQV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="334592884"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; d="scan'208";a="334592884"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 04:51:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="845314765"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; d="scan'208";a="845314765"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga005.jf.intel.com with ESMTP; 20 Feb 2023 04:51:34 -0800
Received: from [10.249.130.22] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.130.22])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 133D837E14;
 Mon, 20 Feb 2023 12:51:32 +0000 (GMT)
Message-ID: <540d63d2-88ca-9d46-ffe6-4436026d0107@intel.com>
Date: Mon, 20 Feb 2023 13:51:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/i915/guc: avoid FIELD_PREP warning
To: Arnd Bergmann <arnd@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
References: <20230217124724.1324126-1-arnd@kernel.org>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230217124724.1324126-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.02.2023 13:46, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> With gcc-7 and earlier, there are lots of warnings like
> 
> In file included from <command-line>:0:0:
> In function '__guc_context_policy_add_priority.isra.66',
>     inlined from '__guc_context_set_prio.isra.67' at drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:3292:3,
>     inlined from 'guc_context_set_prio' at drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:3320:2:
> include/linux/compiler_types.h:399:38: error: call to '__compiletime_assert_631' declared with attribute error: FIELD_PREP: mask is not constant
>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                       ^
> ...
> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2422:3: note: in expansion of macro 'FIELD_PREP'
>    FIELD_PREP(GUC_KLV_0_KEY, GUC_CONTEXT_POLICIES_KLV_ID_##id) | \
>    ^~~~~~~~~~
> 
> Make sure that GUC_KLV_0_KEY is an unsigned value to avoid the warning.
> 
> Fixes: 77b6f79df66e ("drm/i915/guc: Update to GuC version 69.0.3")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> index 58012edd4eb0..4f4f53c42a9c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> @@ -29,9 +29,9 @@
>   */
>  
>  #define GUC_KLV_LEN_MIN				1u
> -#define GUC_KLV_0_KEY				(0xffff << 16)
> -#define GUC_KLV_0_LEN				(0xffff << 0)
> -#define GUC_KLV_n_VALUE				(0xffffffff << 0)
> +#define GUC_KLV_0_KEY				(0xffffu << 16)
> +#define GUC_KLV_0_LEN				(0xffffu << 0)
> +#define GUC_KLV_n_VALUE				(0xffffffffu << 0)
>  
>  /**
>   * DOC: GuC Self Config KLVs
