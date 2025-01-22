Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5272A192E2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 14:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB0910E307;
	Wed, 22 Jan 2025 13:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jh2xpNoL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8796C10E307;
 Wed, 22 Jan 2025 13:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737553660; x=1769089660;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5EMgbOOLhmTpBeCBWxm2mkcZ97Qj3rei/MmM+ArG0Us=;
 b=jh2xpNoLQqg1tCJrK9R8aK+ycn0fGCwlmVQAVZM0rAunGeAu6axqj5rQ
 t1Qpp1y6IwtEOGbQ8mlc6CvwVymBNRQsGfGMhl+NPXvPh0jtyH2zjKybE
 kkg0ksyZew4a63pyx0ZB0VOVNX8YbA/+Wl82h03LAKHYRva439yDMi0xU
 2/PSdg3J6WKCsiLeNReboJ+sGxrGfOHcNl7xAerx/NOfweOvbFrNWWeD+
 eYFbbCINoMCbNIYtZagIt1D5XYrdSxIq+h6vlek/Qy2VVDzwJ08ELemXq
 zyk5F6lyfesGxcij5UV5H6QkOty5NUrSXr92yZzkNKRTheAT6/nX7DRnh w==;
X-CSE-ConnectionGUID: u/3UMorpQ3qGKrGWJ06eRA==
X-CSE-MsgGUID: s8635dTNTiWyl+vEq3/DSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37893812"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="37893812"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 05:47:39 -0800
X-CSE-ConnectionGUID: mVRwqNL8SKi4c9tZq/iwGg==
X-CSE-MsgGUID: gcVuPiKkS5SFBD4BzrU2+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="107671702"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.30])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 05:47:35 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>, Ingyu Jang
 <ingyujang25@gmail.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gt: Handle INTEL_WAKEREF_DEF return value in
 gen8_ggtt_bind_get_ce
In-Reply-To: <eogzndjymansgavkt5wz66ibfbym2hw7codylizd5ldnqr2zue@hqnsstimqgto>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250116193528.2297487-1-ingyujang25@gmail.com>
 <eogzndjymansgavkt5wz66ibfbym2hw7codylizd5ldnqr2zue@hqnsstimqgto>
Date: Wed, 22 Jan 2025 15:47:32 +0200
Message-ID: <87msfjneob.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 22 Jan 2025, Krzysztof Karas <krzysztof.karas@intel.com> wrote:
> Hi Ingyu,
>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> index d60a6ca0cae5..8d22d8f2243d 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> @@ -311,7 +311,7 @@ static struct intel_context *gen8_ggtt_bind_get_ce(struct i915_ggtt *ggtt, intel
>>  	 * doing rpm_resume().
>>  	 */
>>  	*wakeref = intel_gt_pm_get_if_awake(gt);
>> -	if (!*wakeref)
>> +	if (!*wakeref || *wakeref == INTEL_WAKEREF_DEF)
> INTEL_WAKEREF_DEF is a wrapper for an error pointer - how about
> IS_ERR_OR_NULL() macro? Without going a bit deeper into the code
> it is not apparent that INTEL_WAKEREF_DEF is indicating an error.
>
> Nice catch nevertheless.

It's not a nice catch. It's wrong [1].

BR,
Jani.


[1] https://lore.kernel.org/r/87cyglg9w2.fsf@intel.com


>
> Krzysztof
>
>>  		return NULL;
>>  
>>  	intel_engine_pm_get(ce->engine);
>> -- 
>> 2.34.1
>> 

-- 
Jani Nikula, Intel
