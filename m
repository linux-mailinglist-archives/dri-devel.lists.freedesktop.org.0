Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD1E7B0599
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 15:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FA310E523;
	Wed, 27 Sep 2023 13:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0619810E521;
 Wed, 27 Sep 2023 13:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695821935; x=1727357935;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4r77wZ4o0SVEKmZg/D2bsd5cR7zsBwV2DSgPNQA3uL4=;
 b=W5nqK/M7IlMzPKCeDcXPy+8O6W392/HxDUKnvm+WExoKAJjWCWcAKbgG
 1LmwbPXXKvlDwXtY9+0QlxBGkLWWdqgBODddRxs7jqJZHyWlaG9JJD97J
 obNQoi7M47kzwKlY7kESs7//YjjaBRXUcSaPAxk5+v45neKZ7f5eSz0lr
 ahOCNDXKT2PcTwe/bqIo6JYIpOEcvShUbUDD6ArXgIVMaCjmIwKUNqX+T
 XgWIx7VXPXsgW0nb2qCBBAGEZmDYYE5Q2/+6zjUdatvQbOA5mtLBStxS/
 zz5kBGJnyb8gLpb8rde1EtFBn6AW6qJ00Rr6c1Zxb5qkdQfZMmrK5Qq1Z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="412738597"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="412738597"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 06:38:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="752597166"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="752597166"
Received: from mscanex-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.204.17])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 06:38:47 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 0/7] fdinfo memory stats
Date: Wed, 27 Sep 2023 14:38:36 +0100
Message-Id: <20230927133843.247957-1-tvrtko.ursulin@linux.intel.com>
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

Example intel_gpu_top output, aggregated mode:

intel-gpu-top: Intel Dg1 (Gen12) @ /dev/dri/card1 -   21/ 577 MHz;  71% RC6
          8 irqs/s

         ENGINES     BUSY                                   MI_SEMA MI_WAIT
       Render/3D    2.80% |▉                              |      0%      0%
         Blitter    0.01% |▏                              |      0%      0%
           Video    0.00% |                               |      0%      0%
    VideoEnhance    0.00% |                               |      0%      0%

  PID      MEM      RSS Render/3D  Blitter    Video    NAME
50783     109M     107M |▎       ||        ||        ||        | neverball

Region breakdown mode (needs more width for best experience):

intel-gpu-top: Intel Dg1 (Gen12) @ /dev/dri/card1 -   18/ 555 MHz;  65% RC6
          8 irqs/s

         ENGINES     BUSY                                   MI_SEMA MI_WAIT
       Render/3D    2.52% |▉                              |      0%      0%
         Blitter    0.00% |                               |      0%      0%
           Video    0.00% |                               |      0%      0%
    VideoEnhance    0.00% |                               |      0%      0%

  PID      RAM      RSS     VRAM     VRSS Video NAME
50783      34M      32M      75M      75M |▏  ||   ||   ||   | neverball

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

v7:
 * New patch in series for making region names consistent and stable.

v8:
 * New patch in series - stop losing accuracy in drm_file.c::print_size().

Test-with: 20230922134437.234888-1-tvrtko.ursulin@linux.intel.com

Tvrtko Ursulin (7):
  drm: Do not round to megabytes for greater than 1MiB sizes in fdinfo
    stats
  drm/i915: Add ability for tracking buffer objects per client
  drm/i915: Record which client owns a VM
  drm/i915: Track page table backing store usage
  drm/i915: Account ring buffer and context state storage
  drm/i915: Add stable memory region names
  drm/i915: Implement fdinfo memory stats printing

 drivers/gpu/drm/drm_file.c                    |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  11 +-
 .../gpu/drm/i915/gem/i915_gem_context_types.h |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  13 ++-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  12 ++
 .../gpu/drm/i915/gem/selftests/mock_context.c |   4 +-
 drivers/gpu/drm/i915/gt/intel_context.c       |  14 +++
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   6 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   1 +
 drivers/gpu/drm/i915/i915_drm_client.c        | 110 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h        |  41 +++++++
 drivers/gpu/drm/i915/intel_memory_region.c    |  19 +++
 drivers/gpu/drm/i915/intel_memory_region.h    |   1 +
 13 files changed, 228 insertions(+), 9 deletions(-)

-- 
2.39.2

