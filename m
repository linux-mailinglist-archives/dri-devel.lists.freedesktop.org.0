Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE27082AC78
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 11:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F094110E8CC;
	Thu, 11 Jan 2024 10:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C0710E898;
 Thu, 11 Jan 2024 10:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704970306; x=1736506306;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=nSPJeiZs/WYO+pU53D2d3Ta4qiOROG40hDgys0nUJCU=;
 b=O8ED1pwHJrIbBZ2H2gqTpVyKwrZW8lmXhjAqPP3HTelefN6YKJ7k/fzB
 +GfvHNR1Lu1wSLpNWEmmJDkuYgIQArkG/sz+1dZKjC8cSpEmtLYrtEHAQ
 IQgopVJ+lqiGUji6hWmmddfP5s0PKs3dCs5Ec3gZ4OavzfI17ukjaI53I
 01j88EtaWTRf6rqfuJ2cSh/5Q9LnCchkmZ7oQR+GQqVirI290VrpOAoMw
 0Wj0XxOoRdEcYYSfW+R+3Rr9jGiLQs1UCo3HIq/3lrf794+swckz1p9Lm
 GYtz4BPQj92JDY+r52COvYTV/h6NYhZETVOSEcMZ3NmMqqFNiU3WatRei g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="12297203"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="12297203"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 02:51:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="816680326"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="816680326"
Received: from akochman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.246.32.38])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 02:51:40 -0800
Date: Thu, 11 Jan 2024 12:51:37 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <ZZ_IOcLiDG9LJafO@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Sima,

Here goes drm-intel-next-fixes towards 6.8 merge window now that
drm-intel-gt-next is also merged.

Most importantly fixes for linux-next added build warnings and then a
couple display fixes.

CI results for drm-next seem to have regressed with regards to the shard
runs somewhere in the past, so bit limited to assess for regressions but
BAT looks reasonable.

Best Regards, Joonas

***

drm-intel-next-fixes-2024-01-11:

- Fixes for kernel-doc warnings enforced in linux-next
- Another build warning fix for string formatting of intel_wakeref_t
- Display fixes for DP DSC BPC and C20 PLL state verification

The following changes since commit b76c01f1d950425924ee1c1377760de3c024ef78:

  Merge tag 'drm-intel-gt-next-2023-12-15' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2024-01-10 11:36:47 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2024-01-11

for you to fetch changes up to d505a16e00c35919fd9fe5735894645e0f70a415:

  drm/i915/perf: reconcile Excess struct member kernel-doc warnings (2024-01-10 11:56:58 +0200)

----------------------------------------------------------------
- Fixes for kernel-doc warnings enforced in linux-next
- Another build warning fix for string formatting of intel_wakeref_t
- Display fixes for DP DSC BPC and C20 PLL state verification

----------------------------------------------------------------
Ankit Nautiyal (1):
      drm/i915/dp: Fix the max DSC bpc supported by source

Imre Deak (1):
      drm/i915/dp: Fix the PSR debugfs entries wrt. MST connectors

Jani Nikula (1):
      drm/i915: don't make assumptions about intel_wakeref_t type

Mika Kahola (1):
      drm/i915/display: Fix C20 pll selection for state verification

Randy Dunlap (4):
      drm/i915/gem: reconcile Excess struct member kernel-doc warnings
      drm/i915/gt: reconcile Excess struct member kernel-doc warnings
      drm/i915/guc: reconcile Excess struct member kernel-doc warnings
      drm/i915/perf: reconcile Excess struct member kernel-doc warnings

 drivers/gpu/drm/i915/display/intel_cx0_phy.c       | 25 +++++---
 drivers/gpu/drm/i915/display/intel_display_power.c |  4 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           | 10 +--
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |  4 +-
 drivers/gpu/drm/i915/gt/intel_gsc.h                |  7 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             | 75 ++++++++++++----------
 drivers/gpu/drm/i915/i915_perf_types.h             |  9 ++-
 8 files changed, 78 insertions(+), 58 deletions(-)
