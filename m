Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 901CE4ABDBE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 13:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E79810E492;
	Mon,  7 Feb 2022 12:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877B310E3D4;
 Mon,  7 Feb 2022 12:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644235462; x=1675771462;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jlG+yz870jgBaG+eFp0pBdAv/zSw0Td4tFHyLERBtXE=;
 b=gMBthczInDli/InkNOrEPopkDIHYtcyxV6XY4xBkAC6KEuMbbnFMGT7K
 upnjQWZJVioLJsi8iYfeFHbLCjWkO67Eb9XXGQEJZWjwVEiFwxS6IEqIS
 VG3cg+RT/pEUpBwdeWFyzFQtGL/ii2hoOt82j4fERvgL661jWSYkV0ODd
 7u58KbaRjW0/LJEhgmrtFkl+npq3FxXzO+PxjWzzIfFb83MgVxhyGAzqZ
 KP5JvbuTR99a7t5VtSxD7U9icQQOte1Rpr903gb/Vvo5Mqsbo6LVhw9MF
 NTXxrbMriOOCX++exNERYllCT3bL+eX72RqH2g/jYMujMcpv/DdFEU3OD A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="229349375"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="229349375"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 04:04:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="481565484"
Received: from conroyco-mobl2.ger.corp.intel.com (HELO [10.213.251.21])
 ([10.213.251.21])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 04:03:58 -0800
Message-ID: <f245951e-6f6c-1eab-7cba-ccb774db1194@linux.intel.com>
Date: Mon, 7 Feb 2022 12:03:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 0/5] Use drm_clflush* instead of clflush
Content-Language: en-US
To: Michael Cheng <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220204163711.439403-1-michael.cheng@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220204163711.439403-1-michael.cheng@intel.com>
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
Cc: casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, wayne.boyer@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/02/2022 16:37, Michael Cheng wrote:
> This patch series re-work a few i915 functions to use drm_clflush_virt_range
> instead of calling clflush or clflushopt directly. This will prevent errors
> when building for non-x86 architectures.
> 
> v2: s/PAGE_SIZE/sizeof(value) for Re-work intel_write_status_page and added
> more patches to convert additional clflush/clflushopt to use drm_clflush*.
> (Michael Cheng)
> 
> v3: Drop invalidate_csb_entries and directly invoke drm_clflush_virt_ran
> 
> v4: Remove extra memory barriers
> 
> v5: s/cache_clflush_range/drm_clflush_virt_range

Is anyone interested in this story noticing my open? I will repeat:

How about we add i915_clflush_virt_range as static inline and by doing 
so avoid adding function calls to code paths which are impossible on Arm 
builds? Case in point relocations, probably execlists backend as well.

Downside would be effectively duplicating drm_clfush_virt_range code. 
But for me, (Also considering no other driver calls it so why it is 
there? Should it be deleted?), that would be okay.

Regards,

Tvrtko

> Michael Cheng (5):
>    drm/i915/gt: Re-work intel_write_status_page
>    drm/i915/gt: Drop invalidate_csb_entries
>    drm/i915/gt: Re-work reset_csb
>    drm/i915/: Re-work clflush_write32
>    drm/i915/gt: replace cache_clflush_range
> 
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  8 +++-----
>   drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 12 ++++++------
>   drivers/gpu/drm/i915/gt/intel_engine.h        | 13 ++++---------
>   .../drm/i915/gt/intel_execlists_submission.c  | 19 ++++++-------------
>   drivers/gpu/drm/i915/gt/intel_gtt.c           |  2 +-
>   drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  2 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 +-
>   7 files changed, 22 insertions(+), 36 deletions(-)
> 
