Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EF226D6FA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 10:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C736EB31;
	Thu, 17 Sep 2020 08:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1628E6EB31;
 Thu, 17 Sep 2020 08:45:51 +0000 (UTC)
IronPort-SDR: VY6rEE6VZb40P40MQbuAkzHq/418XnpkfzJipTn+QDDm1/U6lNY1OdKX8uHY4Lb/P0dowKJqgZ
 a7n6FKyXroig==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="223834626"
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="223834626"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 01:45:50 -0700
IronPort-SDR: px1lXji6m5Di0muLHiB0n+4zX4XfWpCaKC9ckGHNaSgelJ0MleI4nn9dnjXFyKIyE/g8+CCyCO
 HGjqxayCqqlA==
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="483657528"
Received: from wgitix-mobl.ger.corp.intel.com (HELO localhost) ([10.251.83.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 01:45:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 17 Sep 2020 11:45:52 +0300
Message-ID: <87y2l8vlj3.fsf@intel.com>
MIME-Version: 1.0
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

Due to the separate feature pull we haven't picked up gem fixes until
now. Here's the first batch; there's potentially a few more to come [1].

I also just received a gvt fixes pull that didn't make it this week, so
there are still more fixes coming.

BR,
Jani.


[1] http://lore.kernel.org/r/87k0wuw1g3.fsf@intel.com



drm-intel-fixes-2020-09-17:
drm/i915 fixes for v5.9-rc6:
- Avoid exposing a partially constructed context
- Use RCU instead of mutex for context termination list iteration
- Avoid data race reported by KCSAN
- Filter wake_flags passed to default_wake_function



The following changes since commit 856deb866d16e29bd65952e0289066f6078af773:

  Linux 5.9-rc5 (2020-09-13 16:06:00 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-09-17

for you to fetch changes up to 20612303a0b45de748d31331407e84300c38e497:

  drm/i915: Filter wake_flags passed to default_wake_function (2020-09-16 11:10:05 +0300)

----------------------------------------------------------------
drm/i915 fixes for v5.9-rc6:
- Avoid exposing a partially constructed context
- Use RCU instead of mutex for context termination list iteration
- Avoid data race reported by KCSAN
- Filter wake_flags passed to default_wake_function

----------------------------------------------------------------
Chris Wilson (4):
      drm/i915/gem: Delay tracking the GEM context until it is registered
      drm/i915/gem: Reduce context termination list iteration guard to RCU
      drm/i915: Be wary of data races when reading the active execlists
      drm/i915: Filter wake_flags passed to default_wake_function

 drivers/gpu/drm/i915/gem/i915_gem_context.c | 48 ++++++++++++++++++-----------
 drivers/gpu/drm/i915/gt/intel_lrc.c         | 15 ++++++---
 drivers/gpu/drm/i915/i915_request.c         | 25 +++++++++++++--
 drivers/gpu/drm/i915/i915_sw_fence.c        | 10 ++++--
 4 files changed, 71 insertions(+), 27 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
