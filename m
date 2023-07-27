Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1067650B5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 12:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEE910E56C;
	Thu, 27 Jul 2023 10:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF31910E56B;
 Thu, 27 Jul 2023 10:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690452856; x=1721988856;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AGFJ00ueGcF2HEASeiAAWuV3H+IC5argqRlZ30Dcdv0=;
 b=G+1CYcvU15ytw4OAwQBbzWqnZT3Nn071LUARRYR4XJ9f1EAKvJLEYlJJ
 215ppS2FMEreHoc9yRwV1Nv+FX6axNMF9gZ4gtVaviW5g8iirBLPv7aIw
 N2GHnCCco9TOAFs4J8GlF7ZZarLBayd0aeVGPH6NfpAhpdTTfrqMObZuz
 XSVEyXRy2aKg8R2jtLKeDExDJHrN3cq4OyEcc1CuiBeB8LAgg9mENQF50
 vgGiccz+geFhvZU6LrFAwMPqnCZ5hZVuvjs7UndlBe1BnViHEVuNkxAh7
 tqpu2bfa9CCbK4lNShKnTjiYwAhaUpwxqrycTK+s4umc8qZPJ17mBL3LN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="399205316"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="399205316"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 03:13:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="973481220"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="973481220"
Received: from jlenehan-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.228.208])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 03:13:56 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/5] fdinfo memory stats
Date: Thu, 27 Jul 2023 11:13:47 +0100
Message-Id: <20230727101352.1899466-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

A short series to enable fdinfo memory stats for i915.

I added tracking of most classes of objects (user objects, page tables, context
state, ring buffers) which contribute to client's memory footprint and am
accouting their memory use along the similar lines as in Rob's msm code, just
that with i915 specific code we can show a memory region breakdown and so
support discrete and multi-tile GPUs properly. And also reflect that our objects
can have multiple allowed backing stores.

The existing helper Rob added is then used to dump the per memory region stats
to fdinfo.

The basic objects-per-client infrastructure can later be extended to cover all
objects and so avoid needing to walk the IDR under the client's file table lock,
which would further avoid distburbing the running clients by parallel fdinfo
readers.

Example fdinfo format:

# cat /proc/1383/fdinfo/8
pos:    0
flags:  02100002
mnt_id: 21
ino:    397
drm-driver:     i915
drm-client-id:  18
drm-pdev:       0000:00:02.0
drm-total-system:       125 MiB
drm-shared-system:      16 MiB
drm-active-system:      110 MiB
drm-resident-system:    125 MiB
drm-purgeable-system:   2 MiB
drm-total-stolen-system:        0
drm-shared-stolen-system:       0
drm-active-stolen-system:       0
drm-resident-stolen-system:     0
drm-purgeable-stolen-system:    0
drm-engine-render:      25662044495 ns
drm-engine-copy:        0 ns
drm-engine-video:       0 ns
drm-engine-video-enhance:       0 ns

Example gputop output:

DRM minor 0
 PID     SMEM  SMEMRSS   render     copy     video    NAME
1233     124M     124M |████████||        ||        ||        | neverball
1130      59M      59M |█▌      ||        ||        ||        | Xorg
1207      12M      12M |        ||        ||        ||        | xfwm4

Or with Wayland:

DRM minor 0
 PID      MEM      RSS    render        copy         video    video-enhance NAME
2093     191M     191M |▊          ||           ||           ||           | gnome-shell
DRM minor 128
 PID      MEM      RSS    render        copy         video    video-enhance NAME
2551      71M      71M |██▉        ||           ||           ||           | neverball
2553      50M      50M |           ||           ||           ||           | Xwayland

v2:
 * Now actually per client.

v3:
 * Track imported dma-buf objects.

v4:
 * Rely on DRM GEM handles for tracking user objects.
 * Fix internal object accounting (no placements).

v5:
 * Fixed brain fart of overwriting the loop cursor.
 * Fixed object destruction racing with fdinfo reads.
 * Take reference to GEM context while using it.

v6:
 * Rebase, cover letter update.

Tvrtko Ursulin (5):
  drm/i915: Add ability for tracking buffer objects per client
  drm/i915: Record which client owns a VM
  drm/i915: Track page table backing store usage
  drm/i915: Account ring buffer and context state storage
  drm/i915: Implement fdinfo memory stats printing

 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  11 +-
 .../gpu/drm/i915/gem/i915_gem_context_types.h |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  13 +-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  12 ++
 .../gpu/drm/i915/gem/selftests/mock_context.c |   4 +-
 drivers/gpu/drm/i915/gt/intel_context.c       |  14 ++
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   6 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   1 +
 drivers/gpu/drm/i915/i915_drm_client.c        | 131 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h        |  41 ++++++
 10 files changed, 228 insertions(+), 8 deletions(-)

-- 
2.39.2

