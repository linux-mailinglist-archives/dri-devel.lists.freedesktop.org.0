Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7156F0787
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 16:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553FC10EB62;
	Thu, 27 Apr 2023 14:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B54410EB62;
 Thu, 27 Apr 2023 14:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682606018; x=1714142018;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=78ZXhodoJwKFvk39f1B6t8zkqni33BLh9z/o5ZxKRjA=;
 b=Uzbcx5d7t3/pHfoHERq5tqtLltpB9y0fNSsigbfGjp5m6Ohzw8N0vV/u
 s/inMsV9r7GjMbdWTRp6HEjfihTFtzbcrIL8fK7g3u+xa9ABtzjXWSYPi
 faqE1md8X7NIifLRbTQ8xKex/RRaW+lyykfTtRnjeEfmyrxelffS+yjr8
 e2Bd1SBScwotTQLEq32nFWzw1+q5VDl7y+wK706KnxuKCEMsWU3f9VpsO
 E1c6nODCBsbby+v+JC0yHJ6osxh3BoWG/9sBXPUU7byAY5GEDJZ4VIhUG
 CdjDGqP3udZSzTLvHv5FHXFHoETDKmCQcsUiRFftGTGjJCL9PJtM6Wsvj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="350330935"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="350330935"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 07:33:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="940706332"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="940706332"
Received: from ebaldwin-mobl.ger.corp.intel.com (HELO [10.213.239.242])
 ([10.213.239.242])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 07:33:35 -0700
Message-ID: <7d5d497d-b552-d8d9-e58c-20f4b0ded76c@linux.intel.com>
Date: Thu, 27 Apr 2023 15:33:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH v2 0/5] drm/i915: Allow user to set cache at
 BO creation
Content-Language: en-US
To: "Yang, Fei" <fei.yang@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230426062423.320519-1-fei.yang@intel.com>
 <c7cb1466-e698-ff3f-0572-4693c4b0025c@linux.intel.com>
 <BYAPR11MB2567F72C44D485E628A574069A659@BYAPR11MB2567.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <BYAPR11MB2567F72C44D485E628A574069A659@BYAPR11MB2567.namprd11.prod.outlook.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26/04/2023 16:41, Yang, Fei wrote:
>  > On 26/04/2023 07:24, fei.yang@intel.com wrote:
>  >> From: Fei Yang <fei.yang@intel.com>
>  >>
>  >> The first three patches in this series are taken from
>  >> https://patchwork.freedesktop.org/series/116868/
>  >> These patches are included here because the last patch
>  >> has dependency on the pat_index refactor.
>  >>
>  >> This series is focusing on uAPI changes,
>  >> 1. end support for set caching ioctl [PATCH 4/5]
>  >> 2. add set_pat extension for gem_create [PATCH 5/5]
>  >>
>  >> v2: drop one patch that was merged separately
>  >>      341ad0e8e254 drm/i915/mtl: Add PTE encode function
>  >
>  > Are the re-sends for stabilizing the series, or focusing on merge?
> 
> v2 was sent just to drop one of patches that has already been merged.
> 
>  > If the latter then opens are:
>  >
>  > 1) Link to Mesa MR reviewed and ready to merge.
>  >
>  > 2) IGT reviewed.
>  >
>  > 3) I raised an open that get/set_caching should not "lie" but return an
>  > error if set pat extension has been used. I don't see a good reason not
>  > to do that.
> 
> I don't think it's "lying" to the userspace. the comparison is only valid
> for objects created by KMD because only such object uses the pat_index
> from the cachelevel_to_pat table.

Lets double check my understanding is correct. Userspace sequence of 
operations:

1)
obj = gem_create()+set_pat(PAT_UC)

2a)
get_caching(obj)

What gets reported?

2b)
set_caching(obj, I915_CACHE_LLC)

What is the return code?

If answer to 2a is I915_CACHING_CACHED and to 2b) success, then please 
state a good reason why both shouldn't return an error.

> 
>  > + Joonas on this one.
>  >
>  > 4) Refactoring as done is not very pretty and I proposed an idea for a
>  > nicer approach. Feasible or not, open for discussion.
> 
> Still digesting your proposal. but not sure how would you define things
> like PAT_UC as that is platform dependent, not a constant.

"PAT_UC" in my outline was purely a driver specific value, similarly as 
I915_CACHE_... are. With the whole point that driver can ask if 
something is uncached, WT or whatever. Using the platform specific 
mapping table which converts platform specific obj->pat_index to driver 
representation of caching modes (PAT_UC etc).

Quite possible I missed some detail, but if I haven't then it could be 
a neat and lightweight solution.

Regards,

Tvrtko
