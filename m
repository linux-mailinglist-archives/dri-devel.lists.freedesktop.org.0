Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DFB6336CA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 09:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B2710E399;
	Tue, 22 Nov 2022 08:14:26 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA0210E399;
 Tue, 22 Nov 2022 08:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669104863; x=1700640863;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tLwrWSSEOPFJCx10qaxoCob7L/6w7jZnerpvx6l/blU=;
 b=g4yc6xUtiV46Qn4QHr4RZj0HnEJM+T6enFiS8qLWVK8w5wzaY/miCg+E
 ai6n4eHIgUsh627s/vH0l3TNGd2EV2wkyYggW6iwrJMjI6yKlhUZsv9/f
 yWFd1J23Xpr32g2+rhu0RaPxLXVtGMMWakodZpSCAXGcfAmkFyEyjY+wS
 bd3Mq3srmCR+6PBOOGW3GD2O7El27kKQnSGpV+UNV8Y467tAXaNxmgorP
 zu1FldlpcegXiW8G+IBxduRJN8xC6IhdGaeKX/1QVYsLkIg8rQlsQL/KQ
 x5zVP7Tw6fSsaHQWu3hfWMDtciboJmTRCo9HXBNahhDESadnf82rRUu18 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="314910583"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; d="scan'208";a="314910583"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 00:14:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="635465301"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; d="scan'208";a="635465301"
Received: from camorino-mobl.ger.corp.intel.com (HELO [10.213.209.233])
 ([10.213.209.233])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 00:14:16 -0800
Message-ID: <e6fa25aa-d936-5b52-226e-e7dee1cc7844@linux.intel.com>
Date: Tue, 22 Nov 2022 08:14:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH v2 0/5] Add module oriented dmesg output
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Intel-GFX@Lists.FreeDesktop.Org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20221118015858.2548106-1-John.C.Harrison@Intel.com>
 <87a64o1qn5.fsf@intel.com> <26c44ed9-4fd8-197a-85cd-038da7096c15@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <26c44ed9-4fd8-197a-85cd-038da7096c15@intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/11/2022 18:21, John Harrison wrote:
> On 11/18/2022 02:52, Jani Nikula wrote:
>> On Thu, 17 Nov 2022, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> When trying to analyse bug reports from CI, customers, etc. it can be
>>> difficult to work out exactly what is happening on which GT in a
>>> multi-GT system. So add GT oriented debug/error message wrappers. If
>>> used instead of the drm_ equivalents, you get the same output but with
>>> a GT# prefix on it.
>>>
>>> It was also requested to extend this further to submodules in order to
>>> factor out the repeated structure accessing constructs and common
>>> string prefixes. So, add versions for GuC, HuC and GuC CTB as well.
>>>
>>> This patch set updates all the gt/uc files to use the new helpers as a
>>> first step. The intention would be to convert all output messages that
>>> have access to a GT structure.
>>>
>>> v2: Go back to using lower case names, add more wrapper sets (combined
>>> review feedback). Also, wrap up probe injection and WARN entries.
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> For adding the wrappers in general, I'm going to disagree and
>> commit. I'll leave it up to Tvrtko and Joonas.
>>
>> Regarding the placement of the macros, I insist you add individual
>> header files for the wrappers and include them only where needed.
>>
>> We have a fairly serious problem with everything including everything in
>> i915 that I've been slowly trying to tackle. Touch one thing, rebuild
>> everything. About a third of our headers cause the rebuild of the entire
>> driver when modified. We need to reduce the surface of things that cause
>> rebuilds.
>>
>> For example, intel_gt.h is included by 97 files, intel_guc.h by 332
>> files, and intel_huc.h by 329 files (counting recursively).
>>
>> There's absolutely no reason any of the display code, for example, needs
>> to have these logging macros in their build. Long term, the headers
>> should be reorganized to reduce the interdependencies, and this is what
>> I've been doing in i915_drv.h and display/ in general. But the least we
>> can do is not make the problem worse.
> @Tvrtko/@Michal W, any other review comments or feedback? I'd rather not 
> spend time fixing up the header file issue and reposting only to have 
> someone point out another issue that could have been resolved at the 
> same time.

I read through the patches when you posted them and it looked nice and 
clean to me. I think I spotted one instance of a debug build only 
message getting upgraded to production build, and one loss of stack 
trace on a warning, but it wasn't a concern to me AFAIR.

Regards,

Tvrtko

> 
> John.
> 
>> BR,
>> Jani.
>>
>>>
>>> John Harrison (5):
>>>    drm/i915/gt: Start adding module oriented dmesg output
>>>    drm/i915/huc: Add HuC specific debug print wrappers
>>>    drm/i915/guc: Add GuC specific debug print wrappers
>>>    drm/i915/guc: Add GuC CT specific debug print wrappers
>>>    drm/i915/uc: Update the gt/uc code to use gt_err and friends
>>>
>>>   drivers/gpu/drm/i915/gt/intel_gt.c            |  96 ++++----
>>>   drivers/gpu/drm/i915/gt/intel_gt.h            |  35 +++
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  32 +--
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  35 +++
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |   8 +-
>>>   .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  48 ++--
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 222 +++++++++---------
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  19 +-
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  37 ++-
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     |   7 +-
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |  55 ++---
>>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  62 +++--
>>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  31 +--
>>>   drivers/gpu/drm/i915/gt/uc/intel_huc.h        |  23 ++
>>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         | 108 ++++-----
>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  98 ++++----
>>>   drivers/gpu/drm/i915/gt/uc/selftest_guc.c     |  34 +--
>>>   .../drm/i915/gt/uc/selftest_guc_hangcheck.c   |  22 +-
>>>   .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   |  10 +-
>>>   19 files changed, 507 insertions(+), 475 deletions(-)
> 
