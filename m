Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6893E671718
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 10:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1558510E238;
	Wed, 18 Jan 2023 09:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA65210E225;
 Wed, 18 Jan 2023 09:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674032852; x=1705568852;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DlLu1kd3RdoRwJ5tOhQx3lXAUHxd4RmhAiLGWWt9q9E=;
 b=TmollWwaMok2BqS5FY8LCf2/JEu15xznt0pKFohWcOrHCVdGJSxyPR4P
 K707pugIWfEmMkr0+5DyzpPBubr4PDPPAw9SRPSLT1WU++KsmrXI1jtPD
 HHjBqJSrpeO0++Y4Y6fIko06BJ1AFvmT3xfhZDpCs/IVnhYcjwi0ecfCU
 RTJplui3vrO37tMN34Bb6i5IbInrMDz2m4OPR1M2OZ3Y74LUAsb7q7y3e
 DSw7emlICCI3AnFx3HvEVLpSEn9tYEueSpctEXykRfbB78RdR4aJulcc6
 i+sRB15z9HvBu4GJZsh5lCAG24lJh0YUUab2wByvAGpGNXqNVo+HH39xT w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="387287298"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="387287298"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 01:07:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="767666271"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="767666271"
Received: from tpalli-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.54.209])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 01:07:27 -0800
Date: Wed, 18 Jan 2023 10:07:24 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftest: fix
 intel_selftest_modify_policy argument types
Message-ID: <Y8e2tBUUEF5o3E8G@ashyti-mobl2.lan>
References: <20230117163743.1003219-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117163743.1003219-1-arnd@kernel.org>
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
 Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 17, 2023 at 05:37:29PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The definition of intel_selftest_modify_policy() does not match the
> declaration, as gcc-13 points out:
> 
> drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c:29:5: error: conflicting types for 'intel_selftest_modify_policy' due to enum/integer mismatch; have 'int(struct intel_engine_cs *, struct intel_selftest_saved_policy *, u32)' {aka 'int(struct intel_engine_cs *, struct intel_selftest_saved_policy *, unsigned int)'} [-Werror=enum-int-mismatch]
>    29 | int intel_selftest_modify_policy(struct intel_engine_cs *engine,
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c:11:
> drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h:28:5: note: previous declaration of 'intel_selftest_modify_policy' with type 'int(struct intel_engine_cs *, struct intel_selftest_saved_policy *, enum selftest_scheduler_modify)'
>    28 | int intel_selftest_modify_policy(struct intel_engine_cs *engine,
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Change the type in the definition to match.
> 
> Fixes: 617e87c05c72 ("drm/i915/selftest: Fix hangcheck self test for GuC submission")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi

> ---
>  drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> index 310fb83c527e..2990dd4d4a0d 100644
> --- a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> +++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> @@ -28,8 +28,7 @@ struct intel_engine_cs *intel_selftest_find_any_engine(struct intel_gt *gt)
>  
>  int intel_selftest_modify_policy(struct intel_engine_cs *engine,
>  				 struct intel_selftest_saved_policy *saved,
> -				 u32 modify_type)
> -
> +				 enum selftest_scheduler_modify modify_type)
>  {
>  	int err;
>  
> -- 
> 2.39.0
