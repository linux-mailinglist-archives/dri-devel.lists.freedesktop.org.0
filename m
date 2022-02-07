Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E134ABEA0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 13:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B836E10E1F4;
	Mon,  7 Feb 2022 12:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D5D10E1F4;
 Mon,  7 Feb 2022 12:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644237878; x=1675773878;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=braspoVjuWSiuUDBUczwTD0VOvkubEBo2bC5/dyUuRU=;
 b=W4a/CJdFYphizJQegn0jEUJTRm9yu9FfBbmCnCNmKAMTW1uZHU9Ug56B
 joMdiZ2S578lieFGOWPYDjTZ6dlotx7laWJE/ibEimELLN7t0IGmeG3Kx
 Zucwy3/9YEr72AfT5Z3dYsXrL68sHgceXLY+Za5h4KqCLD72gvxJFN1UZ
 taWV+XXU6rQiqVvBVTgnZAgRL8uYNCSGQ5tKfhOTW79ZKQUiFZbzpK0f4
 6DbP3EspZ+qx7tjwlKyJXI1/BUcwrmn49HhPYBm8kq9BNbxpBlW5amdnl
 vm5RIe4gjbKH49zSkTJMFFxzTtG9h9wd+/r0b7Jhl26xrnb9lacNxjoAe g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="312004592"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="312004592"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 04:44:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="484410000"
Received: from nbaca1-mobl.ger.corp.intel.com (HELO localhost) ([10.252.18.25])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 04:44:36 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Michael Cheng
 <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v5 0/5] Use drm_clflush* instead of clflush
In-Reply-To: <f245951e-6f6c-1eab-7cba-ccb774db1194@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220204163711.439403-1-michael.cheng@intel.com>
 <f245951e-6f6c-1eab-7cba-ccb774db1194@linux.intel.com>
Date: Mon, 07 Feb 2022 14:44:30 +0200
Message-ID: <87pmnyrglt.fsf@intel.com>
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
Cc: lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 07 Feb 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> On 04/02/2022 16:37, Michael Cheng wrote:
>> This patch series re-work a few i915 functions to use drm_clflush_virt_range
>> instead of calling clflush or clflushopt directly. This will prevent errors
>> when building for non-x86 architectures.
>> 
>> v2: s/PAGE_SIZE/sizeof(value) for Re-work intel_write_status_page and added
>> more patches to convert additional clflush/clflushopt to use drm_clflush*.
>> (Michael Cheng)
>> 
>> v3: Drop invalidate_csb_entries and directly invoke drm_clflush_virt_ran
>> 
>> v4: Remove extra memory barriers
>> 
>> v5: s/cache_clflush_range/drm_clflush_virt_range
>
> Is anyone interested in this story noticing my open? I will repeat:
>
> How about we add i915_clflush_virt_range as static inline and by doing 
> so avoid adding function calls to code paths which are impossible on Arm 
> builds? Case in point relocations, probably execlists backend as well.
>
> Downside would be effectively duplicating drm_clfush_virt_range code. 
> But for me, (Also considering no other driver calls it so why it is 
> there? Should it be deleted?), that would be okay.

Keep it simple first, optimize later if necessary?

BR,
Jani.


>
> Regards,
>
> Tvrtko
>
>> Michael Cheng (5):
>>    drm/i915/gt: Re-work intel_write_status_page
>>    drm/i915/gt: Drop invalidate_csb_entries
>>    drm/i915/gt: Re-work reset_csb
>>    drm/i915/: Re-work clflush_write32
>>    drm/i915/gt: replace cache_clflush_range
>> 
>>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  8 +++-----
>>   drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 12 ++++++------
>>   drivers/gpu/drm/i915/gt/intel_engine.h        | 13 ++++---------
>>   .../drm/i915/gt/intel_execlists_submission.c  | 19 ++++++-------------
>>   drivers/gpu/drm/i915/gt/intel_gtt.c           |  2 +-
>>   drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  2 +-
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 +-
>>   7 files changed, 22 insertions(+), 36 deletions(-)
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
