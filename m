Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 217F54E24F3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 12:04:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C486010E31D;
	Mon, 21 Mar 2022 11:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2990810E319;
 Mon, 21 Mar 2022 11:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647860643; x=1679396643;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ee9LFigG3BJzoa27u8jzD9bFriJepHX9vTAeMbhx2NU=;
 b=iNks5cOs90ECAkQYC8qZdCixK9D9IBrLFAjpmOUHGwQmTbNaaqkreMUC
 rifydvNmeLNQGzluvpKJhB6ZmEU41bUAiW3cAoetun2dQs8NEVN/SkQzo
 UmgFHAE8PtYlwHtlA+c5ALpLmFprAxNcGBJxdfS5qR3mzbPFVLpNvRxDX
 nothxpxXha9ODHeQN82pn0Gr3thctKmeKnzXjtG+bsrQvV/BYL47ipcrm
 i3lVuInXOzL3/RZJhRPFCiKkFzOukbnpUM6Pkb4FnyXdj9CVUTtbg70Nz
 K/osVHPpVBH3bAPm02wP5whsGzpJI/PNJV1j5vrcpw8QDzFip2NNvSTOk w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="318234082"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="318234082"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 04:04:02 -0700
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="824354872"
Received: from evinintel.ger.corp.intel.com (HELO [10.249.254.209])
 ([10.249.254.209])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 04:03:59 -0700
Message-ID: <5db61477-6064-ada0-82a7-c1dc659dacad@linux.intel.com>
Date: Mon, 21 Mar 2022 12:03:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/4] Drop wbinvd_on_all_cpus usage
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Michael Cheng <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220319194227.297639-1-michael.cheng@intel.com>
 <4c86ae70-6f97-7a7c-1fd4-5e73ca29d0ba@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <4c86ae70-6f97-7a7c-1fd4-5e73ca29d0ba@linux.intel.com>
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
Cc: wayne.boyer@intel.com, daniel.vetter@ffwll.ch, casey.g.bowman@intel.com,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Tvrtko.

On 3/21/22 11:27, Tvrtko Ursulin wrote:
>
> On 19/03/2022 19:42, Michael Cheng wrote:
>> To align with the discussion in [1][2], this patch series drops all 
>> usage of
>> wbvind_on_all_cpus within i915 by either replacing the call with certain
>> drm clflush helpers, or reverting to a previous logic.
>
> AFAIU, complaint from [1] was that it is wrong to provide non x86 
> implementations under the wbinvd_on_all_cpus name. Instead an arch 
> agnostic helper which achieves the same effect could be created. Does 
> Arm have such concept?

I also understand Linus' email like we shouldn't leak incoherent IO to 
other architectures, meaning any remaining wbinvd()s should be X86 only.

Also, wbinvd_on_all_cpus() can become very costly, hence prefer the 
range apis when possible if they can be verified not to degrade performance.


>
> Given that the series seems to be taking a different route, avoiding 
> the need to call wbinvd_on_all_cpus rather than what [1] suggests 
> (note drm_clflush_sg can still call it!?), concern is that the series 
> has a bunch of reverts and each one needs to be analyzed.


Agreed.

/Thomas



>
> For instance looking at just the last one, 64b95df91f44, who has 
> looked at the locking consequences that commit describes:
>
> """
>     Inside gtt_restore_mappings() we currently take the 
> obj->resv->lock, but
>     in the future we need to avoid taking this fs-reclaim tainted lock 
> as we
>     need to extend the coverage of the vm->mutex. Take advantage of the
>     single-threaded nature of the early resume phase, and do a single
>     wbinvd() to flush all the GTT objects en masse.
>
> """
>
> ?
>
> Then there are suspend and freeze reverts which presumably can regress 
> the suspend times. Any data on those?
>
> Adding Matt since he was the reviewer for that work so might remember 
> something.
>
> Regards,
>
> Tvrtko
>
>
>> [1]. 
>> https://lists.freedesktop.org/archives/dri-devel/2021-November/330928.html
>> [2]. https://patchwork.freedesktop.org/patch/475752/?series=99991&rev=5
>>
>> Michael Cheng (4):
>>    i915/gem: drop wbinvd_on_all_cpus usage
>>    Revert "drm/i915/gem: Almagamate clflushes on suspend"
>>    i915/gem: Revert i915_gem_freeze to previous logic
>>    drm/i915/gt: Revert ggtt_resume to previous logic
>>
>>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |  9 +---
>>   drivers/gpu/drm/i915/gem/i915_gem_pm.c     | 56 ++++++++++++++--------
>>   drivers/gpu/drm/i915/gt/intel_ggtt.c       | 17 +++----
>>   drivers/gpu/drm/i915/gt/intel_gtt.h        |  2 +-
>>   4 files changed, 46 insertions(+), 38 deletions(-)
>>
