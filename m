Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF925A8236
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 17:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6781010E46F;
	Wed, 31 Aug 2022 15:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2908B10E46F;
 Wed, 31 Aug 2022 15:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661961056; x=1693497056;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vkPU7sdfJueWPEchVhmJ8DiR+YVfE1Z5xxWYFkCgOW0=;
 b=OLvpM3BVvb7xIiwTqXyKNTSyVamFFLMyDzWKasokwIYQ7nCuHpV9WbbY
 pRDvStxO1N1Ej9G/ol7LYFSYlEaucyu42PpQqCwH4lajnjA70+KDndtTV
 1mUG3I4ztjJ8I6u2wwKxKoV2NT9M4h8bUvkb7hgYkKr6wx8xrqE3Hsrhu
 F84AEW34KK8a9JD4BsnoSIwsPjYhK1R8PIrL71UnfzgLzCHmmZzyWVnsw
 qP7RCqVA2BgK2uhZgy8Y6PUugZ+/M9fQnw/ymQWFdQFfa5dvL3z4AAh3F
 040yWs7KtH6f2+cFHW+/WlDDFljhrIcDyXPzzfzdLD1D01+a0GZVsXXz6 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="278494418"
X-IronPort-AV: E=Sophos;i="5.93,278,1654585200"; d="scan'208";a="278494418"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 08:50:55 -0700
X-IronPort-AV: E=Sophos;i="5.93,278,1654585200"; d="scan'208";a="641920880"
Received: from salwamoh-mobl.gar.corp.intel.com (HELO [10.214.169.63])
 ([10.214.169.63])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 08:50:52 -0700
Message-ID: <f8f8d5d8-3e50-2eac-1a29-d3583ef99ebe@intel.com>
Date: Wed, 31 Aug 2022 16:50:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/i915/ttm: Abort suspend on i915_ttm_backup failure
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220829120409.24260-1-nirmoy.das@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220829120409.24260-1-nirmoy.das@intel.com>
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
Cc: thomas.hellstrom@intel.com, chris.p.wilson@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/08/2022 13:04, Nirmoy Das wrote:
> On system suspend when system memory is low then i915_gem_obj_copy_ttm()
> could fail trying to backup a lmem obj. GEM_WARN_ON() is not enough,
> suspend shouldn't continue if i915_ttm_backup() throws an error.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6529

Does this fix it? Does CI not complain about the drm_err? Also do we 
know what the actual error was?

> Suggested-by: Chris P Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Passing the error along seems reasonable to me,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> index 9aad84059d56..6f5d5c0909b4 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> @@ -79,7 +79,12 @@ static int i915_ttm_backup(struct i915_gem_apply_to_region *apply,
>   		goto out_no_populate;
>   
>   	err = i915_gem_obj_copy_ttm(backup, obj, pm_apply->allow_gpu, false);
> -	GEM_WARN_ON(err);
> +	if (err) {
> +		drm_err(&i915->drm,
> +			"Unable to copy from device to system memory, err:%d\n",
> +			err);
> +		goto out_no_populate;
> +	}
>   	ttm_bo_wait_ctx(backup_bo, &ctx);
>   
>   	obj->ttm.backup = backup;
