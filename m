Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3306F638513
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 09:18:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4885910E099;
	Fri, 25 Nov 2022 08:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF62B10E099;
 Fri, 25 Nov 2022 08:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669364304; x=1700900304;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=hUfcDdsfSX5YjlGOWR2p6U6J07KOVONjwuqBLYRBav4=;
 b=bfhEQYGEqzxw3N37XtNJUINOLEs/LRMSwPpxnnjXAIRm7Tiebi7SCUTu
 YLLopRU2U06aky2ndpg4OX62dMIbCKqX+wWDLEIUh/SNsNqcxDZs8K1z1
 buF10t1mSEP2vgIR3GXXUala5eFjx5gSZi4JYP13CypbGPn++mSy416ck
 9GEQt0EhqndquHtULJczoffzCOT9ZnQcQ/SkdP4oUBLlnYeY4SKfpmHcz
 BAhlbqCW696y+RuMVay/GQCllxmjSEqTU/UG3igH0o7/DvZjJnJg2L+XK
 Giin33oJ5cBxcneyvCAyKPOa/g0wEvvJ/gSmx2xq6Kh7TPwLqHZNAvHRV g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="297793776"
X-IronPort-AV: E=Sophos;i="5.96,192,1665471600"; d="scan'208";a="297793776"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 00:18:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="644729418"
X-IronPort-AV: E=Sophos;i="5.96,192,1665471600"; d="scan'208";a="644729418"
Received: from dcliffo1-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.17.151])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 00:18:20 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Xia Fukun <xiafukun@huawei.com>, airlied@gmail.com, daniel@ffwll.ch,
 ville.syrjala@linux.intel.com, lucas.demarchi@intel.com,
 joonas.lahtinen@linux.intel.com
Subject: Re: [PATCH] drm/i915/bios: fix a memory leak in generate_lfp_data_ptrs
In-Reply-To: <20221125063428.69486-1-xiafukun@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221125063428.69486-1-xiafukun@huawei.com>
Date: Fri, 25 Nov 2022 10:18:18 +0200
Message-ID: <875yf35tx1.fsf@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, xiafukun@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Nov 2022, Xia Fukun <xiafukun@huawei.com> wrote:
> When (size != 0 || ptrs->lvds_ entries != 3), the program tries to
> free() the ptrs. However, the ptrs is not created by calling kzmalloc(),
> but is obtained by pointer offset operation.
> This may lead to memory leaks or undefined behavior.

Yeah probably worse things will happen than just leak.

>
> Fix this by replacing the arguments of kfree() with ptrs_block.
>
> Fixes: a87d0a847607 ("drm/i915/bios: Generate LFP data table pointers if the VBT lacks them")
> Signed-off-by: Xia Fukun <xiafukun@huawei.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_bios.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> index 28bdb936cd1f..edbdb949b6ce 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -414,7 +414,7 @@ static void *generate_lfp_data_ptrs(struct drm_i915_private *i915,
>  		ptrs->lvds_entries++;
>  
>  	if (size != 0 || ptrs->lvds_entries != 3) {
> -		kfree(ptrs);
> +		kfree(ptrs_block);
>  		return NULL;
>  	}

-- 
Jani Nikula, Intel Open Source Graphics Center
