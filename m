Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8928A7AB2F9
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 15:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535AF10E664;
	Fri, 22 Sep 2023 13:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99A110E192;
 Fri, 22 Sep 2023 13:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695390425; x=1726926425;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G47JHRJss6dSpMrMkut5fqi9gVM7nfssHFaWHIPEHdY=;
 b=Xe44oPJLFKzdy2lakP7m+4KZI4ak5ijaKwI2X1/gJFIJUh6EA4zKRnjA
 dzZYyMsoWebJBOhTqatFhnhdQCu7xfpxKv0XMAlgA2Wi41ooJBjmb6LUU
 gpYnRlm6t78lbGrYBQlYrhBs5qj2kJG9ONfG2xrFzsKaD5BUI59mC+8Sf
 Xj7Xg4yKeYW/psAHFhPJ4/axLBGfX7FNeh0nQIpYHMgcDRrvSSHSCxHrE
 Fpdrdk3/UvGZAJgMlVhnV5Inc5zd82Sxt43hF4buBX9n8tuG/2UkJC25r
 u2I0wHm95Rh+gftTD7jzg+8nh6R+5hFjsFZRbaOL5vLoGeDgMHn+m+ae5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="467126577"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="467126577"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 06:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="1078376213"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="1078376213"
Received: from placki-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.200.149])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 06:47:03 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/6] fdinfo memory stats
Date: Fri, 22 Sep 2023 14:46:54 +0100
Message-Id: <20230922134700.235039-1-tvrtko.ursulin@linux.intel.com>
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

Test-with: 20230922134437.234888-1-tvrtko.ursulin@linux.intel.com

Tvrtko Ursulin (6):
  drm/i915: Add ability for tracking buffer objects per client
  drm/i915: Record which client owns a VM
  drm/i915: Track page table backing store usage
  drm/i915: Account ring buffer and context state storage
  drm/i915: Add stable memory region names
  drm/i915: Implement fdinfo memory stats printing

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
 12 files changed, 227 insertions(+), 8 deletions(-)

-- 
2.39.2

