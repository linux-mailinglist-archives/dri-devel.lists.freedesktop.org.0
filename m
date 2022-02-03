Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C9A4A8190
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:37:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8586610EC47;
	Thu,  3 Feb 2022 09:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A26810EC44;
 Thu,  3 Feb 2022 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643881037; x=1675417037;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=o+xKxW03elSt4TVYnX8s8SGfjcBFieYuE59P+xsIkTU=;
 b=eaSVJ+yBUlAYrOsmHW8nJWwt7HrW8om2jjvVSua5ZD8TDYpbSmPHP4nT
 iofjqnVRnRJI0DBzpzQCQRZJ85U2nLgARBcaTzQC3A/xRLt/WrmHuis5F
 8Qfqc7bP3UfGwUtmDKr1Ogl6I7hr9/6hMX1r0fYsh3F35FQMyZQOmgIoc
 LqP4D0gXcXf27ZksLv19IAY4N1vW1/jh7zetNOW3HDKfn4WVuUjgXUTmk
 HKCkJPdHVn9NcCIyzxLsO+vwcy4pXlQzmMl2PkLzT3CQXV/uDU/puxLon
 y/knAWQx+J7n8m2cJkmJwU/1ma+gW3Rp0JvEVbtBbiHe1w5XAwB9LLre5 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="311413321"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="311413321"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:37:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="523856552"
Received: from xiejiach-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.249.254.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:37:13 -0800
Date: Thu, 3 Feb 2022 11:37:10 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <YfuiG8SKMKP5V/Dm@jlahtine-mobl.ger.corp.intel.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Tvrtko is out today, so sending the -rc3 -fixes PR on behalf of him (picked
and CI tested by Tvtko).

Major items are fix for GitLab #4698 (Dell DA310 Type-C dock issue) and
engine busyness inconsitent value/timeout fixes when running with GuC.

Then two fixes for error paths and a smatch detected divide by zero
fix.

Regards, Joonas

***

drm-intel-fixes-2022-02-03:

Fix GitLab issue #4698: DP monitor through Type-C dock(Dell DA310) doesn't work.
Fixes for inconsistent engine busyness value and read timeout with GuC.
Fix to use ALLOW_FAIL for error capture buffer allocation. Don't use
interruptible lock on error path. Smatch fix to reject zero sized overlays.

The following changes since commit 26291c54e111ff6ba87a164d85d4a4e134b7315c:

  Linux 5.17-rc2 (2022-01-30 15:37:07 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-02-03

for you to fetch changes up to 7d73c602154df56802a9e75ac212505fc1e9a2b6:

  drm/i915/pmu: Fix KMD and GuC race on accessing busyness (2022-02-01 08:59:25 +0000)

----------------------------------------------------------------
Fix GitLab issue #4698: DP monitor through Type-C dock(Dell DA310) doesn't work.
Fixes for inconsistent engine busyness value and read timeout with GuC.
Fix to use ALLOW_FAIL for error capture buffer allocation. Don't use
interruptible lock on error path. Smatch fix to reject zero sized overlays.

----------------------------------------------------------------
Dan Carpenter (1):
      drm/i915/overlay: Prevent divide by zero bugs in scaling

Imre Deak (1):
      drm/i915/adlp: Fix TypeC PHY-ready status readout

Matthew Brost (2):
      drm/i915: Allocate intel_engine_coredump_alloc with ALLOW_FAIL
      drm/i915: Lock timeline mutex directly in error path of eb_pin_timeline

Umesh Nerlige Ramappa (2):
      drm/i915/pmu: Use PM timestamp instead of RING TIMESTAMP for reference
      drm/i915/pmu: Fix KMD and GuC race on accessing busyness

 drivers/gpu/drm/i915/display/intel_overlay.c      |   3 +
 drivers/gpu/drm/i915/display/intel_tc.c           |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c    |   9 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h            |   5 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 114 ++++++++++++++++++----
 drivers/gpu/drm/i915/i915_gpu_error.c             |   2 +-
 drivers/gpu/drm/i915/i915_reg.h                   |   3 +-
 7 files changed, 117 insertions(+), 22 deletions(-)
