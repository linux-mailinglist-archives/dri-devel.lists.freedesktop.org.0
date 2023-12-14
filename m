Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ED28131FB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 14:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBAC10E303;
	Thu, 14 Dec 2023 13:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269CF10E84F;
 Thu, 14 Dec 2023 13:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702561559; x=1734097559;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hb1FCnmFMrNv86vfP4V+IuQJxF76sceTjf0zNAFG+CU=;
 b=WX+z4yoqJB3E2DTcDRBki+YtZhvOMbJpkFnJNUpctCHsm0KK1H2+6Mw8
 DCwK58vKnD4WycMHrdLcLA9IrF6NGyekDp8zE2J6njJBJeLdZms+tVirB
 2CQb4iPDno94VTQ3t8WuKXzeHBS28hogR7HFa7rY8i5m0XFdWViqose68
 UBvEUVPvvNXXkFZ09TdUBZULYtL0H2BgWJIts0Yi/l27MWnO3sDBTZPRE
 FQExa4GPnoh8nsLEqITWZwfxy6SR1hymyI3CGAsUYUglfF8kvMHKD+8/X
 jvEinfGey5rLxkROKheU46TkCn46hhk7bvkMTNCRG7Vcjrghd9FImzq8x Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2205248"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="2205248"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 05:45:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="865020545"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="865020545"
Received: from viveks6x-mobl.ger.corp.intel.com (HELO [10.213.205.47])
 ([10.213.205.47])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 05:45:24 -0800
Message-ID: <2abe6f02-b93e-4207-b9be-e9185c7b69e5@linux.intel.com>
Date: Thu, 14 Dec 2023 13:45:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] drm/i915: Replace kmap_atomic() with
 kmap_local_page()
Content-Language: en-US
To: Zhao Liu <zhao1.liu@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Ira Weiny <ira.weiny@intel.com>,
 "Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20231203132947.2328805-1-zhao1.liu@linux.intel.com>
 <ZXsA4ojbROLXMkfz@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZXsA4ojbROLXMkfz@intel.com>
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
Cc: Dave Hansen <dave.hansen@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Zhao,

On 14/12/2023 13:19, Zhao Liu wrote:
> Hi maintainers,
> 
> Just kindly ping.
> May I ask if this refresh version could be merged into the next tree of
> the i915?

I certainly spotted your series last week or so but then it slipped my 
mind to go through it. Should be able to go through it today or tomorrow.

Regards,

Tvrtko

> 
> Thanks,
> Zhao
> 
> On Sun, Dec 03, 2023 at 09:29:38PM +0800, Zhao Liu wrote:
>> Date: Sun, 3 Dec 2023 21:29:38 +0800
>> From: Zhao Liu <zhao1.liu@linux.intel.com>
>> Subject: [PATCH v3 0/9] drm/i915: Replace kmap_atomic() with
>>   kmap_local_page()
>> X-Mailer: git-send-email 2.34.1
>>
>> From: Zhao Liu <zhao1.liu@intel.com>
>>
>> Hi all,
>>
>> I refreshed this v3 by rebasing v2 [1] on the commit 968f35f4ab1c
>> ("Merge tag 'v6.7-rc3-smb3-client-fixes' of git://git.samba.org/sfrench/
>> cifs-2.6").
>>
>> Based on the current code, I rechecked the substitutions in v2 and they
>> still stand and are valid, so no code change in v3.
>>
>> Thanks for all the review! And sorry v2 was missed, I'll pay more
>> attention to this v3.
>>
>>
>> Purpose of This Patchset
>> ========================
>>
>> The purpose of this pacthset is to replace all uses of kmap_atomic() in
>> i915 with kmap_local_page() because the use of kmap_atomic() is being
>> deprecated in favor of kmap_local_page()[2]. And 92b64bd (mm/highmem:
>> add notes about conversions from kmap{,_atomic}()) has declared the
>> deprecation of kmap_atomic().
>>
>>
>> Motivation for Deprecating kmap_atomic() and Using kmap_local_page()
>> ====================================================================
>>
>> The main difference between atomic and local mappings is that local
>> mappings doesn't disable page faults or preemption (the preemption is
>> disabled for !PREEMPT_RT case, otherwise it only disables migration).
>>
>> With kmap_local_page(), we can avoid the often unwanted side effect of
>> unnecessary page faults and preemption disables.
>>
>>
>> Patch summary
>> =============
>>
>> Patch 1, 4-6 and 8-9 replace kmap_atomic()/kunmap_atomic() with
>>          kmap_local_page()/kunmap_local() directly. With these local
>>          mappings, the page faults and preemption are allowed.
>>
>> Patch 2 and 7 use memcpy_from_page() and memcpy_to_page() to replace
>>          kmap_atomic()/kunmap_atomic(). These two variants of memcpy()
>>          are based on the local mapping, so page faults and preemption
>>          are also allowed in these two interfaces.
>>
>> Patch 3 replaces kmap_atomic()/kunmap_atomic() with kmap_local_page()/
>>          kunmap_local() and also disable page fault since the for special
>>          handling (pls see the commit message).
>>
>>
>> Reference
>> =========
>>
>> [1]: https://lore.kernel.org/all/20230329073220.3982460-1-zhao1.liu@linux.intel.com/
>> [2]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com
>>
>>
>> Thanks and Best Regards,
>> Zhao
>>
>> ---
>> Changlog:
>>
>> Changes since v2:
>> * Rebased on 968f35f4ab1c ("Merge tag 'v6.7-rc3-smb3-client-fixes' of
>>    git://git.samba.org/sfrench/cifs-2.6").
>> * Removed changelog (of v2) in commit message.
>> * Fixed typo in cover letter (Fabio).
>> * Added Reviewed-by tags from Ira and Fabio.
>>
>> Changes since v1:
>> * Dropped hot plug related description in commit message since it has
>>    nothing to do with kmap_local_page().
>> * Emphasized the motivation for using kmap_local_page() in commit
>>    message.
>> * Rebased patch 1 on f47e630 (drm/i915/gem: Typecheck page lookups) to
>>    keep the "idx" variable of type pgoff_t here.
>> * Used memcpy_from_page() and memcpy_to_page() to replace
>>    kmap_local_page() + memcpy() in patch 2.
>>
>> ---
>> Zhao Liu (9):
>>    drm/i915: Use kmap_local_page() in gem/i915_gem_object.c
>>    drm/i915: Use memcpy_[from/to]_page() in gem/i915_gem_pyhs.c
>>    drm/i915: Use kmap_local_page() in gem/i915_gem_shmem.c
>>    drm/i915: Use kmap_local_page() in gem/selftests/huge_pages.c
>>    drm/i915: Use kmap_local_page() in gem/selftests/i915_gem_coherency.c
>>    drm/i915: Use kmap_local_page() in gem/selftests/i915_gem_context.c
>>    drm/i915: Use memcpy_from_page() in gt/uc/intel_uc_fw.c
>>    drm/i915: Use kmap_local_page() in i915_cmd_parser.c
>>    drm/i915: Use kmap_local_page() in gem/i915_gem_execbuffer.c
>>
>>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c       | 10 +++++-----
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c           |  8 +++-----
>>   drivers/gpu/drm/i915/gem/i915_gem_phys.c             | 10 ++--------
>>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c            |  6 ++++--
>>   drivers/gpu/drm/i915/gem/selftests/huge_pages.c      |  6 +++---
>>   .../gpu/drm/i915/gem/selftests/i915_gem_coherency.c  | 12 ++++--------
>>   .../gpu/drm/i915/gem/selftests/i915_gem_context.c    |  8 ++++----
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c             |  5 +----
>>   drivers/gpu/drm/i915/i915_cmd_parser.c               |  4 ++--
>>   9 files changed, 28 insertions(+), 41 deletions(-)
>>
>> -- 
>> 2.34.1
>>
