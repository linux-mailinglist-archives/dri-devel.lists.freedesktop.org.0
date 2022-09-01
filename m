Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0075A9C54
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 17:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14C110E064;
	Thu,  1 Sep 2022 15:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE9F10E05B;
 Thu,  1 Sep 2022 15:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662047881; x=1693583881;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=P1Ks+pOrIKYw4I5ZGK3yM1ct5kvw2WsJqNzAMSaPTt8=;
 b=n9rZ13XSVLOYp359nQgDpoehO4CnvVMVM8Firvz+qtIxk1wjLRC+e0xe
 vpt10ro8bdSD0M+eY9d2VlbncmzpW0KIjjLO6tLCJOW246V1rN9bndUEk
 WOKl1EaYU7OKz1ZrlqP9RGLilBAZAMGQACWfnbdl8n7Gy7CPrN1nFAFeo
 KS55MW5Kn17JzdYyoGaimI5EH8BjrO6CVNfoM5K8+OuLLogzX+wMeIZ6/
 SbX4LDwhAun5mildJaG1ZCqGHbu0nxvlQ+eI+K87DzUwDV+lVRWOh5r9d
 wxuGJCxsJVCZp9vQ+YNgaqv5ISpXRKvuWJN0YEM098wAej8gk0mIkmQhq A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="293330800"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="293330800"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 08:57:15 -0700
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="940905249"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.20.60])
 ([10.213.20.60])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 08:57:13 -0700
Message-ID: <119f1fe3-e7cb-6cd6-2710-e1c3e395d49e@intel.com>
Date: Thu, 1 Sep 2022 17:57:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ttm: Abort suspend on
 i915_ttm_backup failure
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220831161841.20033-1-nirmoy.das@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220831161841.20033-1-nirmoy.das@intel.com>
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
Cc: thomas.hellstrom@intel.com, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org, chris.p.wilson@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31.08.2022 18:18, Nirmoy Das wrote:
> On system suspend when system memory is low then i915_gem_obj_copy_ttm()
> could fail trying to backup a lmem obj. GEM_WARN_ON() is not enough,
> suspend shouldn't continue if i915_ttm_backup() throws an error.
> 
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/6529
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Suggested-by: Chris P Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
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

I wonder if %pe wouldn't be better here, up to you.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


> +		goto out_no_populate;
> +	}
>   	ttm_bo_wait_ctx(backup_bo, &ctx);
>   
>   	obj->ttm.backup = backup;

