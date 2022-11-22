Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E536341A2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 17:36:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB4110E41D;
	Tue, 22 Nov 2022 16:35:53 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E7F10E418;
 Tue, 22 Nov 2022 16:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669134950; x=1700670950;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Vqf2lbs4AecUhLO2yRoaDxcH4CKSLbkA+m46eIz9dUY=;
 b=oHPVi35g5H6r3Da+5T6asLOY8QqCiq+RJx5PCoTzFud3Z2DM0822N2gd
 4iQBrvnxcfdM0JirqBqR0HLB7Qtx8IDvR5UZPRlaRhObIzcL+8R5w0JcC
 +HwOvkcjMbSA4eGE1g0f2tD5lYlhrMf5cbKaW1dGvthecP4CHrutjJBKm
 cFxRDQz91DcSZEHqZB7+JFErvxW6Xehh0L0o5KUmaWWdSVUWzHsS++juh
 m58aDdA620ivYZ3Ujs2WJ3Qnk5uy0QI6LNmSTYDgZzm+ef7klFwWLXzmV
 eeLygs3tNh1mZAY6iEXJN+yoEAMOu/P0G7IvORcWGV77+W4Nlq32dZQMz Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="313889402"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="313889402"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 08:35:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="816157379"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="816157379"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga005.jf.intel.com with ESMTP; 22 Nov 2022 08:35:48 -0800
Received: from [10.249.128.71] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.128.71])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 2AMGZlaS028587; Tue, 22 Nov 2022 16:35:47 GMT
Message-ID: <3b7ef198-7aba-8948-6332-9a57d8ee0fb6@intel.com>
Date: Tue, 22 Nov 2022 17:35:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: Re: [Intel-gfx] [PATCH v2 0/5] Add module oriented dmesg output
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, John.C.Harrison@Intel.com,
 Intel-GFX@Lists.FreeDesktop.Org
References: <20221118015858.2548106-1-John.C.Harrison@Intel.com>
 <87a64o1qn5.fsf@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <87a64o1qn5.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18.11.2022 11:52, Jani Nikula wrote:
> On Thu, 17 Nov 2022, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> When trying to analyse bug reports from CI, customers, etc. it can be
>> difficult to work out exactly what is happening on which GT in a
>> multi-GT system. So add GT oriented debug/error message wrappers. If
>> used instead of the drm_ equivalents, you get the same output but with
>> a GT# prefix on it.
>>
>> It was also requested to extend this further to submodules in order to
>> factor out the repeated structure accessing constructs and common
>> string prefixes. So, add versions for GuC, HuC and GuC CTB as well.
>>
>> This patch set updates all the gt/uc files to use the new helpers as a
>> first step. The intention would be to convert all output messages that
>> have access to a GT structure.
>>
>> v2: Go back to using lower case names, add more wrapper sets (combined
>> review feedback). Also, wrap up probe injection and WARN entries.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> 
> For adding the wrappers in general, I'm going to disagree and
> commit. I'll leave it up to Tvrtko and Joonas.
> 
> Regarding the placement of the macros, I insist you add individual
> header files for the wrappers and include them only where needed.

do you mean:

	intel_gt_print.h
	intel_guc_print.h
	intel_huc_print.h

with just macros or also with all functions that work with drm_printer?

> 
> We have a fairly serious problem with everything including everything in
> i915 that I've been slowly trying to tackle. Touch one thing, rebuild
> everything. About a third of our headers cause the rebuild of the entire
> driver when modified. We need to reduce the surface of things that cause
> rebuilds.
> 
> For example, intel_gt.h is included by 97 files, intel_guc.h by 332
> files, and intel_huc.h by 329 files (counting recursively).
> 
> There's absolutely no reason any of the display code, for example, needs
> to have these logging macros in their build. Long term, the headers
> should be reorganized to reduce the interdependencies, and this is what
> I've been doing in i915_drv.h and display/ in general. But the least we
> can do is not make the problem worse.

to solve this we should really consider splitting out GuC and HuC
definitions to dedicated _types.h files and only include them in
i915_drv.h (and print macros are orthogonal for this problem)

Michal

> 
> BR,
> Jani.
> 
>>
>>
>> John Harrison (5):
>>   drm/i915/gt: Start adding module oriented dmesg output
>>   drm/i915/huc: Add HuC specific debug print wrappers
>>   drm/i915/guc: Add GuC specific debug print wrappers
>>   drm/i915/guc: Add GuC CT specific debug print wrappers
>>   drm/i915/uc: Update the gt/uc code to use gt_err and friends
>>
>>  drivers/gpu/drm/i915/gt/intel_gt.c            |  96 ++++----
>>  drivers/gpu/drm/i915/gt/intel_gt.h            |  35 +++
>>  drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  32 +--
>>  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  35 +++
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |   8 +-
>>  .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  48 ++--
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 222 +++++++++---------
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  19 +-
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  37 ++-
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     |   7 +-
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |  55 ++---
>>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  62 +++--
>>  drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  31 +--
>>  drivers/gpu/drm/i915/gt/uc/intel_huc.h        |  23 ++
>>  drivers/gpu/drm/i915/gt/uc/intel_uc.c         | 108 ++++-----
>>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  98 ++++----
>>  drivers/gpu/drm/i915/gt/uc/selftest_guc.c     |  34 +--
>>  .../drm/i915/gt/uc/selftest_guc_hangcheck.c   |  22 +-
>>  .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   |  10 +-
>>  19 files changed, 507 insertions(+), 475 deletions(-)
> 
