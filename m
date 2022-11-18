Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF47962F2FE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 11:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611C210E236;
	Fri, 18 Nov 2022 10:52:23 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7456310E233;
 Fri, 18 Nov 2022 10:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668768739; x=1700304739;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=22Bqdj6jlM3i95750viiyFWdj3b3FbMST5MVbFbzVMg=;
 b=OepZD/bNQiwbgkYO0IzxwMdfShHy8YtrOAAGnEo0vDuLwY0GJ3HbZb1t
 8dqYxjlQgvqbcC8qHg6cIkaP4tUnineB+xTxcrykSJdDU4CD0FmUCyxzY
 kwEbrrv6p+s5eZXtsvLhSTAeQ6Obu1h2zecNdCeRBmFQsNMSPumN2VReC
 TuPA3F4haCOqd43fexazl5E0gbuV3lSqbfeqnkaSgGV7uCdQNmtHzyajR
 WYF148gHnLPkNkH21tNLEcNsJUfrZkP2+07o/ou/DB4jhbSs3OviwFewC
 mI6XJFJlHs5vm3VD7f3IEBDBxdOdjp20VGQNtXgNcuj0obGKknIJre4vo Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="300647174"
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; d="scan'208";a="300647174"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 02:52:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="969239452"
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; d="scan'208";a="969239452"
Received: from mmilose-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.101])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 02:52:16 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
Subject: Re: [Intel-gfx] [PATCH v2 0/5] Add module oriented dmesg output
In-Reply-To: <20221118015858.2548106-1-John.C.Harrison@Intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221118015858.2548106-1-John.C.Harrison@Intel.com>
Date: Fri, 18 Nov 2022 12:52:14 +0200
Message-ID: <87a64o1qn5.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Nov 2022, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> When trying to analyse bug reports from CI, customers, etc. it can be
> difficult to work out exactly what is happening on which GT in a
> multi-GT system. So add GT oriented debug/error message wrappers. If
> used instead of the drm_ equivalents, you get the same output but with
> a GT# prefix on it.
>
> It was also requested to extend this further to submodules in order to
> factor out the repeated structure accessing constructs and common
> string prefixes. So, add versions for GuC, HuC and GuC CTB as well.
>
> This patch set updates all the gt/uc files to use the new helpers as a
> first step. The intention would be to convert all output messages that
> have access to a GT structure.
>
> v2: Go back to using lower case names, add more wrapper sets (combined
> review feedback). Also, wrap up probe injection and WARN entries.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

For adding the wrappers in general, I'm going to disagree and
commit. I'll leave it up to Tvrtko and Joonas.

Regarding the placement of the macros, I insist you add individual
header files for the wrappers and include them only where needed.

We have a fairly serious problem with everything including everything in
i915 that I've been slowly trying to tackle. Touch one thing, rebuild
everything. About a third of our headers cause the rebuild of the entire
driver when modified. We need to reduce the surface of things that cause
rebuilds.

For example, intel_gt.h is included by 97 files, intel_guc.h by 332
files, and intel_huc.h by 329 files (counting recursively).

There's absolutely no reason any of the display code, for example, needs
to have these logging macros in their build. Long term, the headers
should be reorganized to reduce the interdependencies, and this is what
I've been doing in i915_drv.h and display/ in general. But the least we
can do is not make the problem worse.

BR,
Jani.

>
>
> John Harrison (5):
>   drm/i915/gt: Start adding module oriented dmesg output
>   drm/i915/huc: Add HuC specific debug print wrappers
>   drm/i915/guc: Add GuC specific debug print wrappers
>   drm/i915/guc: Add GuC CT specific debug print wrappers
>   drm/i915/uc: Update the gt/uc code to use gt_err and friends
>
>  drivers/gpu/drm/i915/gt/intel_gt.c            |  96 ++++----
>  drivers/gpu/drm/i915/gt/intel_gt.h            |  35 +++
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  32 +--
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  35 +++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |   8 +-
>  .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  48 ++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 222 +++++++++---------
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  19 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  37 ++-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     |   7 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |  55 ++---
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  62 +++--
>  drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  31 +--
>  drivers/gpu/drm/i915/gt/uc/intel_huc.h        |  23 ++
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c         | 108 ++++-----
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  98 ++++----
>  drivers/gpu/drm/i915/gt/uc/selftest_guc.c     |  34 +--
>  .../drm/i915/gt/uc/selftest_guc_hangcheck.c   |  22 +-
>  .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   |  10 +-
>  19 files changed, 507 insertions(+), 475 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
