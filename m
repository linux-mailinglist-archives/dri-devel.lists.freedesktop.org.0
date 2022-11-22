Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B148634387
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 19:22:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362F110E434;
	Tue, 22 Nov 2022 18:21:59 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7EA110E19F;
 Tue, 22 Nov 2022 18:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669141312; x=1700677312;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=g+bxEE+yBg48pjoV3+DTGzyrgo9HmOayfng5ERUgGb8=;
 b=K1QhWw5JAdj0W9gw4pae4S0aUtQg1hEmZ+bsgo+R3caiVCvS8hm/aObf
 VkIXMITpRCJNccsZvyPVTQWZMGgI6aivDF49V7G3a7er9ud93OYKJpkf1
 K++OHXYrNk5YPLE27pGjlTeJeRSxMpxPhs+wkMfW69UYYg0/vOnYFxd07
 kSgPqbqtYG+nfbX1B9S1+YyZkVNVsO2YWOIpihI+k/iRTIY27az88Cbux
 Lx0v+qS7hDPTizJTTaLdK7WUvTIrlK0aJk7VG+p0I27kvfA3Ve6sPkwGk
 N3X5osk09tJPpzmjQ9hkPHJ17aqa6cI3ROveuV1yvEA03V8vPfvx60Yi3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="400173982"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="400173982"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 10:21:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="643813704"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="643813704"
Received: from sfflynn-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.18.151])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 10:21:50 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
Subject: Re: [Intel-gfx] [PATCH v2 0/5] Add module oriented dmesg output
In-Reply-To: <3b7ef198-7aba-8948-6332-9a57d8ee0fb6@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221118015858.2548106-1-John.C.Harrison@Intel.com>
 <87a64o1qn5.fsf@intel.com>
 <3b7ef198-7aba-8948-6332-9a57d8ee0fb6@intel.com>
Date: Tue, 22 Nov 2022 20:21:45 +0200
Message-ID: <87y1s2x32e.fsf@intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Nov 2022, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> On 18.11.2022 11:52, Jani Nikula wrote:
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
>> 
>> For adding the wrappers in general, I'm going to disagree and
>> commit. I'll leave it up to Tvrtko and Joonas.
>> 
>> Regarding the placement of the macros, I insist you add individual
>> header files for the wrappers and include them only where needed.
>
> do you mean:
>
> 	intel_gt_print.h
> 	intel_guc_print.h
> 	intel_huc_print.h
>
> with just macros or also with all functions that work with drm_printer?

At least for the macros being added now. If adding others does not
require you to pull in a bunch of additional header dependencies, you
can add more. And that can be separate patches.

>
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
>
> to solve this we should really consider splitting out GuC and HuC
> definitions to dedicated _types.h files and only include them in
> i915_drv.h (and print macros are orthogonal for this problem)

It's an orthogonal problem, but IMO with the current headers there's no
reason to make the problem worse by adding somewhat independent new
stuff to the headers.

---

I've looked at untangling this a bunch of times, but I've always felt
that it's really not my area of expertise, and it would inevitably
conflict with someone else's work in progress and someone else's idea of
how the headers should be refactored.

There are chains like this:

i915_drv.h:47:#include "gt/intel_gt_types.h"
gt/intel_gt_types.h:19:#include "uc/intel_uc.h"
gt/uc/intel_uc.h:9:#include "intel_guc.h"
gt/uc/intel_guc.h:15:#include "intel_guc_fwif.h"
gt/uc/intel_guc_fwif.h:14:#include "abi/guc_actions_abi.h"
gt/uc/intel_guc_fwif.h:15:#include "abi/guc_actions_slpc_abi.h"
gt/uc/intel_guc_fwif.h:16:#include "abi/guc_errors_abi.h"
gt/uc/intel_guc_fwif.h:17:#include "abi/guc_communication_mmio_abi.h"
gt/uc/intel_guc_fwif.h:18:#include "abi/guc_communication_ctb_abi.h"
gt/uc/intel_guc_fwif.h:19:#include "abi/guc_klvs_abi.h"
gt/uc/intel_guc_fwif.h:20:#include "abi/guc_messages_abi.h"

They need to be broken up at some point. There are a bunch of headers
where only minimal amount of info is actually needed in other headers,
and the rest is used in a limited number of .c files only.

It's a lot of tedious work to refactor and nobody's going to notice the
impact directly, they'll just be less grumpy about the build being slow
and the organization of the headers being messy. And if they don't build
the driver a lot (like me) or don't refactor the driver a lot (like me)
maybe they'll never notice.


BR,
Jani.


>
> Michal
>
>> 
>> BR,
>> Jani.
>> 
>>>
>>>
>>> John Harrison (5):
>>>   drm/i915/gt: Start adding module oriented dmesg output
>>>   drm/i915/huc: Add HuC specific debug print wrappers
>>>   drm/i915/guc: Add GuC specific debug print wrappers
>>>   drm/i915/guc: Add GuC CT specific debug print wrappers
>>>   drm/i915/uc: Update the gt/uc code to use gt_err and friends
>>>
>>>  drivers/gpu/drm/i915/gt/intel_gt.c            |  96 ++++----
>>>  drivers/gpu/drm/i915/gt/intel_gt.h            |  35 +++
>>>  drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  32 +--
>>>  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  35 +++
>>>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |   8 +-
>>>  .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  48 ++--
>>>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 222 +++++++++---------
>>>  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  19 +-
>>>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  37 ++-
>>>  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     |   7 +-
>>>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |  55 ++---
>>>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  62 +++--
>>>  drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  31 +--
>>>  drivers/gpu/drm/i915/gt/uc/intel_huc.h        |  23 ++
>>>  drivers/gpu/drm/i915/gt/uc/intel_uc.c         | 108 ++++-----
>>>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  98 ++++----
>>>  drivers/gpu/drm/i915/gt/uc/selftest_guc.c     |  34 +--
>>>  .../drm/i915/gt/uc/selftest_guc_hangcheck.c   |  22 +-
>>>  .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   |  10 +-
>>>  19 files changed, 507 insertions(+), 475 deletions(-)
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
