Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A684B837A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 10:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397B010EC58;
	Wed, 16 Feb 2022 09:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4544710EC54;
 Wed, 16 Feb 2022 09:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645002136; x=1676538136;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mwF1U5j+drzsRrwL7zZWjzrwyGUiQkfyhUKOWPFbLPM=;
 b=KgKF8cKykpQqZ3HjSpxnJFWn/ty/XllRG4ENAYkEKT2w8eHWA6DZ8PpC
 LOObUtcrKyAqwu9TksdAxF8Jz6XmWt/eLnJNVk2Lu6EyND/EAHpYFuuaT
 nNm9fYbqpWjn6N79rGhVfl/TlYrVfDGWssjAzSo7ACtn42dKgYXXdsuMP
 Ugi6rwp42pJiAEVddYmZ7lTrCXzCFBHfIb7emeT0Ld3a4JAftatKxzavH
 pnYQbWr/HY50heNdAC1zF6k/OhyRGMr3YinCcefkzKRBm8KcaNagZySAj
 JS9iQt9pnCeLNe3sTmLsp6QzualmJ/5lc8xJLMJ6jyGf8fX+++8urOUnj w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="230520193"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="230520193"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 01:02:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="704216865"
Received: from rbilei-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.13.113])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 01:02:10 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] drm/i915/gt: fix unsigned integer to signed assignment
In-Reply-To: <20220216083849.91239-1-jiapeng.chong@linux.alibaba.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220216083849.91239-1-jiapeng.chong@linux.alibaba.com>
Date: Wed, 16 Feb 2022 11:02:06 +0200
Message-ID: <87h78z5gmp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: tvrtko.ursulin@linux.intel.com,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
 rodrigo.vivi@intel.com, sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Feb 2022, Jiapeng Chong <jiapeng.chong@linux.alibaba.com> wrote:
> Eliminate the follow smatch warning:
>
> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4640
> guc_create_virtual() warn: assigning (-2) to unsigned variable
> 've->base.instance'.
>
> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4641
> guc_create_virtual() warn: assigning (-2) to unsigned variable
> 've->base.uabi_instance'.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

The report seems to be valid, but I don't think this is the fix.

Where do we even check for invalid instance/uabi_instance in code?

BR,
Jani.


> ---
>  drivers/gpu/drm/i915/gt/intel_engine_types.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index 36365bdbe1ee..dc7cc06c68e7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -328,10 +328,10 @@ struct intel_engine_cs {
>  	intel_engine_mask_t logical_mask;
>  
>  	u8 class;
> -	u8 instance;
> +	s8 instance;
>  
>  	u16 uabi_class;
> -	u16 uabi_instance;
> +	s16 uabi_instance;
>  
>  	u32 uabi_capabilities;
>  	u32 context_size;

-- 
Jani Nikula, Intel Open Source Graphics Center
