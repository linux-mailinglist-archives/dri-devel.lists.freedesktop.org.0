Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D3D6241A8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 12:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4AF210E6E0;
	Thu, 10 Nov 2022 11:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A30010E6E0;
 Thu, 10 Nov 2022 11:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668080533; x=1699616533;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QktWTyfBQ9BndmPoxnSdD7wIY7U+IxLE1V7ffbWRpSg=;
 b=km1aBR3y7VjWj7iQyGBn+Hco0xCxCy45Pwh+DsC603+w1hhOCMJW5Mlf
 XlytIFClqbIOqBkBeom7wJw17gwgdDnT5hn7o40u8lI9MW4OPzcD9r9UV
 7vm+uhckUPiE0F/7JmhpxcNBGD75Sq8WKbzrB7McY1nUl1MGwoU/6qS3i
 tOhnOtD/o+rtIVKZ7T9rN8V7Ah/P+PitLWUWNQHV/X5p4CKQZDNhYjH5f
 VYdW9DTCmn2JwDgwOgQF0yymZMD5TgQErFLPknnpppeyLzllcn7cYikti
 gSrcJzLu2omXmgK8tQYl70P/1GpNdMo/PFAQoJGYbTsP0+cyZjf4j+YiD g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="308911145"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="308911145"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 03:42:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="882329324"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="882329324"
Received: from salmasha-mobl.ger.corp.intel.com (HELO [10.213.230.214])
 ([10.213.230.214])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 03:42:11 -0800
Message-ID: <926320fd-e3f5-92b0-0746-cfd988296d07@linux.intel.com>
Date: Thu, 10 Nov 2022 11:42:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915: Partial abandonment of legacy
 DRM logging macros
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, Intel-gfx@lists.freedesktop.org
References: <20221108114950.2017869-1-tvrtko.ursulin@linux.intel.com>
 <20221109104633.2579245-1-tvrtko.ursulin@linux.intel.com>
 <6ebca1da-47c4-9ced-c77c-1083ba2e02ed@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <6ebca1da-47c4-9ced-c77c-1083ba2e02ed@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/11/2022 11:07, Andrzej Hajda wrote:
> On 09.11.2022 11:46, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Convert some usages of legacy DRM logging macros into versions which tell
>> us on which device have the events occurred.
>>
>> v2:
>>   * Don't have struct drm_device as local. (Jani, Ville)
>>
>> v3:
>>   * Store gt, not i915, in workaround list. (John)
> 
> 
> Neither gt neither i915 does fit into wa list IMHO.
> The best solution would be provide context (i915/gt/whatever)
> as a function parameter, every time it is necessary.
> On the other side it should not block the patch.
> More below.

I thought about the very same lines but then concluded that the only _current_ usage of the lists is that they belong to a gt (directly or via engine). So having a back pointer felt passable.

>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> # v2
>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  2 +-
>>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 26 ++++++++----
>>   .../drm/i915/gt/intel_execlists_submission.c  | 13 +++---
>>   drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |  4 +-
>>   drivers/gpu/drm/i915/gt/intel_gt.c            |  4 +-
>>   drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  8 ++--
>>   drivers/gpu/drm/i915/gt/intel_rps.c           |  6 ++-
>>   drivers/gpu/drm/i915/gt/intel_workarounds.c   | 42 +++++++++++--------
>>   .../gpu/drm/i915/gt/intel_workarounds_types.h |  3 ++
>>   .../gpu/drm/i915/gt/selftest_workarounds.c    |  4 +-
>>   drivers/gpu/drm/i915/i915_debugfs.c           |  4 +-
>>   drivers/gpu/drm/i915/i915_gem.c               |  2 +-
>>   drivers/gpu/drm/i915/i915_getparam.c          |  2 +-
>>   drivers/gpu/drm/i915/i915_irq.c               | 12 +++---
>>   drivers/gpu/drm/i915/i915_perf.c              | 14 ++++---
>>   drivers/gpu/drm/i915/i915_query.c             | 12 +++---
>>   drivers/gpu/drm/i915/i915_sysfs.c             |  3 +-
>>   drivers/gpu/drm/i915/i915_vma.c               | 16 +++----
>>   drivers/gpu/drm/i915/intel_uncore.c           | 21 ++++++----
>>   19 files changed, 117 insertions(+), 81 deletions(-)
>>
> 
> (...)
> 
>> @@ -1749,7 +1755,7 @@ wa_list_apply(struct intel_gt *gt, const struct 
>> i915_wa_list *wal)
>>                   intel_gt_mcr_read_any_fw(gt, wa->mcr_reg) :
>>                   intel_uncore_read_fw(uncore, wa->reg);
>> -            wa_verify(wa, val, wal->name, "application");
>> +            wa_verify(wal->gt, wa, val, wal->name, "application");
> 
> This looks confusing at 1st sight, why wa_verify(wal->gt,...) and not 
> wa_verify(gt,...). Can they differ? and similar questions as in case of 
> redundant vars.

Would be always the same in current code. But point taken, it is confusing.. hm..

./gt/intel_workarounds.c:       wa_list_apply(gt, &gt->wa_list);
./gt/intel_workarounds.c:       wa_list_apply(engine->gt, &engine->wa_list);

Could drop the gt argument now that gt is available in the wa list.

> The same apply to wal->engine_name, which is almost unused anyway?
> Also AFAIK there is always sequence:
> 1. wa_init_start
> 2. *init_workarounds*
> 3. wa_init_finish - btw funny name.

Why funny? :) Because init collides with finish? Start of initialisation, initialisation, end of initialisation. :)

> Why not 1 and 3 embed in 2? Do we need this sequence.

It's just some common code so it doesn't have to be duplicated in the callers.
  
> Anyway all these comments are for wa handling, which should be addressed 
> in other patch. So my r-b still holds, either with wal->i915, either 
> with wal->gt.
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Thanks, I think I'll go with v3 and follow up with wa_list_apply cleanup, so that my logging changes in gt/ are in before further CI delays and people can freely work on the GT logging macros without conflicts.

Regards,

Tvrtko
