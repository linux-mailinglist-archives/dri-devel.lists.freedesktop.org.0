Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A02007ADB3C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 17:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C286910E272;
	Mon, 25 Sep 2023 15:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF3C10E284;
 Mon, 25 Sep 2023 15:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695655269; x=1727191269;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=HanA6xFKh2KdfE1I56kVpL+7+5hEjjUhiqid1AmciyI=;
 b=fhUeuFsFqb/RZxRbjcT3s32E44pOg/+N1kpueJHS8tlB2w68WTmgbfzp
 VyoUIfYC/nbBaP9VOGB1eOuK6qSsMOM6rNMBctEfT/0IGveYSiUZ1w44h
 ML4t2+QLYytR+pUCEij1WgAmJPnVAka99E5m5LKtgjG1QwIAJal3S0d0Q
 zTYRT4D9LckH0XjlFzyWcl+vOdenmOUL6dESPdtZSxOsFkMeHsIXhxqUG
 v3vmsoPJ00UYsrICCuyo0rjqvOk52LQhbRgKludDpW5VWE7KtqZVUET2H
 UGg/z2h3n7ZhBgQLiFTBOL1CkyQwMwvzGeODn/A7Am0xgSQaGK6gIQvGZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371599296"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="371599296"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 08:21:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="814011279"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="814011279"
Received: from smgotth-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.46])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 08:20:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/i915/gem: Make i915_gem_shrinker multi-gt aware
In-Reply-To: <ZRGdXq1WOWpx271q@ashyti-mobl2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230925134938.12043-1-nirmoy.das@intel.com>
 <ZRGdXq1WOWpx271q@ashyti-mobl2.lan>
Date: Mon, 25 Sep 2023 18:20:54 +0300
Message-ID: <877coemg89.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, dri-devel@lists.freedesktop.org,
 andi.shyti@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Sep 2023, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> Hi Nirmoy,
>
> you forgot the v2 here.
>
> On Mon, Sep 25, 2023 at 03:49:38PM +0200, Nirmoy Das wrote:
>> From: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> 
>> Where applicable, use for_each_gt instead of to_gt in the
>> i915_gem_shrinker functions to make them apply to more than just the
>> primary GT.  Specifically, this ensure i915_gem_shrink_all retires all
>> requests across all GTs, and this makes i915_gem_shrinker_vmap unmap
>> VMAs from all GTs.
>> 
>> v2: Pass correct GT to intel_gt_retire_requests(Andrzej).
>> 
>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>
> [...]
>
>> -	if (shrink & I915_SHRINK_ACTIVE)
>> -		/* Retire requests to unpin all idle contexts */
>> -		intel_gt_retire_requests(to_gt(i915));
>> +	if (shrink & I915_SHRINK_ACTIVE) {
>> +		for_each_gt(gt, i915, i)
>> +			/* Retire requests to unpin all idle contexts */
>> +			intel_gt_retire_requests(gt);
>> +	}
>
> These two brackets are not needed.
>
>>  
>>  	/*
>>  	 * As we may completely rewrite the (un)bound list whilst unbinding
>> @@ -389,6 +393,8 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
>>  	struct i915_vma *vma, *next;
>>  	unsigned long freed_pages = 0;
>>  	intel_wakeref_t wakeref;
>> +	struct intel_gt *gt;
>> +	int i;
>
> the trend is to use 'unsigned int' here and I've seen it
> reviewed. Personally, if I really have to express a preference, I
> prefer 'int' because it's a bit safer, generally I don't really
> mind :)

Always use int over unsigned int if you don't have a specific reason not
to. ("It can't be negative" is not a good reason.)

BR,
Jani.

>
> The rest looks good.
>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 
>
> Andi

-- 
Jani Nikula, Intel
