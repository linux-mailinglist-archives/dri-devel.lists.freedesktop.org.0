Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFEC39CD44
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jun 2021 06:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B395D6E503;
	Sun,  6 Jun 2021 04:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00B66E0D2;
 Sun,  6 Jun 2021 04:51:40 +0000 (UTC)
IronPort-SDR: yNlHJu8ZQrHo6srAKMQtqu/RofR6fQqp39mlAjrW3Rx6X/yfwYI/IK5QAGW7uJeldNxNTJzQIE
 f445bPZg+eaA==
X-IronPort-AV: E=McAfee;i="6200,9189,10006"; a="204453322"
X-IronPort-AV: E=Sophos;i="5.83,252,1616482800"; d="scan'208";a="204453322"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2021 21:51:38 -0700
IronPort-SDR: tYBKRWdJQS4RsCP8ir8ETiHd5U4poZLD/WbjiqZU9Uo8ziG+D8S3DZzE2ARPe9kv57Xy3YsBDs
 ZhKVcSVhgdEw==
X-IronPort-AV: E=Sophos;i="5.83,252,1616482800"; d="scan'208";a="475872792"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2021 21:51:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 0/2] drm/i915: Finish conversion to GRAPHICS_VER
Date: Sat,  5 Jun 2021 21:50:48 -0700
Message-Id: <20210606045050.103862-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v3 is a resend from v2 (https://patchwork.freedesktop.org/series/90693/)
now with dri-devel Cc'ed. Notice that this patch series can be applied
splitting it up through the trees, it's not necessary to apply them
together. The intention is to apply first 3 patches on drm-intel-gt-next
and the remaining on drm-intel-next.  I'm intentionally _not_ removing
the INTEL_GEN/IS_GEN/IS_GEN_RANGE macros now. A few days/weeks after
this is applied and when drm-intel-gt-next and drm-intel-next is back in
sync, we can remove any leftovers that went in and remove the macros via
a topic branch.

Latest version of previous series "drm/i915: Extend GEN renames to the
rest of the driver" (https://patchwork.freedesktop.org/series/88825/)
dropped one patch converting all the instances of IS_GEN() and
INTEL_GEN() to GRAPHICS_VER() due to the patches changing the
meaning of the macros IS_GRAPHICS_VER/GRAPHICS_VER and removal of
IS_GRAPHICS_RANGE().

I couldn't find a way to convince coccinelle to fix all places, so I
just did it manually in separate commits the places that were not
updated.

Finish the conversion splitting the changes so it can go to the
different branches (drm-intel-gt-next and drm-intel-next). I also split
the gvt changes, but I think it would be easier to take this directly on
drm-intel-next.

v2: update commit messages with the proper semantic patch (Matt Roper)
and regenerate the patches to also convert changes that got added in
between.

v3: resend with dri-devel Cc'ed since we are touching gt/gem/core. Also,
let's get an ack on merge strategy

v4: rebase and remove patches already applied

v5: rebase, remove patches already applied and remove changes that conflict
with drm-intel-gt-next - they will be removed converted later, together with
the removal of the old macros.

Lucas De Marchi (2):
  drm/i915: replace IS_GEN and friends with GRAPHICS_VER
  drm/i915: Add remaining conversions to GRAPHICS_VER

 drivers/gpu/drm/i915/i915_cmd_parser.c        | 10 +--
 drivers/gpu/drm/i915/i915_debugfs.c           | 30 +++----
 drivers/gpu/drm/i915/i915_drv.c               | 20 ++---
 drivers/gpu/drm/i915/i915_drv.h               | 37 +++++----
 drivers/gpu/drm/i915/i915_gem.c               |  4 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         | 80 +++++++++----------
 drivers/gpu/drm/i915/i915_irq.c               | 34 ++++----
 drivers/gpu/drm/i915/i915_perf.c              | 44 +++++-----
 drivers/gpu/drm/i915/i915_pmu.c               |  8 +-
 drivers/gpu/drm/i915/i915_reg.h               | 26 +++---
 drivers/gpu/drm/i915/i915_request.c           |  4 +-
 drivers/gpu/drm/i915/i915_suspend.c           | 16 ++--
 drivers/gpu/drm/i915/i915_sysfs.c             |  2 +-
 drivers/gpu/drm/i915/i915_vgpu.c              |  2 +-
 drivers/gpu/drm/i915/intel_device_info.c      | 22 ++---
 drivers/gpu/drm/i915/intel_dram.c             | 14 ++--
 drivers/gpu/drm/i915/intel_pch.c              | 10 +--
 drivers/gpu/drm/i915/intel_pm.c               | 14 ++--
 drivers/gpu/drm/i915/intel_sideband.c         |  2 +-
 drivers/gpu/drm/i915/intel_uncore.c           | 24 +++---
 drivers/gpu/drm/i915/intel_wopcm.c            | 10 +--
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  4 +-
 drivers/gpu/drm/i915/selftests/i915_perf.c    |  6 +-
 drivers/gpu/drm/i915/selftests/i915_request.c |  8 +-
 drivers/gpu/drm/i915/selftests/igt_spinner.c  | 12 +--
 drivers/gpu/drm/i915/selftests/intel_uncore.c |  2 +-
 26 files changed, 222 insertions(+), 223 deletions(-)

-- 
2.31.1

